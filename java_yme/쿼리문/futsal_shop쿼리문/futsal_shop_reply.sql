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
-- Table structure for table `reply`
--

DROP TABLE IF EXISTS `reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reply` (
  `rp_num` int NOT NULL AUTO_INCREMENT,
  `rp_bd_num` int NOT NULL,
  `rp_me_id` varchar(30) NOT NULL,
  `rp_content` longtext NOT NULL,
  `rp_valid` varchar(1) NOT NULL DEFAULT 'I',
  `rp_regDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`rp_num`),
  KEY `rp_bd_num_idx` (`rp_bd_num`),
  KEY `rp_me_id_idx` (`rp_me_id`),
  CONSTRAINT `rp_bd_num` FOREIGN KEY (`rp_bd_num`) REFERENCES `board` (`bd_num`),
  CONSTRAINT `rp_me_id` FOREIGN KEY (`rp_me_id`) REFERENCES `member` (`me_id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reply`
--

LOCK TABLES `reply` WRITE;
/*!40000 ALTER TABLE `reply` DISABLE KEYS */;
INSERT INTO `reply` VALUES (94,28,'qwe123','12','D','2021-08-12 10:30:56'),(95,29,'qwe123','33323','D','2021-08-12 11:33:08'),(96,30,'qwe123','123','D','2021-08-12 12:02:09'),(97,30,'qwe123','','D','2021-08-12 12:03:21'),(98,30,'qwe123','12323','D','2021-08-12 12:03:34'),(99,30,'qwe123','123','D','2021-08-12 12:04:33'),(100,30,'qwe123','123','D','2021-08-12 12:05:57'),(101,30,'qwe123','123','D','2021-08-12 12:06:02'),(102,30,'qwe123','없습니다. ^^','I','2021-08-12 12:06:12'),(103,28,'qwe123','집에 가세요. ^^','I','2021-08-13 16:46:22');
/*!40000 ALTER TABLE `reply` ENABLE KEYS */;
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
