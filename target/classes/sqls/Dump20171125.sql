CREATE DATABASE  IF NOT EXISTS `fyni` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `fyni`;
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
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `comment_ID` int(11) NOT NULL AUTO_INCREMENT,
  `comment_Content` varchar(300) NOT NULL,
  `comment_Up` int(11) DEFAULT '0',
  `comment_Down` int(11) DEFAULT '0',
  `comment_WrittenWhen` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `event_ID` int(11) NOT NULL,
  `user_ID` varchar(255) NOT NULL,
  PRIMARY KEY (`comment_ID`),
  KEY `FK_event_TO_comment` (`event_ID`),
  KEY `FK_user_TO_comment` (`user_ID`),
  CONSTRAINT `FK_event_TO_comment` FOREIGN KEY (`event_ID`) REFERENCES `event` (`event_ID`),
  CONSTRAINT `FK_user_TO_comment` FOREIGN KEY (`user_ID`) REFERENCES `user` (`user_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (3,'정말 잘 봤습니다',0,0,'2017-11-09 01:26:45',3,'CDH'),(4,'가나다라마바사',0,0,'2017-11-09 01:27:23',3,'CDH');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment_report`
--

DROP TABLE IF EXISTS `comment_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment_report` (
  `event_ID` int(11) NOT NULL,
  `comment_ID` int(11) NOT NULL,
  `report_content` varchar(90) DEFAULT NULL,
  `report_category` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`event_ID`,`comment_ID`),
  KEY `FK_comment_TO_comment_Report` (`comment_ID`),
  CONSTRAINT `FK_comment_TO_comment_Report` FOREIGN KEY (`comment_ID`) REFERENCES `comment` (`comment_ID`),
  CONSTRAINT `FK_event_TO_comment_Report` FOREIGN KEY (`event_ID`) REFERENCES `event` (`event_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment_report`
--

LOCK TABLES `comment_report` WRITE;
/*!40000 ALTER TABLE `comment_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment_report` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event`
--

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
INSERT INTO `event` VALUES (3,'aaaaa','aaaaaaaaaaaaaaaaa',0,0,'2017-11-09 10:23:11','2017-11-09 01:23:11',NULL,1,1,'CDH',0),(4,'title01','content01',0,0,'2017-11-22 14:59:40','2017-11-22 05:59:40',NULL,1,1,'CDH',0),(5,'title02','content02',0,0,'2017-11-24 14:00:46','2017-11-24 05:00:46',NULL,1,2,'아이디야',0),(6,'title03','content03',0,0,'2017-11-24 14:01:34','2017-11-24 05:01:34',NULL,1,3,'유저아이디얏',0);
/*!40000 ALTER TABLE `event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_category`
--

DROP TABLE IF EXISTS `event_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_category` (
  `category_ID` int(11) NOT NULL,
  `category_Name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`category_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_category`
--

LOCK TABLES `event_category` WRITE;
/*!40000 ALTER TABLE `event_category` DISABLE KEYS */;
INSERT INTO `event_category` VALUES (1,'사건');
/*!40000 ALTER TABLE `event_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_report`
--

DROP TABLE IF EXISTS `event_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_report` (
  `event_ID` int(11) NOT NULL,
  `user_ID` varchar(255) NOT NULL,
  `report_Content` varchar(90) DEFAULT NULL,
  `report_Category` varchar(30) NOT NULL,
  PRIMARY KEY (`event_ID`,`user_ID`),
  KEY `FK_user_TO_event_Report` (`user_ID`),
  CONSTRAINT `FK_event_TO_event_Report` FOREIGN KEY (`event_ID`) REFERENCES `event` (`event_ID`),
  CONSTRAINT `FK_user_TO_event_Report` FOREIGN KEY (`user_ID`) REFERENCES `user` (`user_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_report`
--

LOCK TABLES `event_report` WRITE;
/*!40000 ALTER TABLE `event_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location` (
  `location_ID` int(11) NOT NULL AUTO_INCREMENT,
  `location_Title` varchar(50) DEFAULT NULL,
  `location_Point` point NOT NULL,
  PRIMARY KEY (`location_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (1,'판현백','\0\0\0\0\0\0\0QO�?�B@,�)\�_@'),(2,'멀캠','\0\0\0\0\0\0\0�0�*�B@�c���\�_@'),(3,'파주시청','\0\0\0\0\0\0\0\�\�B\�B@\�O\�\�_@');
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_ID` varchar(255) NOT NULL,
  `user_PWD` varchar(255) NOT NULL,
  `user_Nickname` varchar(255) NOT NULL,
  `user_EXP` int(11) DEFAULT '0',
  `user_Profile` tinyint(1) DEFAULT NULL,
  `user_Date` datetime DEFAULT CURRENT_TIMESTAMP,
  `location_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_ID`),
  KEY `FK_location_TO_user` (`location_ID`),
  CONSTRAINT `FK_location_TO_user` FOREIGN KEY (`location_ID`) REFERENCES `location` (`location_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('CDH','1234','CDH',0,1,'2017-11-09 10:16:45',NULL),('아이디야','비번이야','닉네임이야',0,0,'2017-11-09 10:29:12',3),('유저아이디얏','비번비번비번','닉네임크크크크크',0,0,'2017-11-09 10:33:58',2);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-25 17:22:18
