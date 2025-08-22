-- MySQL dump 10.13  Distrib 8.0.33, for macos13 (x86_64)
--
-- Host: localhost    Database: TravelBookingSystem
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Booking`
--

DROP TABLE IF EXISTS `Booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Booking` (
  `BookingID` int NOT NULL AUTO_INCREMENT,
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
  `Status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`BookingID`),
  KEY `UserID` (`UserID`),
  KEY `FlightID` (`FlightID`),
  KEY `HotelID` (`HotelID`),
  KEY `CarRentalID` (`CarRentalID`),
  CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `User` (`UserID`),
  CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`FlightID`) REFERENCES `Flight` (`FlightID`),
  CONSTRAINT `booking_ibfk_3` FOREIGN KEY (`HotelID`) REFERENCES `Hotel` (`HotelID`),
  CONSTRAINT `booking_ibfk_4` FOREIGN KEY (`CarRentalID`) REFERENCES `CarRental` (`CarRentalID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Booking`
--

LOCK TABLES `Booking` WRITE;
/*!40000 ALTER TABLE `Booking` DISABLE KEYS */;
INSERT INTO `Booking` VALUES (1,1,1,1,1,'2023-10-05 12:00:00','2023-10-10','2023-10-15','2023-10-10','2023-10-15','Paid','Completed'),(2,2,2,2,2,'2023-09-06 10:30:00','2023-09-12','2023-09-16','2023-09-12','2023-09-16','Paid','Completed'),(3,3,3,3,3,'2023-10-07 15:45:00','2023-10-14','2023-10-17','2023-10-14','2023-10-17','Paid','Completed'),(4,4,4,4,4,'2023-08-08 09:15:00','2023-08-13','2023-08-18','2023-08-13','2023-08-18','Paid','Completed'),(5,5,5,5,5,'2023-11-01 14:00:00','2023-11-11','2023-11-19','2023-11-11','2023-11-19','Paid','Confirmed'),(6,6,6,6,6,'2023-11-19 11:30:00','2023-11-20','2023-11-28','2023-11-20','2023-11-28','Paid','Confirmed'),(7,7,7,7,7,'2023-10-05 13:20:00','2023-10-16','2023-10-21','2023-10-16','2023-10-21','Paid','Completed'),(8,8,8,8,8,'2023-09-23 16:10:00','2023-09-28','2023-10-02','2023-09-28','2023-10-02','Paid','Completed'),(9,9,9,9,9,'2023-08-12 14:45:00','2023-08-18','2023-08-23','2023-08-18','2023-08-23','Paid','Completed'),(10,10,10,10,10,'2023-09-14 12:30:00','2023-09-19','2023-09-24','2023-09-19','2023-09-24','Paid','Completed'),(11,1,NULL,1,NULL,'2023-11-25 14:00:00','2023-11-30','2023-12-05',NULL,NULL,'Paid','Confirmed'),(12,2,NULL,3,NULL,'2023-11-25 14:00:00','2023-11-30','2023-12-05',NULL,NULL,'Paid','Confirmed');
/*!40000 ALTER TABLE `Booking` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `UpdateAvailableRoomsAfterBooking` AFTER INSERT ON `booking` FOR EACH ROW BEGIN
    UPDATE Hotel
    SET AvailableRooms = AvailableRooms - 1
    WHERE HotelID = NEW.HotelID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `bookingsummary`
--

DROP TABLE IF EXISTS `bookingsummary`;
/*!50001 DROP VIEW IF EXISTS `bookingsummary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `bookingsummary` AS SELECT 
 1 AS `UserID`,
 1 AS `Username`,
 1 AS `Airline`,
 1 AS `FlightPrice`,
 1 AS `HotelName`,
 1 AS `StayDuration`,
 1 AS `TotalHotelCost`,
 1 AS `CarType`,
 1 AS `TotalCarCost`,
 1 AS `TotalBookingCost`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `CarRental`
--

DROP TABLE IF EXISTS `CarRental`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CarRental` (
  `CarRentalID` int NOT NULL AUTO_INCREMENT,
  `LocationID` int DEFAULT NULL,
  `CarType` varchar(100) NOT NULL,
  `PricePerDay` decimal(10,2) DEFAULT NULL,
  `AvailableCars` int DEFAULT NULL,
  `Features` text,
  PRIMARY KEY (`CarRentalID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CarRental`
--

LOCK TABLES `CarRental` WRITE;
/*!40000 ALTER TABLE `CarRental` DISABLE KEYS */;
INSERT INTO `CarRental` VALUES (1,1,'Compact',50.00,20,'Air conditioning, GPS'),(2,2,'SUV',80.00,15,'4-wheel drive, Spacious interior'),(3,3,'Economy',40.00,25,'Fuel-efficient, Easy to park'),(4,4,'Luxury',120.00,10,'Leather seats, Navigation system'),(5,5,'Minivan',70.00,12,'Seating for 7, DVD player'),(6,6,'Convertible',90.00,8,'Open-top, Sporty design'),(7,7,'Truck',75.00,15,'Cargo space, Tow hitch'),(8,8,'Hybrid',60.00,5,'Fuel-efficient, Eco-friendly'),(9,9,'Sports',100.00,6,'High performance, Racing features'),(10,10,'Van',65.00,10,'Spacious, Suitable for groups');
/*!40000 ALTER TABLE `CarRental` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Flight`
--

DROP TABLE IF EXISTS `Flight`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Flight` (
  `FlightID` int NOT NULL AUTO_INCREMENT,
  `DepartureDateTime` datetime DEFAULT NULL,
  `ArrivalDateTime` datetime DEFAULT NULL,
  `Airline` varchar(100) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `AvailableSeats` int DEFAULT NULL,
  PRIMARY KEY (`FlightID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Flight`
--

LOCK TABLES `Flight` WRITE;
/*!40000 ALTER TABLE `Flight` DISABLE KEYS */;
INSERT INTO `Flight` VALUES (1,'2023-11-15 08:00:00','2023-11-15 10:30:00','American Airlines',300.00,150),(2,'2023-11-16 10:45:00','2023-11-16 13:30:00','United Airlines',250.00,200),(3,'2023-11-17 15:15:00','2023-11-17 17:45:00','Delta Airlines',180.00,100),(4,'2023-11-18 12:30:00','2023-11-18 15:15:00','American Airlines',320.00,180),(5,'2023-11-19 09:00:00','2023-11-19 11:45:00','United Airlines',270.00,160),(6,'2023-11-20 11:30:00','2023-11-20 14:15:00','Delta Airlines',220.00,120),(7,'2023-11-21 14:15:00','2023-11-21 16:45:00','American Airlines',290.00,140),(8,'2023-11-22 08:45:00','2023-11-22 11:30:00','United Airlines',260.00,200),(9,'2023-11-23 13:00:00','2023-11-23 15:45:00','Delta Airlines',230.00,150),(10,'2023-11-24 10:00:00','2023-11-24 12:30:00','American Airlines',310.00,170);
/*!40000 ALTER TABLE `Flight` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Hotel`
--

DROP TABLE IF EXISTS `Hotel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Hotel` (
  `HotelID` int NOT NULL AUTO_INCREMENT,
  `HotelName` varchar(100) NOT NULL,
  `LocationID` int DEFAULT NULL,
  `Description` text,
  `PricePerNight` decimal(10,2) DEFAULT NULL,
  `AvailableRooms` int DEFAULT NULL,
  `Amenities` text,
  `Rating` decimal(3,1) DEFAULT NULL,
  PRIMARY KEY (`HotelID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Hotel`
--

LOCK TABLES `Hotel` WRITE;
/*!40000 ALTER TABLE `Hotel` DISABLE KEYS */;
INSERT INTO `Hotel` VALUES (1,'Radison',1,'Luxurious hotel in the city center',150.00,49,'Swimming pool, Gym, Free Wi-Fi',4.5),(2,'Denver',2,'Cozy hotel near the beach',120.00,30,'Breakfast included, Parking',4.0),(3,'Blue Bay',3,'Budget-friendly hotel for travelers',75.00,19,'Free Wi-Fi, 24-hour reception',3.2),(4,'Stanton',4,'Mountain retreat with stunning views',180.00,15,'Hiking trails, Spa, Restaurant',4.7),(5,'Caledonina',5,'Historic hotel in the heart of the old town',130.00,40,'Bar, Conference facilities',4.3),(6,'Lomond',6,'Beachfront resort with water sports',200.00,25,'Beach access, Water sports, Pool',4.9),(7,'The Crusoe',7,'Charming boutique hotel in a quiet neighborhood',110.00,10,'Garden, Café, Free Breakfast',4.6),(8,'Astoria',8,'Astoria for all travelers',200.00,5,'Solar power, Garden, Café',4.8),(9,'Fantasia',9,'Eco-friendly retreat in a nature reserve',190.00,5,'Solar power, Organic meals',4.8),(10,'Old Manor',10,'City view hotel with rooftop bar',140.00,35,'Rooftop bar, City views, Free Wi-Fi',4.4);
/*!40000 ALTER TABLE `Hotel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `hotelbookingview`
--

DROP TABLE IF EXISTS `hotelbookingview`;
/*!50001 DROP VIEW IF EXISTS `hotelbookingview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `hotelbookingview` AS SELECT 
 1 AS `BookingID`,
 1 AS `Username`,
 1 AS `FirstName`,
 1 AS `LastName`,
 1 AS `HotelName`,
 1 AS `HotelDescription`,
 1 AS `PricePerNight`,
 1 AS `Rating`,
 1 AS `DestinationName`,
 1 AS `LocationDescription`,
 1 AS `AverageTemperature`,
 1 AS `BookingDate`,
 1 AS `HotelCheckInDate`,
 1 AS `HotelCheckOutDate`,
 1 AS `PaymentStatus`,
 1 AS `Status`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Location`
--

DROP TABLE IF EXISTS `Location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Location` (
  `LocationID` int NOT NULL AUTO_INCREMENT,
  `DestinationName` varchar(100) NOT NULL,
  `Description` text,
  `AverageTemperature` decimal(5,2) DEFAULT NULL,
  `Currency` varchar(50) DEFAULT NULL,
  `LanguageSpoken` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`LocationID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Location`
--

LOCK TABLES `Location` WRITE;
/*!40000 ALTER TABLE `Location` DISABLE KEYS */;
INSERT INTO `Location` VALUES (1,'Paris','City of lights and romance.',20.50,'Euro','French'),(2,'New York City','The Big Apple with skyscrapers.',18.00,'US Dollar','English'),(3,'Tokyo','Capital of Japan, rich in culture.',24.00,'Japanese Yen','Japanese'),(4,'London','Historic city with royal palaces.',17.50,'British Pound','English'),(5,'Sydney','Beautiful harbor city with beaches.',22.00,'Australian Dollar','English'),(6,'Rome','Eternal city with ancient history.',25.50,'Euro','Italian'),(7,'Dubai','Desert metropolis with luxury.',30.00,'UAE Dirham','Arabic, English'),(8,'Cancun','Mexican paradise with white beaches.',28.00,'Mexican Peso','Spanish'),(9,'Bali','Tropical island with lush landscapes.',27.00,'Indonesian Rupiah','Indonesian'),(10,'Cape Town','Stunning coastal city with diverse culture.',22.50,'South African Rand','Afrikaans, English');
/*!40000 ALTER TABLE `Location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ReviewAndRating`
--

DROP TABLE IF EXISTS `ReviewAndRating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ReviewAndRating` (
  `ReviewID` int NOT NULL AUTO_INCREMENT,
  `UserID` int DEFAULT NULL,
  `HotelID` int DEFAULT NULL,
  `Rating` tinyint DEFAULT NULL,
  `ReviewText` text,
  PRIMARY KEY (`ReviewID`),
  KEY `UserID` (`UserID`),
  KEY `HotelID` (`HotelID`),
  CONSTRAINT `reviewandrating_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `User` (`UserID`),
  CONSTRAINT `reviewandrating_ibfk_2` FOREIGN KEY (`HotelID`) REFERENCES `Hotel` (`HotelID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ReviewAndRating`
--

LOCK TABLES `ReviewAndRating` WRITE;
/*!40000 ALTER TABLE `ReviewAndRating` DISABLE KEYS */;
INSERT INTO `ReviewAndRating` VALUES (1,1,1,4,'Great hotel, friendly staff.'),(2,2,2,5,'Amazing experience, would highly recommend!'),(3,3,3,3,'Good value for the price, but room was small.'),(4,4,4,4,'Impressive service and amenities.'),(5,5,5,5,'Unforgettable stay in a beautiful location.'),(6,6,6,3,'Decent hotel, but could improve cleanliness.'),(7,7,7,4,'Excellent choice for business travelers.'),(8,8,8,5,'Luxurious and comfortable stay.'),(9,9,9,4,'Friendly staff and great location.'),(10,10,10,3,'Average hotel, nothing exceptional.'),(12,11,10,5,'Great hotel and excellent service!');
/*!40000 ALTER TABLE `ReviewAndRating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `User` (
  `UserID` int NOT NULL AUTO_INCREMENT,
  `Username` varchar(50) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `PhoneNumber` varchar(20) DEFAULT NULL,
  `PaymentInformation` varbinary(255) DEFAULT NULL,
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES (1,'Ewelina_Nicholson','qwertyu','ewelina@gmail.com','Ewelina','Nicholson','123 St. Ninians Road, Edinburgh','123-456-7890',_binary '0x6A723E1F9876543210'),(2,'Philip_Nicholson','asdfghjjk','philip@gyahoo.com','Philip','Nicholson','432 Morisson Road, Edinburgh','987-654-3210',_binary '0x5A723B1F9879873210'),(3,'Marta_Guzik','zxcvbnmbn','marta@gmail.com','Marta','Guzik','207 Southhouse Drive, Edinburgh','934-632-3245',_binary '0x8Z723J1F5879875432'),(4,'Jarek_Kuden','sdfjhgfrr','jarek@yahoo.com','Jarek','Kuden','56 Gilmerton Drive, Edinburgh','432-567-3987',_binary '0x1Z926J1K5834575982'),(5,'Dorota_Dybas','poiuytre','dorota@gmail.com','Dorota','Dybas','987 Cakemuir Drive, Edinburgh','324-543-8765',_binary '0x1Q926J1J0987654321'),(6,'Krzysiek_Dybas','lkjhgfds','krzysiek@outlook.com','Krzysiek','Dybas','High Street, Edinburgh','789-345-6487',_binary '0x1P926J1J0483746592'),(7,'John_Smith','rtyuiop','john@gmail.com','JOhn','Smith','Elm Row, Edinburgh','645-879-1234',_binary '0x9L912J1G00192837465'),(8,'Olivia_Perez','mznxbcvfg','olivia@yahoo.com','Olivia','Perez','555 Elm St, Vancouver','765-345-6789',_binary '0x2L912J1G9873458932'),(9,'Noah_Hernandez','kaowieufhk','noah@yahoo.com','Noah','Hernandez','666 Oak St, Ubud','321-234-5748',_binary '0x7L152J1L00195463765'),(10,'Sophia_Davidson','qgyehiuy','sophia@outlook.com','Sophia','Davidson','777 Pine St, City','435-678-6280',_binary '0x1L813J1E01292834565'),(11,'John_Doe','asdrews','john.doe@gmail.com','John','Doe','1 Lake View , Zanzibar','365-608-4136',_binary 'Null');
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `bookingsummary`
--

/*!50001 DROP VIEW IF EXISTS `bookingsummary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `bookingsummary` AS select `b`.`UserID` AS `UserID`,`u`.`Username` AS `Username`,`f`.`Airline` AS `Airline`,`f`.`Price` AS `FlightPrice`,`h`.`HotelName` AS `HotelName`,(to_days(`b`.`HotelCheckOutDate`) - to_days(`b`.`HotelCheckInDate`)) AS `StayDuration`,(`h`.`PricePerNight` * (to_days(`b`.`HotelCheckOutDate`) - to_days(`b`.`HotelCheckInDate`))) AS `TotalHotelCost`,`cr`.`CarType` AS `CarType`,(`cr`.`PricePerDay` * (to_days(`b`.`CarRentalEndDate`) - to_days(`b`.`CarRentalStartDate`))) AS `TotalCarCost`,`CalculateTotalBookingCost`(`b`.`BookingID`) AS `TotalBookingCost` from ((((`booking` `b` left join `user` `u` on((`b`.`UserID` = `u`.`UserID`))) left join `flight` `f` on((`b`.`FlightID` = `f`.`FlightID`))) left join `hotel` `h` on((`b`.`HotelID` = `h`.`HotelID`))) left join `carrental` `cr` on((`b`.`CarRentalID` = `cr`.`CarRentalID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `hotelbookingview`
--

/*!50001 DROP VIEW IF EXISTS `hotelbookingview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `hotelbookingview` AS select `b`.`BookingID` AS `BookingID`,`u`.`Username` AS `Username`,`u`.`FirstName` AS `FirstName`,`u`.`LastName` AS `LastName`,`h`.`HotelName` AS `HotelName`,`h`.`Description` AS `HotelDescription`,`h`.`PricePerNight` AS `PricePerNight`,`h`.`Rating` AS `Rating`,`l`.`DestinationName` AS `DestinationName`,`l`.`Description` AS `LocationDescription`,`l`.`AverageTemperature` AS `AverageTemperature`,`b`.`BookingDate` AS `BookingDate`,`b`.`HotelCheckInDate` AS `HotelCheckInDate`,`b`.`HotelCheckOutDate` AS `HotelCheckOutDate`,`b`.`PaymentStatus` AS `PaymentStatus`,`b`.`Status` AS `Status` from (((`booking` `b` join `user` `u` on((`b`.`UserID` = `u`.`UserID`))) join `hotel` `h` on((`b`.`HotelID` = `h`.`HotelID`))) join `location` `l` on((`h`.`LocationID` = `l`.`LocationID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-07 12:52:01
