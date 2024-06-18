-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: zurd_db
-- ------------------------------------------------------
-- Server version	8.0.37

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `category_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `category_name` bigint NOT NULL,
  `category_columns` bigint NOT NULL,
  `created_at` timestamp NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `columns`
--

DROP TABLE IF EXISTS `columns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `columns` (
  `column_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `column_name` varchar(255) NOT NULL,
  `threads_count` bigint NOT NULL,
  `posts_count` bigint NOT NULL,
  `last_thread_title` varchar(255) NOT NULL,
  `last_thread_user` varchar(255) NOT NULL,
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `columns`
--

LOCK TABLES `columns` WRITE;
/*!40000 ALTER TABLE `columns` DISABLE KEYS */;
/*!40000 ALTER TABLE `columns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credits_transactions`
--

DROP TABLE IF EXISTS `credits_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `credits_transactions` (
  `transaction_id` bigint NOT NULL AUTO_INCREMENT,
  `sender_username` varchar(255) NOT NULL,
  `receiver_username` varchar(255) NOT NULL,
  `sender_user_address` varchar(36) NOT NULL,
  `receiver_user_address` varchar(36) NOT NULL,
  `amount` bigint NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `transaction_status` varchar(255) NOT NULL,
  `failed_reason` varchar(255) DEFAULT NULL,
  `transaction_message` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`transaction_id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credits_transactions`
--

LOCK TABLES `credits_transactions` WRITE;
/*!40000 ALTER TABLE `credits_transactions` DISABLE KEYS */;
INSERT INTO `credits_transactions` VALUES (1,'rhjktur','dgkdgukud','23e81d1d-dcfe-469b-9b0a-1a0250fe5eb0','7ad3fcb2-3b22-4e61-abb1-1964b5f03e96',9,'2024-06-06 07:24:16','Completed','','this is for you baby'),(2,'rhjktur','dgkdgukud','23e81d1d-dcfe-469b-9b0a-1a0250fe5eb0','7ad3fcb2-3b22-4e61-abb1-1964b5f03e96',9,'2024-06-06 07:27:16','Completed','','this is for you baby'),(3,'rhjktur','dgkdgukud','23e81d1d-dcfe-469b-9b0a-1a0250fe5eb0','7ad3fcb2-3b22-4e61-abb1-1964b5f03e96',9,'2024-06-06 07:29:08','Completed',NULL,'this is for you baby'),(4,'rhjktur','dgkdgukud','23e81d1d-dcfe-469b-9b0a-1a0250fe5eb0','7ad3fcb2-3b22-4e61-abb1-1964b5f03e96',9,'2024-06-06 09:34:53','Completed',NULL,'this is for you baby'),(5,'rhjktur','dgkdgukud','23e81d1d-dcfe-469b-9b0a-1a0250fe5eb0','7ad3fcb2-3b22-4e61-abb1-1964b5f03e96',9,'2024-06-06 09:38:25','Completed',NULL,'this is for you baby'),(6,'rhjktur','dgkdgukud','23e81d1d-dcfe-469b-9b0a-1a0250fe5eb0','7ad3fcb2-3b22-4e61-abb1-1964b5f03e96',9,'2024-06-06 09:39:54','Completed',NULL,'this is for you baby'),(7,'rhjktur','dgkdgukud','23e81d1d-dcfe-469b-9b0a-1a0250fe5eb0','7ad3fcb2-3b22-4e61-abb1-1964b5f03e96',9,'2024-06-06 09:52:04','Completed',NULL,'this is for you baby'),(8,'rhjktur','dgkdgukud','23e81d1d-dcfe-469b-9b0a-1a0250fe5eb0','7ad3fcb2-3b22-4e61-abb1-1964b5f03e96',9,'2024-06-06 09:52:44','Completed',NULL,'this is for you baby'),(9,'rhjktur','dgkdgukud','23e81d1d-dcfe-469b-9b0a-1a0250fe5eb0','7ad3fcb2-3b22-4e61-abb1-1964b5f03e96',9,'2024-06-06 09:53:42','Completed',NULL,'this is for you baby'),(10,'rhjktur','dgkdgukud','23e81d1d-dcfe-469b-9b0a-1a0250fe5eb0','7ad3fcb2-3b22-4e61-abb1-1964b5f03e96',9,'2024-06-06 09:55:23','Completed',NULL,'this is for you baby'),(11,'rhjktur','dgkdgukud','23e81d1d-dcfe-469b-9b0a-1a0250fe5eb0','7ad3fcb2-3b22-4e61-abb1-1964b5f03e96',9,'2024-06-06 10:11:15','Completed',NULL,'this is for you baby'),(12,'rhjktur','dgkdgukud','23e81d1d-dcfe-469b-9b0a-1a0250fe5eb0','7ad3fcb2-3b22-4e61-abb1-1964b5f03e96',98,'2024-06-06 10:19:11','Completed',NULL,'this is for you baby'),(13,'rhjktur','dgkdgukud','23e81d1d-dcfe-469b-9b0a-1a0250fe5eb0','7ad3fcb2-3b22-4e61-abb1-1964b5f03e96',98,'2024-06-06 10:20:17','Completed',NULL,'this is for you baby'),(14,'rhjktur','dgkdgukud','23e81d1d-dcfe-469b-9b0a-1a0250fe5eb0','7ad3fcb2-3b22-4e61-abb1-1964b5f03e96',98,'2024-06-06 10:21:55','Completed',NULL,'this is for you baby'),(15,'rhjktur','dgkdgukud','23e81d1d-dcfe-469b-9b0a-1a0250fe5eb0','7ad3fcb2-3b22-4e61-abb1-1964b5f03e96',98,'2024-06-06 10:22:26','Completed',NULL,'this is for you baby'),(16,'rhjktur','dgkdgukud','23e81d1d-dcfe-469b-9b0a-1a0250fe5eb0','7ad3fcb2-3b22-4e61-abb1-1964b5f03e96',98,'2024-06-06 10:31:44','Completed',NULL,'this is for you baby'),(17,'rhjktur','dgkdgukud','23e81d1d-dcfe-469b-9b0a-1a0250fe5eb0','7ad3fcb2-3b22-4e61-abb1-1964b5f03e96',1,'2024-06-06 10:32:27','Completed',NULL,'this is for you baby'),(18,'rhjktur','dgkdgukud','23e81d1d-dcfe-469b-9b0a-1a0250fe5eb0','7ad3fcb2-3b22-4e61-abb1-1964b5f03e96',9,'2024-06-06 10:49:28','Completed',NULL,'this is for you baby'),(19,'rhjktur','dgkdgukud','23e81d1d-dcfe-469b-9b0a-1a0250fe5eb0','7ad3fcb2-3b22-4e61-abb1-1964b5f03e96',9,'2024-06-06 10:49:38','Completed',NULL,'this is for you baby'),(20,'rhjktur','dgkdgukud','23e81d1d-dcfe-469b-9b0a-1a0250fe5eb0','7ad3fcb2-3b22-4e61-abb1-1964b5f03e96',9,'2024-06-06 10:49:46','Completed',NULL,'this is for you baby'),(21,'rhjktur','dgkdgukud','23e81d1d-dcfe-469b-9b0a-1a0250fe5eb0','7ad3fcb2-3b22-4e61-abb1-1964b5f03e96',7,'2024-06-06 10:51:05','Completed',NULL,'this is for you baby'),(22,'rhjktur','dgkdgukud','23e81d1d-dcfe-469b-9b0a-1a0250fe5eb0','7ad3fcb2-3b22-4e61-abb1-1964b5f03e96',7,'2024-06-06 10:51:14','Completed',NULL,'this is for you baby'),(23,'rhjktur','dgkdgukud','23e81d1d-dcfe-469b-9b0a-1a0250fe5eb0','7ad3fcb2-3b22-4e61-abb1-1964b5f03e96',7,'2024-06-06 10:51:55','Completed',NULL,'this is for you baby'),(24,'rhjktur','dgkdgukud','23e81d1d-dcfe-469b-9b0a-1a0250fe5eb0','7ad3fcb2-3b22-4e61-abb1-1964b5f03e96',7,'2024-06-06 10:52:06','Completed',NULL,'this is for you baby'),(25,'rhjktur','dgkdgukud','23e81d1d-dcfe-469b-9b0a-1a0250fe5eb0','7ad3fcb2-3b22-4e61-abb1-1964b5f03e96',98,'2024-06-06 10:52:17','Completed',NULL,'this is for you baby'),(26,'rhjktur','dgkdgukud','23e81d1d-dcfe-469b-9b0a-1a0250fe5eb0','7ad3fcb2-3b22-4e61-abb1-1964b5f03e96',98,'2024-06-06 10:52:54','Completed',NULL,'this is for you baby'),(27,'rhjktur','dgkdgukud','23e81d1d-dcfe-469b-9b0a-1a0250fe5eb0','7ad3fcb2-3b22-4e61-abb1-1964b5f03e96',980,'2024-06-06 10:53:10','Completed',NULL,'this is for you baby'),(28,'rhjktur','dgkdgukud','23e81d1d-dcfe-469b-9b0a-1a0250fe5eb0','7ad3fcb2-3b22-4e61-abb1-1964b5f03e96',980,'2024-06-06 11:05:50','Completed',NULL,'this is for you baby'),(29,'rhjktur','dgkdgukud','23e81d1d-dcfe-469b-9b0a-1a0250fe5eb0','7ad3fcb2-3b22-4e61-abb1-1964b5f03e96',400,'2024-06-06 11:06:08','Completed',NULL,'this is for you baby'),(30,'rhjktur','dgkdgukud','23e81d1d-dcfe-469b-9b0a-1a0250fe5eb0','7ad3fcb2-3b22-4e61-abb1-1964b5f03e96',400,'2024-06-06 11:06:09','Completed',NULL,'this is for you baby'),(31,'rhjktur','dgkdgukud','23e81d1d-dcfe-469b-9b0a-1a0250fe5eb0','7ad3fcb2-3b22-4e61-abb1-1964b5f03e96',400,'2024-06-06 11:06:10','Completed',NULL,'this is for you baby'),(32,'rhjktur','dgkdgukud','23e81d1d-dcfe-469b-9b0a-1a0250fe5eb0','7ad3fcb2-3b22-4e61-abb1-1964b5f03e96',400,'2024-06-06 11:06:10','Completed',NULL,'this is for you baby'),(33,'rhjktur','dgkdgukud','23e81d1d-dcfe-469b-9b0a-1a0250fe5eb0','7ad3fcb2-3b22-4e61-abb1-1964b5f03e96',400,'2024-06-06 11:06:11','Completed',NULL,'this is for you baby'),(34,'rhjktur','dgkdgukud','23e81d1d-dcfe-469b-9b0a-1a0250fe5eb0','7ad3fcb2-3b22-4e61-abb1-1964b5f03e96',400,'2024-06-06 11:06:12','Completed',NULL,'this is for you baby'),(35,'rhjktur','dgkdgukud','23e81d1d-dcfe-469b-9b0a-1a0250fe5eb0','7ad3fcb2-3b22-4e61-abb1-1964b5f03e96',400,'2024-06-06 11:06:12','Completed',NULL,'this is for you baby'),(36,'rhjktur','dgkdgukud','23e81d1d-dcfe-469b-9b0a-1a0250fe5eb0','7ad3fcb2-3b22-4e61-abb1-1964b5f03e96',400,'2024-06-06 11:06:13','Completed',NULL,'this is for you baby'),(37,'rhjktur','dgkdgukud','23e81d1d-dcfe-469b-9b0a-1a0250fe5eb0','7ad3fcb2-3b22-4e61-abb1-1964b5f03e96',400,'2024-06-06 11:06:13','Completed',NULL,'this is for you baby'),(38,'rhjktur','dgkdgukud','23e81d1d-dcfe-469b-9b0a-1a0250fe5eb0','7ad3fcb2-3b22-4e61-abb1-1964b5f03e96',400,'2024-06-06 11:06:14','Completed',NULL,'this is for you baby'),(39,'rhjktur','dgkdgukud','23e81d1d-dcfe-469b-9b0a-1a0250fe5eb0','7ad3fcb2-3b22-4e61-abb1-1964b5f03e96',400,'2024-06-06 11:06:15','Completed',NULL,'this is for you baby'),(40,'rhjktur','dgkdgukud','23e81d1d-dcfe-469b-9b0a-1a0250fe5eb0','7ad3fcb2-3b22-4e61-abb1-1964b5f03e96',400,'2024-06-06 11:06:15','Completed',NULL,'this is for you baby'),(41,'rhjktur','dgkdgukud','23e81d1d-dcfe-469b-9b0a-1a0250fe5eb0','7ad3fcb2-3b22-4e61-abb1-1964b5f03e96',400,'2024-06-06 11:06:16','Completed',NULL,'this is for you baby'),(42,'rhjktur','dgkdgukud','23e81d1d-dcfe-469b-9b0a-1a0250fe5eb0','7ad3fcb2-3b22-4e61-abb1-1964b5f03e96',400,'2024-06-06 11:06:16','Completed',NULL,'this is for you baby'),(43,'rhjktur','dgkdgukud','23e81d1d-dcfe-469b-9b0a-1a0250fe5eb0','7ad3fcb2-3b22-4e61-abb1-1964b5f03e96',400,'2024-06-06 11:06:17','Completed',NULL,'this is for you baby'),(44,'dgkdgukud','rhjktur','7ad3fcb2-3b22-4e61-abb1-1964b5f03e96','23e81d1d-dcfe-469b-9b0a-1a0250fe5eb0',400,'2024-06-06 11:08:48','Completed',NULL,'suck it'),(45,'dgkdgukud','rhjktur','7ad3fcb2-3b22-4e61-abb1-1964b5f03e96','23e81d1d-dcfe-469b-9b0a-1a0250fe5eb0',1400,'2024-06-06 11:09:24','Completed',NULL,'you suck what ?'),(46,'dgkdgukud','rhjktur','7ad3fcb2-3b22-4e61-abb1-1964b5f03e96','23e81d1d-dcfe-469b-9b0a-1a0250fe5eb0',1400,'2024-06-06 11:09:43','Completed',NULL,'suck it'),(47,'dgkdgukud','rhjktur','7ad3fcb2-3b22-4e61-abb1-1964b5f03e96','23e81d1d-dcfe-469b-9b0a-1a0250fe5eb0',1400,'2024-06-06 11:10:18','Completed',NULL,'tototo'),(48,'dgkdgukud','rhjktur','7ad3fcb2-3b22-4e61-abb1-1964b5f03e96','23e81d1d-dcfe-469b-9b0a-1a0250fe5eb0',1400,'2024-06-06 11:10:41','Completed',NULL,'tototo'),(49,'dgkdgukud','rhjktur','7ad3fcb2-3b22-4e61-abb1-1964b5f03e96','23e81d1d-dcfe-469b-9b0a-1a0250fe5eb0',1400,'2024-06-06 11:11:04','Completed',NULL,'kaka'),(50,'dgkdgukud','rhjktur','7ad3fcb2-3b22-4e61-abb1-1964b5f03e96','23e81d1d-dcfe-469b-9b0a-1a0250fe5eb0',1400000000000,'2024-06-06 11:14:22','Failed','Insufficient funds',NULL),(51,'dgkdgukud','rhjktur','7ad3fcb2-3b22-4e61-abb1-1964b5f03e96','23e81d1d-dcfe-469b-9b0a-1a0250fe5eb0',14,'2024-06-06 11:15:59','Completed',NULL,'kaka'),(52,'dgkdgukud','rhjktur','7ad3fcb2-3b22-4e61-abb1-1964b5f03e96','23e81d1d-dcfe-469b-9b0a-1a0250fe5eb0',14,'2024-06-06 11:17:08','Completed',NULL,'kaka'),(53,'dgkdgukud','rhjktur','7ad3fcb2-3b22-4e61-abb1-1964b5f03e96','23e81d1d-dcfe-469b-9b0a-1a0250fe5eb0',14,'2024-06-06 11:17:26','Completed',NULL,'kaka'),(54,'dgkdgukud','rhjktur','7ad3fcb2-3b22-4e61-abb1-1964b5f03e96','23e81d1d-dcfe-469b-9b0a-1a0250fe5eb0',14,'2024-06-06 11:17:37','Completed',NULL,'kaka'),(55,'dgkdgukud','rhjktur','7ad3fcb2-3b22-4e61-abb1-1964b5f03e96','23e81d1d-dcfe-469b-9b0a-1a0250fe5eb0',14,'2024-06-06 11:18:00','Completed',NULL,'kaka'),(56,'dgkdgukud','rhjktur','7ad3fcb2-3b22-4e61-abb1-1964b5f03e96','23e81d1d-dcfe-469b-9b0a-1a0250fe5eb0',14,'2024-06-06 11:18:18','Completed',NULL,'kaka'),(57,'dgkdgukud','rhjktur','7ad3fcb2-3b22-4e61-abb1-1964b5f03e96','23e81d1d-dcfe-469b-9b0a-1a0250fe5eb0',14,'2024-06-06 11:19:11','Completed',NULL,'kaka'),(58,'rhjktur','dgkdgukud','23e81d1d-dcfe-469b-9b0a-1a0250fe5eb0','7ad3fcb2-3b22-4e61-abb1-1964b5f03e96',14,'2024-06-06 11:31:23','Completed',NULL,'kaka'),(59,'dgkdgukud','rhjktur','7ad3fcb2-3b22-4e61-abb1-1964b5f03e96','23e81d1d-dcfe-469b-9b0a-1a0250fe5eb0',14,'2024-06-06 11:32:38','Completed',NULL,'kaka'),(60,'rhjktur','dgkdgukud','23e81d1d-dcfe-469b-9b0a-1a0250fe5eb0','7ad3fcb2-3b22-4e61-abb1-1964b5f03e96',14,'2024-06-06 11:32:38','Completed',NULL,'kaka'),(61,'rhjktur','dgkdgukud','23e81d1d-dcfe-469b-9b0a-1a0250fe5eb0','7ad3fcb2-3b22-4e61-abb1-1964b5f03e96',14,'2024-06-06 11:32:59','Completed',NULL,'kaka'),(62,'dgkdgukud','rhjktur','7ad3fcb2-3b22-4e61-abb1-1964b5f03e96','23e81d1d-dcfe-469b-9b0a-1a0250fe5eb0',14,'2024-06-06 11:33:26','Completed',NULL,'kaka'),(63,'rhjktur','dgkdgukud','23e81d1d-dcfe-469b-9b0a-1a0250fe5eb0','7ad3fcb2-3b22-4e61-abb1-1964b5f03e96',14,'2024-06-06 11:33:26','Completed',NULL,'kaka'),(64,'dgkdgukud','rhjktur','7ad3fcb2-3b22-4e61-abb1-1964b5f03e96','23e81d1d-dcfe-469b-9b0a-1a0250fe5eb0',14,'2024-06-06 11:33:46','Completed',NULL,'kaka'),(65,'rhjktur','dgkdgukud','23e81d1d-dcfe-469b-9b0a-1a0250fe5eb0','7ad3fcb2-3b22-4e61-abb1-1964b5f03e96',14,'2024-06-06 11:33:46','Completed',NULL,'kaka'),(66,'rhjktur','dgkdgukud','23e81d1d-dcfe-469b-9b0a-1a0250fe5eb0','7ad3fcb2-3b22-4e61-abb1-1964b5f03e96',14,'2024-06-06 11:34:09','Completed',NULL,'kaka'),(67,'rhjktur','dgkdgukud','23e81d1d-dcfe-469b-9b0a-1a0250fe5eb0','7ad3fcb2-3b22-4e61-abb1-1964b5f03e96',14,'2024-06-06 11:34:19','Completed',NULL,'kaka'),(68,'rhjktur','dgkdgukud','23e81d1d-dcfe-469b-9b0a-1a0250fe5eb0','7ad3fcb2-3b22-4e61-abb1-1964b5f03e96',14,'2024-06-06 11:34:21','Failed','Insufficient funds',NULL),(69,'rhjktur','dgkdgukud','23e81d1d-dcfe-469b-9b0a-1a0250fe5eb0','7ad3fcb2-3b22-4e61-abb1-1964b5f03e96',14,'2024-06-06 11:34:49','Completed',NULL,'kaka'),(70,'dgkdgukud','rhjktur','7ad3fcb2-3b22-4e61-abb1-1964b5f03e96','23e81d1d-dcfe-469b-9b0a-1a0250fe5eb0',14,'2024-06-06 11:34:50','Completed',NULL,'kaka'),(71,'rhjktur','dgkdgukud','23e81d1d-dcfe-469b-9b0a-1a0250fe5eb0','7ad3fcb2-3b22-4e61-abb1-1964b5f03e96',14,'2024-06-06 11:35:32','Completed',NULL,'kaka'),(72,'dgkdgukud','rhjktur','7ad3fcb2-3b22-4e61-abb1-1964b5f03e96','23e81d1d-dcfe-469b-9b0a-1a0250fe5eb0',14,'2024-06-06 11:35:45','Completed',NULL,'kaka'),(73,'dgkdgukud','rhjktur','7ad3fcb2-3b22-4e61-abb1-1964b5f03e96','23e81d1d-dcfe-469b-9b0a-1a0250fe5eb0',14,'2024-06-06 11:36:00','Completed',NULL,'kaka'),(74,'rhjktur','dgkdgukud','23e81d1d-dcfe-469b-9b0a-1a0250fe5eb0','7ad3fcb2-3b22-4e61-abb1-1964b5f03e96',14,'2024-06-06 11:36:48','Completed',NULL,'kaka'),(75,'dgkdgukud','rhjktur','7ad3fcb2-3b22-4e61-abb1-1964b5f03e96','23e81d1d-dcfe-469b-9b0a-1a0250fe5eb0',106,'2024-06-06 11:36:48','Completed',NULL,'kaka'),(76,'dgkdgukud','rhjktur','7ad3fcb2-3b22-4e61-abb1-1964b5f03e96','23e81d1d-dcfe-469b-9b0a-1a0250fe5eb0',106,'2024-06-06 11:37:32','Completed',NULL,'kaka'),(77,'rhjktur','dgkdgukud','23e81d1d-dcfe-469b-9b0a-1a0250fe5eb0','7ad3fcb2-3b22-4e61-abb1-1964b5f03e96',100,'2024-06-06 11:39:09','Completed',NULL,'kaka'),(78,'dgkdgukud','rhjktur','7ad3fcb2-3b22-4e61-abb1-1964b5f03e96','23e81d1d-dcfe-469b-9b0a-1a0250fe5eb0',100,'2024-06-06 11:39:09','Completed',NULL,'kaka'),(79,'rhjktur','dgkdgukud','23e81d1d-dcfe-469b-9b0a-1a0250fe5eb0','7ad3fcb2-3b22-4e61-abb1-1964b5f03e96',15,'2024-06-06 11:39:50','Completed',NULL,'kaka'),(80,'dgkdgukud','rhjktur','7ad3fcb2-3b22-4e61-abb1-1964b5f03e96','23e81d1d-dcfe-469b-9b0a-1a0250fe5eb0',30,'2024-06-06 11:39:50','Completed',NULL,'kaka'),(81,'rhjktur','dgkdgukud','23e81d1d-dcfe-469b-9b0a-1a0250fe5eb0','7ad3fcb2-3b22-4e61-abb1-1964b5f03e96',15,'2024-06-06 11:40:59','Completed',NULL,'kaka'),(82,'dgkdgukud','rhjktur','7ad3fcb2-3b22-4e61-abb1-1964b5f03e96','23e81d1d-dcfe-469b-9b0a-1a0250fe5eb0',30,'2024-06-06 11:40:59','Completed',NULL,'kaka'),(83,'rhjktur','dgkdgukud','23e81d1d-dcfe-469b-9b0a-1a0250fe5eb0','7ad3fcb2-3b22-4e61-abb1-1964b5f03e96',2,'2024-06-06 11:42:15','Completed',NULL,'kaka'),(84,'dgkdgukud','rhjktur','7ad3fcb2-3b22-4e61-abb1-1964b5f03e96','23e81d1d-dcfe-469b-9b0a-1a0250fe5eb0',1,'2024-06-06 11:42:15','Completed',NULL,'kaka'),(85,'rhjktur','dgkdgukud','23e81d1d-dcfe-469b-9b0a-1a0250fe5eb0','7ad3fcb2-3b22-4e61-abb1-1964b5f03e96',2,'2024-06-06 11:42:44','Completed',NULL,'kaka'),(86,'dgkdgukud','rhjktur','7ad3fcb2-3b22-4e61-abb1-1964b5f03e96','23e81d1d-dcfe-469b-9b0a-1a0250fe5eb0',1,'2024-06-06 11:42:44','Completed',NULL,'kaka'),(87,'rhjktur','dgkdgukud','23e81d1d-dcfe-469b-9b0a-1a0250fe5eb0','7ad3fcb2-3b22-4e61-abb1-1964b5f03e96',600,'2024-06-06 11:43:40','Completed',NULL,'kaka'),(88,'dgkdgukud','rhjktur','7ad3fcb2-3b22-4e61-abb1-1964b5f03e96','23e81d1d-dcfe-469b-9b0a-1a0250fe5eb0',500,'2024-06-06 11:43:40','Completed',NULL,'kaka'),(89,'dgkdgukud','rhjktur','7ad3fcb2-3b22-4e61-abb1-1964b5f03e96','23e81d1d-dcfe-469b-9b0a-1a0250fe5eb0',500,'2024-06-06 11:52:56','Completed',NULL,'kaka');
/*!40000 ALTER TABLE `credits_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items_assets`
--

DROP TABLE IF EXISTS `items_assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `items_assets` (
  `asset_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `asset_name` varchar(255) NOT NULL,
  `price` bigint NOT NULL,
  `icon` text NOT NULL,
  PRIMARY KEY (`asset_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items_assets`
--

LOCK TABLES `items_assets` WRITE;
/*!40000 ALTER TABLE `items_assets` DISABLE KEYS */;
/*!40000 ALTER TABLE `items_assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `private_message`
--

DROP TABLE IF EXISTS `private_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `private_message` (
  `message_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `sender_user_id` bigint NOT NULL,
  `receiver_user_id` bigint NOT NULL,
  `sender_username` varchar(255) NOT NULL,
  `receiver_user_name` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `private_message`
--

LOCK TABLES `private_message` WRITE;
/*!40000 ALTER TABLE `private_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `private_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `public_chat`
--

DROP TABLE IF EXISTS `public_chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `public_chat` (
  `message_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `username` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `message` text NOT NULL,
  `reply_to_username` varchar(255) NOT NULL,
  `reply_to_user_id` bigint NOT NULL,
  PRIMARY KEY (`message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `public_chat`
--

LOCK TABLES `public_chat` WRITE;
/*!40000 ALTER TABLE `public_chat` DISABLE KEYS */;
/*!40000 ALTER TABLE `public_chat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reputation_logs`
--

DROP TABLE IF EXISTS `reputation_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reputation_logs` (
  `reputation_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `sender_user_id` bigint NOT NULL,
  `receiver_user_id` bigint NOT NULL,
  `amount` bigint NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `title` varchar(255) NOT NULL,
  `sender_username` varchar(255) NOT NULL,
  `receiver_username` varchar(255) NOT NULL,
  PRIMARY KEY (`reputation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reputation_logs`
--

LOCK TABLES `reputation_logs` WRITE;
/*!40000 ALTER TABLE `reputation_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `reputation_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site_status`
--

DROP TABLE IF EXISTS `site_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `site_status` (
  `online_users` bigint unsigned NOT NULL AUTO_INCREMENT,
  `offline_users` bigint NOT NULL,
  `total_threads` bigint NOT NULL,
  `total_posts` bigint NOT NULL,
  `total_users` bigint NOT NULL,
  `total_banned_users` bigint NOT NULL,
  `total_suspended_users` bigint NOT NULL,
  `total_admins` bigint NOT NULL,
  `total_moderators` bigint NOT NULL,
  `newst_member` varchar(255) NOT NULL,
  `total_categories` bigint NOT NULL,
  `total_categorie_columns` bigint NOT NULL,
  `total_deleted_threads` bigint NOT NULL,
  `total_hidden_threads` bigint NOT NULL,
  `total_deleted_posts` bigint NOT NULL,
  `total_hidden_posts` bigint NOT NULL,
  PRIMARY KEY (`online_users`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_status`
--

LOCK TABLES `site_status` WRITE;
/*!40000 ALTER TABLE `site_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `site_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_credit_purchase`
--

DROP TABLE IF EXISTS `system_credit_purchase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_credit_purchase` (
  `transaction_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `username` bigint NOT NULL,
  `amount` bigint NOT NULL,
  `currency` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `transaction_status` varchar(255) NOT NULL,
  `failed_reason` varchar(255) NOT NULL,
  PRIMARY KEY (`transaction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_credit_purchase`
--

LOCK TABLES `system_credit_purchase` WRITE;
/*!40000 ALTER TABLE `system_credit_purchase` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_credit_purchase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_daily_credit`
--

DROP TABLE IF EXISTS `system_daily_credit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_daily_credit` (
  `system_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `amount` bigint NOT NULL,
  `reciever_user_id` bigint NOT NULL,
  `reciever_username` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isAllowed` tinyint NOT NULL,
  `reason` varchar(255) NOT NULL,
  PRIMARY KEY (`system_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_daily_credit`
--

LOCK TABLES `system_daily_credit` WRITE;
/*!40000 ALTER TABLE `system_daily_credit` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_daily_credit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_reputation`
--

DROP TABLE IF EXISTS `system_reputation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_reputation` (
  `reputation_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `reason` varchar(255) NOT NULL,
  `amount` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `username` varchar(255) NOT NULL,
  `created_at` bigint NOT NULL,
  PRIMARY KEY (`reputation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_reputation`
--

LOCK TABLES `system_reputation` WRITE;
/*!40000 ALTER TABLE `system_reputation` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_reputation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thread`
--

DROP TABLE IF EXISTS `thread`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thread` (
  `thread_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `thread_status` varchar(255) NOT NULL,
  `thread_content` text NOT NULL,
  `thread_title` varchar(255) NOT NULL,
  `column` varchar(255) NOT NULL,
  `categorie` varchar(255) NOT NULL,
  `posts_count` bigint NOT NULL,
  PRIMARY KEY (`thread_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thread`
--

LOCK TABLES `thread` WRITE;
/*!40000 ALTER TABLE `thread` DISABLE KEYS */;
/*!40000 ALTER TABLE `thread` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `pwd` varchar(255) NOT NULL,
  `email_address` varchar(255) NOT NULL,
  `user_address` varchar(36) DEFAULT NULL,
  `joined_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `total_threads` bigint NOT NULL,
  `total_posts` bigint NOT NULL,
  `role` varchar(255) NOT NULL,
  `is_banned` tinyint NOT NULL,
  `is_suspended` tinyint NOT NULL,
  `susp_days` bigint NOT NULL,
  `susp_Hours` bigint NOT NULL,
  `total_messages_recived` bigint NOT NULL,
  `suspenssion_reason` varchar(255) DEFAULT NULL,
  `banned_reason` varchar(255) DEFAULT NULL,
  `current_messages` bigint NOT NULL,
  `credits` bigint NOT NULL,
  `reputation` bigint NOT NULL,
  `ipv4_address` varchar(15) DEFAULT NULL,
  `ipv6_address` varchar(39) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_username_unique` (`username`),
  UNIQUE KEY `user_email_address_unique` (`email_address`),
  UNIQUE KEY `user_address` (`user_address`),
  UNIQUE KEY `user_address_2` (`user_address`),
  UNIQUE KEY `user_address_3` (`user_address`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'rhjktur','$2b$10$A335aLK1Id8WZoPTdjHmD.UlJj.nbnENYnfaA4xK24LmtiWpl3132','blidasjkldfg@gmail.com','23e81d1d-dcfe-469b-9b0a-1a0250fe5eb0','2024-06-06 03:17:43',0,0,'user',0,0,0,0,0,NULL,NULL,0,1900,0,NULL,NULL),(2,'dgkdgukud','$2b$10$1j5zb8A6UtUfWPY9FfvjS.RHaOk6he1IPlgWr1quxrjblsWM.h5Ae','dkudglghul@gmail.com','7ad3fcb2-3b22-4e61-abb1-1964b5f03e96','2024-06-06 03:36:36',0,0,'user',0,0,0,0,0,NULL,NULL,0,1100,0,NULL,NULL),(6,'zurd','$2b$10$yjdDuZixO798a2JjsOOEkO.pxVyYQG7V5aa7umYFzD5fqtJbxODIa','zurd@gmail.com','6958ff25-aa5a-4447-ade9-f700fefa0dfb','2024-06-06 11:48:15',0,0,'user',0,0,0,0,0,NULL,NULL,0,0,0,NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_notification`
--

DROP TABLE IF EXISTS `user_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_notification` (
  `notification_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `reciever_username` varchar(255) NOT NULL,
  `reciever_user_id` bigint NOT NULL,
  `sender_username` varchar(255) NOT NULL,
  `sender_user_id` bigint NOT NULL,
  `created_at` bigint NOT NULL,
  `content` text NOT NULL,
  PRIMARY KEY (`notification_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_notification`
--

LOCK TABLES `user_notification` WRITE;
/*!40000 ALTER TABLE `user_notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usernames_assets`
--

DROP TABLE IF EXISTS `usernames_assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usernames_assets` (
  `username_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` varchar(255) NOT NULL,
  `buy_username` varchar(255) NOT NULL,
  `user_id` bigint NOT NULL,
  `price` bigint NOT NULL,
  `status` varchar(255) NOT NULL,
  PRIMARY KEY (`username_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usernames_assets`
--

LOCK TABLES `usernames_assets` WRITE;
/*!40000 ALTER TABLE `usernames_assets` DISABLE KEYS */;
/*!40000 ALTER TABLE `usernames_assets` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-06 12:55:29
