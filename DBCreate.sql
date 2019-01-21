# Sequel Pro dump
# Version 1630
# http://code.google.com/p/sequel-pro
#
# Host: 127.0.0.1 (MySQL 5.1.37)
# Database: SQLTutorialMaster
# Generation Time: 2010-01-14 14:44:38 +0000
# ************************************************************

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

DROP DATABASE IF EXISTS `18agileteam8db`;

CREATE DATABASE `18agileteam8db`;

USE `18agileteam8db`;

# Dump of table USER
# ------------------------------------------------------------

DROP TABLE IF EXISTS `USER`;

CREATE TABLE `USER` (
  `FirstName` varchar(20) NOT NULL,
  `Surname` varchar(20) NOT NULL,
  `Role` varchar(45) DEFAULT NULL,
  `UserID` int(10) not null,
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `USER` WRITE;
/*!40000 ALTER TABLE `USER` DISABLE KEYS */;
INSERT INTO `USER` (`UserID`,`FirstName`,`Surname`,`Role`)
VALUES
	(00010001,'Liam','Boyle','Admin'),
	(00010002,'Sebastian','Salek','Lecturer'),
	(00010003,'Calum','Scott','Examiner'),
	(00010004,'Iain','Murray','Lecturer');
	

/*!40000 ALTER TABLE `USER` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table EXAM
# ------------------------------------------------------------

DROP TABLE IF EXISTS `EXAM`;

CREATE TABLE `EXAM` (
  `ExamID` int(10) NOT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `School` varchar(255) DEFAULT NULL,
  `ModuleCode` varchar(12) DEFAULT NULL,
  `DateCreated` date DEFAULT NULL,
  `AuthorID` int(10) DEFAULT NULL,
  `Deadline` date DEFAULT NULL,
  `Status` varchar(20) DEFAULT NULL,
  `File` blob DEFAULT NULL,
  `AssignedTo` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ExamID`),
  KEY `fk_EXAM_USER1` (`AuthorID`),
  CONSTRAINT `fk_EXAM_USER1` FOREIGN KEY (`AuthorID`) REFERENCES `USER` (`UserID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `EXAM` WRITE;
/*!40000 ALTER TABLE `EXAM` DISABLE KEYS */;
INSERT INTO `EXAM` (`ExamID`,`Title`,`School`,`ModuleCode`,`DateCreated`,`AuthorID`,`Deadline`,`Status`,`File`,`AssignedTo`)
VALUES

	(00000001,'Agile Software Engineering','Science and Engineering','AC310001','2019-01-21',00010002,'2019-01-29','New',NULL,'Calum');

/*!40000 ALTER TABLE `EXAM` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Comments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `COMMENT`;

CREATE TABLE `COMMENT` (
  `CommentID` int(20) NOT NULL,
  `ExamID` int(10) DEFAULT NULL,
  `UserID` int(10) DEFAULT NULL,
  `Comment` varchar(255) not null,
  PRIMARY KEY (`CommentID`),
  KEY `fk_COMMENT_EXAM1` (`ExamID`),
  KEY `fk_COMMENT_USER1` (`UserID`),
  CONSTRAINT `fk_COMMENT_EXAM1` FOREIGN KEY (`ExamID`) REFERENCES `EXAM` (`ExamID`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_COMMENT_USER1` FOREIGN KEY (`UserID`) REFERENCES `USER` (`UserID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;




LOCK TABLES `COMMENT` WRITE;
/*!40000 ALTER TABLE `COMMENT` DISABLE KEYS */;
INSERT INTO `COMMENT` (`CommentID`,`ExamID`,`UserID`,`Comment`)
VALUES

	(00000001,00000001,00010003,'Looks Good!');
	

/*!40000 ALTER TABLE `COMMENT` ENABLE KEYS */;
UNLOCK TABLES;

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
