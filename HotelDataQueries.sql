USE hoteldatabase;

SELECT GuestID, RoomNumber, StartDate, EndDate FROM Reservations WHERE EndDate BETWEEN '2023-7-1' AND '2023-7-31';
SELECT GuestName FROM Guests WHERE GuestID = 1 OR GuestID = 9 OR GuestID = 10 OR GuestID = 3;
-- 1, 205, 2023-06-28, 2023-07-02
-- 9, 204, 2023-07-13, 2023-07-14
-- 10, 401, 2023-07-18, 2023-07-29
-- 3, 303, 2023-07-28, 2023-07-29

SELECT AmenityID FROM Amenities WHERE HasJacuzzi = True;
-- 1
-- 3
SELECT RoomNumber FROM Rooms WHERE AmenityID = 1 OR AmenityID = 3;
-- 201
-- 203
-- 301
-- 303
-- 205
-- 207
-- 305
-- 307
SELECT GuestID, StartDate, EndDate FROM Reservations WHERE 
	RoomNumber = 201 or
    RoomNumber = 203 or
    RoomNumber = 301 or
    RoomNumber = 203 or
    RoomNumber = 205 or
    RoomNumber = 207 or
    RoomNumber = 305 or
    RoomNumber = 207;
-- 5, 2023-03-06, 2023-03-07
-- 3, 2023-02-05, 2023-02-10
-- 5, 2023-09-13, 2023-09-15
-- 1, 2023-06-28, 2023-07-02
-- 10, 2023-04-23, 2023-04-24
-- 9, 2023-04-09, 2023-04-13
-- 2, 2023-11-22, 2023-11-25
-- 4, 2023-02-22, 2023-02-24
-- 4, 2023-08-30, 2023-09-01
SELECT GuestName FROM Guests WHERE
	GuestID = 5 OR
    GuestID = 3 OR
    GuestID = 1 OR
    GuestID = 10 OR
    GuestID = 9 OR
    GuestID = 2 OR
    GuestID = 4;
-- Daniel Catlett
-- Mack Simmer
-- Bettyann Seery
-- Duane Cullison
-- Karie Yang
-- Walter Holaway
-- Wilfred Vise
    
SELECT GuestID FROM Guests WHERE GuestName = 'Daniel Catlett';
-- 1
SELECT RoomNumber, StartDate, Adults, Children FROM Reservations WHERE GuestID = 1;
-- 307, 2023-03-17, 1, 1
-- 205, 2023-06-28, 2, 0

-- QUERY 4 HERE

SELECT RoomNumber FROM Reservations WHERE 
	((StartDate BETWEEN '2023-04-01' AND '2023-04-30') OR (EndDate BETWEEN '2023-04-01' AND '2023-04-30')) AND
	(Adults + Children) > 2;
-- No data matches these requirements

-- QUERY 6 HERE

SELECT GuestName, Address, PhoneNum FROM Guests WHERE PhoneNum = '(555) 555-5555';
-- Daniel Catlett, 123 Main Street, (555) 555-5555







