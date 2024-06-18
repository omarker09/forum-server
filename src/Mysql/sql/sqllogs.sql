---------------------------user

-- reset the user auto_increment
use zurd_db;
ALTER TABLE user AUTO_INCREMENT = 1;
select * from user;

-- renaming things
alter table credits_transactions
RENAME COLUMN receiver_user_id to receiver_user_address;

-- Change any column position 
ALTER TABLE table_name MODIFY password varchar(20) AFTER id

INSERT INTO credits_transactions (sender_username,receiver_username,sender_user_address,receiver_user_address,amount,transaction_status,failed_reason,transaction_message)
VALUES ("zurd", "bali", "fgsjsfgjsfgjsfkg", "fsgjsfgjsfgjs", 500, "completed", "", "hi baby");

Error Code: 1062. Duplicate entry 'fgsjsfgjsfgjsfkg' for key 'credits_transactions.sender_user_address'

insert into thread (user_id,thread_status,thread_content,thread_title,column_name,categorie,posts_count)
values (1, "Completed", "fjdghkdgh dghkd ghkdghk dghk", "hacking", "Cracking & Hacks", "Hacking", 1);

-- Perform the join
SELECT * FROM user INNER JOIN thread ON thread.user_id = user.user_id;

CREATE TABLE `user`(
    `user_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `username` VARCHAR(255) NOT NULL UNIQUE,
    `pwd` VARCHAR(255) NOT NULL,
    `email_address` VARCHAR(255) NOT NULL,
    `joined_at` timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
    `total_threads` BIGINT NOT NULL,
    `total_posts` BIGINT NOT NULL,
    `role` VARCHAR(255) NOT NULL,
    `is_banned` TINYINT NOT NULL,
    `is_suspended` TINYINT NOT NULL,
    `susp_days` BIGINT NOT NULL,
    `susp_Hours` BIGINT NOT NULL,
    `total_messages_recived` BIGINT NOT NULL,
    `suspenssion_reason` VARCHAR(255),
    `banned_reason` VARCHAR(255),
    `current_messages` BIGINT NOT NULL,
    `credits` BIGINT NOT NULL,
    `reputation` BIGINT NOT NULL,
    `ipv4_address` VARCHAR(15),
    `ipv6_address` VARCHAR(39)
);

SELECT * FROM zurd_db.user;
insert into user (username,pwd,email_address,user_address,total_threads,total_posts,role,is_banned,is_suspended,susp_days,susp_Hours,total_messages_recived,current_messages,credits,reputation)
value ("zurd3", "zurd123", "zurd3@mail.com", "123e4567-e89b-12d3-a456-426614174000", 0,0,"owner",0,0,0,0,0,0,0,0);
SELECT * FROM zurd_db.user;

-----------------------------------------------

CREATE TABLE `columns`(
    `column_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `column_name` VARCHAR(255) NOT NULL,
    `threads_count` BIGINT NOT NULL,
    `posts_count` BIGINT NOT NULL,
    `last_thread_title` VARCHAR(255) NOT NULL,
    `last_thread_user` VARCHAR(255) NOT NULL
);
CREATE TABLE `public_chat`(
    `message_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `user_id` BIGINT NOT NULL,
    `username` VARCHAR(255) NOT NULL,
    `created_at` timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
    `message` TEXT NOT NULL,
    `reply_to_username` VARCHAR(255) NOT NULL,
    `reply_to_user_id` BIGINT NOT NULL
);
CREATE TABLE `reputation_logs`(
    `reputation_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `sender_user_id` BIGINT NOT NULL,
    `receiver_user_id` BIGINT NOT NULL,
    `amount` BIGINT NOT NULL,
    `created_at` timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
    `title` VARCHAR(255) NOT NULL,
    `sender_username` VARCHAR(255) NOT NULL,
    `receiver_username` VARCHAR(255) NOT NULL
);
CREATE TABLE `usernames_assets`(
    `username_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL,
    `created_at` VARCHAR(255) NOT NULL,
    `buy_username` VARCHAR(255) NOT NULL,
    `user_id` BIGINT NOT NULL,
    `price` BIGINT NOT NULL,
    `status` VARCHAR(255) NOT NULL
);
CREATE TABLE `thread` (
    `thread_id` BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `user_id` BIGINT unsigned NOT NULL,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    `thread_status` VARCHAR(255) NOT NULL,
    `thread_content` TEXT NOT NULL,
    `thread_title` VARCHAR(255) NOT NULL,
    `column` VARCHAR(255) NOT NULL,
    `categorie` VARCHAR(255) NOT NULL,
    `posts_count` BIGINT NOT NULL,
    FOREIGN KEY (`user_id`) REFERENCES `user`(`user_id`)
);
CREATE TABLE `system_credit_purchase`(
    `transaction_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `user_id` BIGINT NOT NULL,
    `username` BIGINT NOT NULL,
    `amount` BIGINT NOT NULL,
    `currency` VARCHAR(255) NOT NULL,
    `created_at` timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
    `transaction_status` VARCHAR(255) NOT NULL,
    `failed_reason` VARCHAR(255) NOT NULL
);
CREATE TABLE `categories`(
    `category_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `category_name` BIGINT NOT NULL,
    `category_columns` BIGINT NOT NULL,
    `created_at` TIMESTAMP NOT NULL
);
CREATE TABLE `user`(
    `user_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `username` VARCHAR(255) NOT NULL,
    `pwd` VARCHAR(255) NOT NULL,
    `email_address` VARCHAR(255) NOT NULL,
    `joined_at` timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
    `total_threads` BIGINT NOT NULL,
    `total_posts` BIGINT NOT NULL,
    `role` VARCHAR(255) NOT NULL,
    `is_banned` TINYINT NOT NULL,
    `is_suspended` TINYINT NOT NULL,
    `susp_days` BIGINT NOT NULL,
    `susp_Hours` BIGINT NOT NULL,
    `total_messages_recived` BIGINT NOT NULL,
    `suspenssion_reason` VARCHAR(255),
    `banned_reason` VARCHAR(255),
    `current_messages` BIGINT NOT NULL,
    `credits` BIGINT NOT NULL,
    `reputation` BIGINT NOT NULL,
    `ipv4_address` VARCHAR(15),
    `ipv6_address` VARCHAR(39)
);
ALTER TABLE
    `user` ADD UNIQUE `user_username_unique`(`username`);
ALTER TABLE
    `user` ADD UNIQUE `user_email_address_unique`(`email_address`);
CREATE TABLE `items_assets`(
    `asset_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `asset_name` VARCHAR(255) NOT NULL,
    `price` BIGINT NOT NULL,
    `icon` TEXT NOT NULL
);
CREATE TABLE `system_daily_credit`(
    `system_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `amount` BIGINT NOT NULL,
    `reciever_user_id` BIGINT NOT NULL,
    `reciever_username` VARCHAR(255) NOT NULL,
    `created_at` timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
    `isAllowed` TINYINT NOT NULL,
    `reason` VARCHAR(255) NOT NULL
);
CREATE TABLE `user_notification`(
    `notification_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `user_id` BIGINT NOT NULL,
    `reciever_username` VARCHAR(255) NOT NULL,
    `reciever_user_id` BIGINT NOT NULL,
    `sender_username` VARCHAR(255) NOT NULL,
    `sender_user_id` BIGINT NOT NULL,
    `created_at` BIGINT NOT NULL,
    `content` TEXT NOT NULL
);
CREATE TABLE `system_reputation`(
    `reputation_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `reason` VARCHAR(255) NOT NULL,
    `amount` BIGINT NOT NULL,
    `user_id` BIGINT NOT NULL,
    `username` VARCHAR(255) NOT NULL,
    `created_at` BIGINT NOT NULL
);
CREATE TABLE `credits_transactions`(
    `transaction_id` BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `sender_username` VARCHAR(255) NOT NULL,
    `receiver_username` VARCHAR(255) NOT NULL,
    `sender_user_address` VARCHAR(36) NOT NULL,
    `receiver_user_address` VARCHAR(36) NOT NULL,
    `amount` BIGINT NOT NULL,
    `created_at` timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
    `transaction_status` VARCHAR(255) NOT NULL,
    `failed_reason` VARCHAR(255) DEFAULT null,
    `transaction_message` VARCHAR(255) DEFAULT null
);
CREATE TABLE `private_message`(
    `message_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `sender_user_id` BIGINT NOT NULL,
    `receiver_user_id` BIGINT NOT NULL,
    `sender_username` VARCHAR(255) NOT NULL,
    `receiver_user_name` VARCHAR(255) NOT NULL,
    `message` TEXT NOT NULL,
    `created_at` timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL
);
CREATE TABLE `site_status`(
    `online_users` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `offline_users` BIGINT NOT NULL,
    `total_threads` BIGINT NOT NULL,
    `total_posts` BIGINT NOT NULL,
    `total_users` BIGINT NOT NULL,
    `total_banned_users` BIGINT NOT NULL,
    `total_suspended_users` BIGINT NOT NULL,
    `total_admins` BIGINT NOT NULL,
    `total_moderators` BIGINT NOT NULL,
    `newst_member` VARCHAR(255) NOT NULL,
    `total_categories` BIGINT NOT NULL,
    `total_categorie_columns` BIGINT NOT NULL,
    `total_deleted_threads` BIGINT NOT NULL,
    `total_hidden_threads` BIGINT NOT NULL,
    `total_deleted_posts` BIGINT NOT NULL,
    `total_hidden_posts` BIGINT NOT NULL
);