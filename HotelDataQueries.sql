USE hoteldatabase;

SELECT guests.GuestName, 
	reservations.RoomNumber, 
    reservations.StartDate, 
    reservations.EndDate
    FROM reservations INNER JOIN guests
    ON reservations.GuestID = guests.GuestID
    WHERE EndDate BETWEEN '2023-07-01' AND '2023-07-31';
-- Daniel Catlett, 205, 2023-06-28, 2023-07-02
-- Walter Holaway, 204, 2023-07-13, 2023-07-14
-- Wilfred Vise, 401, 2023-07-18, 2023-07-29
-- Bettyann Seery, 303, 2023-07-28, 2023-07-29

SELECT guests.GuestName, 
	reservations.RoomNumber, 
    reservations.StartDate, 
    reservations.EndDate
    FROM reservations
	INNER JOIN guests ON reservations.GuestID = guests.GuestID
    INNER JOIN rooms ON reservations.RoomNumber = rooms.RoomNumber
    INNER JOIN amenities ON rooms.AmenityID = amenities.AmenityID
    WHERE amenities.HasJacuzzi = true;
-- Karie Yang, 201, 2023-03-06, 2023-03-07
-- Bettyann Seery, 203, 2023-02-05, 2023-02-10
-- Karie Yang, 203, 2023-09-13, 2023-09-15
-- Walter Holaway, 301, 2023-04-09, 2023-04-13
-- Mack Simmer, 301, 2023-11-22, 2023-11-25
-- Bettyann Seery, 303, 2023-07-28, 2023-07-29
-- Daniel Catlett, 205, 2023-06-28, 2023-07-02
-- Wilfred Vise, 207, 2023-04-23, 2023-04-24
-- Duane Cullison, 305, 2023-02-22, 2023-02-24
-- Duane Cullison, 305, 2023-08-30, 2023-09-01
-- Daniel Catlett, 307, 2023-03-17, 2023-03-20

SELECT 
	guests.GuestName, 
    reservations.RoomNumber, 
    reservations.StartDate, 
    reservations.Adults, 
    reservations.Children 
    FROM reservations INNER JOIN guests
    ON reservations.GuestID = guests.GuestID
    WHERE guests.GuestName = 'Daniel Catlett';
-- Daniel Catlett, 307, 2023-03-17, 1, 1
-- Daniel Catlett, 205, 2023-06-28, 2, 0

SELECT rooms.RoomNumber, 
	reservations.ReservationID, 
    reservations.TotalCost
	FROM reservations RIGHT OUTER JOIN rooms
    ON reservations.RoomNumber = rooms.RoomNumber;
-- 201, 4, 199.99
-- 203, 2, 999.95
-- 203, 21, 399.98
-- 301, 9, 799.96
-- 301, 24, 599.97
-- 303, 18, 199.99
-- 202, 7, 349.98
-- 204, 16, 184.99
-- 302, 6, 924.95
-- 302, 25, 699.96
-- 304, 14, 184.99
-- 205, 15, 699.96
-- 207, 10, 174.99
-- 305, 3, 349.98
-- 305, 19, 349.98
-- 307, 5, 524.97
-- 206, 12, 599.96
-- 206, 23, 449.97
-- 208, 13, 599.96
-- 208, 20, 149.99
-- 306, , 
-- 308, 1, 299.98
-- 401, 11, 1199.97
-- 401, 17, 1259.97
-- 401, 22, 1199.97
-- 402, , 

SELECT RoomNumber FROM Reservations WHERE 
	((StartDate BETWEEN '2023-04-01' AND '2023-04-30') OR (EndDate BETWEEN '2023-04-01' AND '2023-04-30')) AND
	(Adults + Children) > 2;
-- No data matches these requirements

SELECT guests.GuestName, COUNT(reservations.ReservationID) 
	FROM reservations INNER JOIN guests
    ON reservations.GuestID = guests.GuestID
    GROUP BY reservations.GuestID
    ORDER BY COUNT(reservations.ReservationID) DESC;
-- Daniel Catlett, 2
-- Mack Simmer, 4
-- Bettyann Seery, 2
-- Duane Cullison, 3
-- Karie Yang, 3
-- Aurore Lipton, 1
-- Zachery Luechtefeld, 1
-- Walter Holaway, 2
-- Wilfred Vise, 2
-- Maritza Tilton, 2
-- Joleen Tison, 2

SELECT GuestName, Address, PhoneNum FROM Guests WHERE PhoneNum = '(555) 555-5555';
-- Daniel Catlett, 123 Main Street, (555) 555-5555