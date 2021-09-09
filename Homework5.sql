DROP DATABASE IF EXISTS vk;
CREATE DATABASE vk;
USE vk;
-- MariaDB dump 10.17  Distrib 10.4.15-MariaDB, for Linux (x86_64)
--
-- Host: mysql.hostinger.ro    Database: u574849695_25
-- ------------------------------------------------------
-- Server version	10.4.15-MariaDB-cll-lve

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `communities`
--

DROP TABLE IF EXISTS `communities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `communities` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_user_id` bigint(20) unsigned NOT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `communities_name_idx` (`name`),
  KEY `admin_user_id` (`admin_user_id`),
  CONSTRAINT `communities_ibfk_1` FOREIGN KEY (`admin_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `communities`
--

LOCK TABLES `communities` WRITE;
/*!40000 ALTER TABLE `communities` DISABLE KEYS */;
INSERT INTO `communities` VALUES (1,'dolores',12),(2,'distinctio',13),(3,'accusantium',14),(4,'voluptates',15),(5,'eum',16),(6,'itaque',17),(7,'blanditiis',19),(8,'autem',20),(9,'cumque',21),(10,'autem',22);
/*!40000 ALTER TABLE `communities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friend_requests`
--

DROP TABLE IF EXISTS `friend_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `friend_requests` (
  `initiator_user_id` bigint(20) unsigned NOT NULL,
  `target_user_id` bigint(20) unsigned NOT NULL,
  `status` enum('requested','approved','declined','unfriended') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `requested_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`initiator_user_id`,`target_user_id`),
  KEY `target_user_id` (`target_user_id`),
  CONSTRAINT `friend_requests_ibfk_1` FOREIGN KEY (`initiator_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `friend_requests_ibfk_2` FOREIGN KEY (`target_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friend_requests`
--

LOCK TABLES `friend_requests` WRITE;
/*!40000 ALTER TABLE `friend_requests` DISABLE KEYS */;
INSERT INTO `friend_requests` VALUES (12,12,'approved','1974-06-30 05:44:02','1989-07-19 16:32:45'),(13,13,'requested','1981-06-03 07:36:46','2011-02-15 20:42:48'),(14,14,'unfriended','2007-04-27 00:58:03','1988-09-19 01:35:42'),(15,15,'unfriended','1994-02-28 22:08:35','2019-05-17 20:24:26'),(16,16,'unfriended','1981-08-15 20:30:47','1972-07-01 06:58:23'),(17,17,'approved','1975-07-13 03:06:53','1973-05-24 21:48:55'),(19,19,'declined','2019-10-07 08:33:51','1990-09-06 01:04:04'),(20,20,'declined','2017-10-23 14:40:00','1970-12-04 15:22:28'),(21,21,'approved','1986-06-06 20:16:14','1999-06-20 00:50:26'),(22,22,'requested','2007-01-12 21:42:31','2000-12-08 09:01:07');
/*!40000 ALTER TABLE `friend_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `likes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `media_id` bigint(20) unsigned NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  UNIQUE KEY `id` (`id`),
  KEY `likes_fk` (`media_id`),
  KEY `likes_fk_1` (`user_id`),
  CONSTRAINT `likes_fk` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`),
  CONSTRAINT `likes_fk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES (1,12,1,'2001-01-30 06:57:09'),(2,13,2,'1987-03-27 11:03:07'),(3,14,3,'1994-03-09 08:02:04'),(4,15,4,'1996-10-01 20:34:43'),(5,16,5,'1984-02-18 03:18:44'),(6,17,6,'1993-10-06 12:13:10'),(7,19,7,'1982-10-24 18:33:24'),(8,20,8,'2018-02-12 14:03:23'),(9,21,9,'2005-03-05 13:44:54'),(10,22,10,'1998-07-20 03:41:57'),(11,12,1,'2017-11-10 20:08:03'),(12,13,2,'2010-08-20 21:29:02'),(13,14,3,'2011-07-23 15:32:34'),(14,15,4,'1996-11-29 11:22:22'),(15,16,5,'2013-08-23 02:22:29'),(16,17,6,'2010-01-19 07:40:15'),(17,19,7,'1997-06-19 11:20:04'),(18,20,8,'2021-06-22 09:46:30'),(19,21,9,'1989-06-11 19:19:24'),(20,22,10,'2005-01-08 17:32:25'),(21,12,1,'1989-02-04 21:46:48'),(22,13,2,'2002-08-06 00:58:29'),(23,14,3,'2014-12-21 06:33:41'),(24,15,4,'2004-12-26 17:35:14'),(25,16,5,'2015-10-13 16:16:36'),(26,17,6,'2005-03-03 10:35:08'),(27,19,7,'1995-07-29 13:35:39'),(28,20,8,'2005-05-28 00:59:58'),(29,21,9,'1978-01-06 17:01:12'),(30,22,10,'2002-09-11 07:06:43'),(31,12,1,'2006-10-15 08:24:48'),(32,13,2,'1985-03-12 13:52:44'),(33,14,3,'1995-04-27 06:51:50'),(34,15,4,'2019-10-16 10:52:49'),(35,16,5,'2013-09-20 22:36:07'),(36,17,6,'1997-06-14 06:32:42'),(37,19,7,'2017-03-06 15:58:26'),(38,20,8,'1984-12-23 09:53:42'),(39,21,9,'1981-12-12 01:25:51'),(40,22,10,'2017-08-08 22:59:40'),(41,12,1,'2014-12-06 19:24:00'),(42,13,2,'2010-12-13 19:44:25'),(43,14,3,'2008-05-24 05:59:59'),(44,15,4,'2020-02-02 09:01:11'),(45,16,5,'1996-02-26 16:25:38'),(46,17,6,'1982-06-11 06:23:46'),(47,19,7,'1998-12-04 09:55:04'),(48,20,8,'2006-10-30 06:36:07'),(49,21,9,'1981-11-11 06:47:15'),(50,22,10,'1987-09-22 05:09:16'),(51,12,1,'2012-10-08 13:15:22'),(52,13,2,'2007-11-22 06:46:03'),(53,14,3,'1972-03-06 14:19:46'),(54,15,4,'1993-03-20 13:04:52'),(55,16,5,'2003-01-29 12:59:56'),(56,17,6,'1991-05-05 21:28:43'),(57,19,7,'1993-09-11 14:00:40'),(58,20,8,'1999-05-30 01:28:27'),(59,21,9,'2000-10-28 18:06:24'),(60,22,10,'2017-02-28 22:13:38'),(61,12,1,'2018-12-24 23:23:40'),(62,13,2,'1987-07-13 11:49:38'),(63,14,3,'2008-10-17 22:49:24'),(64,15,4,'1998-02-26 03:56:17'),(65,16,5,'2000-05-07 21:28:40'),(66,17,6,'2009-04-16 09:20:25'),(67,19,7,'2013-04-06 13:53:47'),(68,20,8,'1973-12-23 22:05:45'),(69,21,9,'2013-04-12 13:09:26'),(70,22,10,'1992-06-29 17:40:29'),(71,12,1,'2007-06-04 12:11:48'),(72,13,2,'1971-07-23 14:36:17'),(73,14,3,'2020-02-14 21:32:09'),(74,15,4,'1971-09-03 03:20:05'),(75,16,5,'1984-03-20 19:32:28'),(76,17,6,'1989-12-29 19:32:35'),(77,19,7,'2005-01-31 02:07:54'),(78,20,8,'1985-12-08 14:42:02'),(79,21,9,'1989-01-14 22:47:24'),(80,22,10,'1999-01-19 19:50:34'),(81,12,1,'1978-02-13 01:45:03'),(82,13,2,'2006-03-19 22:20:14'),(83,14,3,'2003-12-08 09:11:39'),(84,15,4,'1986-10-15 21:58:37'),(85,16,5,'1983-12-30 19:06:49'),(86,17,6,'1970-03-26 20:23:59'),(87,19,7,'2006-08-23 17:43:09'),(88,20,8,'1979-06-04 18:54:27'),(89,21,9,'2016-03-10 04:29:12'),(90,22,10,'1974-08-01 21:18:55'),(91,12,1,'1999-05-07 11:52:06'),(92,13,2,'1995-08-05 17:27:24'),(93,14,3,'1981-02-05 22:39:56'),(94,15,4,'2004-10-14 07:35:07'),(95,16,5,'2003-11-11 13:03:34'),(96,17,6,'2000-05-02 03:23:57'),(97,19,7,'1973-12-29 22:17:44'),(98,20,8,'2011-09-17 13:20:40'),(99,21,9,'2007-08-19 19:10:49'),(100,22,10,'1993-11-14 12:00:30');
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `media_type_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`metadata`)),
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  KEY `media_type_id` (`media_type_id`),
  CONSTRAINT `media_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `media_ibfk_2` FOREIGN KEY (`media_type_id`) REFERENCES `media_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES (1,1,12,'Qui tempore occaecati ut quia. Officia dolores dolores enim natus cupiditate est. Corporis officia dicta dicta.','ut',2043,'4','1995-04-08 09:03:14','1977-06-28 04:24:21'),(2,2,13,'Quaerat odit nisi sit illum a qui maxime dicta. Ut laborum deleniti fugit quibusdam quam dolore pariatur. Ab fugiat omnis soluta sit quisquam. Dignissimos tempora repudiandae sed quas quam.','mollitia',12,'2','2013-12-18 04:24:44','2005-10-25 03:26:06'),(3,3,14,'Ut tempore quis repellat quia amet ipsam amet beatae. Non consequatur aut aut deleniti quas. Et eum voluptate consequuntur earum.','sapiente',1190,'8','2013-04-05 16:05:07','1994-11-15 07:07:31'),(4,4,15,'Perspiciatis vel nam ea voluptates deleniti. Doloremque non velit eum veniam vero iste non non. Dolor omnis eum quisquam ad. Ut tempore sed quisquam similique aut in quis est.','ea',334758375,'9','1986-12-13 07:25:49','1980-04-22 21:10:56'),(5,5,16,'Sit architecto porro rerum rem magni optio. Perferendis qui suscipit aut dolore ipsa vel aut. Quo in culpa non. Blanditiis possimus minima dolorem nihil quis.','exercitationem',409,'5','1978-03-04 22:17:47','1980-11-27 12:42:42'),(6,6,17,'Laudantium quis rerum reiciendis distinctio. Dolore voluptates quam sit ut. Qui ex unde nesciunt beatae corrupti. Dolores nisi pariatur excepturi.','quaerat',7716,'5','1983-07-20 08:44:12','2012-06-24 23:12:34'),(7,7,19,'Quam quidem quos perspiciatis voluptatem. Asperiores rerum illum impedit qui. Perferendis minima minus ut velit delectus deleniti quod iste. Minima laboriosam molestiae fugiat laboriosam quisquam.','aut',216605023,'9','2018-05-20 14:33:48','1983-01-04 18:36:57'),(8,8,20,'Quibusdam ducimus et ut. Recusandae fugiat nobis sint vero qui. Corrupti suscipit placeat omnis est aliquam perferendis omnis repellat. Recusandae eveniet omnis laudantium itaque modi qui.','in',98,'6','1979-11-26 23:25:32','1972-09-25 01:10:11'),(9,9,21,'Placeat dolore vel quia repellendus corporis vel fugiat. Veniam ea quam reiciendis et et fugit. Ut non voluptas praesentium facere laboriosam cupiditate consequatur.','exercitationem',7238429,'4','2003-10-11 13:44:16','1987-11-23 20:08:30'),(10,10,22,'A nisi numquam odit nulla exercitationem fugiat. Esse autem in voluptas. Sint sunt quasi rerum recusandae.','aut',0,'1','2014-12-28 08:57:42','1983-07-27 01:45:03');
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_types`
--

DROP TABLE IF EXISTS `media_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_types`
--

LOCK TABLES `media_types` WRITE;
/*!40000 ALTER TABLE `media_types` DISABLE KEYS */;
INSERT INTO `media_types` VALUES (1,'et','2005-08-09 16:58:36','2002-06-11 04:46:55'),(2,'qui','1994-03-14 19:05:35','2000-03-11 07:27:59'),(3,'ea','2005-08-06 02:37:34','2002-08-02 20:39:26'),(4,'et','1977-04-16 07:05:56','1986-10-13 04:37:51'),(5,'odit','2001-02-13 00:50:07','2007-12-22 22:49:09'),(6,'est','2013-03-30 08:21:26','1993-01-28 15:46:25'),(7,'doloribus','1997-08-07 15:43:51','2012-11-10 10:05:29'),(8,'asperiores','1978-08-26 18:43:56','1976-03-09 10:50:33'),(9,'illum','2001-05-07 10:40:47','2011-02-17 08:40:21'),(10,'temporibus','1995-07-21 04:20:42','2020-10-24 22:57:34');
/*!40000 ALTER TABLE `media_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `from_user_id` bigint(20) unsigned NOT NULL,
  `to_user_id` bigint(20) unsigned NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  UNIQUE KEY `id` (`id`),
  KEY `from_user_id` (`from_user_id`),
  KEY `to_user_id` (`to_user_id`),
  CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`from_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`to_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,12,12,'Explicabo voluptatibus quod libero quo dolor ipsam delectus. Explicabo non tenetur libero velit adipisci. Voluptatem vitae ea sit totam perferendis nulla sed maxime.','2017-07-03 12:59:54'),(2,13,13,'Ut qui voluptatem aut. Facilis et aut ut est sed sed quos sed. Eum ut voluptate delectus.','1987-01-16 09:58:03'),(3,14,14,'Repudiandae laboriosam ratione ab exercitationem quos aut enim. Ullam ipsum earum magni blanditiis. Laudantium doloremque ut a saepe ipsa sint omnis.','1995-08-18 23:51:12'),(4,15,15,'Qui odit dolorum sit reiciendis voluptates. Reiciendis sequi aut ut deserunt. Ullam assumenda voluptatibus mollitia odio nihil aut voluptas. Ipsa asperiores incidunt et facilis voluptatem et qui impedit. Aut non sed ut voluptatibus quo mollitia aliquam.','2008-11-05 11:59:32'),(5,16,16,'Tenetur dolor voluptas nihil sit. Dicta quaerat explicabo sed saepe et commodi. Reiciendis sint alias ut voluptatem aut.','2006-10-08 21:12:40'),(6,17,17,'Nam quam hic autem possimus voluptatibus et. Aut accusamus porro alias accusantium. Commodi aperiam consequuntur repudiandae modi consequuntur. Ab ea sed sint error eos harum. Et sit eveniet eaque quia.','2015-02-16 23:32:00'),(7,19,19,'Iste velit eligendi enim porro quo. Impedit totam voluptatem libero id neque dolorem. Id inventore rerum dolore occaecati atque consectetur ut.','1979-07-30 11:15:39'),(8,20,20,'Impedit aut tempora quia doloribus tenetur qui consequatur. Omnis earum doloremque necessitatibus harum laborum magni. Eligendi autem natus ab. Quaerat temporibus placeat rerum eum.','2015-10-24 04:04:11'),(9,21,21,'Vel veritatis sunt delectus qui ex ut illo. Dicta earum voluptatem maiores. Odit distinctio facilis distinctio.','1990-03-29 22:40:03'),(10,22,22,'Sint nemo voluptatum sint voluptate voluptatem. Cum est perferendis voluptatibus nobis. Recusandae veritatis dicta magnam iste ipsum.','2010-06-12 00:28:37'),(11,12,12,'Corrupti similique aut repellendus dolor quae. Voluptas eos ipsam rem vitae culpa. Facere quo ea quia reiciendis consequatur ut facilis. Tenetur repudiandae quidem iusto provident. Quisquam veritatis illo et corrupti.','2010-09-28 09:33:10'),(12,13,13,'Consectetur et architecto temporibus quis cumque. Earum iste repellendus sit voluptas. Est voluptatum incidunt nam ad culpa.','1973-09-07 12:15:31'),(13,14,14,'Corporis sed vel dolor doloribus. Laudantium temporibus debitis enim provident sed nihil velit. Consequuntur quis ut et ut ea fuga provident.','1982-11-26 15:29:43'),(14,15,15,'A corrupti sit ut commodi sapiente omnis. Nam sint nihil dolores nihil ab molestiae itaque tempora. Sit distinctio dolorum natus totam eligendi sed numquam dolores. Corrupti iure velit quibusdam.','1981-04-10 03:45:28'),(15,16,16,'Quasi voluptatem veritatis dolores quibusdam dolores veniam. Quo eos qui in necessitatibus officia. Eligendi consectetur enim necessitatibus laboriosam.','2014-03-24 18:24:28'),(16,17,17,'Aliquam et facilis enim enim ratione iusto quas ut. Omnis sit quasi dolorum sed asperiores voluptatem eveniet quis. Et maxime aliquid eos dolores voluptatibus.','2006-05-27 18:53:36'),(17,19,19,'Hic ratione accusamus nisi debitis. Fugit officia sed a. Architecto accusantium autem voluptatem eius quae magni. Nulla commodi et est blanditiis et laudantium rerum.','1971-11-16 17:41:37'),(18,20,20,'Nisi ab non sapiente consequatur sunt aut. Doloremque atque quis sequi et quia illum provident sed. Minima ipsam et voluptatem quibusdam at.','2019-11-04 01:11:12'),(19,21,21,'Aut aut inventore dignissimos voluptatibus voluptatem sed soluta explicabo. Qui autem in debitis incidunt et. Aut accusamus sunt sed qui ab quis. Magnam voluptatem reiciendis dolorum culpa quia.','1970-06-01 22:29:04'),(20,22,22,'Voluptatum sed impedit nihil neque. Unde dolorum non voluptate. Voluptates id fugiat dicta sed et quisquam enim.','2009-05-20 01:56:02'),(21,12,12,'Perferendis numquam ut in vitae. Animi dolorem inventore consequuntur labore dolorem et soluta commodi. Nihil ut fugit ducimus asperiores molestiae suscipit.','1977-10-29 08:59:58'),(22,13,13,'Quod ipsa odio deserunt totam. Necessitatibus et tempore fugit laboriosam architecto earum laborum. Deserunt odit praesentium sequi omnis in vel non. Quos fuga et voluptas nemo fugit amet eligendi nisi.','2016-10-21 12:07:58'),(23,14,14,'Molestiae debitis illum cumque rem ad voluptatem voluptatem. Provident rerum vero fugit quia odit ut voluptatem. Alias dolores molestiae sed quia qui voluptas. Quasi accusamus soluta qui harum et laborum cumque veritatis.','2005-03-18 08:04:39'),(24,15,15,'Dignissimos quia non sint deserunt quod. Et esse eius doloribus dignissimos nulla quae. Rerum in odit neque veritatis vel. Qui placeat voluptatem dicta quia sed facere.','1984-10-09 08:36:19'),(25,16,16,'Ducimus sapiente qui optio provident perferendis. Quisquam quaerat vitae tenetur. Non explicabo quia vitae harum aut ratione. Minus repellat dicta tempore impedit.','1983-03-22 20:16:36'),(26,17,17,'Omnis omnis et exercitationem quia vel eaque illum. Qui quia odit veritatis aspernatur et. Et eveniet harum aut qui quae maiores. Nihil deleniti qui facere rerum est magni temporibus.','2008-05-23 11:25:51'),(27,19,19,'Aut error quia dolore ut quasi aut ut. Perferendis qui eaque nihil illo. Adipisci ut aut nihil necessitatibus. Enim nam illo et libero autem iusto consequatur.','2011-07-16 14:07:25'),(28,20,20,'Rem magnam velit sapiente necessitatibus iure tempora. Placeat non qui ratione hic possimus aliquid. Est saepe fugiat placeat et impedit consequatur sunt. Neque distinctio ipsa incidunt occaecati.','1994-11-03 07:24:58'),(29,21,21,'Culpa excepturi eveniet vitae ut. Iusto omnis dolorem numquam sint porro adipisci ab aut. Similique eius et recusandae nisi. Tempora error tempora perspiciatis animi asperiores porro.','2014-12-23 16:59:14'),(30,22,22,'Mollitia iste quam quis laboriosam rerum perspiciatis. Vero sequi sed occaecati velit quasi non. Et itaque ducimus magnam ex. Unde perferendis reprehenderit quia voluptate rerum id. Ratione rem facilis unde doloremque ullam.','1998-07-31 21:51:28'),(31,12,12,'Illo placeat et sed et. Ea iusto eligendi tempore labore. Qui reiciendis pariatur autem magni.','1996-10-22 20:46:17'),(32,13,13,'Molestias dignissimos numquam est vel quia autem esse. Sunt nostrum accusantium cumque. Unde sit vitae porro est.','2010-07-19 22:24:49'),(33,14,14,'Rerum pariatur magnam et soluta alias officiis. Assumenda perspiciatis hic eligendi nisi aperiam quam. Voluptatem ut id sint pariatur atque. Quia alias non est quia.','2005-01-18 14:57:28'),(34,15,15,'Eligendi tenetur itaque architecto aliquid deleniti. Eos blanditiis cupiditate fuga consectetur consectetur.','1989-03-11 05:46:01'),(35,16,16,'At fuga non harum tempora. Ex unde sequi asperiores error cumque voluptatibus rerum.','1983-07-27 19:13:19'),(36,17,17,'Aliquam quae dolore provident recusandae nihil. Tenetur ad quisquam optio ut. Dolor occaecati quo illo aspernatur. Aut quo veniam delectus eligendi earum nulla.','1977-07-21 08:36:02'),(37,19,19,'Perspiciatis omnis odio rerum nemo repellendus nulla provident. Placeat hic expedita ducimus consequatur. Est aperiam ex rerum inventore assumenda sit. Tempora iusto voluptatem id et.','2008-12-23 05:58:58'),(38,20,20,'Id tempore qui aliquam neque. Velit et facilis nulla corporis vitae facere illo qui. Quasi sunt et ratione deserunt quaerat. Et reiciendis eos cupiditate id.','2005-03-08 19:43:26'),(39,21,21,'Nemo ab aut provident perspiciatis et placeat eius. Et autem cum odit neque. Et dolores assumenda velit nostrum.','1973-04-22 23:49:37'),(40,22,22,'Quod voluptates porro fugit id non enim. Quis dicta rerum molestiae perferendis. In quo rerum minima debitis id qui.','1982-09-28 07:36:11'),(41,12,12,'Sed rerum dolor dolorem animi nam a. Quas voluptas ut suscipit numquam dolorem ut. Non quis quos maiores quia dolor magnam harum nihil. Reprehenderit omnis dolor ut modi.','1993-02-28 01:57:15'),(42,13,13,'Eius nesciunt omnis harum tempora nulla doloremque. Voluptatem fugit facere facere incidunt quis.','1996-05-24 06:08:31'),(43,14,14,'Blanditiis neque aperiam dolor aut iure veniam. Expedita architecto aut magnam magnam dolorem delectus et doloribus. Aut ducimus maiores earum sit voluptatum. Laudantium beatae nobis et quia adipisci odio. Officia sunt officia molestiae possimus voluptas enim numquam.','1988-11-27 06:06:40'),(44,15,15,'Excepturi ducimus sunt at sint sequi. Tempora aut ea corrupti quidem esse molestias ut. Porro eos voluptas quam pariatur veritatis perferendis. Fuga distinctio sapiente nihil et nam laborum.','1987-09-06 09:51:50'),(45,16,16,'Aut ut maxime qui nemo repellat ut. Quasi est repellat quis nihil illum corporis. Ea dolores assumenda ipsa et in.','1989-04-30 16:10:27'),(46,17,17,'Dignissimos atque recusandae vero placeat tempore qui excepturi. Expedita est aspernatur sunt. Aut qui minima consectetur saepe. Autem ea magni sit magnam ipsa.','1991-05-31 15:40:05'),(47,19,19,'Optio maxime voluptatem et est. Quos fuga dolor id repellendus ab rem. Vero non aut voluptatibus et vitae unde. Tenetur non aperiam officia eum tempora impedit.','1996-08-28 06:56:21'),(48,20,20,'Molestiae nulla expedita enim quis cum voluptatem voluptatem facere. Qui expedita ipsam vel numquam. Qui amet omnis beatae ea quo.','1971-02-15 20:29:10'),(49,21,21,'Minus porro beatae doloribus qui nihil tempore hic. Ut voluptatem et asperiores doloribus. Impedit vel quidem id magnam corporis id quo aliquid.','2012-06-19 05:29:29'),(50,22,22,'At placeat temporibus culpa ab natus nesciunt et hic. Autem dolorem officiis omnis et et sed. Non sit non sed vel optio. Occaecati aut aliquid qui nam quasi.','2016-04-01 01:13:49'),(51,12,12,'Et suscipit dolorum aperiam dolores. Et a modi amet consequatur ad enim deleniti. Voluptatem molestiae dolorem labore voluptatem.','2013-11-05 09:18:17'),(52,13,13,'Doloremque cupiditate temporibus et ad harum. Facere mollitia ipsam dolorem eum. Ut facere voluptatem ea.','1985-12-25 02:03:49'),(53,14,14,'Est vero eos quisquam porro asperiores laudantium soluta. Accusantium repellendus labore repellendus est. Velit vel recusandae dicta. Quo aut ea non nulla maxime non.','2004-10-07 02:01:53'),(54,15,15,'Optio molestiae culpa fugiat earum omnis. Et vero omnis omnis nisi quibusdam. Omnis iusto at nobis sit cupiditate maiores. Dolor sed commodi minima reiciendis.','1970-11-14 03:06:20'),(55,16,16,'Enim libero non sit. Magnam aut quaerat aut molestiae qui quo ab. Nulla temporibus enim sit. Omnis vitae tempore id labore est expedita.','2001-08-31 05:15:11'),(56,17,17,'Ut aut consequatur voluptas et sunt totam. Reprehenderit veniam fugiat laboriosam quo. Et aspernatur beatae ipsum ut. Nisi dolor aliquid et error officiis consectetur aut et.','2008-08-04 08:19:37'),(57,19,19,'Quae necessitatibus laudantium sed vitae quos molestias veniam. In officia sed repudiandae. Rerum aut hic ut ea.','1999-05-15 23:08:01'),(58,20,20,'Dolorem possimus nam et. Numquam numquam neque iusto quia. Eligendi deserunt dignissimos et qui qui assumenda magni laboriosam.','1976-04-21 08:47:33'),(59,21,21,'Officia eligendi velit dignissimos deserunt. Aut alias voluptatum est dolorem qui. Sunt consequatur saepe quia nam sunt dignissimos mollitia.','2012-04-08 11:39:58'),(60,22,22,'Vitae aut odio voluptas dolor. Et vel voluptatibus sunt laudantium magnam qui. Animi voluptatem optio occaecati voluptates et eveniet iure. Corrupti ut neque rerum et.','1977-12-16 06:00:08'),(61,12,12,'Eum non esse recusandae facere vel sint eos et. Eligendi ipsa placeat reiciendis rerum sit exercitationem. Magni quos voluptate molestiae id et inventore.','2020-05-02 21:39:11'),(62,13,13,'Impedit quod commodi itaque expedita debitis et voluptas. Illum iste eos dolores ab saepe sit. Ipsam temporibus harum consectetur soluta.','2009-01-05 19:52:54'),(63,14,14,'Nihil optio ut ab nihil enim nesciunt. Doloribus repellendus consequuntur quae amet aut iure nisi adipisci.','2005-10-01 18:36:08'),(64,15,15,'Sapiente et voluptates fuga fugit. Et molestiae aut et. In quis harum voluptatibus ullam. Ab ut necessitatibus aut minus unde ullam.','2021-06-01 13:19:34'),(65,16,16,'Enim dignissimos itaque est dignissimos rerum sunt cupiditate eos. Voluptatem voluptatibus eos sunt fugiat tempore voluptatum pariatur cum. Sunt illum nihil est et quod.','2016-01-15 06:02:46'),(66,17,17,'Est nihil ut vel unde. Eaque quisquam sint consequatur accusamus qui asperiores quis maxime. Quo nostrum autem et id.','2003-11-01 11:57:45'),(67,19,19,'Libero rerum accusantium blanditiis quibusdam praesentium veritatis odio velit. Consectetur perspiciatis ea ipsam nisi. Ullam esse quia ea. Qui est ipsum omnis sint magni iusto impedit laboriosam.','2010-01-14 12:29:49'),(68,20,20,'Eos deleniti odio deleniti ea ad. Praesentium molestiae beatae sapiente quis. Ipsam est molestiae rerum.','2001-08-11 10:43:48'),(69,21,21,'A sit dolorum dolor aut sunt mollitia ut. Consequatur sit deserunt qui modi doloribus quod aut. Quia dolorum dolores est voluptatem. Quas dolorem accusantium necessitatibus quia sit et laborum et.','1970-04-29 01:41:04'),(70,22,22,'Iusto dolor quia aut voluptatem explicabo. Corrupti est omnis qui molestiae voluptatem aperiam ea et. Velit quidem nostrum exercitationem.','1991-07-31 17:15:52'),(71,12,12,'Necessitatibus voluptas molestiae rerum dignissimos rerum nobis. Ut maiores excepturi vel nulla laudantium consequatur voluptates tenetur. Laborum quis qui quae facilis adipisci. Ipsam nihil iusto quis.','2006-01-10 19:44:09'),(72,13,13,'Voluptatum veritatis vitae quibusdam aperiam odio. Occaecati quia ut dolorem aliquid. Saepe culpa voluptate atque temporibus sapiente corporis non.','2007-09-19 09:20:58'),(73,14,14,'Consequatur labore et dolorum et nostrum. Minima sit quas repellat aut possimus dicta. Voluptas est aut totam libero.','1999-06-26 11:42:11'),(74,15,15,'Et veritatis hic voluptatibus nemo alias et. Molestias quos eos id dolorem. Nisi ipsam et aspernatur nihil qui nam.','1987-05-10 02:45:16'),(75,16,16,'Recusandae aut omnis ut animi omnis vel. Dolore est aut minus saepe et ea aperiam dolor. Voluptate illum sunt aut veritatis velit. Labore voluptas alias sed quibusdam quia.','1972-08-26 05:29:02'),(76,17,17,'Aut quisquam sunt corrupti est corporis sed autem. Blanditiis iusto ratione cupiditate optio.','1993-01-03 18:06:50'),(77,19,19,'Accusamus voluptate minima fugit. Non ex hic modi a quia vero. Iste eos eveniet dolores distinctio quo. Quis id molestias tempora quae deleniti dolor. Totam laudantium maxime provident dolore corrupti magnam.','1979-07-12 21:35:20'),(78,20,20,'Minus tenetur dolorum enim neque suscipit nam. Sed in voluptatem architecto esse. Harum aliquid quod harum ut voluptas ducimus.','2015-03-19 02:33:19'),(79,21,21,'Ad et omnis maxime maiores vero aut eligendi. Omnis id accusamus fugiat atque sint laboriosam blanditiis. Unde rerum accusantium et qui odio eveniet.','2019-01-29 15:15:12'),(80,22,22,'Quasi nostrum cumque consequuntur quia enim est ut. Et occaecati voluptatum omnis accusamus ut maiores. Quod ut et aspernatur et similique rem magni molestias.','2018-10-23 13:23:26'),(81,12,12,'Aut consequatur laboriosam eum inventore odio illum ut pariatur. Minima cupiditate quis dolore quia ut ratione. Ut ut recusandae beatae exercitationem voluptatum. Aut eum consequatur reprehenderit commodi ratione.','1991-12-27 21:45:33'),(82,13,13,'Amet sunt earum praesentium illo placeat. Voluptas laudantium quis sunt porro sunt id velit in. Voluptates voluptatem rerum nulla molestiae cum.','2006-10-09 16:34:55'),(83,14,14,'Corporis et laboriosam minus atque minus molestiae eum. In itaque voluptas enim autem minima vel et. Est iste nesciunt laborum qui provident provident.','2004-10-12 18:53:31'),(84,15,15,'Nihil corrupti quo expedita voluptatum ipsam dolor. Similique hic possimus laboriosam voluptas ratione nesciunt. Quo eligendi voluptatem commodi dolore doloribus.','1992-10-17 21:32:07'),(85,16,16,'Ea iusto consequatur sit recusandae itaque repellat maxime. Officiis ex id consequatur dolores. Dolor alias quia et pariatur similique. Quas autem aut consequuntur non.','1979-01-02 20:48:15'),(86,17,17,'Ipsum consequatur quod et pariatur quidem sed asperiores vitae. Quasi excepturi voluptas enim ex consequatur nisi. Similique non incidunt corrupti omnis dolores itaque soluta. Suscipit provident odit aut maiores enim et cupiditate.','1980-11-03 04:47:06'),(87,19,19,'Facere quo repudiandae temporibus consectetur. Omnis beatae dignissimos omnis ut cupiditate non voluptates. Omnis qui voluptas itaque ipsum consequuntur ut. Numquam sint rerum molestiae.','1991-05-30 18:34:52'),(88,20,20,'Repellendus minus voluptatem magni vitae eius. Molestias eum sit minus voluptate. Veniam molestiae iusto ipsam. Quisquam et omnis aut ea. Sint nostrum voluptatum adipisci quidem.','1998-12-07 19:29:00'),(89,21,21,'Rerum ratione commodi animi excepturi provident. Sit sit nemo voluptatum distinctio odit. In sint dolor eos. Consequatur eos atque veritatis facere.','1985-03-27 02:36:40'),(90,22,22,'Rerum reiciendis occaecati quos et aut beatae natus. Aspernatur repellat quo consequatur odio dolorem quia. Vel dolore et autem velit sequi at molestiae. Aspernatur provident aliquid aliquam est optio.','2005-02-27 10:10:48'),(91,12,12,'Est repudiandae perspiciatis atque. Culpa quia adipisci quo enim rerum deserunt quod temporibus.','1980-02-13 05:54:03'),(92,13,13,'Explicabo et nulla culpa voluptas atque et voluptates tempore. Vel dignissimos id et cupiditate. Id facere officia vero nostrum.','1995-04-21 13:32:18'),(93,14,14,'Porro dignissimos perferendis sunt atque. Ipsam ut consectetur vitae nostrum voluptas blanditiis. Nesciunt voluptatibus ut possimus vitae. Incidunt ex sapiente ut autem illo quia at quisquam.','1976-01-17 03:24:15'),(94,15,15,'Esse aliquid sed cum tempora laboriosam excepturi. Illo sed quae impedit quis quae. Assumenda aut voluptas rerum odio accusamus facilis.','1979-06-17 23:48:35'),(95,16,16,'Dolor unde aliquam velit totam officiis. Eos est est rerum et. Cupiditate est facilis omnis ut dolor impedit.','1980-06-15 16:00:31'),(96,17,17,'Est et quae et ipsum non commodi occaecati. Sit commodi vitae dolore dignissimos et voluptatibus hic. Accusantium omnis corrupti consectetur laudantium nobis et.','2009-09-29 19:28:41'),(97,19,19,'Aspernatur eveniet ratione aperiam. Exercitationem assumenda ad molestias ea excepturi quis.','2011-11-27 17:31:43'),(98,20,20,'Nobis labore doloremque perspiciatis nulla nisi voluptates provident repudiandae. Incidunt et rerum pariatur dolores vel unde. Dicta et quasi et quisquam odio ipsam. Iusto reprehenderit at et hic.','1999-09-09 02:58:00'),(99,21,21,'Exercitationem dolores vel tempora asperiores. Quo et nam ut. Non aliquid iure rerum. Quia sunt accusamus quia in ducimus.','1990-07-29 16:38:09'),(100,22,22,'Nihil laboriosam eum id architecto aut modi. Ipsa dolorem accusantium adipisci assumenda expedita ducimus ut. Magni necessitatibus est ut amet.','2002-09-25 10:35:08');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photo_albums`
--

DROP TABLE IF EXISTS `photo_albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photo_albums` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `photo_albums_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photo_albums`
--

LOCK TABLES `photo_albums` WRITE;
/*!40000 ALTER TABLE `photo_albums` DISABLE KEYS */;
INSERT INTO `photo_albums` VALUES (1,'sapiente',12),(2,'molestiae',13),(3,'adipisci',14),(4,'magnam',15),(5,'assumenda',16),(6,'praesentium',17),(7,'voluptatem',19),(8,'natus',20),(9,'eaque',21),(10,'dolorum',22);
/*!40000 ALTER TABLE `photo_albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photos`
--

DROP TABLE IF EXISTS `photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `album_id` bigint(20) unsigned DEFAULT NULL,
  `media_id` bigint(20) unsigned NOT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `album_id` (`album_id`),
  KEY `media_id` (`media_id`),
  CONSTRAINT `photos_ibfk_1` FOREIGN KEY (`album_id`) REFERENCES `photo_albums` (`id`),
  CONSTRAINT `photos_ibfk_2` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photos`
--

LOCK TABLES `photos` WRITE;
/*!40000 ALTER TABLE `photos` DISABLE KEYS */;
INSERT INTO `photos` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,5),(6,6,6),(7,7,7),(8,8,8),(9,9,9),(10,10,10);
/*!40000 ALTER TABLE `photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profiles` (
  `user_id` bigint(20) unsigned NOT NULL,
  `gender` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `photo_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `hometown` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  UNIQUE KEY `user_id` (`user_id`),
  KEY `profiles_fk_1` (`photo_id`),
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `profiles_fk_1` FOREIGN KEY (`photo_id`) REFERENCES `media` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
INSERT INTO `profiles` VALUES (12,'m','2005-07-08',1,'2002-02-05 01:43:43','Jamilmouth',0),(13,'f','2020-02-08',2,'1970-07-17 09:57:59','Alexandroberg',0),(14,'m','2000-10-02',3,'1999-06-26 15:31:17','Websterchester',1),(15,'m','2014-12-21',4,'1995-07-10 13:17:22','East Jeffrey',0),(16,'f','2019-11-11',5,'2002-10-27 17:29:57','Lake Jasenchester',0),(17,'m','1996-01-05',6,'1987-11-12 07:54:00','Clementinehaven',1),(19,'m','1995-11-14',7,'1986-02-04 20:06:36','Lake Lucienne',0),(20,'f','2002-05-02',8,'2007-02-09 22:13:38','Stantonshire',0),(21,'f','1984-09-19',9,'2014-11-03 13:09:59','Kossstad',1),(22,'f','2013-01-11',10,'1996-11-13 11:34:04','East Zaria',0);
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stories`
--

DROP TABLE IF EXISTS `stories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `part` tinyint(3) unsigned NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `user_id` bigint(20) unsigned NOT NULL,
  `media_id` bigint(20) unsigned NOT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  KEY `media_id` (`media_id`),
  CONSTRAINT `stories_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `stories_ibfk_2` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stories`
--

LOCK TABLES `stories` WRITE;
/*!40000 ALTER TABLE `stories` DISABLE KEYS */;
INSERT INTO `stories` VALUES (1,1,'2009-12-30 21:31:08',12,1),(2,7,'1989-01-04 04:18:34',13,2),(3,6,'2005-08-23 00:12:13',14,3),(4,8,'2005-04-21 11:09:30',15,4),(5,2,'1976-04-27 08:46:04',16,5),(6,6,'2020-02-10 11:10:13',17,6),(7,4,'1996-04-22 09:02:34',19,7),(8,2,'1994-05-11 01:10:34',20,8),(9,8,'1988-10-21 22:50:38',21,9),(10,5,'1979-02-13 13:34:36',22,10),(11,8,'2010-01-18 10:53:19',12,1),(12,8,'1986-04-11 19:01:20',13,2),(13,8,'2002-11-12 17:33:05',14,3),(14,9,'2003-12-31 19:45:38',15,4),(15,5,'1993-07-26 23:29:17',16,5),(16,2,'2020-07-06 02:12:55',17,6),(17,8,'2003-07-09 06:33:20',19,7),(18,7,'1996-02-18 00:11:27',20,8),(19,4,'2021-01-20 06:43:40',21,9),(20,1,'2004-08-02 04:28:07',22,10),(21,8,'2013-02-18 05:05:32',12,1),(22,5,'1988-08-20 22:38:05',13,2),(23,3,'1985-12-15 10:29:53',14,3),(24,6,'1971-10-16 13:57:17',15,4),(25,7,'1975-05-14 12:03:13',16,5),(26,6,'1977-01-21 10:31:26',17,6),(27,2,'1992-03-14 03:50:42',19,7),(28,8,'1998-01-10 05:36:39',20,8),(29,8,'1995-10-13 12:14:43',21,9),(30,1,'1973-08-08 02:55:49',22,10),(31,1,'2002-05-19 10:27:52',12,1),(32,4,'1999-04-19 17:28:32',13,2),(33,2,'2008-11-30 17:50:17',14,3),(34,9,'2008-10-21 12:52:42',15,4),(35,2,'2007-09-04 04:01:20',16,5),(36,5,'1976-05-20 13:42:50',17,6),(37,5,'2002-03-07 22:35:23',19,7),(38,6,'2011-04-19 17:42:00',20,8),(39,6,'2010-06-22 14:23:53',21,9),(40,3,'1995-01-27 15:32:55',22,10),(41,2,'1981-08-15 11:50:40',12,1),(42,2,'2021-04-25 06:09:57',13,2),(43,2,'1994-07-14 03:19:41',14,3),(44,4,'2019-03-29 18:56:44',15,4),(45,7,'1975-04-17 10:04:30',16,5),(46,6,'1983-07-19 23:10:54',17,6),(47,9,'1976-11-19 02:31:03',19,7),(48,1,'2010-03-31 08:28:10',20,8),(49,2,'2006-06-03 22:09:08',21,9),(50,3,'1987-01-30 05:10:43',22,10),(51,8,'2021-06-09 05:45:50',12,1),(52,9,'1974-12-23 20:19:36',13,2),(53,4,'2020-01-02 20:33:42',14,3),(54,8,'1982-08-30 13:21:21',15,4),(55,1,'1979-11-24 21:12:50',16,5),(56,9,'2018-11-11 07:07:31',17,6),(57,4,'1992-10-08 14:24:01',19,7),(58,2,'2020-01-01 05:09:13',20,8),(59,3,'1998-05-31 22:57:30',21,9),(60,9,'1977-11-14 13:03:45',22,10),(61,1,'1990-06-19 02:07:47',12,1),(62,5,'1999-07-12 05:22:59',13,2),(63,9,'1981-06-02 05:37:13',14,3),(64,8,'2016-03-03 12:54:33',15,4),(65,9,'2021-04-02 10:39:27',16,5),(66,8,'2005-08-02 01:44:09',17,6),(67,8,'1994-07-30 23:42:13',19,7),(68,3,'1987-08-08 04:09:29',20,8),(69,5,'2008-06-23 23:56:09',21,9),(70,8,'1972-12-02 09:30:37',22,10),(71,9,'1975-08-20 13:35:46',12,1),(72,6,'2010-03-09 00:11:46',13,2),(73,1,'1991-02-03 22:19:02',14,3),(74,6,'2014-02-02 05:49:11',15,4),(75,2,'2000-11-02 12:38:46',16,5),(76,5,'1987-10-28 15:26:40',17,6),(77,1,'2011-12-07 12:19:42',19,7),(78,5,'1979-05-18 23:00:46',20,8),(79,3,'1995-07-21 03:38:14',21,9),(80,3,'1998-12-17 15:31:30',22,10),(81,1,'1977-10-09 11:44:21',12,1),(82,9,'2014-10-14 22:55:18',13,2),(83,8,'1975-02-19 11:02:16',14,3),(84,1,'2021-08-13 15:01:49',15,4),(85,3,'1970-03-22 14:46:21',16,5),(86,6,'1985-05-01 21:34:14',17,6),(87,3,'1973-09-28 05:40:14',19,7),(88,8,'2009-03-26 05:47:11',20,8),(89,9,'1997-01-24 15:52:25',21,9),(90,3,'2004-01-30 14:08:29',22,10),(91,2,'1976-09-19 11:07:29',12,1),(92,8,'1981-04-04 05:38:08',13,2),(93,2,'1990-07-15 07:08:08',14,3),(94,1,'2007-11-06 15:52:34',15,4),(95,2,'2000-04-10 04:44:30',16,5),(96,5,'2015-02-17 22:22:11',17,6),(97,5,'1990-06-10 20:56:02',19,7),(98,8,'1970-03-31 03:03:00',20,8),(99,9,'2004-10-21 14:11:28',21,9),(100,1,'2010-03-25 00:30:46',22,10);
/*!40000 ALTER TABLE `stories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `survey_questions`
--

DROP TABLE IF EXISTS `survey_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `survey_questions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `questions` text COLLATE utf8mb4_unicode_ci NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey_questions`
--

LOCK TABLES `survey_questions` WRITE;
/*!40000 ALTER TABLE `survey_questions` DISABLE KEYS */;
INSERT INTO `survey_questions` VALUES (1,'Soluta nulla architecto delectus.'),(2,'Aliquam aut voluptas sed vel.'),(3,'Alias incidunt non assumenda.'),(4,'Est at facilis doloribus ratione cum nihil.'),(5,'Nam odit nostrum eos.'),(6,'Sunt praesentium quaerat odit autem aliquam eum rem.'),(7,'Voluptatem rerum voluptatem voluptas eum omnis nemo.'),(8,'Quae et eum aliquid ipsam commodi dolorem neque dignissimos.'),(9,'Iusto quia voluptatum dolor deserunt repudiandae eaque sit.'),(10,'Iusto labore doloremque rem et eum voluptatem.');
/*!40000 ALTER TABLE `survey_questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `surveys`
--

DROP TABLE IF EXISTS `surveys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `surveys` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `survey_questions_id` bigint(20) unsigned NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  KEY `survey_questions_id` (`survey_questions_id`),
  CONSTRAINT `surveys_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `surveys_ibfk_2` FOREIGN KEY (`survey_questions_id`) REFERENCES `survey_questions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `surveys`
--

LOCK TABLES `surveys` WRITE;
/*!40000 ALTER TABLE `surveys` DISABLE KEYS */;
INSERT INTO `surveys` VALUES (1,12,1,'1995-06-10 06:24:56'),(2,13,2,'1983-11-09 18:52:40'),(3,14,3,'2011-03-10 02:35:31'),(4,15,4,'1980-08-02 11:41:53'),(5,16,5,'2000-03-14 10:31:55'),(6,17,6,'1994-09-15 14:30:34'),(7,19,7,'1982-09-06 03:13:41'),(8,20,8,'1978-08-10 02:01:19'),(9,21,9,'1994-01-03 23:32:58'),(10,22,10,'1985-03-22 23:56:18');
/*!40000 ALTER TABLE `surveys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Фамиль',
  `email` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password_hash` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`),
  KEY `users_firstname_lastname_idx` (`firstname`,`lastname`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='юзеры';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (12,'William','Steuber','rmertz@example.com','521289731c2567891f41498619dadb5554a86b12',0),(13,'Blake','Daniel','adolf.koelpin@example.net','8b7cb10268d86700f434811797cc689fe230100c',122),(14,'Mariane','Yundt','bziemann@example.net','887280ab8af5a357d7ccf93bfb612f4f4e9d3a02',353483),(15,'Kaela','Zulauf','langosh.jena@example.net','4be23091c9c795d77f6217cbc856cbb9cf745bd6',302),(16,'Maximillia','Kassulke','julie.marquardt@example.org','58368f4d5c53eb1a08421477dbbb6ee4d690717d',885),(17,'Leila','Hand','ana.orn@example.com','93fe15245728dfeec769cea15289f2ed992e1c74',211),(19,'Mazie','Schowalter','donnelly.brenna@example.net','4652aed337c527a6d4bba3eb3a76dd7d72f1ed5a',897880),(20,'Antonette','Rutherford','kasandra29@example.net','06f6ea475a36181b37f8e2d8352f3a490d827107',1),(21,'Shannon','Pfeffer','bridie68@example.net','7cec3187f5151323f4478c250ac58fdf4b0f6385',456),(22,'Gabriel','Okuneva','smitham.amani@example.com','4bac6e3f4e3be3d4a52116eee67b322e96375ebc',9922226044);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_communities`
--

DROP TABLE IF EXISTS `users_communities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_communities` (
  `user_id` bigint(20) unsigned NOT NULL,
  `community_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`community_id`),
  KEY `community_id` (`community_id`),
  CONSTRAINT `users_communities_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `users_communities_ibfk_2` FOREIGN KEY (`community_id`) REFERENCES `communities` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_communities`
--

LOCK TABLES `users_communities` WRITE;
/*!40000 ALTER TABLE `users_communities` DISABLE KEYS */;
INSERT INTO `users_communities` VALUES (12,1),(13,2),(14,3),(15,4),(16,5),(17,6),(19,7),(20,8),(21,9),(22,10);
/*!40000 ALTER TABLE `users_communities` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-07 16:55:19

#HOMEWORK 4

SELECT DISTINCT firstname FROM users ORDER BY users.firstname ASC; 

UPDATE profiles SET is_active = TRUE; 

UPDATE profiles SET is_active = FALSE WHERE birthday < "20030101";

SELECT * FROM profiles WHERE birthday < "2003";

SELECT * FROM messages;

INSERT INTO `messages` VALUES(101,12,13,"Message from future",'2027-07-03 12:59:54'),(102, 13,15, "Message from future 2", '2029-07-03 12:59:55')

DELETE FROM `messages` WHERE `created_at` > DATE(NOW());

#HOMEWORK 5

#1 Операторы

ALTER TABLE users ADD COLUMN `created_at` VARCHAR(256);
 
ALTER TABLE users ADD COLUMN `updated_at` VARCHAR(256);

UPDATE users SET `created_at` = NOW();

UPDATE users SET `updated_at` = NOW();

#2

ALTER TABLE users MODIFY `created_at` DATETIME;

ALTER TABLE users MODIFY `updated_at` DATETIME;

#3

SELECT phone FROM users GROUP BY phone HAVING phone > 0
UNION 
SELECT phone FROM users WHERE phone = 0;

#1 Агрегация

SELECT users.id, profiles.user_id, users.firstname, users.lastname, profiles.birthday,YEAR(NOW()) - YEAR(profiles.birthday) as `age` FROM profiles, users WHERE user_id = users.id;

#2

SELECT WEEKDAY(DATE_ADD(birthday,INTERVAL (YEAR(NOW()) - YEAR(birthday)) YEAR)) as wd, COUNT(*) FROM profiles GROUP BY wd;


