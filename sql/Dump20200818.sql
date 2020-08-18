-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: vgb
-- ------------------------------------------------------
-- Server version	8.0.20

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
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `id` char(10) NOT NULL,
  `name` varchar(45) NOT NULL,
  `password` varchar(20) NOT NULL,
  `gender` char(1) NOT NULL COMMENT 'M-男\\F-女',
  `email` varchar(45) NOT NULL,
  `birthday` date NOT NULL,
  `address` varchar(80) NOT NULL DEFAULT '',
  `phone` varchar(20) NOT NULL DEFAULT '',
  `class_name` varchar(25) NOT NULL DEFAULT 'Customer',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES ('A123123123','vu2','123456','M','test000111100112@gmail.com','2005-05-05','','','Customer'),('A123456761','西王母','123456','F','tes66442@gmail.com','1990-04-01','屏東縣','','Customer'),('A123456780','李四川','123450','F','stan666@gmail.com','1990-01-01','','','VIP'),('A123456789','WC','11111111','M','stan6000428@gmail.com','2000-07-03','','','Customer'),('A129067964','WU','SSSSSSSS','M','stan640899@gmail.com','1990-01-01','','','Customer');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `owner` varchar(45) DEFAULT NULL,
  `customer` varchar(45) DEFAULT NULL,
  `unitprice` double DEFAULT NULL,
  `description` varchar(300) NOT NULL,
  `wantChange` varchar(300) DEFAULT NULL,
  `photoUrl` varchar(500) DEFAULT NULL,
  `origin` varchar(20) NOT NULL DEFAULT '',
  `host` varchar(10) NOT NULL,
  `buy` varchar(10) DEFAULT NULL,
  `changebox` varchar(10) DEFAULT NULL,
  `createTime` date DEFAULT (curdate()),
  `ownerN` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'對馬戰鬼','A123456761',NULL,0,'由曾打造《惡名昭彰》系列的 Sucker Punch Productions 開發的日本武士開放世界遊戲，以 13 世紀對馬島為舞台，蒙古大軍來襲事件為背景，玩家將扮演大戰中唯一倖存的武士「境井仁」，','巫師6','header_btn_official_5c6e89d402f47594c67b03910fc49838.png','新北市','PS4','null','yes','2020-08-17','西往母'),(2,'紙片瑪利歐：摺紙國王','A123123123',NULL,1800,'11','','11','台北市','PS4','yes','null','2020-08-17','vu2'),(6,'集合啦！動物森友會','A123123123',NULL,1800,'系列最新作品重新詮釋動物之森的體驗方式，玩家參加「無人島移居計畫」，在以無人島為背景的遊戲中展開全新的生活。可以悠閒地在海邊漫步、四處探索，在什麼都沒有的無人島展開自由自在的生活。另外，還有全新改造系統，讓玩家可以 DIY，將島上的材料收集起來，DIY 成家具及生活所需的道具等等。享受園藝、釣魚、島上探索、居家環境佈置、與移居到島上的可愛動物們交流等多項體驗，讓玩家可以一面感受四季變化，一面享受悠閒生活。','巫師3+1','header_btn_official_5c6e89d402f47594c67b03910fc49838.png','台北市','PS4','yes','yes','2020-08-17','vu2'),(7,'123','A123456761',NULL,1230,'123','123','header_btn_official_5c6e89d402f47594c67b03910fc49838.png','','Switch','yes','yes','2020-08-17','西王母'),(9,'瑪利歐賽車 8 豪華版','A123456761',NULL,15000,'《瑪利歐賽車 8 豪華版》是在 Wii U 主機上推出的《瑪利歐賽車 8》的加強版作品，內容收錄了《瑪利歐賽車 8》發售後推出的全部追加下載項目，並且再追加了新角色、賽道、車種和道具，帶來《瑪利歐賽車','健身環大冒險','header_btn_official_5c6e89d402f47594c67b03910fc49838.png','臺南市','Switch','yes','yes','2020-08-18','西王母'),(10,'test','A123456761',NULL,0,'test','test','header_btn_official_5c6e89d402f47594c67b03910fc49838.png','花蓮縣','Switch',NULL,'yes','2020-08-18','西王母'),(11,'test2','A123456761',NULL,15000,'test2','','header_btn_official_5c6e89d402f47594c67b03910fc49838.png','臺北市','Switch','yes',NULL,'2020-08-18','西王母'),(12,'1111','A123456761',NULL,100,'1111','','header_btn_official_5c6e89d402f47594c67b03910fc49838.png','臺南市','Switch','yes',NULL,'2020-08-18','西王母'),(13,'1111','A123456761',NULL,10,'111111111','','header_btn_official_5c6e89d402f47594c67b03910fc49838.png','臺東縣','Switch','yes',NULL,'2020-08-18','西王母'),(14,'TEST3','A123456789',NULL,120,'111111111','','header_btn_official_5c6e89d402f47594c67b03910fc49838.png','臺南市','Switch','yes',NULL,'2020-08-18','WC'),(15,'TES4','A123456789',NULL,1230,'TEST4','','header_btn_official_5c6e89d402f47594c67b03910fc49838.png','','Switch','yes',NULL,'2020-08-18','WC'),(16,'寶可夢\'劍\'','A129067964',NULL,1000,'這是敘述','想交換的物品','照片','台南市','ps4','yes','','2020-08-18','va'),(17,'TEST05','A123456789',NULL,1000,'05','1111','header_btn_official_5c6e89d402f47594c67b03910fc49838.png','高雄市','Switch','yes','yes','2020-08-18','WC'),(18,'TEST06','A123456789',NULL,1000,'06','06','header_btn_official_5c6e89d402f47594c67b03910fc49838.png','臺南市','Switch','yes','yes','2020-08-18','WC');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-08-18 18:44:55
