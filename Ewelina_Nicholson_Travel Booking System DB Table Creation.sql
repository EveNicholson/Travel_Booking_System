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
('Sophia_Davidson', 'qgyehiuy', 'sophia@outlook.com', 'Sophia', 'Davidson', '777 Pine St, City', '435-678-6280', '0x1L813J1E01292834565');


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