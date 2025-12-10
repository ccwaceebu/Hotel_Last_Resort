USE LastResortHotel;

INSERT IGNORE INTO Building (buildingID, buildingName, location) VALUES
(1, 'Golden Tower', 'Mountainview'),
(2, 'Cliff Hub',  'Oceanview');

INSERT IGNORE INTO Wing (wingID, buildingID, wingName, proximityToPool, proximityToParking, handicapAccess) VALUES
(1, 1, 'Umi Wing',      1, 0, 1),
(2, 1, 'Minami Wing',   0, 1, 1),
(3, 2, 'Chasing Wing',  1, 1, 1),
(4, 2, 'Miku Wing',     0, 1, 1);

INSERT IGNORE INTO Floor (floorID, wingID, floorNumber, canSmoke) VALUES
(1, 1, 1, 0),
(2, 1, 2, 0),
(3, 2, 1, 1),
(4, 2, 2, 0),
(5, 3, 1, 0),
(6, 4, 1, 0),
(7, 3, 2, 0);

INSERT IGNORE INTO RoomType (roomTypeID, typeName, description) VALUES
(1, 'Cozy Queen',         'Simple room for 1-2 guests'),
(2, 'Grand King',         'Larger room with premium amenities'),
(3, 'Brightening Suite',  'Multi-room suite for longer stays'),
(4, 'Meeting Room',       'Rooms used for meetings or events');

SET @room_n := 0;

INSERT IGNORE INTO Room
(roomID, floorID, roomNumber, roomTypeID, baseRate, status, hasToilet, maxCapacity, canSmoke)
SELECT
    t.n AS roomID,
    1 + ((t.n - 1) DIV 10) AS floorID,
    CONCAT(
        1 + ((t.n - 1) DIV 10),
        LPAD(((t.n - 1) MOD 10) + 1, 2, '0')
    ) AS roomNumber,
    CASE
        WHEN (t.n MOD 10) IN (1,2,3,4,5) THEN 1
        WHEN (t.n MOD 10) IN (6,7,8)     THEN 2
        ELSE 3
    END AS roomTypeID,
    CASE
        WHEN (t.n MOD 10) IN (1,2,3,4,5) THEN 175.00
        WHEN (t.n MOD 10) IN (6,7,8)     THEN 235.00
        ELSE 410.00
    END AS baseRate,
    'available',
    1,
    CASE
        WHEN (t.n MOD 10) IN (1,2,3,4,5) THEN 2
        WHEN (t.n MOD 10) IN (6,7,8)     THEN 2
        ELSE 4
    END AS maxCapacity,
    0
FROM (
    SELECT (@room_n := @room_n + 1) AS n
    FROM information_schema.columns c1
    CROSS JOIN information_schema.columns c2
    LIMIT 60
) t;

INSERT IGNORE INTO Room
(roomID, floorID, roomNumber, roomTypeID, baseRate, status, hasToilet, maxCapacity, canSmoke)
VALUES
(61, 7, 'E201', 4, 650.00,  'available', 1, 60,  0),
(62, 7, 'E202', 4, 820.00,  'available', 1, 90,  0),
(63, 7, 'E203', 4, 520.00,  'available', 1, 40,  0),
(64, 7, 'E204', 4, 980.00,  'available', 1, 120, 0);

INSERT IGNORE INTO BedType (bedTypeID, bedSize, bedLength) VALUES
(1, 'Queen', '80 in'),
(2, 'King',  '80 in'),
(3, 'Twin',  '75 in');

INSERT IGNORE INTO RoomBed (roomID, bedTypeID, bedCount)
SELECT roomID,
       CASE roomTypeID
           WHEN 1 THEN 1
           WHEN 2 THEN 2
           WHEN 3 THEN 2
       END AS bedTypeID,
       CASE roomTypeID
           WHEN 1 THEN 1
           WHEN 2 THEN 1
           WHEN 3 THEN 1
       END AS bedCount
FROM Room
WHERE roomID <= 60;

INSERT IGNORE INTO RoomBed (roomID, bedTypeID, bedCount)
SELECT roomID, 3, 2
FROM Room
WHERE roomTypeID = 3 AND roomID <= 60 AND roomID % 4 = 0;

INSERT IGNORE INTO RoomFeature (roomFeatureID, featureName) VALUES
(1, 'Sea Glimpse'),
(2, 'Open Balcony'),
(3, 'Snack Bar'),
(4, 'Large Tub'),
(5, 'Mini Kitchen'),
(6, 'Movie Projector'),
(7, 'Conference Audio');

INSERT IGNORE INTO FeaturesInRoom (roomID, roomFeatureID)
SELECT roomID, 3
FROM Room
WHERE roomTypeID = 1 AND roomID <= 60;

INSERT IGNORE INTO FeaturesInRoom (roomID, roomFeatureID)
SELECT roomID, 1 FROM Room WHERE roomTypeID = 2 AND roomID <= 60;
INSERT IGNORE INTO FeaturesInRoom (roomID, roomFeatureID)
SELECT roomID, 2 FROM Room WHERE roomTypeID = 2 AND roomID <= 60;
INSERT IGNORE INTO FeaturesInRoom (roomID, roomFeatureID)
SELECT roomID, 3 FROM Room WHERE roomTypeID = 2 AND roomID <= 60;

INSERT IGNORE INTO FeaturesInRoom (roomID, roomFeatureID)
SELECT roomID, 1 FROM Room WHERE roomTypeID = 3 AND roomID <= 60;
INSERT IGNORE INTO FeaturesInRoom (roomID, roomFeatureID)
SELECT roomID, 2 FROM Room WHERE roomTypeID = 3 AND roomID <= 60;
INSERT IGNORE INTO FeaturesInRoom (roomID, roomFeatureID)
SELECT roomID, 4 FROM Room WHERE roomTypeID = 3 AND roomID <= 60;
INSERT IGNORE INTO FeaturesInRoom (roomID, roomFeatureID)
SELECT roomID, 5 FROM Room WHERE roomTypeID = 3 AND roomID <= 60;

INSERT IGNORE INTO FeaturesInRoom (roomID, roomFeatureID) VALUES
(61, 6), (61, 7),
(62, 6), (62, 7),
(63, 6),
(64, 6), (64, 7);

SET @guest_n := 0;

INSERT IGNORE INTO Guest
(guestID, firstName, lastName, email, phoneNum, organization, cardNum, PIN)
SELECT
    t.n AS guestID,
    CONCAT('Guest', t.n) AS firstName,
    CONCAT('LRH', t.n)  AS lastName,
    CONCAT('guest', t.n, '@harbor.example.com') AS email,
    CONCAT('929-346-', LPAD(t.n, 4, '0')) AS phoneNum,
    CASE 
        WHEN t.n % 10 = 0 THEN 'Peeksnack Events'
        WHEN t.n % 15 = 0 THEN 'Citizen Society'
        ELSE NULL 
    END AS organization,
    CONCAT('CARD-', LPAD(t.n, 4, '0')) AS cardNum,
    LPAD((1000 + t.n) % 9999, 4, '0') AS PIN
FROM (
    SELECT (@guest_n := @guest_n + 1) AS n
    FROM information_schema.columns c1
    CROSS JOIN information_schema.columns c2
    LIMIT 80
) t;

INSERT IGNORE INTO BilledParty
(billedPartyID, name, partyType, contactPerson, address, phone)
SELECT
    guestID,
    CONCAT(firstName, ' ', lastName),
    'Individual',
    NULL,
    'New York, NY',
    phoneNum
FROM Guest;

INSERT IGNORE INTO BilledParty
(billedPartyID, name, partyType, contactPerson, address, phone)
VALUES
(101, 'Citizen Society',     'Organization', 'Events Lead',     'New York, NY',     '312-465-3051'),
(102, 'Peeksnack Events',    'Organization', 'Group Manager',   'Jersey City, NJ',  '201-535-3022'),
(103, 'JD Lab',              'Organization', 'Office Admin',    'New York, NY',     '242-525-5703'),
(104, 'Studio Blink',        'Organization', 'Producer',        'Brooklyn, NY',     '718-357-8213'),
(105, 'Cobor Partners',      'Organization', 'Client Services', 'New York, NY',     '272-468-1236');

SET @res_n := 0;

INSERT IGNORE INTO Reservation
(reservationID, guestID, roomID, startDate, endDate, status, specialRequests, advanceDeposits)
SELECT
    t.n AS reservationID,
    1 + ((t.n - 1) MOD 80) AS guestID,
    1 + ((t.n - 1) MOD 60) AS roomID,
    DATE_ADD('2025-10-01', INTERVAL ((t.n - 1) MOD 90) DAY) AS startDate,
    DATE_ADD(
        DATE_ADD('2025-10-01', INTERVAL ((t.n - 1) MOD 90) DAY),
        INTERVAL 1 + ((t.n - 1) MOD 5) DAY
    ) AS endDate,
    CASE
        WHEN t.n % 10 = 0 THEN 'cancelled'
        WHEN t.n % 7  = 0 THEN 'checked_out'
        ELSE 'booked'
    END AS status,
    CASE
        WHEN t.n % 12 = 0 THEN 'Late check-in'
        WHEN t.n % 15 = 0 THEN 'High floor'
        WHEN t.n % 18 = 0 THEN 'Quiet room'
        ELSE NULL
    END AS specialRequests,
    CASE WHEN t.n % 5 = 0 THEN 120.00 ELSE 0.00 END AS advanceDeposits
FROM (
    SELECT (@res_n := @res_n + 1) AS n
    FROM information_schema.columns c1
    CROSS JOIN information_schema.columns c2
    CROSS JOIN information_schema.columns c3
    LIMIT 180
) t;

INSERT IGNORE INTO ReservationGuest (reservationID, guestID, isPrimaryGuest)
SELECT reservationID, guestID, 1
FROM Reservation;

INSERT IGNORE INTO ReservationGuest (reservationID, guestID, isPrimaryGuest)
SELECT
    reservationID,
    1 + (guestID MOD 80),
    0
FROM Reservation
WHERE reservationID % 8 = 0;

INSERT IGNORE INTO ReservationRequirements (reservationID, reqType, reqValue)
SELECT reservationID, 'Accessibility', 'Wheelchair-friendly'
FROM Reservation
WHERE reservationID % 20 = 0;

INSERT IGNORE INTO ReservationRequirements (reservationID, reqType, reqValue)
SELECT reservationID, 'Amenity', 'Large Tub'
FROM Reservation
WHERE reservationID % 14 = 0;

INSERT IGNORE INTO ReservationRequirements (reservationID, reqType, reqValue)
SELECT reservationID, 'Bed Preference', 'King'
FROM Reservation
WHERE reservationID % 9 = 0;

INSERT IGNORE INTO ServiceType (serviceTypeID, serviceName, rate, baseCharge) VALUES
(1, 'Room Night',     0.00, 0.00),
(2, 'Wellness Bath', 120.00, 0.00),
(3, 'Late Bites',     0.00, 25.00),
(4, 'Room Rental',    0.00, 0.00),
(5, 'Car Space',     30.00, 0.00),
(6, 'Snack Tray',     0.00, 15.00);

SET @evt_n := 0;

INSERT IGNORE INTO Event
(eventID, eventName, hostID, description, estimatedAttendance, startDate, endDate)
SELECT
    t.n AS eventID,
    CONCAT('Golden Gathering ', t.n) AS eventName,
    CASE
        WHEN t.n % 5 = 1 THEN 101
        WHEN t.n % 5 = 2 THEN 102
        WHEN t.n % 5 = 3 THEN 103
        WHEN t.n % 5 = 4 THEN 104
        ELSE 105
    END AS hostID,
    'Private booking for training, retreat, or social event.',
    28 + (t.n * 3),
    DATE_ADD('2025-11-01', INTERVAL (t.n * 2) DAY),
    DATE_ADD('2025-11-01', INTERVAL (t.n * 2) DAY)
FROM (
    SELECT (@evt_n := @evt_n + 1) AS n
    FROM information_schema.columns c1
    CROSS JOIN information_schema.columns c2
    LIMIT 20
) t;

INSERT IGNORE INTO EventRoomUsage
(eventID, roomID, usageType, scheduledStart, scheduledEnd, actualStart, actualEnd, chargeRate)
SELECT
    eventID,
    61 + ((eventID - 1) MOD 4) AS roomID,
    CASE WHEN eventID % 3 = 0 THEN 'Mixer'
         WHEN eventID % 3 = 1 THEN 'Workshop'
         ELSE 'Meeting' END AS usageType,
    CONCAT(startDate, ' 09:30:00') AS scheduledStart,
    CONCAT(startDate, ' 15:30:00') AS scheduledEnd,
    NULL,
    NULL,
    CASE
        WHEN 61 + ((eventID - 1) MOD 4) = 61 THEN 650.00
        WHEN 61 + ((eventID - 1) MOD 4) = 62 THEN 820.00
        WHEN 61 + ((eventID - 1) MOD 4) = 63 THEN 520.00
        ELSE 980.00
    END AS chargeRate
FROM Event;

SET SQL_SAFE_UPDATES = 0;

UPDATE EventRoomUsage
SET
  actualStart = DATE_ADD(scheduledStart, INTERVAL (eventID MOD 4) * 7 MINUTE),
  actualEnd   = DATE_ADD(
                  scheduledEnd,
                  INTERVAL CASE
                    WHEN eventID MOD 6 = 0 THEN -25
                    WHEN eventID MOD 6 = 1 THEN -10
                    WHEN eventID MOD 6 = 2 THEN 0
                    ELSE 20
                  END MINUTE
               )
WHERE actualStart IS NULL;

SET SQL_SAFE_UPDATES = 1;

INSERT IGNORE INTO Charge
(billedPartyID, serviceTypeID, roomID, guestID, quantity, price, chargeDate)
SELECT
    r.guestID AS billedPartyID,
    1 AS serviceTypeID,
    r.roomID,
    r.guestID,
    GREATEST(DATEDIFF(r.endDate, r.startDate), 1) AS quantity,
    rm.baseRate AS price,
    CONCAT(r.endDate, ' 09:15:00') AS chargeDate
FROM Reservation r
JOIN Room rm ON rm.roomID = r.roomID
WHERE r.status <> 'cancelled';

INSERT IGNORE INTO Charge
(billedPartyID, serviceTypeID, roomID, guestID, quantity, price, chargeDate)
SELECT
    r.guestID, 2, NULL, r.guestID,
    1, 120.00,
    CONCAT(r.startDate, ' 14:30:00')
FROM Reservation r
WHERE r.status <> 'cancelled' AND r.reservationID % 6 = 0;

INSERT IGNORE INTO Charge
(billedPartyID, serviceTypeID, roomID, guestID, quantity, price, chargeDate)
SELECT
    r.guestID, 3, r.roomID, r.guestID,
    1 + (r.reservationID MOD 3),
    25.00,
    CONCAT(r.startDate, ' 19:45:00')
FROM Reservation r
WHERE r.status <> 'cancelled' AND r.reservationID % 4 = 0;

INSERT IGNORE INTO Charge
(billedPartyID, serviceTypeID, roomID, guestID, quantity, price, chargeDate)
SELECT
    r.guestID, 5, NULL, r.guestID,
    GREATEST(DATEDIFF(r.endDate, r.startDate), 1),
    30.00,
    CONCAT(r.endDate, ' 08:30:00')
FROM Reservation r
WHERE r.status <> 'cancelled' AND r.reservationID % 5 = 0;

INSERT IGNORE INTO Charge
(billedPartyID, serviceTypeID, roomID, guestID, quantity, price, chargeDate)
SELECT
    r.guestID, 6, r.roomID, r.guestID,
    1 + (r.reservationID MOD 4),
    15.00,
    CONCAT(r.startDate, ' 21:50:00')
FROM Reservation r
WHERE r.status <> 'cancelled' AND r.reservationID % 9 = 0;

INSERT IGNORE INTO Charge
(billedPartyID, serviceTypeID, roomID, guestID, quantity, price, chargeDate)
SELECT
    e.hostID,
    4,
    eru.roomID,
    NULL,
    1,
    eru.chargeRate,
    CONCAT(e.startDate, ' 17:10:00')
FROM Event e
JOIN EventRoomUsage eru ON eru.eventID = e.eventID;

INSERT IGNORE INTO BillingSplit (chargeID, billedPartyID, splitRatio)
SELECT c.chargeID, 101, 0.70
FROM Charge c
WHERE c.serviceTypeID = 3
ORDER BY c.chargeID
LIMIT 15;

INSERT IGNORE INTO BillingSplit (chargeID, billedPartyID, splitRatio)
SELECT c.chargeID, c.billedPartyID, 0.30
FROM Charge c
WHERE c.serviceTypeID = 3
ORDER BY c.chargeID
LIMIT 15;

INSERT IGNORE INTO Payment (billedPartyID, amount, paymentDate, paymentMethod)
SELECT
    billedPartyID,
    ROUND(SUM(quantity * price) * 0.60, 2),
    '2025-11-15 11:30:00',
    'Credit Card'
FROM Charge
WHERE billedPartyID BETWEEN 1 AND 80
GROUP BY billedPartyID
HAVING SUM(quantity * price) > 0;

INSERT IGNORE INTO Payment (billedPartyID, amount, paymentDate, paymentMethod)
SELECT
    billedPartyID,
    ROUND(SUM(quantity * price) * 0.40, 2),
    '2026-01-05 13:10:00',
    'Credit Card'
FROM Charge
WHERE billedPartyID BETWEEN 1 AND 80
GROUP BY billedPartyID
HAVING SUM(quantity * price) > 0;

INSERT IGNORE INTO Payment (billedPartyID, amount, paymentDate, paymentMethod)
SELECT
    billedPartyID,
    ROUND(SUM(quantity * price), 2),
    '2025-12-20 10:20:00',
    'Wire Transfer'
FROM Charge
WHERE billedPartyID IN (101,102,103,104,105)
GROUP BY billedPartyID;

INSERT IGNORE INTO CardReader (cardReaderID, location, readerType) VALUES
(1, 'Golden Tower Lobby',   'Entry'),
(2, 'Umi Wing Lift',        'Elevator'),
(3, 'Minami Wing Lift',     'Elevator'),
(4, 'Cliff Hub Lobby',      'Entry'),
(5, 'Event Floor Access',   'Event');

SET @acc_n := 0;

INSERT IGNORE INTO AccessLog (guestID, cardReaderID, accessTime, direction)
SELECT
    1 + ((t.n - 1) MOD 80) AS guestID,
    1 + ((t.n - 1) MOD 5)  AS cardReaderID,
    DATE_ADD('2025-10-01 07:30:00', INTERVAL (t.n * 5) HOUR) AS accessTime,
    CASE WHEN t.n % 2 = 0 THEN 'in' ELSE 'out' END AS direction
FROM (
    SELECT (@acc_n := @acc_n + 1) AS n
    FROM information_schema.columns c1
    CROSS JOIN information_schema.columns c2
    LIMIT 200
) t;

SET @msg_n := 0;

INSERT IGNORE INTO Message (guestID, messageText, messageTime, isConfidential)
SELECT
    t.n,
    CONCAT('Welcome to Golden Tower & Cliff Hub, Guest ', t.n, '!'),
    DATE_ADD('2025-10-01 11:45:00', INTERVAL t.n DAY),
    0
FROM (
    SELECT (@msg_n := @msg_n + 1) AS n
    FROM information_schema.columns
    LIMIT 40
) t;
