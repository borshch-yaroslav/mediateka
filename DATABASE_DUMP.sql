CREATE DATABASE  IF NOT EXISTS `mediateka` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `mediateka`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: localhost    Database: mediateka
-- ------------------------------------------------------
-- Server version	5.5.37

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
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `author` varchar(100) NOT NULL,
  `state` varchar(45) NOT NULL,
  `type_id` int(11) NOT NULL,
  `meaning_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `media_id` int(11) DEFAULT NULL,
  `description` text,
  `library_book_id` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `book_type_FK_idx` (`type_id`),
  KEY `book_language_FK_idx` (`language_id`),
  KEY `book_meaning_FK_idx` (`meaning_id`),
  KEY `book_media_FK_idx` (`media_id`),
  CONSTRAINT `book_language_FK` FOREIGN KEY (`language_id`) REFERENCES `book_language` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `book_meaning_FK` FOREIGN KEY (`meaning_id`) REFERENCES `book_meaning` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `book_media_FK` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `book_type_FK` FOREIGN KEY (`type_id`) REFERENCES `book_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES (16,'Thincking in Java','Bruce Ekel','ACTIVE',1,3,3,58,NULL,'1'),(17,'Робінзон Крузо','Даніель Дефо','ACTIVE',1,8,1,59,'            This is the best book ever','6'),(18,'Діти капітана Гранта','Жуль Верн','ACTIVE',1,8,1,60,'                              Діти капітана Гранта','3'),(19,'Жерминаль','Эмиль Золя','ACTIVE',1,8,2,61,NULL,'4'),(20,'Жерміналь','Еміль Золя','ACTIVE',1,8,1,91,'   Про шахтарів','17');
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_language`
--

DROP TABLE IF EXISTS `book_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book_language` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_language`
--

LOCK TABLES `book_language` WRITE;
/*!40000 ALTER TABLE `book_language` DISABLE KEYS */;
INSERT INTO `book_language` VALUES (1,'ukrainian','ACTIVE'),(2,'russian','ACTIVE'),(3,'foreign','ACTIVE');
/*!40000 ALTER TABLE `book_language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_meaning`
--

DROP TABLE IF EXISTS `book_meaning`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book_meaning` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_meaning`
--

LOCK TABLES `book_meaning` WRITE;
/*!40000 ALTER TABLE `book_meaning` DISABLE KEYS */;
INSERT INTO `book_meaning` VALUES (1,'sociopolitical','ACTIVE'),(2,'natural_science','ACTIVE'),(3,'technical','ACTIVE'),(4,'local_studies','ACTIVE'),(5,'other','ACTIVE'),(6,'art_and_sport','ACTIVE'),(7,'linguistics_and_literary_Studies','ACTIVE'),(8,'fiction_literature','ACTIVE'),(9,'children\'s_literature','ACTIVE');
/*!40000 ALTER TABLE `book_meaning` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_type`
--

DROP TABLE IF EXISTS `book_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_type`
--

LOCK TABLES `book_type` WRITE;
/*!40000 ALTER TABLE `book_type` DISABLE KEYS */;
INSERT INTO `book_type` VALUES (1,'book','ACTIVE'),(2,'other_publication','ACTIVE'),(3,'audio_video','ACTIVE');
/*!40000 ALTER TABLE `book_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat_message`
--

DROP TABLE IF EXISTS `chat_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chat_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` text,
  `user_id` int(11) DEFAULT NULL,
  `club_id` int(11) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `creation_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `chat_message_user_FK_idx` (`user_id`),
  KEY `chat_message_club_FK_idx` (`club_id`),
  CONSTRAINT `chat_message_club_FK` FOREIGN KEY (`club_id`) REFERENCES `club` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `chat_message_user_FK` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=204 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_message`
--

LOCK TABLES `chat_message` WRITE;
/*!40000 ALTER TABLE `chat_message` DISABLE KEYS */;
INSERT INTO `chat_message` VALUES (199,'Hello',9,6,'ACTIVE','2015-07-08 09:38:50'),(200,'Hi',9,6,'ACTIVE','2015-07-08 10:41:34'),(201,'Hello',9,6,'ACTIVE','2015-07-08 10:46:56'),(202,'Hello',3,6,'ACTIVE','2015-07-08 10:47:18'),(203,'123',3,6,'ACTIVE','2015-07-12 08:49:58');
/*!40000 ALTER TABLE `chat_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `club`
--

DROP TABLE IF EXISTS `club`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `club` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text,
  `ava_id` int(11) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `club_media_FK_idx` (`ava_id`),
  CONSTRAINT `club_media_FK` FOREIGN KEY (`ava_id`) REFERENCES `media` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `club`
--

LOCK TABLES `club` WRITE;
/*!40000 ALTER TABLE `club` DISABLE KEYS */;
INSERT INTO `club` VALUES (6,'Кіно клуб','Ми показуєм фільми!',56,'ACTIVE'),(7,'Club','My club',1,'DELETED');
/*!40000 ALTER TABLE `club` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `club_event_member`
--

DROP TABLE IF EXISTS `club_event_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `club_event_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `club_id` int(11) DEFAULT NULL,
  `event_id` int(11) DEFAULT NULL,
  `type` varchar(45) NOT NULL,
  `state` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `club_event_user_user_FK_idx` (`user_id`),
  KEY `club_event_user_club_FK_idx` (`club_id`),
  KEY `club_event_user_event_FK_idx` (`event_id`),
  CONSTRAINT `club_event_user_club_FK` FOREIGN KEY (`club_id`) REFERENCES `club` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `club_event_user_event_FK` FOREIGN KEY (`event_id`) REFERENCES `event` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `club_event_user_user_FK` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `club_event_member`
--

LOCK TABLES `club_event_member` WRITE;
/*!40000 ALTER TABLE `club_event_member` DISABLE KEYS */;
INSERT INTO `club_event_member` VALUES (16,9,6,NULL,'CREATOR','ACTIVE'),(17,9,7,NULL,'CREATOR','ACTIVE'),(18,9,NULL,9,'CREATOR','ACTIVE'),(19,9,NULL,10,'CREATOR','ACTIVE'),(20,9,NULL,11,'CREATOR','ACTIVE'),(21,9,NULL,12,'CREATOR','ACTIVE');
/*!40000 ALTER TABLE `club_event_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_group`
--

DROP TABLE IF EXISTS `content_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(45) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `creator_id` int(11) DEFAULT NULL,
  `creation_date` timestamp NULL DEFAULT NULL,
  `text` text,
  `event_id` int(11) DEFAULT NULL,
  `club_id` int(11) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `like` int(11) DEFAULT NULL,
  `dislike` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contenet_groupe_user_FK_idx` (`creator_id`),
  KEY `content_groupe_event_FK_idx` (`event_id`),
  KEY `content_groupe_club_FK_idx` (`club_id`),
  KEY `content_group_parent_FK_idx` (`parent_id`),
  CONSTRAINT `content_groupe_club_FK` FOREIGN KEY (`club_id`) REFERENCES `club` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `content_groupe_event_FK` FOREIGN KEY (`event_id`) REFERENCES `event` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `content_groupe_user_FK` FOREIGN KEY (`creator_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_group`
--

LOCK TABLES `content_group` WRITE;
/*!40000 ALTER TABLE `content_group` DISABLE KEYS */;
INSERT INTO `content_group` VALUES (76,'RECORD',NULL,3,'2015-07-08 10:42:30','First record',NULL,6,'DELETED',0,0,NULL),(77,'RECORD',NULL,3,'2015-07-08 10:42:30','First record',NULL,6,'ACTIVE',1,0,NULL),(78,'COMMENT',NULL,3,'2015-07-08 10:43:08','233',NULL,6,'ACTIVE',0,0,77),(79,'COMMENT',NULL,9,'2015-07-08 10:45:57','55',NULL,6,'ACTIVE',0,0,77),(80,'COMMENT',NULL,9,'2015-07-08 10:48:31','666',NULL,6,'DELETED',0,0,77),(81,'COMMENT',NULL,9,'2015-07-08 10:48:39','777',NULL,6,'DELETED',0,0,77),(82,'RECORD',NULL,9,'2015-07-08 12:36:06','',NULL,6,'ACTIVE',0,0,NULL),(83,'RECORD',NULL,9,'2015-07-08 12:39:21','',NULL,6,'ACTIVE',0,0,NULL),(84,'COMMENT',NULL,9,'2015-07-08 14:21:06','сщььуте',NULL,6,'ACTIVE',1,0,83),(85,'RECORD',NULL,9,'2015-07-08 14:23:16','Текс',NULL,6,'ACTIVE',0,0,NULL),(86,'IMAGE','Альбом',9,'2015-07-08 14:24:51',NULL,NULL,6,'ACTIVE',0,0,NULL),(87,'COMMENT',NULL,3,'2015-07-09 15:15:42','123',NULL,6,'DELETED',0,0,85),(88,'COMMENT',NULL,3,'2015-07-09 15:26:53','2343',NULL,6,'ACTIVE',0,0,85),(89,'COMMENT',NULL,3,'2015-07-09 15:26:57','4555',NULL,6,'ACTIVE',0,0,85),(90,'COMMENT',NULL,3,'2015-07-09 15:27:01','6666',NULL,6,'ACTIVE',0,0,85),(91,'COMMENT',NULL,3,'2015-07-09 15:27:04','777',NULL,6,'ACTIVE',0,0,85),(92,'RECORD',NULL,3,'2015-07-09 15:38:28','',NULL,6,'ACTIVE',0,0,NULL),(93,'RECORD',NULL,3,'2015-07-09 15:52:52','',NULL,6,'ACTIVE',0,0,NULL),(94,'RECORD',NULL,3,'2015-07-09 15:52:54','',NULL,6,'ACTIVE',0,0,NULL),(95,'RECORD',NULL,3,'2015-07-09 15:59:39','',NULL,6,'ACTIVE',0,0,NULL),(96,'AUDIO',NULL,9,'2015-07-12 08:43:37',NULL,NULL,6,'ACTIVE',0,0,NULL),(97,'RECORD',NULL,3,'2015-07-12 09:16:45','Hello Hello Hi hi ho ho ho sdfh sdfj hjksgh kjdfhg kjdhfgkj hdfjkhg jkdhfgj hdfkjh kjdfhg jkdfhg jhdfjkh djfkhg hdf hdfkg hdfkjg hjkdfh kjdhf kjdhg kdjfhg kjdfhg kjdfh kjdhfgkj hdfkj hdfkjh dfkhg dkjfhg jdk hdfkjghdkjghdkjfhgdkjfhgdfjk   jdfgh jdf hkdfhg kdfhg kdhf kjdhf kdhf khdf dkf hdfkjhg dkfjhgkjdfh kdfh dfg khdfkjgh kdfh kdhfgk dhfgkdfhg kjhdf kdfhg dkfhg dkfh kdfhgkjdfhlsduif u',NULL,6,'ACTIVE',0,0,NULL),(98,'IMAGE','The best album  ever',3,'2015-07-12 09:20:00',NULL,NULL,6,'ACTIVE',0,0,NULL),(99,'IMAGE','dfgdfgdfgfdgdfgfdgfdg',3,'2015-07-12 09:21:31',NULL,NULL,6,'ACTIVE',0,0,NULL);
/*!40000 ALTER TABLE `content_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(45) DEFAULT NULL,
  `name` varchar(250) DEFAULT NULL,
  `date_from` timestamp NULL DEFAULT NULL,
  `date_till` timestamp NULL DEFAULT NULL,
  `club_id` int(11) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `ava_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `event_club_id_idx` (`club_id`),
  KEY `event_media_FK_idx` (`ava_id`),
  CONSTRAINT `event_club_FK` FOREIGN KEY (`club_id`) REFERENCES `club` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `event_media_FK` FOREIGN KEY (`ava_id`) REFERENCES `media` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event`
--

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
INSERT INTO `event` VALUES (9,'MEETING','Зустріч з Білом Гейтсом','2015-07-08 13:25:00','2015-07-08 14:25:00',NULL,'ACTIVE','Дуже крута зустріч',1),(10,'EXHIBITION','Виставка Автомобілів','2015-07-08 21:00:00','2015-08-07 21:00:00',NULL,'ACTIVE','Виставка ретро автомобілів',1),(11,'EXHIBITION','Фотовиставка','2015-09-04 21:00:00','2015-09-06 21:00:00',NULL,'ACTIVE','Виставка фотографій',1),(12,'EXHIBITION','Виставка Автомобілів2','2015-07-07 21:00:00','2015-08-07 21:00:00',NULL,'ACTIVE','ауауа',1),(13,'EXHIBITION','Виставка Гглиняних виробів','2015-08-09 21:00:00','2015-08-16 21:00:00',NULL,'ACTIVE','',1);
/*!40000 ALTER TABLE `event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `form_record`
--

DROP TABLE IF EXISTS `form_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `form_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_from` timestamp NULL DEFAULT NULL,
  `date_till` timestamp NULL DEFAULT NULL,
  `book_id` int(11) DEFAULT NULL,
  `goal` varchar(45) DEFAULT NULL,
  `event_id` int(11) DEFAULT NULL,
  `comment` varchar(100) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `state` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `from_record_book_FK_idx` (`book_id`),
  KEY `form_record_event_FK_idx` (`event_id`),
  KEY `form_record_user_FK_idx` (`user_id`),
  KEY `form_record_admin_FK_idx` (`admin_id`),
  CONSTRAINT `form_record_admin_FK` FOREIGN KEY (`admin_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `form_record_event_FK` FOREIGN KEY (`event_id`) REFERENCES `event` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `form_record_user_FK` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `from_record_book_FK` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `form_record`
--

LOCK TABLES `form_record` WRITE;
/*!40000 ALTER TABLE `form_record` DISABLE KEYS */;
INSERT INTO `form_record` VALUES (23,'2015-07-08 12:01:41','2015-07-08 12:00:41',NULL,'WI_FI',NULL,'					',10,3,'ACTIVE'),(24,'2015-07-01 12:14:13','2015-07-08 12:14:13',16,NULL,NULL,'				sdfsdf	',4,3,'ACTIVE'),(25,'2015-07-10 14:13:27','2015-07-10 14:14:27',17,NULL,NULL,'					',3,3,'ACTIVE'),(26,'2015-07-10 14:31:39','2015-07-10 14:31:39',17,NULL,NULL,'					',9,3,'ACTIVE'),(27,'2015-07-10 15:20:47','2015-07-10 15:20:47',NULL,NULL,NULL,'					',9,3,'ACTIVE'),(28,'2015-07-10 15:24:54','2015-07-10 15:24:54',NULL,NULL,NULL,'					',9,3,'ACTIVE'),(29,'2015-07-10 15:34:43','2015-07-10 15:24:43',NULL,NULL,NULL,'					',9,3,'ACTIVE'),(30,'2015-07-10 15:49:03','2015-07-10 15:48:03',19,NULL,NULL,'					',9,3,'ACTIVE');
/*!40000 ALTER TABLE `form_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `like_record`
--

DROP TABLE IF EXISTS `like_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `like_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `content_group_id` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_like_record_FK_idx` (`user_id`),
  KEY `content_group_like_record_FK_idx` (`content_group_id`),
  CONSTRAINT `content_group_like_record_FK` FOREIGN KEY (`content_group_id`) REFERENCES `content_group` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `user_like_record_FK` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `like_record`
--

LOCK TABLES `like_record` WRITE;
/*!40000 ALTER TABLE `like_record` DISABLE KEYS */;
INSERT INTO `like_record` VALUES (14,3,77,1),(15,9,84,1),(16,9,83,0),(17,3,97,0);
/*!40000 ALTER TABLE `like_record` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `like_record_AINS` AFTER INSERT ON `like_record` 
FOR EACH ROW
BEGIN
IF (NEW.state = 1) THEN 
	UPDATE mediateka.content_group AS c1 
		INNER JOIN mediateka.content_group AS c2 
			ON c1.id= c2.id AND c1.id=NEW.content_group_id
		SET c1.`like`=c2.`like`+1;
    END IF;
IF (NEW.state = -1) THEN 
	UPDATE mediateka.content_group AS c1 
		INNER JOIN mediateka.content_group AS c2 
			ON c1.id= c2.id AND c1.id=NEW.content_group_id
		SET c1.`dislike`=c2.`dislike`+1;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `like_record_BUPD` BEFORE UPDATE ON `like_record` FOR EACH ROW
BEGIN
IF (NEW.state = 1) THEN 
    IF ( OLD.state = 0) THEN
	UPDATE mediateka.content_group AS c1 
		INNER JOIN mediateka.content_group AS c2 
			ON c1.id= c2.id AND c1.id=NEW.content_group_id
		SET c1.`like`=c2.`like`+1;
	END IF;
    IF ( OLD.state = 1) THEN
	UPDATE mediateka.content_group AS c1 
		INNER JOIN mediateka.content_group AS c2 
			ON c1.id= c2.id AND c1.id=NEW.content_group_id
		SET c1.`like`=c2.`like`-1;
        SET NEW.state =0;
	END IF;
        IF ( OLD.state = -1) THEN
	UPDATE mediateka.content_group AS c1 
		INNER JOIN mediateka.content_group AS c2 
			ON c1.id= c2.id AND c1.id=NEW.content_group_id
		SET c1.`like`=c2.`like`+1;
        UPDATE mediateka.content_group AS c1 
		INNER JOIN mediateka.content_group AS c2 
			ON c1.id= c2.id AND c1.id=NEW.content_group_id
		SET c1.`dislike`=c2.`dislike`-1;
	END IF;
END IF;
IF (NEW.state = -1) THEN 
    IF ( OLD.state = 0) THEN
	UPDATE mediateka.content_group AS c1 
		INNER JOIN mediateka.content_group AS c2 
			ON c1.id= c2.id AND c1.id=NEW.content_group_id
		SET c1.`dislike`=c2.`dislike`+1;
	END IF;
    IF ( OLD.state = -1) THEN
	UPDATE mediateka.content_group AS c1 
		INNER JOIN mediateka.content_group AS c2 
			ON c1.id= c2.id AND c1.id=NEW.content_group_id
		SET c1.`dislike`=c2.`dislike`-1;
	SET NEW.state =0;
SET NEW.state =0;
	END IF;
        IF ( OLD.state = 1) THEN
	UPDATE mediateka.content_group AS c1 
		INNER JOIN mediateka.content_group AS c2 
			ON c1.id= c2.id AND c1.id=NEW.content_group_id
		SET c1.`like`=c2.`like`-1;
        UPDATE mediateka.content_group AS c1 
		INNER JOIN mediateka.content_group AS c2 
			ON c1.id= c2.id AND c1.id=NEW.content_group_id
		SET c1.`dislike`=c2.`dislike`+1;
	END IF;
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `map_event`
--

DROP TABLE IF EXISTS `map_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `map_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(101) DEFAULT NULL,
  `description` text,
  `adress` varchar(101) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_map_event_FK_idx` (`admin_id`),
  CONSTRAINT `user_map_event_FK` FOREIGN KEY (`admin_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `map_event`
--

LOCK TABLES `map_event` WRITE;
/*!40000 ALTER TABLE `map_event` DISABLE KEYS */;
INSERT INTO `map_event` VALUES (1,'Подія','Описання','Адреса',49.84232611158573,24.032747784838875,'ACTIVE',3);
/*!40000 ALTER TABLE `map_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(45) NOT NULL,
  `path` varchar(255) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `content_group_id` int(11) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `media_content_grope_FK_idx` (`content_group_id`),
  CONSTRAINT `media_content_grope_FK` FOREIGN KEY (`content_group_id`) REFERENCES `content_group` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES (1,'IMAGE','path','sdfsd',NULL,'ACTIVE','dfdf'),(56,'IMAGE','media/club/club6/images/Xem3HBbBTtHJJt6M.png',NULL,NULL,'ACTIVE','blob'),(57,'IMAGE','media\\userAva\\userAva9\\images\\hax7R2Jr6DhfV3VZ.png',NULL,NULL,'ACTIVE','blob'),(58,'IMAGE','media\\book ava\\images\\NzmMBQYTbKRFxkkH.jpg',NULL,NULL,'ACTIVE','java.jpg'),(59,'IMAGE','media\\book ava\\images\\ptaRX5bnw3aeQh5u.jpg',NULL,NULL,'ACTIVE','Робінзон.jpg'),(60,'IMAGE','media\\book ava\\images\\vCNKEQVySdXzMA2E.jpg',NULL,NULL,'ACTIVE','дітиГранта.jpg'),(61,'IMAGE','media\\book ava\\images\\g6Ma29JFjMXSDJNe.jpg',NULL,NULL,'ACTIVE','Жерміналь.jpg'),(62,'IMAGE','media\\userAva\\userAva9\\images\\EA9waj4bwV7zHDKD.png',NULL,NULL,'ACTIVE','blob'),(63,'IMAGE','media/club/club6/images/7tyH2WafEdZPp4SC.jpg',NULL,82,'ACTIVE','Chrysanthemum.jpg'),(64,'IMAGE','media/club/club6/images/y2sXZYkUHcbG7n8A.jpg',NULL,83,'ACTIVE','Lighthouse.jpg'),(65,'IMAGE','media/club/club6/images/pW8j4McAuBCG88tF.jpg',NULL,83,'ACTIVE','Penguins.jpg'),(66,'IMAGE','media/club/club6/images/G6s45jrtW6g6edtb.jpg',NULL,85,'ACTIVE','Desert.jpg'),(67,'IMAGE','media/club/club6/images/tQt68bHVqZWquP8H.jpg',NULL,85,'ACTIVE','Hydrangeas.jpg'),(68,'IMAGE','media/club/club6/images/zJAWGGGKyEFaj5EE.jpg',NULL,85,'ACTIVE','Jellyfish.jpg'),(69,'IMAGE','media/club/club6/images/bsmdFxNeYwHAY5kF.jpg',NULL,85,'ACTIVE','Koala.jpg'),(70,'IMAGE','media/club/club6/images/fPwwaZBNspJYYkjq.jpg',NULL,85,'ACTIVE','Lighthouse.jpg'),(71,'IMAGE','media/club/club6/images/tVXES8WrQRxqVag5.jpg',NULL,85,'ACTIVE','Penguins.jpg'),(72,'IMAGE','media/club/club6/images/X8XXdjvZzXy9D6wt.jpg',NULL,85,'ACTIVE','Tulips.jpg'),(73,'AUDIO','media/club/club6/audios/YE8JzR5N494tUfB2.mp3',NULL,85,'ACTIVE','Sleep Away.mp3'),(74,'IMAGE','media/club/club6/images/QHUy58Puc8wuvg9f.jpg',NULL,86,'ACTIVE','Chrysanthemum.jpg'),(75,'IMAGE','media/club/club6/images/FH6mrCJmK96c5GxQ.jpg',NULL,86,'ACTIVE','Desert.jpg'),(76,'IMAGE','media/club/club6/images/j6uf9uzZSYHx4p7P.jpg',NULL,86,'ACTIVE','Hydrangeas.jpg'),(77,'IMAGE','media/club/club6/images/K7XWGE8UGjKHjZ5J.jpg',NULL,86,'ACTIVE','Jellyfish.jpg'),(78,'IMAGE','media/club/club6/images/67TNkKydSW5dnaRb.jpg',NULL,86,'ACTIVE','Koala.jpg'),(79,'IMAGE','media/club/club6/images/ZnXpW2hUNad4c4nj.jpg',NULL,86,'ACTIVE','Lighthouse.jpg'),(80,'IMAGE','media/club/club6/images/47JWe6usDEvTDRzX.jpg',NULL,86,'ACTIVE','Penguins.jpg'),(81,'IMAGE','media/club/club6/images/DGT3jzGpbpu4KfrN.jpg',NULL,86,'ACTIVE','Tulips.jpg'),(82,'POSTER','media/club/club6/videos/vMNPdAVpAKK7Rr6z.jpg',NULL,NULL,NULL,NULL),(83,'VIDEO','media/club/club6/videos/vMNPdAVpAKK7Rr6z.MP4',NULL,92,'ACTIVE','GOPR4920.MP4'),(84,'POSTER','media\\club\\club6\\videos\\fZk2tBkEEP4GSsra.jpg',NULL,NULL,NULL,NULL),(85,'VIDEO','media/club/club6/videos/fZk2tBkEEP4GSsra.MP4',NULL,93,'ACTIVE','GOPR4923.MP4'),(86,'POSTER','media\\club\\club6\\videos\\fZk2tBkEEP4GSsra.jpg',NULL,NULL,NULL,NULL),(87,'POSTER','media\\club\\club6\\videos\\umT6ZnAZ8f22sxyB.jpg',NULL,NULL,NULL,NULL),(88,'VIDEO','media/club/club6/videos/umT6ZnAZ8f22sxyB.MP4',NULL,94,'ACTIVE','GOPR4923.MP4'),(89,'POSTER','media\\club\\club6\\videos\\5sG4eT4cFazePaS8.jpg',NULL,NULL,NULL,NULL),(90,'VIDEO','media/club/club6/videos/5sG4eT4cFazePaS8.webm',NULL,95,'ACTIVE','best_moments.webm'),(91,'IMAGE','media\\book ava\\images\\rqZYtgtGQYAJGKyr.jpg',NULL,NULL,'ACTIVE','Zherminal.jpg'),(92,'AUDIO','media/club/club6/audios/amjtPWuUYq78BjC6. Wiz Khalifa) - We Own It.mp3',NULL,96,'ACTIVE','2 Chainz (feat. Wiz Khalifa) - We Own It.mp3'),(93,'AUDIO','media/club/club6/audios/YrKQeyAYVW4QmwMB.mp3',NULL,96,'ACTIVE','Kanye West - Stronger.mp3'),(94,'AUDIO','media/club/club6/audios/sXjzuGXhRmzcwvtm.mp3',NULL,96,'ACTIVE','ACDC  - Back In Black      (OST  Мегамозг).mp3'),(95,'AUDIO','media/club/club6/audios/X7cxFVXfS6dTDpap.mp3',NULL,96,'ACTIVE','ACDC - Highway to Hell.mp3'),(96,'AUDIO','media/club/club6/audios/hgqBFHKBU4hCuUXs.mp3',NULL,96,'ACTIVE','ACDC - Thunderstruck (Shake it).mp3'),(97,'AUDIO','media/club/club6/audios/ERGGsTacAeg9pYDX.mp3',NULL,96,'ACTIVE','DJ Snake x Lil\' Jon - Turn Down For What.mp3'),(98,'POSTER','media/club/club6/videos/VcNtdrfPu6dAyfqW.jpg',NULL,NULL,NULL,NULL),(99,'IMAGE','media/club/club6/images/HgXqYeFCcEAuAC7Y.jpg',NULL,97,'ACTIVE','Chrysanthemum.jpg'),(100,'IMAGE','media/club/club6/images/r3BMz4UqrQ5yj6dc.jpg',NULL,97,'ACTIVE','Desert.jpg'),(101,'IMAGE','media/club/club6/images/D2RJZyrrKdSZUEpQ.jpg',NULL,97,'ACTIVE','Hydrangeas.jpg'),(102,'IMAGE','media/club/club6/images/VYS7Rgg8ZzqyYdX9.jpg',NULL,97,'ACTIVE','Jellyfish.jpg'),(103,'IMAGE','media/club/club6/images/r9XhRCvg57EHj2cv.jpg',NULL,97,'ACTIVE','Koala.jpg'),(104,'IMAGE','media/club/club6/images/3azPEsNyApEbacEx.jpg',NULL,97,'ACTIVE','Lighthouse.jpg'),(105,'IMAGE','media/club/club6/images/fkZzwAzq3RctCcYx.jpg',NULL,97,'ACTIVE','Penguins.jpg'),(106,'VIDEO','media/club/club6/videos/VcNtdrfPu6dAyfqW.MP4',NULL,97,'ACTIVE','GOPR4920.MP4'),(107,'AUDIO','media/club/club6/audios/8U9SJus4BFuxMZEu.mp3',NULL,97,'ACTIVE','ACDC  - Back In Black      (OST  Мегамозг).mp3'),(108,'AUDIO','media/club/club6/audios/Ta4rpppUFVvdR3QB.mp3',NULL,97,'ACTIVE','ACDC - Highway to Hell.mp3'),(109,'IMAGE','media/club/club6/images/QzMZS57wYN6pbWZu.jpg',NULL,98,'ACTIVE','Chrysanthemum.jpg'),(110,'IMAGE','media/club/club6/images/fSjhAB5wXUNbC8ky.jpg',NULL,98,'ACTIVE','Desert.jpg'),(111,'IMAGE','media/club/club6/images/SWgTpHR4XNVFuBch.jpg',NULL,98,'ACTIVE','Hydrangeas.jpg'),(112,'IMAGE','media/club/club6/images/g87ATtvmtjdnsUUB.jpg',NULL,98,'ACTIVE','Jellyfish.jpg'),(113,'IMAGE','media/club/club6/images/gs7qQ7T3ZZj9N7Cv.jpg',NULL,98,'ACTIVE','Koala.jpg'),(114,'IMAGE','media/club/club6/images/Befu5h4mMkxZ58ve.jpg',NULL,98,'ACTIVE','Lighthouse.jpg'),(115,'IMAGE','media/club/club6/images/YR3Cup9qgtX3wtkJ.jpg',NULL,98,'ACTIVE','Penguins.jpg'),(116,'IMAGE','media/club/club6/images/KMrW6TZUjH6MHhwZ.jpg',NULL,99,'ACTIVE','Desert.jpg');
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profession`
--

DROP TABLE IF EXISTS `profession`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profession` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profession`
--

LOCK TABLES `profession` WRITE;
/*!40000 ALTER TABLE `profession` DISABLE KEYS */;
INSERT INTO `profession` VALUES (1,'university student','ACTIVE'),(2,'worker','ACTIVE'),(3,'official','ACTIVE'),(4,'college student','ACTIVE'),(5,'pupil','ACTIVE'),(6,'pensioner','ACTIVE'),(7,'other','ACTIVE');
/*!40000 ALTER TABLE `profession` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report`
--

DROP TABLE IF EXISTS `report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(45) DEFAULT NULL,
  `text` text,
  `name` varchar(45) DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `response` text,
  `admin_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Admin_report_FK_idx` (`admin_id`),
  CONSTRAINT `Admin_report_FK` FOREIGN KEY (`admin_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report`
--

LOCK TABLES `report` WRITE;
/*!40000 ALTER TABLE `report` DISABLE KEYS */;
INSERT INTO `report` VALUES (1,'pylypchak@ukr.net','This is the best site ever!','Олег','2015-07-07 15:17:19','BLOCKED',NULL,NULL);
/*!40000 ALTER TABLE `report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form_id` int(11) DEFAULT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `middle_name` varchar(45) DEFAULT NULL,
  `birth_date` date NOT NULL,
  `nationality` varchar(45) NOT NULL,
  `education` varchar(45) DEFAULT NULL,
  `profession_id` int(11) DEFAULT NULL,
  `edu_institution` varchar(200) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `adress` varchar(200) DEFAULT NULL,
  `join_date` date NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `password` varchar(256) DEFAULT NULL,
  `role` varchar(45) NOT NULL,
  `state` varchar(45) NOT NULL,
  `is_form_active` tinyint(1) DEFAULT NULL,
  `salt` varchar(128) DEFAULT NULL,
  `password_changing_token` varchar(64) DEFAULT NULL,
  `social_id` varchar(45) DEFAULT NULL,
  `ava_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `form_id_UNIQUE` (`form_id`),
  KEY `user_profession_FK_idx` (`profession_id`),
  KEY `user_media_FK_idx` (`ava_id`),
  CONSTRAINT `user_media_FK` FOREIGN KEY (`ava_id`) REFERENCES `media` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `user_profession_FK` FOREIGN KEY (`profession_id`) REFERENCES `profession` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (3,132,'Олег','Пилипчак','Ярославович','1995-06-26','Ukrainian','PRIMARY',1,'ЛНУ ім.І.Франка','123456789012','Okunevskogo 3/246','2015-06-19','pylypchak@ukr.net','d9957ce05427746d1d3f00555a126d62fbcdd044917130ed37f832befd81f396','ADMIN','ACTIVE',1,'uXMThYY8zZvdHa6mvXb6cGsK77eDSn7WyNWZdtbwDPv6kjU58e9R32xJQDyCzcfsdnucTFdsyUsDKkubRxTkQYsGTcjKVjkNdYdEBsSEy6B5Fsy9z4Fm8U2ddheFc8n8',NULL,NULL,57),(4,134,'Сергій','Лисенко','Вікторович','1970-01-01','Ukrainian','BACHELOR',1,'НУ \"ЛП\"','123456789012','sdfsdfsdf','2015-06-24','airfast.sup@gmail.com','a7b7972b371d5e74618693627e6434774a086f23cea1d6fc94ffaa20d04e51cf','USER','ACTIVE',1,'R3ZGDFDpawSxXnAMWys2Mc8P2vTJJhYDNSuWyDJAWg9J3UdKXr7UbH9HSjnKwFmtkYpj6ASgxTe6uv9YtUQF45bBV6MkfqJwv5qM4Vv7E9gGJae4krj5NPzFJWPDsqWj',NULL,NULL,57),(7,123,'Олег','Пилипчак','Ярославович','1995-05-26','Ukrainian','PRIMARY',1,'ЛНУ ім. І. Франка','380957182035',' вул. Окуневського 3, кв 246','2015-06-29','pylypchak@ukr.netdd',NULL,'USER','ACTIVE',1,NULL,NULL,'vk23034197',57),(9,133,'Oleh','Pylypchak','Jaroslavovych','1995-05-26','Ukrainian','PRIMARY',1,'ЛНУ ім. І. Франка','380986645628','Okunevskogo 3/246','2015-06-30','pylypchak@ukr.netsf',NULL,'USER','ACTIVE',1,NULL,NULL,'fb811273195636108',62),(10,NULL,'Лідія','Шигимага','Миколаївна','1989-04-05','Українка','MASTER',3,'НУ \"ЛП\"','380986645628','sdfsd fds','2015-07-07','lidashygymaga@gmail.com','f5db835ef820300a47a3c52730692ac27552646a5f0ed591f589abf0aae52823','USER','ACTIVE',1,'n8xddQUZR7DBXfkXBvsZT2bBK4j5ZJUp53D4trW76Cqb5QkA9BNzNG7dTy9XRqjwZsZ8GJVbFqBHGaPnZqvP2SWgNESYSgScrxRapPPjDJMkZx5Adc2tvkW5buRR6Nbv',NULL,NULL,57);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'mediateka'
--
/*!50003 DROP PROCEDURE IF EXISTS `getActivity` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getActivity`(IN userId INT, IN period VARCHAR(45), IN typeIN VARCHAR(45))
BEGIN
 DECLARE  varPeriod DATE;
 IF (period='week') THEN 
	SET varPeriod = DATE_SUB(NOW(), INTERVAL 7 DAY);
ELSEIF (period='month') THEN 
	SET varPeriod = DATE_SUB(NOW(), INTERVAL 30 DAY);
END IF;
SELECT * FROM form_record WHERE (user_id = userId)
		AND ((period !='allTime' AND date_from >= varPeriod )
				OR(period='allTime'))
        AND ((typeIn='books' AND book_id IS NOT NULL)
				OR(typeIn ='events'AND event_id IS NOT NULL)
				OR(typeIn ='other'AND goal IS NOT NULL)
				OR(typeIN='anyType'))
		AND state='ACTIVE';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getBooksByParameters` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getBooksByParameters`(IN regexpIn VARCHAR(45), IN typeIdIn INT, IN meaningIdIn INT, IN languageIdIn INT, IN orderIn VARCHAR(40), IN offsetIn INT, IN limitIn INT)
BEGIN
IF (orderIn='name') THEN
SELECT * FROM book WHERE  state!= 'DELETED' 
		AND  (regexpIn='' OR(`name` REGEXP regexpIn OR author REGEXP regexpIn))
			 AND(typeIdIn IS NULL OR typeIdIn=type_id)
             AND(meaningIdIn IS NULL OR meaningIdIn=meaning_id)
			AND(languageIdIn IS NULL OR languageIdIn=language_id) ORDER BY name LIMIT offsetIn, limitIN;
ELSEIF (orderIn='author')  THEN
SELECT * FROM book WHERE  state!= 'DELETED' 
		AND  (regexpIn='' OR(`name` REGEXP regexpIn OR author REGEXP regexpIn))
			 AND(typeIdIn IS NULL OR typeIdIn=type_id)
             AND(meaningIdIn IS NULL OR meaningIdIn=meaning_id)
			AND(languageIdIn IS NULL OR languageIdIn=language_id) ORDER BY author LIMIT offsetIn, limitIN;
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getBooksByRegexp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getBooksByRegexp`(IN regexpIn VARCHAR(100))
BEGIN
SELECT * FROM book WHERE  state!= 'DELETED' 
		AND  (regexpIn='' OR(`name` REGEXP regexpIn OR author REGEXP regexpIn));
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getBooksStatistics` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getBooksStatistics`(IN date_from_param TIMESTAMP, IN date_till_param TIMESTAMP)
BEGIN

( -- total
SELECT "total" as "group", "total" as "name", count(*) as "count"
FROM form_record
WHERE 
 DATE(form_record.date_from) >= date_from_param 
 AND
 DATE(form_record.date_from) <= date_till_param
 AND
 form_record.book_id IS NOT NULL
)

UNION

( -- by meaning
SELECT "meaning" as "group", book_meaning.name, IFNULL(tbl2.count, 0) as "count"
FROM 
 book_meaning

 LEFT OUTER JOIN

 (SELECT book.meaning_id, count(*) as "count"
 FROM form_record, book
 WHERE 
  DATE(form_record.date_from) >= date_from_param 
  AND
  DATE(form_record.date_from) <= date_till_param
  AND
  form_record.book_id IS NOT NULL
  AND
  form_record.state = "ACTIVE"
  AND
  form_record.book_id = book.id
 GROUP BY book.meaning_id
 ) as tbl2

 ON book_meaning.id = tbl2.meaning_id
)

UNION

( -- by type
SELECT "type" as "group", book_type.name , IFNULL(tbl2.count, 0) as "count"
FROM 
 book_type

 LEFT OUTER JOIN

 (SELECT book.type_id, count(*) as "count"
 FROM form_record, book
 WHERE 
  DATE(form_record.date_from) >= date_from_param 
  AND
  DATE(form_record.date_from) <= date_till_param
  AND
  form_record.book_id IS NOT NULL
  AND
  form_record.state = "ACTIVE"
  AND
  form_record.book_id = book.id
 GROUP BY book.type_id
 ) as tbl2

 ON book_type.id = tbl2.type_id
)


UNION

( -- by language
SELECT "language" as "group", book_language.name, IFNULL(tbl2.count, 0) as "count"
FROM 
 book_language

 LEFT OUTER JOIN

 (SELECT book.language_id, count(*) as "count"
 FROM form_record, book
 WHERE 
  DATE(form_record.date_from) >= date_from_param 
  AND
  DATE(form_record.date_from) <= date_till_param
  AND
  form_record.book_id IS NOT NULL
  AND
  form_record.state = "ACTIVE"
  AND
  form_record.book_id = book.id
 GROUP BY book.language_id
 ) as tbl2

 ON book_language.id = tbl2.language_id
);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getEventsByDate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getEventsByDate`(IN date_in TIMESTAMP)
BEGIN
SELECT * FROM event 
	WHERE YEAR(date_from)<=YEAR(date_in) 
			AND MONTH(date_from)<=MONTH(date_in)
			AND DAY(date_from)<=DAY(date_in)
			AND YEAR(date_till)>=YEAR(date_in)
			AND MONTH(date_till)>=MONTH(date_in)
			AND DAY(date_till)>=DAY(date_in);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetFormRecordsByDateRange` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetFormRecordsByDateRange`(IN dateFrom TIMESTAMP, IN dateTill TIMESTAMP)
BEGIN
	SELECT * FROM form_record 
		WHERE  ( YEAR(dateFrom)<YEAR(date_from) 
                OR (YEAR(dateFrom)=YEAR(date_from) 
					AND MONTH(dateFrom)<MONTH(date_from)) 
				OR (YEAR(dateFrom)=YEAR(date_from) 
					AND MONTH(dateFrom)=MONTH(date_from) 
					AND DAY(dateFrom)<=DAY(date_from)) )
           AND( YEAR(dateTill)>YEAR(date_from) 
				OR (YEAR(dateTill)=YEAR(date_from) 
					AND MONTH(dateTill)>MONTH(date_from)) 
				OR (YEAR(dateTill)=YEAR(date_from) 
					AND MONTH(dateTill)=MONTH(date_from) 
					AND DAY(dateTill)>=DAY(date_from))) ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getFormRecordsByUserIdAndDateRange` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getFormRecordsByUserIdAndDateRange`(IN userId INT, IN dateFrom TIMESTAMP, IN dateTill TIMESTAMP)
BEGIN
SELECT * FROM form_record 
		WHERE user_id = userId
			AND( YEAR(dateFrom)<YEAR(date_from) 
                OR (YEAR(dateFrom)=YEAR(date_from) 
					AND MONTH(dateFrom)<MONTH(date_from)) 
				OR (YEAR(dateFrom)=YEAR(date_from) 
					AND MONTH(dateFrom)=MONTH(date_from) 
					AND DAY(dateFrom)<=DAY(date_from)) )
           AND( YEAR(dateTill)>YEAR(date_from) 
				OR (YEAR(dateTill)=YEAR(date_from) 
					AND MONTH(dateTill)>MONTH(date_from)) 
				OR (YEAR(dateTill)=YEAR(date_from) 
					AND MONTH(dateTill)=MONTH(date_from) 
					AND DAY(dateTill)>=DAY(date_from))) ;
			
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getUsersByOneRegexp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getUsersByOneRegexp`(IN regexpIn VARCHAR(45), IN offsetIn INT, IN limitIn INT)
BEGIN
SELECT * FROM user 
	WHERE ( first_name REGEXP regexpIn 
		OR last_name REGEXP regexpIn
		OR middle_name REGEXP regexpIn) 
		AND (state != 'DELETED') LIMIT offsetIn, limitIn;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getUsersByThreeRegexp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getUsersByThreeRegexp`(IN firstRegexp VARCHAR(45), IN secondRegexp VARCHAR(45), IN thirdRegexp VARCHAR(45), IN offsetIn INT, IN limitIn INT)
BEGIN
SELECT * FROM user
	WHERE ( first_name REGEXP firstRegexp AND last_name REGEXP secondRegexp AND middle_name REGEXP thirdRegexp
		OR first_name REGEXP firstRegexp AND middle_name REGEXP secondRegexp AND last_name REGEXP thirdRegexp
		OR first_name REGEXP secondRegexp AND last_name REGEXP firstRegexp AND middle_name REGEXP thirdRegexp
		OR first_name REGEXP secondRegexp AND middle_name REGEXP firstRegexp AND last_name REGEXP thirdRegexp
		OR last_name REGEXP firstRegexp AND middle_name REGEXP secondRegexp AND first_name REGEXP thirdRegexp
		OR last_name REGEXP secondRegexp AND middle_name REGEXP firstRegexp AND first_name REGEXP thirdRegexp)
        AND (state != 'DELETED')  LIMIT offsetIn, limitIn;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getUsersByTwoRegexp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getUsersByTwoRegexp`(IN firstRegexp VARCHAR(45), IN secondRegexp VARCHAR(45), IN offsetIn INT, IN limitIn INT)
BEGIN
SELECT * FROM user
	WHERE (first_name REGEXP firstRegexp AND last_name REGEXP secondRegexp
		OR first_name REGEXP firstRegexp AND middle_name REGEXP secondRegexp
		OR first_name REGEXP secondRegexp AND last_name REGEXP firstRegexp
		OR first_name REGEXP secondRegexp AND middle_name REGEXP firstRegexp
		OR last_name REGEXP firstRegexp AND middle_name REGEXP secondRegexp
		OR last_name REGEXP secondRegexp AND middle_name REGEXP firstRegexp)
        AND (state != 'DELETED')  LIMIT offsetIn, limitIn;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getUserStatistics` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getUserStatistics`(IN date_from_param DATE, IN date_till_param DATE)
BEGIN
### total

select 'total' as 'category', 'total' as 'subcategory', count(*) as 'amount' from 

	(select * from form_record
	where 
		DATE(date_from) >= date_from_param
		and
		DATE(date_from) <= date_till_param
		and
		state = 'ACTIVE' 
	group by
		user_id, date_from) as tmp1

union 

##those who registered today
select 'by_forms' as 'category', 'by_forms' as 'subcategory', count(*) as 'amount'
from
	(select form_record.*
	from
		form_record, user
	where
		DATE(form_record.date_from) >= date_from_param
		and
		DATE(form_record.date_from) <= date_till_param
		and
		form_record.state = 'ACTIVE' 
		and
		form_record.user_id = user.id
		and
		DATE(form_record.date_from) = user.join_date
	group by
		form_record.user_id, form_record.date_from) as tmp1

union 

### by profession
select 'by_profession' as 'category', profession_name as 'subcategory', sum(counter) as 'amount'
from
	(
	select tmp1.id IS NOT NULL as 'counter', profession.name as 'profession_name' from 
			(select form_record.id, user.profession_id
			from
				form_record, user 
			where
				DATE(form_record.date_from) >= date_from_param
				and
				DATE(form_record.date_from) <= date_till_param
				and
				form_record.state = 'ACTIVE' 
				and
				form_record.user_id = user.id
			group by
				form_record.user_id, form_record.date_from) as tmp1
		right outer join
			profession
		on profession.id = tmp1.profession_id
	) as tmp2

group by tmp2.profession_name


union

### by age

select 
	'by_age' as 'category',
	CASE
		WHEN tmp1.age < 15 THEN '<15'
		WHEN tmp1.age >=15 AND tmp1.age <=17 THEN '15-17'
		WHEN tmp1.age >=18 AND tmp1.age <=21 THEN '18-21'
		ELSE '22+' end as 'subcategory',
	count(*) as 'amount'

from
	(select 
		form_record.id as 'form_record_id', 
		YEAR(form_record.date_from) - YEAR(user.birth_date) - (DATE_FORMAT(form_record.date_from, '%m%d') < DATE_FORMAT(user.birth_date, '%m%d')) as 'age'
	from
		form_record, user 
	where
		DATE(form_record.date_from) >= date_from_param
		and
		DATE(form_record.date_from) <= date_till_param
		and
		form_record.state = 'ACTIVE' 
		and
		form_record.user_id = user.id
	group by 
		user.id, form_record.date_from
	) as tmp1

group by subcategory
;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertClub` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertClub`(IN nameIn VARCHAR(100), IN descriptionIN TEXT, IN avaIdIn INT, IN stateIn VARCHAR(45))
BEGIN
DECLARE exit handler for sqlexception
  BEGIN
    -- ERROR
  ROLLBACK;
END;
START TRANSACTION;

INSERT INTO `mediateka`.`club`
(`name`,
`description`,
`ava_id`,
`state`)
VALUES
(nameIn,
descriptionIn,
avaIdIn,
stateIn);

SELECT * FROM club WHERE id=(SELECT max(id) FROM club);

COMMIT;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertContentGroup` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertContentGroup`(IN typeIn VARCHAR(45),IN nameIn VARCHAR(100),IN creatorIdIn INT, IN creationDateIn TIMESTAMP, IN textIn TEXT, IN eventIdIn INT, IN clubIdIN INT, IN stateIn VARCHAR(45), IN likeIn INT, IN dislikeIn INT, IN parentIdIn INT )
BEGIN

DECLARE exit handler for sqlexception
  BEGIN
    -- ERROR
  ROLLBACK;
END;
START TRANSACTION;

INSERT INTO `mediateka`.`content_group`
(`type`,
`name`,
`creator_id`,
`creation_date`,
`text`,
`event_id`,
`club_id`,
`state`,
`like`,
`dislike`,
`parent_id`)
VALUES
(typeIn,
nameIn,
creatorIdIn,
creationDateIn,
textIn,
eventIdIn,
clubIdIn,
stateIn,
likeIn,
dislikeIn,
parentIdIn);

SELECT * FROM content_group WHERE id=(SELECT max(id) FROM content_group);

COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertEvent` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertEvent`(IN typeIn VARCHAR(45), IN nameIn VARCHAR(250), IN dateFromIn TIMESTAMP, IN dateTillIn TIMESTAMP, IN clubIdIn INT, IN stateIn VARCHAR(45), IN descriptionIn  VARCHAR(255), IN avaIdIn INT)
BEGIN
DECLARE exit handler for sqlexception
  BEGIN
    -- ERROR
  ROLLBACK;
END;
START TRANSACTION;
INSERT INTO `mediateka`.`event`
(`type`,
`name`,
`date_from`,
`date_till`,
`club_id`,
`state`,
`description`,
`ava_id`)
VALUES
(typeIn,
  nameIn,
  dateFromIn,
 dateTillIn,
  clubIdIn,
 stateIn,
 descriptionIn,
 avaIdIn);

SELECT * FROM event WHERE id=(SELECT max(id) FROM event);

COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertMedia` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertMedia`(IN nameIn VARCHAR(100), IN typeIn VARCHAR(45) ,IN pathIn VARCHAR(255), IN descriptionIn VARCHAR(250), IN contentGroupIdIn INT, IN stateIn VARCHAR(45))
BEGIN
DECLARE exit handler for sqlexception
  BEGIN
    -- ERROR
  ROLLBACK;
END;
START TRANSACTION;
INSERT INTO `mediateka`.`media`
(`type`,
`path`,
`description`,
`content_group_id`,
`state`,
`name`)
VALUES
( typeIn,
 pathIn,
  descriptionIn,
   contentGroupIdIn,
    stateIn,
nameIn);

SELECT * FROM media WHERE id = (SELECT max(id) FROM media);
COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-07-12 15:14:28
