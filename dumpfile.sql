/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.5.2-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: board
-- ------------------------------------------------------
-- Server version	11.5.2-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `author`
--

DROP TABLE IF EXISTS `author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `author` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_time` datetime DEFAULT current_timestamp(),
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author`
--

LOCK TABLES `author` WRITE;
/*!40000 ALTER TABLE `author` DISABLE KEYS */;
INSERT INTO `author` VALUES
(1,'dudwodpdy@gmail.com','최영재','2024-11-22 10:23:02','1234'),
(2,'wnsgurdldi@cyworld.com','정준환','2024-11-22 10:24:25','2345'),
(3,'hungry@naver.com','이준석','2024-11-22 10:24:26','3456'),
(4,'sd@ffks.com','최영일','2024-11-22 11:00:24','4567'),
(5,'hans1@naver.com','hans','2024-11-22 11:26:35',NULL),
(6,'hans2@naver.com','hansi','2024-11-22 11:26:35',NULL),
(7,'hans3@naver.com','hansu','2024-11-22 11:26:35',NULL),
(8,'july1@naver.com','july','2024-11-22 11:26:35',NULL),
(9,'july2@naver.com','jully','2024-11-22 11:26:35',NULL);
/*!40000 ALTER TABLE `author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `author_address`
--

DROP TABLE IF EXISTS `author_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `author_address` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `author_id` bigint(20) NOT NULL,
  `country` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `created_time` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `author_id` (`author_id`),
  CONSTRAINT `author_address_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `author` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author_address`
--

LOCK TABLES `author_address` WRITE;
/*!40000 ALTER TABLE `author_address` DISABLE KEYS */;
INSERT INTO `author_address` VALUES
(1,1,'몽골','초원','마굿간','2024-11-22 10:32:07'),
(2,2,'미국','뉴욕','개비싼데','2024-11-22 10:41:19'),
(3,3,'북한','원산','전진초소6','2024-11-22 10:42:10'),
(4,4,'배고프다','뭐먹지','뭐먹을까나','2024-11-22 11:00:51');
/*!40000 ALTER TABLE `author_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `author_post`
--

DROP TABLE IF EXISTS `author_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `author_post` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `author_id` bigint(20) NOT NULL,
  `post_id` bigint(20) NOT NULL,
  `created_time` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `author_id` (`author_id`),
  KEY `post_id` (`post_id`),
  CONSTRAINT `author_post_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `author` (`id`),
  CONSTRAINT `author_post_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author_post`
--

LOCK TABLES `author_post` WRITE;
/*!40000 ALTER TABLE `author_post` DISABLE KEYS */;
INSERT INTO `author_post` VALUES
(1,1,1,'2024-11-22 10:28:48'),
(2,3,2,'2024-11-22 10:38:22'),
(3,5,1,'2024-11-22 11:30:48'),
(4,4,2,'2024-11-22 11:30:50'),
(5,5,2,'2024-11-22 11:30:52'),
(6,2,1,'2024-11-22 11:35:18');
/*!40000 ALTER TABLE `author_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `author_post2`
--

DROP TABLE IF EXISTS `author_post2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `author_post2` (
  `author_id` bigint(20) NOT NULL,
  `post_id` bigint(20) NOT NULL,
  PRIMARY KEY (`author_id`,`post_id`),
  KEY `post_id` (`post_id`),
  CONSTRAINT `author_post2_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `author` (`id`),
  CONSTRAINT `author_post2_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author_post2`
--

LOCK TABLES `author_post2` WRITE;
/*!40000 ALTER TABLE `author_post2` DISABLE KEYS */;
/*!40000 ALTER TABLE `author_post2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `contents` varchar(255) DEFAULT NULL,
  `created_time` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES
(1,'오늘점심은 뭘먹지','정말 궁금하군요','2024-11-22 10:25:54'),
(2,'hello java','작작어려워라진짜','2024-11-22 10:37:54'),
(3,'hello,python','hi,we are python!','2024-11-22 11:27:03'),
(4,'hello,java','hi,i`m java!','2024-11-22 11:27:06');
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2024-11-25 10:04:45
