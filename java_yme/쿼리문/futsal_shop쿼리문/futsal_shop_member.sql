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
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  `me_id` varchar(30) NOT NULL,
  `me_pw` varchar(255) NOT NULL,
  `me_name` varchar(20) NOT NULL,
  `me_phone` varchar(20) NOT NULL,
  `me_birth` int NOT NULL,
  `me_gender` varchar(1) NOT NULL,
  `me_email` varchar(30) NOT NULL,
  `me_postnum` int NOT NULL,
  `me_add1` varchar(150) NOT NULL,
  `me_add2` varchar(150) DEFAULT NULL,
  `me_add3` varchar(150) NOT NULL,
  `me_add4` varchar(150) DEFAULT NULL,
  `me_authority` varchar(40) NOT NULL DEFAULT 'USER',
  `session_id` varchar(255) DEFAULT NULL,
  `session_limit` datetime DEFAULT NULL,
  PRIMARY KEY (`me_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES ('asd123','$2a$10$tWhNkTq/aksPeeXPJB6kxumXz1Ae/My4d2l2ddBswtROWb9gzMsJm','김두한','01077777777',20000103,'M','yme13@naver.com',7236,'서울 영등포구 국회대로 지하 758','','서울 영등포구 여의도동 1-6',' (여의도동)','USER','none','2021-09-03 11:33:30'),('qwe123','$2a$10$O3sWKHN/JYf/qqXFqbgXSetvkLuvrlDpq0X71KCUnuQn4vv2Haez.','홍길동','01012345678',20000101,'M','yme13@naver.com',28647,'충북 청주시 서원구 사직대로 146','5층','충북 청주시 서원구 사창동 296-1',' (사창동)','SUB ADMIN','none','2021-09-03 12:36:00'),('qweqwe','$2a$10$fLjj1Odh8gbLGsSzqoLSk.JXDDtRb.mnCuxSBIjVcRLzX2fRQ0x9O','임꺽정','01012345678',20000102,'M','yme13@naver.com',28647,'충북 청주시 서원구 사직대로 146','10층','충북 청주시 서원구 사창동 296-1',' (사창동)','USER','9D52235271ECFD88A5AF37605321A806','2021-09-10 16:24:11'),('zxc123','$2a$10$b5sE4zZl8/RnVnoBkI.Xwe/iPkBjB9kv78TAX6IJp/ECxoGbPzz3i','나이팅게일','01012345678',20000102,'F','yme13@naver.com',13473,'경기 성남시 분당구 경부고속도로 409','','경기 성남시 분당구 삼평동 421',' (삼평동)','ADMIN','none','2021-08-19 12:49:01'),('zxc123123','$2a$10$vB61kOw3pvsUGvrSsMrO1Of4bK.3yikJxSwGzr92QqdYTPx5uh83G','뽀로로','01050442109',20000102,'M','yme13@naver.com',28575,'충북 청주시 서원구 사직대로 109','4층','충북 청주시 서원구 사창동 148-7',' (사창동)','USER','none','2021-09-03 11:19:23');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-06  9:32:38
