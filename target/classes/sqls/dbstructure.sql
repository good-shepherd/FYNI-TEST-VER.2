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
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event` (
  `event_ID` int(11) NOT NULL AUTO_INCREMENT,
  `event_Title` varchar(50) NOT NULL,
  `event_Content` varchar(1000) DEFAULT NULL,
  `event_Up` int(11) DEFAULT '0',
  `event_Down` int(11) DEFAULT '0',
  `event_WrittenWhen` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `event_Picture` varchar(500) DEFAULT NULL,
  `category_ID` int(11) NOT NULL,
  `user_ID` varchar(255) NOT NULL,
  `event_Hit` int(11) DEFAULT '0',
  `event_WhenBegins` datetime DEFAULT NULL,
  `event_WhenEnds` datetime DEFAULT NULL,
  `event_Address` varchar(300) DEFAULT NULL,
  `event_Location` point DEFAULT NULL,
  PRIMARY KEY (`event_ID`),
  KEY `FK_event_Category_TO_event` (`category_ID`),
  KEY `FK_user_TO_event` (`user_ID`),
  CONSTRAINT `FK_event_Category_TO_event` FOREIGN KEY (`category_ID`) REFERENCES `event_category` (`category_ID`),
  CONSTRAINT `FK_user_TO_event` FOREIGN KEY (`user_ID`) REFERENCES `user` (`user_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  `user_Address` varchar(300) DEFAULT NULL,
  `user_Location` point DEFAULT NULL,
  PRIMARY KEY (`user_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-04  1:12:39
