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
  `Email` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `FirstName` varchar(20) NOT NULL,
  `Surname` varchar(20) NOT NULL,
  `UserID` int(10) not null,
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `USER` WRITE;
/*!40000 ALTER TABLE `USER` DISABLE KEYS */;
INSERT INTO `USER` (`UserID`,`FirstName`,`Surname`,`Email`,`Password`)
VALUES
  (00010001,'Liam','Boyle','l.boyle@dundee.ac.uk','Liam123'),
  (00010002,'Sebastian','Salek','s.salek@dundee.ac.uk','Sebastian567'),
  (00010003,'Calum','Scott','c.scott@dundee.ac.uk','Calum1'),
  (00010004,'Iain','Murray','i.murray@dundee.ac.uk','IDog123'),
  (00010005,'Craig','Ramsey','c.ramsey@dundee.ac.uk','CR123'),
  (00010006,'Matthew','Daldry','m.daldry@dundee.ac.uk','MD123'),
  (00010007,'Jordan','Mckilligan','j.mckilligan@dundee.ac.uk','JM123');
  

/*!40000 ALTER TABLE `USER` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ROLE
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ROLE`;

CREATE TABLE `ROLE` (
  `UserID` int(10) not null,
  `ExamSetter` boolean DEFAULT NULL,
  `InternalModerator` boolean DEFAULT NULL,
  `ExternalExaminer` boolean DEFAULT NULL,
  `ExamVettingComittee` boolean DEFAULT NULL,
  `SchoolOffice` boolean DEFAULT NULL,
  `LocalExamOfficer` boolean DEFAULT NULL,
  PRIMARY KEY (`UserID`),
  KEY `fk_USERID` (`UserID`),
  CONSTRAINT `fk_USERID` FOREIGN KEY (`UserID`) REFERENCES `USER` (`UserID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `ROLE` WRITE;
/*!40000 ALTER TABLE `ROLE` DISABLE KEYS */;
INSERT INTO `ROLE` (`UserID`,`ExamSetter`,`InternalModerator`,`ExternalExaminer`,`ExamVettingComittee`,`SchoolOffice`,`LocalExamOfficer`)
VALUES
  (00010001,true,true,true,true,true,true),
  (00010002,true,true,true,true,true,true),
  (00010003,true,true,true,true,true,true);
  

/*!40000 ALTER TABLE `ROLE` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table EXAM
# ------------------------------------------------------------

DROP TABLE IF EXISTS `EXAM`;

CREATE TABLE `EXAM` (
  `ExamID` int(10) NOT NULL AUTO_INCREMENT,
  `Title` varchar(255) DEFAULT NULL,
  `School` varchar(255) DEFAULT NULL,
  `ModuleCoordinator` varchar(255) DEFAULT NULL,
  `ModuleCode` varchar(12) DEFAULT NULL,
  `ExamType` varchar(12) DEFAULT NULL,
  `ExamPeriod` varchar(12) DEFAULT NULL,
  `ExamLevel` varchar(100) DEFAULT NULL,
  `Year` int(4) DEFAULT NULL,
  `Status` varchar(20) DEFAULT NULL,
  `ExamPaper` longblob DEFAULT NULL,
  `SolutionsPaper` longblob DEFAULT NULL,
  PRIMARY KEY (`ExamID`),
  KEY `fk_EXAM_USER1` (`AuthorID`),
  CONSTRAINT `fk_EXAM_USER1` FOREIGN KEY (`AuthorID`) REFERENCES `USER` (`UserID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `EXAM` WRITE;
/*!40000 ALTER TABLE `EXAM` DISABLE KEYS */;
INSERT INTO `EXAM` (`ExamID`,`Title`,`School`,`ModuleCoordinator`,`ModuleCode`,`ExamType`,`ExamPeriod`,`ExamLevel`,`DateCreated`,`AuthorID`,`Deadline`,`Status`,`ExamPaper`,`AssignedTo`,`SolutionsPaper`,`InternalModerator`,`ExternalExaminer`,`ExamVettingComittee`)
VALUES

  (00000001,'Agile Software Engineering','Science and Engineering','Iain Murray','AC310001','Online','Main','Undergraduate','2019-01-21',00010002,'2019-01-29','New',NULL,00010006,NULL,00010001,00010003,00010004),
  (00000002,'AI and Algorithims','Science and Engineering','Iain Murray','AC330001','Online','Main','Undergraduate','2019-01-22',00010005,'2019-01-29','In Progress',NULL,00010006,NULL,00010001,NULL,00010004),
  (00000003,'Multi Paradigm','Science and Engineering','Iain Murray','AC320001','Online','Main','Postgraduate','2019-01-22',00010004,'2019-01-29','Completed',NULL,00010006,NULL,NULL,00010003,NULL),
  (00000004,'Web Authoring','Science and Engineering','Iain Murray','AC350001','Paper','Resit','Postgraduate','2019-01-22',00010003,'2019-01-29','Completed',NULL,00010006,NULL,00010001,00010003,00010004),
  (00000005,'Data Structures','Science and Engineering','Iain Murray','AC380001','Paper','Main','Undergraduate','2019-01-22',00010001,'2019-01-29','Completed',NULL,00010006,NULL,00010001,00010003,00010004);

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


# Dump of table Deadline
# ------------------------------------------------------------

DROP TABLE IF EXISTS `DEADLINE`;

CREATE TABLE `DEADLINE` (
  `Role` varchar(45) NOT NULL,
  `Date` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Role`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `DEADLINE` WRITE;
/*!40000 ALTER TABLE `DEADLINE` DISABLE KEYS */;
INSERT INTO `DEADLINE` (`Role`,`Date`)
VALUES

  ('Internal Moderator','10-12-19'),
  ('External Examiner','18-4-19'),
  ('Exam Vetting Comittee','12-9-19'),
  ('Exam Setter','24-5-19');

/*!40000 ALTER TABLE `DEADLINE` ENABLE KEYS */;
UNLOCK TABLES;


/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
  
