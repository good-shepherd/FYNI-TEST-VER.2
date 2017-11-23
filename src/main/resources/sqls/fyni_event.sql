-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: fyni
-- ------------------------------------------------------
-- Server version	5.7.20-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event` (
  `event_ID` int(11) NOT NULL AUTO_INCREMENT,
  `event_Title` varchar(50) NOT NULL,
  `event_Content` varchar(600) DEFAULT NULL,
  `event_Up` int(11) DEFAULT '0',
  `event_Down` int(11) DEFAULT '0',
  `event_When` datetime DEFAULT NULL,
  `event_WrittenWhen` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `event_Picture` varchar(200) DEFAULT NULL,
  `category_ID` int(11) NOT NULL,
  `location_ID` int(11) NOT NULL DEFAULT '0',
  `user_ID` varchar(255) NOT NULL,
  `event_Hit` int(11) DEFAULT '0',
  PRIMARY KEY (`event_ID`),
  KEY `FK_event_Category_TO_event` (`category_ID`),
  KEY `FK_location_TO_event` (`location_ID`),
  KEY `FK_user_TO_event` (`user_ID`),
  CONSTRAINT `FK_event_Category_TO_event` FOREIGN KEY (`category_ID`) REFERENCES `event_category` (`category_ID`),
  CONSTRAINT `FK_location_TO_event` FOREIGN KEY (`location_ID`) REFERENCES `location` (`location_ID`),
  CONSTRAINT `FK_user_TO_event` FOREIGN KEY (`user_ID`) REFERENCES `user` (`user_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event`
--

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
INSERT INTO `event` VALUES (3,'aaaaa','aaaaaaaaaaaaaaaaa',0,0,'2017-11-09 10:23:11','2017-11-09 01:23:11',NULL,1,1,'CDH',0),(4,'title01','content01',0,0,'2017-11-22 14:59:40','2017-11-22 05:59:40',NULL,1,1,'CDH',0);
/*!40000 ALTER TABLE `event` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-23 17:33:54
