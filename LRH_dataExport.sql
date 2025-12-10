CREATE DATABASE  IF NOT EXISTS `lastresorthotel` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `lastresorthotel`;
-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: localhost    Database: lastresorthotel
-- ------------------------------------------------------
-- Server version	8.0.43

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `accesslog`
--

DROP TABLE IF EXISTS `accesslog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accesslog` (
  `accessLogID` int NOT NULL AUTO_INCREMENT,
  `guestID` int NOT NULL,
  `cardReaderID` int NOT NULL,
  `accessTime` datetime NOT NULL,
  `direction` varchar(10) NOT NULL,
  PRIMARY KEY (`accessLogID`),
  KEY `fk_access_guest` (`guestID`),
  KEY `fk_access_reader` (`cardReaderID`),
  KEY `idx_access_time` (`accessTime`),
  CONSTRAINT `fk_access_guest` FOREIGN KEY (`guestID`) REFERENCES `guest` (`guestID`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_access_reader` FOREIGN KEY (`cardReaderID`) REFERENCES `cardreader` (`cardReaderID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=256 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accesslog`
--

LOCK TABLES `accesslog` WRITE;
/*!40000 ALTER TABLE `accesslog` DISABLE KEYS */;
INSERT INTO `accesslog` VALUES (1,1,1,'2025-10-01 12:30:00','out'),(2,2,2,'2025-10-01 17:30:00','in'),(3,3,3,'2025-10-01 22:30:00','out'),(4,4,4,'2025-10-02 03:30:00','in'),(5,5,5,'2025-10-02 08:30:00','out'),(6,6,1,'2025-10-02 13:30:00','in'),(7,7,2,'2025-10-02 18:30:00','out'),(8,8,3,'2025-10-02 23:30:00','in'),(9,9,4,'2025-10-03 04:30:00','out'),(10,10,5,'2025-10-03 09:30:00','in'),(11,11,1,'2025-10-03 14:30:00','out'),(12,12,2,'2025-10-03 19:30:00','in'),(13,13,3,'2025-10-04 00:30:00','out'),(14,14,4,'2025-10-04 05:30:00','in'),(15,15,5,'2025-10-04 10:30:00','out'),(16,16,1,'2025-10-04 15:30:00','in'),(17,17,2,'2025-10-04 20:30:00','out'),(18,18,3,'2025-10-05 01:30:00','in'),(19,19,4,'2025-10-05 06:30:00','out'),(20,20,5,'2025-10-05 11:30:00','in'),(21,21,1,'2025-10-05 16:30:00','out'),(22,22,2,'2025-10-05 21:30:00','in'),(23,23,3,'2025-10-06 02:30:00','out'),(24,24,4,'2025-10-06 07:30:00','in'),(25,25,5,'2025-10-06 12:30:00','out'),(26,26,1,'2025-10-06 17:30:00','in'),(27,27,2,'2025-10-06 22:30:00','out'),(28,28,3,'2025-10-07 03:30:00','in'),(29,29,4,'2025-10-07 08:30:00','out'),(30,30,5,'2025-10-07 13:30:00','in'),(31,31,1,'2025-10-07 18:30:00','out'),(32,32,2,'2025-10-07 23:30:00','in'),(33,33,3,'2025-10-08 04:30:00','out'),(34,34,4,'2025-10-08 09:30:00','in'),(35,35,5,'2025-10-08 14:30:00','out'),(36,36,1,'2025-10-08 19:30:00','in'),(37,37,2,'2025-10-09 00:30:00','out'),(38,38,3,'2025-10-09 05:30:00','in'),(39,39,4,'2025-10-09 10:30:00','out'),(40,40,5,'2025-10-09 15:30:00','in'),(41,41,1,'2025-10-09 20:30:00','out'),(42,42,2,'2025-10-10 01:30:00','in'),(43,43,3,'2025-10-10 06:30:00','out'),(44,44,4,'2025-10-10 11:30:00','in'),(45,45,5,'2025-10-10 16:30:00','out'),(46,46,1,'2025-10-10 21:30:00','in'),(47,47,2,'2025-10-11 02:30:00','out'),(48,48,3,'2025-10-11 07:30:00','in'),(49,49,4,'2025-10-11 12:30:00','out'),(50,50,5,'2025-10-11 17:30:00','in'),(51,51,1,'2025-10-11 22:30:00','out'),(52,52,2,'2025-10-12 03:30:00','in'),(53,53,3,'2025-10-12 08:30:00','out'),(54,54,4,'2025-10-12 13:30:00','in'),(55,55,5,'2025-10-12 18:30:00','out'),(56,56,1,'2025-10-12 23:30:00','in'),(57,57,2,'2025-10-13 04:30:00','out'),(58,58,3,'2025-10-13 09:30:00','in'),(59,59,4,'2025-10-13 14:30:00','out'),(60,60,5,'2025-10-13 19:30:00','in'),(61,61,1,'2025-10-14 00:30:00','out'),(62,62,2,'2025-10-14 05:30:00','in'),(63,63,3,'2025-10-14 10:30:00','out'),(64,64,4,'2025-10-14 15:30:00','in'),(65,65,5,'2025-10-14 20:30:00','out'),(66,66,1,'2025-10-15 01:30:00','in'),(67,67,2,'2025-10-15 06:30:00','out'),(68,68,3,'2025-10-15 11:30:00','in'),(69,69,4,'2025-10-15 16:30:00','out'),(70,70,5,'2025-10-15 21:30:00','in'),(71,71,1,'2025-10-16 02:30:00','out'),(72,72,2,'2025-10-16 07:30:00','in'),(73,73,3,'2025-10-16 12:30:00','out'),(74,74,4,'2025-10-16 17:30:00','in'),(75,75,5,'2025-10-16 22:30:00','out'),(76,76,1,'2025-10-17 03:30:00','in'),(77,77,2,'2025-10-17 08:30:00','out'),(78,78,3,'2025-10-17 13:30:00','in'),(79,79,4,'2025-10-17 18:30:00','out'),(80,80,5,'2025-10-17 23:30:00','in'),(81,1,1,'2025-10-18 04:30:00','out'),(82,2,2,'2025-10-18 09:30:00','in'),(83,3,3,'2025-10-18 14:30:00','out'),(84,4,4,'2025-10-18 19:30:00','in'),(85,5,5,'2025-10-19 00:30:00','out'),(86,6,1,'2025-10-19 05:30:00','in'),(87,7,2,'2025-10-19 10:30:00','out'),(88,8,3,'2025-10-19 15:30:00','in'),(89,9,4,'2025-10-19 20:30:00','out'),(90,10,5,'2025-10-20 01:30:00','in'),(91,11,1,'2025-10-20 06:30:00','out'),(92,12,2,'2025-10-20 11:30:00','in'),(93,13,3,'2025-10-20 16:30:00','out'),(94,14,4,'2025-10-20 21:30:00','in'),(95,15,5,'2025-10-21 02:30:00','out'),(96,16,1,'2025-10-21 07:30:00','in'),(97,17,2,'2025-10-21 12:30:00','out'),(98,18,3,'2025-10-21 17:30:00','in'),(99,19,4,'2025-10-21 22:30:00','out'),(100,20,5,'2025-10-22 03:30:00','in'),(101,21,1,'2025-10-22 08:30:00','out'),(102,22,2,'2025-10-22 13:30:00','in'),(103,23,3,'2025-10-22 18:30:00','out'),(104,24,4,'2025-10-22 23:30:00','in'),(105,25,5,'2025-10-23 04:30:00','out'),(106,26,1,'2025-10-23 09:30:00','in'),(107,27,2,'2025-10-23 14:30:00','out'),(108,28,3,'2025-10-23 19:30:00','in'),(109,29,4,'2025-10-24 00:30:00','out'),(110,30,5,'2025-10-24 05:30:00','in'),(111,31,1,'2025-10-24 10:30:00','out'),(112,32,2,'2025-10-24 15:30:00','in'),(113,33,3,'2025-10-24 20:30:00','out'),(114,34,4,'2025-10-25 01:30:00','in'),(115,35,5,'2025-10-25 06:30:00','out'),(116,36,1,'2025-10-25 11:30:00','in'),(117,37,2,'2025-10-25 16:30:00','out'),(118,38,3,'2025-10-25 21:30:00','in'),(119,39,4,'2025-10-26 02:30:00','out'),(120,40,5,'2025-10-26 07:30:00','in'),(121,41,1,'2025-10-26 12:30:00','out'),(122,42,2,'2025-10-26 17:30:00','in'),(123,43,3,'2025-10-26 22:30:00','out'),(124,44,4,'2025-10-27 03:30:00','in'),(125,45,5,'2025-10-27 08:30:00','out'),(126,46,1,'2025-10-27 13:30:00','in'),(127,47,2,'2025-10-27 18:30:00','out'),(128,48,3,'2025-10-27 23:30:00','in'),(129,49,4,'2025-10-28 04:30:00','out'),(130,50,5,'2025-10-28 09:30:00','in'),(131,51,1,'2025-10-28 14:30:00','out'),(132,52,2,'2025-10-28 19:30:00','in'),(133,53,3,'2025-10-29 00:30:00','out'),(134,54,4,'2025-10-29 05:30:00','in'),(135,55,5,'2025-10-29 10:30:00','out'),(136,56,1,'2025-10-29 15:30:00','in'),(137,57,2,'2025-10-29 20:30:00','out'),(138,58,3,'2025-10-30 01:30:00','in'),(139,59,4,'2025-10-30 06:30:00','out'),(140,60,5,'2025-10-30 11:30:00','in'),(141,61,1,'2025-10-30 16:30:00','out'),(142,62,2,'2025-10-30 21:30:00','in'),(143,63,3,'2025-10-31 02:30:00','out'),(144,64,4,'2025-10-31 07:30:00','in'),(145,65,5,'2025-10-31 12:30:00','out'),(146,66,1,'2025-10-31 17:30:00','in'),(147,67,2,'2025-10-31 22:30:00','out'),(148,68,3,'2025-11-01 03:30:00','in'),(149,69,4,'2025-11-01 08:30:00','out'),(150,70,5,'2025-11-01 13:30:00','in'),(151,71,1,'2025-11-01 18:30:00','out'),(152,72,2,'2025-11-01 23:30:00','in'),(153,73,3,'2025-11-02 04:30:00','out'),(154,74,4,'2025-11-02 09:30:00','in'),(155,75,5,'2025-11-02 14:30:00','out'),(156,76,1,'2025-11-02 19:30:00','in'),(157,77,2,'2025-11-03 00:30:00','out'),(158,78,3,'2025-11-03 05:30:00','in'),(159,79,4,'2025-11-03 10:30:00','out'),(160,80,5,'2025-11-03 15:30:00','in'),(161,1,1,'2025-11-03 20:30:00','out'),(162,2,2,'2025-11-04 01:30:00','in'),(163,3,3,'2025-11-04 06:30:00','out'),(164,4,4,'2025-11-04 11:30:00','in'),(165,5,5,'2025-11-04 16:30:00','out'),(166,6,1,'2025-11-04 21:30:00','in'),(167,7,2,'2025-11-05 02:30:00','out'),(168,8,3,'2025-11-05 07:30:00','in'),(169,9,4,'2025-11-05 12:30:00','out'),(170,10,5,'2025-11-05 17:30:00','in'),(171,11,1,'2025-11-05 22:30:00','out'),(172,12,2,'2025-11-06 03:30:00','in'),(173,13,3,'2025-11-06 08:30:00','out'),(174,14,4,'2025-11-06 13:30:00','in'),(175,15,5,'2025-11-06 18:30:00','out'),(176,16,1,'2025-11-06 23:30:00','in'),(177,17,2,'2025-11-07 04:30:00','out'),(178,18,3,'2025-11-07 09:30:00','in'),(179,19,4,'2025-11-07 14:30:00','out'),(180,20,5,'2025-11-07 19:30:00','in'),(181,21,1,'2025-11-08 00:30:00','out'),(182,22,2,'2025-11-08 05:30:00','in'),(183,23,3,'2025-11-08 10:30:00','out'),(184,24,4,'2025-11-08 15:30:00','in'),(185,25,5,'2025-11-08 20:30:00','out'),(186,26,1,'2025-11-09 01:30:00','in'),(187,27,2,'2025-11-09 06:30:00','out'),(188,28,3,'2025-11-09 11:30:00','in'),(189,29,4,'2025-11-09 16:30:00','out'),(190,30,5,'2025-11-09 21:30:00','in'),(191,31,1,'2025-11-10 02:30:00','out'),(192,32,2,'2025-11-10 07:30:00','in'),(193,33,3,'2025-11-10 12:30:00','out'),(194,34,4,'2025-11-10 17:30:00','in'),(195,35,5,'2025-11-10 22:30:00','out'),(196,36,1,'2025-11-11 03:30:00','in'),(197,37,2,'2025-11-11 08:30:00','out'),(198,38,3,'2025-11-11 13:30:00','in'),(199,39,4,'2025-11-11 18:30:00','out'),(200,40,5,'2025-11-11 23:30:00','in');
/*!40000 ALTER TABLE `accesslog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bedtype`
--

DROP TABLE IF EXISTS `bedtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bedtype` (
  `bedTypeID` int NOT NULL AUTO_INCREMENT,
  `bedSize` varchar(30) NOT NULL,
  `bedLength` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`bedTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bedtype`
--

LOCK TABLES `bedtype` WRITE;
/*!40000 ALTER TABLE `bedtype` DISABLE KEYS */;
INSERT INTO `bedtype` VALUES (1,'Queen','80 in'),(2,'King','80 in'),(3,'Twin','75 in');
/*!40000 ALTER TABLE `bedtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `billedparty`
--

DROP TABLE IF EXISTS `billedparty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `billedparty` (
  `billedPartyID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(120) NOT NULL,
  `partyType` varchar(40) NOT NULL,
  `contactPerson` varchar(120) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`billedPartyID`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billedparty`
--

LOCK TABLES `billedparty` WRITE;
/*!40000 ALTER TABLE `billedparty` DISABLE KEYS */;
INSERT INTO `billedparty` VALUES (1,'Guest1 LRH1','Individual',NULL,'New York, NY','929-346-0001'),(2,'Guest2 LRH2','Individual',NULL,'New York, NY','929-346-0002'),(3,'Guest3 LRH3','Individual',NULL,'New York, NY','929-346-0003'),(4,'Guest4 LRH4','Individual',NULL,'New York, NY','929-346-0004'),(5,'Guest5 LRH5','Individual',NULL,'New York, NY','929-346-0005'),(6,'Guest6 LRH6','Individual',NULL,'New York, NY','929-346-0006'),(7,'Guest7 LRH7','Individual',NULL,'New York, NY','929-346-0007'),(8,'Guest8 LRH8','Individual',NULL,'New York, NY','929-346-0008'),(9,'Guest9 LRH9','Individual',NULL,'New York, NY','929-346-0009'),(10,'Guest10 LRH10','Individual',NULL,'New York, NY','929-346-0010'),(11,'Guest11 LRH11','Individual',NULL,'New York, NY','929-346-0011'),(12,'Guest12 LRH12','Individual',NULL,'New York, NY','929-346-0012'),(13,'Guest13 LRH13','Individual',NULL,'New York, NY','929-346-0013'),(14,'Guest14 LRH14','Individual',NULL,'New York, NY','929-346-0014'),(15,'Guest15 LRH15','Individual',NULL,'New York, NY','929-346-0015'),(16,'Guest16 LRH16','Individual',NULL,'New York, NY','929-346-0016'),(17,'Guest17 LRH17','Individual',NULL,'New York, NY','929-346-0017'),(18,'Guest18 LRH18','Individual',NULL,'New York, NY','929-346-0018'),(19,'Guest19 LRH19','Individual',NULL,'New York, NY','929-346-0019'),(20,'Guest20 LRH20','Individual',NULL,'New York, NY','929-346-0020'),(21,'Guest21 LRH21','Individual',NULL,'New York, NY','929-346-0021'),(22,'Guest22 LRH22','Individual',NULL,'New York, NY','929-346-0022'),(23,'Guest23 LRH23','Individual',NULL,'New York, NY','929-346-0023'),(24,'Guest24 LRH24','Individual',NULL,'New York, NY','929-346-0024'),(25,'Guest25 LRH25','Individual',NULL,'New York, NY','929-346-0025'),(26,'Guest26 LRH26','Individual',NULL,'New York, NY','929-346-0026'),(27,'Guest27 LRH27','Individual',NULL,'New York, NY','929-346-0027'),(28,'Guest28 LRH28','Individual',NULL,'New York, NY','929-346-0028'),(29,'Guest29 LRH29','Individual',NULL,'New York, NY','929-346-0029'),(30,'Guest30 LRH30','Individual',NULL,'New York, NY','929-346-0030'),(31,'Guest31 LRH31','Individual',NULL,'New York, NY','929-346-0031'),(32,'Guest32 LRH32','Individual',NULL,'New York, NY','929-346-0032'),(33,'Guest33 LRH33','Individual',NULL,'New York, NY','929-346-0033'),(34,'Guest34 LRH34','Individual',NULL,'New York, NY','929-346-0034'),(35,'Guest35 LRH35','Individual',NULL,'New York, NY','929-346-0035'),(36,'Guest36 LRH36','Individual',NULL,'New York, NY','929-346-0036'),(37,'Guest37 LRH37','Individual',NULL,'New York, NY','929-346-0037'),(38,'Guest38 LRH38','Individual',NULL,'New York, NY','929-346-0038'),(39,'Guest39 LRH39','Individual',NULL,'New York, NY','929-346-0039'),(40,'Guest40 LRH40','Individual',NULL,'New York, NY','929-346-0040'),(41,'Guest41 LRH41','Individual',NULL,'New York, NY','929-346-0041'),(42,'Guest42 LRH42','Individual',NULL,'New York, NY','929-346-0042'),(43,'Guest43 LRH43','Individual',NULL,'New York, NY','929-346-0043'),(44,'Guest44 LRH44','Individual',NULL,'New York, NY','929-346-0044'),(45,'Guest45 LRH45','Individual',NULL,'New York, NY','929-346-0045'),(46,'Guest46 LRH46','Individual',NULL,'New York, NY','929-346-0046'),(47,'Guest47 LRH47','Individual',NULL,'New York, NY','929-346-0047'),(48,'Guest48 LRH48','Individual',NULL,'New York, NY','929-346-0048'),(49,'Guest49 LRH49','Individual',NULL,'New York, NY','929-346-0049'),(50,'Guest50 LRH50','Individual',NULL,'New York, NY','929-346-0050'),(51,'Guest51 LRH51','Individual',NULL,'New York, NY','929-346-0051'),(52,'Guest52 LRH52','Individual',NULL,'New York, NY','929-346-0052'),(53,'Guest53 LRH53','Individual',NULL,'New York, NY','929-346-0053'),(54,'Guest54 LRH54','Individual',NULL,'New York, NY','929-346-0054'),(55,'Guest55 LRH55','Individual',NULL,'New York, NY','929-346-0055'),(56,'Guest56 LRH56','Individual',NULL,'New York, NY','929-346-0056'),(57,'Guest57 LRH57','Individual',NULL,'New York, NY','929-346-0057'),(58,'Guest58 LRH58','Individual',NULL,'New York, NY','929-346-0058'),(59,'Guest59 LRH59','Individual',NULL,'New York, NY','929-346-0059'),(60,'Guest60 LRH60','Individual',NULL,'New York, NY','929-346-0060'),(61,'Guest61 LRH61','Individual',NULL,'New York, NY','929-346-0061'),(62,'Guest62 LRH62','Individual',NULL,'New York, NY','929-346-0062'),(63,'Guest63 LRH63','Individual',NULL,'New York, NY','929-346-0063'),(64,'Guest64 LRH64','Individual',NULL,'New York, NY','929-346-0064'),(65,'Guest65 LRH65','Individual',NULL,'New York, NY','929-346-0065'),(66,'Guest66 LRH66','Individual',NULL,'New York, NY','929-346-0066'),(67,'Guest67 LRH67','Individual',NULL,'New York, NY','929-346-0067'),(68,'Guest68 LRH68','Individual',NULL,'New York, NY','929-346-0068'),(69,'Guest69 LRH69','Individual',NULL,'New York, NY','929-346-0069'),(70,'Guest70 LRH70','Individual',NULL,'New York, NY','929-346-0070'),(71,'Guest71 LRH71','Individual',NULL,'New York, NY','929-346-0071'),(72,'Guest72 LRH72','Individual',NULL,'New York, NY','929-346-0072'),(73,'Guest73 LRH73','Individual',NULL,'New York, NY','929-346-0073'),(74,'Guest74 LRH74','Individual',NULL,'New York, NY','929-346-0074'),(75,'Guest75 LRH75','Individual',NULL,'New York, NY','929-346-0075'),(76,'Guest76 LRH76','Individual',NULL,'New York, NY','929-346-0076'),(77,'Guest77 LRH77','Individual',NULL,'New York, NY','929-346-0077'),(78,'Guest78 LRH78','Individual',NULL,'New York, NY','929-346-0078'),(79,'Guest79 LRH79','Individual',NULL,'New York, NY','929-346-0079'),(80,'Guest80 LRH80','Individual',NULL,'New York, NY','929-346-0080'),(101,'Citizen Society','Organization','Events Lead','New York, NY','312-465-3051'),(102,'Peeksnack Events','Organization','Group Manager','Jersey City, NJ','201-535-3022'),(103,'JD Lab','Organization','Office Admin','New York, NY','242-525-5703'),(104,'Studio Blink','Organization','Producer','Brooklyn, NY','718-357-8213'),(105,'Cobor Partners','Organization','Client Services','New York, NY','272-468-1236');
/*!40000 ALTER TABLE `billedparty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `billingsplit`
--

DROP TABLE IF EXISTS `billingsplit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `billingsplit` (
  `splitID` int NOT NULL AUTO_INCREMENT,
  `chargeID` int NOT NULL,
  `billedPartyID` int NOT NULL,
  `splitRatio` decimal(5,2) NOT NULL,
  PRIMARY KEY (`splitID`),
  KEY `fk_split_charge` (`chargeID`),
  KEY `fk_split_party` (`billedPartyID`),
  CONSTRAINT `fk_split_charge` FOREIGN KEY (`chargeID`) REFERENCES `charge` (`chargeID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_split_party` FOREIGN KEY (`billedPartyID`) REFERENCES `billedparty` (`billedPartyID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billingsplit`
--

LOCK TABLES `billingsplit` WRITE;
/*!40000 ALTER TABLE `billingsplit` DISABLE KEYS */;
INSERT INTO `billingsplit` VALUES (1,287,101,0.70),(2,288,101,0.70),(3,289,101,0.70),(4,290,101,0.70),(5,291,101,0.70),(6,292,101,0.70),(7,293,101,0.70),(8,294,101,0.70),(9,295,101,0.70),(10,296,101,0.70),(11,297,101,0.70),(12,298,101,0.70),(13,299,101,0.70),(14,300,101,0.70),(15,301,101,0.70),(16,287,4,0.30),(17,288,8,0.30),(18,289,12,0.30),(19,290,16,0.30),(20,291,24,0.30),(21,292,28,0.30),(22,293,32,0.30),(23,294,36,0.30),(24,295,44,0.30),(25,296,48,0.30),(26,297,52,0.30),(27,298,56,0.30),(28,299,64,0.30),(29,300,68,0.30),(30,301,72,0.30);
/*!40000 ALTER TABLE `billingsplit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `building`
--

DROP TABLE IF EXISTS `building`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `building` (
  `buildingID` int NOT NULL AUTO_INCREMENT,
  `buildingName` varchar(100) NOT NULL,
  `location` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`buildingID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `building`
--

LOCK TABLES `building` WRITE;
/*!40000 ALTER TABLE `building` DISABLE KEYS */;
INSERT INTO `building` VALUES (1,'Golden Tower','Mountainview'),(2,'Cliff Hub','Oceanview');
/*!40000 ALTER TABLE `building` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cardreader`
--

DROP TABLE IF EXISTS `cardreader`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cardreader` (
  `cardReaderID` int NOT NULL AUTO_INCREMENT,
  `location` varchar(120) NOT NULL,
  `readerType` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`cardReaderID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cardreader`
--

LOCK TABLES `cardreader` WRITE;
/*!40000 ALTER TABLE `cardreader` DISABLE KEYS */;
INSERT INTO `cardreader` VALUES (1,'Golden Tower Lobby','Entry'),(2,'Umi Wing Lift','Elevator'),(3,'Minami Wing Lift','Elevator'),(4,'Cliff Hub Lobby','Entry'),(5,'Event Floor Access','Event');
/*!40000 ALTER TABLE `cardreader` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `charge`
--

DROP TABLE IF EXISTS `charge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `charge` (
  `chargeID` int NOT NULL AUTO_INCREMENT,
  `billedPartyID` int NOT NULL,
  `serviceTypeID` int NOT NULL,
  `roomID` int DEFAULT NULL,
  `guestID` int DEFAULT NULL,
  `quantity` int NOT NULL DEFAULT '1',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `chargeDate` datetime NOT NULL,
  PRIMARY KEY (`chargeID`),
  KEY `fk_charge_party` (`billedPartyID`),
  KEY `fk_charge_service` (`serviceTypeID`),
  KEY `fk_charge_room` (`roomID`),
  KEY `fk_charge_guest` (`guestID`),
  KEY `idx_charge_date` (`chargeDate`),
  CONSTRAINT `fk_charge_guest` FOREIGN KEY (`guestID`) REFERENCES `guest` (`guestID`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_charge_party` FOREIGN KEY (`billedPartyID`) REFERENCES `billedparty` (`billedPartyID`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_charge_room` FOREIGN KEY (`roomID`) REFERENCES `room` (`roomID`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_charge_service` FOREIGN KEY (`serviceTypeID`) REFERENCES `servicetype` (`serviceTypeID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=443 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `charge`
--

LOCK TABLES `charge` WRITE;
/*!40000 ALTER TABLE `charge` DISABLE KEYS */;
INSERT INTO `charge` VALUES (1,1,1,1,1,1,175.00,'2025-10-02 09:15:00'),(2,61,1,1,61,1,175.00,'2025-12-01 09:15:00'),(3,41,1,1,41,1,175.00,'2025-11-01 09:15:00'),(4,2,1,2,2,2,175.00,'2025-10-04 09:15:00'),(5,62,1,2,62,2,175.00,'2025-12-03 09:15:00'),(6,42,1,2,42,2,175.00,'2025-11-03 09:15:00'),(7,3,1,3,3,3,175.00,'2025-10-06 09:15:00'),(8,63,1,3,63,3,175.00,'2025-12-05 09:15:00'),(9,43,1,3,43,3,175.00,'2025-11-05 09:15:00'),(10,4,1,4,4,4,175.00,'2025-10-08 09:15:00'),(11,64,1,4,64,4,175.00,'2025-12-07 09:15:00'),(12,44,1,4,44,4,175.00,'2025-11-07 09:15:00'),(13,5,1,5,5,5,175.00,'2025-10-10 09:15:00'),(14,65,1,5,65,5,175.00,'2025-12-09 09:15:00'),(15,45,1,5,45,5,175.00,'2025-11-09 09:15:00'),(16,6,1,6,6,1,235.00,'2025-10-07 09:15:00'),(17,66,1,6,66,1,235.00,'2025-12-06 09:15:00'),(18,46,1,6,46,1,235.00,'2025-11-06 09:15:00'),(19,7,1,7,7,2,235.00,'2025-10-09 09:15:00'),(20,67,1,7,67,2,235.00,'2025-12-08 09:15:00'),(21,47,1,7,47,2,235.00,'2025-11-08 09:15:00'),(22,8,1,8,8,3,235.00,'2025-10-11 09:15:00'),(23,68,1,8,68,3,235.00,'2025-12-10 09:15:00'),(24,48,1,8,48,3,235.00,'2025-11-10 09:15:00'),(25,9,1,9,9,4,410.00,'2025-10-13 09:15:00'),(26,69,1,9,69,4,410.00,'2025-12-12 09:15:00'),(27,49,1,9,49,4,410.00,'2025-11-12 09:15:00'),(28,11,1,11,11,1,175.00,'2025-10-12 09:15:00'),(29,71,1,11,71,1,175.00,'2025-12-11 09:15:00'),(30,51,1,11,51,1,175.00,'2025-11-11 09:15:00'),(31,12,1,12,12,2,175.00,'2025-10-14 09:15:00'),(32,72,1,12,72,2,175.00,'2025-12-13 09:15:00'),(33,52,1,12,52,2,175.00,'2025-11-13 09:15:00'),(34,13,1,13,13,3,175.00,'2025-10-16 09:15:00'),(35,73,1,13,73,3,175.00,'2025-12-15 09:15:00'),(36,53,1,13,53,3,175.00,'2025-11-15 09:15:00'),(37,14,1,14,14,4,175.00,'2025-10-18 09:15:00'),(38,74,1,14,74,4,175.00,'2025-12-17 09:15:00'),(39,54,1,14,54,4,175.00,'2025-11-17 09:15:00'),(40,15,1,15,15,5,175.00,'2025-10-20 09:15:00'),(41,75,1,15,75,5,175.00,'2025-12-19 09:15:00'),(42,55,1,15,55,5,175.00,'2025-11-19 09:15:00'),(43,16,1,16,16,1,235.00,'2025-10-17 09:15:00'),(44,76,1,16,76,1,235.00,'2025-12-16 09:15:00'),(45,56,1,16,56,1,235.00,'2025-11-16 09:15:00'),(46,17,1,17,17,2,235.00,'2025-10-19 09:15:00'),(47,77,1,17,77,2,235.00,'2025-12-18 09:15:00'),(48,57,1,17,57,2,235.00,'2025-11-18 09:15:00'),(49,18,1,18,18,3,235.00,'2025-10-21 09:15:00'),(50,78,1,18,78,3,235.00,'2025-12-20 09:15:00'),(51,58,1,18,58,3,235.00,'2025-11-20 09:15:00'),(52,19,1,19,19,4,410.00,'2025-10-23 09:15:00'),(53,79,1,19,79,4,410.00,'2025-12-22 09:15:00'),(54,59,1,19,59,4,410.00,'2025-11-22 09:15:00'),(55,21,1,21,21,1,175.00,'2025-10-22 09:15:00'),(56,1,1,21,1,1,175.00,'2025-12-21 09:15:00'),(57,61,1,21,61,1,175.00,'2025-11-21 09:15:00'),(58,22,1,22,22,2,175.00,'2025-10-24 09:15:00'),(59,2,1,22,2,2,175.00,'2025-12-23 09:15:00'),(60,62,1,22,62,2,175.00,'2025-11-23 09:15:00'),(61,23,1,23,23,3,175.00,'2025-10-26 09:15:00'),(62,3,1,23,3,3,175.00,'2025-12-25 09:15:00'),(63,63,1,23,63,3,175.00,'2025-11-25 09:15:00'),(64,24,1,24,24,4,175.00,'2025-10-28 09:15:00'),(65,4,1,24,4,4,175.00,'2025-12-27 09:15:00'),(66,64,1,24,64,4,175.00,'2025-11-27 09:15:00'),(67,25,1,25,25,5,175.00,'2025-10-30 09:15:00'),(68,5,1,25,5,5,175.00,'2025-12-29 09:15:00'),(69,65,1,25,65,5,175.00,'2025-11-29 09:15:00'),(70,26,1,26,26,1,235.00,'2025-10-27 09:15:00'),(71,6,1,26,6,1,235.00,'2025-12-26 09:15:00'),(72,66,1,26,66,1,235.00,'2025-11-26 09:15:00'),(73,27,1,27,27,2,235.00,'2025-10-29 09:15:00'),(74,7,1,27,7,2,235.00,'2025-12-28 09:15:00'),(75,67,1,27,67,2,235.00,'2025-11-28 09:15:00'),(76,28,1,28,28,3,235.00,'2025-10-31 09:15:00'),(77,8,1,28,8,3,235.00,'2025-12-30 09:15:00'),(78,68,1,28,68,3,235.00,'2025-11-30 09:15:00'),(79,29,1,29,29,4,410.00,'2025-11-02 09:15:00'),(80,9,1,29,9,4,410.00,'2026-01-01 09:15:00'),(81,69,1,29,69,4,410.00,'2025-12-02 09:15:00'),(82,31,1,31,31,1,175.00,'2025-11-01 09:15:00'),(83,11,1,31,11,1,175.00,'2025-10-02 09:15:00'),(84,71,1,31,71,1,175.00,'2025-12-01 09:15:00'),(85,32,1,32,32,2,175.00,'2025-11-03 09:15:00'),(86,12,1,32,12,2,175.00,'2025-10-04 09:15:00'),(87,72,1,32,72,2,175.00,'2025-12-03 09:15:00'),(88,33,1,33,33,3,175.00,'2025-11-05 09:15:00'),(89,13,1,33,13,3,175.00,'2025-10-06 09:15:00'),(90,73,1,33,73,3,175.00,'2025-12-05 09:15:00'),(91,34,1,34,34,4,175.00,'2025-11-07 09:15:00'),(92,14,1,34,14,4,175.00,'2025-10-08 09:15:00'),(93,74,1,34,74,4,175.00,'2025-12-07 09:15:00'),(94,35,1,35,35,5,175.00,'2025-11-09 09:15:00'),(95,15,1,35,15,5,175.00,'2025-10-10 09:15:00'),(96,75,1,35,75,5,175.00,'2025-12-09 09:15:00'),(97,36,1,36,36,1,235.00,'2025-11-06 09:15:00'),(98,16,1,36,16,1,235.00,'2025-10-07 09:15:00'),(99,76,1,36,76,1,235.00,'2025-12-06 09:15:00'),(100,37,1,37,37,2,235.00,'2025-11-08 09:15:00'),(101,17,1,37,17,2,235.00,'2025-10-09 09:15:00'),(102,77,1,37,77,2,235.00,'2025-12-08 09:15:00'),(103,38,1,38,38,3,235.00,'2025-11-10 09:15:00'),(104,18,1,38,18,3,235.00,'2025-10-11 09:15:00'),(105,78,1,38,78,3,235.00,'2025-12-10 09:15:00'),(106,39,1,39,39,4,410.00,'2025-11-12 09:15:00'),(107,19,1,39,19,4,410.00,'2025-10-13 09:15:00'),(108,79,1,39,79,4,410.00,'2025-12-12 09:15:00'),(109,41,1,41,41,1,175.00,'2025-11-11 09:15:00'),(110,21,1,41,21,1,175.00,'2025-10-12 09:15:00'),(111,1,1,41,1,1,175.00,'2025-12-11 09:15:00'),(112,42,1,42,42,2,175.00,'2025-11-13 09:15:00'),(113,22,1,42,22,2,175.00,'2025-10-14 09:15:00'),(114,2,1,42,2,2,175.00,'2025-12-13 09:15:00'),(115,43,1,43,43,3,175.00,'2025-11-15 09:15:00'),(116,23,1,43,23,3,175.00,'2025-10-16 09:15:00'),(117,3,1,43,3,3,175.00,'2025-12-15 09:15:00'),(118,44,1,44,44,4,175.00,'2025-11-17 09:15:00'),(119,24,1,44,24,4,175.00,'2025-10-18 09:15:00'),(120,4,1,44,4,4,175.00,'2025-12-17 09:15:00'),(121,45,1,45,45,5,175.00,'2025-11-19 09:15:00'),(122,25,1,45,25,5,175.00,'2025-10-20 09:15:00'),(123,5,1,45,5,5,175.00,'2025-12-19 09:15:00'),(124,46,1,46,46,1,235.00,'2025-11-16 09:15:00'),(125,26,1,46,26,1,235.00,'2025-10-17 09:15:00'),(126,6,1,46,6,1,235.00,'2025-12-16 09:15:00'),(127,47,1,47,47,2,235.00,'2025-11-18 09:15:00'),(128,27,1,47,27,2,235.00,'2025-10-19 09:15:00'),(129,7,1,47,7,2,235.00,'2025-12-18 09:15:00'),(130,48,1,48,48,3,235.00,'2025-11-20 09:15:00'),(131,28,1,48,28,3,235.00,'2025-10-21 09:15:00'),(132,8,1,48,8,3,235.00,'2025-12-20 09:15:00'),(133,49,1,49,49,4,410.00,'2025-11-22 09:15:00'),(134,29,1,49,29,4,410.00,'2025-10-23 09:15:00'),(135,9,1,49,9,4,410.00,'2025-12-22 09:15:00'),(136,51,1,51,51,1,175.00,'2025-11-21 09:15:00'),(137,31,1,51,31,1,175.00,'2025-10-22 09:15:00'),(138,11,1,51,11,1,175.00,'2025-12-21 09:15:00'),(139,52,1,52,52,2,175.00,'2025-11-23 09:15:00'),(140,32,1,52,32,2,175.00,'2025-10-24 09:15:00'),(141,12,1,52,12,2,175.00,'2025-12-23 09:15:00'),(142,53,1,53,53,3,175.00,'2025-11-25 09:15:00'),(143,33,1,53,33,3,175.00,'2025-10-26 09:15:00'),(144,13,1,53,13,3,175.00,'2025-12-25 09:15:00'),(145,54,1,54,54,4,175.00,'2025-11-27 09:15:00'),(146,34,1,54,34,4,175.00,'2025-10-28 09:15:00'),(147,14,1,54,14,4,175.00,'2025-12-27 09:15:00'),(148,55,1,55,55,5,175.00,'2025-11-29 09:15:00'),(149,35,1,55,35,5,175.00,'2025-10-30 09:15:00'),(150,15,1,55,15,5,175.00,'2025-12-29 09:15:00'),(151,56,1,56,56,1,235.00,'2025-11-26 09:15:00'),(152,36,1,56,36,1,235.00,'2025-10-27 09:15:00'),(153,16,1,56,16,1,235.00,'2025-12-26 09:15:00'),(154,57,1,57,57,2,235.00,'2025-11-28 09:15:00'),(155,37,1,57,37,2,235.00,'2025-10-29 09:15:00'),(156,17,1,57,17,2,235.00,'2025-12-28 09:15:00'),(157,58,1,58,58,3,235.00,'2025-11-30 09:15:00'),(158,38,1,58,38,3,235.00,'2025-10-31 09:15:00'),(159,18,1,58,18,3,235.00,'2025-12-30 09:15:00'),(160,59,1,59,59,4,410.00,'2025-12-02 09:15:00'),(161,39,1,59,39,4,410.00,'2025-11-02 09:15:00'),(162,19,1,59,19,4,410.00,'2026-01-01 09:15:00'),(256,6,2,NULL,6,1,120.00,'2025-10-06 14:30:00'),(257,12,2,NULL,12,1,120.00,'2025-10-12 14:30:00'),(258,18,2,NULL,18,1,120.00,'2025-10-18 14:30:00'),(259,24,2,NULL,24,1,120.00,'2025-10-24 14:30:00'),(260,36,2,NULL,36,1,120.00,'2025-11-05 14:30:00'),(261,42,2,NULL,42,1,120.00,'2025-11-11 14:30:00'),(262,48,2,NULL,48,1,120.00,'2025-11-17 14:30:00'),(263,54,2,NULL,54,1,120.00,'2025-11-23 14:30:00'),(264,66,2,NULL,66,1,120.00,'2025-12-05 14:30:00'),(265,72,2,NULL,72,1,120.00,'2025-12-11 14:30:00'),(266,78,2,NULL,78,1,120.00,'2025-12-17 14:30:00'),(267,4,2,NULL,4,1,120.00,'2025-12-23 14:30:00'),(268,16,2,NULL,16,1,120.00,'2025-10-06 14:30:00'),(269,22,2,NULL,22,1,120.00,'2025-10-12 14:30:00'),(270,28,2,NULL,28,1,120.00,'2025-10-18 14:30:00'),(271,34,2,NULL,34,1,120.00,'2025-10-24 14:30:00'),(272,46,2,NULL,46,1,120.00,'2025-11-05 14:30:00'),(273,52,2,NULL,52,1,120.00,'2025-11-11 14:30:00'),(274,58,2,NULL,58,1,120.00,'2025-11-17 14:30:00'),(275,64,2,NULL,64,1,120.00,'2025-11-23 14:30:00'),(276,76,2,NULL,76,1,120.00,'2025-12-05 14:30:00'),(277,2,2,NULL,2,1,120.00,'2025-12-11 14:30:00'),(278,8,2,NULL,8,1,120.00,'2025-12-17 14:30:00'),(279,14,2,NULL,14,1,120.00,'2025-12-23 14:30:00'),(287,4,3,4,4,2,25.00,'2025-10-04 19:45:00'),(288,8,3,8,8,3,25.00,'2025-10-08 19:45:00'),(289,12,3,12,12,1,25.00,'2025-10-12 19:45:00'),(290,16,3,16,16,2,25.00,'2025-10-16 19:45:00'),(291,24,3,24,24,1,25.00,'2025-10-24 19:45:00'),(292,28,3,28,28,2,25.00,'2025-10-28 19:45:00'),(293,32,3,32,32,3,25.00,'2025-11-01 19:45:00'),(294,36,3,36,36,1,25.00,'2025-11-05 19:45:00'),(295,44,3,44,44,3,25.00,'2025-11-13 19:45:00'),(296,48,3,48,48,1,25.00,'2025-11-17 19:45:00'),(297,52,3,52,52,2,25.00,'2025-11-21 19:45:00'),(298,56,3,56,56,3,25.00,'2025-11-25 19:45:00'),(299,64,3,4,64,2,25.00,'2025-12-03 19:45:00'),(300,68,3,8,68,3,25.00,'2025-12-07 19:45:00'),(301,72,3,12,72,1,25.00,'2025-12-11 19:45:00'),(302,76,3,16,76,2,25.00,'2025-12-15 19:45:00'),(303,4,3,24,4,1,25.00,'2025-12-23 19:45:00'),(304,8,3,28,8,2,25.00,'2025-12-27 19:45:00'),(305,12,3,32,12,3,25.00,'2025-10-02 19:45:00'),(306,16,3,36,16,1,25.00,'2025-10-06 19:45:00'),(307,24,3,44,24,3,25.00,'2025-10-14 19:45:00'),(308,28,3,48,28,1,25.00,'2025-10-18 19:45:00'),(309,32,3,52,32,2,25.00,'2025-10-22 19:45:00'),(310,36,3,56,36,3,25.00,'2025-10-26 19:45:00'),(311,44,3,4,44,2,25.00,'2025-11-03 19:45:00'),(312,48,3,8,48,3,25.00,'2025-11-07 19:45:00'),(313,52,3,12,52,1,25.00,'2025-11-11 19:45:00'),(314,56,3,16,56,2,25.00,'2025-11-15 19:45:00'),(315,64,3,24,64,1,25.00,'2025-11-23 19:45:00'),(316,68,3,28,68,2,25.00,'2025-11-27 19:45:00'),(317,72,3,32,72,3,25.00,'2025-12-01 19:45:00'),(318,76,3,36,76,1,25.00,'2025-12-05 19:45:00'),(319,4,3,44,4,3,25.00,'2025-12-13 19:45:00'),(320,8,3,48,8,1,25.00,'2025-12-17 19:45:00'),(321,12,3,52,12,2,25.00,'2025-12-21 19:45:00'),(322,16,3,56,16,3,25.00,'2025-12-25 19:45:00'),(350,5,5,NULL,5,5,30.00,'2025-10-10 08:30:00'),(351,15,5,NULL,15,5,30.00,'2025-10-20 08:30:00'),(352,25,5,NULL,25,5,30.00,'2025-10-30 08:30:00'),(353,35,5,NULL,35,5,30.00,'2025-11-09 08:30:00'),(354,45,5,NULL,45,5,30.00,'2025-11-19 08:30:00'),(355,55,5,NULL,55,5,30.00,'2025-11-29 08:30:00'),(356,65,5,NULL,65,5,30.00,'2025-12-09 08:30:00'),(357,75,5,NULL,75,5,30.00,'2025-12-19 08:30:00'),(358,5,5,NULL,5,5,30.00,'2025-12-29 08:30:00'),(359,15,5,NULL,15,5,30.00,'2025-10-10 08:30:00'),(360,25,5,NULL,25,5,30.00,'2025-10-20 08:30:00'),(361,35,5,NULL,35,5,30.00,'2025-10-30 08:30:00'),(362,45,5,NULL,45,5,30.00,'2025-11-09 08:30:00'),(363,55,5,NULL,55,5,30.00,'2025-11-19 08:30:00'),(364,65,5,NULL,65,5,30.00,'2025-11-29 08:30:00'),(365,75,5,NULL,75,5,30.00,'2025-12-09 08:30:00'),(366,5,5,NULL,5,5,30.00,'2025-12-19 08:30:00'),(367,15,5,NULL,15,5,30.00,'2025-12-29 08:30:00'),(381,9,6,9,9,2,15.00,'2025-10-09 21:50:00'),(382,18,6,18,18,3,15.00,'2025-10-18 21:50:00'),(383,27,6,27,27,4,15.00,'2025-10-27 21:50:00'),(384,36,6,36,36,1,15.00,'2025-11-05 21:50:00'),(385,45,6,45,45,2,15.00,'2025-11-14 21:50:00'),(386,54,6,54,54,3,15.00,'2025-11-23 21:50:00'),(387,63,6,3,63,4,15.00,'2025-12-02 21:50:00'),(388,72,6,12,72,1,15.00,'2025-12-11 21:50:00'),(389,1,6,21,1,2,15.00,'2025-12-20 21:50:00'),(390,19,6,39,19,4,15.00,'2025-10-09 21:50:00'),(391,28,6,48,28,1,15.00,'2025-10-18 21:50:00'),(392,37,6,57,37,2,15.00,'2025-10-27 21:50:00'),(393,46,6,6,46,3,15.00,'2025-11-05 21:50:00'),(394,55,6,15,55,4,15.00,'2025-11-14 21:50:00'),(395,64,6,24,64,1,15.00,'2025-11-23 21:50:00'),(396,73,6,33,73,2,15.00,'2025-12-02 21:50:00'),(397,2,6,42,2,3,15.00,'2025-12-11 21:50:00'),(398,11,6,51,11,4,15.00,'2025-12-20 21:50:00'),(412,101,4,61,NULL,1,650.00,'2025-11-03 17:10:00'),(413,102,4,62,NULL,1,820.00,'2025-11-05 17:10:00'),(414,103,4,63,NULL,1,520.00,'2025-11-07 17:10:00'),(415,104,4,64,NULL,1,980.00,'2025-11-09 17:10:00'),(416,105,4,61,NULL,1,650.00,'2025-11-11 17:10:00'),(417,101,4,62,NULL,1,820.00,'2025-11-13 17:10:00'),(418,102,4,63,NULL,1,520.00,'2025-11-15 17:10:00'),(419,103,4,64,NULL,1,980.00,'2025-11-17 17:10:00'),(420,104,4,61,NULL,1,650.00,'2025-11-19 17:10:00'),(421,105,4,62,NULL,1,820.00,'2025-11-21 17:10:00'),(422,101,4,63,NULL,1,520.00,'2025-11-23 17:10:00'),(423,102,4,64,NULL,1,980.00,'2025-11-25 17:10:00'),(424,103,4,61,NULL,1,650.00,'2025-11-27 17:10:00'),(425,104,4,62,NULL,1,820.00,'2025-11-29 17:10:00'),(426,105,4,63,NULL,1,520.00,'2025-12-01 17:10:00'),(427,101,4,64,NULL,1,980.00,'2025-12-03 17:10:00'),(428,102,4,61,NULL,1,650.00,'2025-12-05 17:10:00'),(429,103,4,62,NULL,1,820.00,'2025-12-07 17:10:00'),(430,104,4,63,NULL,1,520.00,'2025-12-09 17:10:00'),(431,105,4,64,NULL,1,980.00,'2025-12-11 17:10:00');
/*!40000 ALTER TABLE `charge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event` (
  `eventID` int NOT NULL AUTO_INCREMENT,
  `eventName` varchar(120) NOT NULL,
  `hostID` int NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `estimatedAttendance` int DEFAULT NULL,
  `startDate` date NOT NULL,
  `endDate` date NOT NULL,
  PRIMARY KEY (`eventID`),
  KEY `fk_event_host` (`hostID`),
  CONSTRAINT `fk_event_host` FOREIGN KEY (`hostID`) REFERENCES `billedparty` (`billedPartyID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event`
--

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
INSERT INTO `event` VALUES (1,'Golden Gathering 1',101,'Private booking for training, retreat, or social event.',31,'2025-11-03','2025-11-03'),(2,'Golden Gathering 2',102,'Private booking for training, retreat, or social event.',34,'2025-11-05','2025-11-05'),(3,'Golden Gathering 3',103,'Private booking for training, retreat, or social event.',37,'2025-11-07','2025-11-07'),(4,'Golden Gathering 4',104,'Private booking for training, retreat, or social event.',40,'2025-11-09','2025-11-09'),(5,'Golden Gathering 5',105,'Private booking for training, retreat, or social event.',43,'2025-11-11','2025-11-11'),(6,'Golden Gathering 6',101,'Private booking for training, retreat, or social event.',46,'2025-11-13','2025-11-13'),(7,'Golden Gathering 7',102,'Private booking for training, retreat, or social event.',49,'2025-11-15','2025-11-15'),(8,'Golden Gathering 8',103,'Private booking for training, retreat, or social event.',52,'2025-11-17','2025-11-17'),(9,'Golden Gathering 9',104,'Private booking for training, retreat, or social event.',55,'2025-11-19','2025-11-19'),(10,'Golden Gathering 10',105,'Private booking for training, retreat, or social event.',58,'2025-11-21','2025-11-21'),(11,'Golden Gathering 11',101,'Private booking for training, retreat, or social event.',61,'2025-11-23','2025-11-23'),(12,'Golden Gathering 12',102,'Private booking for training, retreat, or social event.',64,'2025-11-25','2025-11-25'),(13,'Golden Gathering 13',103,'Private booking for training, retreat, or social event.',67,'2025-11-27','2025-11-27'),(14,'Golden Gathering 14',104,'Private booking for training, retreat, or social event.',70,'2025-11-29','2025-11-29'),(15,'Golden Gathering 15',105,'Private booking for training, retreat, or social event.',73,'2025-12-01','2025-12-01'),(16,'Golden Gathering 16',101,'Private booking for training, retreat, or social event.',76,'2025-12-03','2025-12-03'),(17,'Golden Gathering 17',102,'Private booking for training, retreat, or social event.',79,'2025-12-05','2025-12-05'),(18,'Golden Gathering 18',103,'Private booking for training, retreat, or social event.',82,'2025-12-07','2025-12-07'),(19,'Golden Gathering 19',104,'Private booking for training, retreat, or social event.',85,'2025-12-09','2025-12-09'),(20,'Golden Gathering 20',105,'Private booking for training, retreat, or social event.',88,'2025-12-11','2025-12-11');
/*!40000 ALTER TABLE `event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventroomusage`
--

DROP TABLE IF EXISTS `eventroomusage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eventroomusage` (
  `eventRoomID` int NOT NULL AUTO_INCREMENT,
  `eventID` int NOT NULL,
  `roomID` int NOT NULL,
  `usageType` varchar(50) NOT NULL,
  `scheduledStart` datetime NOT NULL,
  `scheduledEnd` datetime NOT NULL,
  `actualStart` datetime DEFAULT NULL,
  `actualEnd` datetime DEFAULT NULL,
  `chargeRate` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`eventRoomID`),
  KEY `fk_eru_event` (`eventID`),
  KEY `fk_eru_room` (`roomID`),
  CONSTRAINT `fk_eru_event` FOREIGN KEY (`eventID`) REFERENCES `event` (`eventID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_eru_room` FOREIGN KEY (`roomID`) REFERENCES `room` (`roomID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventroomusage`
--

LOCK TABLES `eventroomusage` WRITE;
/*!40000 ALTER TABLE `eventroomusage` DISABLE KEYS */;
INSERT INTO `eventroomusage` VALUES (1,1,61,'Workshop','2025-11-03 09:30:00','2025-11-03 15:30:00','2025-11-03 09:37:00','2025-11-03 15:20:00',650.00),(2,2,62,'Meeting','2025-11-05 09:30:00','2025-11-05 15:30:00','2025-11-05 09:44:00','2025-11-05 15:30:00',820.00),(3,3,63,'Mixer','2025-11-07 09:30:00','2025-11-07 15:30:00','2025-11-07 09:51:00','2025-11-07 15:50:00',520.00),(4,4,64,'Workshop','2025-11-09 09:30:00','2025-11-09 15:30:00','2025-11-09 09:30:00','2025-11-09 15:50:00',980.00),(5,5,61,'Meeting','2025-11-11 09:30:00','2025-11-11 15:30:00','2025-11-11 09:37:00','2025-11-11 15:50:00',650.00),(6,6,62,'Mixer','2025-11-13 09:30:00','2025-11-13 15:30:00','2025-11-13 09:44:00','2025-11-13 15:05:00',820.00),(7,7,63,'Workshop','2025-11-15 09:30:00','2025-11-15 15:30:00','2025-11-15 09:51:00','2025-11-15 15:20:00',520.00),(8,8,64,'Meeting','2025-11-17 09:30:00','2025-11-17 15:30:00','2025-11-17 09:30:00','2025-11-17 15:30:00',980.00),(9,9,61,'Mixer','2025-11-19 09:30:00','2025-11-19 15:30:00','2025-11-19 09:37:00','2025-11-19 15:50:00',650.00),(10,10,62,'Workshop','2025-11-21 09:30:00','2025-11-21 15:30:00','2025-11-21 09:44:00','2025-11-21 15:50:00',820.00),(11,11,63,'Meeting','2025-11-23 09:30:00','2025-11-23 15:30:00','2025-11-23 09:51:00','2025-11-23 15:50:00',520.00),(12,12,64,'Mixer','2025-11-25 09:30:00','2025-11-25 15:30:00','2025-11-25 09:30:00','2025-11-25 15:05:00',980.00),(13,13,61,'Workshop','2025-11-27 09:30:00','2025-11-27 15:30:00','2025-11-27 09:37:00','2025-11-27 15:20:00',650.00),(14,14,62,'Meeting','2025-11-29 09:30:00','2025-11-29 15:30:00','2025-11-29 09:44:00','2025-11-29 15:30:00',820.00),(15,15,63,'Mixer','2025-12-01 09:30:00','2025-12-01 15:30:00','2025-12-01 09:51:00','2025-12-01 15:50:00',520.00),(16,16,64,'Workshop','2025-12-03 09:30:00','2025-12-03 15:30:00','2025-12-03 09:30:00','2025-12-03 15:50:00',980.00),(17,17,61,'Meeting','2025-12-05 09:30:00','2025-12-05 15:30:00','2025-12-05 09:37:00','2025-12-05 15:50:00',650.00),(18,18,62,'Mixer','2025-12-07 09:30:00','2025-12-07 15:30:00','2025-12-07 09:44:00','2025-12-07 15:05:00',820.00),(19,19,63,'Workshop','2025-12-09 09:30:00','2025-12-09 15:30:00','2025-12-09 09:51:00','2025-12-09 15:20:00',520.00),(20,20,64,'Meeting','2025-12-11 09:30:00','2025-12-11 15:30:00','2025-12-11 09:30:00','2025-12-11 15:30:00',980.00);
/*!40000 ALTER TABLE `eventroomusage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `featuresinroom`
--

DROP TABLE IF EXISTS `featuresinroom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `featuresinroom` (
  `roomID` int NOT NULL,
  `roomFeatureID` int NOT NULL,
  PRIMARY KEY (`roomID`,`roomFeatureID`),
  KEY `fk_features_feature` (`roomFeatureID`),
  CONSTRAINT `fk_features_feature` FOREIGN KEY (`roomFeatureID`) REFERENCES `roomfeature` (`roomFeatureID`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_features_room` FOREIGN KEY (`roomID`) REFERENCES `room` (`roomID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `featuresinroom`
--

LOCK TABLES `featuresinroom` WRITE;
/*!40000 ALTER TABLE `featuresinroom` DISABLE KEYS */;
INSERT INTO `featuresinroom` VALUES (6,1),(7,1),(8,1),(9,1),(10,1),(16,1),(17,1),(18,1),(19,1),(20,1),(26,1),(27,1),(28,1),(29,1),(30,1),(36,1),(37,1),(38,1),(39,1),(40,1),(46,1),(47,1),(48,1),(49,1),(50,1),(56,1),(57,1),(58,1),(59,1),(60,1),(6,2),(7,2),(8,2),(9,2),(10,2),(16,2),(17,2),(18,2),(19,2),(20,2),(26,2),(27,2),(28,2),(29,2),(30,2),(36,2),(37,2),(38,2),(39,2),(40,2),(46,2),(47,2),(48,2),(49,2),(50,2),(56,2),(57,2),(58,2),(59,2),(60,2),(1,3),(2,3),(3,3),(4,3),(5,3),(6,3),(7,3),(8,3),(11,3),(12,3),(13,3),(14,3),(15,3),(16,3),(17,3),(18,3),(21,3),(22,3),(23,3),(24,3),(25,3),(26,3),(27,3),(28,3),(31,3),(32,3),(33,3),(34,3),(35,3),(36,3),(37,3),(38,3),(41,3),(42,3),(43,3),(44,3),(45,3),(46,3),(47,3),(48,3),(51,3),(52,3),(53,3),(54,3),(55,3),(56,3),(57,3),(58,3),(9,4),(10,4),(19,4),(20,4),(29,4),(30,4),(39,4),(40,4),(49,4),(50,4),(59,4),(60,4),(9,5),(10,5),(19,5),(20,5),(29,5),(30,5),(39,5),(40,5),(49,5),(50,5),(59,5),(60,5),(61,6),(62,6),(63,6),(64,6),(61,7),(62,7),(64,7);
/*!40000 ALTER TABLE `featuresinroom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `floor`
--

DROP TABLE IF EXISTS `floor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `floor` (
  `floorID` int NOT NULL AUTO_INCREMENT,
  `wingID` int NOT NULL,
  `floorNumber` int NOT NULL,
  `canSmoke` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`floorID`),
  KEY `fk_floor_wing` (`wingID`),
  CONSTRAINT `fk_floor_wing` FOREIGN KEY (`wingID`) REFERENCES `wing` (`wingID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `floor`
--

LOCK TABLES `floor` WRITE;
/*!40000 ALTER TABLE `floor` DISABLE KEYS */;
INSERT INTO `floor` VALUES (1,1,1,0),(2,1,2,0),(3,2,1,1),(4,2,2,0),(5,3,1,0),(6,4,1,0),(7,3,2,0);
/*!40000 ALTER TABLE `floor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guest`
--

DROP TABLE IF EXISTS `guest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guest` (
  `guestID` int NOT NULL AUTO_INCREMENT,
  `firstName` varchar(60) NOT NULL,
  `lastName` varchar(60) NOT NULL,
  `email` varchar(120) DEFAULT NULL,
  `phoneNum` varchar(30) DEFAULT NULL,
  `organization` varchar(120) DEFAULT NULL,
  `cardNum` varchar(50) DEFAULT NULL,
  `PIN` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`guestID`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guest`
--

LOCK TABLES `guest` WRITE;
/*!40000 ALTER TABLE `guest` DISABLE KEYS */;
INSERT INTO `guest` VALUES (1,'Guest1','LRH1','guest1@harbor.example.com','929-346-0001',NULL,'CARD-0001','1001'),(2,'Guest2','LRH2','guest2@harbor.example.com','929-346-0002',NULL,'CARD-0002','1002'),(3,'Guest3','LRH3','guest3@harbor.example.com','929-346-0003',NULL,'CARD-0003','1003'),(4,'Guest4','LRH4','guest4@harbor.example.com','929-346-0004',NULL,'CARD-0004','1004'),(5,'Guest5','LRH5','guest5@harbor.example.com','929-346-0005',NULL,'CARD-0005','1005'),(6,'Guest6','LRH6','guest6@harbor.example.com','929-346-0006',NULL,'CARD-0006','1006'),(7,'Guest7','LRH7','guest7@harbor.example.com','929-346-0007',NULL,'CARD-0007','1007'),(8,'Guest8','LRH8','guest8@harbor.example.com','929-346-0008',NULL,'CARD-0008','1008'),(9,'Guest9','LRH9','guest9@harbor.example.com','929-346-0009',NULL,'CARD-0009','1009'),(10,'Guest10','LRH10','guest10@harbor.example.com','929-346-0010','Peeksnack Events','CARD-0010','1010'),(11,'Guest11','LRH11','guest11@harbor.example.com','929-346-0011',NULL,'CARD-0011','1011'),(12,'Guest12','LRH12','guest12@harbor.example.com','929-346-0012',NULL,'CARD-0012','1012'),(13,'Guest13','LRH13','guest13@harbor.example.com','929-346-0013',NULL,'CARD-0013','1013'),(14,'Guest14','LRH14','guest14@harbor.example.com','929-346-0014',NULL,'CARD-0014','1014'),(15,'Guest15','LRH15','guest15@harbor.example.com','929-346-0015','Citizen Society','CARD-0015','1015'),(16,'Guest16','LRH16','guest16@harbor.example.com','929-346-0016',NULL,'CARD-0016','1016'),(17,'Guest17','LRH17','guest17@harbor.example.com','929-346-0017',NULL,'CARD-0017','1017'),(18,'Guest18','LRH18','guest18@harbor.example.com','929-346-0018',NULL,'CARD-0018','1018'),(19,'Guest19','LRH19','guest19@harbor.example.com','929-346-0019',NULL,'CARD-0019','1019'),(20,'Guest20','LRH20','guest20@harbor.example.com','929-346-0020','Peeksnack Events','CARD-0020','1020'),(21,'Guest21','LRH21','guest21@harbor.example.com','929-346-0021',NULL,'CARD-0021','1021'),(22,'Guest22','LRH22','guest22@harbor.example.com','929-346-0022',NULL,'CARD-0022','1022'),(23,'Guest23','LRH23','guest23@harbor.example.com','929-346-0023',NULL,'CARD-0023','1023'),(24,'Guest24','LRH24','guest24@harbor.example.com','929-346-0024',NULL,'CARD-0024','1024'),(25,'Guest25','LRH25','guest25@harbor.example.com','929-346-0025',NULL,'CARD-0025','1025'),(26,'Guest26','LRH26','guest26@harbor.example.com','929-346-0026',NULL,'CARD-0026','1026'),(27,'Guest27','LRH27','guest27@harbor.example.com','929-346-0027',NULL,'CARD-0027','1027'),(28,'Guest28','LRH28','guest28@harbor.example.com','929-346-0028',NULL,'CARD-0028','1028'),(29,'Guest29','LRH29','guest29@harbor.example.com','929-346-0029',NULL,'CARD-0029','1029'),(30,'Guest30','LRH30','guest30@harbor.example.com','929-346-0030','Peeksnack Events','CARD-0030','1030'),(31,'Guest31','LRH31','guest31@harbor.example.com','929-346-0031',NULL,'CARD-0031','1031'),(32,'Guest32','LRH32','guest32@harbor.example.com','929-346-0032',NULL,'CARD-0032','1032'),(33,'Guest33','LRH33','guest33@harbor.example.com','929-346-0033',NULL,'CARD-0033','1033'),(34,'Guest34','LRH34','guest34@harbor.example.com','929-346-0034',NULL,'CARD-0034','1034'),(35,'Guest35','LRH35','guest35@harbor.example.com','929-346-0035',NULL,'CARD-0035','1035'),(36,'Guest36','LRH36','guest36@harbor.example.com','929-346-0036',NULL,'CARD-0036','1036'),(37,'Guest37','LRH37','guest37@harbor.example.com','929-346-0037',NULL,'CARD-0037','1037'),(38,'Guest38','LRH38','guest38@harbor.example.com','929-346-0038',NULL,'CARD-0038','1038'),(39,'Guest39','LRH39','guest39@harbor.example.com','929-346-0039',NULL,'CARD-0039','1039'),(40,'Guest40','LRH40','guest40@harbor.example.com','929-346-0040','Peeksnack Events','CARD-0040','1040'),(41,'Guest41','LRH41','guest41@harbor.example.com','929-346-0041',NULL,'CARD-0041','1041'),(42,'Guest42','LRH42','guest42@harbor.example.com','929-346-0042',NULL,'CARD-0042','1042'),(43,'Guest43','LRH43','guest43@harbor.example.com','929-346-0043',NULL,'CARD-0043','1043'),(44,'Guest44','LRH44','guest44@harbor.example.com','929-346-0044',NULL,'CARD-0044','1044'),(45,'Guest45','LRH45','guest45@harbor.example.com','929-346-0045','Citizen Society','CARD-0045','1045'),(46,'Guest46','LRH46','guest46@harbor.example.com','929-346-0046',NULL,'CARD-0046','1046'),(47,'Guest47','LRH47','guest47@harbor.example.com','929-346-0047',NULL,'CARD-0047','1047'),(48,'Guest48','LRH48','guest48@harbor.example.com','929-346-0048',NULL,'CARD-0048','1048'),(49,'Guest49','LRH49','guest49@harbor.example.com','929-346-0049',NULL,'CARD-0049','1049'),(50,'Guest50','LRH50','guest50@harbor.example.com','929-346-0050','Peeksnack Events','CARD-0050','1050'),(51,'Guest51','LRH51','guest51@harbor.example.com','929-346-0051',NULL,'CARD-0051','1051'),(52,'Guest52','LRH52','guest52@harbor.example.com','929-346-0052',NULL,'CARD-0052','1052'),(53,'Guest53','LRH53','guest53@harbor.example.com','929-346-0053',NULL,'CARD-0053','1053'),(54,'Guest54','LRH54','guest54@harbor.example.com','929-346-0054',NULL,'CARD-0054','1054'),(55,'Guest55','LRH55','guest55@harbor.example.com','929-346-0055',NULL,'CARD-0055','1055'),(56,'Guest56','LRH56','guest56@harbor.example.com','929-346-0056',NULL,'CARD-0056','1056'),(57,'Guest57','LRH57','guest57@harbor.example.com','929-346-0057',NULL,'CARD-0057','1057'),(58,'Guest58','LRH58','guest58@harbor.example.com','929-346-0058',NULL,'CARD-0058','1058'),(59,'Guest59','LRH59','guest59@harbor.example.com','929-346-0059',NULL,'CARD-0059','1059'),(60,'Guest60','LRH60','guest60@harbor.example.com','929-346-0060','Peeksnack Events','CARD-0060','1060'),(61,'Guest61','LRH61','guest61@harbor.example.com','929-346-0061',NULL,'CARD-0061','1061'),(62,'Guest62','LRH62','guest62@harbor.example.com','929-346-0062',NULL,'CARD-0062','1062'),(63,'Guest63','LRH63','guest63@harbor.example.com','929-346-0063',NULL,'CARD-0063','1063'),(64,'Guest64','LRH64','guest64@harbor.example.com','929-346-0064',NULL,'CARD-0064','1064'),(65,'Guest65','LRH65','guest65@harbor.example.com','929-346-0065',NULL,'CARD-0065','1065'),(66,'Guest66','LRH66','guest66@harbor.example.com','929-346-0066',NULL,'CARD-0066','1066'),(67,'Guest67','LRH67','guest67@harbor.example.com','929-346-0067',NULL,'CARD-0067','1067'),(68,'Guest68','LRH68','guest68@harbor.example.com','929-346-0068',NULL,'CARD-0068','1068'),(69,'Guest69','LRH69','guest69@harbor.example.com','929-346-0069',NULL,'CARD-0069','1069'),(70,'Guest70','LRH70','guest70@harbor.example.com','929-346-0070','Peeksnack Events','CARD-0070','1070'),(71,'Guest71','LRH71','guest71@harbor.example.com','929-346-0071',NULL,'CARD-0071','1071'),(72,'Guest72','LRH72','guest72@harbor.example.com','929-346-0072',NULL,'CARD-0072','1072'),(73,'Guest73','LRH73','guest73@harbor.example.com','929-346-0073',NULL,'CARD-0073','1073'),(74,'Guest74','LRH74','guest74@harbor.example.com','929-346-0074',NULL,'CARD-0074','1074'),(75,'Guest75','LRH75','guest75@harbor.example.com','929-346-0075','Citizen Society','CARD-0075','1075'),(76,'Guest76','LRH76','guest76@harbor.example.com','929-346-0076',NULL,'CARD-0076','1076'),(77,'Guest77','LRH77','guest77@harbor.example.com','929-346-0077',NULL,'CARD-0077','1077'),(78,'Guest78','LRH78','guest78@harbor.example.com','929-346-0078',NULL,'CARD-0078','1078'),(79,'Guest79','LRH79','guest79@harbor.example.com','929-346-0079',NULL,'CARD-0079','1079'),(80,'Guest80','LRH80','guest80@harbor.example.com','929-346-0080','Peeksnack Events','CARD-0080','1080');
/*!40000 ALTER TABLE `guest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message` (
  `messageID` int NOT NULL AUTO_INCREMENT,
  `guestID` int NOT NULL,
  `messageText` varchar(500) NOT NULL,
  `messageTime` datetime NOT NULL,
  `isConfidential` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`messageID`),
  KEY `fk_message_guest` (`guestID`),
  CONSTRAINT `fk_message_guest` FOREIGN KEY (`guestID`) REFERENCES `guest` (`guestID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (1,1,'Welcome to Golden Tower & Cliff Hub, Guest 1!','2025-10-02 11:45:00',0),(2,2,'Welcome to Golden Tower & Cliff Hub, Guest 2!','2025-10-03 11:45:00',0),(3,3,'Welcome to Golden Tower & Cliff Hub, Guest 3!','2025-10-04 11:45:00',0),(4,4,'Welcome to Golden Tower & Cliff Hub, Guest 4!','2025-10-05 11:45:00',0),(5,5,'Welcome to Golden Tower & Cliff Hub, Guest 5!','2025-10-06 11:45:00',0),(6,6,'Welcome to Golden Tower & Cliff Hub, Guest 6!','2025-10-07 11:45:00',0),(7,7,'Welcome to Golden Tower & Cliff Hub, Guest 7!','2025-10-08 11:45:00',0),(8,8,'Welcome to Golden Tower & Cliff Hub, Guest 8!','2025-10-09 11:45:00',0),(9,9,'Welcome to Golden Tower & Cliff Hub, Guest 9!','2025-10-10 11:45:00',0),(10,10,'Welcome to Golden Tower & Cliff Hub, Guest 10!','2025-10-11 11:45:00',0),(11,11,'Welcome to Golden Tower & Cliff Hub, Guest 11!','2025-10-12 11:45:00',0),(12,12,'Welcome to Golden Tower & Cliff Hub, Guest 12!','2025-10-13 11:45:00',0),(13,13,'Welcome to Golden Tower & Cliff Hub, Guest 13!','2025-10-14 11:45:00',0),(14,14,'Welcome to Golden Tower & Cliff Hub, Guest 14!','2025-10-15 11:45:00',0),(15,15,'Welcome to Golden Tower & Cliff Hub, Guest 15!','2025-10-16 11:45:00',0),(16,16,'Welcome to Golden Tower & Cliff Hub, Guest 16!','2025-10-17 11:45:00',0),(17,17,'Welcome to Golden Tower & Cliff Hub, Guest 17!','2025-10-18 11:45:00',0),(18,18,'Welcome to Golden Tower & Cliff Hub, Guest 18!','2025-10-19 11:45:00',0),(19,19,'Welcome to Golden Tower & Cliff Hub, Guest 19!','2025-10-20 11:45:00',0),(20,20,'Welcome to Golden Tower & Cliff Hub, Guest 20!','2025-10-21 11:45:00',0),(21,21,'Welcome to Golden Tower & Cliff Hub, Guest 21!','2025-10-22 11:45:00',0),(22,22,'Welcome to Golden Tower & Cliff Hub, Guest 22!','2025-10-23 11:45:00',0),(23,23,'Welcome to Golden Tower & Cliff Hub, Guest 23!','2025-10-24 11:45:00',0),(24,24,'Welcome to Golden Tower & Cliff Hub, Guest 24!','2025-10-25 11:45:00',0),(25,25,'Welcome to Golden Tower & Cliff Hub, Guest 25!','2025-10-26 11:45:00',0),(26,26,'Welcome to Golden Tower & Cliff Hub, Guest 26!','2025-10-27 11:45:00',0),(27,27,'Welcome to Golden Tower & Cliff Hub, Guest 27!','2025-10-28 11:45:00',0),(28,28,'Welcome to Golden Tower & Cliff Hub, Guest 28!','2025-10-29 11:45:00',0),(29,29,'Welcome to Golden Tower & Cliff Hub, Guest 29!','2025-10-30 11:45:00',0),(30,30,'Welcome to Golden Tower & Cliff Hub, Guest 30!','2025-10-31 11:45:00',0),(31,31,'Welcome to Golden Tower & Cliff Hub, Guest 31!','2025-11-01 11:45:00',0),(32,32,'Welcome to Golden Tower & Cliff Hub, Guest 32!','2025-11-02 11:45:00',0),(33,33,'Welcome to Golden Tower & Cliff Hub, Guest 33!','2025-11-03 11:45:00',0),(34,34,'Welcome to Golden Tower & Cliff Hub, Guest 34!','2025-11-04 11:45:00',0),(35,35,'Welcome to Golden Tower & Cliff Hub, Guest 35!','2025-11-05 11:45:00',0),(36,36,'Welcome to Golden Tower & Cliff Hub, Guest 36!','2025-11-06 11:45:00',0),(37,37,'Welcome to Golden Tower & Cliff Hub, Guest 37!','2025-11-07 11:45:00',0),(38,38,'Welcome to Golden Tower & Cliff Hub, Guest 38!','2025-11-08 11:45:00',0),(39,39,'Welcome to Golden Tower & Cliff Hub, Guest 39!','2025-11-09 11:45:00',0),(40,40,'Welcome to Golden Tower & Cliff Hub, Guest 40!','2025-11-10 11:45:00',0);
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `paymentID` int NOT NULL AUTO_INCREMENT,
  `billedPartyID` int NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `paymentDate` datetime NOT NULL,
  `paymentMethod` varchar(40) NOT NULL,
  PRIMARY KEY (`paymentID`),
  KEY `fk_payment_party` (`billedPartyID`),
  KEY `idx_payment_date` (`paymentDate`),
  CONSTRAINT `fk_payment_party` FOREIGN KEY (`billedPartyID`) REFERENCES `billedparty` (`billedPartyID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=262 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,1,333.00,'2025-11-15 11:30:00','Credit Card'),(2,2,729.00,'2025-11-15 11:30:00','Credit Card'),(3,3,945.00,'2025-11-15 11:30:00','Credit Card'),(4,4,1422.00,'2025-11-15 11:30:00','Credit Card'),(5,5,1845.00,'2025-11-15 11:30:00','Credit Card'),(6,6,495.00,'2025-11-15 11:30:00','Credit Card'),(7,7,846.00,'2025-11-15 11:30:00','Credit Card'),(8,8,1431.00,'2025-11-15 11:30:00','Credit Card'),(9,9,2970.00,'2025-11-15 11:30:00','Credit Card'),(10,11,351.00,'2025-11-15 11:30:00','Credit Card'),(11,12,792.00,'2025-11-15 11:30:00','Credit Card'),(12,13,945.00,'2025-11-15 11:30:00','Credit Card'),(13,14,1332.00,'2025-11-15 11:30:00','Credit Card'),(14,15,1845.00,'2025-11-15 11:30:00','Credit Card'),(15,16,585.00,'2025-11-15 11:30:00','Credit Card'),(16,17,846.00,'2025-11-15 11:30:00','Credit Card'),(17,18,1368.00,'2025-11-15 11:30:00','Credit Card'),(18,19,2988.00,'2025-11-15 11:30:00','Credit Card'),(19,21,210.00,'2025-11-15 11:30:00','Credit Card'),(20,22,492.00,'2025-11-15 11:30:00','Credit Card'),(21,23,630.00,'2025-11-15 11:30:00','Credit Card'),(22,24,972.00,'2025-11-15 11:30:00','Credit Card'),(23,25,1230.00,'2025-11-15 11:30:00','Credit Card'),(24,26,282.00,'2025-11-15 11:30:00','Credit Card'),(25,27,600.00,'2025-11-15 11:30:00','Credit Card'),(26,28,972.00,'2025-11-15 11:30:00','Credit Card'),(27,29,1968.00,'2025-11-15 11:30:00','Credit Card'),(28,31,210.00,'2025-11-15 11:30:00','Credit Card'),(29,32,495.00,'2025-11-15 11:30:00','Credit Card'),(30,33,630.00,'2025-11-15 11:30:00','Credit Card'),(31,34,912.00,'2025-11-15 11:30:00','Credit Card'),(32,35,1230.00,'2025-11-15 11:30:00','Credit Card'),(33,36,423.00,'2025-11-15 11:30:00','Credit Card'),(34,37,582.00,'2025-11-15 11:30:00','Credit Card'),(35,38,846.00,'2025-11-15 11:30:00','Credit Card'),(36,39,1968.00,'2025-11-15 11:30:00','Credit Card'),(37,41,210.00,'2025-11-15 11:30:00','Credit Card'),(38,42,492.00,'2025-11-15 11:30:00','Credit Card'),(39,43,630.00,'2025-11-15 11:30:00','Credit Card'),(40,44,915.00,'2025-11-15 11:30:00','Credit Card'),(41,45,1248.00,'2025-11-15 11:30:00','Credit Card'),(42,46,381.00,'2025-11-15 11:30:00','Credit Card'),(43,47,564.00,'2025-11-15 11:30:00','Credit Card'),(44,48,978.00,'2025-11-15 11:30:00','Credit Card'),(45,49,1968.00,'2025-11-15 11:30:00','Credit Card'),(46,51,210.00,'2025-11-15 11:30:00','Credit Card'),(47,52,537.00,'2025-11-15 11:30:00','Credit Card'),(48,53,630.00,'2025-11-15 11:30:00','Credit Card'),(49,54,939.00,'2025-11-15 11:30:00','Credit Card'),(50,55,1266.00,'2025-11-15 11:30:00','Credit Card'),(51,56,357.00,'2025-11-15 11:30:00','Credit Card'),(52,57,564.00,'2025-11-15 11:30:00','Credit Card'),(53,58,918.00,'2025-11-15 11:30:00','Credit Card'),(54,59,1968.00,'2025-11-15 11:30:00','Credit Card'),(55,61,210.00,'2025-11-15 11:30:00','Credit Card'),(56,62,420.00,'2025-11-15 11:30:00','Credit Card'),(57,63,666.00,'2025-11-15 11:30:00','Credit Card'),(58,64,966.00,'2025-11-15 11:30:00','Credit Card'),(59,65,1230.00,'2025-11-15 11:30:00','Credit Card'),(60,66,354.00,'2025-11-15 11:30:00','Credit Card'),(61,67,564.00,'2025-11-15 11:30:00','Credit Card'),(62,68,921.00,'2025-11-15 11:30:00','Credit Card'),(63,69,1968.00,'2025-11-15 11:30:00','Credit Card'),(64,71,210.00,'2025-11-15 11:30:00','Credit Card'),(65,72,561.00,'2025-11-15 11:30:00','Credit Card'),(66,73,648.00,'2025-11-15 11:30:00','Credit Card'),(67,74,840.00,'2025-11-15 11:30:00','Credit Card'),(68,75,1230.00,'2025-11-15 11:30:00','Credit Card'),(69,76,399.00,'2025-11-15 11:30:00','Credit Card'),(70,77,564.00,'2025-11-15 11:30:00','Credit Card'),(71,78,918.00,'2025-11-15 11:30:00','Credit Card'),(72,79,1968.00,'2025-11-15 11:30:00','Credit Card'),(128,1,222.00,'2026-01-05 13:10:00','Credit Card'),(129,2,486.00,'2026-01-05 13:10:00','Credit Card'),(130,3,630.00,'2026-01-05 13:10:00','Credit Card'),(131,4,948.00,'2026-01-05 13:10:00','Credit Card'),(132,5,1230.00,'2026-01-05 13:10:00','Credit Card'),(133,6,330.00,'2026-01-05 13:10:00','Credit Card'),(134,7,564.00,'2026-01-05 13:10:00','Credit Card'),(135,8,954.00,'2026-01-05 13:10:00','Credit Card'),(136,9,1980.00,'2026-01-05 13:10:00','Credit Card'),(137,11,234.00,'2026-01-05 13:10:00','Credit Card'),(138,12,528.00,'2026-01-05 13:10:00','Credit Card'),(139,13,630.00,'2026-01-05 13:10:00','Credit Card'),(140,14,888.00,'2026-01-05 13:10:00','Credit Card'),(141,15,1230.00,'2026-01-05 13:10:00','Credit Card'),(142,16,390.00,'2026-01-05 13:10:00','Credit Card'),(143,17,564.00,'2026-01-05 13:10:00','Credit Card'),(144,18,912.00,'2026-01-05 13:10:00','Credit Card'),(145,19,1992.00,'2026-01-05 13:10:00','Credit Card'),(146,21,140.00,'2026-01-05 13:10:00','Credit Card'),(147,22,328.00,'2026-01-05 13:10:00','Credit Card'),(148,23,420.00,'2026-01-05 13:10:00','Credit Card'),(149,24,648.00,'2026-01-05 13:10:00','Credit Card'),(150,25,820.00,'2026-01-05 13:10:00','Credit Card'),(151,26,188.00,'2026-01-05 13:10:00','Credit Card'),(152,27,400.00,'2026-01-05 13:10:00','Credit Card'),(153,28,648.00,'2026-01-05 13:10:00','Credit Card'),(154,29,1312.00,'2026-01-05 13:10:00','Credit Card'),(155,31,140.00,'2026-01-05 13:10:00','Credit Card'),(156,32,330.00,'2026-01-05 13:10:00','Credit Card'),(157,33,420.00,'2026-01-05 13:10:00','Credit Card'),(158,34,608.00,'2026-01-05 13:10:00','Credit Card'),(159,35,820.00,'2026-01-05 13:10:00','Credit Card'),(160,36,282.00,'2026-01-05 13:10:00','Credit Card'),(161,37,388.00,'2026-01-05 13:10:00','Credit Card'),(162,38,564.00,'2026-01-05 13:10:00','Credit Card'),(163,39,1312.00,'2026-01-05 13:10:00','Credit Card'),(164,41,140.00,'2026-01-05 13:10:00','Credit Card'),(165,42,328.00,'2026-01-05 13:10:00','Credit Card'),(166,43,420.00,'2026-01-05 13:10:00','Credit Card'),(167,44,610.00,'2026-01-05 13:10:00','Credit Card'),(168,45,832.00,'2026-01-05 13:10:00','Credit Card'),(169,46,254.00,'2026-01-05 13:10:00','Credit Card'),(170,47,376.00,'2026-01-05 13:10:00','Credit Card'),(171,48,652.00,'2026-01-05 13:10:00','Credit Card'),(172,49,1312.00,'2026-01-05 13:10:00','Credit Card'),(173,51,140.00,'2026-01-05 13:10:00','Credit Card'),(174,52,358.00,'2026-01-05 13:10:00','Credit Card'),(175,53,420.00,'2026-01-05 13:10:00','Credit Card'),(176,54,626.00,'2026-01-05 13:10:00','Credit Card'),(177,55,844.00,'2026-01-05 13:10:00','Credit Card'),(178,56,238.00,'2026-01-05 13:10:00','Credit Card'),(179,57,376.00,'2026-01-05 13:10:00','Credit Card'),(180,58,612.00,'2026-01-05 13:10:00','Credit Card'),(181,59,1312.00,'2026-01-05 13:10:00','Credit Card'),(182,61,140.00,'2026-01-05 13:10:00','Credit Card'),(183,62,280.00,'2026-01-05 13:10:00','Credit Card'),(184,63,444.00,'2026-01-05 13:10:00','Credit Card'),(185,64,644.00,'2026-01-05 13:10:00','Credit Card'),(186,65,820.00,'2026-01-05 13:10:00','Credit Card'),(187,66,236.00,'2026-01-05 13:10:00','Credit Card'),(188,67,376.00,'2026-01-05 13:10:00','Credit Card'),(189,68,614.00,'2026-01-05 13:10:00','Credit Card'),(190,69,1312.00,'2026-01-05 13:10:00','Credit Card'),(191,71,140.00,'2026-01-05 13:10:00','Credit Card'),(192,72,374.00,'2026-01-05 13:10:00','Credit Card'),(193,73,432.00,'2026-01-05 13:10:00','Credit Card'),(194,74,560.00,'2026-01-05 13:10:00','Credit Card'),(195,75,820.00,'2026-01-05 13:10:00','Credit Card'),(196,76,266.00,'2026-01-05 13:10:00','Credit Card'),(197,77,376.00,'2026-01-05 13:10:00','Credit Card'),(198,78,612.00,'2026-01-05 13:10:00','Credit Card'),(199,79,1312.00,'2026-01-05 13:10:00','Credit Card'),(255,101,2970.00,'2025-12-20 10:20:00','Wire Transfer'),(256,102,2970.00,'2025-12-20 10:20:00','Wire Transfer'),(257,103,2970.00,'2025-12-20 10:20:00','Wire Transfer'),(258,104,2970.00,'2025-12-20 10:20:00','Wire Transfer'),(259,105,2970.00,'2025-12-20 10:20:00','Wire Transfer');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation` (
  `reservationID` int NOT NULL AUTO_INCREMENT,
  `guestID` int NOT NULL,
  `roomID` int NOT NULL,
  `startDate` date NOT NULL,
  `endDate` date NOT NULL,
  `status` varchar(30) NOT NULL DEFAULT 'booked',
  `specialRequests` varchar(255) DEFAULT NULL,
  `advanceDeposits` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`reservationID`),
  KEY `fk_res_guest` (`guestID`),
  KEY `fk_res_room` (`roomID`),
  KEY `idx_res_dates` (`startDate`,`endDate`),
  CONSTRAINT `fk_res_guest` FOREIGN KEY (`guestID`) REFERENCES `guest` (`guestID`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_res_room` FOREIGN KEY (`roomID`) REFERENCES `room` (`roomID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=181 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO `reservation` VALUES (1,1,1,'2025-10-01','2025-10-02','booked',NULL,0.00),(2,2,2,'2025-10-02','2025-10-04','booked',NULL,0.00),(3,3,3,'2025-10-03','2025-10-06','booked',NULL,0.00),(4,4,4,'2025-10-04','2025-10-08','booked',NULL,0.00),(5,5,5,'2025-10-05','2025-10-10','booked',NULL,120.00),(6,6,6,'2025-10-06','2025-10-07','booked',NULL,0.00),(7,7,7,'2025-10-07','2025-10-09','checked_out',NULL,0.00),(8,8,8,'2025-10-08','2025-10-11','booked',NULL,0.00),(9,9,9,'2025-10-09','2025-10-13','booked',NULL,0.00),(10,10,10,'2025-10-10','2025-10-15','cancelled',NULL,120.00),(11,11,11,'2025-10-11','2025-10-12','booked',NULL,0.00),(12,12,12,'2025-10-12','2025-10-14','booked','Late check-in',0.00),(13,13,13,'2025-10-13','2025-10-16','booked',NULL,0.00),(14,14,14,'2025-10-14','2025-10-18','checked_out',NULL,0.00),(15,15,15,'2025-10-15','2025-10-20','booked','High floor',120.00),(16,16,16,'2025-10-16','2025-10-17','booked',NULL,0.00),(17,17,17,'2025-10-17','2025-10-19','booked',NULL,0.00),(18,18,18,'2025-10-18','2025-10-21','booked','Quiet room',0.00),(19,19,19,'2025-10-19','2025-10-23','booked',NULL,0.00),(20,20,20,'2025-10-20','2025-10-25','cancelled',NULL,120.00),(21,21,21,'2025-10-21','2025-10-22','checked_out',NULL,0.00),(22,22,22,'2025-10-22','2025-10-24','booked',NULL,0.00),(23,23,23,'2025-10-23','2025-10-26','booked',NULL,0.00),(24,24,24,'2025-10-24','2025-10-28','booked','Late check-in',0.00),(25,25,25,'2025-10-25','2025-10-30','booked',NULL,120.00),(26,26,26,'2025-10-26','2025-10-27','booked',NULL,0.00),(27,27,27,'2025-10-27','2025-10-29','booked',NULL,0.00),(28,28,28,'2025-10-28','2025-10-31','checked_out',NULL,0.00),(29,29,29,'2025-10-29','2025-11-02','booked',NULL,0.00),(30,30,30,'2025-10-30','2025-11-04','cancelled','High floor',120.00),(31,31,31,'2025-10-31','2025-11-01','booked',NULL,0.00),(32,32,32,'2025-11-01','2025-11-03','booked',NULL,0.00),(33,33,33,'2025-11-02','2025-11-05','booked',NULL,0.00),(34,34,34,'2025-11-03','2025-11-07','booked',NULL,0.00),(35,35,35,'2025-11-04','2025-11-09','checked_out',NULL,120.00),(36,36,36,'2025-11-05','2025-11-06','booked','Late check-in',0.00),(37,37,37,'2025-11-06','2025-11-08','booked',NULL,0.00),(38,38,38,'2025-11-07','2025-11-10','booked',NULL,0.00),(39,39,39,'2025-11-08','2025-11-12','booked',NULL,0.00),(40,40,40,'2025-11-09','2025-11-14','cancelled',NULL,120.00),(41,41,41,'2025-11-10','2025-11-11','booked',NULL,0.00),(42,42,42,'2025-11-11','2025-11-13','checked_out',NULL,0.00),(43,43,43,'2025-11-12','2025-11-15','booked',NULL,0.00),(44,44,44,'2025-11-13','2025-11-17','booked',NULL,0.00),(45,45,45,'2025-11-14','2025-11-19','booked','High floor',120.00),(46,46,46,'2025-11-15','2025-11-16','booked',NULL,0.00),(47,47,47,'2025-11-16','2025-11-18','booked',NULL,0.00),(48,48,48,'2025-11-17','2025-11-20','booked','Late check-in',0.00),(49,49,49,'2025-11-18','2025-11-22','checked_out',NULL,0.00),(50,50,50,'2025-11-19','2025-11-24','cancelled',NULL,120.00),(51,51,51,'2025-11-20','2025-11-21','booked',NULL,0.00),(52,52,52,'2025-11-21','2025-11-23','booked',NULL,0.00),(53,53,53,'2025-11-22','2025-11-25','booked',NULL,0.00),(54,54,54,'2025-11-23','2025-11-27','booked','Quiet room',0.00),(55,55,55,'2025-11-24','2025-11-29','booked',NULL,120.00),(56,56,56,'2025-11-25','2025-11-26','checked_out',NULL,0.00),(57,57,57,'2025-11-26','2025-11-28','booked',NULL,0.00),(58,58,58,'2025-11-27','2025-11-30','booked',NULL,0.00),(59,59,59,'2025-11-28','2025-12-02','booked',NULL,0.00),(60,60,60,'2025-11-29','2025-12-04','cancelled','Late check-in',120.00),(61,61,1,'2025-11-30','2025-12-01','booked',NULL,0.00),(62,62,2,'2025-12-01','2025-12-03','booked',NULL,0.00),(63,63,3,'2025-12-02','2025-12-05','checked_out',NULL,0.00),(64,64,4,'2025-12-03','2025-12-07','booked',NULL,0.00),(65,65,5,'2025-12-04','2025-12-09','booked',NULL,120.00),(66,66,6,'2025-12-05','2025-12-06','booked',NULL,0.00),(67,67,7,'2025-12-06','2025-12-08','booked',NULL,0.00),(68,68,8,'2025-12-07','2025-12-10','booked',NULL,0.00),(69,69,9,'2025-12-08','2025-12-12','booked',NULL,0.00),(70,70,10,'2025-12-09','2025-12-14','cancelled',NULL,120.00),(71,71,11,'2025-12-10','2025-12-11','booked',NULL,0.00),(72,72,12,'2025-12-11','2025-12-13','booked','Late check-in',0.00),(73,73,13,'2025-12-12','2025-12-15','booked',NULL,0.00),(74,74,14,'2025-12-13','2025-12-17','booked',NULL,0.00),(75,75,15,'2025-12-14','2025-12-19','booked','High floor',120.00),(76,76,16,'2025-12-15','2025-12-16','booked',NULL,0.00),(77,77,17,'2025-12-16','2025-12-18','checked_out',NULL,0.00),(78,78,18,'2025-12-17','2025-12-20','booked',NULL,0.00),(79,79,19,'2025-12-18','2025-12-22','booked',NULL,0.00),(80,80,20,'2025-12-19','2025-12-24','cancelled',NULL,120.00),(81,1,21,'2025-12-20','2025-12-21','booked',NULL,0.00),(82,2,22,'2025-12-21','2025-12-23','booked',NULL,0.00),(83,3,23,'2025-12-22','2025-12-25','booked',NULL,0.00),(84,4,24,'2025-12-23','2025-12-27','checked_out','Late check-in',0.00),(85,5,25,'2025-12-24','2025-12-29','booked',NULL,120.00),(86,6,26,'2025-12-25','2025-12-26','booked',NULL,0.00),(87,7,27,'2025-12-26','2025-12-28','booked',NULL,0.00),(88,8,28,'2025-12-27','2025-12-30','booked',NULL,0.00),(89,9,29,'2025-12-28','2026-01-01','booked',NULL,0.00),(90,10,30,'2025-12-29','2026-01-03','cancelled','High floor',120.00),(91,11,31,'2025-10-01','2025-10-02','checked_out',NULL,0.00),(92,12,32,'2025-10-02','2025-10-04','booked',NULL,0.00),(93,13,33,'2025-10-03','2025-10-06','booked',NULL,0.00),(94,14,34,'2025-10-04','2025-10-08','booked',NULL,0.00),(95,15,35,'2025-10-05','2025-10-10','booked',NULL,120.00),(96,16,36,'2025-10-06','2025-10-07','booked','Late check-in',0.00),(97,17,37,'2025-10-07','2025-10-09','booked',NULL,0.00),(98,18,38,'2025-10-08','2025-10-11','checked_out',NULL,0.00),(99,19,39,'2025-10-09','2025-10-13','booked',NULL,0.00),(100,20,40,'2025-10-10','2025-10-15','cancelled',NULL,120.00),(101,21,41,'2025-10-11','2025-10-12','booked',NULL,0.00),(102,22,42,'2025-10-12','2025-10-14','booked',NULL,0.00),(103,23,43,'2025-10-13','2025-10-16','booked',NULL,0.00),(104,24,44,'2025-10-14','2025-10-18','booked',NULL,0.00),(105,25,45,'2025-10-15','2025-10-20','checked_out','High floor',120.00),(106,26,46,'2025-10-16','2025-10-17','booked',NULL,0.00),(107,27,47,'2025-10-17','2025-10-19','booked',NULL,0.00),(108,28,48,'2025-10-18','2025-10-21','booked','Late check-in',0.00),(109,29,49,'2025-10-19','2025-10-23','booked',NULL,0.00),(110,30,50,'2025-10-20','2025-10-25','cancelled',NULL,120.00),(111,31,51,'2025-10-21','2025-10-22','booked',NULL,0.00),(112,32,52,'2025-10-22','2025-10-24','checked_out',NULL,0.00),(113,33,53,'2025-10-23','2025-10-26','booked',NULL,0.00),(114,34,54,'2025-10-24','2025-10-28','booked',NULL,0.00),(115,35,55,'2025-10-25','2025-10-30','booked',NULL,120.00),(116,36,56,'2025-10-26','2025-10-27','booked',NULL,0.00),(117,37,57,'2025-10-27','2025-10-29','booked',NULL,0.00),(118,38,58,'2025-10-28','2025-10-31','booked',NULL,0.00),(119,39,59,'2025-10-29','2025-11-02','checked_out',NULL,0.00),(120,40,60,'2025-10-30','2025-11-04','cancelled','Late check-in',120.00),(121,41,1,'2025-10-31','2025-11-01','booked',NULL,0.00),(122,42,2,'2025-11-01','2025-11-03','booked',NULL,0.00),(123,43,3,'2025-11-02','2025-11-05','booked',NULL,0.00),(124,44,4,'2025-11-03','2025-11-07','booked',NULL,0.00),(125,45,5,'2025-11-04','2025-11-09','booked',NULL,120.00),(126,46,6,'2025-11-05','2025-11-06','checked_out','Quiet room',0.00),(127,47,7,'2025-11-06','2025-11-08','booked',NULL,0.00),(128,48,8,'2025-11-07','2025-11-10','booked',NULL,0.00),(129,49,9,'2025-11-08','2025-11-12','booked',NULL,0.00),(130,50,10,'2025-11-09','2025-11-14','cancelled',NULL,120.00),(131,51,11,'2025-11-10','2025-11-11','booked',NULL,0.00),(132,52,12,'2025-11-11','2025-11-13','booked','Late check-in',0.00),(133,53,13,'2025-11-12','2025-11-15','checked_out',NULL,0.00),(134,54,14,'2025-11-13','2025-11-17','booked',NULL,0.00),(135,55,15,'2025-11-14','2025-11-19','booked','High floor',120.00),(136,56,16,'2025-11-15','2025-11-16','booked',NULL,0.00),(137,57,17,'2025-11-16','2025-11-18','booked',NULL,0.00),(138,58,18,'2025-11-17','2025-11-20','booked',NULL,0.00),(139,59,19,'2025-11-18','2025-11-22','booked',NULL,0.00),(140,60,20,'2025-11-19','2025-11-24','cancelled',NULL,120.00),(141,61,21,'2025-11-20','2025-11-21','booked',NULL,0.00),(142,62,22,'2025-11-21','2025-11-23','booked',NULL,0.00),(143,63,23,'2025-11-22','2025-11-25','booked',NULL,0.00),(144,64,24,'2025-11-23','2025-11-27','booked','Late check-in',0.00),(145,65,25,'2025-11-24','2025-11-29','booked',NULL,120.00),(146,66,26,'2025-11-25','2025-11-26','booked',NULL,0.00),(147,67,27,'2025-11-26','2025-11-28','checked_out',NULL,0.00),(148,68,28,'2025-11-27','2025-11-30','booked',NULL,0.00),(149,69,29,'2025-11-28','2025-12-02','booked',NULL,0.00),(150,70,30,'2025-11-29','2025-12-04','cancelled','High floor',120.00),(151,71,31,'2025-11-30','2025-12-01','booked',NULL,0.00),(152,72,32,'2025-12-01','2025-12-03','booked',NULL,0.00),(153,73,33,'2025-12-02','2025-12-05','booked',NULL,0.00),(154,74,34,'2025-12-03','2025-12-07','checked_out',NULL,0.00),(155,75,35,'2025-12-04','2025-12-09','booked',NULL,120.00),(156,76,36,'2025-12-05','2025-12-06','booked','Late check-in',0.00),(157,77,37,'2025-12-06','2025-12-08','booked',NULL,0.00),(158,78,38,'2025-12-07','2025-12-10','booked',NULL,0.00),(159,79,39,'2025-12-08','2025-12-12','booked',NULL,0.00),(160,80,40,'2025-12-09','2025-12-14','cancelled',NULL,120.00),(161,1,41,'2025-12-10','2025-12-11','checked_out',NULL,0.00),(162,2,42,'2025-12-11','2025-12-13','booked','Quiet room',0.00),(163,3,43,'2025-12-12','2025-12-15','booked',NULL,0.00),(164,4,44,'2025-12-13','2025-12-17','booked',NULL,0.00),(165,5,45,'2025-12-14','2025-12-19','booked','High floor',120.00),(166,6,46,'2025-12-15','2025-12-16','booked',NULL,0.00),(167,7,47,'2025-12-16','2025-12-18','booked',NULL,0.00),(168,8,48,'2025-12-17','2025-12-20','checked_out','Late check-in',0.00),(169,9,49,'2025-12-18','2025-12-22','booked',NULL,0.00),(170,10,50,'2025-12-19','2025-12-24','cancelled',NULL,120.00),(171,11,51,'2025-12-20','2025-12-21','booked',NULL,0.00),(172,12,52,'2025-12-21','2025-12-23','booked',NULL,0.00),(173,13,53,'2025-12-22','2025-12-25','booked',NULL,0.00),(174,14,54,'2025-12-23','2025-12-27','booked',NULL,0.00),(175,15,55,'2025-12-24','2025-12-29','checked_out',NULL,120.00),(176,16,56,'2025-12-25','2025-12-26','booked',NULL,0.00),(177,17,57,'2025-12-26','2025-12-28','booked',NULL,0.00),(178,18,58,'2025-12-27','2025-12-30','booked',NULL,0.00),(179,19,59,'2025-12-28','2026-01-01','booked',NULL,0.00),(180,20,60,'2025-12-29','2026-01-03','cancelled','Late check-in',120.00);
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservationguest`
--

DROP TABLE IF EXISTS `reservationguest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservationguest` (
  `resGuestID` int NOT NULL AUTO_INCREMENT,
  `reservationID` int NOT NULL,
  `guestID` int NOT NULL,
  `isPrimaryGuest` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`resGuestID`),
  KEY `fk_resguest_res` (`reservationID`),
  KEY `fk_resguest_guest` (`guestID`),
  CONSTRAINT `fk_resguest_guest` FOREIGN KEY (`guestID`) REFERENCES `guest` (`guestID`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_resguest_res` FOREIGN KEY (`reservationID`) REFERENCES `reservation` (`reservationID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=287 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservationguest`
--

LOCK TABLES `reservationguest` WRITE;
/*!40000 ALTER TABLE `reservationguest` DISABLE KEYS */;
INSERT INTO `reservationguest` VALUES (1,1,1,1),(2,81,1,1),(3,161,1,1),(4,2,2,1),(5,82,2,1),(6,162,2,1),(7,3,3,1),(8,83,3,1),(9,163,3,1),(10,4,4,1),(11,84,4,1),(12,164,4,1),(13,5,5,1),(14,85,5,1),(15,165,5,1),(16,6,6,1),(17,86,6,1),(18,166,6,1),(19,7,7,1),(20,87,7,1),(21,167,7,1),(22,8,8,1),(23,88,8,1),(24,168,8,1),(25,9,9,1),(26,89,9,1),(27,169,9,1),(28,10,10,1),(29,90,10,1),(30,170,10,1),(31,11,11,1),(32,91,11,1),(33,171,11,1),(34,12,12,1),(35,92,12,1),(36,172,12,1),(37,13,13,1),(38,93,13,1),(39,173,13,1),(40,14,14,1),(41,94,14,1),(42,174,14,1),(43,15,15,1),(44,95,15,1),(45,175,15,1),(46,16,16,1),(47,96,16,1),(48,176,16,1),(49,17,17,1),(50,97,17,1),(51,177,17,1),(52,18,18,1),(53,98,18,1),(54,178,18,1),(55,19,19,1),(56,99,19,1),(57,179,19,1),(58,20,20,1),(59,100,20,1),(60,180,20,1),(61,21,21,1),(62,101,21,1),(63,22,22,1),(64,102,22,1),(65,23,23,1),(66,103,23,1),(67,24,24,1),(68,104,24,1),(69,25,25,1),(70,105,25,1),(71,26,26,1),(72,106,26,1),(73,27,27,1),(74,107,27,1),(75,28,28,1),(76,108,28,1),(77,29,29,1),(78,109,29,1),(79,30,30,1),(80,110,30,1),(81,31,31,1),(82,111,31,1),(83,32,32,1),(84,112,32,1),(85,33,33,1),(86,113,33,1),(87,34,34,1),(88,114,34,1),(89,35,35,1),(90,115,35,1),(91,36,36,1),(92,116,36,1),(93,37,37,1),(94,117,37,1),(95,38,38,1),(96,118,38,1),(97,39,39,1),(98,119,39,1),(99,40,40,1),(100,120,40,1),(101,41,41,1),(102,121,41,1),(103,42,42,1),(104,122,42,1),(105,43,43,1),(106,123,43,1),(107,44,44,1),(108,124,44,1),(109,45,45,1),(110,125,45,1),(111,46,46,1),(112,126,46,1),(113,47,47,1),(114,127,47,1),(115,48,48,1),(116,128,48,1),(117,49,49,1),(118,129,49,1),(119,50,50,1),(120,130,50,1),(121,51,51,1),(122,131,51,1),(123,52,52,1),(124,132,52,1),(125,53,53,1),(126,133,53,1),(127,54,54,1),(128,134,54,1),(129,55,55,1),(130,135,55,1),(131,56,56,1),(132,136,56,1),(133,57,57,1),(134,137,57,1),(135,58,58,1),(136,138,58,1),(137,59,59,1),(138,139,59,1),(139,60,60,1),(140,140,60,1),(141,61,61,1),(142,141,61,1),(143,62,62,1),(144,142,62,1),(145,63,63,1),(146,143,63,1),(147,64,64,1),(148,144,64,1),(149,65,65,1),(150,145,65,1),(151,66,66,1),(152,146,66,1),(153,67,67,1),(154,147,67,1),(155,68,68,1),(156,148,68,1),(157,69,69,1),(158,149,69,1),(159,70,70,1),(160,150,70,1),(161,71,71,1),(162,151,71,1),(163,72,72,1),(164,152,72,1),(165,73,73,1),(166,153,73,1),(167,74,74,1),(168,154,74,1),(169,75,75,1),(170,155,75,1),(171,76,76,1),(172,156,76,1),(173,77,77,1),(174,157,77,1),(175,78,78,1),(176,158,78,1),(177,79,79,1),(178,159,79,1),(179,80,80,1),(180,160,80,1),(256,8,9,0),(257,88,9,0),(258,168,9,0),(259,16,17,0),(260,96,17,0),(261,176,17,0),(262,24,25,0),(263,104,25,0),(264,32,33,0),(265,112,33,0),(266,40,41,0),(267,120,41,0),(268,48,49,0),(269,128,49,0),(270,56,57,0),(271,136,57,0),(272,64,65,0),(273,144,65,0),(274,72,73,0),(275,152,73,0),(276,80,1,0),(277,160,1,0);
/*!40000 ALTER TABLE `reservationguest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservationrequirements`
--

DROP TABLE IF EXISTS `reservationrequirements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservationrequirements` (
  `requirementID` int NOT NULL AUTO_INCREMENT,
  `reservationID` int NOT NULL,
  `reqType` varchar(60) NOT NULL,
  `reqValue` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`requirementID`),
  KEY `fk_req_res` (`reservationID`),
  CONSTRAINT `fk_req_res` FOREIGN KEY (`reservationID`) REFERENCES `reservation` (`reservationID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservationrequirements`
--

LOCK TABLES `reservationrequirements` WRITE;
/*!40000 ALTER TABLE `reservationrequirements` DISABLE KEYS */;
INSERT INTO `reservationrequirements` VALUES (1,20,'Accessibility','Wheelchair-friendly'),(2,100,'Accessibility','Wheelchair-friendly'),(3,180,'Accessibility','Wheelchair-friendly'),(4,40,'Accessibility','Wheelchair-friendly'),(5,120,'Accessibility','Wheelchair-friendly'),(6,60,'Accessibility','Wheelchair-friendly'),(7,140,'Accessibility','Wheelchair-friendly'),(8,80,'Accessibility','Wheelchair-friendly'),(9,160,'Accessibility','Wheelchair-friendly'),(16,84,'Amenity','Large Tub'),(17,168,'Amenity','Large Tub'),(18,14,'Amenity','Large Tub'),(19,98,'Amenity','Large Tub'),(20,28,'Amenity','Large Tub'),(21,112,'Amenity','Large Tub'),(22,42,'Amenity','Large Tub'),(23,126,'Amenity','Large Tub'),(24,56,'Amenity','Large Tub'),(25,140,'Amenity','Large Tub'),(26,70,'Amenity','Large Tub'),(27,154,'Amenity','Large Tub'),(31,81,'Bed Preference','King'),(32,162,'Bed Preference','King'),(33,9,'Bed Preference','King'),(34,90,'Bed Preference','King'),(35,171,'Bed Preference','King'),(36,18,'Bed Preference','King'),(37,99,'Bed Preference','King'),(38,180,'Bed Preference','King'),(39,27,'Bed Preference','King'),(40,108,'Bed Preference','King'),(41,36,'Bed Preference','King'),(42,117,'Bed Preference','King'),(43,45,'Bed Preference','King'),(44,126,'Bed Preference','King'),(45,54,'Bed Preference','King'),(46,135,'Bed Preference','King'),(47,63,'Bed Preference','King'),(48,144,'Bed Preference','King'),(49,72,'Bed Preference','King'),(50,153,'Bed Preference','King');
/*!40000 ALTER TABLE `reservationrequirements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room` (
  `roomID` int NOT NULL AUTO_INCREMENT,
  `floorID` int NOT NULL,
  `roomNumber` varchar(10) NOT NULL,
  `roomTypeID` int NOT NULL,
  `baseRate` decimal(10,2) NOT NULL DEFAULT '0.00',
  `status` varchar(30) NOT NULL DEFAULT 'available',
  `hasToilet` tinyint(1) DEFAULT '1',
  `maxCapacity` int NOT NULL DEFAULT '1',
  `canSmoke` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`roomID`),
  KEY `idx_room_floor` (`floorID`),
  KEY `idx_room_type` (`roomTypeID`),
  CONSTRAINT `fk_room_floor` FOREIGN KEY (`floorID`) REFERENCES `floor` (`floorID`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_room_roomtype` FOREIGN KEY (`roomTypeID`) REFERENCES `roomtype` (`roomTypeID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES (1,1,'101',1,175.00,'available',1,2,0),(2,1,'102',1,175.00,'available',1,2,0),(3,1,'103',1,175.00,'available',1,2,0),(4,1,'104',1,175.00,'available',1,2,0),(5,1,'105',1,175.00,'available',1,2,0),(6,1,'106',2,235.00,'available',1,2,0),(7,1,'107',2,235.00,'available',1,2,0),(8,1,'108',2,235.00,'available',1,2,0),(9,1,'109',3,410.00,'available',1,4,0),(10,1,'110',3,410.00,'available',1,4,0),(11,2,'201',1,175.00,'available',1,2,0),(12,2,'202',1,175.00,'available',1,2,0),(13,2,'203',1,175.00,'available',1,2,0),(14,2,'204',1,175.00,'available',1,2,0),(15,2,'205',1,175.00,'available',1,2,0),(16,2,'206',2,235.00,'available',1,2,0),(17,2,'207',2,235.00,'available',1,2,0),(18,2,'208',2,235.00,'available',1,2,0),(19,2,'209',3,410.00,'available',1,4,0),(20,2,'210',3,410.00,'available',1,4,0),(21,3,'301',1,175.00,'available',1,2,0),(22,3,'302',1,175.00,'available',1,2,0),(23,3,'303',1,175.00,'available',1,2,0),(24,3,'304',1,175.00,'available',1,2,0),(25,3,'305',1,175.00,'available',1,2,0),(26,3,'306',2,235.00,'available',1,2,0),(27,3,'307',2,235.00,'available',1,2,0),(28,3,'308',2,235.00,'available',1,2,0),(29,3,'309',3,410.00,'available',1,4,0),(30,3,'310',3,410.00,'available',1,4,0),(31,4,'401',1,175.00,'available',1,2,0),(32,4,'402',1,175.00,'available',1,2,0),(33,4,'403',1,175.00,'available',1,2,0),(34,4,'404',1,175.00,'available',1,2,0),(35,4,'405',1,175.00,'available',1,2,0),(36,4,'406',2,235.00,'available',1,2,0),(37,4,'407',2,235.00,'available',1,2,0),(38,4,'408',2,235.00,'available',1,2,0),(39,4,'409',3,410.00,'available',1,4,0),(40,4,'410',3,410.00,'available',1,4,0),(41,5,'501',1,175.00,'available',1,2,0),(42,5,'502',1,175.00,'available',1,2,0),(43,5,'503',1,175.00,'available',1,2,0),(44,5,'504',1,175.00,'available',1,2,0),(45,5,'505',1,175.00,'available',1,2,0),(46,5,'506',2,235.00,'available',1,2,0),(47,5,'507',2,235.00,'available',1,2,0),(48,5,'508',2,235.00,'available',1,2,0),(49,5,'509',3,410.00,'available',1,4,0),(50,5,'510',3,410.00,'available',1,4,0),(51,6,'601',1,175.00,'available',1,2,0),(52,6,'602',1,175.00,'available',1,2,0),(53,6,'603',1,175.00,'available',1,2,0),(54,6,'604',1,175.00,'available',1,2,0),(55,6,'605',1,175.00,'available',1,2,0),(56,6,'606',2,235.00,'available',1,2,0),(57,6,'607',2,235.00,'available',1,2,0),(58,6,'608',2,235.00,'available',1,2,0),(59,6,'609',3,410.00,'available',1,4,0),(60,6,'610',3,410.00,'available',1,4,0),(61,7,'E201',4,650.00,'available',1,60,0),(62,7,'E202',4,820.00,'available',1,90,0),(63,7,'E203',4,520.00,'available',1,40,0),(64,7,'E204',4,980.00,'available',1,120,0);
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roombed`
--

DROP TABLE IF EXISTS `roombed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roombed` (
  `roomBedID` int NOT NULL AUTO_INCREMENT,
  `roomID` int NOT NULL,
  `bedTypeID` int NOT NULL,
  `bedCount` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`roomBedID`),
  KEY `fk_roombed_room` (`roomID`),
  KEY `fk_roombed_bedtype` (`bedTypeID`),
  CONSTRAINT `fk_roombed_bedtype` FOREIGN KEY (`bedTypeID`) REFERENCES `bedtype` (`bedTypeID`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_roombed_room` FOREIGN KEY (`roomID`) REFERENCES `room` (`roomID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roombed`
--

LOCK TABLES `roombed` WRITE;
/*!40000 ALTER TABLE `roombed` DISABLE KEYS */;
INSERT INTO `roombed` VALUES (1,1,1,1),(2,2,1,1),(3,3,1,1),(4,4,1,1),(5,5,1,1),(6,6,2,1),(7,7,2,1),(8,8,2,1),(9,9,2,1),(10,10,2,1),(11,11,1,1),(12,12,1,1),(13,13,1,1),(14,14,1,1),(15,15,1,1),(16,16,2,1),(17,17,2,1),(18,18,2,1),(19,19,2,1),(20,20,2,1),(21,21,1,1),(22,22,1,1),(23,23,1,1),(24,24,1,1),(25,25,1,1),(26,26,2,1),(27,27,2,1),(28,28,2,1),(29,29,2,1),(30,30,2,1),(31,31,1,1),(32,32,1,1),(33,33,1,1),(34,34,1,1),(35,35,1,1),(36,36,2,1),(37,37,2,1),(38,38,2,1),(39,39,2,1),(40,40,2,1),(41,41,1,1),(42,42,1,1),(43,43,1,1),(44,44,1,1),(45,45,1,1),(46,46,2,1),(47,47,2,1),(48,48,2,1),(49,49,2,1),(50,50,2,1),(51,51,1,1),(52,52,1,1),(53,53,1,1),(54,54,1,1),(55,55,1,1),(56,56,2,1),(57,57,2,1),(58,58,2,1),(59,59,2,1),(60,60,2,1),(64,20,3,2),(65,40,3,2),(66,60,3,2);
/*!40000 ALTER TABLE `roombed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roomfeature`
--

DROP TABLE IF EXISTS `roomfeature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roomfeature` (
  `roomFeatureID` int NOT NULL AUTO_INCREMENT,
  `featureName` varchar(80) NOT NULL,
  PRIMARY KEY (`roomFeatureID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roomfeature`
--

LOCK TABLES `roomfeature` WRITE;
/*!40000 ALTER TABLE `roomfeature` DISABLE KEYS */;
INSERT INTO `roomfeature` VALUES (1,'Sea Glimpse'),(2,'Open Balcony'),(3,'Snack Bar'),(4,'Large Tub'),(5,'Mini Kitchen'),(6,'Movie Projector'),(7,'Conference Audio');
/*!40000 ALTER TABLE `roomfeature` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roomtype`
--

DROP TABLE IF EXISTS `roomtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roomtype` (
  `roomTypeID` int NOT NULL AUTO_INCREMENT,
  `typeName` varchar(80) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`roomTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roomtype`
--

LOCK TABLES `roomtype` WRITE;
/*!40000 ALTER TABLE `roomtype` DISABLE KEYS */;
INSERT INTO `roomtype` VALUES (1,'Cozy Queen','Simple room for 1-2 guests'),(2,'Grand King','Larger room with premium amenities'),(3,'Brightening Suite','Multi-room suite for longer stays'),(4,'Meeting Room','Rooms used for meetings or events');
/*!40000 ALTER TABLE `roomtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicetype`
--

DROP TABLE IF EXISTS `servicetype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicetype` (
  `serviceTypeID` int NOT NULL AUTO_INCREMENT,
  `serviceName` varchar(100) NOT NULL,
  `rate` decimal(10,2) DEFAULT '0.00',
  `baseCharge` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`serviceTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicetype`
--

LOCK TABLES `servicetype` WRITE;
/*!40000 ALTER TABLE `servicetype` DISABLE KEYS */;
INSERT INTO `servicetype` VALUES (1,'Room Night',0.00,0.00),(2,'Wellness Bath',120.00,0.00),(3,'Late Bites',0.00,25.00),(4,'Room Rental',0.00,0.00),(5,'Car Space',30.00,0.00),(6,'Snack Tray',0.00,15.00);
/*!40000 ALTER TABLE `servicetype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wing`
--

DROP TABLE IF EXISTS `wing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wing` (
  `wingID` int NOT NULL AUTO_INCREMENT,
  `buildingID` int NOT NULL,
  `wingName` varchar(50) NOT NULL,
  `proximityToPool` tinyint(1) DEFAULT '0',
  `proximityToParking` tinyint(1) DEFAULT '0',
  `handicapAccess` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`wingID`),
  KEY `fk_wing_building` (`buildingID`),
  CONSTRAINT `fk_wing_building` FOREIGN KEY (`buildingID`) REFERENCES `building` (`buildingID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wing`
--

LOCK TABLES `wing` WRITE;
/*!40000 ALTER TABLE `wing` DISABLE KEYS */;
INSERT INTO `wing` VALUES (1,1,'Umi Wing',1,0,1),(2,1,'Minami Wing',0,1,1),(3,2,'Chasing Wing',1,1,1),(4,2,'Miku Wing',0,1,1);
/*!40000 ALTER TABLE `wing` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-08 17:19:43
