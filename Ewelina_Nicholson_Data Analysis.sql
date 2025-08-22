1. This query calculates the average rating from the ReviewAndRating table and names the result column as "AverageRating."

SELECT AVG(Rating) as AverageRating FROM ReviewAndRating;

Result:

AverageRating
4.0000

2. This query calculates the total number of available rooms from the Hotel table and names the result column as "TotalAvailableRooms."

SELECT SUM(AvailableRooms) as TotalAvailableRooms FROM Hotel;

Result:

TotalAvailableRooms
235

3. This query retrieves all rows from the Hotel table where the "Rating" is greater than 4.0.

SELECT * FROM Hotel WHERE Rating > 4.0;

Result:

HotelID	HotelName	LocationID	Description	PricePerNight	AvailableRooms	Amenities	Rating
1	Radison	1	Luxurious hotel in the city center	150.00	50	Swimming pool, Gym, Free Wi-Fi	4.5
4	Stanton	4	Mountain retreat with stunning views	180.00	15	Hiking trails, Spa, Restaurant	4.7
5	Caledonina	5	Historic hotel in the heart of the old town	130.00	40	Bar, Conference facilities	4.3
6	Lomond	6	Beachfront resort with water sports	200.00	25	Beach access, Water sports, Pool	4.9
7	The Crusoe	7	Charming boutique hotel in a quiet neighborhood	110.00	10	Garden, Café, Free Breakfast	4.6
8	Astoria	8	Astoria for all travelers	200.00	5	Solar power, Garden, Café	4.8
9	Fantasia	9	Eco-friendly retreat in a nature reserve	190.00	5	Solar power, Organic meals	4.8
10	Old Manor	10	City view hotel with rooftop bar	140.00	35	Rooftop bar, City views, Free Wi-Fi	4.4


4. This query retrieves all bookings from the Booking table for a user with UserID equal to 1.

SELECT * FROM Booking WHERE UserID = 1;

Result: 

BookingID	UserID	FlightID	HotelID	CarRentalID	TotalPrice	BookingDate	CheckInDate	CheckOutDate	PaymentStatus	Status
1	1	1	1	1	500.00	2023-10-05 12:00:00	2023-10-10	2023-10-15	Paid	Confirmed


5. This query retrieves all flights from the Flight table where the "Price" is less than 300 and sorts them by price in ascending order.

Result: 

FlightID	DepartureDateTime	ArrivalDateTime	Airline	Price	AvailableSeats
3	2023-11-17 15:15:00	2023-11-17 17:45:00	Delta Airlines	180.00	100
6	2023-11-20 11:30:00	2023-11-20 14:15:00	Delta Airlines	220.00	120
9	2023-11-23 13:00:00	2023-11-23 15:45:00	Delta Airlines	230.00	150
2	2023-11-16 10:45:00	2023-11-16 13:30:00	United Airlines	250.00	200
8	2023-11-22 08:45:00	2023-11-22 11:30:00	United Airlines	260.00	200
5	2023-11-19 09:00:00	2023-11-19 11:45:00	United Airlines	270.00	160
7	2023-11-21 14:15:00	2023-11-21 16:45:00	American Airlines	290.00	140


SELECT * FROM Flight WHERE Price < 300 ORDER BY Price;

6. This query retrieves booking details for a user with UserID equal to 1 and includes information about the associated hotel and flight (if available) using left joins.

SELECT b.*, h.HotelName, f.Airline
FROM Booking b
LEFT JOIN Hotel h ON b.HotelID = h.HotelID
LEFT JOIN Flight f ON b.FlightID = f.FlightID
WHERE b.UserID = 1;

Result:

BookingID	UserID	FlightID	HotelID	CarRentalID	TotalPrice	BookingDate	CheckInDate	CheckOutDate	PaymentStatus	Status	HotelName	Airline
1	1	1	1	1	500.00	2023-10-05 12:00:00	2023-10-10	2023-10-15	Paid	Confirmed	Radison	American Airlines


7. This query counts the number of bookings per hotel and groups the results by HotelID.

SELECT HotelID, COUNT(BookingID) as BookingCount
FROM Booking
GROUP BY HotelID;

Result:

HotelID	BookingCount
1	1
2	1
3	1
4	1
5	1
6	1
7	1
8	1
9	1
10	1


8. This query identifies the user with the most bookings by counting the number of bookings for each user and ordering the results in descending order.

SELECT UserID, COUNT(BookingID) as BookingCount
FROM Booking
GROUP BY UserID
ORDER BY BookingCount DESC
LIMIT 1;

Result:

UserID	BookingCount
1	2

9. This query calculates the average hotel ratings for different destinations and orders them by the highest average rating.

SELECT l.DestinationName, AVG(rr.Rating) as AverageRating
FROM Location l
JOIN Hotel h ON l.LocationID = h.LocationID
LEFT JOIN ReviewAndRating rr ON h.HotelID = rr.HotelID
GROUP BY l.DestinationName
ORDER BY AverageRating DESC;

Result:

DestinationName	AverageRating
New York City	5.0000
Sydney	5.0000
Cancun	5.0000
Paris	4.0000
London	4.0000
Dubai	4.0000
Bali	4.0000
Tokyo	3.0000
Rome	3.0000
Cape Town	3.0000


10. This query identifies the location with the most bookings by counting the number of bookings for each location and selecting the one with the highest count.

SELECT l.DestinationName, COUNT(b.BookingID) as BookingCount
FROM Location l
JOIN Hotel h ON l.LocationID = h.LocationID
JOIN Booking b ON h.HotelID = b.HotelID
GROUP BY l.DestinationName
ORDER BY BookingCount DESC
LIMIT 1;

Result:

DestinationName	BookingCount
Paris	1


11. This query calculates the total booking cost for each duser, including hotel, flight, and car rental costs, if applicable.

SELECT l.DestinationName, SUM(b.TotalPrice) as TotalBookingCost
FROM Location l
JOIN Hotel h ON l.LocationID = h.LocationID
JOIN Booking b ON h.HotelID = b.HotelID
LEFT JOIN Flight f ON b.FlightID = f.FlightID
LEFT JOIN CarRental cr ON b.CarRentalID = cr.CarRentalID
GROUP BY l.DestinationName;

Result:

UserID	Username	TotalBookingCost
1	Ewelina_Nicholson	1300.00
2	Philip_Nicholson	1050.00
3	Marta_Guzik	525.00
4	Jarek_Kuden	1820.00
5	Dorota_Dybas	1870.00
6	Krzysiek_Dybas	2540.00
7	John_Smith	1215.00
8	Olivia_Perez	1300.00
9	Noah_Hernandez	1680.00
10	Sophia_Davidson	1335.00


12. This query finds the hotel with the highest price per night in each location.

SELECT l.DestinationName, h.HotelName, h.PricePerNight
FROM Location l
JOIN Hotel h ON l.LocationID = h.LocationID
WHERE h.PricePerNight = (SELECT MAX(PricePerNight) FROM Hotel WHERE LocationID = l.LocationID);

Result:

DestinationName	HotelName	PricePerNight
Paris	Radison	150.00
New York City	Denver	120.00
Tokyo	Blue Bay	75.00
London	Stanton	180.00
Sydney	Caledonina	130.00
Rome	Lomond	200.00
Dubai	The Crusoe	110.00
Cancun	Astoria	200.00
Bali	Fantasia	190.00
Cape Town	Old Manor	140.00


13. This query identifies users who left reviews (with a non-null UserID in ReviewAndRating) but did not make any bookings.

SELECT u.Username
FROM User u
LEFT JOIN ReviewAndRating rr ON u.UserID = rr.UserID
WHERE rr.UserID IS NOT NULL
AND u.UserID NOT IN (SELECT DISTINCT UserID FROM Booking);

Result:

Username
John_Doe


############################## CORE REQUIREMENTS ################################


1. STORED FUNCTION:

This function calculates the total cost of a booking based on the booking ID provided as an argument. It takes into account the prices of the flight, hotel, and car rental associated with the booking.

CREATE FUNCTION CalculateTotalBookingCost(booking_id INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE total_cost DECIMAL(10,2);
    SELECT
        (F.Price) +
        (H.PricePerNight * DATEDIFF(B.HotelCheckOutDate, B.HotelCheckInDate)) +
        (CR.PricePerDay * DATEDIFF(B.CarRentalEndDate, B.CarRentalStartDate))
    INTO total_cost
    FROM Booking B
    LEFT JOIN Flight F ON B.FlightID = F.FlightID
    LEFT JOIN Hotel H ON B.HotelID = H.HotelID
    LEFT JOIN CarRental CR ON B.CarRentalID = CR.CarRentalID
    WHERE B.BookingID = booking_id;

    RETURN total_cost;
END;
//
DELIMITER ;

SELECT CalculateTotalBookingCost(6); 

Result:

CalculateTotalBookingCost(6)
2540.00
 
2. CREATE VIEW:

This code creates a view called BookingSummary that consolidates information from multiple tables to provide a summary of bookings, including details about users, flights, hotels, car rentals, and the total booking cost.

CREATE VIEW BookingSummary AS
SELECT
    b.UserID,
    u.Username,
    f.Airline,
    f.Price AS FlightPrice,
    h.HotelName,
    DATEDIFF(b.HotelCheckOutDate, b.HotelCheckInDate) AS StayDuration,
    h.PricePerNight * DATEDIFF(b.HotelCheckOutDate, b.HotelCheckInDate) AS TotalHotelCost,
    cr.CarType,
    cr.PricePerDay * DATEDIFF(b.CarRentalEndDate, b.CarRentalStartDate) AS TotalCarCost,
    CalculateTotalBookingCost(b.BookingID) AS TotalBookingCost
FROM Booking b
LEFT JOIN User u ON b.UserID = u.UserID
LEFT JOIN Flight f ON b.FlightID = f.FlightID
LEFT JOIN Hotel h ON b.HotelID = h.HotelID
LEFT JOIN CarRental cr ON b.CarRentalID = cr.CarRentalID;

SELECT * FROM BookingSummary;

Result:

UserID	Username	Airline	FlightPrice	HotelName	StayDuration	TotalHotelCost	CarType	TotalCarCost	TotalBookingCost
1	Ewelina_Nicholson	American Airlines	300.00	Radison	5	750.00	Compact	250.00	1300.00
2	Philip_Nicholson	United Airlines	250.00	Denver	4	480.00	SUV	320.00	1050.00
3	Marta_Guzik	Delta Airlines	180.00	Blue Bay	3	225.00	Economy	120.00	525.00
4	Jarek_Kuden	American Airlines	320.00	Stanton	5	900.00	Luxury	600.00	1820.00
5	Dorota_Dybas	United Airlines	270.00	Caledonina	8	1040.00	Minivan	560.00	1870.00
6	Krzysiek_Dybas	Delta Airlines	220.00	Lomond	8	1600.00	Convertible	720.00	2540.00
7	John_Smith	American Airlines	290.00	The Crusoe	5	550.00	Truck	375.00	1215.00
8	Olivia_Perez	United Airlines	260.00	Astoria	4	800.00	Hybrid	240.00	1300.00
9	Noah_Hernandez	Delta Airlines	230.00	Fantasia	5	950.00	Sports	500.00	1680.00
10	Sophia_Davidson	American Airlines	310.00	Old Manor	5	700.00	Van	325.00	1335.00
1	Ewelina_Nicholson	NULL	NULL	Radison	5	750.00	NULL	NULL	NULL
2	Philip_Nicholson	NULL	NULL	Blue Bay	5	375.00	NULL	NULL	NULL


3. QUERY WITH SUBQUERY:

This code calculates the total cost of each booking and then retrieves the booking with the highest total cost along with some additional details about the booking and the associated user.

WITH BookingCost AS (
    SELECT 
        b.BookingID,
        (F.Price) + (H.PricePerNight * DATEDIFF(b.HotelCheckOutDate, b.HotelCheckInDate)) + 
        (CR.PricePerDay * DATEDIFF(b.CarRentalEndDate, b.CarRentalStartDate)) AS TotalCost
    FROM Booking b
    LEFT JOIN Flight F ON b.FlightID = F.FlightID
    LEFT JOIN Hotel H ON b.HotelID = H.HotelID
    LEFT JOIN CarRental CR ON b.CarRentalID = CR.CarRentalID
)

SELECT b.BookingID, u.Username, b.BookingDate, b.PaymentStatus, b.Status, bc.TotalCost
FROM Booking b
JOIN User u ON b.UserID = u.UserID
JOIN BookingCost bc ON b.BookingID = bc.BookingID
ORDER BY bc.TotalCost DESC
LIMIT 1;

Result:

BookingID	Username	BookingDate	PaymentStatus	Status	TotalCost
6	Krzysiek_Dybas	2023-11-19 11:30:00	Paid	Confirmed	2540.00

#################################### ADVANCED ########################################

1. STORED PROCEDURE

This code creates a stored procedure named GetBookingDetails that retrieves and displays detailed information about a booking based on the provided booking ID.

DELIMITER //

CREATE PROCEDURE GetBookingDetails(IN booking_id INT)
BEGIN
    SELECT
        b.BookingID,
        u.Username,
        f.Airline,
        b.BookingDate,
        h.HotelName,
        b.HotelCheckInDate,
        b.HotelCheckOutDate,
        cr.CarType,
        b.CarRentalStartDate,
        b.CarRentalEndDate,
        b.PaymentStatus,
        b.Status
    FROM Booking b
    LEFT JOIN User u ON b.UserID = u.UserID
    LEFT JOIN Flight f ON b.FlightID = f.FlightID
    LEFT JOIN Hotel h ON b.HotelID = h.HotelID
    LEFT JOIN CarRental cr ON b.CarRentalID = cr.CarRentalID
    WHERE b.BookingID = booking_id;
END;
//
DELIMITER ;

CALL GetBookingDetails(2);

Result:

BookingID	Username	Airline	BookingDate	HotelName	HotelCheckInDate	HotelCheckOutDate	CarType	CarRentalStartDate	CarRentalEndDate	PaymentStatus	Status
2	Philip_Nicholson	United Airlines	2023-09-06 10:30:00	Denver	2023-09-12	2023-09-16	SUV	2023-09-12	2023-09-16	Paid	Completed

  

2. CREATE EVENT:

This code creates an event named UpdateBookingStatusEvent that runs on a schedule every hour. This event is designed to update the status of bookings that meet certain conditions.
 
DELIMITER $$

CREATE EVENT IF NOT EXISTS `UpdateBookingStatusEvent`
ON SCHEDULE EVERY 1 HOUR
DO
BEGIN
  DECLARE currentDateTime DATETIME;
  SET currentDateTime = NOW();

  UPDATE `Booking`
  SET `Status` = 'Completed'
  WHERE `Status` = 'Confirmed'
    AND `BookingDate` < currentDateTime
    AND `HotelCheckOutDate` < currentDateTime
    AND `CarRentalEndDate` < currentDateTime;
END $$

DELIMITER ;

ALTER EVENT `UpdateBookingStatusEvent` ON SCHEDULE EVERY 1 HOUR ENABLE;

SET GLOBAL event_scheduler = ON;

SELECT * FROM information_schema.events WHERE event_name = 'UpdateBookingStatusEvent';

Result:

EVENT_CATALOG	EVENT_SCHEMA	EVENT_NAME	DEFINER	TIME_ZONE	EVENT_BODY	EVENT_DEFINITION	EVENT_TYPE	EXECUTE_AT	INTERVAL_VALUE	INTERVAL_FIELD	SQL_MODE	STARTS	ENDS	STATUS	ON_COMPLETION	CREATED	LAST_ALTERED	LAST_EXECUTED	EVENT_COMMENT	ORIGINATOR	CHARACTER_SET_CLIENT	COLLATION_CONNECTION	DATABASE_COLLATION
def	TravelBookingSystem	UpdateBookingStatusEvent	root@localhost	SYSTEM	SQL	BEGIN
  DECLARE currentDateTime DATETIME;
  SET currentDateTime = NOW();

  UPDATE `Booking`
  SET `Status` = 'Completed'
  WHERE `Status` = 'Confirmed'
    AND `BookingDate` < currentDateTime
    AND `HotelCheckOutDate` < currentDateTime
    AND `CarRentalEndDate` < currentDateTime;
END	RECURRING	NULL	1	HOUR	ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION	2023-11-07 11:16:27	NULL	ENABLED	NOT PRESERVE	2023-11-07 11:16:20	2023-11-07 11:16:27	2023-11-07 11:16:27		1	utf8mb4	utf8mb4_0900_ai_ci	utf8mb4_0900_ai_ci


3. CREATE VIEW WITH  3-4 BASE TABLES

This code creates a view named HotelBookingView that combines information from several base tables to provide a comprehensive view of hotel bookings. The view includes details about the booking, user, hotel, and location.

CREATE VIEW HotelBookingView AS
SELECT
    b.BookingID,
    u.Username,
    u.FirstName,
    u.LastName,
    h.HotelName,
    h.Description AS HotelDescription,
    h.PricePerNight,
    h.Rating,
    l.DestinationName,
    l.Description AS LocationDescription,
    l.AverageTemperature,
    b.BookingDate,
    b.HotelCheckInDate,
    b.HotelCheckOutDate,
    b.PaymentStatus,
    b.Status
FROM Booking b
INNER JOIN User u ON b.UserID = u.UserID
INNER JOIN Hotel h ON b.HotelID = h.HotelID
INNER JOIN Location l ON h.LocationID = l.LocationID;


SELECT
    BookingID,
    Username,
    CONCAT(FirstName, ' ', LastName) AS GuestName,
    HotelName,
    HotelDescription,
    PricePerNight,
    Rating,
    DestinationName,
    LocationDescription,
    AverageTemperature,
    BookingDate,
    HotelCheckInDate,
    HotelCheckOutDate,
    PaymentStatus,
    Status
FROM HotelBookingView
ORDER BY BookingID;
  
Result:

BookingID	Username	GuestName	HotelName	HotelDescription	PricePerNight	Rating	DestinationName	LocationDescription	AverageTemperature	BookingDate	HotelCheckInDate	HotelCheckOutDate	PaymentStatus	Status
1	Ewelina_Nicholson	Ewelina Nicholson	Radison	Luxurious hotel in the city center	150.00	4.5	Paris	City of lights and romance.	20.50	2023-10-05 12:00:00	2023-10-10	2023-10-15	Paid	Completed
2	Philip_Nicholson	Philip Nicholson	Denver	Cozy hotel near the beach	120.00	4.0	New York City	The Big Apple with skyscrapers.	18.00	2023-09-06 10:30:00	2023-09-12	2023-09-16	Paid	Completed
3	Marta_Guzik	Marta Guzik	Blue Bay	Budget-friendly hotel for travelers	75.00	3.2	Tokyo	Capital of Japan, rich in culture.	24.00	2023-10-07 15:45:00	2023-10-14	2023-10-17	Paid	Completed
4	Jarek_Kuden	Jarek Kuden	Stanton	Mountain retreat with stunning views	180.00	4.7	London	Historic city with royal palaces.	17.50	2023-08-08 09:15:00	2023-08-13	2023-08-18	Paid	Completed
5	Dorota_Dybas	Dorota Dybas	Caledonina	Historic hotel in the heart of the old town	130.00	4.3	Sydney	Beautiful harbor city with beaches.	22.00	2023-11-01 14:00:00	2023-11-11	2023-11-19	Paid	Confirmed
6	Krzysiek_Dybas	Krzysiek Dybas	Lomond	Beachfront resort with water sports	200.00	4.9	Rome	Eternal city with ancient history.	25.50	2023-11-19 11:30:00	2023-11-20	2023-11-28	Paid	Confirmed
7	John_Smith	JOhn Smith	The Crusoe	Charming boutique hotel in a quiet neighborhood	110.00	4.6	Dubai	Desert metropolis with luxury.	30.00	2023-10-05 13:20:00	2023-10-16	2023-10-21	Paid	Completed
8	Olivia_Perez	Olivia Perez	Astoria	Astoria for all travelers	200.00	4.8	Cancun	Mexican paradise with white beaches.	28.00	2023-09-23 16:10:00	2023-09-28	2023-10-02	Paid	Completed
9	Noah_Hernandez	Noah Hernandez	Fantasia	Eco-friendly retreat in a nature reserve	190.00	4.8	Bali	Tropical island with lush landscapes.	27.00	2023-08-12 14:45:00	2023-08-18	2023-08-23	Paid	Completed
10	Sophia_Davidson	Sophia Davidson	Old Manor	City view hotel with rooftop bar	140.00	4.4	Cape Town	Stunning coastal city with diverse culture.	22.50	2023-09-14 12:30:00	2023-09-19	2023-09-24	Paid	Completed
11	Ewelina_Nicholson	Ewelina Nicholson	Radison	Luxurious hotel in the city center	150.00	4.5	Paris	City of lights and romance.	20.50	2023-11-25 14:00:00	2023-11-30	2023-12-05	Paid	Confirmed
12	Philip_Nicholson	Philip Nicholson	Blue Bay	Budget-friendly hotel for travelers	75.00	3.2	Tokyo	Capital of Japan, rich in culture.	24.00	2023-11-25 14:00:00	2023-11-30	2023-12-05	Paid	Confirmed


4. CREATE QUERY WITH BY AND HAVING


This query retrieves the average temperature for each destination from the Location table, groups the results by destination name, and then filters the groups to include only those with an average temperature greater than 25

SELECT
    l.DestinationName,
    AVG(l.AverageTemperature) AS AvgTemperature
FROM Location l
GROUP BY l.DestinationName
HAVING AvgTemperature > 25;

Result:

DestinationName	AvgTemperature
Rome	25.500000
Dubai	30.000000
Cancun	28.000000
Bali	27.000000


5. CREATE TRIGGER

This code you creates a trigger named UpdateAvailableRoomsAfterBooking that activates after an INSERT operation on the Booking table. The trigger is designed to update the number of available rooms in the corresponding hotel when a booking is made.

DELIMITER //
CREATE TRIGGER UpdateAvailableRoomsAfterBooking
AFTER INSERT ON Booking
FOR EACH ROW
BEGIN
    UPDATE Hotel
    SET AvailableRooms = AvailableRooms - 1
    WHERE HotelID = NEW.HotelID;
END;
//
DELIMITER ;

INSERT INTO Booking (UserID, HotelID, BookingDate, HotelCheckInDate, HotelCheckOutDate, PaymentStatus, Status)
VALUES (1, 1, '2023-11-25 14:00:00', '2023-11-30', '2023-12-05', 'Paid', 'Confirmed');

INSERT INTO Booking (UserID, HotelID, BookingDate, HotelCheckInDate, HotelCheckOutDate, PaymentStatus, Status)
VALUES (2, 3, '2023-11-25 14:00:00', '2023-11-30', '2023-12-05', 'Paid', 'Confirmed');

SELECT AvailableRooms
FROM Hotel
WHERE HotelID = 3;

Result: 

AvailableRooms
19


