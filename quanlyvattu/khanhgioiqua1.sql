CREATE DATABASE  IF NOT EXISTS `quanlyvattu` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `quanlyvattu`;
-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: quanlyvattu
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
-- Table structure for table `chitietdonhang`
--

DROP TABLE IF EXISTS `chitietdonhang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chitietdonhang` (
  `ccdhId` int NOT NULL AUTO_INCREMENT,
  `ddhId` int NOT NULL,
  `vtId` int NOT NULL,
  `soLuongDat` int DEFAULT NULL,
  PRIMARY KEY (`ccdhId`),
  KEY `ddhId` (`ddhId`),
  KEY `vtId` (`vtId`),
  CONSTRAINT `chitietdonhang_ibfk_1` FOREIGN KEY (`ddhId`) REFERENCES `dondathang` (`ddhId`),
  CONSTRAINT `chitietdonhang_ibfk_2` FOREIGN KEY (`vtId`) REFERENCES `vattu` (`vtId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chitietdonhang`
--

LOCK TABLES `chitietdonhang` WRITE;
/*!40000 ALTER TABLE `chitietdonhang` DISABLE KEYS */;
INSERT INTO `chitietdonhang` VALUES (1,1,1,400),(2,2,2,700),(3,3,3,600),(4,1,4,1000),(5,1,5,350),(6,2,3,1100);
/*!40000 ALTER TABLE `chitietdonhang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chitietphieunhap`
--

DROP TABLE IF EXISTS `chitietphieunhap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chitietphieunhap` (
  `ccpnId` int NOT NULL AUTO_INCREMENT,
  `pnId` int NOT NULL,
  `vtId` int NOT NULL,
  `soLuongNhap` int DEFAULT NULL,
  `donGiaNhap` int DEFAULT NULL,
  PRIMARY KEY (`ccpnId`),
  KEY `pnId` (`pnId`),
  KEY `vtId` (`vtId`),
  CONSTRAINT `chitietphieunhap_ibfk_1` FOREIGN KEY (`pnId`) REFERENCES `phieunhap` (`pnId`),
  CONSTRAINT `chitietphieunhap_ibfk_2` FOREIGN KEY (`vtId`) REFERENCES `vattu` (`vtId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chitietphieunhap`
--

LOCK TABLES `chitietphieunhap` WRITE;
/*!40000 ALTER TABLE `chitietphieunhap` DISABLE KEYS */;
INSERT INTO `chitietphieunhap` VALUES (1,1,1,400,160000000),(2,1,4,1000,630000000),(3,1,5,350,350000000),(4,2,2,700,210000000),(5,2,3,1100,275000000),(6,3,3,600,150000000);
/*!40000 ALTER TABLE `chitietphieunhap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chitietphieuxuat`
--

DROP TABLE IF EXISTS `chitietphieuxuat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chitietphieuxuat` (
  `ccpxId` int NOT NULL AUTO_INCREMENT,
  `pxId` int NOT NULL,
  `vtId` int NOT NULL,
  `soLuongXuat` int DEFAULT NULL,
  `donGiaXuat` int DEFAULT NULL,
  PRIMARY KEY (`ccpxId`),
  KEY `pxId` (`pxId`),
  KEY `vtId` (`vtId`),
  CONSTRAINT `chitietphieuxuat_ibfk_1` FOREIGN KEY (`pxId`) REFERENCES `phieuxuat` (`pxId`),
  CONSTRAINT `chitietphieuxuat_ibfk_2` FOREIGN KEY (`vtId`) REFERENCES `vattu` (`vtId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chitietphieuxuat`
--

LOCK TABLES `chitietphieuxuat` WRITE;
/*!40000 ALTER TABLE `chitietphieuxuat` DISABLE KEYS */;
INSERT INTO `chitietphieuxuat` VALUES (1,1,1,120,48000000),(2,1,3,230,57500000),(3,1,4,340,214200000),(4,2,2,450,135000000),(5,2,3,130,32500000),(6,3,5,150,150000000);
/*!40000 ALTER TABLE `chitietphieuxuat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dondathang`
--

DROP TABLE IF EXISTS `dondathang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dondathang` (
  `ddhId` int NOT NULL AUTO_INCREMENT,
  `nccId` int NOT NULL,
  `ddhCode` varchar(255) DEFAULT NULL,
  `ddhNgayDatHang` date DEFAULT NULL,
  PRIMARY KEY (`ddhId`),
  KEY `nccId` (`nccId`),
  CONSTRAINT `dondathang_ibfk_1` FOREIGN KEY (`nccId`) REFERENCES `nhacungcap` (`nccId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dondathang`
--

LOCK TABLES `dondathang` WRITE;
/*!40000 ALTER TABLE `dondathang` DISABLE KEYS */;
INSERT INTO `dondathang` VALUES (1,1,'DH1','2021-11-01'),(2,2,'DH2','2021-10-20'),(3,3,'DH3','2021-10-11');
/*!40000 ALTER TABLE `dondathang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nhacungcap`
--

DROP TABLE IF EXISTS `nhacungcap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nhacungcap` (
  `nccId` int NOT NULL AUTO_INCREMENT,
  `nccCode` varchar(255) DEFAULT NULL,
  `nccName` varchar(255) DEFAULT NULL,
  `nccAddress` varchar(255) DEFAULT NULL,
  `nccPhone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`nccId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nhacungcap`
--

LOCK TABLES `nhacungcap` WRITE;
/*!40000 ALTER TABLE `nhacungcap` DISABLE KEYS */;
INSERT INTO `nhacungcap` VALUES (1,'Apple','NCC Apple','Mỹ','012345689'),(2,'Amazon','NCC Amazon','Mỹ','012467648'),(3,'Xiaomi','NCC Xiaomi','Trung Quốc','091247588');
/*!40000 ALTER TABLE `nhacungcap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phieunhap`
--

DROP TABLE IF EXISTS `phieunhap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `phieunhap` (
  `pnId` int NOT NULL AUTO_INCREMENT,
  `ddhId` int NOT NULL,
  `pnCode` varchar(255) DEFAULT NULL,
  `pnNgayNhap` date DEFAULT NULL,
  PRIMARY KEY (`pnId`),
  KEY `ddhId` (`ddhId`),
  CONSTRAINT `phieunhap_ibfk_1` FOREIGN KEY (`ddhId`) REFERENCES `dondathang` (`ddhId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phieunhap`
--

LOCK TABLES `phieunhap` WRITE;
/*!40000 ALTER TABLE `phieunhap` DISABLE KEYS */;
INSERT INTO `phieunhap` VALUES (1,1,'Nhập hàng Apple','2021-11-03'),(2,2,'Nhập hàng Amazon','2021-10-26'),(3,3,'Nhập hàng Xiaomi','2021-11-11');
/*!40000 ALTER TABLE `phieunhap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phieuxuat`
--

DROP TABLE IF EXISTS `phieuxuat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `phieuxuat` (
  `pxId` int NOT NULL AUTO_INCREMENT,
  `pxCode` varchar(255) DEFAULT NULL,
  `pxNgayXuat` date DEFAULT NULL,
  `customerName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`pxId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phieuxuat`
--

LOCK TABLES `phieuxuat` WRITE;
/*!40000 ALTER TABLE `phieuxuat` DISABLE KEYS */;
INSERT INTO `phieuxuat` VALUES (1,'PX1','2021-11-26','Lộc'),(2,'PX2','2021-11-30','Khánh'),(3,'PX3','2021-12-01','Bình');
/*!40000 ALTER TABLE `phieuxuat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tonkho`
--

DROP TABLE IF EXISTS `tonkho`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tonkho` (
  `tkId` int NOT NULL AUTO_INCREMENT,
  `vtId` int NOT NULL,
  `tkSoLuongDau` int DEFAULT NULL,
  `tkSoLuongNhap` int DEFAULT NULL,
  `tkSoLuongXuat` int DEFAULT NULL,
  PRIMARY KEY (`tkId`),
  KEY `vtId` (`vtId`),
  CONSTRAINT `tonkho_ibfk_1` FOREIGN KEY (`vtId`) REFERENCES `vattu` (`vtId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tonkho`
--

LOCK TABLES `tonkho` WRITE;
/*!40000 ALTER TABLE `tonkho` DISABLE KEYS */;
INSERT INTO `tonkho` VALUES (1,1,10,400,120),(2,2,5,640,450),(3,3,20,1700,360),(4,4,12,1000,340),(5,5,20,350,150);
/*!40000 ALTER TABLE `tonkho` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vattu`
--

DROP TABLE IF EXISTS `vattu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vattu` (
  `vtId` int NOT NULL AUTO_INCREMENT,
  `vtCode` varchar(255) DEFAULT NULL,
  `vtName` varchar(255) DEFAULT NULL,
  `vtDonViTinh` varchar(255) DEFAULT NULL,
  `vtPrice` int DEFAULT NULL,
  PRIMARY KEY (`vtId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vattu`
--

LOCK TABLES `vattu` WRITE;
/*!40000 ALTER TABLE `vattu` DISABLE KEYS */;
INSERT INTO `vattu` VALUES (1,'TuLanh','Tủ lạnh','cai',400000),(2,'DieuHoa','Điều hòa','cai',300000),(3,'BepDien','Bếp điện','cai',250000),(4,'MaySayToc','Máy sấy tóc','cai',630000),(5,'Laptop','Laptop','cai',1000000);
/*!40000 ALTER TABLE `vattu` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-01 22:10:43
