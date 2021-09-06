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
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `or_num` int NOT NULL AUTO_INCREMENT,
  `or_me_id` varchar(30) NOT NULL,
  `or_fuNums` varchar(255) DEFAULT NULL,
  `or_size` varchar(150) NOT NULL,
  `or_count` varchar(150) NOT NULL,
  `or_title` varchar(255) NOT NULL,
  `or_goodsname` longtext NOT NULL,
  `or_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `or_paytype` varchar(50) NOT NULL,
  `or_name` varchar(50) NOT NULL,
  `or_phone` varchar(50) NOT NULL,
  `or_email` varchar(50) NOT NULL,
  `or_state` varchar(50) NOT NULL DEFAULT '주문확인중',
  `or_price` int NOT NULL,
  `or_cancle` varchar(1) NOT NULL DEFAULT 'N',
  `or_message` longtext NOT NULL,
  `or_postnum` int NOT NULL,
  `or_add1` varchar(150) NOT NULL,
  `or_add2` varchar(150) DEFAULT NULL,
  `or_add3` varchar(150) NOT NULL,
  `or_add4` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`or_num`),
  KEY `or_me_id_idx` (`or_me_id`),
  CONSTRAINT `or_me_id` FOREIGN KEY (`or_me_id`) REFERENCES `member` (`me_id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (46,'qweqwe','35,35','235,220','1,2','BAB20210830095319','부드러운 풋살화 235/1개,부드러운 풋살화 220/2개','2021-08-30 21:53:19','card','임꺽정','01012345678','yme13@naver.com','배송시작',150000,'N','부재시 문 앞에 두고 가주세요.',28647,'충북 청주시 서원구 사직대로 146','10층','충북 청주시 서원구 사창동 296-1',' (사창동)'),(47,'qweqwe','34','85','1','LDD20210831110430','시원한 의류 85(XS)/1개','2021-08-31 11:04:30','without-bankbook','임꺽정','01012345678','yme13@naver.com','재고부족',100000,'Y','',28647,'충북 청주시 서원구 사직대로 146','10층','충북 청주시 서원구 사창동 296-1',' (사창동)'),(48,'qweqwe','45','85','2','SVI20210901102146','아디다스_트레이닝복(상의) 85(XS)/2개','2021-09-01 10:21:46','card','임꺽정','01012345678','yme13@naver.com','배송시작',82500,'N','부재시 경비실에 맡겨 주세요.',28647,'충북 청주시 서원구 사직대로 146','10층','충북 청주시 서원구 사창동 296-1',' (사창동)'),(49,'asd123','48,48','105,90','1,1','UQS20210902034003','푸마_트레이닝복세트(노랑) 105(XL)/1개,푸마_트레이닝복세트(노랑) 90(S)/1개','2021-09-02 15:40:03','card','김두한','01077777777','yme13@naver.com','주문확인중',152000,'N','부재시 경비실에 맡겨 주세요.',7236,'서울 영등포구 국회대로 지하 758','','서울 영등포구 여의도동 1-6',' (여의도동)'),(50,'asd123','46','225','2','UTD20210902040557','푸마_울트라3.1 225/2개','2021-09-02 16:05:57','card','김두한','01077777777','yme13@naver.com','주문확인중',72500,'N','',7236,'서울 영등포구 국회대로 지하 758','','서울 영등포구 여의도동 1-6',' (여의도동)'),(51,'zxc123123','48','90','2','XCA20210902041138','푸마_트레이닝복세트(노랑) 90(S)/2개','2021-09-02 16:11:38','kakaopay','뽀로로','01050442109','yme13@naver.com','배송시작',152000,'N','부재시 경비실에 맡겨 주세요.',28575,'충북 청주시 서원구 사직대로 109','4층','충북 청주시 서원구 사창동 148-7',' (사창동)'),(52,'zxc123123','43','225','1','IZR20210902041350','아디다스_코파19.3 225/1개','2021-09-02 16:13:50','kakaopay','뽀로로','01050442109','yme13@naver.com','배송시작',100000,'N','부재시 문 앞에 두고 가주세요.',28575,'충북 청주시 서원구 사직대로 109','4층','충북 청주시 서원구 사창동 148-7',' (사창동)'),(53,'zxc123123','41','235','2','VVK20210902041811','아디다스_주니어 235/2개','2021-09-02 16:18:11','kakaopay','뽀로로','01050442109','yme13@naver.com','주문취소',100000,'Y','',28575,'충북 청주시 서원구 사직대로 109','4층','충북 청주시 서원구 사창동 148-7',' (사창동)'),(54,'qweqwe','48','105','1','BJL20210902051017','푸마_트레이닝복세트(노랑) 105(XL)/1개','2021-09-02 17:10:17','kakaopay','임꺽정','01012345678','yme13@naver.com','재고부족',78500,'Y','',28647,'충북 청주시 서원구 사직대로 146','10층','충북 청주시 서원구 사창동 296-1',' (사창동)'),(55,'zxc123123','45','100','2','MYF20210903093920','아디다스_트레이닝복(상의) 100(L)/2개','2021-09-03 09:39:20','kakaopay','뽀로로','01050442109','yme13@naver.com','주문취소',82500,'Y','',28575,'충북 청주시 서원구 사직대로 109','4층','충북 청주시 서원구 사창동 148-7',' (사창동)'),(61,'qweqwe','33','240','1','OMW20210903124615','나이키_팬텀비전2 240/1개','2021-09-03 12:46:15','kakaopay','임꺽정','01012345678','yme13@naver.com','주문확인중',100000,'N','부재시 경비실에 맡겨 주세요.',28647,'충북 청주시 서원구 사직대로 146','10층','충북 청주시 서원구 사창동 296-1',' (사창동)'),(71,'qweqwe','43','220','3','XQY20210903010031','아디다스_코파19.3 220/3개','2021-09-03 13:00:31','kakaopay','임꺽정','01012345678','yme13@naver.com','주문취소',300000,'Y','부재시 경비실에 맡겨 주세요.',28647,'충북 청주시 서원구 사직대로 146','10층','충북 청주시 서원구 사창동 296-1',' (사창동)'),(72,'qweqwe','49','110','1','NMB20210903023901','푸마_트레이닝복 110(XXL)/1개','2021-09-03 14:39:01','kakaopay','임꺽정','01012345678','yme13@naver.com','주문확인중',70500,'N','부재시 문 앞에 두고 가주세요.',28647,'충북 청주시 서원구 사직대로 146','10층','충북 청주시 서원구 사창동 296-1',' (사창동)');
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
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
