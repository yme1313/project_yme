-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: spring_yme
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
  `rp_me_id` varchar(15) NOT NULL,
  `rp_content` longtext NOT NULL,
  `rp_valid` varchar(1) NOT NULL DEFAULT 'I',
  `rp_regDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `rp_upDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`rp_num`),
  KEY `rp_me_id_idx` (`rp_me_id`),
  KEY `rp_bd_num_idx` (`rp_bd_num`),
  CONSTRAINT `rp_bd_num` FOREIGN KEY (`rp_bd_num`) REFERENCES `board` (`num`),
  CONSTRAINT `rp_me_id` FOREIGN KEY (`rp_me_id`) REFERENCES `member` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reply`
--

LOCK TABLES `reply` WRITE;
/*!40000 ALTER TABLE `reply` DISABLE KEYS */;
INSERT INTO `reply` VALUES (1,55,'qwe123','test','I','2021-07-21 10:53:20','2021-07-21 10:53:20'),(2,55,'qwe123','test11','I','2021-07-21 11:35:00','2021-07-21 11:35:00'),(3,55,'qwe123','test22','D','2021-07-21 11:44:00','2021-07-22 10:10:40'),(4,55,'qwe123','test33','I','2021-07-21 11:45:08','2021-07-21 11:45:08'),(5,55,'qwe123','test55','I','2021-07-21 13:40:57','2021-07-22 10:10:36'),(6,55,'qwe123','test55','D','2021-07-21 16:11:10','2021-07-22 09:37:44'),(7,55,'qqq123','test66','I','2021-07-21 16:14:38','2021-07-21 16:14:38');
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

-- Dump completed on 2021-07-22 17:12:54
