CREATE DATABASE TravelBookingSystem;

USE TravelBookingSystem;

CREATE TABLE `Booking` (
  `BookingID` int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `UserID` int DEFAULT NULL,
  `FlightID` int DEFAULT NULL,
  `HotelID` int DEFAULT NULL,
  `CarRentalID` int DEFAULT NULL,
  `BookingDate` datetime DEFAULT NULL,
  `HotelCheckInDate` date DEFAULT NULL,
  `HotelCheckOutDate` date DEFAULT NULL,
  `CarRentalStartDate` date DEFAULT NULL,
  `CarRentalEndDate` date DEFAULT NULL,
  `PaymentStatus` varchar(20) DEFAULT NULL,
  `Status` varchar(20) DEFAULT NULL);
  
  INSERT INTO `Booking` (UserID, FlightID, HotelID, CarRentalID, BookingDate, HotelCheckInDate, HotelCheckOutDate, CarRentalStartDate, CarRentalEndDate,  PaymentStatus, Status)
VALUES
    (1, 1, 1, 1, '2023-10-05 12:00:00', '2023-10-10', '2023-10-15', '2023-10-10', '2023-10-15', 'Paid', 'Confirmed'),
    (2, 2, 2, 2, '2023-09-06 10:30:00', '2023-09-12', '2023-09-16', '2023-09-12', '2023-09-16', 'Paid', 'Confirmed'),
    (3, 3, 3, 3, '2023-10-07 15:45:00', '2023-10-14', '2023-10-17', '2023-10-14', '2023-10-17', 'Paid', 'Confirmed'),
    (4, 4, 4, 4, '2023-08-08 09:15:00', '2023-08-13', '2023-08-18', '2023-08-13', '2023-08-18', 'Paid', 'Confirmed'),
    (5, 5, 5, 5, '2023-11-01 14:00:00', '2023-11-11', '2023-11-19', '2023-11-11', '2023-11-19', 'Paid', 'Confirmed'),
    (6, 6, 6, 6, '2023-11-19 11:30:00', '2023-11-20', '2023-11-28', '2023-11-20', '2023-11-28', 'Paid', 'Confirmed'),
    (7, 7, 7, 7, '2023-10-05 13:20:00', '2023-10-16', '2023-10-21', '2023-10-16', '2023-10-21', 'Paid', 'Confirmed'),
    (8, 8, 8, 8, '2023-09-23 16:10:00', '2023-09-28', '2023-10-02', '2023-09-28', '2023-10-02', 'Paid', 'Confirmed'),
    (9, 9, 9, 9, '2023-08-12 14:45:00', '2023-08-18', '2023-08-23', '2023-08-18', '2023-08-23', 'Paid', 'Confirmed'),
    (10, 10, 10, 10, '2023-09-14 12:30:00', '2023-09-19', '2023-09-24', '2023-09-19', '2023-09-24', 'Paid', 'Confirmed');
    
    SELECT * FROM Booking;

CREATE TABLE `User` (
  `UserID` int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `Username` varchar(50) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `PhoneNumber` varchar(20) DEFAULT NULL,
  `PaymentInformation` varbinary(255) DEFAULT NULL

);

INSERT INTO `User` (`Username`, `Password`, `Email`, `FirstName`, `LastName`, `Address`, `PhoneNumber`, `PaymentInformation`)
VALUES 
('Ewelina_Nicholson', 'qwertyu', 'ewelina@gmail.com', 'Ewelina', 'Nicholson', '123 St. Ninians Road, Edinburgh', '123-456-7890', '0x6A723E1F9876543210'),
('Philip_Nicholson', 'asdfghjjk', 'philip@gyahoo.com', 'Philip', 'Nicholson', '432 Morisson Road, Edinburgh', '987-654-3210', '0x5A723B1F9879873210'),
('Marta_Guzik', 'zxcvbnmbn', 'marta@gmail.com', 'Marta', 'Guzik', '207 Southhouse Drive, Edinburgh', '934-632-3245', '0x8Z723J1F5879875432'),
('Jarek_Kuden', 'sdfjhgfrr', 'jarek@yahoo.com', 'Jarek', 'Kuden', '56 Gilmerton Drive, Edinburgh', '432-567-3987', '0x1Z926J1K5834575982'),
('Dorota_Dybas', 'poiuytre', 'dorota@gmail.com', 'Dorota', 'Dybas', '987 Cakemuir Drive, Edinburgh', '324-543-8765', '0x1Q926J1J0987654321'),
('Krzysiek_Dybas', 'lkjhgfds', 'krzysiek@outlook.com', 'Krzysiek', 'Dybas', 'High Street, Edinburgh', '789-345-6487', '0x1P926J1J0483746592'),
('John_Smith', 'rtyuiop', 'john@gmail.com', 'JOhn', 'Smith', 'Elm Row, Edinburgh', '645-879-1234', '0x9L912J1G00192837465'),
('Olivia_Perez', 'mznxbcvfg', 'olivia@yahoo.com', 'Olivia', 'Perez', '555 Elm St, Vancouver', '765-345-6789', '0x2L912J1G9873458932'),
('Noah_Hernandez', 'kaowieufhk', 'noah@yahoo.com', 'Noah', 'Hernandez', '666 Oak St, Ubud', '321-234-5748', '0x7L152J1L00195463765'),
('Sophia_Davidson', 'qgyehiuy', 'sophia@outlook.com', 'Sophia', 'Davidson', '777 Pine St, Salt Lake City', '435-678-6280', '0x1L813J1E01292834565');

SELECT * FROM User;

INSERT INTO User (Username, Password, Email, FirstName, LastName, Address, PhoneNumber, PaymentInformation)
VALUES ('John_Doe','asdrews','john.doe@gmail.com', 'John', 'Doe', '1 Lake View , Zanzibar', '365-608-4136', 'Null' );

SELECT * FROM User;

CREATE TABLE `Hotel` (
  `HotelID` int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `HotelName` varchar(100) NOT NULL,
  `LocationID` int DEFAULT NULL,
  `Description` text,
  `PricePerNight` decimal(10,2) DEFAULT NULL,
  `AvailableRooms` int DEFAULT NULL,
  `Amenities` text,
  `Rating` decimal(3,1) DEFAULT NULL
 
  );
  
  INSERT INTO `Hotel` (`HotelName`, `LocationID`, `Description`, `PricePerNight`, `AvailableRooms`, `Amenities`, `Rating`)
VALUES
  ('Radison', 1, 'Luxurious hotel in the city center', 150.00, 50, 'Swimming pool, Gym, Free Wi-Fi', 4.5),
  ('Denver', 2, 'Cozy hotel near the beach', 120.00, 30, 'Breakfast included, Parking', 4.0),
  ('Blue Bay', 3, 'Budget-friendly hotel for travelers', 75.00, 20, 'Free Wi-Fi, 24-hour reception', 3.2),
  ('Stanton', 4, 'Mountain retreat with stunning views', 180.00, 15, 'Hiking trails, Spa, Restaurant', 4.7),
  ('Caledonina', 5, 'Historic hotel in the heart of the old town', 130.00, 40, 'Bar, Conference facilities', 4.3),
  ('Lomond', 6, 'Beachfront resort with water sports', 200.00, 25, 'Beach access, Water sports, Pool', 4.9),
  ('The Crusoe', 7, 'Charming boutique hotel in a quiet neighborhood', 110.00, 10, 'Garden, Café, Free Breakfast', 4.6),
  ('Astoria', 8, 'Astoria for all travelers', 200.00, 5, 'Solar power, Garden, Café', 4.8),
  ('Fantasia', 9, 'Eco-friendly retreat in a nature reserve', 190.00, 5, 'Solar power, Organic meals', 4.8),
  ('Old Manor', 10, 'City view hotel with rooftop bar', 140.00, 35, 'Rooftop bar, City views, Free Wi-Fi', 4.4);

SELECT * FROM Hotel;

CREATE TABLE `Flight` (
  `FlightID` int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `DepartureDateTime` datetime DEFAULT NULL,
  `ArrivalDateTime` datetime DEFAULT NULL,
  `Airline` varchar(100) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `AvailableSeats` int DEFAULT NULL
  );
  
INSERT INTO `Flight` (FlightID, DepartureDateTime, ArrivalDateTime, Airline, Price, AvailableSeats)
VALUES
    (1,  '2023-11-15 08:00:00', '2023-11-15 10:30:00', 'American Airlines', 300.00, 150),
    (2,  '2023-11-16 10:45:00', '2023-11-16 13:30:00', 'United Airlines', 250.00, 200),
    (3,  '2023-11-17 15:15:00', '2023-11-17 17:45:00', 'Delta Airlines', 180.00, 100),
    (4,  '2023-11-18 12:30:00', '2023-11-18 15:15:00', 'American Airlines', 320.00, 180),
    (5,  '2023-11-19 09:00:00', '2023-11-19 11:45:00', 'United Airlines', 270.00, 160),
    (6,  '2023-11-20 11:30:00', '2023-11-20 14:15:00', 'Delta Airlines', 220.00, 120),
    (7,  '2023-11-21 14:15:00', '2023-11-21 16:45:00', 'American Airlines', 290.00, 140),
    (8,  '2023-11-22 08:45:00', '2023-11-22 11:30:00', 'United Airlines', 260.00, 200),
    (9,  '2023-11-23 13:00:00', '2023-11-23 15:45:00', 'Delta Airlines', 230.00, 150),
    (10,  '2023-11-24 10:00:00', '2023-11-24 12:30:00', 'American Airlines', 310.00, 170);
    
SELECT * FROM Flight;

CREATE TABLE `Location` (
  `LocationID` int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `DestinationName` varchar(100) NOT NULL,
  `Description` text,
  `AverageTemperature` decimal(5,2) DEFAULT NULL,
  `Currency` varchar(50) DEFAULT NULL,
  `LanguageSpoken` varchar(100) DEFAULT NULL
  
  );

INSERT INTO `Location` (`DestinationName`, `Description`, `AverageTemperature`, `Currency`, `LanguageSpoken`)
VALUES
  ('Paris', 'City of lights and romance.', 20.5, 'Euro', 'French'),
  ('New York City', 'The Big Apple with skyscrapers.',  18.0, 'US Dollar', 'English'),
  ('Tokyo', 'Capital of Japan, rich in culture.',  24.0, 'Japanese Yen', 'Japanese'),
  ('London', 'Historic city with royal palaces.',  17.5, 'British Pound', 'English'),
  ('Sydney', 'Beautiful harbor city with beaches.', 22.0, 'Australian Dollar', 'English'),
  ('Rome', 'Eternal city with ancient history.',  25.5, 'Euro', 'Italian'),
  ('Dubai', 'Desert metropolis with luxury.',  30.0, 'UAE Dirham', 'Arabic, English'),
  ('Cancun', 'Mexican paradise with white beaches.', 28.0, 'Mexican Peso', 'Spanish'),
  ('Bali', 'Tropical island with lush landscapes.',  27.0, 'Indonesian Rupiah', 'Indonesian'),
  ('Cape Town', 'Stunning coastal city with diverse culture.',  22.5, 'South African Rand', 'Afrikaans, English');

SELECT * FROM Location;

CREATE TABLE `CarRental` (
  `CarRentalID` int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `LocationID` int DEFAULT NULL,
  `CarType` varchar(100) NOT NULL,
  `PricePerDay` decimal(10,2) DEFAULT NULL,
  `AvailableCars` int DEFAULT NULL,
  `Features` text
  );
  
INSERT INTO `CarRental` (`LocationID`, `CarType`, `PricePerDay`, `AvailableCars`, `Features`)
VALUES
  (1, 'Compact', 50.00, 20, 'Air conditioning, GPS'),
  (2, 'SUV', 80.00, 15, '4-wheel drive, Spacious interior'),
  (3, 'Economy', 40.00, 25, 'Fuel-efficient, Easy to park'),
  (4, 'Luxury', 120.00, 10, 'Leather seats, Navigation system'),
  (5, 'Minivan', 70.00, 12, 'Seating for 7, DVD player'),
  (6, 'Convertible', 90.00, 8, 'Open-top, Sporty design'),
  (7, 'Truck', 75.00, 15, 'Cargo space, Tow hitch'),
  (8, 'Hybrid', 60.00, 5, 'Fuel-efficient, Eco-friendly'),
  (9, 'Sports', 100.00, 6, 'High performance, Racing features'),
  (10, 'Van', 65.00, 10, 'Spacious, Suitable for groups');

SELECT * FROM CarRental;

CREATE TABLE `ReviewAndRating` (
  `ReviewID` int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `UserID` int DEFAULT NULL,
  `HotelID` int DEFAULT NULL,
  `Rating` tinyint DEFAULT NULL,
  `ReviewText` text
  );
  
INSERT INTO `ReviewAndRating` (`UserID`, `HotelID`, `Rating`, `ReviewText`)
VALUES
  (1, 1, 4, 'Great hotel, friendly staff.'),
  (2, 2, 5, 'Amazing experience, would highly recommend!'),
  (3, 3, 3, 'Good value for the price, but room was small.'),
  (4, 4, 4, 'Impressive service and amenities.'),
  (5, 5, 5, 'Unforgettable stay in a beautiful location.'),
  (6, 6, 3, 'Decent hotel, but could improve cleanliness.'),
  (7, 7, 4, 'Excellent choice for business travelers.'),
  (8, 8, 5, 'Luxurious and comfortable stay.'),
  (9, 9, 4, 'Friendly staff and great location.'),
  (10, 10, 3, 'Average hotel, nothing exceptional.');


INSERT INTO ReviewAndRating (UserID, HotelID, Rating, ReviewText)
VALUES (11, 10, 4.5, 'Great hotel and excellent service!');

SELECT * FROM ReviewAndRating;


## RELATIONSHIPS BETWEEN TABLES
## CREATING FOREIGN KEYS
  
ALTER TABLE `Booking`
ADD FOREIGN KEY (`UserID`) REFERENCES `User`(`UserID`);

ALTER TABLE `Booking`
ADD FOREIGN KEY (`FlightID`) REFERENCES `Flight`(`FlightID`);

ALTER TABLE `Booking`
ADD FOREIGN KEY (`HotelID`) REFERENCES `Hotel`(`HotelID`);

ALTER TABLE `Booking`
ADD FOREIGN KEY (`CarRentalID`) REFERENCES `CarRental`(`CarRentalID`);

ALTER TABLE `ReviewAndRating`
ADD FOREIGN KEY (`UserID`) REFERENCES `User`(`UserID`);

ALTER TABLE `ReviewAndRating`
ADD FOREIGN KEY (`HotelID`) REFERENCES `Hotel`(`HotelID`);

ALTER TABLE `Hotel`
ADD FOREIGN KEY (`LocationID`) REFERENCES `Location`(`LocationID`);


## This query calculates the average rating from the ReviewAndRating 
## table and names the result column as "AverageRating."
SELECT AVG(Rating) as AverageRating FROM ReviewAndRating;

## This query calculates the total number of available rooms from the 
## Hotel table and names the result column as "TotalAvailableRooms."
SELECT SUM(AvailableRooms) as TotalAvailableRooms FROM Hotel;

## This query retrieves all rows from the Hotel table where the "Rating" is greater than 4.0.
SELECT * FROM Hotel WHERE Rating > 4.0;

## This query retrieves all bookings from the Booking table for a user with UserID equal to 1.
SELECT * FROM Booking WHERE UserID = 1;

## This query retrieves all flights from the Flight table where the "Price" is less than 300 
## and sorts them by price in ascending order.
SELECT * FROM Flight WHERE Price < 300 ORDER BY Price;

## This query retrieves booking details for a user with UserID equal to 1 and includes information 
## about the associated hotel and flight (if available) using left joins.
SELECT b.*, h.HotelName, f.Airline
FROM Booking b
LEFT JOIN Hotel h ON b.HotelID = h.HotelID
LEFT JOIN Flight f ON b.FlightID = f.FlightID
WHERE b.UserID = 1;

## This query counts the number of bookings per hotel and groups the results by HotelID.
SELECT HotelID, COUNT(BookingID) as BookingCount
FROM Booking
GROUP BY HotelID;

## This query identifies the user with the most bookings by counting the number of 
## bookings for each user and ordering the results in descending order.
SELECT UserID, COUNT(BookingID) as BookingCount
FROM Booking
GROUP BY UserID
ORDER BY BookingCount DESC
LIMIT 1;

## This query calculates the average hotel ratings for different destinations and 
## orders them by the highest average rating
SELECT l.DestinationName, AVG(rr.Rating) as AverageRating
FROM Location l
JOIN Hotel h ON l.LocationID = h.LocationID
LEFT JOIN ReviewAndRating rr ON h.HotelID = rr.HotelID
GROUP BY l.DestinationName
ORDER BY AverageRating DESC;

## This query identifies the location with the most bookings by counting the 
## number of bookings for each location and selecting the one with the highest count.
SELECT l.DestinationName, COUNT(b.BookingID) as BookingCount
FROM Location l
JOIN Hotel h ON l.LocationID = h.LocationID
JOIN Booking b ON h.HotelID = b.HotelID
GROUP BY l.DestinationName
ORDER BY BookingCount DESC
LIMIT 1;

## This query calculates the total booking cost for each duser, including hotel, flight, 
## and car rental costs, if applicable.
SELECT
    U.UserID,
    U.Username,
    SUM(
        (F.Price) + 
        (H.PricePerNight * DATEDIFF(B.HotelCheckOutDate, B.HotelCheckInDate)) +
        (CR.PricePerDay * DATEDIFF(B.CarRentalEndDate, B.CarRentalStartDate))
    ) AS TotalBookingCost
FROM User U
LEFT JOIN Booking B ON U.UserID = B.UserID
LEFT JOIN Flight F ON B.FlightID = F.FlightID
LEFT JOIN Hotel H ON B.HotelID = H.HotelID
LEFT JOIN CarRental CR ON B.CarRentalID = CR.CarRentalID
GROUP BY U.UserID, U.Username;

## This query finds the hotel with the highest price per night in each location.
SELECT l.DestinationName, h.HotelName, h.PricePerNight
FROM Location l
JOIN Hotel h ON l.LocationID = h.LocationID
WHERE h.PricePerNight = (SELECT MAX(PricePerNight) FROM Hotel WHERE LocationID = l.LocationID);

## This query identifies users who left reviews (with a non-null UserID in ReviewAndRating) 
## but did not make any bookings.
SELECT u.Username
FROM User u
LEFT JOIN ReviewAndRating rr ON u.UserID = rr.UserID
WHERE rr.UserID IS NOT NULL
AND u.UserID NOT IN (SELECT DISTINCT UserID FROM Booking);

## STORED FUNCTION
## This function calculates the total cost of a booking based on the booking ID provided as an argument. 
## It takes into account the prices of the flight, hotel, and car rental associated with the booking.
DELIMITER //
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

SELECT CalculateTotalBookingCost(7); 

## CREATE VIEW 
## This code creates a view called BookingSummary that consolidates information from multiple tables 
## to provide a summary of bookings, including details about users, flights, hotels, car rentals, 
## and the total booking cost.
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

## QUERY WITH SUBQUERY
## This code calculates the total cost of each booking and then retrieves the booking with the 
## highest total cost along with some additional details about the booking and the associated user.
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

## STORED PROCEDURE
## This code creates a stored procedure named GetBookingDetails that retrieves and displays detailed 
## information about a booking based on the provided booking ID.
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

CALL GetBookingDetails(9);

## CREATE EVENT
## This code creates an event named UpdateBookingStatusEvent that runs on a schedule every hour. 
## This event is designed to update the status of bookings that meet certain conditions.
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
## This statement is used to enable the MySQL Event Scheduler globally(it means that the setting 
## applies to the entire database server and affects all databases and users on that server. 
## The Event Scheduler is responsible for managing and executing scheduled events in the MySQL database.

SELECT * FROM information_schema.events WHERE event_name = 'UpdateBookingStatusEvent';

## CREATE VIEW WITH  3-4 BASE TABLES
## This code creates a view named HotelBookingView that combines information from several base tables
##  to provide a comprehensive view of hotel bookings. The view includes details about the booking, 
## user, hotel, and location.
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

## CREATE QUERY WITH BY AND HAVING
## This query retrieves the average temperature for each destination from the Location table, 
## groups the results by destination name, and then filters the groups to include only those with 
## an average temperature greater than 25
SELECT
    l.DestinationName,
    AVG(l.AverageTemperature) AS AvgTemperature
FROM Location l
GROUP BY l.DestinationName
HAVING AvgTemperature > 25;

## CREATE TRIGGER
## This code you creates a trigger named UpdateAvailableRoomsAfterBooking that activates after an 
## INSERT operation on the Booking table. The trigger is designed to update the number of available 
## rooms in the corresponding hotel when a booking is made.
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

INSERT INTO Booking (UserID, HotelID, BookingDate, HotelCheckInDate, HotelCheckOutDate, PaymentStatus, Status)
VALUES (3, 3, '2023-11-25 14:00:00', '2023-11-30', '2023-12-05', 'Paid', 'Confirmed');

INSERT INTO Booking (UserID, HotelID, BookingDate, HotelCheckInDate, HotelCheckOutDate, PaymentStatus, Status)
VALUES (4, 3, '2023-11-25 14:00:00', '2023-11-30', '2023-12-05', 'Paid', 'Confirmed');

SELECT AvailableRooms
FROM Hotel
WHERE HotelID = 3;

