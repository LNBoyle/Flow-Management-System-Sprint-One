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

# Dump of table user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `USER`;

CREATE TABLE `USER` (
  `UserID` int(10) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `FirstName` varchar(20) NOT NULL,
  `Surname` varchar(20) NOT NULL,
  `ExamSetter` boolean NOT NULL,
  `InternalModerator` boolean NOT NULL,
  `ExternalExaminer` boolean NOT NULL,
  `ExamVettingComittee` boolean NOT NULL,
  `SchoolOffice` boolean NOT NULL,
  `LocalExamOfficer` boolean NOT NULL,
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `USER` WRITE;
/*!40000 ALTER TABLE `USER` DISABLE KEYS */;
INSERT INTO `USER` (`UserID`,`FirstName`,`Surname`,`Email`,`Password`,`ExamSetter`,`InternalModerator`,`ExternalExaminer`,`ExamVettingComittee`,`SchoolOffice`,`LocalExamOfficer`)
VALUES
  (00010001,'Liam','Boyle','l.boyle@dundee.ac.uk','Liam123',false,true,false,false,false,false),
  (00010002,'Sebastian','Salek','s.salek@dundee.ac.uk','Sebastian567',false,true,false,false,false,false),
  (00010003,'Calum','Scott','c.scott@dundee.ac.uk','Calum1',false,false,true,false,false,false),
  (00010004,'Iain','Murray','i.murray@dundee.ac.uk','IDog123',false,false,false,true,false,false),
  (00010005,'Craig','Ramsey','c.ramsey@dundee.ac.uk','CR123',true,true,true,true,true,true),
  (00010006,'Matthew','Daldry','m.daldry@dundee.ac.uk','MD123',false,false,false,false,true,false),
  (00010007,'Jordan','Mckilligan','j.mckilligan@dundee.ac.uk','JM123',true,false,false,false,false,false);
  

/*!40000 ALTER TABLE `USER` ENABLE KEYS */;
UNLOCK TABLES;

# Dump of table role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ROLE`;

CREATE TABLE `ROLE` (
  `UserID` int(10) NOT NULL,
  `ExamSetter` boolean NOT NULL,
  `InternalModerator` boolean NOT NULL,
  `ExternalExaminer` boolean NOT NULL,
  `ExamVettingComittee` boolean NOT NULL,
  `SchoolOffice` boolean NOT NULL,
  `LocalExamOfficer` boolean NOT NULL,
  PRIMARY KEY (`UserID`),
  KEY `pk_UserID` (`UserID`),
  CONSTRAINT `pk_UserID` FOREIGN KEY (`UserID`) REFERENCES `USER` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `ROLE` WRITE;
/*!40000 ALTER TABLE `ROLE` DISABLE KEYS */;
INSERT INTO `ROLE` (`UserID`,`ExamSetter`,`InternalModerator`,`ExternalExaminer`,`ExamVettingComittee`,`SchoolOffice`,`LocalExamOfficer`)
VALUES
  (00010001,false,true,false,false,false,false),
  (00010002,false,true,false,false,false,false),
  (00010003,false,false,true,false,false,false),
  (00010004,false,false,false,true,false,false),
  (00010005,true,true,true,true,true,true),
  (00010006,false,false,false,false,true,false),
  (00010007,true,false,false,false,false,false);
  

/*!40000 ALTER TABLE `ROLE` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table AssignedExams
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ASSIGNEDEXAMS`;

CREATE TABLE `ASSIGNEDEXAMS` (
  `AssignedExamID` int(10) NOT NULL AUTO_INCREMENT,
  `ModuleCode` varchar(12) NOT NULL,
  `ExamPeriod` varchar(12) NOT NULL,
  `ExamLevel` varchar(20) NOT NULL,
  `ExamSetter` int(10) NOT NULL,
  `InternalModerator` int(10) NOT NULL,
  `ExternalExaminer` int(10) NOT NULL,
  `ExamVettingComittee` int(10) NOT NULL,
  PRIMARY KEY (`AssignedExamID`),
  KEY `fk_EXAMSET` (`ExamSetter`),
  KEY `fk_INTERNALMOD` (`InternalModerator`),
  KEY `fk_EXTERNALEXAM` (`ExternalExaminer`),
  KEY `fk_EXAMVETTING` (`ExamVettingComittee`),
  CONSTRAINT `fk_EXAMSET` FOREIGN KEY (`ExamSetter`) REFERENCES `USER` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_INTERNALMOD` FOREIGN KEY (`InternalModerator`) REFERENCES `USER` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_EXTERNALEXAM` FOREIGN KEY (`ExternalExaminer`) REFERENCES `USER` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_EXAMVETTING` FOREIGN KEY (`ExamVettingComittee`) REFERENCES `USER` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


LOCK TABLES `ASSIGNEDEXAMS` WRITE;
/*!40000 ALTER TABLE `ASSIGNEDEXAMS` DISABLE KEYS */;
INSERT INTO `ASSIGNEDEXAMS` (`AssignedExamID`,`ModuleCode`,`ExamPeriod`,`ExamLevel`,`ExamSetter`,`InternalModerator`,`ExternalExaminer`,`ExamVettingComittee`)
VALUES
  (1,'AC310001','Main','Undergraduate',00010007,00010001,00010003,00010004),
  (2,'AC330001','Main','Undergraduate',00010007,00010001,00010003,00010004),
  (3,'AC320001','Main','Postgraduate',00010007,00010001,00010003,00010004);

/*!40000 ALTER TABLE `ASSIGNEDEXAMS` ENABLE KEYS */;
UNLOCK TABLES;

# Dump of table Exam
# ------------------------------------------------------------

DROP TABLE IF EXISTS `EXAM`;

CREATE TABLE `EXAM` (
  `ExamID` int(10) NOT NULL AUTO_INCREMENT,
  `Title` varchar(255) NOT NULL,
  `School` varchar(255) NOT NULL,
  `ModuleCoordinator` varchar(255) NOT NULL,
  `ModuleCode` varchar(12) NOT NULL,
  `ExamType` varchar(12) NOT NULL,
  `ExamPeriod` varchar(12) NOT NULL,
  `ExamLevel` varchar(20) NOT NULL,
  `Semester` varchar(1) NOT NULL,
  `Year` int(4) NOT NULL,
  `Status` varchar(20) NOT NULL,
  `ExamPaper` longblob DEFAULT NULL,
  `SolutionsPaper` longblob DEFAULT NULL,
  PRIMARY KEY (`ExamID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `EXAM` WRITE;
/*!40000 ALTER TABLE `EXAM` DISABLE KEYS */;
INSERT INTO `EXAM` (`ExamID`,`Title`,`School`,`ModuleCoordinator`,`ModuleCode`,`ExamType`,`ExamPeriod`,`ExamLevel`,`Semester`,`Year`,`Status`,`ExamPaper`,`SolutionsPaper`)
VALUES

  (00000001,'Agile Software Engineering','Science and Engineering','Iain Murray','AC310001','Online','Main','Undergraduate','2','2019','New',NULL,NULL),
  (00000002,'AI and Algorithims','Science and Engineering','Iain Murray','AC330001','Online','Main','Undergraduate','1','2020','In Progress',NULL,NULL),
  (00000003,'Multi Paradigm','Science and Engineering','Iain Murray','AC320001','Online','Main','Postgraduate','2','2019','Completed',NULL,NULL),
  (00000004,'Web Authoring','Science and Engineering','Iain Murray','AC350001','Paper','Resit','Postgraduate','1','2020','Completed',NULL,NULL),
  (00000005,'Data Structures','Science and Engineering','Iain Murray','AC380001','Paper','Main','Undergraduate','2','2019','Completed',NULL,NULL);

/*!40000 ALTER TABLE `EXAM` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Comment
# ------------------------------------------------------------

DROP TABLE IF EXISTS `COMMENT`;

CREATE TABLE `COMMENT` (
  `CommentID` int(20) NOT NULL AUTO_INCREMENT,
  `ExamID` int(10) NOT NULL,
  `UserID` int(10) NOT NULL,
  `Comment` varchar(1000) NOT NULL,
  `CommentTimeStamp` varchar(20) NOT NULL,
  PRIMARY KEY (`CommentID`),
  KEY `fk_COMMENT_EXAM1` (`ExamID`),
  KEY `fk_COMMENT_USER1` (`UserID`),
  CONSTRAINT `fk_COMMENT_EXAM1` FOREIGN KEY (`ExamID`) REFERENCES `EXAM` (`ExamID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_COMMENT_USER1` FOREIGN KEY (`UserID`) REFERENCES `USER` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `COMMENT` WRITE;
/*!40000 ALTER TABLE `COMMENT` DISABLE KEYS */;
INSERT INTO `COMMENT` (`CommentID`,`ExamID`,`UserID`,`Comment`,`CommentTimeStamp`)
VALUES

  (1,00000001,00010001,'Looks Good!','28/01/2019 18:00'),
  (2,00000002,00010001,'Needs Some Improvement','29/01/2019 17:24'),
  (3,00000001,00010004,'Looks all fine','29/01/2019 17:44');
  

/*!40000 ALTER TABLE `COMMENT` ENABLE KEYS */;
UNLOCK TABLES;

# Dump of table Responce
# ------------------------------------------------------------

DROP TABLE IF EXISTS `RESPONCE`;

CREATE TABLE `RESPONCE` (
  `CommentID` int(20) NOT NULL,
  `Responce` varchar(1000) NOT NULL,
  `ResponceTimeStamp` varchar(20) NOT NULL,
  PRIMARY KEY (`CommentID`),
  KEY `pk_CommentID` (`CommentID`),
  CONSTRAINT `pk_CommentID` FOREIGN KEY (`CommentID`) REFERENCES `COMMENT` (`CommentID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `RESPONCE` WRITE;
/*!40000 ALTER TABLE `RESPONCE` DISABLE KEYS */;
INSERT INTO `RESPONCE` (`CommentID`,`Responce`,`ResponceTimeStamp`)
VALUES

  (1,'Thanks for the feedback','28/01/2019 20:00');
  

/*!40000 ALTER TABLE `RESPONCE` ENABLE KEYS */;
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
  
