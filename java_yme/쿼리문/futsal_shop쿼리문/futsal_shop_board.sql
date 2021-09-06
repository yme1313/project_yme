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
-- Table structure for table `board`
--

DROP TABLE IF EXISTS `board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `board` (
  `bd_num` int NOT NULL AUTO_INCREMENT,
  `bd_me_id` varchar(30) NOT NULL,
  `bd_type` varchar(30) NOT NULL,
  `bd_title` varchar(255) NOT NULL,
  `bd_contents` longtext NOT NULL,
  `bd_regdate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `bd_valid` varchar(1) NOT NULL DEFAULT 'I',
  `bd_pw` varchar(255) DEFAULT NULL,
  `bd_answer` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`bd_num`),
  KEY `bd_me_id_idx` (`bd_me_id`),
  CONSTRAINT `bd_me_id` FOREIGN KEY (`bd_me_id`) REFERENCES `member` (`me_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board`
--

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` VALUES (1,'qwe123','NOTICE','공지사항입니다. <주문 관련>','안녕하세요','2021-08-06 10:37:27','I',NULL,'N'),(2,'qwe123','NOTICE','공지사항입니다. <상품 관련>','<p><span style=\"background-color: rgb(255, 255, 0);\">안녕하세요 !</span></p>','2021-08-06 12:02:22','I',NULL,'N'),(3,'qwe123','NOTICE','공지사항입니다. <회원 관련>','<p>333</p>','2021-08-09 09:26:58','I',NULL,'N'),(4,'qwe123','NOTICE','공지사항입니다. <코로나 관련>','4','2021-08-09 09:30:01','I',NULL,'N'),(5,'qwe123','NOTICE','공지사항입니다. [JSP 관련]','5','2021-08-09 09:30:01','I',NULL,'N'),(6,'qwe123','NOTICE','공지사항입니다. <프론트 관련>','6','2021-08-09 09:30:01','I',NULL,'N'),(7,'qwe123','NOTICE','공지사항입니다. [JS 관련]','7','2021-08-09 09:30:01','I',NULL,'N'),(8,'qwe123','NOTICE','공지사항입니다. <백엔드 관련>','8','2021-08-09 09:30:01','I',NULL,'N'),(9,'qwe123','NOTICE','공지사항입니다. <자바 관련>','9','2021-08-09 09:30:01','I',NULL,'N'),(10,'qwe123','NOTICE','공지사항입니다. <작성자 관련>','10','2021-08-09 09:30:01','I',NULL,'N'),(11,'qwe123','NOTICE','공지사항입니다. <재고 관련>','11','2021-08-09 09:30:01','I',NULL,'N'),(12,'qwe123','NOTICE','공지사항입니다. <권한 관련>','12','2021-08-09 09:30:01','I',NULL,'N'),(15,'qweqwe','ENQUIRY','문의사항입니다 !!!','<p>33</p>','2021-08-09 12:44:39','I','$2a$10$zRA5iEclkwQcfw56isKaiec3h6VpQwpQicylR2WpL4AXN7M3rpmpy','N'),(17,'qweqwe','ENQUIRY','호나우딩요 풋살화 관련 문의입니다.','<p>22</p>','2021-08-09 13:07:40','D','$2a$10$0UR/nxgNXm8Gu5BI7Byz5.Z0gaLYVDlSsPyQCdnNmlDUJdXw3r9fy','N'),(22,'qweqwe','ENQUIRY','호나우딩요 풋살화 관련 문의입니다.','<p>1234</p>','2021-08-09 14:54:00','I','$2a$10$kkyPbFPp1D92RWo1CmnCJOMr0LuldBwmU91KEjIxDrYLcQehhv1RK','N'),(23,'qwe123','NOTICE','공지사항입니다. 123','12345','2021-08-09 17:15:56','I',NULL,'N'),(26,'qwe123','ENQUIRY','33','<p>333</p>','2021-08-10 10:50:41','D','$2a$10$j2gZ.Ho1wbY5dCT6dKLNTuN4p0G3IdynKaBoKjqvCUC1JRQBLmLb.','N'),(27,'qweqwe','ENQUIRY','풋살화 재고 문의입니다.123','<p>123</p>','2021-08-10 12:30:10','D','$2a$10$bRD5Da3yXQVGO40YfftWNeDeHFDUFepMVWsLmzCVFXXXAUXgK6pNC','N'),(28,'qweqwe','ENQUIRY','의류 사이즈 문의해요~123','<p>123123</p>','2021-08-10 17:43:40','I','$2a$10$UZ.33U1F6aX17GqJrmKG4OruebxhX8UzH3bLAruzX97RAiRYsOwna','Y'),(29,'qweqwe','ENQUIRY','골키퍼 장갑 있나요? 123','<p>123</p>','2021-08-10 17:55:33','D','$2a$10$EutKh9lANHYfpJgZ74LaqOfVNB20L5uArdn0CFp0xNFh0spoqvbDS','N'),(30,'qweqwe','ENQUIRY','여성 풋살화는 사이즈가 몇 까지 있나요? 123','<p>220사이즈 있나요?</p>','2021-08-11 12:29:38','I','$2a$10$zX19p6vyleKQvvD89L7gmOMlzW39pB5pV8.1Fc0D079/KU1WZNRS.','Y'),(31,'qwe123','NOTICE','안녕하세요~ 관리자입니다.','<p>3</p>','2021-08-11 17:50:57','I',NULL,'N');
/*!40000 ALTER TABLE `board` ENABLE KEYS */;
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
