DROP DATABASE IF EXISTS LastResortHotel;
CREATE DATABASE LastResortHotel;
USE LastResortHotel;

CREATE TABLE Building (
    buildingID   INT AUTO_INCREMENT PRIMARY KEY,
    buildingName VARCHAR(100) NOT NULL,
    location     VARCHAR(150)
) ENGINE=InnoDB;

CREATE TABLE Wing (
    wingID              INT AUTO_INCREMENT PRIMARY KEY,
    buildingID          INT NOT NULL,
    wingName            VARCHAR(50) NOT NULL,
    proximityToPool     TINYINT(1) DEFAULT 0,
    proximityToParking  TINYINT(1) DEFAULT 0,
    handicapAccess      TINYINT(1) DEFAULT 0,
    CONSTRAINT fk_wing_building
        FOREIGN KEY (buildingID) REFERENCES Building(buildingID)
        ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB;

CREATE TABLE Floor (
    floorID     INT AUTO_INCREMENT PRIMARY KEY,
    wingID      INT NOT NULL,
    floorNumber INT NOT NULL,
    canSmoke    TINYINT(1) DEFAULT 0,
    CONSTRAINT fk_floor_wing
        FOREIGN KEY (wingID) REFERENCES Wing(wingID)
        ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB;

CREATE TABLE RoomType (
    roomTypeID  INT AUTO_INCREMENT PRIMARY KEY,
    typeName    VARCHAR(80) NOT NULL,
    description VARCHAR(255)
) ENGINE=InnoDB;

CREATE TABLE Room (
    roomID      INT AUTO_INCREMENT PRIMARY KEY,
    floorID     INT NOT NULL,
    roomNumber  VARCHAR(10) NOT NULL,
    roomTypeID  INT NOT NULL,
    baseRate    DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    status      VARCHAR(30) NOT NULL DEFAULT 'available',
    hasToilet   TINYINT(1) DEFAULT 1,
    maxCapacity INT NOT NULL DEFAULT 1,
    canSmoke    TINYINT(1) DEFAULT 0,
    CONSTRAINT fk_room_floor
        FOREIGN KEY (floorID) REFERENCES Floor(floorID)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT fk_room_roomtype
        FOREIGN KEY (roomTypeID) REFERENCES RoomType(roomTypeID)
        ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB;

CREATE TABLE BedType (
    bedTypeID  INT AUTO_INCREMENT PRIMARY KEY,
    bedSize    VARCHAR(30) NOT NULL,
    bedLength  VARCHAR(30)
) ENGINE=InnoDB;

CREATE TABLE RoomBed (
    roomBedID  INT AUTO_INCREMENT PRIMARY KEY,
    roomID     INT NOT NULL,
    bedTypeID  INT NOT NULL,
    bedCount   INT NOT NULL DEFAULT 1,
    CONSTRAINT fk_roombed_room
        FOREIGN KEY (roomID) REFERENCES Room(roomID)
        ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_roombed_bedtype
        FOREIGN KEY (bedTypeID) REFERENCES BedType(bedTypeID)
        ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB;

CREATE TABLE RoomFeature (
    roomFeatureID INT AUTO_INCREMENT PRIMARY KEY,
    featureName   VARCHAR(80) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE FeaturesInRoom (
    roomID        INT NOT NULL,
    roomFeatureID INT NOT NULL,
    PRIMARY KEY (roomID, roomFeatureID),
    CONSTRAINT fk_features_room
        FOREIGN KEY (roomID) REFERENCES Room(roomID)
        ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_features_feature
        FOREIGN KEY (roomFeatureID) REFERENCES RoomFeature(roomFeatureID)
        ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB;

CREATE TABLE Guest (
    guestID       INT AUTO_INCREMENT PRIMARY KEY,
    firstName     VARCHAR(60) NOT NULL,
    lastName      VARCHAR(60) NOT NULL,
    email         VARCHAR(120),
    phoneNum      VARCHAR(30),
    organization  VARCHAR(120),
    cardNum       VARCHAR(50),
    PIN           VARCHAR(20)
) ENGINE=InnoDB;

CREATE TABLE BilledParty (
    billedPartyID  INT AUTO_INCREMENT PRIMARY KEY,
    name           VARCHAR(120) NOT NULL,
    partyType      VARCHAR(40) NOT NULL,  
    contactPerson  VARCHAR(120),
    address        VARCHAR(200),
    phone          VARCHAR(30)
) ENGINE=InnoDB;

CREATE TABLE Reservation (
    reservationID     INT AUTO_INCREMENT PRIMARY KEY,
    guestID           INT NOT NULL,  
    roomID            INT NOT NULL,
    startDate         DATE NOT NULL,
    endDate           DATE NOT NULL,
    status            VARCHAR(30) NOT NULL DEFAULT 'booked',
    specialRequests   VARCHAR(255),
    advanceDeposits   DECIMAL(10,2) DEFAULT 0.00,
    CONSTRAINT fk_res_guest
        FOREIGN KEY (guestID) REFERENCES Guest(guestID)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT fk_res_room
        FOREIGN KEY (roomID) REFERENCES Room(roomID)
        ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB;

CREATE TABLE ReservationRequirements (
    requirementID  INT AUTO_INCREMENT PRIMARY KEY,
    reservationID  INT NOT NULL,
    reqType        VARCHAR(60) NOT NULL,
    reqValue       VARCHAR(120),
    CONSTRAINT fk_req_res
        FOREIGN KEY (reservationID) REFERENCES Reservation(reservationID)
        ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE ReservationGuest (
    resGuestID      INT AUTO_INCREMENT PRIMARY KEY,
    reservationID   INT NOT NULL,
    guestID         INT NOT NULL,
    isPrimaryGuest  TINYINT(1) DEFAULT 0,
    CONSTRAINT fk_resguest_res
        FOREIGN KEY (reservationID) REFERENCES Reservation(reservationID)
        ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_resguest_guest
        FOREIGN KEY (guestID) REFERENCES Guest(guestID)
        ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB;

CREATE TABLE Event (
    eventID             INT AUTO_INCREMENT PRIMARY KEY,
    eventName           VARCHAR(120) NOT NULL,
    hostID              INT NOT NULL,
    description         VARCHAR(255),
    estimatedAttendance INT,
    startDate           DATE NOT NULL,
    endDate             DATE NOT NULL,
    CONSTRAINT fk_event_host
        FOREIGN KEY (hostID) REFERENCES BilledParty(billedPartyID)
        ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB;

CREATE TABLE EventRoomUsage (
    eventRoomID     INT AUTO_INCREMENT PRIMARY KEY,
    eventID         INT NOT NULL,
    roomID          INT NOT NULL,
    usageType       VARCHAR(50) NOT NULL,
    scheduledStart  DATETIME NOT NULL,
    scheduledEnd    DATETIME NOT NULL,
    actualStart     DATETIME,
    actualEnd       DATETIME,
    chargeRate      DECIMAL(10,2) DEFAULT 0.00,
    CONSTRAINT fk_eru_event
        FOREIGN KEY (eventID) REFERENCES Event(eventID)
        ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_eru_room
        FOREIGN KEY (roomID) REFERENCES Room(roomID)
        ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB;

CREATE TABLE ServiceType (
    serviceTypeID INT AUTO_INCREMENT PRIMARY KEY,
    serviceName   VARCHAR(100) NOT NULL,
    rate          DECIMAL(10,2) DEFAULT 0.00,
    baseCharge    DECIMAL(10,2) DEFAULT 0.00
) ENGINE=InnoDB;

CREATE TABLE Charge (
    chargeID      INT AUTO_INCREMENT PRIMARY KEY,
    billedPartyID INT NOT NULL,
    serviceTypeID INT NOT NULL,
    roomID        INT,
    guestID       INT,
    quantity      INT NOT NULL DEFAULT 1,
    price         DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    chargeDate    DATETIME NOT NULL,
    CONSTRAINT fk_charge_party
        FOREIGN KEY (billedPartyID) REFERENCES BilledParty(billedPartyID)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT fk_charge_service
        FOREIGN KEY (serviceTypeID) REFERENCES ServiceType(serviceTypeID)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT fk_charge_room
        FOREIGN KEY (roomID) REFERENCES Room(roomID)
        ON UPDATE CASCADE ON DELETE SET NULL,
    CONSTRAINT fk_charge_guest
        FOREIGN KEY (guestID) REFERENCES Guest(guestID)
        ON UPDATE CASCADE ON DELETE SET NULL
) ENGINE=InnoDB;

CREATE TABLE Payment (
    paymentID     INT AUTO_INCREMENT PRIMARY KEY,
    billedPartyID INT NOT NULL,
    amount        DECIMAL(10,2) NOT NULL,
    paymentDate   DATETIME NOT NULL,
    paymentMethod VARCHAR(40) NOT NULL,
    CONSTRAINT fk_payment_party
        FOREIGN KEY (billedPartyID) REFERENCES BilledParty(billedPartyID)
        ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB;

CREATE TABLE BillingSplit (
    splitID       INT AUTO_INCREMENT PRIMARY KEY,
    chargeID      INT NOT NULL,
    billedPartyID INT NOT NULL,
    splitRatio    DECIMAL(5,2) NOT NULL,  
    CONSTRAINT fk_split_charge
        FOREIGN KEY (chargeID) REFERENCES Charge(chargeID)
        ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_split_party
        FOREIGN KEY (billedPartyID) REFERENCES BilledParty(billedPartyID)
        ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB;

CREATE TABLE CardReader (
    cardReaderID INT AUTO_INCREMENT PRIMARY KEY,
    location     VARCHAR(120) NOT NULL,
    readerType   VARCHAR(60)
) ENGINE=InnoDB;

CREATE TABLE AccessLog (
    accessLogID  INT AUTO_INCREMENT PRIMARY KEY,
    guestID      INT NOT NULL,
    cardReaderID INT NOT NULL,
    accessTime   DATETIME NOT NULL,
    direction    VARCHAR(10) NOT NULL, 
    CONSTRAINT fk_access_guest
        FOREIGN KEY (guestID) REFERENCES Guest(guestID)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT fk_access_reader
        FOREIGN KEY (cardReaderID) REFERENCES CardReader(cardReaderID)
        ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB;

CREATE TABLE Message (
    messageID      INT AUTO_INCREMENT PRIMARY KEY,
    guestID        INT NOT NULL,
    messageText    VARCHAR(500) NOT NULL,
    messageTime    DATETIME NOT NULL,
    isConfidential TINYINT(1) DEFAULT 0,
    CONSTRAINT fk_message_guest
        FOREIGN KEY (guestID) REFERENCES Guest(guestID)
        ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB;


CREATE INDEX idx_room_floor      ON Room(floorID);
CREATE INDEX idx_room_type       ON Room(roomTypeID);
CREATE INDEX idx_res_dates       ON Reservation(startDate, endDate);
CREATE INDEX idx_charge_date     ON Charge(chargeDate);
CREATE INDEX idx_payment_date    ON Payment(paymentDate);
CREATE INDEX idx_access_time     ON AccessLog(accessTime);


