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
  `credit_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `sender_username` varchar(255) NOT NULL,
  `receiver_username` varchar(255) NOT NULL,
  `sender_user_id` bigint NOT NULL,
  `receiver_user_id` bigint NOT NULL,
  `amount` bigint NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `transaction_status` varchar(255) NOT NULL,
  `failed_reason` varchar(255) NOT NULL,
  `transaction_message` varchar(255) NOT NULL,
  PRIMARY KEY (`credit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credits_transactions`
--

LOCK TABLES `credits_transactions` WRITE;
/*!40000 ALTER TABLE `credits_transactions` DISABLE KEYS */;
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
  UNIQUE KEY `user_email_address_unique` (`email_address`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'zurd','zurd123','zurd@mail.com','2024-06-04 06:14:19',0,0,'owner',0,0,0,0,0,NULL,NULL,0,0,0,NULL,NULL),(2,'blobo','blobo01','blobo01@mail.com','2024-06-04 06:42:17',0,0,'user',0,0,0,0,0,NULL,NULL,0,0,0,NULL,NULL),(4,'blobogh','blobo01','blobo01f@mail.com','2024-06-04 06:43:55',0,0,'user',0,0,0,0,0,NULL,NULL,0,0,0,NULL,NULL),(6,'bloboghh','blobo01','blobo01fg@mail.com','2024-06-04 06:44:48',0,0,'user',0,0,0,0,0,NULL,NULL,0,0,0,NULL,NULL),(8,'bloboghhghdh','blobo01','blobo01fgdgh@mail.com','2024-06-04 06:46:09',0,0,'user',0,0,0,0,0,NULL,NULL,0,0,0,NULL,NULL),(9,'bloboghhghdhdfg','blobo01','blobo01fgfdgdgh@mail.com','2024-06-04 06:47:11',0,0,'user',0,0,0,0,0,NULL,NULL,0,0,0,NULL,NULL),(12,'gjkldfh','ghfkfk','komldfh@mail.com','2024-06-04 09:12:45',0,0,'user',0,0,0,0,0,NULL,NULL,0,0,0,NULL,NULL),(14,'blob','$2b$10$pkyiBYttpYoofMOHTjhwBOnU4XWkVTIfMYQDiR69LVeaAVX8a/bK6','komldfghjh@mail.com','2024-06-04 09:14:19',0,0,'user',0,0,0,0,0,NULL,NULL,0,0,0,NULL,NULL),(17,'blobfhj','$2b$10$dHT0DiX1kjJs7g0hJ5xmpOkVbm4eKyEFq1byGeEvzQ/Dy5lIOVZnK','komldfghjfghh@mail.com','2024-06-04 09:25:57',0,0,'user',0,0,0,0,0,NULL,NULL,0,0,0,NULL,NULL),(20,'blobfhjgfdsfgj','$2b$10$Qz7sbAo6QxnG8TN0m.cLq.8hRUp9AAHr9lx8sqpJJzOkJ..DSYXAu','komldfghjfghhmail.com','2024-06-04 09:32:16',0,0,'user',0,0,0,0,0,NULL,NULL,0,0,0,NULL,NULL),(25,'blobfhjgfdsdfsfgj','$2b$13$1Mj7INQ0FXYaAGfyzPVsje86fk2AkTsr7MGhIpUokbLmg.Qdn55FC','komldfghjfgh@hmail.com','2024-06-04 09:38:31',0,0,'user',0,0,0,0,0,NULL,NULL,0,0,0,NULL,NULL),(26,'zoro','$2b$13$j7WC/JoUVGB7Y4QgPwgk6eKl3DmP62BwId4RXlU97aU4PSzI.Stt.','zoro@gmail.com','2024-06-04 10:56:30',0,0,'user',0,0,0,0,0,NULL,NULL,0,0,0,NULL,NULL);
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

-- Dump completed on 2024-06-04 12:50:20
