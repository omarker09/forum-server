CREATE DATABASE  IF NOT EXISTS `zurd_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `zurd_db`;
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

DROP TABLE IF EXISTS categories;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE categories (
  category_id bigint unsigned NOT NULL AUTO_INCREMENT,
  category_name bigint NOT NULL,
  category_columns bigint NOT NULL,
  created_at timestamp NOT NULL,
  PRIMARY KEY (category_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `columns`
--

DROP TABLE IF EXISTS columns;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `columns` (
  column_id bigint unsigned NOT NULL AUTO_INCREMENT,
  `column_name` varchar(255) NOT NULL,
  threads_count bigint NOT NULL,
  posts_count bigint NOT NULL,
  last_thread_title varchar(255) NOT NULL,
  last_thread_user varchar(255) NOT NULL,
  PRIMARY KEY (column_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `credits_transactions`
--

DROP TABLE IF EXISTS credits_transactions;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE credits_transactions (
  transaction_id bigint NOT NULL AUTO_INCREMENT,
  sender_username varchar(255) NOT NULL,
  receiver_username varchar(255) NOT NULL,
  sender_user_address varchar(36) NOT NULL,
  receiver_user_address varchar(36) NOT NULL,
  amount bigint NOT NULL,
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  transaction_status varchar(255) NOT NULL,
  failed_reason varchar(255) DEFAULT NULL,
  transaction_message varchar(255) DEFAULT NULL,
  PRIMARY KEY (transaction_id)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `items_assets`
--

DROP TABLE IF EXISTS items_assets;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE items_assets (
  asset_id bigint unsigned NOT NULL AUTO_INCREMENT,
  asset_name varchar(255) NOT NULL,
  price bigint NOT NULL,
  icon text NOT NULL,
  PRIMARY KEY (asset_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `private_message`
--

DROP TABLE IF EXISTS private_message;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE private_message (
  message_id bigint unsigned NOT NULL AUTO_INCREMENT,
  sender_user_id bigint NOT NULL,
  receiver_user_id bigint NOT NULL,
  sender_username varchar(255) NOT NULL,
  receiver_user_name varchar(255) NOT NULL,
  message text NOT NULL,
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (message_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `public_chat`
--

DROP TABLE IF EXISTS public_chat;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE public_chat (
  message_id bigint unsigned NOT NULL AUTO_INCREMENT,
  user_id bigint NOT NULL,
  username varchar(255) NOT NULL,
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  message text NOT NULL,
  reply_to_username varchar(255) NOT NULL,
  reply_to_user_id bigint NOT NULL,
  PRIMARY KEY (message_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reputation_logs`
--

DROP TABLE IF EXISTS reputation_logs;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE reputation_logs (
  reputation_id bigint unsigned NOT NULL AUTO_INCREMENT,
  sender_user_id bigint NOT NULL,
  receiver_user_id bigint NOT NULL,
  amount bigint NOT NULL,
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  title varchar(255) NOT NULL,
  sender_username varchar(255) NOT NULL,
  receiver_username varchar(255) NOT NULL,
  PRIMARY KEY (reputation_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `site_status`
--

DROP TABLE IF EXISTS site_status;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE site_status (
  online_users bigint unsigned NOT NULL AUTO_INCREMENT,
  offline_users bigint NOT NULL,
  total_threads bigint NOT NULL,
  total_posts bigint NOT NULL,
  total_users bigint NOT NULL,
  total_banned_users bigint NOT NULL,
  total_suspended_users bigint NOT NULL,
  total_admins bigint NOT NULL,
  total_moderators bigint NOT NULL,
  newst_member varchar(255) NOT NULL,
  total_categories bigint NOT NULL,
  total_categorie_columns bigint NOT NULL,
  total_deleted_threads bigint NOT NULL,
  total_hidden_threads bigint NOT NULL,
  total_deleted_posts bigint NOT NULL,
  total_hidden_posts bigint NOT NULL,
  PRIMARY KEY (online_users)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `system_credit_purchase`
--

DROP TABLE IF EXISTS system_credit_purchase;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE system_credit_purchase (
  transaction_id bigint unsigned NOT NULL AUTO_INCREMENT,
  user_id bigint NOT NULL,
  username bigint NOT NULL,
  amount bigint NOT NULL,
  currency varchar(255) NOT NULL,
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  transaction_status varchar(255) NOT NULL,
  failed_reason varchar(255) NOT NULL,
  PRIMARY KEY (transaction_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `system_daily_credit`
--

DROP TABLE IF EXISTS system_daily_credit;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE system_daily_credit (
  system_id bigint unsigned NOT NULL AUTO_INCREMENT,
  amount bigint NOT NULL,
  reciever_user_id bigint NOT NULL,
  reciever_username varchar(255) NOT NULL,
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  isAllowed tinyint NOT NULL,
  reason varchar(255) NOT NULL,
  PRIMARY KEY (system_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `system_reputation`
--

DROP TABLE IF EXISTS system_reputation;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE system_reputation (
  reputation_id bigint unsigned NOT NULL AUTO_INCREMENT,
  reason varchar(255) NOT NULL,
  amount bigint NOT NULL,
  user_id bigint NOT NULL,
  username varchar(255) NOT NULL,
  created_at bigint NOT NULL,
  PRIMARY KEY (reputation_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `test`
--

DROP TABLE IF EXISTS test;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE test (
  user_id int NOT NULL AUTO_INCREMENT,
  UNIQUE KEY user_id (user_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `thread`
--

DROP TABLE IF EXISTS thread;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE thread (
  thread_id bigint NOT NULL AUTO_INCREMENT,
  user_id bigint unsigned NOT NULL,
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  thread_status varchar(255) NOT NULL,
  thread_content mediumtext NOT NULL,
  thread_title varchar(255) NOT NULL,
  `column_name` varchar(255) NOT NULL,
  categorie varchar(255) NOT NULL,
  posts_count bigint NOT NULL,
  PRIMARY KEY (thread_id),
  KEY user_id (user_id),
  CONSTRAINT thread_ibfk_1 FOREIGN KEY (user_id) REFERENCES `user` (user_id)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS user;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  user_id bigint unsigned NOT NULL AUTO_INCREMENT,
  username varchar(255) NOT NULL,
  pwd varchar(255) NOT NULL,
  email_address varchar(255) NOT NULL,
  user_address varchar(36) DEFAULT NULL,
  joined_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  total_threads bigint NOT NULL,
  total_posts bigint NOT NULL,
  `role` varchar(255) NOT NULL,
  is_banned tinyint NOT NULL,
  is_suspended tinyint NOT NULL,
  susp_days bigint NOT NULL,
  susp_Hours bigint NOT NULL,
  total_messages_recived bigint NOT NULL,
  suspenssion_reason varchar(255) DEFAULT NULL,
  banned_reason varchar(255) DEFAULT NULL,
  current_messages bigint NOT NULL,
  credits bigint NOT NULL,
  reputation bigint NOT NULL,
  ipv4_address varchar(15) DEFAULT NULL,
  ipv6_address varchar(39) DEFAULT NULL,
  PRIMARY KEY (user_id),
  UNIQUE KEY user_username_unique (username),
  UNIQUE KEY user_email_address_unique (email_address),
  UNIQUE KEY user_address (user_address),
  UNIQUE KEY user_address_2 (user_address),
  UNIQUE KEY user_address_3 (user_address)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_notification`
--

DROP TABLE IF EXISTS user_notification;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE user_notification (
  notification_id bigint unsigned NOT NULL AUTO_INCREMENT,
  user_id bigint NOT NULL,
  reciever_username varchar(255) NOT NULL,
  reciever_user_id bigint NOT NULL,
  sender_username varchar(255) NOT NULL,
  sender_user_id bigint NOT NULL,
  created_at bigint NOT NULL,
  content text NOT NULL,
  PRIMARY KEY (notification_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usernames_assets`
--

DROP TABLE IF EXISTS usernames_assets;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE usernames_assets (
  username_id bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  created_at varchar(255) NOT NULL,
  buy_username varchar(255) NOT NULL,
  user_id bigint NOT NULL,
  price bigint NOT NULL,
  `status` varchar(255) NOT NULL,
  PRIMARY KEY (username_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-19 17:03:57
