CREATE DATABASE  IF NOT EXISTS `quanlytourdulich` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `quanlytourdulich`;
-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: quanlytourdulich
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city` (
  `cityID` int NOT NULL AUTO_INCREMENT,
  `cityName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cityID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (1,'Ha Noi'),(2,'Ha Nam'),(3,'Ninh Binh'),(4,'Thanh Hoa'),(5,'Hai Duong'),(6,'Hai Phong'),(7,'Nam Dinh');
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `cID` int NOT NULL AUTO_INCREMENT,
  `cName` varchar(255) DEFAULT NULL,
  `cCCCD` varchar(255) DEFAULT NULL,
  `cDOB` int DEFAULT NULL,
  `cityID` int NOT NULL,
  PRIMARY KEY (`cID`),
  KEY `cityID` (`cityID`),
  CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`cityID`) REFERENCES `city` (`cityID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Loc','113',2000,1),(2,'Khanh','114',2005,6),(3,'Dinh','115',1997,5),(4,'Cuong','116',2000,3),(5,'Truong','117',1995,2),(6,'Hieu','118',1994,1),(7,'Thai','119',1997,4),(8,'Lap','200',1996,6),(9,'Y','201',1993,3),(10,'Long','202',2000,1),(11,'Xuan Anh','203',1998,7);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receipt`
--

DROP TABLE IF EXISTS `receipt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `receipt` (
  `rID` int NOT NULL AUTO_INCREMENT,
  `tID` int NOT NULL,
  `cID` int NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rID`),
  KEY `tID` (`tID`),
  KEY `cID` (`cID`),
  CONSTRAINT `receipt_ibfk_1` FOREIGN KEY (`tID`) REFERENCES `tour` (`tID`),
  CONSTRAINT `receipt_ibfk_2` FOREIGN KEY (`cID`) REFERENCES `customer` (`cID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receipt`
--

LOCK TABLES `receipt` WRITE;
/*!40000 ALTER TABLE `receipt` DISABLE KEYS */;
INSERT INTO `receipt` VALUES (1,1,1,'Đã đóng tiền'),(2,4,2,'Đã đóng tiền'),(3,2,1,'Đã đóng tiền'),(4,1,6,'Đã đóng tiền'),(5,3,11,'Đã đóng tiền'),(6,1,10,'Đã đóng tiền'),(7,7,3,'Đã đóng tiền');
/*!40000 ALTER TABLE `receipt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tour`
--

DROP TABLE IF EXISTS `tour`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tour` (
  `tID` int NOT NULL AUTO_INCREMENT,
  `tCode` varchar(255) DEFAULT NULL,
  `ttID` int NOT NULL,
  `tPrice` int DEFAULT NULL,
  `tStartDate` date DEFAULT NULL,
  `tEndDate` date DEFAULT NULL,
  PRIMARY KEY (`tID`),
  KEY `ttID` (`ttID`),
  CONSTRAINT `tour_ibfk_1` FOREIGN KEY (`ttID`) REFERENCES `tourtype` (`ttID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tour`
--

LOCK TABLES `tour` WRITE;
/*!40000 ALTER TABLE `tour` DISABLE KEYS */;
INSERT INTO `tour` VALUES (1,'HN-TH',1,1000000,'2021-03-02','2021-03-06'),(2,'HN-HP',2,700000,'2021-04-07','2021-04-11'),(3,'ND-TH',1,400000,'2021-10-29','2021-10-31'),(4,'HP-NB',1,1200000,'2021-03-10','2021-03-16'),(5,'HP-TH',2,1500000,'2021-03-11','2021-03-23'),(6,'HD-ND',1,300000,'2021-04-07','2021-04-19'),(7,'HD-TH',2,2000000,'2021-01-05','2021-04-14');
/*!40000 ALTER TABLE `tour` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tourtype`
--

DROP TABLE IF EXISTS `tourtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tourtype` (
  `ttID` int NOT NULL AUTO_INCREMENT,
  `ttCode` varchar(255) DEFAULT NULL,
  `ttName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ttID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tourtype`
--

LOCK TABLES `tourtype` WRITE;
/*!40000 ALTER TABLE `tourtype` DISABLE KEYS */;
INSERT INTO `tourtype` VALUES (1,'A','Xin'),(2,'Z','Thuong');
/*!40000 ALTER TABLE `tourtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `traveldestinations`
--

DROP TABLE IF EXISTS `traveldestinations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `traveldestinations` (
  `tdID` int NOT NULL AUTO_INCREMENT,
  `tID` int NOT NULL,
  `tdName` varchar(255) DEFAULT NULL,
  `tdDescription` varchar(255) DEFAULT NULL,
  `tdPrice` int DEFAULT NULL,
  `cityID` int NOT NULL,
  PRIMARY KEY (`tdID`),
  KEY `tID` (`tID`),
  KEY `cityID` (`cityID`),
  CONSTRAINT `traveldestinations_ibfk_1` FOREIGN KEY (`tID`) REFERENCES `tour` (`tID`),
  CONSTRAINT `traveldestinations_ibfk_2` FOREIGN KEY (`cityID`) REFERENCES `city` (`cityID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `traveldestinations`
--

LOCK TABLES `traveldestinations` WRITE;
/*!40000 ALTER TABLE `traveldestinations` DISABLE KEYS */;
INSERT INTO `traveldestinations` VALUES (1,1,'Nam Dinh','đến Nam Định',300000,7),(2,1,'Ninh Binh','đến Ninh Bình',100000,3),(3,1,'Sam Son','đến Sầm Sơn',300000,4),(4,2,'Hai Duong','đến Hải Dương',200000,5),(5,2,'Hai Phong','đến Hải Phòng',300000,6),(6,3,'Ninh Binh','đến Ninh Bình',100000,3),(7,3,'Sầm Sơn','đến Sầm Sơn',200000,4),(8,4,'Nam Định','đến Nam Định',400000,7),(9,4,'Ninh Bình','đến Ninh Bình',200000,3),(10,7,'Ninh Bình','đến Ninh Bình',1000000,3),(11,7,'Sầm Sơn','đến Sầm Sơn ',400000,4);
/*!40000 ALTER TABLE `traveldestinations` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-29 10:43:47
