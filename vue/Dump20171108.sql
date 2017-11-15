-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: sms
-- ------------------------------------------------------
-- Server version	5.6.38

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
-- Table structure for table `xk_clazz`
--

DROP TABLE IF EXISTS `xk_clazz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xk_clazz` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xk_clazz`
--

LOCK TABLES `xk_clazz` WRITE;
/*!40000 ALTER TABLE `xk_clazz` DISABLE KEYS */;
INSERT INTO `xk_clazz` VALUES (1,'web1701'),(2,'web1702'),(3,'web1703'),(4,'web1704'),(6,'web1705'),(8,'web1706');
/*!40000 ALTER TABLE `xk_clazz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xk_course`
--

DROP TABLE IF EXISTS `xk_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xk_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `credit` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xk_course`
--

LOCK TABLES `xk_course` WRITE;
/*!40000 ALTER TABLE `xk_course` DISABLE KEYS */;
INSERT INTO `xk_course` VALUES (1,'unix','5'),(2,'html','2'),(3,'css','3'),(4,'javascript','4'),(5,'jquery','1'),(6,'mysql','2'),(9,'Java','5'),(11,'vue','7');
/*!40000 ALTER TABLE `xk_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xk_student`
--

DROP TABLE IF EXISTS `xk_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xk_student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `birth` char(40) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk1003_idx` (`class_id`),
  CONSTRAINT `fk1003` FOREIGN KEY (`class_id`) REFERENCES `xk_clazz` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xk_student`
--

LOCK TABLES `xk_student` WRITE;
/*!40000 ALTER TABLE `xk_student` DISABLE KEYS */;
INSERT INTO `xk_student` VALUES (16,'李四','男','2017-09-30T16:00:00.000Z',1,'123321'),(17,'王小五','男','2017-07-31T16:00:00.000Z',2,'121234'),(18,'赵小四','男','2017-08-14T16:00:00.000Z',4,'123458'),(22,'张三','男','2016-10-03T16:00:00.000Z',1,'123321'),(33,'小旺','男','2017-10-31T16:00:00.000Z',3,'76543'),(34,'妞妞','女','2017-07-18T16:00:00.000Z',6,'123075');
/*!40000 ALTER TABLE `xk_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xk_studentcourse`
--

DROP TABLE IF EXISTS `xk_studentcourse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xk_studentcourse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `grade` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk1001_idx` (`student_id`),
  KEY `fk1002_idx` (`course_id`),
  CONSTRAINT `fk1001` FOREIGN KEY (`student_id`) REFERENCES `xk_student` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk1002` FOREIGN KEY (`course_id`) REFERENCES `xk_course` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xk_studentcourse`
--

LOCK TABLES `xk_studentcourse` WRITE;
/*!40000 ALTER TABLE `xk_studentcourse` DISABLE KEYS */;
INSERT INTO `xk_studentcourse` VALUES (5,92,16,2),(6,89,16,3);
/*!40000 ALTER TABLE `xk_studentcourse` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-08 20:36:03
