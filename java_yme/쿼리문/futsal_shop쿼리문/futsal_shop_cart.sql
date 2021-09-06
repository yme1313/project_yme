-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: futsal_shop
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `ca_num` int NOT NULL AUTO_INCREMENT,
  `ca_me_id` varchar(30) NOT NULL,
  `ca_fu_num` int NOT NULL,
  `ca_size` varchar(40) NOT NULL,
  `ca_count` int NOT NULL,
  `ca_price` int NOT NULL,
  `ca_valid` varchar(1) DEFAULT 'I',
  `ca_regdate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ca_num`),
  KEY `ca_me_id_idx` (`ca_me_id`),
  KEY `ca_fu_num_idx` (`ca_fu_num`),
  CONSTRAINT `ca_fu_num` FOREIGN KEY (`ca_fu_num`) REFERENCES `futsal` (`fu_num`),
  CONSTRAINT `ca_me_id` FOREIGN KEY (`ca_me_id`) REFERENCES `member` (`me_id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (32,'qweqwe',33,'220',1,250000,'D','2021-08-24 12:39:01'),(33,'qweqwe',33,'230',4,1000000,'D','2021-08-24 12:42:12'),(34,'qweqwe',35,'220',1,50000,'D','2021-08-25 12:04:40'),(35,'qweqwe',35,'240',3,150000,'D','2021-08-25 12:05:18'),(36,'qweqwe',35,'245',1,50000,'D','2021-08-25 12:24:15'),(37,'qweqwe',34,'80',1,100000,'D','2021-08-25 12:36:55'),(38,'qweqwe',34,'80',1,100000,'D','2021-08-28 23:01:36'),(39,'qweqwe',34,'85',2,200000,'D','2021-08-28 23:03:10'),(40,'asd123',35,'225',2,100000,'D','2021-08-30 13:03:41'),(41,'qweqwe',33,'230',2,500000,'D','2021-08-30 16:50:25'),(42,'qweqwe',34,'90',1,100000,'D','2021-08-30 16:50:31'),(43,'asd123',33,'240',1,250000,'D','2021-08-30 20:04:06'),(44,'qweqwe',35,'220',2,100000,'D','2021-08-30 21:47:40'),(45,'qweqwe',35,'235',1,50000,'D','2021-08-30 21:47:45'),(48,'qweqwe',34,'80',1,100,'D','2021-08-31 10:51:26'),(49,'qweqwe',34,'80',1,100,'D','2021-08-31 10:56:11'),(50,'qweqwe',34,'85',1,100000,'D','2021-08-31 10:59:05'),(51,'qweqwe',43,'220',3,300000,'D','2021-09-01 09:39:34'),(52,'asd123',48,'90',1,76000,'D','2021-09-02 12:26:07'),(53,'asd123',48,'105',1,76000,'D','2021-09-02 12:26:16'),(54,'asd123',46,'225',2,70000,'D','2021-09-02 15:40:35'),(55,'zxc123123',48,'90',2,152000,'D','2021-09-02 16:11:22'),(56,'zxc123123',43,'225',1,100000,'D','2021-09-02 16:13:36'),(57,'zxc123123',41,'235',2,100000,'D','2021-09-02 16:16:39'),(58,'zxc123123',45,'100',2,80000,'D','2021-09-03 09:36:54'),(59,'zxc123123',33,'230',2,200000,'D','2021-09-03 10:21:02'),(60,'zxc123123',38,'80',1,150000,'D','2021-09-03 11:12:29'),(61,'zxc123123',38,'100',1,150000,'D','2021-09-03 11:12:31'),(62,'zxc123123',36,'225',1,80000,'I','2021-09-03 11:12:39'),(63,'asd123',45,'85',1,40000,'D','2021-09-03 11:31:22'),(64,'asd123',45,'100',1,40000,'D','2021-09-03 11:31:24'),(65,'qweqwe',45,'100',3,120000,'I','2021-09-03 12:40:39'),(66,'qweqwe',33,'240',1,100000,'D','2021-09-03 12:40:46'),(67,'qweqwe',49,'110',1,68000,'D','2021-09-03 12:40:54');
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-06  9:32:37
