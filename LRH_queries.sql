-- Query 1: Revenue Breakdown by Service Type
SELECT st.serviceName, ROUND(SUM(c.price * c.quantity), 2) AS totalRevenue
FROM Charge c
JOIN ServiceType st ON c.serviceTypeID = st.serviceTypeID
GROUP BY st.serviceName
ORDER BY totalRevenue DESC;

-- Query 2: Average Stay Duration by Room Type
SELECT rt.typeName, ROUND(AVG(DATEDIFF(rsv.endDate, rsv.startDate)), 1) AS avgStayDays
FROM Reservation rsv
JOIN Room rm ON rsv.roomID = rm.roomID
JOIN RoomType rt ON rm.roomTypeID = rt.roomTypeID
GROUP BY rt.typeName
ORDER BY avgStayDays DESC;

-- Query 3: Utilization Rate For Event Spaces
SELECT rm.roomNumber,
       ROUND(
           SUM(TIMESTAMPDIFF(HOUR, eru.actualStart, eru.actualEnd)) /
           SUM(TIMESTAMPDIFF(HOUR, eru.scheduledStart, eru.scheduledEnd)) * 100
       , 2) AS utilizationRate
FROM EventRoomUsage eru
JOIN Room rm ON eru.roomID = rm.roomID
GROUP BY rm.roomNumber
ORDER BY utilizationRate DESC;

-- Query 4: Top Guests by Total Spend
SELECT g.firstName, g.lastName, SUM(c.price * c.quantity) AS totalSpend
FROM Charge c
JOIN Guest g ON c.guestID = g.guestID
GROUP BY g.guestID, g.firstName, g.lastName
ORDER BY totalSpend DESC
LIMIT 10;

-- Query 5: Average Revenue per Guest (per charge)
SELECT g.guestID, g.firstName, g.lastName,
       ROUND(SUM(c.price * c.quantity) / COUNT(DISTINCT c.chargeID), 2) AS avgRevenuePerCharge
FROM Guest g
JOIN Charge c ON g.guestID = c.guestID
GROUP BY g.guestID, g.firstName, g.lastName
ORDER BY avgRevenuePerCharge DESC
LIMIT 10;

-- Query 6: Average Occupancy Duration by Building
SELECT b.buildingName, ROUND(AVG(DATEDIFF(r.endDate, r.startDate)), 1) AS avgStayDays
FROM Reservation r
JOIN Room rm ON r.roomID = rm.roomID
JOIN Floor f ON rm.floorID = f.floorID
JOIN Wing w ON f.wingID = w.wingID
JOIN Building b ON w.buildingID = b.buildingID
GROUP BY b.buildingName
ORDER BY avgStayDays DESC;

-- Query 7: Top Event Hosts by Number of Events
SELECT e.hostID, COUNT(e.eventID) AS totalEvents
FROM Event e
GROUP BY e.hostID
ORDER BY totalEvents DESC
LIMIT 10;

-- Query 8: Total Reservations per Month
SELECT DATE_FORMAT(r.startDate, '%Y-%m') AS month,
       COUNT(r.reservationID) AS totalReservations
FROM Reservation r
GROUP BY DATE_FORMAT(r.startDate, '%Y-%m')
ORDER BY month;

