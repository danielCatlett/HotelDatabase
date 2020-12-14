DROP DATABASE IF EXISTS hoteldatabase;

CREATE DATABASE hoteldatabase;

USE hoteldatabase;

CREATE TABLE Amenities
(
	AmenityID INT PRIMARY KEY AUTO_INCREMENT,
    HasMicrowave BOOLEAN NOT NULL,
    HasRefrigerator BOOLEAN NOT NULL,
    HasOven BOOLEAN NOT NULL,
    HasJacuzzi BOOLEAN NOT NULL
);

CREATE TABLE Guests
(
	GuestID INT PRIMARY KEY AUTO_INCREMENT,
    GuestName VARCHAR(50) NOT NULL,
    Address VARCHAR(75) NOT NULL,
    City VARCHAR(50) NOT NULL,
    State VARCHAR(20) NOT NULL,
    ZipCode VARCHAR(12) NOT NULL,
    PhoneNum VARCHAR(25) NOT NULL
);

CREATE TABLE Rooms
(
	RoomNumber INT PRIMARY KEY AUTO_INCREMENT,
    RoomType VARCHAR(10) NOT NULL,
    AmenityID INT NOT NULL,
    ADAAccessible BOOLEAN NOT NULL,
	StandardOccupancy INT NOT NULL,
    MaxOccupancy INT NOT NULL,
    BasePrice DOUBLE NOT NULL,
    ExtraPersonCost DOUBLE NOT NULL
);

CREATE TABLE Reservations
(
	ReservationID INT PRIMARY KEY AUTO_INCREMENT,
    RoomNumber INT NOT NULL,
    GuestID INT NOT NULL,
    Adults INT NOT NULL,
    Children INT NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL
);

ALTER TABLE Rooms
	ADD CONSTRAINT fk_RoomAmenities FOREIGN KEY (AmenityID) REFERENCES Amenities
    (AmenityID) ON DELETE NO ACTION;

ALTER TABLE Reservations
	ADD CONSTRAINT fk_ReservationRoom FOREIGN KEY (RoomNumber) REFERENCES Rooms
    (RoomNumber) ON DELETE NO ACTION;
ALTER TABLE Reservations
	ADD CONSTRAINT fk_ReservationGuest FOREIGN KEY (GuestID) REFERENCES Guests
    (GuestID) ON DELETE NO ACTION;