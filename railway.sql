-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: railway_system
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `availability`
--

DROP TABLE IF EXISTS `availability`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `availability` (
  `AvailabilityID` int NOT NULL,
  `TrainID` int DEFAULT NULL,
  `ScheduleID` int DEFAULT NULL,
  `JourneyDate` date DEFAULT NULL,
  `SourceStationID` int DEFAULT NULL,
  `DestinationStationID` int DEFAULT NULL,
  `ClassID` int DEFAULT NULL,
  `QuotaType` varchar(50) DEFAULT NULL,
  `TotalSeats` int DEFAULT NULL,
  `BookedSeats` int DEFAULT NULL,
  `AvailableSeats` int DEFAULT NULL,
  `RACSeats` int DEFAULT NULL,
  `CurrentWaitlistCount` int DEFAULT NULL,
  `LastUpdate` datetime DEFAULT NULL,
  `IsBookingOpen` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`AvailabilityID`),
  KEY `TrainID` (`TrainID`),
  KEY `ScheduleID` (`ScheduleID`),
  KEY `SourceStationID` (`SourceStationID`),
  KEY `DestinationStationID` (`DestinationStationID`),
  KEY `ClassID` (`ClassID`),
  CONSTRAINT `availability_ibfk_1` FOREIGN KEY (`TrainID`) REFERENCES `train` (`TrainID`),
  CONSTRAINT `availability_ibfk_2` FOREIGN KEY (`ScheduleID`) REFERENCES `schedule` (`ScheduleID`),
  CONSTRAINT `availability_ibfk_3` FOREIGN KEY (`SourceStationID`) REFERENCES `station` (`StationID`),
  CONSTRAINT `availability_ibfk_4` FOREIGN KEY (`DestinationStationID`) REFERENCES `station` (`StationID`),
  CONSTRAINT `availability_ibfk_5` FOREIGN KEY (`ClassID`) REFERENCES `class` (`ClassID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `availability`
--

LOCK TABLES `availability` WRITE;
/*!40000 ALTER TABLE `availability` DISABLE KEYS */;
/*!40000 ALTER TABLE `availability` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking` (
  `BookingID` int NOT NULL,
  `PassengerID` int DEFAULT NULL,
  `TrainID` int DEFAULT NULL,
  `ScheduleID` int DEFAULT NULL,
  `BookingDate` datetime DEFAULT NULL,
  `JourneyDate` datetime DEFAULT NULL,
  `SourceStationID` int DEFAULT NULL,
  `DestinationStationID` int DEFAULT NULL,
  `ClassID` int DEFAULT NULL,
  `CoachID` int DEFAULT NULL,
  `SeatID` int DEFAULT NULL,
  `BookingStatus` enum('cnf','wl','rac','cancelled') DEFAULT NULL,
  `QuotaType` varchar(50) DEFAULT NULL,
  `IsCancelled` tinyint(1) DEFAULT NULL,
  `CancelledDate` datetime DEFAULT NULL,
  `RefundAmount` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`BookingID`),
  KEY `PassengerID` (`PassengerID`),
  KEY `TrainID` (`TrainID`),
  KEY `ScheduleID` (`ScheduleID`),
  KEY `SourceStationID` (`SourceStationID`),
  KEY `DestinationStationID` (`DestinationStationID`),
  KEY `ClassID` (`ClassID`),
  KEY `CoachID` (`CoachID`),
  CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`PassengerID`) REFERENCES `passenger` (`PassengerID`),
  CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`TrainID`) REFERENCES `train` (`TrainID`),
  CONSTRAINT `booking_ibfk_3` FOREIGN KEY (`ScheduleID`) REFERENCES `schedule` (`ScheduleID`),
  CONSTRAINT `booking_ibfk_4` FOREIGN KEY (`SourceStationID`) REFERENCES `station` (`StationID`),
  CONSTRAINT `booking_ibfk_5` FOREIGN KEY (`DestinationStationID`) REFERENCES `station` (`StationID`),
  CONSTRAINT `booking_ibfk_6` FOREIGN KEY (`ClassID`) REFERENCES `class` (`ClassID`),
  CONSTRAINT `booking_ibfk_7` FOREIGN KEY (`CoachID`) REFERENCES `coach` (`CoachID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` VALUES (1,1,1,1,'2025-04-14 11:30:24','2025-04-15 00:00:00',3,1,2,2,63,'cnf','General',0,NULL,NULL),(2,2,1,1,'2025-04-14 11:47:15','2025-05-01 00:00:00',3,14,2,2,64,'wl','General',0,NULL,NULL),(3,3,1,1,'2025-04-14 11:47:15','2025-05-01 00:00:00',3,14,2,2,65,'wl','General',0,NULL,NULL),(4,4,1,1,'2025-04-14 11:47:15','2025-05-01 00:00:00',3,14,2,2,66,'wl','General',0,NULL,NULL),(5,5,1,1,'2025-04-14 11:47:15','2025-05-01 00:00:00',3,14,2,2,67,'wl','General',0,NULL,NULL),(6,6,1,1,'2025-04-14 11:47:15','2025-05-01 00:00:00',3,14,2,2,68,'wl','General',0,NULL,NULL),(7,7,1,1,'2025-04-14 11:47:15','2025-05-01 00:00:00',3,14,2,2,69,'wl','General',0,NULL,NULL),(8,8,1,1,'2025-04-14 11:47:15','2025-05-01 00:00:00',3,14,2,2,70,'wl','General',0,NULL,NULL),(9,9,1,1,'2025-04-14 11:47:15','2025-05-01 00:00:00',3,14,2,2,71,'wl','General',0,NULL,NULL),(10,10,1,1,'2025-04-14 11:47:15','2025-05-01 00:00:00',3,14,2,2,72,'wl','General',0,NULL,NULL),(11,11,1,1,'2025-04-14 11:47:15','2025-05-01 00:00:00',3,14,2,2,73,'wl','General',0,NULL,NULL),(12,12,1,1,'2025-04-14 11:47:15','2025-05-01 00:00:00',3,14,2,2,74,'wl','General',0,NULL,NULL),(13,13,1,1,'2025-04-14 11:47:15','2025-05-01 00:00:00',3,14,2,2,75,'wl','General',0,NULL,NULL),(14,14,1,1,'2025-04-14 11:47:15','2025-05-01 00:00:00',3,14,2,2,76,'wl','General',0,NULL,NULL),(15,15,1,1,'2025-04-14 11:47:15','2025-05-01 00:00:00',3,14,2,2,77,'wl','General',0,NULL,NULL),(16,16,1,1,'2025-04-14 11:47:15','2025-05-01 00:00:00',3,14,2,2,78,'wl','General',0,NULL,NULL),(17,17,1,1,'2025-04-14 11:47:15','2025-05-01 00:00:00',3,14,2,2,79,'wl','General',0,NULL,NULL),(18,18,1,1,'2025-04-14 11:47:15','2025-05-01 00:00:00',3,14,2,2,80,'wl','General',0,NULL,NULL),(19,19,1,1,'2025-04-14 11:47:15','2025-05-01 00:00:00',3,14,2,2,81,'wl','General',0,NULL,NULL),(20,20,1,1,'2025-04-14 11:47:15','2025-05-01 00:00:00',3,14,2,2,82,'wl','General',0,NULL,NULL),(21,21,1,1,'2025-04-14 11:47:15','2025-05-01 00:00:00',3,14,2,2,83,'wl','General',0,NULL,NULL),(22,22,1,1,'2025-04-14 11:47:15','2025-05-01 00:00:00',3,14,2,2,84,'wl','General',0,NULL,NULL),(23,23,1,1,'2025-04-14 11:47:15','2025-05-01 00:00:00',3,14,2,2,85,'wl','General',0,NULL,NULL),(24,24,1,1,'2025-04-14 11:47:15','2025-05-01 00:00:00',3,14,2,2,86,'wl','General',0,NULL,NULL),(25,25,1,1,'2025-04-14 11:47:15','2025-05-01 00:00:00',3,14,2,2,87,'wl','General',0,NULL,NULL),(26,26,1,1,'2025-04-14 11:47:15','2025-05-01 00:00:00',3,14,2,2,88,'wl','General',0,NULL,NULL),(27,27,1,1,'2025-04-14 11:47:15','2025-05-01 00:00:00',3,14,2,2,89,'wl','General',0,NULL,NULL),(28,28,1,1,'2025-04-14 11:47:15','2025-05-01 00:00:00',3,14,2,2,90,'wl','General',0,NULL,NULL),(29,29,1,1,'2025-04-14 11:47:15','2025-05-01 00:00:00',3,14,2,2,91,'wl','General',0,NULL,NULL),(30,30,1,1,'2025-04-14 11:47:15','2025-05-01 00:00:00',3,14,2,2,92,'wl','General',0,NULL,NULL),(31,31,1,1,'2025-04-14 11:47:15','2025-05-01 00:00:00',3,14,2,2,93,'wl','General',0,NULL,NULL),(32,32,1,1,'2025-04-14 11:47:15','2025-05-01 00:00:00',3,14,2,2,94,'wl','General',0,NULL,NULL),(33,33,1,1,'2025-04-14 11:47:15','2025-05-01 00:00:00',3,14,2,2,95,'wl','General',0,NULL,NULL),(34,34,1,1,'2025-04-14 11:47:15','2025-05-01 00:00:00',3,14,2,2,96,'wl','General',0,NULL,NULL),(35,35,1,1,'2025-04-14 11:47:15','2025-05-01 00:00:00',3,14,2,2,97,'wl','General',0,NULL,NULL),(36,36,1,1,'2025-04-14 11:47:15','2025-05-01 00:00:00',3,14,2,2,98,'wl','General',0,NULL,NULL),(37,37,1,1,'2025-04-14 11:47:15','2025-05-01 00:00:00',3,14,2,2,99,'wl','General',0,NULL,NULL),(38,38,1,1,'2025-04-14 11:47:15','2025-05-01 00:00:00',3,14,2,2,100,'wl','General',0,NULL,NULL),(39,39,1,1,'2025-04-14 11:47:15','2025-05-01 00:00:00',3,14,2,2,101,'wl','General',0,NULL,NULL),(40,40,1,1,'2025-04-14 11:47:15','2025-05-01 00:00:00',3,14,2,2,102,'wl','General',0,NULL,NULL),(41,41,1,1,'2025-04-14 11:47:15','2025-05-01 00:00:00',3,14,2,2,103,'wl','General',0,NULL,NULL),(42,42,1,1,'2025-04-14 11:47:15','2025-05-01 00:00:00',3,14,2,2,104,'wl','General',0,NULL,NULL),(43,43,1,1,'2025-04-14 11:47:15','2025-05-01 00:00:00',3,14,2,2,105,'wl','General',0,NULL,NULL),(44,44,1,1,'2025-04-14 11:47:15','2025-05-01 00:00:00',3,14,2,2,106,'wl','General',0,NULL,NULL),(45,45,1,1,'2025-04-14 11:47:15','2025-05-01 00:00:00',3,14,2,2,107,'wl','General',0,NULL,NULL),(46,46,1,1,'2025-04-14 11:47:15','2025-05-01 00:00:00',3,14,2,2,108,'wl','General',0,NULL,NULL),(47,47,1,1,'2025-04-14 11:47:15','2025-05-01 00:00:00',3,14,2,2,109,'wl','General',0,NULL,NULL),(48,48,1,1,'2025-04-14 11:47:15','2025-05-01 00:00:00',3,14,2,2,110,'wl','General',0,NULL,NULL),(49,49,1,1,'2025-04-14 11:47:15','2025-05-01 00:00:00',3,14,2,2,111,'wl','General',0,NULL,NULL),(50,50,1,1,'2025-04-14 11:47:15','2025-05-01 00:00:00',3,14,2,2,112,'wl','General',0,NULL,NULL),(51,100,5,5,'2025-04-14 12:28:00','2025-05-01 00:00:00',3,14,2,22,1261,'cnf','Tatkal',0,NULL,NULL);
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_booking_insert` AFTER INSERT ON `booking` FOR EACH ROW BEGIN
    DECLARE v_AllocationID INT;

    
    SELECT IFNULL(MAX(AllocationID), 0) + 1 INTO v_AllocationID FROM SeatAllocation;

    
    INSERT INTO SeatAllocation (
        AllocationID, TrainID, ScheduleID, JourneyDate,
        CoachID, SeatID, SeatNumber, PassengerID,
        BookingID, ClassID, BookingStatusID,
        AllocationTime, LastUpdated
    )
    SELECT
        v_AllocationID, t.TrainID, t.ScheduleID, t.JourneyDate,
        t.CoachID, t.SeatID, s.SeatNumber, t.PassengerID,
        t.BookingID, t.ClassID, 1, 
        NOW(), NOW()
    FROM (
        SELECT
            NEW.TrainID, NEW.ScheduleID, NEW.JourneyDate,
            NEW.CoachID, NEW.SeatID, NEW.PassengerID,
            NEW.BookingID, NEW.ClassID
    ) t
    JOIN Seat s ON s.SeatID = t.SeatID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `bookingstatus`
--

DROP TABLE IF EXISTS `bookingstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookingstatus` (
  `StatusID` int NOT NULL,
  `StatusCode` varchar(20) DEFAULT NULL,
  `StatusName` varchar(25) DEFAULT NULL,
  `IsFinalStatus` tinyint(1) DEFAULT NULL,
  `IsRefundEligible` tinyint(1) DEFAULT NULL,
  `AllowsBoarding` tinyint(1) DEFAULT NULL,
  `CreatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`StatusID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookingstatus`
--

LOCK TABLES `bookingstatus` WRITE;
/*!40000 ALTER TABLE `bookingstatus` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookingstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class`
--

DROP TABLE IF EXISTS `class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `class` (
  `ClassID` int NOT NULL,
  `ClassCode` varchar(30) DEFAULT NULL,
  `ClassName` varchar(30) DEFAULT NULL,
  `IsReserved` tinyint(1) DEFAULT NULL,
  `FarePerKm` decimal(10,2) DEFAULT NULL,
  `MaxCapacity` int DEFAULT NULL,
  PRIMARY KEY (`ClassID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class`
--

LOCK TABLES `class` WRITE;
/*!40000 ALTER TABLE `class` DISABLE KEYS */;
INSERT INTO `class` VALUES (1,'SL','Sleeper',1,0.50,72),(2,'1A','AC First',1,3.00,24),(3,'2A','AC Second',1,2.00,48),(4,'3A','AC Third',1,1.50,64),(5,'CC','Chair car',1,1.00,78),(6,'GN','General',0,0.20,90),(7,'LG','Luggage',0,0.10,20);
/*!40000 ALTER TABLE `class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coach`
--

DROP TABLE IF EXISTS `coach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coach` (
  `CoachID` int NOT NULL,
  `TrainID` int DEFAULT NULL,
  `CoachNumber` varchar(20) DEFAULT NULL,
  `CoachCode` varchar(20) DEFAULT NULL,
  `CoachType` enum('Sleeper','AC First','AC Second','AC Third','Chair car','General','Luggage') DEFAULT NULL,
  `ClassID` int DEFAULT NULL,
  `TotalSeats` int DEFAULT NULL,
  `IsReserved` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`CoachID`),
  KEY `ClassID` (`ClassID`),
  KEY `TrainID` (`TrainID`),
  CONSTRAINT `coach_ibfk_1` FOREIGN KEY (`ClassID`) REFERENCES `class` (`ClassID`),
  CONSTRAINT `coach_ibfk_2` FOREIGN KEY (`TrainID`) REFERENCES `train` (`TrainID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coach`
--

LOCK TABLES `coach` WRITE;
/*!40000 ALTER TABLE `coach` DISABLE KEYS */;
INSERT INTO `coach` VALUES (1,1,'SL1','SL','Sleeper',1,60,1),(2,1,'1A2','1A','AC First',2,60,1),(3,1,'2A3','2A','AC Second',3,60,1),(4,1,'CC4','CC','Chair car',5,60,0),(5,1,'3A4','3A','AC Third',4,60,0),(6,2,'SL1','SL','Sleeper',1,60,1),(7,2,'1A2','1A','AC First',2,60,1),(8,2,'2A3','2A','AC Second',3,60,1),(9,2,'GN4','GN','General',6,60,0),(10,2,'LG5','LG','Luggage',7,60,0),(11,3,'SL1','SL','Sleeper',1,60,1),(12,3,'1A2','1A','AC First',2,60,1),(13,3,'2A3','2A','AC Second',3,60,1),(14,3,'GN4','GN','General',6,60,0),(15,3,'LG5','LG','Luggage',7,60,0),(16,4,'SL1','SL','Sleeper',1,60,1),(17,4,'1A2','1A','AC First',2,60,1),(18,4,'2A3','2A','AC Second',3,60,1),(19,4,'GN4','GN','General',6,60,0),(20,4,'LG5','LG','Luggage',7,60,0),(21,5,'SL1','SL','Sleeper',1,60,1),(22,5,'1A2','1A','AC First',2,60,1),(23,5,'2A3','2A','AC Second',3,60,1),(24,5,'GN4','GN','General',6,60,0),(25,5,'LG5','LG','Luggage',7,60,0);
/*!40000 ALTER TABLE `coach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `FeedbackID` int NOT NULL,
  `BookingID` int DEFAULT NULL,
  `Category` varchar(50) DEFAULT NULL,
  `Subject` enum('Service','Train','Station','App','Staff','Other') DEFAULT NULL,
  `Message` text,
  `Rating` int DEFAULT NULL,
  `SubmittedAt` datetime DEFAULT NULL,
  `FeedbackType` enum('Complaint','Suggestion','Praise','Query') DEFAULT NULL,
  PRIMARY KEY (`FeedbackID`),
  KEY `BookingID` (`BookingID`),
  CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`BookingID`) REFERENCES `booking` (`BookingID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passenger`
--

DROP TABLE IF EXISTS `passenger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `passenger` (
  `PassengerID` int NOT NULL,
  `Name` varchar(30) DEFAULT NULL,
  `Age` int DEFAULT NULL,
  `Gender` enum('Male','Female','Other') DEFAULT NULL,
  `Email` varchar(60) DEFAULT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  `Nationality` varchar(15) DEFAULT NULL,
  `PassengerType` enum('Adult','Child','Senior Citizen','Student') DEFAULT NULL,
  `DisabilityStatus` enum('YES','NO') DEFAULT NULL,
  PRIMARY KEY (`PassengerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passenger`
--

LOCK TABLES `passenger` WRITE;
/*!40000 ALTER TABLE `passenger` DISABLE KEYS */;
INSERT INTO `passenger` VALUES (1,'Raj Mehta',64,'Male','raj.mehta01@example.in','919812759037','Indian','Senior Citizen','NO'),(2,'Sneha Das',17,'Female','sneha.das02@example.in','917933239303','Indian','Student','YES'),(3,'Mohit Verma',90,'Male','mohit.verma03@example.in','918784996514','Indian','Senior Citizen','NO'),(4,'Nitin Mehta',86,'Male','nitin.mehta04@example.in','916578309734','Indian','Senior Citizen','NO'),(5,'Vikram Das',16,'Male','vikram.das05@example.in','916931846426','Indian','Student','NO'),(6,'Ravi Joshi',10,'Male','ravi.joshi06@example.in','917193674272','Indian','Child','NO'),(7,'Vikram Joshi',11,'Male','vikram.joshi07@example.in','919885884568','Indian','Child','NO'),(8,'Suresh Kumar',72,'Male','suresh.kumar08@example.in','913741268827','Indian','Senior Citizen','NO'),(9,'Arjun Sharma',17,'Male','arjun.sharma09@example.in','918225366892','Indian','Student','NO'),(10,'Sneha Gupta',22,'Female','sneha.gupta10@example.in','916224157080','Indian','Adult','NO'),(11,'Kavita Joshi',77,'Female','kavita.joshi11@example.in','914873788718','Indian','Senior Citizen','YES'),(12,'Suresh Sharma',9,'Male','suresh.sharma12@example.in','913046266055','Indian','Child','NO'),(13,'Kavita Sharma',84,'Female','kavita.sharma13@example.in','919809295306','Indian','Senior Citizen','NO'),(14,'Pooja Joshi',32,'Female','pooja.joshi14@example.in','919506558200','Indian','Adult','NO'),(15,'Ravi Patel',7,'Male','ravi.patel15@example.in','916369228330','Indian','Child','NO'),(16,'Amit Das',76,'Male','amit.das16@example.in','919226472163','Indian','Senior Citizen','NO'),(17,'Arjun Reddy',67,'Male','arjun.reddy17@example.in','917674108476','Indian','Senior Citizen','YES'),(18,'Mohit Gupta',24,'Male','mohit.gupta18@example.in','916919052014','Indian','Adult','NO'),(19,'Arjun Reddy',73,'Male','arjun.reddy19@example.in','914203987218','Indian','Senior Citizen','NO'),(20,'Sneha Verma',87,'Female','sneha.verma20@example.in','913749304790','Indian','Senior Citizen','NO'),(21,'Karan Patel',71,'Male','karan.patel21@example.in','919486376525','Indian','Senior Citizen','NO'),(22,'Raj Mehta',34,'Male','raj.mehta22@example.in','919427793377','Indian','Adult','NO'),(23,'Sneha Gupta',61,'Female','sneha.gupta23@example.in','916982397561','Indian','Senior Citizen','NO'),(24,'Ravi Sharma',84,'Male','ravi.sharma24@example.in','917107102417','Indian','Senior Citizen','NO'),(25,'Ritu Mehta',24,'Female','ritu.mehta25@example.in','915490178642','Indian','Adult','NO'),(26,'Sneha Das',13,'Female','sneha.das26@example.in','912906310417','Indian','Student','YES'),(27,'Rahul Patel',56,'Male','rahul.patel27@example.in','916088492045','Indian','Adult','NO'),(28,'Nisha Mehta',72,'Female','nisha.mehta28@example.in','914557078647','Indian','Senior Citizen','NO'),(29,'Neha Patel',80,'Female','neha.patel29@example.in','917596356891','Indian','Senior Citizen','NO'),(30,'Sunita Gupta',65,'Female','sunita.gupta30@example.in','917076879725','Indian','Senior Citizen','NO'),(31,'Arjun Gupta',89,'Male','arjun.gupta31@example.in','917200248281','Indian','Senior Citizen','NO'),(32,'Amit Patel',10,'Male','amit.patel32@example.in','918355445606','Indian','Child','NO'),(33,'Ritu Sharma',48,'Female','ritu.sharma33@example.in','914001194216','Indian','Adult','NO'),(34,'Meena Singh',72,'Female','meena.singh34@example.in','914600703348','Indian','Senior Citizen','NO'),(35,'Nisha Das',18,'Female','nisha.das35@example.in','912872124906','Indian','Student','NO'),(36,'Ravi Patel',40,'Male','ravi.patel36@example.in','914925033634','Indian','Adult','NO'),(37,'Suresh Patel',30,'Male','suresh.patel37@example.in','918783807383','Indian','Adult','NO'),(38,'Rahul Kumar',41,'Male','rahul.kumar38@example.in','913910398332','Indian','Adult','NO'),(39,'Amit Singh',17,'Male','amit.singh39@example.in','916059186856','Indian','Student','NO'),(40,'Mohit Das',52,'Male','mohit.das40@example.in','918567458827','Indian','Adult','NO'),(41,'Arjun Das',67,'Male','arjun.das41@example.in','918865342761','Indian','Senior Citizen','NO'),(42,'Ritu Joshi',32,'Female','ritu.joshi42@example.in','916096243471','Indian','Adult','NO'),(43,'Meena Mehta',84,'Female','meena.mehta43@example.in','914988372654','Indian','Senior Citizen','NO'),(44,'Ritu Kumar',40,'Female','ritu.kumar44@example.in','916774512756','Indian','Adult','NO'),(45,'Kavita Gupta',58,'Female','kavita.gupta45@example.in','913777222742','Indian','Adult','NO'),(46,'Anjali Gupta',50,'Female','anjali.gupta46@example.in','915247938830','Indian','Adult','NO'),(47,'Mohit Singh',44,'Male','mohit.singh47@example.in','916307105925','Indian','Adult','NO'),(48,'Suresh Reddy',79,'Male','suresh.reddy48@example.in','919050511154','Indian','Senior Citizen','NO'),(49,'Ravi Das',63,'Male','ravi.das49@example.in','912490572114','Indian','Senior Citizen','NO'),(50,'Rahul Joshi',18,'Male','rahul.joshi50@example.in','916914170640','Indian','Student','NO'),(51,'Karan Joshi',64,'Male','karan.joshi51@example.in','917224183129','Indian','Senior Citizen','NO'),(52,'Mohit Singh',35,'Male','mohit.singh52@example.in','912421179121','Indian','Adult','NO'),(53,'Rahul Das',27,'Male','rahul.das53@example.in','917091040262','Indian','Adult','NO'),(54,'Suresh Gupta',62,'Male','suresh.gupta54@example.in','912556865031','Indian','Senior Citizen','NO'),(55,'Sneha Singh',24,'Female','sneha.singh55@example.in','915733998602','Indian','Adult','NO'),(56,'Nitin Gupta',31,'Male','nitin.gupta56@example.in','913486206948','Indian','Adult','YES'),(57,'Nisha Sharma',88,'Female','nisha.sharma57@example.in','917613677023','Indian','Senior Citizen','NO'),(58,'Amit Sharma',46,'Male','amit.sharma58@example.in','919435707637','Indian','Adult','NO'),(59,'Priya Singh',83,'Female','priya.singh59@example.in','919985740433','Indian','Senior Citizen','NO'),(60,'Meena Sharma',19,'Female','meena.sharma60@example.in','919469028537','Indian','Student','NO'),(61,'Ravi Reddy',82,'Male','ravi.reddy61@example.in','912959479958','Indian','Senior Citizen','NO'),(62,'Nisha Das',25,'Female','nisha.das62@example.in','918029286171','Indian','Adult','NO'),(63,'Nitin Das',24,'Male','nitin.das63@example.in','915969414151','Indian','Adult','NO'),(64,'Suresh Reddy',26,'Male','suresh.reddy64@example.in','913497360057','Indian','Adult','NO'),(65,'Priya Joshi',62,'Female','priya.joshi65@example.in','913459788665','Indian','Senior Citizen','NO'),(66,'Pooja Gupta',13,'Female','pooja.gupta66@example.in','915507518090','Indian','Student','NO'),(67,'Suresh Sharma',3,'Male','suresh.sharma67@example.in','917733441158','Indian','Child','NO'),(68,'Suresh Gupta',67,'Male','suresh.gupta68@example.in','913991423461','Indian','Senior Citizen','NO'),(69,'Anjali Mehta',82,'Female','anjali.mehta69@example.in','914964399839','Indian','Senior Citizen','NO'),(70,'Kavita Das',77,'Female','kavita.das70@example.in','916196282577','Indian','Senior Citizen','NO'),(71,'Meena Verma',87,'Female','meena.verma71@example.in','914236809818','Indian','Senior Citizen','YES'),(72,'Ritu Sharma',56,'Female','ritu.sharma72@example.in','918046784147','Indian','Adult','NO'),(73,'Neha Das',17,'Female','neha.das73@example.in','915184165976','Indian','Student','NO'),(74,'Karan Reddy',76,'Male','karan.reddy74@example.in','917125077411','Indian','Senior Citizen','NO'),(75,'Karan Mehta',87,'Male','karan.mehta75@example.in','914916335125','Indian','Senior Citizen','YES'),(76,'Karan Singh',80,'Male','karan.singh76@example.in','917164736699','Indian','Senior Citizen','NO'),(77,'Vikram Verma',55,'Male','vikram.verma77@example.in','916742484455','Indian','Adult','NO'),(78,'Ravi Das',76,'Male','ravi.das78@example.in','912864863136','Indian','Senior Citizen','NO'),(79,'Neha Patel',64,'Female','neha.patel79@example.in','918426414850','Indian','Senior Citizen','NO'),(80,'Raj Gupta',12,'Male','raj.gupta80@example.in','918548175481','Indian','Child','NO'),(81,'Sunita Reddy',65,'Female','sunita.reddy81@example.in','915182637811','Indian','Senior Citizen','YES'),(82,'Rahul Patel',82,'Male','rahul.patel82@example.in','917381277061','Indian','Senior Citizen','NO'),(83,'Nitin Mehta',79,'Male','nitin.mehta83@example.in','917544001880','Indian','Senior Citizen','NO'),(84,'Sneha Patel',45,'Female','sneha.patel84@example.in','914530455352','Indian','Adult','NO'),(85,'Ravi Mehta',7,'Male','ravi.mehta85@example.in','919825881954','Indian','Child','NO'),(86,'Nitin Joshi',26,'Male','nitin.joshi86@example.in','916344112023','Indian','Adult','NO'),(87,'Amit Patel',71,'Male','amit.patel87@example.in','919357000852','Indian','Senior Citizen','NO'),(88,'Ravi Das',84,'Male','ravi.das88@example.in','915847502406','Indian','Senior Citizen','NO'),(89,'Nitin Das',24,'Male','nitin.das89@example.in','914326434312','Indian','Adult','NO'),(90,'Neha Sharma',36,'Female','neha.sharma90@example.in','917145991173','Indian','Adult','NO'),(91,'Kavita Joshi',33,'Female','kavita.joshi91@example.in','917346605362','Indian','Adult','NO'),(92,'Suresh Mehta',24,'Male','suresh.mehta92@example.in','919917018756','Indian','Adult','NO'),(93,'Ritu Kumar',42,'Female','ritu.kumar93@example.in','914378215549','Indian','Adult','NO'),(94,'Kavita Patel',58,'Female','kavita.patel94@example.in','917632801939','Indian','Adult','NO'),(95,'Raj Reddy',43,'Male','raj.reddy95@example.in','916244414766','Indian','Adult','NO'),(96,'Nitin Das',39,'Male','nitin.das96@example.in','912479600208','Indian','Adult','NO'),(97,'Amit Reddy',1,'Male','amit.reddy97@example.in','919739503906','Indian','Child','NO'),(98,'Nitin Mehta',54,'Male','nitin.mehta98@example.in','914433768702','Indian','Adult','NO'),(99,'Karan Kumar',56,'Male','karan.kumar99@example.in','918469021042','Indian','Adult','NO'),(100,'Vikram Reddy',70,'Male','vikram.reddy100@example.in','915780342732','Indian','Senior Citizen','NO');
/*!40000 ALTER TABLE `passenger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `PaymentID` int NOT NULL,
  `BookingID` int DEFAULT NULL,
  `PaymentDate` datetime DEFAULT NULL,
  `PaymentTime` time DEFAULT NULL,
  `AmountPaid` decimal(10,0) DEFAULT NULL,
  `PaymentMethod` varchar(30) DEFAULT NULL,
  `PaymentGateway` varchar(30) DEFAULT NULL,
  `TransactionID` varchar(40) DEFAULT NULL,
  `PaymentStatus` enum('Success','Failed','Pending','Cancelled') DEFAULT NULL,
  `IsRefundable` tinyint(1) DEFAULT NULL,
  `RefundStatus` enum('Not Initiated','In process','Refunded','Rejected') DEFAULT NULL,
  `RefundAmount` decimal(10,0) DEFAULT NULL,
  `RefundProcessedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`PaymentID`),
  KEY `BookingID` (`BookingID`),
  CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`BookingID`) REFERENCES `booking` (`BookingID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,1,'2025-04-14 12:06:01','12:06:01',1345,'Credit Card','VISA','TXN9874521','Success',1,'Not Initiated',0,NULL),(2,51,'2025-04-14 12:30:59','12:30:59',1340,'UPI','GooglePay','TRI1023521','Success',0,'Not Initiated',0,NULL);
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `route`
--

DROP TABLE IF EXISTS `route`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `route` (
  `RouteID` int NOT NULL,
  `TrainID` int DEFAULT NULL,
  `StationID` int DEFAULT NULL,
  `SequenceNumber` int DEFAULT NULL,
  `ArrivalTime` time DEFAULT NULL,
  `DepartureTime` time DEFAULT NULL,
  `HaltTime` int DEFAULT NULL,
  `DistanceFromSource` decimal(10,0) DEFAULT NULL,
  `PlatformNumber` int DEFAULT NULL,
  `IsSource` tinyint(1) DEFAULT NULL,
  `IsDestination` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`RouteID`),
  KEY `TrainID` (`TrainID`),
  KEY `StationID` (`StationID`),
  CONSTRAINT `route_ibfk_1` FOREIGN KEY (`TrainID`) REFERENCES `train` (`TrainID`),
  CONSTRAINT `route_ibfk_2` FOREIGN KEY (`StationID`) REFERENCES `station` (`StationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `route`
--

LOCK TABLES `route` WRITE;
/*!40000 ALTER TABLE `route` DISABLE KEYS */;
INSERT INTO `route` VALUES (1,1,3,1,'06:00:00','06:00:00',0,0,3,1,0),(2,1,4,2,'07:30:00','07:40:00',10,86,1,0,0),(3,1,6,3,'09:00:00','09:06:00',6,141,4,0,0),(4,1,10,4,'10:30:00','10:35:00',5,190,2,0,0),(5,1,12,5,'12:00:00','12:10:00',10,238,2,0,0),(6,1,14,6,'13:30:00','13:30:00',0,260,1,0,1),(7,2,1,1,'06:00:00','06:00:00',0,0,3,1,0),(8,2,8,2,'07:30:00','07:33:00',3,55,5,0,0),(9,2,12,3,'09:00:00','09:08:00',8,97,1,0,0),(10,2,14,4,'10:30:00','10:35:00',5,175,4,0,0),(11,2,18,5,'12:00:00','12:00:00',0,226,4,0,1),(12,3,1,1,'06:00:00','06:00:00',0,0,1,1,0),(13,3,2,2,'07:30:00','07:35:00',5,77,1,0,0),(14,3,8,3,'09:00:00','09:07:00',7,130,5,0,0),(15,3,10,4,'10:30:00','10:35:00',5,164,5,0,0),(16,3,11,5,'12:00:00','12:08:00',8,248,3,0,0),(17,3,12,6,'13:30:00','13:30:00',0,283,4,0,1),(18,4,2,1,'06:00:00','06:00:00',0,0,1,1,0),(19,4,3,2,'07:30:00','07:33:00',3,52,3,0,0),(20,4,12,3,'09:00:00','09:09:00',9,75,3,0,0),(21,4,13,4,'10:30:00','10:39:00',9,156,4,0,0),(22,4,14,5,'12:00:00','12:00:00',0,199,1,0,1),(23,5,5,1,'06:00:00','06:00:00',0,0,3,1,0),(24,5,6,2,'07:30:00','07:34:00',4,62,2,0,0),(25,5,8,3,'09:00:00','09:03:00',3,106,5,0,0),(26,5,14,4,'10:30:00','10:40:00',10,160,3,0,0),(27,5,20,5,'12:00:00','12:00:00',0,253,4,0,1);
/*!40000 ALTER TABLE `route` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedule` (
  `ScheduleID` int NOT NULL,
  `TrainID` int DEFAULT NULL,
  `DaysOfOperation` varchar(50) DEFAULT NULL,
  `FrequencyType` enum('Daily','Weekly','BiWeekly','Special') DEFAULT NULL,
  `DepartureStationID` int DEFAULT NULL,
  `ArrivalStationID` int DEFAULT NULL,
  `DepartureTime` time DEFAULT NULL,
  `ArrivalTime` time DEFAULT NULL,
  `JourneyDuration` varchar(20) DEFAULT NULL,
  `RouteID` int DEFAULT NULL,
  PRIMARY KEY (`ScheduleID`),
  KEY `TrainID` (`TrainID`),
  KEY `DepartureStationID` (`DepartureStationID`),
  KEY `ArrivalStationID` (`ArrivalStationID`),
  KEY `RouteID` (`RouteID`),
  CONSTRAINT `schedule_ibfk_1` FOREIGN KEY (`TrainID`) REFERENCES `train` (`TrainID`),
  CONSTRAINT `schedule_ibfk_2` FOREIGN KEY (`DepartureStationID`) REFERENCES `station` (`StationID`),
  CONSTRAINT `schedule_ibfk_3` FOREIGN KEY (`ArrivalStationID`) REFERENCES `station` (`StationID`),
  CONSTRAINT `schedule_ibfk_4` FOREIGN KEY (`RouteID`) REFERENCES `route` (`RouteID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
INSERT INTO `schedule` VALUES (1,1,'Mon,Tue','Special',3,1,'10:00:00','22:00:00','12:00:00',1),(2,2,'Mon,Tue','Weekly',2,6,'09:45:00','13:45:00','4:00:00',2),(3,3,'Fri,Sat','BiWeekly',1,6,'14:15:00','01:15:00','11:00:00',3),(4,4,'Mon,Sat','Special',4,7,'22:30:00','02:30:00','4:00:00',4),(5,5,'Mon,Tue,Wed,Thu,Fri,Sat,Sun','Daily',1,2,'05:15:00','11:15:00','6:00:00',5);
/*!40000 ALTER TABLE `schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seat`
--

DROP TABLE IF EXISTS `seat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seat` (
  `SeatID` int NOT NULL,
  `CoachID` int DEFAULT NULL,
  `SeatNumber` varchar(10) DEFAULT NULL,
  `ClassID` int DEFAULT NULL,
  `IsAvailable` tinyint(1) DEFAULT NULL,
  `BookingID` int DEFAULT NULL,
  `SeatType` enum('Lower','Middle','Upper','Side Lower','Side Upper') DEFAULT NULL,
  `Position` enum('Window','Middle','Aisle') DEFAULT NULL,
  `IsReserved` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`SeatID`),
  KEY `CoachID` (`CoachID`),
  KEY `ClassID` (`ClassID`),
  CONSTRAINT `seat_ibfk_1` FOREIGN KEY (`CoachID`) REFERENCES `coach` (`CoachID`),
  CONSTRAINT `seat_ibfk_2` FOREIGN KEY (`ClassID`) REFERENCES `class` (`ClassID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seat`
--

LOCK TABLES `seat` WRITE;
/*!40000 ALTER TABLE `seat` DISABLE KEYS */;
INSERT INTO `seat` VALUES (1,1,'S1',1,1,NULL,'Lower','Window',0),(2,1,'S2',1,1,NULL,'Middle','Middle',0),(3,1,'S3',1,1,NULL,'Upper','Aisle',0),(4,1,'S4',1,1,NULL,'Side Lower','Window',0),(5,1,'S5',1,1,NULL,'Side Upper','Middle',0),(6,1,'S6',1,1,NULL,'Lower','Aisle',0),(7,1,'S7',1,1,NULL,'Middle','Window',0),(8,1,'S8',1,1,NULL,'Upper','Middle',0),(9,1,'S9',1,1,NULL,'Side Lower','Aisle',0),(10,1,'S10',1,1,NULL,'Side Upper','Window',0),(11,1,'S11',1,1,NULL,'Lower','Middle',0),(12,1,'S12',1,1,NULL,'Middle','Aisle',0),(13,1,'S13',1,1,NULL,'Upper','Window',0),(14,1,'S14',1,1,NULL,'Side Lower','Middle',0),(15,1,'S15',1,1,NULL,'Side Upper','Aisle',0),(16,1,'S16',1,1,NULL,'Lower','Window',0),(17,1,'S17',1,1,NULL,'Middle','Middle',0),(18,1,'S18',1,1,NULL,'Upper','Aisle',0),(19,1,'S19',1,1,NULL,'Side Lower','Window',0),(20,1,'S20',1,1,NULL,'Side Upper','Middle',0),(21,1,'S21',1,1,NULL,'Lower','Aisle',0),(22,1,'S22',1,1,NULL,'Middle','Window',0),(23,1,'S23',1,1,NULL,'Upper','Middle',0),(24,1,'S24',1,1,NULL,'Side Lower','Aisle',0),(25,1,'S25',1,1,NULL,'Side Upper','Window',0),(26,1,'S26',1,1,NULL,'Lower','Middle',0),(27,1,'S27',1,1,NULL,'Middle','Aisle',0),(28,1,'S28',1,1,NULL,'Upper','Window',0),(29,1,'S29',1,1,NULL,'Side Lower','Middle',0),(30,1,'S30',1,1,NULL,'Side Upper','Aisle',0),(31,1,'S31',1,1,NULL,'Lower','Window',0),(32,1,'S32',1,1,NULL,'Middle','Middle',0),(33,1,'S33',1,1,NULL,'Upper','Aisle',0),(34,1,'S34',1,1,NULL,'Side Lower','Window',0),(35,1,'S35',1,1,NULL,'Side Upper','Middle',0),(36,1,'S36',1,1,NULL,'Lower','Aisle',0),(37,1,'S37',1,1,NULL,'Middle','Window',0),(38,1,'S38',1,1,NULL,'Upper','Middle',0),(39,1,'S39',1,1,NULL,'Side Lower','Aisle',0),(40,1,'S40',1,1,NULL,'Side Upper','Window',0),(41,1,'S41',1,1,NULL,'Lower','Middle',0),(42,1,'S42',1,1,NULL,'Middle','Aisle',0),(43,1,'S43',1,1,NULL,'Upper','Window',0),(44,1,'S44',1,1,NULL,'Side Lower','Middle',0),(45,1,'S45',1,1,NULL,'Side Upper','Aisle',0),(46,1,'S46',1,1,NULL,'Lower','Window',0),(47,1,'S47',1,1,NULL,'Middle','Middle',0),(48,1,'S48',1,1,NULL,'Upper','Aisle',0),(49,1,'S49',1,1,NULL,'Side Lower','Window',0),(50,1,'S50',1,1,NULL,'Side Upper','Middle',0),(51,1,'S51',1,1,NULL,'Lower','Aisle',0),(52,1,'S52',1,1,NULL,'Middle','Window',0),(53,1,'S53',1,1,NULL,'Upper','Middle',0),(54,1,'S54',1,1,NULL,'Side Lower','Aisle',0),(55,1,'S55',1,1,NULL,'Side Upper','Window',0),(56,1,'S56',1,1,NULL,'Lower','Middle',0),(57,1,'S57',1,1,NULL,'Middle','Aisle',0),(58,1,'S58',1,1,NULL,'Upper','Window',0),(59,1,'S59',1,1,NULL,'Side Lower','Middle',0),(60,1,'S60',1,1,NULL,'Side Upper','Aisle',0),(61,2,'S1',2,0,NULL,'Lower','Window',0),(62,2,'S2',2,0,NULL,'Middle','Middle',0),(63,2,'S3',2,0,NULL,'Upper','Aisle',0),(64,2,'S4',2,0,NULL,'Side Lower','Window',0),(65,2,'S5',2,0,NULL,'Side Upper','Middle',0),(66,2,'S6',2,0,NULL,'Lower','Aisle',0),(67,2,'S7',2,0,NULL,'Middle','Window',0),(68,2,'S8',2,0,NULL,'Upper','Middle',0),(69,2,'S9',2,0,NULL,'Side Lower','Aisle',0),(70,2,'S10',2,0,NULL,'Side Upper','Window',0),(71,2,'S11',2,0,NULL,'Lower','Middle',0),(72,2,'S12',2,0,NULL,'Middle','Aisle',0),(73,2,'S13',2,0,NULL,'Upper','Window',0),(74,2,'S14',2,0,NULL,'Side Lower','Middle',0),(75,2,'S15',2,0,NULL,'Side Upper','Aisle',0),(76,2,'S16',2,0,NULL,'Lower','Window',0),(77,2,'S17',2,0,NULL,'Middle','Middle',0),(78,2,'S18',2,0,NULL,'Upper','Aisle',0),(79,2,'S19',2,0,NULL,'Side Lower','Window',0),(80,2,'S20',2,0,NULL,'Side Upper','Middle',0),(81,2,'S21',2,0,NULL,'Lower','Aisle',0),(82,2,'S22',2,0,NULL,'Middle','Window',0),(83,2,'S23',2,0,NULL,'Upper','Middle',0),(84,2,'S24',2,0,NULL,'Side Lower','Aisle',0),(85,2,'S25',2,0,NULL,'Side Upper','Window',0),(86,2,'S26',2,0,NULL,'Lower','Middle',0),(87,2,'S27',2,0,NULL,'Middle','Aisle',0),(88,2,'S28',2,0,NULL,'Upper','Window',0),(89,2,'S29',2,0,NULL,'Side Lower','Middle',0),(90,2,'S30',2,0,NULL,'Side Upper','Aisle',0),(91,2,'S31',2,0,NULL,'Lower','Window',0),(92,2,'S32',2,0,NULL,'Middle','Middle',0),(93,2,'S33',2,0,NULL,'Upper','Aisle',0),(94,2,'S34',2,0,NULL,'Side Lower','Window',0),(95,2,'S35',2,0,NULL,'Side Upper','Middle',0),(96,2,'S36',2,0,NULL,'Lower','Aisle',0),(97,2,'S37',2,0,NULL,'Middle','Window',0),(98,2,'S38',2,0,NULL,'Upper','Middle',0),(99,2,'S39',2,0,NULL,'Side Lower','Aisle',0),(100,2,'S40',2,0,NULL,'Side Upper','Window',0),(101,2,'S41',2,0,NULL,'Lower','Middle',0),(102,2,'S42',2,0,NULL,'Middle','Aisle',0),(103,2,'S43',2,0,NULL,'Upper','Window',0),(104,2,'S44',2,0,NULL,'Side Lower','Middle',0),(105,2,'S45',2,0,NULL,'Side Upper','Aisle',0),(106,2,'S46',2,0,NULL,'Lower','Window',0),(107,2,'S47',2,0,NULL,'Middle','Middle',0),(108,2,'S48',2,0,NULL,'Upper','Aisle',0),(109,2,'S49',2,0,NULL,'Side Lower','Window',0),(110,2,'S50',2,0,NULL,'Side Upper','Middle',0),(111,2,'S51',2,0,NULL,'Lower','Aisle',0),(112,2,'S52',2,0,NULL,'Middle','Window',0),(113,2,'S53',2,1,NULL,'Upper','Middle',0),(114,2,'S54',2,1,NULL,'Side Lower','Aisle',0),(115,2,'S55',2,1,NULL,'Side Upper','Window',0),(116,2,'S56',2,1,NULL,'Lower','Middle',0),(117,2,'S57',2,1,NULL,'Middle','Aisle',0),(118,2,'S58',2,1,NULL,'Upper','Window',0),(119,2,'S59',2,1,NULL,'Side Lower','Middle',0),(120,2,'S60',2,1,NULL,'Side Upper','Aisle',0),(121,3,'S1',3,1,NULL,'Lower','Window',0),(122,3,'S2',3,1,NULL,'Middle','Middle',0),(123,3,'S3',3,1,NULL,'Upper','Aisle',0),(124,3,'S4',3,1,NULL,'Side Lower','Window',0),(125,3,'S5',3,1,NULL,'Side Upper','Middle',0),(126,3,'S6',3,1,NULL,'Lower','Aisle',0),(127,3,'S7',3,1,NULL,'Middle','Window',0),(128,3,'S8',3,1,NULL,'Upper','Middle',0),(129,3,'S9',3,1,NULL,'Side Lower','Aisle',0),(130,3,'S10',3,1,NULL,'Side Upper','Window',0),(131,3,'S11',3,1,NULL,'Lower','Middle',0),(132,3,'S12',3,1,NULL,'Middle','Aisle',0),(133,3,'S13',3,1,NULL,'Upper','Window',0),(134,3,'S14',3,1,NULL,'Side Lower','Middle',0),(135,3,'S15',3,1,NULL,'Side Upper','Aisle',0),(136,3,'S16',3,1,NULL,'Lower','Window',0),(137,3,'S17',3,1,NULL,'Middle','Middle',0),(138,3,'S18',3,1,NULL,'Upper','Aisle',0),(139,3,'S19',3,1,NULL,'Side Lower','Window',0),(140,3,'S20',3,1,NULL,'Side Upper','Middle',0),(141,3,'S21',3,1,NULL,'Lower','Aisle',0),(142,3,'S22',3,1,NULL,'Middle','Window',0),(143,3,'S23',3,1,NULL,'Upper','Middle',0),(144,3,'S24',3,1,NULL,'Side Lower','Aisle',0),(145,3,'S25',3,1,NULL,'Side Upper','Window',0),(146,3,'S26',3,1,NULL,'Lower','Middle',0),(147,3,'S27',3,1,NULL,'Middle','Aisle',0),(148,3,'S28',3,1,NULL,'Upper','Window',0),(149,3,'S29',3,1,NULL,'Side Lower','Middle',0),(150,3,'S30',3,1,NULL,'Side Upper','Aisle',0),(151,3,'S31',3,1,NULL,'Lower','Window',0),(152,3,'S32',3,1,NULL,'Middle','Middle',0),(153,3,'S33',3,1,NULL,'Upper','Aisle',0),(154,3,'S34',3,1,NULL,'Side Lower','Window',0),(155,3,'S35',3,1,NULL,'Side Upper','Middle',0),(156,3,'S36',3,1,NULL,'Lower','Aisle',0),(157,3,'S37',3,1,NULL,'Middle','Window',0),(158,3,'S38',3,1,NULL,'Upper','Middle',0),(159,3,'S39',3,1,NULL,'Side Lower','Aisle',0),(160,3,'S40',3,1,NULL,'Side Upper','Window',0),(161,3,'S41',3,1,NULL,'Lower','Middle',0),(162,3,'S42',3,1,NULL,'Middle','Aisle',0),(163,3,'S43',3,1,NULL,'Upper','Window',0),(164,3,'S44',3,1,NULL,'Side Lower','Middle',0),(165,3,'S45',3,1,NULL,'Side Upper','Aisle',0),(166,3,'S46',3,1,NULL,'Lower','Window',0),(167,3,'S47',3,1,NULL,'Middle','Middle',0),(168,3,'S48',3,1,NULL,'Upper','Aisle',0),(169,3,'S49',3,1,NULL,'Side Lower','Window',0),(170,3,'S50',3,1,NULL,'Side Upper','Middle',0),(171,3,'S51',3,1,NULL,'Lower','Aisle',0),(172,3,'S52',3,1,NULL,'Middle','Window',0),(173,3,'S53',3,1,NULL,'Upper','Middle',0),(174,3,'S54',3,1,NULL,'Side Lower','Aisle',0),(175,3,'S55',3,1,NULL,'Side Upper','Window',0),(176,3,'S56',3,1,NULL,'Lower','Middle',0),(177,3,'S57',3,1,NULL,'Middle','Aisle',0),(178,3,'S58',3,1,NULL,'Upper','Window',0),(179,3,'S59',3,1,NULL,'Side Lower','Middle',0),(180,3,'S60',3,1,NULL,'Side Upper','Aisle',0),(181,4,'S1',5,1,NULL,'Lower','Window',0),(182,4,'S2',5,1,NULL,'Middle','Middle',0),(183,4,'S3',5,1,NULL,'Upper','Aisle',0),(184,4,'S4',5,1,NULL,'Side Lower','Window',0),(185,4,'S5',5,1,NULL,'Side Upper','Middle',0),(186,4,'S6',5,1,NULL,'Lower','Aisle',0),(187,4,'S7',5,1,NULL,'Middle','Window',0),(188,4,'S8',5,1,NULL,'Upper','Middle',0),(189,4,'S9',5,1,NULL,'Side Lower','Aisle',0),(190,4,'S10',5,1,NULL,'Side Upper','Window',0),(191,4,'S11',5,1,NULL,'Lower','Middle',0),(192,4,'S12',5,1,NULL,'Middle','Aisle',0),(193,4,'S13',5,1,NULL,'Upper','Window',0),(194,4,'S14',5,1,NULL,'Side Lower','Middle',0),(195,4,'S15',5,1,NULL,'Side Upper','Aisle',0),(196,4,'S16',5,1,NULL,'Lower','Window',0),(197,4,'S17',5,1,NULL,'Middle','Middle',0),(198,4,'S18',5,1,NULL,'Upper','Aisle',0),(199,4,'S19',5,1,NULL,'Side Lower','Window',0),(200,4,'S20',5,1,NULL,'Side Upper','Middle',0),(201,4,'S21',5,1,NULL,'Lower','Aisle',0),(202,4,'S22',5,1,NULL,'Middle','Window',0),(203,4,'S23',5,1,NULL,'Upper','Middle',0),(204,4,'S24',5,1,NULL,'Side Lower','Aisle',0),(205,4,'S25',5,1,NULL,'Side Upper','Window',0),(206,4,'S26',5,1,NULL,'Lower','Middle',0),(207,4,'S27',5,1,NULL,'Middle','Aisle',0),(208,4,'S28',5,1,NULL,'Upper','Window',0),(209,4,'S29',5,1,NULL,'Side Lower','Middle',0),(210,4,'S30',5,1,NULL,'Side Upper','Aisle',0),(211,4,'S31',5,1,NULL,'Lower','Window',0),(212,4,'S32',5,1,NULL,'Middle','Middle',0),(213,4,'S33',5,1,NULL,'Upper','Aisle',0),(214,4,'S34',5,1,NULL,'Side Lower','Window',0),(215,4,'S35',5,1,NULL,'Side Upper','Middle',0),(216,4,'S36',5,1,NULL,'Lower','Aisle',0),(217,4,'S37',5,1,NULL,'Middle','Window',0),(218,4,'S38',5,1,NULL,'Upper','Middle',0),(219,4,'S39',5,1,NULL,'Side Lower','Aisle',0),(220,4,'S40',5,1,NULL,'Side Upper','Window',0),(221,4,'S41',5,1,NULL,'Lower','Middle',0),(222,4,'S42',5,1,NULL,'Middle','Aisle',0),(223,4,'S43',5,1,NULL,'Upper','Window',0),(224,4,'S44',5,1,NULL,'Side Lower','Middle',0),(225,4,'S45',5,1,NULL,'Side Upper','Aisle',0),(226,4,'S46',5,1,NULL,'Lower','Window',0),(227,4,'S47',5,1,NULL,'Middle','Middle',0),(228,4,'S48',5,1,NULL,'Upper','Aisle',0),(229,4,'S49',5,1,NULL,'Side Lower','Window',0),(230,4,'S50',5,1,NULL,'Side Upper','Middle',0),(231,4,'S51',5,1,NULL,'Lower','Aisle',0),(232,4,'S52',5,1,NULL,'Middle','Window',0),(233,4,'S53',5,1,NULL,'Upper','Middle',0),(234,4,'S54',5,1,NULL,'Side Lower','Aisle',0),(235,4,'S55',5,1,NULL,'Side Upper','Window',0),(236,4,'S56',5,1,NULL,'Lower','Middle',0),(237,4,'S57',5,1,NULL,'Middle','Aisle',0),(238,4,'S58',5,1,NULL,'Upper','Window',0),(239,4,'S59',5,1,NULL,'Side Lower','Middle',0),(240,4,'S60',5,1,NULL,'Side Upper','Aisle',0),(241,5,'S1',4,1,NULL,'Lower','Window',0),(242,5,'S2',4,1,NULL,'Middle','Middle',0),(243,5,'S3',4,1,NULL,'Upper','Aisle',0),(244,5,'S4',4,1,NULL,'Side Lower','Window',0),(245,5,'S5',4,1,NULL,'Side Upper','Middle',0),(246,5,'S6',4,1,NULL,'Lower','Aisle',0),(247,5,'S7',4,1,NULL,'Middle','Window',0),(248,5,'S8',4,1,NULL,'Upper','Middle',0),(249,5,'S9',4,1,NULL,'Side Lower','Aisle',0),(250,5,'S10',4,1,NULL,'Side Upper','Window',0),(251,5,'S11',4,1,NULL,'Lower','Middle',0),(252,5,'S12',4,1,NULL,'Middle','Aisle',0),(253,5,'S13',4,1,NULL,'Upper','Window',0),(254,5,'S14',4,1,NULL,'Side Lower','Middle',0),(255,5,'S15',4,1,NULL,'Side Upper','Aisle',0),(256,5,'S16',4,1,NULL,'Lower','Window',0),(257,5,'S17',4,1,NULL,'Middle','Middle',0),(258,5,'S18',4,1,NULL,'Upper','Aisle',0),(259,5,'S19',4,1,NULL,'Side Lower','Window',0),(260,5,'S20',4,1,NULL,'Side Upper','Middle',0),(261,5,'S21',4,1,NULL,'Lower','Aisle',0),(262,5,'S22',4,1,NULL,'Middle','Window',0),(263,5,'S23',4,1,NULL,'Upper','Middle',0),(264,5,'S24',4,1,NULL,'Side Lower','Aisle',0),(265,5,'S25',4,1,NULL,'Side Upper','Window',0),(266,5,'S26',4,1,NULL,'Lower','Middle',0),(267,5,'S27',4,1,NULL,'Middle','Aisle',0),(268,5,'S28',4,1,NULL,'Upper','Window',0),(269,5,'S29',4,1,NULL,'Side Lower','Middle',0),(270,5,'S30',4,1,NULL,'Side Upper','Aisle',0),(271,5,'S31',4,1,NULL,'Lower','Window',0),(272,5,'S32',4,1,NULL,'Middle','Middle',0),(273,5,'S33',4,1,NULL,'Upper','Aisle',0),(274,5,'S34',4,1,NULL,'Side Lower','Window',0),(275,5,'S35',4,1,NULL,'Side Upper','Middle',0),(276,5,'S36',4,1,NULL,'Lower','Aisle',0),(277,5,'S37',4,1,NULL,'Middle','Window',0),(278,5,'S38',4,1,NULL,'Upper','Middle',0),(279,5,'S39',4,1,NULL,'Side Lower','Aisle',0),(280,5,'S40',4,1,NULL,'Side Upper','Window',0),(281,5,'S41',4,1,NULL,'Lower','Middle',0),(282,5,'S42',4,1,NULL,'Middle','Aisle',0),(283,5,'S43',4,1,NULL,'Upper','Window',0),(284,5,'S44',4,1,NULL,'Side Lower','Middle',0),(285,5,'S45',4,1,NULL,'Side Upper','Aisle',0),(286,5,'S46',4,1,NULL,'Lower','Window',0),(287,5,'S47',4,1,NULL,'Middle','Middle',0),(288,5,'S48',4,1,NULL,'Upper','Aisle',0),(289,5,'S49',4,1,NULL,'Side Lower','Window',0),(290,5,'S50',4,1,NULL,'Side Upper','Middle',0),(291,5,'S51',4,1,NULL,'Lower','Aisle',0),(292,5,'S52',4,1,NULL,'Middle','Window',0),(293,5,'S53',4,1,NULL,'Upper','Middle',0),(294,5,'S54',4,1,NULL,'Side Lower','Aisle',0),(295,5,'S55',4,1,NULL,'Side Upper','Window',0),(296,5,'S56',4,1,NULL,'Lower','Middle',0),(297,5,'S57',4,1,NULL,'Middle','Aisle',0),(298,5,'S58',4,1,NULL,'Upper','Window',0),(299,5,'S59',4,1,NULL,'Side Lower','Middle',0),(300,5,'S60',4,1,NULL,'Side Upper','Aisle',0),(301,6,'S1',1,1,NULL,'Lower','Window',0),(302,6,'S2',1,1,NULL,'Middle','Middle',0),(303,6,'S3',1,1,NULL,'Upper','Aisle',0),(304,6,'S4',1,1,NULL,'Side Lower','Window',0),(305,6,'S5',1,1,NULL,'Side Upper','Middle',0),(306,6,'S6',1,1,NULL,'Lower','Aisle',0),(307,6,'S7',1,1,NULL,'Middle','Window',0),(308,6,'S8',1,1,NULL,'Upper','Middle',0),(309,6,'S9',1,1,NULL,'Side Lower','Aisle',0),(310,6,'S10',1,1,NULL,'Side Upper','Window',0),(311,6,'S11',1,1,NULL,'Lower','Middle',0),(312,6,'S12',1,1,NULL,'Middle','Aisle',0),(313,6,'S13',1,1,NULL,'Upper','Window',0),(314,6,'S14',1,1,NULL,'Side Lower','Middle',0),(315,6,'S15',1,1,NULL,'Side Upper','Aisle',0),(316,6,'S16',1,1,NULL,'Lower','Window',0),(317,6,'S17',1,1,NULL,'Middle','Middle',0),(318,6,'S18',1,1,NULL,'Upper','Aisle',0),(319,6,'S19',1,1,NULL,'Side Lower','Window',0),(320,6,'S20',1,1,NULL,'Side Upper','Middle',0),(321,6,'S21',1,1,NULL,'Lower','Aisle',0),(322,6,'S22',1,1,NULL,'Middle','Window',0),(323,6,'S23',1,1,NULL,'Upper','Middle',0),(324,6,'S24',1,1,NULL,'Side Lower','Aisle',0),(325,6,'S25',1,1,NULL,'Side Upper','Window',0),(326,6,'S26',1,1,NULL,'Lower','Middle',0),(327,6,'S27',1,1,NULL,'Middle','Aisle',0),(328,6,'S28',1,1,NULL,'Upper','Window',0),(329,6,'S29',1,1,NULL,'Side Lower','Middle',0),(330,6,'S30',1,1,NULL,'Side Upper','Aisle',0),(331,6,'S31',1,1,NULL,'Lower','Window',0),(332,6,'S32',1,1,NULL,'Middle','Middle',0),(333,6,'S33',1,1,NULL,'Upper','Aisle',0),(334,6,'S34',1,1,NULL,'Side Lower','Window',0),(335,6,'S35',1,1,NULL,'Side Upper','Middle',0),(336,6,'S36',1,1,NULL,'Lower','Aisle',0),(337,6,'S37',1,1,NULL,'Middle','Window',0),(338,6,'S38',1,1,NULL,'Upper','Middle',0),(339,6,'S39',1,1,NULL,'Side Lower','Aisle',0),(340,6,'S40',1,1,NULL,'Side Upper','Window',0),(341,6,'S41',1,1,NULL,'Lower','Middle',0),(342,6,'S42',1,1,NULL,'Middle','Aisle',0),(343,6,'S43',1,1,NULL,'Upper','Window',0),(344,6,'S44',1,1,NULL,'Side Lower','Middle',0),(345,6,'S45',1,1,NULL,'Side Upper','Aisle',0),(346,6,'S46',1,1,NULL,'Lower','Window',0),(347,6,'S47',1,1,NULL,'Middle','Middle',0),(348,6,'S48',1,1,NULL,'Upper','Aisle',0),(349,6,'S49',1,1,NULL,'Side Lower','Window',0),(350,6,'S50',1,1,NULL,'Side Upper','Middle',0),(351,6,'S51',1,1,NULL,'Lower','Aisle',0),(352,6,'S52',1,1,NULL,'Middle','Window',0),(353,6,'S53',1,1,NULL,'Upper','Middle',0),(354,6,'S54',1,1,NULL,'Side Lower','Aisle',0),(355,6,'S55',1,1,NULL,'Side Upper','Window',0),(356,6,'S56',1,1,NULL,'Lower','Middle',0),(357,6,'S57',1,1,NULL,'Middle','Aisle',0),(358,6,'S58',1,1,NULL,'Upper','Window',0),(359,6,'S59',1,1,NULL,'Side Lower','Middle',0),(360,6,'S60',1,1,NULL,'Side Upper','Aisle',0),(361,7,'S1',2,1,NULL,'Lower','Window',0),(362,7,'S2',2,1,NULL,'Middle','Middle',0),(363,7,'S3',2,1,NULL,'Upper','Aisle',0),(364,7,'S4',2,1,NULL,'Side Lower','Window',0),(365,7,'S5',2,1,NULL,'Side Upper','Middle',0),(366,7,'S6',2,1,NULL,'Lower','Aisle',0),(367,7,'S7',2,1,NULL,'Middle','Window',0),(368,7,'S8',2,1,NULL,'Upper','Middle',0),(369,7,'S9',2,1,NULL,'Side Lower','Aisle',0),(370,7,'S10',2,1,NULL,'Side Upper','Window',0),(371,7,'S11',2,1,NULL,'Lower','Middle',0),(372,7,'S12',2,1,NULL,'Middle','Aisle',0),(373,7,'S13',2,1,NULL,'Upper','Window',0),(374,7,'S14',2,1,NULL,'Side Lower','Middle',0),(375,7,'S15',2,1,NULL,'Side Upper','Aisle',0),(376,7,'S16',2,1,NULL,'Lower','Window',0),(377,7,'S17',2,1,NULL,'Middle','Middle',0),(378,7,'S18',2,1,NULL,'Upper','Aisle',0),(379,7,'S19',2,1,NULL,'Side Lower','Window',0),(380,7,'S20',2,1,NULL,'Side Upper','Middle',0),(381,7,'S21',2,1,NULL,'Lower','Aisle',0),(382,7,'S22',2,1,NULL,'Middle','Window',0),(383,7,'S23',2,1,NULL,'Upper','Middle',0),(384,7,'S24',2,1,NULL,'Side Lower','Aisle',0),(385,7,'S25',2,1,NULL,'Side Upper','Window',0),(386,7,'S26',2,1,NULL,'Lower','Middle',0),(387,7,'S27',2,1,NULL,'Middle','Aisle',0),(388,7,'S28',2,1,NULL,'Upper','Window',0),(389,7,'S29',2,1,NULL,'Side Lower','Middle',0),(390,7,'S30',2,1,NULL,'Side Upper','Aisle',0),(391,7,'S31',2,1,NULL,'Lower','Window',0),(392,7,'S32',2,1,NULL,'Middle','Middle',0),(393,7,'S33',2,1,NULL,'Upper','Aisle',0),(394,7,'S34',2,1,NULL,'Side Lower','Window',0),(395,7,'S35',2,1,NULL,'Side Upper','Middle',0),(396,7,'S36',2,1,NULL,'Lower','Aisle',0),(397,7,'S37',2,1,NULL,'Middle','Window',0),(398,7,'S38',2,1,NULL,'Upper','Middle',0),(399,7,'S39',2,1,NULL,'Side Lower','Aisle',0),(400,7,'S40',2,1,NULL,'Side Upper','Window',0),(401,7,'S41',2,1,NULL,'Lower','Middle',0),(402,7,'S42',2,1,NULL,'Middle','Aisle',0),(403,7,'S43',2,1,NULL,'Upper','Window',0),(404,7,'S44',2,1,NULL,'Side Lower','Middle',0),(405,7,'S45',2,1,NULL,'Side Upper','Aisle',0),(406,7,'S46',2,1,NULL,'Lower','Window',0),(407,7,'S47',2,1,NULL,'Middle','Middle',0),(408,7,'S48',2,1,NULL,'Upper','Aisle',0),(409,7,'S49',2,1,NULL,'Side Lower','Window',0),(410,7,'S50',2,1,NULL,'Side Upper','Middle',0),(411,7,'S51',2,1,NULL,'Lower','Aisle',0),(412,7,'S52',2,1,NULL,'Middle','Window',0),(413,7,'S53',2,1,NULL,'Upper','Middle',0),(414,7,'S54',2,1,NULL,'Side Lower','Aisle',0),(415,7,'S55',2,1,NULL,'Side Upper','Window',0),(416,7,'S56',2,1,NULL,'Lower','Middle',0),(417,7,'S57',2,1,NULL,'Middle','Aisle',0),(418,7,'S58',2,1,NULL,'Upper','Window',0),(419,7,'S59',2,1,NULL,'Side Lower','Middle',0),(420,7,'S60',2,1,NULL,'Side Upper','Aisle',0),(421,8,'S1',3,1,NULL,'Lower','Window',0),(422,8,'S2',3,1,NULL,'Middle','Middle',0),(423,8,'S3',3,1,NULL,'Upper','Aisle',0),(424,8,'S4',3,1,NULL,'Side Lower','Window',0),(425,8,'S5',3,1,NULL,'Side Upper','Middle',0),(426,8,'S6',3,1,NULL,'Lower','Aisle',0),(427,8,'S7',3,1,NULL,'Middle','Window',0),(428,8,'S8',3,1,NULL,'Upper','Middle',0),(429,8,'S9',3,1,NULL,'Side Lower','Aisle',0),(430,8,'S10',3,1,NULL,'Side Upper','Window',0),(431,8,'S11',3,1,NULL,'Lower','Middle',0),(432,8,'S12',3,1,NULL,'Middle','Aisle',0),(433,8,'S13',3,1,NULL,'Upper','Window',0),(434,8,'S14',3,1,NULL,'Side Lower','Middle',0),(435,8,'S15',3,1,NULL,'Side Upper','Aisle',0),(436,8,'S16',3,1,NULL,'Lower','Window',0),(437,8,'S17',3,1,NULL,'Middle','Middle',0),(438,8,'S18',3,1,NULL,'Upper','Aisle',0),(439,8,'S19',3,1,NULL,'Side Lower','Window',0),(440,8,'S20',3,1,NULL,'Side Upper','Middle',0),(441,8,'S21',3,1,NULL,'Lower','Aisle',0),(442,8,'S22',3,1,NULL,'Middle','Window',0),(443,8,'S23',3,1,NULL,'Upper','Middle',0),(444,8,'S24',3,1,NULL,'Side Lower','Aisle',0),(445,8,'S25',3,1,NULL,'Side Upper','Window',0),(446,8,'S26',3,1,NULL,'Lower','Middle',0),(447,8,'S27',3,1,NULL,'Middle','Aisle',0),(448,8,'S28',3,1,NULL,'Upper','Window',0),(449,8,'S29',3,1,NULL,'Side Lower','Middle',0),(450,8,'S30',3,1,NULL,'Side Upper','Aisle',0),(451,8,'S31',3,1,NULL,'Lower','Window',0),(452,8,'S32',3,1,NULL,'Middle','Middle',0),(453,8,'S33',3,1,NULL,'Upper','Aisle',0),(454,8,'S34',3,1,NULL,'Side Lower','Window',0),(455,8,'S35',3,1,NULL,'Side Upper','Middle',0),(456,8,'S36',3,1,NULL,'Lower','Aisle',0),(457,8,'S37',3,1,NULL,'Middle','Window',0),(458,8,'S38',3,1,NULL,'Upper','Middle',0),(459,8,'S39',3,1,NULL,'Side Lower','Aisle',0),(460,8,'S40',3,1,NULL,'Side Upper','Window',0),(461,8,'S41',3,1,NULL,'Lower','Middle',0),(462,8,'S42',3,1,NULL,'Middle','Aisle',0),(463,8,'S43',3,1,NULL,'Upper','Window',0),(464,8,'S44',3,1,NULL,'Side Lower','Middle',0),(465,8,'S45',3,1,NULL,'Side Upper','Aisle',0),(466,8,'S46',3,1,NULL,'Lower','Window',0),(467,8,'S47',3,1,NULL,'Middle','Middle',0),(468,8,'S48',3,1,NULL,'Upper','Aisle',0),(469,8,'S49',3,1,NULL,'Side Lower','Window',0),(470,8,'S50',3,1,NULL,'Side Upper','Middle',0),(471,8,'S51',3,1,NULL,'Lower','Aisle',0),(472,8,'S52',3,1,NULL,'Middle','Window',0),(473,8,'S53',3,1,NULL,'Upper','Middle',0),(474,8,'S54',3,1,NULL,'Side Lower','Aisle',0),(475,8,'S55',3,1,NULL,'Side Upper','Window',0),(476,8,'S56',3,1,NULL,'Lower','Middle',0),(477,8,'S57',3,1,NULL,'Middle','Aisle',0),(478,8,'S58',3,1,NULL,'Upper','Window',0),(479,8,'S59',3,1,NULL,'Side Lower','Middle',0),(480,8,'S60',3,1,NULL,'Side Upper','Aisle',0),(481,9,'S1',6,1,NULL,'Lower','Window',0),(482,9,'S2',6,1,NULL,'Middle','Middle',0),(483,9,'S3',6,1,NULL,'Upper','Aisle',0),(484,9,'S4',6,1,NULL,'Side Lower','Window',0),(485,9,'S5',6,1,NULL,'Side Upper','Middle',0),(486,9,'S6',6,1,NULL,'Lower','Aisle',0),(487,9,'S7',6,1,NULL,'Middle','Window',0),(488,9,'S8',6,1,NULL,'Upper','Middle',0),(489,9,'S9',6,1,NULL,'Side Lower','Aisle',0),(490,9,'S10',6,1,NULL,'Side Upper','Window',0),(491,9,'S11',6,1,NULL,'Lower','Middle',0),(492,9,'S12',6,1,NULL,'Middle','Aisle',0),(493,9,'S13',6,1,NULL,'Upper','Window',0),(494,9,'S14',6,1,NULL,'Side Lower','Middle',0),(495,9,'S15',6,1,NULL,'Side Upper','Aisle',0),(496,9,'S16',6,1,NULL,'Lower','Window',0),(497,9,'S17',6,1,NULL,'Middle','Middle',0),(498,9,'S18',6,1,NULL,'Upper','Aisle',0),(499,9,'S19',6,1,NULL,'Side Lower','Window',0),(500,9,'S20',6,1,NULL,'Side Upper','Middle',0),(501,9,'S21',6,1,NULL,'Lower','Aisle',0),(502,9,'S22',6,1,NULL,'Middle','Window',0),(503,9,'S23',6,1,NULL,'Upper','Middle',0),(504,9,'S24',6,1,NULL,'Side Lower','Aisle',0),(505,9,'S25',6,1,NULL,'Side Upper','Window',0),(506,9,'S26',6,1,NULL,'Lower','Middle',0),(507,9,'S27',6,1,NULL,'Middle','Aisle',0),(508,9,'S28',6,1,NULL,'Upper','Window',0),(509,9,'S29',6,1,NULL,'Side Lower','Middle',0),(510,9,'S30',6,1,NULL,'Side Upper','Aisle',0),(511,9,'S31',6,1,NULL,'Lower','Window',0),(512,9,'S32',6,1,NULL,'Middle','Middle',0),(513,9,'S33',6,1,NULL,'Upper','Aisle',0),(514,9,'S34',6,1,NULL,'Side Lower','Window',0),(515,9,'S35',6,1,NULL,'Side Upper','Middle',0),(516,9,'S36',6,1,NULL,'Lower','Aisle',0),(517,9,'S37',6,1,NULL,'Middle','Window',0),(518,9,'S38',6,1,NULL,'Upper','Middle',0),(519,9,'S39',6,1,NULL,'Side Lower','Aisle',0),(520,9,'S40',6,1,NULL,'Side Upper','Window',0),(521,9,'S41',6,1,NULL,'Lower','Middle',0),(522,9,'S42',6,1,NULL,'Middle','Aisle',0),(523,9,'S43',6,1,NULL,'Upper','Window',0),(524,9,'S44',6,1,NULL,'Side Lower','Middle',0),(525,9,'S45',6,1,NULL,'Side Upper','Aisle',0),(526,9,'S46',6,1,NULL,'Lower','Window',0),(527,9,'S47',6,1,NULL,'Middle','Middle',0),(528,9,'S48',6,1,NULL,'Upper','Aisle',0),(529,9,'S49',6,1,NULL,'Side Lower','Window',0),(530,9,'S50',6,1,NULL,'Side Upper','Middle',0),(531,9,'S51',6,1,NULL,'Lower','Aisle',0),(532,9,'S52',6,1,NULL,'Middle','Window',0),(533,9,'S53',6,1,NULL,'Upper','Middle',0),(534,9,'S54',6,1,NULL,'Side Lower','Aisle',0),(535,9,'S55',6,1,NULL,'Side Upper','Window',0),(536,9,'S56',6,1,NULL,'Lower','Middle',0),(537,9,'S57',6,1,NULL,'Middle','Aisle',0),(538,9,'S58',6,1,NULL,'Upper','Window',0),(539,9,'S59',6,1,NULL,'Side Lower','Middle',0),(540,9,'S60',6,1,NULL,'Side Upper','Aisle',0),(541,10,'S1',7,1,NULL,'Lower','Window',0),(542,10,'S2',7,1,NULL,'Middle','Middle',0),(543,10,'S3',7,1,NULL,'Upper','Aisle',0),(544,10,'S4',7,1,NULL,'Side Lower','Window',0),(545,10,'S5',7,1,NULL,'Side Upper','Middle',0),(546,10,'S6',7,1,NULL,'Lower','Aisle',0),(547,10,'S7',7,1,NULL,'Middle','Window',0),(548,10,'S8',7,1,NULL,'Upper','Middle',0),(549,10,'S9',7,1,NULL,'Side Lower','Aisle',0),(550,10,'S10',7,1,NULL,'Side Upper','Window',0),(551,10,'S11',7,1,NULL,'Lower','Middle',0),(552,10,'S12',7,1,NULL,'Middle','Aisle',0),(553,10,'S13',7,1,NULL,'Upper','Window',0),(554,10,'S14',7,1,NULL,'Side Lower','Middle',0),(555,10,'S15',7,1,NULL,'Side Upper','Aisle',0),(556,10,'S16',7,1,NULL,'Lower','Window',0),(557,10,'S17',7,1,NULL,'Middle','Middle',0),(558,10,'S18',7,1,NULL,'Upper','Aisle',0),(559,10,'S19',7,1,NULL,'Side Lower','Window',0),(560,10,'S20',7,1,NULL,'Side Upper','Middle',0),(561,10,'S21',7,1,NULL,'Lower','Aisle',0),(562,10,'S22',7,1,NULL,'Middle','Window',0),(563,10,'S23',7,1,NULL,'Upper','Middle',0),(564,10,'S24',7,1,NULL,'Side Lower','Aisle',0),(565,10,'S25',7,1,NULL,'Side Upper','Window',0),(566,10,'S26',7,1,NULL,'Lower','Middle',0),(567,10,'S27',7,1,NULL,'Middle','Aisle',0),(568,10,'S28',7,1,NULL,'Upper','Window',0),(569,10,'S29',7,1,NULL,'Side Lower','Middle',0),(570,10,'S30',7,1,NULL,'Side Upper','Aisle',0),(571,10,'S31',7,1,NULL,'Lower','Window',0),(572,10,'S32',7,1,NULL,'Middle','Middle',0),(573,10,'S33',7,1,NULL,'Upper','Aisle',0),(574,10,'S34',7,1,NULL,'Side Lower','Window',0),(575,10,'S35',7,1,NULL,'Side Upper','Middle',0),(576,10,'S36',7,1,NULL,'Lower','Aisle',0),(577,10,'S37',7,1,NULL,'Middle','Window',0),(578,10,'S38',7,1,NULL,'Upper','Middle',0),(579,10,'S39',7,1,NULL,'Side Lower','Aisle',0),(580,10,'S40',7,1,NULL,'Side Upper','Window',0),(581,10,'S41',7,1,NULL,'Lower','Middle',0),(582,10,'S42',7,1,NULL,'Middle','Aisle',0),(583,10,'S43',7,1,NULL,'Upper','Window',0),(584,10,'S44',7,1,NULL,'Side Lower','Middle',0),(585,10,'S45',7,1,NULL,'Side Upper','Aisle',0),(586,10,'S46',7,1,NULL,'Lower','Window',0),(587,10,'S47',7,1,NULL,'Middle','Middle',0),(588,10,'S48',7,1,NULL,'Upper','Aisle',0),(589,10,'S49',7,1,NULL,'Side Lower','Window',0),(590,10,'S50',7,1,NULL,'Side Upper','Middle',0),(591,10,'S51',7,1,NULL,'Lower','Aisle',0),(592,10,'S52',7,1,NULL,'Middle','Window',0),(593,10,'S53',7,1,NULL,'Upper','Middle',0),(594,10,'S54',7,1,NULL,'Side Lower','Aisle',0),(595,10,'S55',7,1,NULL,'Side Upper','Window',0),(596,10,'S56',7,1,NULL,'Lower','Middle',0),(597,10,'S57',7,1,NULL,'Middle','Aisle',0),(598,10,'S58',7,1,NULL,'Upper','Window',0),(599,10,'S59',7,1,NULL,'Side Lower','Middle',0),(600,10,'S60',7,1,NULL,'Side Upper','Aisle',0),(601,11,'S1',1,1,NULL,'Lower','Window',0),(602,11,'S2',1,1,NULL,'Middle','Middle',0),(603,11,'S3',1,1,NULL,'Upper','Aisle',0),(604,11,'S4',1,1,NULL,'Side Lower','Window',0),(605,11,'S5',1,1,NULL,'Side Upper','Middle',0),(606,11,'S6',1,1,NULL,'Lower','Aisle',0),(607,11,'S7',1,1,NULL,'Middle','Window',0),(608,11,'S8',1,1,NULL,'Upper','Middle',0),(609,11,'S9',1,1,NULL,'Side Lower','Aisle',0),(610,11,'S10',1,1,NULL,'Side Upper','Window',0),(611,11,'S11',1,1,NULL,'Lower','Middle',0),(612,11,'S12',1,1,NULL,'Middle','Aisle',0),(613,11,'S13',1,1,NULL,'Upper','Window',0),(614,11,'S14',1,1,NULL,'Side Lower','Middle',0),(615,11,'S15',1,1,NULL,'Side Upper','Aisle',0),(616,11,'S16',1,1,NULL,'Lower','Window',0),(617,11,'S17',1,1,NULL,'Middle','Middle',0),(618,11,'S18',1,1,NULL,'Upper','Aisle',0),(619,11,'S19',1,1,NULL,'Side Lower','Window',0),(620,11,'S20',1,1,NULL,'Side Upper','Middle',0),(621,11,'S21',1,1,NULL,'Lower','Aisle',0),(622,11,'S22',1,1,NULL,'Middle','Window',0),(623,11,'S23',1,1,NULL,'Upper','Middle',0),(624,11,'S24',1,1,NULL,'Side Lower','Aisle',0),(625,11,'S25',1,1,NULL,'Side Upper','Window',0),(626,11,'S26',1,1,NULL,'Lower','Middle',0),(627,11,'S27',1,1,NULL,'Middle','Aisle',0),(628,11,'S28',1,1,NULL,'Upper','Window',0),(629,11,'S29',1,1,NULL,'Side Lower','Middle',0),(630,11,'S30',1,1,NULL,'Side Upper','Aisle',0),(631,11,'S31',1,1,NULL,'Lower','Window',0),(632,11,'S32',1,1,NULL,'Middle','Middle',0),(633,11,'S33',1,1,NULL,'Upper','Aisle',0),(634,11,'S34',1,1,NULL,'Side Lower','Window',0),(635,11,'S35',1,1,NULL,'Side Upper','Middle',0),(636,11,'S36',1,1,NULL,'Lower','Aisle',0),(637,11,'S37',1,1,NULL,'Middle','Window',0),(638,11,'S38',1,1,NULL,'Upper','Middle',0),(639,11,'S39',1,1,NULL,'Side Lower','Aisle',0),(640,11,'S40',1,1,NULL,'Side Upper','Window',0),(641,11,'S41',1,1,NULL,'Lower','Middle',0),(642,11,'S42',1,1,NULL,'Middle','Aisle',0),(643,11,'S43',1,1,NULL,'Upper','Window',0),(644,11,'S44',1,1,NULL,'Side Lower','Middle',0),(645,11,'S45',1,1,NULL,'Side Upper','Aisle',0),(646,11,'S46',1,1,NULL,'Lower','Window',0),(647,11,'S47',1,1,NULL,'Middle','Middle',0),(648,11,'S48',1,1,NULL,'Upper','Aisle',0),(649,11,'S49',1,1,NULL,'Side Lower','Window',0),(650,11,'S50',1,1,NULL,'Side Upper','Middle',0),(651,11,'S51',1,1,NULL,'Lower','Aisle',0),(652,11,'S52',1,1,NULL,'Middle','Window',0),(653,11,'S53',1,1,NULL,'Upper','Middle',0),(654,11,'S54',1,1,NULL,'Side Lower','Aisle',0),(655,11,'S55',1,1,NULL,'Side Upper','Window',0),(656,11,'S56',1,1,NULL,'Lower','Middle',0),(657,11,'S57',1,1,NULL,'Middle','Aisle',0),(658,11,'S58',1,1,NULL,'Upper','Window',0),(659,11,'S59',1,1,NULL,'Side Lower','Middle',0),(660,11,'S60',1,1,NULL,'Side Upper','Aisle',0),(661,12,'S1',2,1,NULL,'Lower','Window',0),(662,12,'S2',2,1,NULL,'Middle','Middle',0),(663,12,'S3',2,1,NULL,'Upper','Aisle',0),(664,12,'S4',2,1,NULL,'Side Lower','Window',0),(665,12,'S5',2,1,NULL,'Side Upper','Middle',0),(666,12,'S6',2,1,NULL,'Lower','Aisle',0),(667,12,'S7',2,1,NULL,'Middle','Window',0),(668,12,'S8',2,1,NULL,'Upper','Middle',0),(669,12,'S9',2,1,NULL,'Side Lower','Aisle',0),(670,12,'S10',2,1,NULL,'Side Upper','Window',0),(671,12,'S11',2,1,NULL,'Lower','Middle',0),(672,12,'S12',2,1,NULL,'Middle','Aisle',0),(673,12,'S13',2,1,NULL,'Upper','Window',0),(674,12,'S14',2,1,NULL,'Side Lower','Middle',0),(675,12,'S15',2,1,NULL,'Side Upper','Aisle',0),(676,12,'S16',2,1,NULL,'Lower','Window',0),(677,12,'S17',2,1,NULL,'Middle','Middle',0),(678,12,'S18',2,1,NULL,'Upper','Aisle',0),(679,12,'S19',2,1,NULL,'Side Lower','Window',0),(680,12,'S20',2,1,NULL,'Side Upper','Middle',0),(681,12,'S21',2,1,NULL,'Lower','Aisle',0),(682,12,'S22',2,1,NULL,'Middle','Window',0),(683,12,'S23',2,1,NULL,'Upper','Middle',0),(684,12,'S24',2,1,NULL,'Side Lower','Aisle',0),(685,12,'S25',2,1,NULL,'Side Upper','Window',0),(686,12,'S26',2,1,NULL,'Lower','Middle',0),(687,12,'S27',2,1,NULL,'Middle','Aisle',0),(688,12,'S28',2,1,NULL,'Upper','Window',0),(689,12,'S29',2,1,NULL,'Side Lower','Middle',0),(690,12,'S30',2,1,NULL,'Side Upper','Aisle',0),(691,12,'S31',2,1,NULL,'Lower','Window',0),(692,12,'S32',2,1,NULL,'Middle','Middle',0),(693,12,'S33',2,1,NULL,'Upper','Aisle',0),(694,12,'S34',2,1,NULL,'Side Lower','Window',0),(695,12,'S35',2,1,NULL,'Side Upper','Middle',0),(696,12,'S36',2,1,NULL,'Lower','Aisle',0),(697,12,'S37',2,1,NULL,'Middle','Window',0),(698,12,'S38',2,1,NULL,'Upper','Middle',0),(699,12,'S39',2,1,NULL,'Side Lower','Aisle',0),(700,12,'S40',2,1,NULL,'Side Upper','Window',0),(701,12,'S41',2,1,NULL,'Lower','Middle',0),(702,12,'S42',2,1,NULL,'Middle','Aisle',0),(703,12,'S43',2,1,NULL,'Upper','Window',0),(704,12,'S44',2,1,NULL,'Side Lower','Middle',0),(705,12,'S45',2,1,NULL,'Side Upper','Aisle',0),(706,12,'S46',2,1,NULL,'Lower','Window',0),(707,12,'S47',2,1,NULL,'Middle','Middle',0),(708,12,'S48',2,1,NULL,'Upper','Aisle',0),(709,12,'S49',2,1,NULL,'Side Lower','Window',0),(710,12,'S50',2,1,NULL,'Side Upper','Middle',0),(711,12,'S51',2,1,NULL,'Lower','Aisle',0),(712,12,'S52',2,1,NULL,'Middle','Window',0),(713,12,'S53',2,1,NULL,'Upper','Middle',0),(714,12,'S54',2,1,NULL,'Side Lower','Aisle',0),(715,12,'S55',2,1,NULL,'Side Upper','Window',0),(716,12,'S56',2,1,NULL,'Lower','Middle',0),(717,12,'S57',2,1,NULL,'Middle','Aisle',0),(718,12,'S58',2,1,NULL,'Upper','Window',0),(719,12,'S59',2,1,NULL,'Side Lower','Middle',0),(720,12,'S60',2,1,NULL,'Side Upper','Aisle',0),(721,13,'S1',3,1,NULL,'Lower','Window',0),(722,13,'S2',3,1,NULL,'Middle','Middle',0),(723,13,'S3',3,1,NULL,'Upper','Aisle',0),(724,13,'S4',3,1,NULL,'Side Lower','Window',0),(725,13,'S5',3,1,NULL,'Side Upper','Middle',0),(726,13,'S6',3,1,NULL,'Lower','Aisle',0),(727,13,'S7',3,1,NULL,'Middle','Window',0),(728,13,'S8',3,1,NULL,'Upper','Middle',0),(729,13,'S9',3,1,NULL,'Side Lower','Aisle',0),(730,13,'S10',3,1,NULL,'Side Upper','Window',0),(731,13,'S11',3,1,NULL,'Lower','Middle',0),(732,13,'S12',3,1,NULL,'Middle','Aisle',0),(733,13,'S13',3,1,NULL,'Upper','Window',0),(734,13,'S14',3,1,NULL,'Side Lower','Middle',0),(735,13,'S15',3,1,NULL,'Side Upper','Aisle',0),(736,13,'S16',3,1,NULL,'Lower','Window',0),(737,13,'S17',3,1,NULL,'Middle','Middle',0),(738,13,'S18',3,1,NULL,'Upper','Aisle',0),(739,13,'S19',3,1,NULL,'Side Lower','Window',0),(740,13,'S20',3,1,NULL,'Side Upper','Middle',0),(741,13,'S21',3,1,NULL,'Lower','Aisle',0),(742,13,'S22',3,1,NULL,'Middle','Window',0),(743,13,'S23',3,1,NULL,'Upper','Middle',0),(744,13,'S24',3,1,NULL,'Side Lower','Aisle',0),(745,13,'S25',3,1,NULL,'Side Upper','Window',0),(746,13,'S26',3,1,NULL,'Lower','Middle',0),(747,13,'S27',3,1,NULL,'Middle','Aisle',0),(748,13,'S28',3,1,NULL,'Upper','Window',0),(749,13,'S29',3,1,NULL,'Side Lower','Middle',0),(750,13,'S30',3,1,NULL,'Side Upper','Aisle',0),(751,13,'S31',3,1,NULL,'Lower','Window',0),(752,13,'S32',3,1,NULL,'Middle','Middle',0),(753,13,'S33',3,1,NULL,'Upper','Aisle',0),(754,13,'S34',3,1,NULL,'Side Lower','Window',0),(755,13,'S35',3,1,NULL,'Side Upper','Middle',0),(756,13,'S36',3,1,NULL,'Lower','Aisle',0),(757,13,'S37',3,1,NULL,'Middle','Window',0),(758,13,'S38',3,1,NULL,'Upper','Middle',0),(759,13,'S39',3,1,NULL,'Side Lower','Aisle',0),(760,13,'S40',3,1,NULL,'Side Upper','Window',0),(761,13,'S41',3,1,NULL,'Lower','Middle',0),(762,13,'S42',3,1,NULL,'Middle','Aisle',0),(763,13,'S43',3,1,NULL,'Upper','Window',0),(764,13,'S44',3,1,NULL,'Side Lower','Middle',0),(765,13,'S45',3,1,NULL,'Side Upper','Aisle',0),(766,13,'S46',3,1,NULL,'Lower','Window',0),(767,13,'S47',3,1,NULL,'Middle','Middle',0),(768,13,'S48',3,1,NULL,'Upper','Aisle',0),(769,13,'S49',3,1,NULL,'Side Lower','Window',0),(770,13,'S50',3,1,NULL,'Side Upper','Middle',0),(771,13,'S51',3,1,NULL,'Lower','Aisle',0),(772,13,'S52',3,1,NULL,'Middle','Window',0),(773,13,'S53',3,1,NULL,'Upper','Middle',0),(774,13,'S54',3,1,NULL,'Side Lower','Aisle',0),(775,13,'S55',3,1,NULL,'Side Upper','Window',0),(776,13,'S56',3,1,NULL,'Lower','Middle',0),(777,13,'S57',3,1,NULL,'Middle','Aisle',0),(778,13,'S58',3,1,NULL,'Upper','Window',0),(779,13,'S59',3,1,NULL,'Side Lower','Middle',0),(780,13,'S60',3,1,NULL,'Side Upper','Aisle',0),(781,14,'S1',6,1,NULL,'Lower','Window',0),(782,14,'S2',6,1,NULL,'Middle','Middle',0),(783,14,'S3',6,1,NULL,'Upper','Aisle',0),(784,14,'S4',6,1,NULL,'Side Lower','Window',0),(785,14,'S5',6,1,NULL,'Side Upper','Middle',0),(786,14,'S6',6,1,NULL,'Lower','Aisle',0),(787,14,'S7',6,1,NULL,'Middle','Window',0),(788,14,'S8',6,1,NULL,'Upper','Middle',0),(789,14,'S9',6,1,NULL,'Side Lower','Aisle',0),(790,14,'S10',6,1,NULL,'Side Upper','Window',0),(791,14,'S11',6,1,NULL,'Lower','Middle',0),(792,14,'S12',6,1,NULL,'Middle','Aisle',0),(793,14,'S13',6,1,NULL,'Upper','Window',0),(794,14,'S14',6,1,NULL,'Side Lower','Middle',0),(795,14,'S15',6,1,NULL,'Side Upper','Aisle',0),(796,14,'S16',6,1,NULL,'Lower','Window',0),(797,14,'S17',6,1,NULL,'Middle','Middle',0),(798,14,'S18',6,1,NULL,'Upper','Aisle',0),(799,14,'S19',6,1,NULL,'Side Lower','Window',0),(800,14,'S20',6,1,NULL,'Side Upper','Middle',0),(801,14,'S21',6,1,NULL,'Lower','Aisle',0),(802,14,'S22',6,1,NULL,'Middle','Window',0),(803,14,'S23',6,1,NULL,'Upper','Middle',0),(804,14,'S24',6,1,NULL,'Side Lower','Aisle',0),(805,14,'S25',6,1,NULL,'Side Upper','Window',0),(806,14,'S26',6,1,NULL,'Lower','Middle',0),(807,14,'S27',6,1,NULL,'Middle','Aisle',0),(808,14,'S28',6,1,NULL,'Upper','Window',0),(809,14,'S29',6,1,NULL,'Side Lower','Middle',0),(810,14,'S30',6,1,NULL,'Side Upper','Aisle',0),(811,14,'S31',6,1,NULL,'Lower','Window',0),(812,14,'S32',6,1,NULL,'Middle','Middle',0),(813,14,'S33',6,1,NULL,'Upper','Aisle',0),(814,14,'S34',6,1,NULL,'Side Lower','Window',0),(815,14,'S35',6,1,NULL,'Side Upper','Middle',0),(816,14,'S36',6,1,NULL,'Lower','Aisle',0),(817,14,'S37',6,1,NULL,'Middle','Window',0),(818,14,'S38',6,1,NULL,'Upper','Middle',0),(819,14,'S39',6,1,NULL,'Side Lower','Aisle',0),(820,14,'S40',6,1,NULL,'Side Upper','Window',0),(821,14,'S41',6,1,NULL,'Lower','Middle',0),(822,14,'S42',6,1,NULL,'Middle','Aisle',0),(823,14,'S43',6,1,NULL,'Upper','Window',0),(824,14,'S44',6,1,NULL,'Side Lower','Middle',0),(825,14,'S45',6,1,NULL,'Side Upper','Aisle',0),(826,14,'S46',6,1,NULL,'Lower','Window',0),(827,14,'S47',6,1,NULL,'Middle','Middle',0),(828,14,'S48',6,1,NULL,'Upper','Aisle',0),(829,14,'S49',6,1,NULL,'Side Lower','Window',0),(830,14,'S50',6,1,NULL,'Side Upper','Middle',0),(831,14,'S51',6,1,NULL,'Lower','Aisle',0),(832,14,'S52',6,1,NULL,'Middle','Window',0),(833,14,'S53',6,1,NULL,'Upper','Middle',0),(834,14,'S54',6,1,NULL,'Side Lower','Aisle',0),(835,14,'S55',6,1,NULL,'Side Upper','Window',0),(836,14,'S56',6,1,NULL,'Lower','Middle',0),(837,14,'S57',6,1,NULL,'Middle','Aisle',0),(838,14,'S58',6,1,NULL,'Upper','Window',0),(839,14,'S59',6,1,NULL,'Side Lower','Middle',0),(840,14,'S60',6,1,NULL,'Side Upper','Aisle',0),(841,15,'S1',7,1,NULL,'Lower','Window',0),(842,15,'S2',7,1,NULL,'Middle','Middle',0),(843,15,'S3',7,1,NULL,'Upper','Aisle',0),(844,15,'S4',7,1,NULL,'Side Lower','Window',0),(845,15,'S5',7,1,NULL,'Side Upper','Middle',0),(846,15,'S6',7,1,NULL,'Lower','Aisle',0),(847,15,'S7',7,1,NULL,'Middle','Window',0),(848,15,'S8',7,1,NULL,'Upper','Middle',0),(849,15,'S9',7,1,NULL,'Side Lower','Aisle',0),(850,15,'S10',7,1,NULL,'Side Upper','Window',0),(851,15,'S11',7,1,NULL,'Lower','Middle',0),(852,15,'S12',7,1,NULL,'Middle','Aisle',0),(853,15,'S13',7,1,NULL,'Upper','Window',0),(854,15,'S14',7,1,NULL,'Side Lower','Middle',0),(855,15,'S15',7,1,NULL,'Side Upper','Aisle',0),(856,15,'S16',7,1,NULL,'Lower','Window',0),(857,15,'S17',7,1,NULL,'Middle','Middle',0),(858,15,'S18',7,1,NULL,'Upper','Aisle',0),(859,15,'S19',7,1,NULL,'Side Lower','Window',0),(860,15,'S20',7,1,NULL,'Side Upper','Middle',0),(861,15,'S21',7,1,NULL,'Lower','Aisle',0),(862,15,'S22',7,1,NULL,'Middle','Window',0),(863,15,'S23',7,1,NULL,'Upper','Middle',0),(864,15,'S24',7,1,NULL,'Side Lower','Aisle',0),(865,15,'S25',7,1,NULL,'Side Upper','Window',0),(866,15,'S26',7,1,NULL,'Lower','Middle',0),(867,15,'S27',7,1,NULL,'Middle','Aisle',0),(868,15,'S28',7,1,NULL,'Upper','Window',0),(869,15,'S29',7,1,NULL,'Side Lower','Middle',0),(870,15,'S30',7,1,NULL,'Side Upper','Aisle',0),(871,15,'S31',7,1,NULL,'Lower','Window',0),(872,15,'S32',7,1,NULL,'Middle','Middle',0),(873,15,'S33',7,1,NULL,'Upper','Aisle',0),(874,15,'S34',7,1,NULL,'Side Lower','Window',0),(875,15,'S35',7,1,NULL,'Side Upper','Middle',0),(876,15,'S36',7,1,NULL,'Lower','Aisle',0),(877,15,'S37',7,1,NULL,'Middle','Window',0),(878,15,'S38',7,1,NULL,'Upper','Middle',0),(879,15,'S39',7,1,NULL,'Side Lower','Aisle',0),(880,15,'S40',7,1,NULL,'Side Upper','Window',0),(881,15,'S41',7,1,NULL,'Lower','Middle',0),(882,15,'S42',7,1,NULL,'Middle','Aisle',0),(883,15,'S43',7,1,NULL,'Upper','Window',0),(884,15,'S44',7,1,NULL,'Side Lower','Middle',0),(885,15,'S45',7,1,NULL,'Side Upper','Aisle',0),(886,15,'S46',7,1,NULL,'Lower','Window',0),(887,15,'S47',7,1,NULL,'Middle','Middle',0),(888,15,'S48',7,1,NULL,'Upper','Aisle',0),(889,15,'S49',7,1,NULL,'Side Lower','Window',0),(890,15,'S50',7,1,NULL,'Side Upper','Middle',0),(891,15,'S51',7,1,NULL,'Lower','Aisle',0),(892,15,'S52',7,1,NULL,'Middle','Window',0),(893,15,'S53',7,1,NULL,'Upper','Middle',0),(894,15,'S54',7,1,NULL,'Side Lower','Aisle',0),(895,15,'S55',7,1,NULL,'Side Upper','Window',0),(896,15,'S56',7,1,NULL,'Lower','Middle',0),(897,15,'S57',7,1,NULL,'Middle','Aisle',0),(898,15,'S58',7,1,NULL,'Upper','Window',0),(899,15,'S59',7,1,NULL,'Side Lower','Middle',0),(900,15,'S60',7,1,NULL,'Side Upper','Aisle',0),(901,16,'S1',1,1,NULL,'Lower','Window',0),(902,16,'S2',1,1,NULL,'Middle','Middle',0),(903,16,'S3',1,1,NULL,'Upper','Aisle',0),(904,16,'S4',1,1,NULL,'Side Lower','Window',0),(905,16,'S5',1,1,NULL,'Side Upper','Middle',0),(906,16,'S6',1,1,NULL,'Lower','Aisle',0),(907,16,'S7',1,1,NULL,'Middle','Window',0),(908,16,'S8',1,1,NULL,'Upper','Middle',0),(909,16,'S9',1,1,NULL,'Side Lower','Aisle',0),(910,16,'S10',1,1,NULL,'Side Upper','Window',0),(911,16,'S11',1,1,NULL,'Lower','Middle',0),(912,16,'S12',1,1,NULL,'Middle','Aisle',0),(913,16,'S13',1,1,NULL,'Upper','Window',0),(914,16,'S14',1,1,NULL,'Side Lower','Middle',0),(915,16,'S15',1,1,NULL,'Side Upper','Aisle',0),(916,16,'S16',1,1,NULL,'Lower','Window',0),(917,16,'S17',1,1,NULL,'Middle','Middle',0),(918,16,'S18',1,1,NULL,'Upper','Aisle',0),(919,16,'S19',1,1,NULL,'Side Lower','Window',0),(920,16,'S20',1,1,NULL,'Side Upper','Middle',0),(921,16,'S21',1,1,NULL,'Lower','Aisle',0),(922,16,'S22',1,1,NULL,'Middle','Window',0),(923,16,'S23',1,1,NULL,'Upper','Middle',0),(924,16,'S24',1,1,NULL,'Side Lower','Aisle',0),(925,16,'S25',1,1,NULL,'Side Upper','Window',0),(926,16,'S26',1,1,NULL,'Lower','Middle',0),(927,16,'S27',1,1,NULL,'Middle','Aisle',0),(928,16,'S28',1,1,NULL,'Upper','Window',0),(929,16,'S29',1,1,NULL,'Side Lower','Middle',0),(930,16,'S30',1,1,NULL,'Side Upper','Aisle',0),(931,16,'S31',1,1,NULL,'Lower','Window',0),(932,16,'S32',1,1,NULL,'Middle','Middle',0),(933,16,'S33',1,1,NULL,'Upper','Aisle',0),(934,16,'S34',1,1,NULL,'Side Lower','Window',0),(935,16,'S35',1,1,NULL,'Side Upper','Middle',0),(936,16,'S36',1,1,NULL,'Lower','Aisle',0),(937,16,'S37',1,1,NULL,'Middle','Window',0),(938,16,'S38',1,1,NULL,'Upper','Middle',0),(939,16,'S39',1,1,NULL,'Side Lower','Aisle',0),(940,16,'S40',1,1,NULL,'Side Upper','Window',0),(941,16,'S41',1,1,NULL,'Lower','Middle',0),(942,16,'S42',1,1,NULL,'Middle','Aisle',0),(943,16,'S43',1,1,NULL,'Upper','Window',0),(944,16,'S44',1,1,NULL,'Side Lower','Middle',0),(945,16,'S45',1,1,NULL,'Side Upper','Aisle',0),(946,16,'S46',1,1,NULL,'Lower','Window',0),(947,16,'S47',1,1,NULL,'Middle','Middle',0),(948,16,'S48',1,1,NULL,'Upper','Aisle',0),(949,16,'S49',1,1,NULL,'Side Lower','Window',0),(950,16,'S50',1,1,NULL,'Side Upper','Middle',0),(951,16,'S51',1,1,NULL,'Lower','Aisle',0),(952,16,'S52',1,1,NULL,'Middle','Window',0),(953,16,'S53',1,1,NULL,'Upper','Middle',0),(954,16,'S54',1,1,NULL,'Side Lower','Aisle',0),(955,16,'S55',1,1,NULL,'Side Upper','Window',0),(956,16,'S56',1,1,NULL,'Lower','Middle',0),(957,16,'S57',1,1,NULL,'Middle','Aisle',0),(958,16,'S58',1,1,NULL,'Upper','Window',0),(959,16,'S59',1,1,NULL,'Side Lower','Middle',0),(960,16,'S60',1,1,NULL,'Side Upper','Aisle',0),(961,17,'S1',2,1,NULL,'Lower','Window',0),(962,17,'S2',2,1,NULL,'Middle','Middle',0),(963,17,'S3',2,1,NULL,'Upper','Aisle',0),(964,17,'S4',2,1,NULL,'Side Lower','Window',0),(965,17,'S5',2,1,NULL,'Side Upper','Middle',0),(966,17,'S6',2,1,NULL,'Lower','Aisle',0),(967,17,'S7',2,1,NULL,'Middle','Window',0),(968,17,'S8',2,1,NULL,'Upper','Middle',0),(969,17,'S9',2,1,NULL,'Side Lower','Aisle',0),(970,17,'S10',2,1,NULL,'Side Upper','Window',0),(971,17,'S11',2,1,NULL,'Lower','Middle',0),(972,17,'S12',2,1,NULL,'Middle','Aisle',0),(973,17,'S13',2,1,NULL,'Upper','Window',0),(974,17,'S14',2,1,NULL,'Side Lower','Middle',0),(975,17,'S15',2,1,NULL,'Side Upper','Aisle',0),(976,17,'S16',2,1,NULL,'Lower','Window',0),(977,17,'S17',2,1,NULL,'Middle','Middle',0),(978,17,'S18',2,1,NULL,'Upper','Aisle',0),(979,17,'S19',2,1,NULL,'Side Lower','Window',0),(980,17,'S20',2,1,NULL,'Side Upper','Middle',0),(981,17,'S21',2,1,NULL,'Lower','Aisle',0),(982,17,'S22',2,1,NULL,'Middle','Window',0),(983,17,'S23',2,1,NULL,'Upper','Middle',0),(984,17,'S24',2,1,NULL,'Side Lower','Aisle',0),(985,17,'S25',2,1,NULL,'Side Upper','Window',0),(986,17,'S26',2,1,NULL,'Lower','Middle',0),(987,17,'S27',2,1,NULL,'Middle','Aisle',0),(988,17,'S28',2,1,NULL,'Upper','Window',0),(989,17,'S29',2,1,NULL,'Side Lower','Middle',0),(990,17,'S30',2,1,NULL,'Side Upper','Aisle',0),(991,17,'S31',2,1,NULL,'Lower','Window',0),(992,17,'S32',2,1,NULL,'Middle','Middle',0),(993,17,'S33',2,1,NULL,'Upper','Aisle',0),(994,17,'S34',2,1,NULL,'Side Lower','Window',0),(995,17,'S35',2,1,NULL,'Side Upper','Middle',0),(996,17,'S36',2,1,NULL,'Lower','Aisle',0),(997,17,'S37',2,1,NULL,'Middle','Window',0),(998,17,'S38',2,1,NULL,'Upper','Middle',0),(999,17,'S39',2,1,NULL,'Side Lower','Aisle',0),(1000,17,'S40',2,1,NULL,'Side Upper','Window',0),(1001,17,'S41',2,1,NULL,'Lower','Middle',0),(1002,17,'S42',2,1,NULL,'Middle','Aisle',0),(1003,17,'S43',2,1,NULL,'Upper','Window',0),(1004,17,'S44',2,1,NULL,'Side Lower','Middle',0),(1005,17,'S45',2,1,NULL,'Side Upper','Aisle',0),(1006,17,'S46',2,1,NULL,'Lower','Window',0),(1007,17,'S47',2,1,NULL,'Middle','Middle',0),(1008,17,'S48',2,1,NULL,'Upper','Aisle',0),(1009,17,'S49',2,1,NULL,'Side Lower','Window',0),(1010,17,'S50',2,1,NULL,'Side Upper','Middle',0),(1011,17,'S51',2,1,NULL,'Lower','Aisle',0),(1012,17,'S52',2,1,NULL,'Middle','Window',0),(1013,17,'S53',2,1,NULL,'Upper','Middle',0),(1014,17,'S54',2,1,NULL,'Side Lower','Aisle',0),(1015,17,'S55',2,1,NULL,'Side Upper','Window',0),(1016,17,'S56',2,1,NULL,'Lower','Middle',0),(1017,17,'S57',2,1,NULL,'Middle','Aisle',0),(1018,17,'S58',2,1,NULL,'Upper','Window',0),(1019,17,'S59',2,1,NULL,'Side Lower','Middle',0),(1020,17,'S60',2,1,NULL,'Side Upper','Aisle',0),(1021,18,'S1',3,1,NULL,'Lower','Window',0),(1022,18,'S2',3,1,NULL,'Middle','Middle',0),(1023,18,'S3',3,1,NULL,'Upper','Aisle',0),(1024,18,'S4',3,1,NULL,'Side Lower','Window',0),(1025,18,'S5',3,1,NULL,'Side Upper','Middle',0),(1026,18,'S6',3,1,NULL,'Lower','Aisle',0),(1027,18,'S7',3,1,NULL,'Middle','Window',0),(1028,18,'S8',3,1,NULL,'Upper','Middle',0),(1029,18,'S9',3,1,NULL,'Side Lower','Aisle',0),(1030,18,'S10',3,1,NULL,'Side Upper','Window',0),(1031,18,'S11',3,1,NULL,'Lower','Middle',0),(1032,18,'S12',3,1,NULL,'Middle','Aisle',0),(1033,18,'S13',3,1,NULL,'Upper','Window',0),(1034,18,'S14',3,1,NULL,'Side Lower','Middle',0),(1035,18,'S15',3,1,NULL,'Side Upper','Aisle',0),(1036,18,'S16',3,1,NULL,'Lower','Window',0),(1037,18,'S17',3,1,NULL,'Middle','Middle',0),(1038,18,'S18',3,1,NULL,'Upper','Aisle',0),(1039,18,'S19',3,1,NULL,'Side Lower','Window',0),(1040,18,'S20',3,1,NULL,'Side Upper','Middle',0),(1041,18,'S21',3,1,NULL,'Lower','Aisle',0),(1042,18,'S22',3,1,NULL,'Middle','Window',0),(1043,18,'S23',3,1,NULL,'Upper','Middle',0),(1044,18,'S24',3,1,NULL,'Side Lower','Aisle',0),(1045,18,'S25',3,1,NULL,'Side Upper','Window',0),(1046,18,'S26',3,1,NULL,'Lower','Middle',0),(1047,18,'S27',3,1,NULL,'Middle','Aisle',0),(1048,18,'S28',3,1,NULL,'Upper','Window',0),(1049,18,'S29',3,1,NULL,'Side Lower','Middle',0),(1050,18,'S30',3,1,NULL,'Side Upper','Aisle',0),(1051,18,'S31',3,1,NULL,'Lower','Window',0),(1052,18,'S32',3,1,NULL,'Middle','Middle',0),(1053,18,'S33',3,1,NULL,'Upper','Aisle',0),(1054,18,'S34',3,1,NULL,'Side Lower','Window',0),(1055,18,'S35',3,1,NULL,'Side Upper','Middle',0),(1056,18,'S36',3,1,NULL,'Lower','Aisle',0),(1057,18,'S37',3,1,NULL,'Middle','Window',0),(1058,18,'S38',3,1,NULL,'Upper','Middle',0),(1059,18,'S39',3,1,NULL,'Side Lower','Aisle',0),(1060,18,'S40',3,1,NULL,'Side Upper','Window',0),(1061,18,'S41',3,1,NULL,'Lower','Middle',0),(1062,18,'S42',3,1,NULL,'Middle','Aisle',0),(1063,18,'S43',3,1,NULL,'Upper','Window',0),(1064,18,'S44',3,1,NULL,'Side Lower','Middle',0),(1065,18,'S45',3,1,NULL,'Side Upper','Aisle',0),(1066,18,'S46',3,1,NULL,'Lower','Window',0),(1067,18,'S47',3,1,NULL,'Middle','Middle',0),(1068,18,'S48',3,1,NULL,'Upper','Aisle',0),(1069,18,'S49',3,1,NULL,'Side Lower','Window',0),(1070,18,'S50',3,1,NULL,'Side Upper','Middle',0),(1071,18,'S51',3,1,NULL,'Lower','Aisle',0),(1072,18,'S52',3,1,NULL,'Middle','Window',0),(1073,18,'S53',3,1,NULL,'Upper','Middle',0),(1074,18,'S54',3,1,NULL,'Side Lower','Aisle',0),(1075,18,'S55',3,1,NULL,'Side Upper','Window',0),(1076,18,'S56',3,1,NULL,'Lower','Middle',0),(1077,18,'S57',3,1,NULL,'Middle','Aisle',0),(1078,18,'S58',3,1,NULL,'Upper','Window',0),(1079,18,'S59',3,1,NULL,'Side Lower','Middle',0),(1080,18,'S60',3,1,NULL,'Side Upper','Aisle',0),(1081,19,'S1',6,1,NULL,'Lower','Window',0),(1082,19,'S2',6,1,NULL,'Middle','Middle',0),(1083,19,'S3',6,1,NULL,'Upper','Aisle',0),(1084,19,'S4',6,1,NULL,'Side Lower','Window',0),(1085,19,'S5',6,1,NULL,'Side Upper','Middle',0),(1086,19,'S6',6,1,NULL,'Lower','Aisle',0),(1087,19,'S7',6,1,NULL,'Middle','Window',0),(1088,19,'S8',6,1,NULL,'Upper','Middle',0),(1089,19,'S9',6,1,NULL,'Side Lower','Aisle',0),(1090,19,'S10',6,1,NULL,'Side Upper','Window',0),(1091,19,'S11',6,1,NULL,'Lower','Middle',0),(1092,19,'S12',6,1,NULL,'Middle','Aisle',0),(1093,19,'S13',6,1,NULL,'Upper','Window',0),(1094,19,'S14',6,1,NULL,'Side Lower','Middle',0),(1095,19,'S15',6,1,NULL,'Side Upper','Aisle',0),(1096,19,'S16',6,1,NULL,'Lower','Window',0),(1097,19,'S17',6,1,NULL,'Middle','Middle',0),(1098,19,'S18',6,1,NULL,'Upper','Aisle',0),(1099,19,'S19',6,1,NULL,'Side Lower','Window',0),(1100,19,'S20',6,1,NULL,'Side Upper','Middle',0),(1101,19,'S21',6,1,NULL,'Lower','Aisle',0),(1102,19,'S22',6,1,NULL,'Middle','Window',0),(1103,19,'S23',6,1,NULL,'Upper','Middle',0),(1104,19,'S24',6,1,NULL,'Side Lower','Aisle',0),(1105,19,'S25',6,1,NULL,'Side Upper','Window',0),(1106,19,'S26',6,1,NULL,'Lower','Middle',0),(1107,19,'S27',6,1,NULL,'Middle','Aisle',0),(1108,19,'S28',6,1,NULL,'Upper','Window',0),(1109,19,'S29',6,1,NULL,'Side Lower','Middle',0),(1110,19,'S30',6,1,NULL,'Side Upper','Aisle',0),(1111,19,'S31',6,1,NULL,'Lower','Window',0),(1112,19,'S32',6,1,NULL,'Middle','Middle',0),(1113,19,'S33',6,1,NULL,'Upper','Aisle',0),(1114,19,'S34',6,1,NULL,'Side Lower','Window',0),(1115,19,'S35',6,1,NULL,'Side Upper','Middle',0),(1116,19,'S36',6,1,NULL,'Lower','Aisle',0),(1117,19,'S37',6,1,NULL,'Middle','Window',0),(1118,19,'S38',6,1,NULL,'Upper','Middle',0),(1119,19,'S39',6,1,NULL,'Side Lower','Aisle',0),(1120,19,'S40',6,1,NULL,'Side Upper','Window',0),(1121,19,'S41',6,1,NULL,'Lower','Middle',0),(1122,19,'S42',6,1,NULL,'Middle','Aisle',0),(1123,19,'S43',6,1,NULL,'Upper','Window',0),(1124,19,'S44',6,1,NULL,'Side Lower','Middle',0),(1125,19,'S45',6,1,NULL,'Side Upper','Aisle',0),(1126,19,'S46',6,1,NULL,'Lower','Window',0),(1127,19,'S47',6,1,NULL,'Middle','Middle',0),(1128,19,'S48',6,1,NULL,'Upper','Aisle',0),(1129,19,'S49',6,1,NULL,'Side Lower','Window',0),(1130,19,'S50',6,1,NULL,'Side Upper','Middle',0),(1131,19,'S51',6,1,NULL,'Lower','Aisle',0),(1132,19,'S52',6,1,NULL,'Middle','Window',0),(1133,19,'S53',6,1,NULL,'Upper','Middle',0),(1134,19,'S54',6,1,NULL,'Side Lower','Aisle',0),(1135,19,'S55',6,1,NULL,'Side Upper','Window',0),(1136,19,'S56',6,1,NULL,'Lower','Middle',0),(1137,19,'S57',6,1,NULL,'Middle','Aisle',0),(1138,19,'S58',6,1,NULL,'Upper','Window',0),(1139,19,'S59',6,1,NULL,'Side Lower','Middle',0),(1140,19,'S60',6,1,NULL,'Side Upper','Aisle',0),(1141,20,'S1',7,1,NULL,'Lower','Window',0),(1142,20,'S2',7,1,NULL,'Middle','Middle',0),(1143,20,'S3',7,1,NULL,'Upper','Aisle',0),(1144,20,'S4',7,1,NULL,'Side Lower','Window',0),(1145,20,'S5',7,1,NULL,'Side Upper','Middle',0),(1146,20,'S6',7,1,NULL,'Lower','Aisle',0),(1147,20,'S7',7,1,NULL,'Middle','Window',0),(1148,20,'S8',7,1,NULL,'Upper','Middle',0),(1149,20,'S9',7,1,NULL,'Side Lower','Aisle',0),(1150,20,'S10',7,1,NULL,'Side Upper','Window',0),(1151,20,'S11',7,1,NULL,'Lower','Middle',0),(1152,20,'S12',7,1,NULL,'Middle','Aisle',0),(1153,20,'S13',7,1,NULL,'Upper','Window',0),(1154,20,'S14',7,1,NULL,'Side Lower','Middle',0),(1155,20,'S15',7,1,NULL,'Side Upper','Aisle',0),(1156,20,'S16',7,1,NULL,'Lower','Window',0),(1157,20,'S17',7,1,NULL,'Middle','Middle',0),(1158,20,'S18',7,1,NULL,'Upper','Aisle',0),(1159,20,'S19',7,1,NULL,'Side Lower','Window',0),(1160,20,'S20',7,1,NULL,'Side Upper','Middle',0),(1161,20,'S21',7,1,NULL,'Lower','Aisle',0),(1162,20,'S22',7,1,NULL,'Middle','Window',0),(1163,20,'S23',7,1,NULL,'Upper','Middle',0),(1164,20,'S24',7,1,NULL,'Side Lower','Aisle',0),(1165,20,'S25',7,1,NULL,'Side Upper','Window',0),(1166,20,'S26',7,1,NULL,'Lower','Middle',0),(1167,20,'S27',7,1,NULL,'Middle','Aisle',0),(1168,20,'S28',7,1,NULL,'Upper','Window',0),(1169,20,'S29',7,1,NULL,'Side Lower','Middle',0),(1170,20,'S30',7,1,NULL,'Side Upper','Aisle',0),(1171,20,'S31',7,1,NULL,'Lower','Window',0),(1172,20,'S32',7,1,NULL,'Middle','Middle',0),(1173,20,'S33',7,1,NULL,'Upper','Aisle',0),(1174,20,'S34',7,1,NULL,'Side Lower','Window',0),(1175,20,'S35',7,1,NULL,'Side Upper','Middle',0),(1176,20,'S36',7,1,NULL,'Lower','Aisle',0),(1177,20,'S37',7,1,NULL,'Middle','Window',0),(1178,20,'S38',7,1,NULL,'Upper','Middle',0),(1179,20,'S39',7,1,NULL,'Side Lower','Aisle',0),(1180,20,'S40',7,1,NULL,'Side Upper','Window',0),(1181,20,'S41',7,1,NULL,'Lower','Middle',0),(1182,20,'S42',7,1,NULL,'Middle','Aisle',0),(1183,20,'S43',7,1,NULL,'Upper','Window',0),(1184,20,'S44',7,1,NULL,'Side Lower','Middle',0),(1185,20,'S45',7,1,NULL,'Side Upper','Aisle',0),(1186,20,'S46',7,1,NULL,'Lower','Window',0),(1187,20,'S47',7,1,NULL,'Middle','Middle',0),(1188,20,'S48',7,1,NULL,'Upper','Aisle',0),(1189,20,'S49',7,1,NULL,'Side Lower','Window',0),(1190,20,'S50',7,1,NULL,'Side Upper','Middle',0),(1191,20,'S51',7,1,NULL,'Lower','Aisle',0),(1192,20,'S52',7,1,NULL,'Middle','Window',0),(1193,20,'S53',7,1,NULL,'Upper','Middle',0),(1194,20,'S54',7,1,NULL,'Side Lower','Aisle',0),(1195,20,'S55',7,1,NULL,'Side Upper','Window',0),(1196,20,'S56',7,1,NULL,'Lower','Middle',0),(1197,20,'S57',7,1,NULL,'Middle','Aisle',0),(1198,20,'S58',7,1,NULL,'Upper','Window',0),(1199,20,'S59',7,1,NULL,'Side Lower','Middle',0),(1200,20,'S60',7,1,NULL,'Side Upper','Aisle',0),(1201,21,'S1',1,1,NULL,'Lower','Window',0),(1202,21,'S2',1,1,NULL,'Middle','Middle',0),(1203,21,'S3',1,1,NULL,'Upper','Aisle',0),(1204,21,'S4',1,1,NULL,'Side Lower','Window',0),(1205,21,'S5',1,1,NULL,'Side Upper','Middle',0),(1206,21,'S6',1,1,NULL,'Lower','Aisle',0),(1207,21,'S7',1,1,NULL,'Middle','Window',0),(1208,21,'S8',1,1,NULL,'Upper','Middle',0),(1209,21,'S9',1,1,NULL,'Side Lower','Aisle',0),(1210,21,'S10',1,1,NULL,'Side Upper','Window',0),(1211,21,'S11',1,1,NULL,'Lower','Middle',0),(1212,21,'S12',1,1,NULL,'Middle','Aisle',0),(1213,21,'S13',1,1,NULL,'Upper','Window',0),(1214,21,'S14',1,1,NULL,'Side Lower','Middle',0),(1215,21,'S15',1,1,NULL,'Side Upper','Aisle',0),(1216,21,'S16',1,1,NULL,'Lower','Window',0),(1217,21,'S17',1,1,NULL,'Middle','Middle',0),(1218,21,'S18',1,1,NULL,'Upper','Aisle',0),(1219,21,'S19',1,1,NULL,'Side Lower','Window',0),(1220,21,'S20',1,1,NULL,'Side Upper','Middle',0),(1221,21,'S21',1,1,NULL,'Lower','Aisle',0),(1222,21,'S22',1,1,NULL,'Middle','Window',0),(1223,21,'S23',1,1,NULL,'Upper','Middle',0),(1224,21,'S24',1,1,NULL,'Side Lower','Aisle',0),(1225,21,'S25',1,1,NULL,'Side Upper','Window',0),(1226,21,'S26',1,1,NULL,'Lower','Middle',0),(1227,21,'S27',1,1,NULL,'Middle','Aisle',0),(1228,21,'S28',1,1,NULL,'Upper','Window',0),(1229,21,'S29',1,1,NULL,'Side Lower','Middle',0),(1230,21,'S30',1,1,NULL,'Side Upper','Aisle',0),(1231,21,'S31',1,1,NULL,'Lower','Window',0),(1232,21,'S32',1,1,NULL,'Middle','Middle',0),(1233,21,'S33',1,1,NULL,'Upper','Aisle',0),(1234,21,'S34',1,1,NULL,'Side Lower','Window',0),(1235,21,'S35',1,1,NULL,'Side Upper','Middle',0),(1236,21,'S36',1,1,NULL,'Lower','Aisle',0),(1237,21,'S37',1,1,NULL,'Middle','Window',0),(1238,21,'S38',1,1,NULL,'Upper','Middle',0),(1239,21,'S39',1,1,NULL,'Side Lower','Aisle',0),(1240,21,'S40',1,1,NULL,'Side Upper','Window',0),(1241,21,'S41',1,1,NULL,'Lower','Middle',0),(1242,21,'S42',1,1,NULL,'Middle','Aisle',0),(1243,21,'S43',1,1,NULL,'Upper','Window',0),(1244,21,'S44',1,1,NULL,'Side Lower','Middle',0),(1245,21,'S45',1,1,NULL,'Side Upper','Aisle',0),(1246,21,'S46',1,1,NULL,'Lower','Window',0),(1247,21,'S47',1,1,NULL,'Middle','Middle',0),(1248,21,'S48',1,1,NULL,'Upper','Aisle',0),(1249,21,'S49',1,1,NULL,'Side Lower','Window',0),(1250,21,'S50',1,1,NULL,'Side Upper','Middle',0),(1251,21,'S51',1,1,NULL,'Lower','Aisle',0),(1252,21,'S52',1,1,NULL,'Middle','Window',0),(1253,21,'S53',1,1,NULL,'Upper','Middle',0),(1254,21,'S54',1,1,NULL,'Side Lower','Aisle',0),(1255,21,'S55',1,1,NULL,'Side Upper','Window',0),(1256,21,'S56',1,1,NULL,'Lower','Middle',0),(1257,21,'S57',1,1,NULL,'Middle','Aisle',0),(1258,21,'S58',1,1,NULL,'Upper','Window',0),(1259,21,'S59',1,1,NULL,'Side Lower','Middle',0),(1260,21,'S60',1,1,NULL,'Side Upper','Aisle',0),(1261,22,'S1',2,0,NULL,'Lower','Window',0),(1262,22,'S2',2,1,NULL,'Middle','Middle',0),(1263,22,'S3',2,1,NULL,'Upper','Aisle',0),(1264,22,'S4',2,1,NULL,'Side Lower','Window',0),(1265,22,'S5',2,1,NULL,'Side Upper','Middle',0),(1266,22,'S6',2,1,NULL,'Lower','Aisle',0),(1267,22,'S7',2,1,NULL,'Middle','Window',0),(1268,22,'S8',2,1,NULL,'Upper','Middle',0),(1269,22,'S9',2,1,NULL,'Side Lower','Aisle',0),(1270,22,'S10',2,1,NULL,'Side Upper','Window',0),(1271,22,'S11',2,1,NULL,'Lower','Middle',0),(1272,22,'S12',2,1,NULL,'Middle','Aisle',0),(1273,22,'S13',2,1,NULL,'Upper','Window',0),(1274,22,'S14',2,1,NULL,'Side Lower','Middle',0),(1275,22,'S15',2,1,NULL,'Side Upper','Aisle',0),(1276,22,'S16',2,1,NULL,'Lower','Window',0),(1277,22,'S17',2,1,NULL,'Middle','Middle',0),(1278,22,'S18',2,1,NULL,'Upper','Aisle',0),(1279,22,'S19',2,1,NULL,'Side Lower','Window',0),(1280,22,'S20',2,1,NULL,'Side Upper','Middle',0),(1281,22,'S21',2,1,NULL,'Lower','Aisle',0),(1282,22,'S22',2,1,NULL,'Middle','Window',0),(1283,22,'S23',2,1,NULL,'Upper','Middle',0),(1284,22,'S24',2,1,NULL,'Side Lower','Aisle',0),(1285,22,'S25',2,1,NULL,'Side Upper','Window',0),(1286,22,'S26',2,1,NULL,'Lower','Middle',0),(1287,22,'S27',2,1,NULL,'Middle','Aisle',0),(1288,22,'S28',2,1,NULL,'Upper','Window',0),(1289,22,'S29',2,1,NULL,'Side Lower','Middle',0),(1290,22,'S30',2,1,NULL,'Side Upper','Aisle',0),(1291,22,'S31',2,1,NULL,'Lower','Window',0),(1292,22,'S32',2,1,NULL,'Middle','Middle',0),(1293,22,'S33',2,1,NULL,'Upper','Aisle',0),(1294,22,'S34',2,1,NULL,'Side Lower','Window',0),(1295,22,'S35',2,1,NULL,'Side Upper','Middle',0),(1296,22,'S36',2,1,NULL,'Lower','Aisle',0),(1297,22,'S37',2,1,NULL,'Middle','Window',0),(1298,22,'S38',2,1,NULL,'Upper','Middle',0),(1299,22,'S39',2,1,NULL,'Side Lower','Aisle',0),(1300,22,'S40',2,1,NULL,'Side Upper','Window',0),(1301,22,'S41',2,1,NULL,'Lower','Middle',0),(1302,22,'S42',2,1,NULL,'Middle','Aisle',0),(1303,22,'S43',2,1,NULL,'Upper','Window',0),(1304,22,'S44',2,1,NULL,'Side Lower','Middle',0),(1305,22,'S45',2,1,NULL,'Side Upper','Aisle',0),(1306,22,'S46',2,1,NULL,'Lower','Window',0),(1307,22,'S47',2,1,NULL,'Middle','Middle',0),(1308,22,'S48',2,1,NULL,'Upper','Aisle',0),(1309,22,'S49',2,1,NULL,'Side Lower','Window',0),(1310,22,'S50',2,1,NULL,'Side Upper','Middle',0),(1311,22,'S51',2,1,NULL,'Lower','Aisle',0),(1312,22,'S52',2,1,NULL,'Middle','Window',0),(1313,22,'S53',2,1,NULL,'Upper','Middle',0),(1314,22,'S54',2,1,NULL,'Side Lower','Aisle',0),(1315,22,'S55',2,1,NULL,'Side Upper','Window',0),(1316,22,'S56',2,1,NULL,'Lower','Middle',0),(1317,22,'S57',2,1,NULL,'Middle','Aisle',0),(1318,22,'S58',2,1,NULL,'Upper','Window',0),(1319,22,'S59',2,1,NULL,'Side Lower','Middle',0),(1320,22,'S60',2,1,NULL,'Side Upper','Aisle',0),(1321,23,'S1',3,1,NULL,'Lower','Window',0),(1322,23,'S2',3,1,NULL,'Middle','Middle',0),(1323,23,'S3',3,1,NULL,'Upper','Aisle',0),(1324,23,'S4',3,1,NULL,'Side Lower','Window',0),(1325,23,'S5',3,1,NULL,'Side Upper','Middle',0),(1326,23,'S6',3,1,NULL,'Lower','Aisle',0),(1327,23,'S7',3,1,NULL,'Middle','Window',0),(1328,23,'S8',3,1,NULL,'Upper','Middle',0),(1329,23,'S9',3,1,NULL,'Side Lower','Aisle',0),(1330,23,'S10',3,1,NULL,'Side Upper','Window',0),(1331,23,'S11',3,1,NULL,'Lower','Middle',0),(1332,23,'S12',3,1,NULL,'Middle','Aisle',0),(1333,23,'S13',3,1,NULL,'Upper','Window',0),(1334,23,'S14',3,1,NULL,'Side Lower','Middle',0),(1335,23,'S15',3,1,NULL,'Side Upper','Aisle',0),(1336,23,'S16',3,1,NULL,'Lower','Window',0),(1337,23,'S17',3,1,NULL,'Middle','Middle',0),(1338,23,'S18',3,1,NULL,'Upper','Aisle',0),(1339,23,'S19',3,1,NULL,'Side Lower','Window',0),(1340,23,'S20',3,1,NULL,'Side Upper','Middle',0),(1341,23,'S21',3,1,NULL,'Lower','Aisle',0),(1342,23,'S22',3,1,NULL,'Middle','Window',0),(1343,23,'S23',3,1,NULL,'Upper','Middle',0),(1344,23,'S24',3,1,NULL,'Side Lower','Aisle',0),(1345,23,'S25',3,1,NULL,'Side Upper','Window',0),(1346,23,'S26',3,1,NULL,'Lower','Middle',0),(1347,23,'S27',3,1,NULL,'Middle','Aisle',0),(1348,23,'S28',3,1,NULL,'Upper','Window',0),(1349,23,'S29',3,1,NULL,'Side Lower','Middle',0),(1350,23,'S30',3,1,NULL,'Side Upper','Aisle',0),(1351,23,'S31',3,1,NULL,'Lower','Window',0),(1352,23,'S32',3,1,NULL,'Middle','Middle',0),(1353,23,'S33',3,1,NULL,'Upper','Aisle',0),(1354,23,'S34',3,1,NULL,'Side Lower','Window',0),(1355,23,'S35',3,1,NULL,'Side Upper','Middle',0),(1356,23,'S36',3,1,NULL,'Lower','Aisle',0),(1357,23,'S37',3,1,NULL,'Middle','Window',0),(1358,23,'S38',3,1,NULL,'Upper','Middle',0),(1359,23,'S39',3,1,NULL,'Side Lower','Aisle',0),(1360,23,'S40',3,1,NULL,'Side Upper','Window',0),(1361,23,'S41',3,1,NULL,'Lower','Middle',0),(1362,23,'S42',3,1,NULL,'Middle','Aisle',0),(1363,23,'S43',3,1,NULL,'Upper','Window',0),(1364,23,'S44',3,1,NULL,'Side Lower','Middle',0),(1365,23,'S45',3,1,NULL,'Side Upper','Aisle',0),(1366,23,'S46',3,1,NULL,'Lower','Window',0),(1367,23,'S47',3,1,NULL,'Middle','Middle',0),(1368,23,'S48',3,1,NULL,'Upper','Aisle',0),(1369,23,'S49',3,1,NULL,'Side Lower','Window',0),(1370,23,'S50',3,1,NULL,'Side Upper','Middle',0),(1371,23,'S51',3,1,NULL,'Lower','Aisle',0),(1372,23,'S52',3,1,NULL,'Middle','Window',0),(1373,23,'S53',3,1,NULL,'Upper','Middle',0),(1374,23,'S54',3,1,NULL,'Side Lower','Aisle',0),(1375,23,'S55',3,1,NULL,'Side Upper','Window',0),(1376,23,'S56',3,1,NULL,'Lower','Middle',0),(1377,23,'S57',3,1,NULL,'Middle','Aisle',0),(1378,23,'S58',3,1,NULL,'Upper','Window',0),(1379,23,'S59',3,1,NULL,'Side Lower','Middle',0),(1380,23,'S60',3,1,NULL,'Side Upper','Aisle',0),(1381,24,'S1',6,1,NULL,'Lower','Window',0),(1382,24,'S2',6,1,NULL,'Middle','Middle',0),(1383,24,'S3',6,1,NULL,'Upper','Aisle',0),(1384,24,'S4',6,1,NULL,'Side Lower','Window',0),(1385,24,'S5',6,1,NULL,'Side Upper','Middle',0),(1386,24,'S6',6,1,NULL,'Lower','Aisle',0),(1387,24,'S7',6,1,NULL,'Middle','Window',0),(1388,24,'S8',6,1,NULL,'Upper','Middle',0),(1389,24,'S9',6,1,NULL,'Side Lower','Aisle',0),(1390,24,'S10',6,1,NULL,'Side Upper','Window',0),(1391,24,'S11',6,1,NULL,'Lower','Middle',0),(1392,24,'S12',6,1,NULL,'Middle','Aisle',0),(1393,24,'S13',6,1,NULL,'Upper','Window',0),(1394,24,'S14',6,1,NULL,'Side Lower','Middle',0),(1395,24,'S15',6,1,NULL,'Side Upper','Aisle',0),(1396,24,'S16',6,1,NULL,'Lower','Window',0),(1397,24,'S17',6,1,NULL,'Middle','Middle',0),(1398,24,'S18',6,1,NULL,'Upper','Aisle',0),(1399,24,'S19',6,1,NULL,'Side Lower','Window',0),(1400,24,'S20',6,1,NULL,'Side Upper','Middle',0),(1401,24,'S21',6,1,NULL,'Lower','Aisle',0),(1402,24,'S22',6,1,NULL,'Middle','Window',0),(1403,24,'S23',6,1,NULL,'Upper','Middle',0),(1404,24,'S24',6,1,NULL,'Side Lower','Aisle',0),(1405,24,'S25',6,1,NULL,'Side Upper','Window',0),(1406,24,'S26',6,1,NULL,'Lower','Middle',0),(1407,24,'S27',6,1,NULL,'Middle','Aisle',0),(1408,24,'S28',6,1,NULL,'Upper','Window',0),(1409,24,'S29',6,1,NULL,'Side Lower','Middle',0),(1410,24,'S30',6,1,NULL,'Side Upper','Aisle',0),(1411,24,'S31',6,1,NULL,'Lower','Window',0),(1412,24,'S32',6,1,NULL,'Middle','Middle',0),(1413,24,'S33',6,1,NULL,'Upper','Aisle',0),(1414,24,'S34',6,1,NULL,'Side Lower','Window',0),(1415,24,'S35',6,1,NULL,'Side Upper','Middle',0),(1416,24,'S36',6,1,NULL,'Lower','Aisle',0),(1417,24,'S37',6,1,NULL,'Middle','Window',0),(1418,24,'S38',6,1,NULL,'Upper','Middle',0),(1419,24,'S39',6,1,NULL,'Side Lower','Aisle',0),(1420,24,'S40',6,1,NULL,'Side Upper','Window',0),(1421,24,'S41',6,1,NULL,'Lower','Middle',0),(1422,24,'S42',6,1,NULL,'Middle','Aisle',0),(1423,24,'S43',6,1,NULL,'Upper','Window',0),(1424,24,'S44',6,1,NULL,'Side Lower','Middle',0),(1425,24,'S45',6,1,NULL,'Side Upper','Aisle',0),(1426,24,'S46',6,1,NULL,'Lower','Window',0),(1427,24,'S47',6,1,NULL,'Middle','Middle',0),(1428,24,'S48',6,1,NULL,'Upper','Aisle',0),(1429,24,'S49',6,1,NULL,'Side Lower','Window',0),(1430,24,'S50',6,1,NULL,'Side Upper','Middle',0),(1431,24,'S51',6,1,NULL,'Lower','Aisle',0),(1432,24,'S52',6,1,NULL,'Middle','Window',0),(1433,24,'S53',6,1,NULL,'Upper','Middle',0),(1434,24,'S54',6,1,NULL,'Side Lower','Aisle',0),(1435,24,'S55',6,1,NULL,'Side Upper','Window',0),(1436,24,'S56',6,1,NULL,'Lower','Middle',0),(1437,24,'S57',6,1,NULL,'Middle','Aisle',0),(1438,24,'S58',6,1,NULL,'Upper','Window',0),(1439,24,'S59',6,1,NULL,'Side Lower','Middle',0),(1440,24,'S60',6,1,NULL,'Side Upper','Aisle',0),(1441,25,'S1',7,1,NULL,'Lower','Window',0),(1442,25,'S2',7,1,NULL,'Middle','Middle',0),(1443,25,'S3',7,1,NULL,'Upper','Aisle',0),(1444,25,'S4',7,1,NULL,'Side Lower','Window',0),(1445,25,'S5',7,1,NULL,'Side Upper','Middle',0),(1446,25,'S6',7,1,NULL,'Lower','Aisle',0),(1447,25,'S7',7,1,NULL,'Middle','Window',0),(1448,25,'S8',7,1,NULL,'Upper','Middle',0),(1449,25,'S9',7,1,NULL,'Side Lower','Aisle',0),(1450,25,'S10',7,1,NULL,'Side Upper','Window',0),(1451,25,'S11',7,1,NULL,'Lower','Middle',0),(1452,25,'S12',7,1,NULL,'Middle','Aisle',0),(1453,25,'S13',7,1,NULL,'Upper','Window',0),(1454,25,'S14',7,1,NULL,'Side Lower','Middle',0),(1455,25,'S15',7,1,NULL,'Side Upper','Aisle',0),(1456,25,'S16',7,1,NULL,'Lower','Window',0),(1457,25,'S17',7,1,NULL,'Middle','Middle',0),(1458,25,'S18',7,1,NULL,'Upper','Aisle',0),(1459,25,'S19',7,1,NULL,'Side Lower','Window',0),(1460,25,'S20',7,1,NULL,'Side Upper','Middle',0),(1461,25,'S21',7,1,NULL,'Lower','Aisle',0),(1462,25,'S22',7,1,NULL,'Middle','Window',0),(1463,25,'S23',7,1,NULL,'Upper','Middle',0),(1464,25,'S24',7,1,NULL,'Side Lower','Aisle',0),(1465,25,'S25',7,1,NULL,'Side Upper','Window',0),(1466,25,'S26',7,1,NULL,'Lower','Middle',0),(1467,25,'S27',7,1,NULL,'Middle','Aisle',0),(1468,25,'S28',7,1,NULL,'Upper','Window',0),(1469,25,'S29',7,1,NULL,'Side Lower','Middle',0),(1470,25,'S30',7,1,NULL,'Side Upper','Aisle',0),(1471,25,'S31',7,1,NULL,'Lower','Window',0),(1472,25,'S32',7,1,NULL,'Middle','Middle',0),(1473,25,'S33',7,1,NULL,'Upper','Aisle',0),(1474,25,'S34',7,1,NULL,'Side Lower','Window',0),(1475,25,'S35',7,1,NULL,'Side Upper','Middle',0),(1476,25,'S36',7,1,NULL,'Lower','Aisle',0),(1477,25,'S37',7,1,NULL,'Middle','Window',0),(1478,25,'S38',7,1,NULL,'Upper','Middle',0),(1479,25,'S39',7,1,NULL,'Side Lower','Aisle',0),(1480,25,'S40',7,1,NULL,'Side Upper','Window',0),(1481,25,'S41',7,1,NULL,'Lower','Middle',0),(1482,25,'S42',7,1,NULL,'Middle','Aisle',0),(1483,25,'S43',7,1,NULL,'Upper','Window',0),(1484,25,'S44',7,1,NULL,'Side Lower','Middle',0),(1485,25,'S45',7,1,NULL,'Side Upper','Aisle',0),(1486,25,'S46',7,1,NULL,'Lower','Window',0),(1487,25,'S47',7,1,NULL,'Middle','Middle',0),(1488,25,'S48',7,1,NULL,'Upper','Aisle',0),(1489,25,'S49',7,1,NULL,'Side Lower','Window',0),(1490,25,'S50',7,1,NULL,'Side Upper','Middle',0),(1491,25,'S51',7,1,NULL,'Lower','Aisle',0),(1492,25,'S52',7,1,NULL,'Middle','Window',0),(1493,25,'S53',7,1,NULL,'Upper','Middle',0),(1494,25,'S54',7,1,NULL,'Side Lower','Aisle',0),(1495,25,'S55',7,1,NULL,'Side Upper','Window',0),(1496,25,'S56',7,1,NULL,'Lower','Middle',0),(1497,25,'S57',7,1,NULL,'Middle','Aisle',0),(1498,25,'S58',7,1,NULL,'Upper','Window',0),(1499,25,'S59',7,1,NULL,'Side Lower','Middle',0),(1500,25,'S60',7,1,NULL,'Side Upper','Aisle',0);
/*!40000 ALTER TABLE `seat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seatallocation`
--

DROP TABLE IF EXISTS `seatallocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seatallocation` (
  `AllocationID` int NOT NULL,
  `TrainID` int DEFAULT NULL,
  `ScheduleID` int DEFAULT NULL,
  `JourneyDate` date DEFAULT NULL,
  `CoachID` int DEFAULT NULL,
  `SeatID` int DEFAULT NULL,
  `SeatNumber` varchar(10) DEFAULT NULL,
  `PassengerID` int DEFAULT NULL,
  `BookingID` int DEFAULT NULL,
  `ClassID` int DEFAULT NULL,
  `BookingStatusID` int DEFAULT NULL,
  `AllocationTime` datetime DEFAULT NULL,
  `LastUpdated` datetime DEFAULT NULL,
  PRIMARY KEY (`AllocationID`),
  KEY `TrainID` (`TrainID`),
  KEY `ScheduleID` (`ScheduleID`),
  KEY `CoachID` (`CoachID`),
  KEY `SeatID` (`SeatID`),
  KEY `PassengerID` (`PassengerID`),
  KEY `BookingID` (`BookingID`),
  KEY `ClassID` (`ClassID`),
  KEY `BookingStatusID` (`BookingStatusID`),
  CONSTRAINT `seatallocation_ibfk_1` FOREIGN KEY (`TrainID`) REFERENCES `train` (`TrainID`),
  CONSTRAINT `seatallocation_ibfk_2` FOREIGN KEY (`ScheduleID`) REFERENCES `schedule` (`ScheduleID`),
  CONSTRAINT `seatallocation_ibfk_3` FOREIGN KEY (`CoachID`) REFERENCES `coach` (`CoachID`),
  CONSTRAINT `seatallocation_ibfk_4` FOREIGN KEY (`SeatID`) REFERENCES `seat` (`SeatID`),
  CONSTRAINT `seatallocation_ibfk_5` FOREIGN KEY (`PassengerID`) REFERENCES `passenger` (`PassengerID`),
  CONSTRAINT `seatallocation_ibfk_6` FOREIGN KEY (`BookingID`) REFERENCES `booking` (`BookingID`),
  CONSTRAINT `seatallocation_ibfk_7` FOREIGN KEY (`ClassID`) REFERENCES `class` (`ClassID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seatallocation`
--

LOCK TABLES `seatallocation` WRITE;
/*!40000 ALTER TABLE `seatallocation` DISABLE KEYS */;
INSERT INTO `seatallocation` VALUES (1,1,1,'2025-04-15',2,63,'S3',1,1,2,1,'2025-04-14 11:30:24','2025-04-14 11:30:24'),(2,1,1,'2025-05-01',2,64,'S4',2,2,2,1,'2025-04-14 11:47:15','2025-04-14 11:47:15'),(3,1,1,'2025-05-01',2,65,'S5',3,3,2,1,'2025-04-14 11:47:15','2025-04-14 11:47:15'),(4,1,1,'2025-05-01',2,66,'S6',4,4,2,1,'2025-04-14 11:47:15','2025-04-14 11:47:15'),(5,1,1,'2025-05-01',2,67,'S7',5,5,2,1,'2025-04-14 11:47:15','2025-04-14 11:47:15'),(6,1,1,'2025-05-01',2,68,'S8',6,6,2,1,'2025-04-14 11:47:15','2025-04-14 11:47:15'),(7,1,1,'2025-05-01',2,69,'S9',7,7,2,1,'2025-04-14 11:47:15','2025-04-14 11:47:15'),(8,1,1,'2025-05-01',2,70,'S10',8,8,2,1,'2025-04-14 11:47:15','2025-04-14 11:47:15'),(9,1,1,'2025-05-01',2,71,'S11',9,9,2,1,'2025-04-14 11:47:15','2025-04-14 11:47:15'),(10,1,1,'2025-05-01',2,72,'S12',10,10,2,1,'2025-04-14 11:47:15','2025-04-14 11:47:15'),(11,1,1,'2025-05-01',2,73,'S13',11,11,2,1,'2025-04-14 11:47:15','2025-04-14 11:47:15'),(12,1,1,'2025-05-01',2,74,'S14',12,12,2,1,'2025-04-14 11:47:15','2025-04-14 11:47:15'),(13,1,1,'2025-05-01',2,75,'S15',13,13,2,1,'2025-04-14 11:47:15','2025-04-14 11:47:15'),(14,1,1,'2025-05-01',2,76,'S16',14,14,2,1,'2025-04-14 11:47:15','2025-04-14 11:47:15'),(15,1,1,'2025-05-01',2,77,'S17',15,15,2,1,'2025-04-14 11:47:15','2025-04-14 11:47:15'),(16,1,1,'2025-05-01',2,78,'S18',16,16,2,1,'2025-04-14 11:47:15','2025-04-14 11:47:15'),(17,1,1,'2025-05-01',2,79,'S19',17,17,2,1,'2025-04-14 11:47:15','2025-04-14 11:47:15'),(18,1,1,'2025-05-01',2,80,'S20',18,18,2,1,'2025-04-14 11:47:15','2025-04-14 11:47:15'),(19,1,1,'2025-05-01',2,81,'S21',19,19,2,1,'2025-04-14 11:47:15','2025-04-14 11:47:15'),(20,1,1,'2025-05-01',2,82,'S22',20,20,2,1,'2025-04-14 11:47:15','2025-04-14 11:47:15'),(21,1,1,'2025-05-01',2,83,'S23',21,21,2,1,'2025-04-14 11:47:15','2025-04-14 11:47:15'),(22,1,1,'2025-05-01',2,84,'S24',22,22,2,1,'2025-04-14 11:47:15','2025-04-14 11:47:15'),(23,1,1,'2025-05-01',2,85,'S25',23,23,2,1,'2025-04-14 11:47:15','2025-04-14 11:47:15'),(24,1,1,'2025-05-01',2,86,'S26',24,24,2,1,'2025-04-14 11:47:15','2025-04-14 11:47:15'),(25,1,1,'2025-05-01',2,87,'S27',25,25,2,1,'2025-04-14 11:47:15','2025-04-14 11:47:15'),(26,1,1,'2025-05-01',2,88,'S28',26,26,2,1,'2025-04-14 11:47:15','2025-04-14 11:47:15'),(27,1,1,'2025-05-01',2,89,'S29',27,27,2,1,'2025-04-14 11:47:15','2025-04-14 11:47:15'),(28,1,1,'2025-05-01',2,90,'S30',28,28,2,1,'2025-04-14 11:47:15','2025-04-14 11:47:15'),(29,1,1,'2025-05-01',2,91,'S31',29,29,2,1,'2025-04-14 11:47:15','2025-04-14 11:47:15'),(30,1,1,'2025-05-01',2,92,'S32',30,30,2,1,'2025-04-14 11:47:15','2025-04-14 11:47:15'),(31,1,1,'2025-05-01',2,93,'S33',31,31,2,1,'2025-04-14 11:47:15','2025-04-14 11:47:15'),(32,1,1,'2025-05-01',2,94,'S34',32,32,2,1,'2025-04-14 11:47:15','2025-04-14 11:47:15'),(33,1,1,'2025-05-01',2,95,'S35',33,33,2,1,'2025-04-14 11:47:15','2025-04-14 11:47:15'),(34,1,1,'2025-05-01',2,96,'S36',34,34,2,1,'2025-04-14 11:47:15','2025-04-14 11:47:15'),(35,1,1,'2025-05-01',2,97,'S37',35,35,2,1,'2025-04-14 11:47:15','2025-04-14 11:47:15'),(36,1,1,'2025-05-01',2,98,'S38',36,36,2,1,'2025-04-14 11:47:15','2025-04-14 11:47:15'),(37,1,1,'2025-05-01',2,99,'S39',37,37,2,1,'2025-04-14 11:47:15','2025-04-14 11:47:15'),(38,1,1,'2025-05-01',2,100,'S40',38,38,2,1,'2025-04-14 11:47:15','2025-04-14 11:47:15'),(39,1,1,'2025-05-01',2,101,'S41',39,39,2,1,'2025-04-14 11:47:15','2025-04-14 11:47:15'),(40,1,1,'2025-05-01',2,102,'S42',40,40,2,1,'2025-04-14 11:47:15','2025-04-14 11:47:15'),(41,1,1,'2025-05-01',2,103,'S43',41,41,2,1,'2025-04-14 11:47:15','2025-04-14 11:47:15'),(42,1,1,'2025-05-01',2,104,'S44',42,42,2,1,'2025-04-14 11:47:15','2025-04-14 11:47:15'),(43,1,1,'2025-05-01',2,105,'S45',43,43,2,1,'2025-04-14 11:47:15','2025-04-14 11:47:15'),(44,1,1,'2025-05-01',2,106,'S46',44,44,2,1,'2025-04-14 11:47:15','2025-04-14 11:47:15'),(45,1,1,'2025-05-01',2,107,'S47',45,45,2,1,'2025-04-14 11:47:15','2025-04-14 11:47:15'),(46,1,1,'2025-05-01',2,108,'S48',46,46,2,1,'2025-04-14 11:47:15','2025-04-14 11:47:15'),(47,1,1,'2025-05-01',2,109,'S49',47,47,2,1,'2025-04-14 11:47:15','2025-04-14 11:47:15'),(48,1,1,'2025-05-01',2,110,'S50',48,48,2,1,'2025-04-14 11:47:15','2025-04-14 11:47:15'),(49,1,1,'2025-05-01',2,111,'S51',49,49,2,1,'2025-04-14 11:47:15','2025-04-14 11:47:15'),(50,1,1,'2025-05-01',2,112,'S52',50,50,2,1,'2025-04-14 11:47:15','2025-04-14 11:47:15'),(51,5,5,'2025-05-01',22,1261,'S1',100,51,2,1,'2025-04-14 12:28:00','2025-04-14 12:28:00');
/*!40000 ALTER TABLE `seatallocation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `station`
--

DROP TABLE IF EXISTS `station`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `station` (
  `StationID` int NOT NULL,
  `StationName` varchar(30) DEFAULT NULL,
  `City` varchar(20) DEFAULT NULL,
  `State` varchar(20) DEFAULT NULL,
  `IsJunction` tinyint(1) DEFAULT NULL,
  `ContactNumber` varchar(20) DEFAULT NULL,
  `NearbyBusStand` varchar(20) DEFAULT NULL,
  `StationCode` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`StationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `station`
--

LOCK TABLES `station` WRITE;
/*!40000 ALTER TABLE `station` DISABLE KEYS */;
INSERT INTO `station` VALUES (1,'New Delhi Station','New Delhi','Delhi',NULL,'+916949510404','+916949510404','ND'),(2,'Howrah Junction','Kolkata','West Bengal',NULL,'+917754600909','+917754600909','H'),(3,'Chennai Central','Chennai','Tamil Nadu',NULL,'+916125843516','+916125843516','CC'),(4,'Mumbai CST','Mumbai','Maharashtra',NULL,'+917959015068','+917959015068','MC'),(5,'Bangalore City','Bangalore','Karnataka',NULL,'+918818257315','+918818257315','BC'),(6,'Secunderabad Junction','Hyderabad','Telangana',NULL,'+916890792958','+916890792958','S'),(7,'Pune Junction','Pune','Maharashtra',NULL,'+917911697070','+917911697070','P'),(8,'Lucknow NR','Lucknow','Uttar Pradesh',NULL,'+919102449952','+919102449952','LN'),(9,'Patna Junction','Patna','Bihar',NULL,'+917278122947','+917278122947','P'),(10,'Bhopal Junction','Bhopal','Madhya Pradesh',NULL,'+918155671763','+918155671763','B'),(11,'Nagpur Junction','Nagpur','Maharashtra',NULL,'+916240912798','+916240912798','N'),(12,'Kanpur Central','Kanpur','Uttar Pradesh',NULL,'+919309670932','+919309670932','KC'),(13,'Ahmedabad Junction','Ahmedabad','Gujarat',NULL,'+919227995378','+919227995378','A'),(14,'Coimbatore Junction','Coimbatore','Tamil Nadu',NULL,'+916952558432','+916952558432','C'),(15,'Vijayawada Junction','Vijayawada','Andhra Pradesh',NULL,'+919606481750','+919606481750','V'),(16,'New Jalpaiguri Station','Siliguri','West Bengal',NULL,'+919034384201','+919034384201','NJ'),(17,'Guwahati Station','Guwahati','Assam',NULL,'+918315290334','+918315290334','G'),(18,'Jaipur Junction','Jaipur','Rajasthan',NULL,'+919528407799','+919528407799','J'),(19,'Amritsar Junction','Amritsar','Punjab',NULL,'+917263569873','+917263569873','A'),(20,'Visakhapatnam Junction','Visakhapatnam','Andhra Pradesh',NULL,'+916548283891','+916548283891','V');
/*!40000 ALTER TABLE `station` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `train`
--

DROP TABLE IF EXISTS `train`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `train` (
  `TrainID` int NOT NULL,
  `TrainName` varchar(20) DEFAULT NULL,
  `SourceStationID` int DEFAULT NULL,
  `DestinationStationID` int DEFAULT NULL,
  `TotalCoach` int DEFAULT NULL,
  `TotalSeats` int DEFAULT NULL,
  `DaysOfOperation` set('Mon','Tue','Wed','Thu','Fri','Sat','Sun') DEFAULT NULL,
  `StartTime` time DEFAULT NULL,
  `EndTime` time DEFAULT NULL,
  `TrainType` enum('Express','Superfast','Shatabdi','Passenger','Local') DEFAULT NULL,
  PRIMARY KEY (`TrainID`),
  KEY `SourceStationID` (`SourceStationID`),
  KEY `DestinationStationID` (`DestinationStationID`),
  CONSTRAINT `train_ibfk_1` FOREIGN KEY (`SourceStationID`) REFERENCES `station` (`StationID`),
  CONSTRAINT `train_ibfk_2` FOREIGN KEY (`DestinationStationID`) REFERENCES `station` (`StationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `train`
--

LOCK TABLES `train` WRITE;
/*!40000 ALTER TABLE `train` DISABLE KEYS */;
INSERT INTO `train` VALUES (1,'Rajdhani Express',3,1,5,300,'Mon','10:00:00','22:00:00','Express'),(2,'Shatabdi Express',2,6,5,300,'Mon','09:45:00','13:45:00','Shatabdi'),(3,'Duronto Superfast',1,6,5,300,'Fri','14:15:00','01:15:00','Superfast'),(4,'Garib Rath Express',4,7,5,300,'Mon','22:30:00','02:30:00','Express'),(5,'Intercity Passenger',1,2,5,300,'Thu','05:15:00','11:15:00','Passenger');
/*!40000 ALTER TABLE `train` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-14 13:10:04
