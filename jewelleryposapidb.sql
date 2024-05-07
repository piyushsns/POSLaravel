-- MySQL dump 10.13  Distrib 8.3.0, for macos14.2 (arm64)
--
-- Host: localhost    Database: bagisto_pos
-- ------------------------------------------------------
-- Server version	8.3.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addresses` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `address_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_address_id` int unsigned DEFAULT NULL,
  `customer_id` int unsigned DEFAULT NULL COMMENT 'null if guest checkout',
  `cart_id` int unsigned DEFAULT NULL COMMENT 'only for cart_addresses',
  `order_id` int unsigned DEFAULT NULL COMMENT 'only for order_addresses',
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address1` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postcode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vat_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_address` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'only for customer_addresses',
  `use_for_shipping` tinyint(1) NOT NULL DEFAULT '0',
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `addresses_customer_id_foreign` (`customer_id`),
  KEY `addresses_cart_id_foreign` (`cart_id`),
  KEY `addresses_order_id_foreign` (`order_id`),
  KEY `addresses_parent_address_id_foreign` (`parent_address_id`),
  CONSTRAINT `addresses_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE CASCADE,
  CONSTRAINT `addresses_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `addresses_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `addresses_parent_address_id_foreign` FOREIGN KEY (`parent_address_id`) REFERENCES `addresses` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
INSERT INTO `addresses` VALUES (1,'cart_billing',NULL,11,14,NULL,'Piyush','Jain',NULL,'SNS SYSTEM PRIVATE LIMITED, GWALIOR','Near shitla mata ka mandir, haiderganj, mama ka bazaar',NULL,'Gwalior','MP','IN','474001','piyush.jain@snssystem.com','07000882662',NULL,0,1,NULL,'2024-05-06 08:20:14','2024-05-06 08:20:14'),(2,'cart_shipping',NULL,11,14,NULL,'Piyush','Jain',NULL,'SNS SYSTEM PRIVATE LIMITED, GWALIOR','Near shitla mata ka mandir, haiderganj, mama ka bazaar',NULL,'Gwalior','MP','IN','474001','piyush.jain@snssystem.com','07000882662',NULL,0,0,NULL,'2024-05-06 08:20:14','2024-05-06 08:20:14');
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_password_resets`
--

DROP TABLE IF EXISTS `admin_password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `admin_password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_password_resets`
--

LOCK TABLES `admin_password_resets` WRITE;
/*!40000 ALTER TABLE `admin_password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admins` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `api_token` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `role_id` int unsigned NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admins_email_unique` (`email`),
  UNIQUE KEY `admins_api_token_unique` (`api_token`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` VALUES (1,'Example','admin@example.com','$2y$10$EVfAUIj9CtPSyYsSPk.f8O1BnmWuT9qoTBn4scLjIN49.rG88MvLO','TizKFudE99rh37VJMntINt6vuVA73F7ZbkiubpAdWnQHzj059nSDcwO0jnDTAefY8aJmnkgHnvbUdqNM',1,1,NULL,NULL,'2024-05-06 07:57:04','2024-05-06 07:57:04');
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribute_families`
--

DROP TABLE IF EXISTS `attribute_families`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attribute_families` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `is_user_defined` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_families`
--

LOCK TABLES `attribute_families` WRITE;
/*!40000 ALTER TABLE `attribute_families` DISABLE KEYS */;
INSERT INTO `attribute_families` VALUES (1,'default','Default',0,1);
/*!40000 ALTER TABLE `attribute_families` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribute_group_mappings`
--

DROP TABLE IF EXISTS `attribute_group_mappings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attribute_group_mappings` (
  `attribute_id` int unsigned NOT NULL,
  `attribute_group_id` int unsigned NOT NULL,
  `position` int DEFAULT NULL,
  PRIMARY KEY (`attribute_id`,`attribute_group_id`),
  KEY `attribute_group_mappings_attribute_group_id_foreign` (`attribute_group_id`),
  CONSTRAINT `attribute_group_mappings_attribute_group_id_foreign` FOREIGN KEY (`attribute_group_id`) REFERENCES `attribute_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `attribute_group_mappings_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_group_mappings`
--

LOCK TABLES `attribute_group_mappings` WRITE;
/*!40000 ALTER TABLE `attribute_group_mappings` DISABLE KEYS */;
INSERT INTO `attribute_group_mappings` VALUES (1,1,1),(2,1,3),(3,1,4),(4,1,5),(5,6,1),(6,6,2),(7,6,3),(8,6,4),(9,2,1),(10,2,2),(11,4,1),(12,4,2),(13,4,5),(14,4,6),(15,4,7),(16,3,1),(17,3,2),(18,3,3),(19,5,1),(20,5,2),(21,5,3),(22,5,4),(23,1,6),(24,1,7),(25,1,8),(26,6,5),(27,1,2),(28,7,1),(29,4,3),(30,4,4),(31,1,9);
/*!40000 ALTER TABLE `attribute_group_mappings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribute_groups`
--

DROP TABLE IF EXISTS `attribute_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attribute_groups` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attribute_family_id` int unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column` int NOT NULL DEFAULT '1',
  `position` int NOT NULL,
  `is_user_defined` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `attribute_groups_attribute_family_id_name_unique` (`attribute_family_id`,`name`),
  CONSTRAINT `attribute_groups_attribute_family_id_foreign` FOREIGN KEY (`attribute_family_id`) REFERENCES `attribute_families` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_groups`
--

LOCK TABLES `attribute_groups` WRITE;
/*!40000 ALTER TABLE `attribute_groups` DISABLE KEYS */;
INSERT INTO `attribute_groups` VALUES (1,'general',1,'General',1,1,0),(2,'description',1,'Description',1,2,0),(3,'meta_description',1,'Meta Description',1,3,0),(4,'price',1,'Price',2,1,0),(5,'shipping',1,'Shipping',2,2,0),(6,'settings',1,'Settings',2,3,0),(7,'inventories',1,'Inventories',2,4,0);
/*!40000 ALTER TABLE `attribute_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribute_option_translations`
--

DROP TABLE IF EXISTS `attribute_option_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attribute_option_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `attribute_option_id` int unsigned NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `attribute_option_translations_attribute_option_id_locale_unique` (`attribute_option_id`,`locale`),
  CONSTRAINT `attribute_option_translations_attribute_option_id_foreign` FOREIGN KEY (`attribute_option_id`) REFERENCES `attribute_options` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_option_translations`
--

LOCK TABLES `attribute_option_translations` WRITE;
/*!40000 ALTER TABLE `attribute_option_translations` DISABLE KEYS */;
INSERT INTO `attribute_option_translations` VALUES (1,1,'en','Red'),(2,2,'en','Green'),(3,3,'en','Yellow'),(4,4,'en','Black'),(5,5,'en','White'),(6,6,'en','S'),(7,7,'en','M'),(8,8,'en','L'),(9,9,'en','XL'),(10,10,'en','12K'),(11,11,'en','18K'),(12,12,'en','20K'),(13,13,'en','22K'),(14,14,'en','24K');
/*!40000 ALTER TABLE `attribute_option_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribute_options`
--

DROP TABLE IF EXISTS `attribute_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attribute_options` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `attribute_id` int unsigned NOT NULL,
  `admin_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort_order` int DEFAULT NULL,
  `swatch_value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `attribute_options_attribute_id_foreign` (`attribute_id`),
  CONSTRAINT `attribute_options_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_options`
--

LOCK TABLES `attribute_options` WRITE;
/*!40000 ALTER TABLE `attribute_options` DISABLE KEYS */;
INSERT INTO `attribute_options` VALUES (1,23,'Red',1,NULL),(2,23,'Green',2,NULL),(3,23,'Yellow',3,NULL),(4,23,'Black',4,NULL),(5,23,'White',5,NULL),(6,24,'S',1,NULL),(7,24,'M',2,NULL),(8,24,'L',3,NULL),(9,24,'XL',4,NULL),(10,31,'12K',NULL,NULL),(11,31,'18K',NULL,NULL),(12,31,'20K',NULL,NULL),(13,31,'22K',NULL,NULL),(14,31,'24K',NULL,NULL);
/*!40000 ALTER TABLE `attribute_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribute_translations`
--

DROP TABLE IF EXISTS `attribute_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attribute_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `attribute_id` int unsigned NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `attribute_translations_attribute_id_locale_unique` (`attribute_id`,`locale`),
  CONSTRAINT `attribute_translations_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_translations`
--

LOCK TABLES `attribute_translations` WRITE;
/*!40000 ALTER TABLE `attribute_translations` DISABLE KEYS */;
INSERT INTO `attribute_translations` VALUES (1,1,'en','SKU'),(2,2,'en','Name'),(3,3,'en','URL Key'),(4,4,'en','Tax Category'),(5,5,'en','New'),(6,6,'en','Featured'),(7,7,'en','Visible Individually'),(8,8,'en','Status'),(9,9,'en','Short Description'),(10,10,'en','Description'),(11,11,'en','Price'),(12,12,'en','Cost'),(13,13,'en','Special Price'),(14,14,'en','Special Price From'),(15,15,'en','Special Price To'),(16,16,'en','Meta Title'),(17,17,'en','Meta Keywords'),(18,18,'en','Meta Description'),(19,19,'en','Length'),(20,20,'en','Width'),(21,21,'en','Height'),(22,22,'en','Weight'),(23,23,'en','Color'),(24,24,'en','Size'),(25,25,'en','Brand'),(26,26,'en','Guest Checkout'),(27,27,'en','Product Number'),(28,28,'en','Manage Stock'),(29,29,'en','Per Gram Price'),(30,30,'en','Making Charges'),(31,31,'en','Purity');
/*!40000 ALTER TABLE `attribute_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attributes`
--

DROP TABLE IF EXISTS `attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attributes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `swatch_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `validation` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `regex` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int DEFAULT NULL,
  `is_required` tinyint(1) NOT NULL DEFAULT '0',
  `is_unique` tinyint(1) NOT NULL DEFAULT '0',
  `is_filterable` tinyint(1) NOT NULL DEFAULT '0',
  `is_comparable` tinyint(1) NOT NULL DEFAULT '0',
  `is_configurable` tinyint(1) NOT NULL DEFAULT '0',
  `is_user_defined` tinyint(1) NOT NULL DEFAULT '1',
  `is_visible_on_front` tinyint(1) NOT NULL DEFAULT '0',
  `value_per_locale` tinyint(1) NOT NULL DEFAULT '0',
  `value_per_channel` tinyint(1) NOT NULL DEFAULT '0',
  `default_value` int DEFAULT NULL,
  `enable_wysiwyg` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `attributes_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attributes`
--

LOCK TABLES `attributes` WRITE;
/*!40000 ALTER TABLE `attributes` DISABLE KEYS */;
INSERT INTO `attributes` VALUES (1,'sku','SKU','text',NULL,NULL,NULL,1,1,1,0,0,0,0,0,0,0,NULL,0,'2024-05-06 07:57:04','2024-05-06 07:57:04'),(2,'name','Name','text',NULL,NULL,NULL,3,1,0,0,1,0,0,0,1,1,NULL,0,'2024-05-06 07:57:04','2024-05-06 07:57:04'),(3,'url_key','URL Key','text',NULL,NULL,NULL,4,1,1,0,0,0,0,0,0,0,NULL,0,'2024-05-06 07:57:04','2024-05-06 07:57:04'),(4,'tax_category_id','Tax Category','select',NULL,NULL,NULL,5,0,0,0,0,0,0,0,0,1,NULL,0,'2024-05-06 07:57:04','2024-05-06 07:57:04'),(5,'new','New','boolean',NULL,NULL,NULL,6,0,0,0,0,0,0,0,0,0,NULL,0,'2024-05-06 07:57:04','2024-05-06 07:57:04'),(6,'featured','Featured','boolean',NULL,NULL,NULL,7,0,0,0,0,0,0,0,0,0,NULL,0,'2024-05-06 07:57:04','2024-05-06 07:57:04'),(7,'visible_individually','Visible Individually','boolean',NULL,NULL,NULL,9,1,0,0,0,0,0,0,0,0,NULL,0,'2024-05-06 07:57:04','2024-05-06 07:57:04'),(8,'status','Status','boolean',NULL,NULL,NULL,10,1,0,0,0,0,0,0,0,0,NULL,0,'2024-05-06 07:57:04','2024-05-06 07:57:04'),(9,'short_description','Short Description','textarea',NULL,NULL,NULL,11,1,0,0,0,0,0,0,1,1,NULL,1,'2024-05-06 07:57:04','2024-05-06 07:57:04'),(10,'description','Description','textarea',NULL,NULL,NULL,12,1,0,0,1,0,0,0,1,1,NULL,1,'2024-05-06 07:57:04','2024-05-06 07:57:04'),(11,'price','Price','price',NULL,'decimal',NULL,13,1,0,1,1,0,0,0,1,1,NULL,0,'2024-05-06 07:57:04','2024-05-06 07:57:04'),(12,'cost','Cost','price',NULL,'decimal',NULL,14,0,0,0,0,0,1,0,0,1,NULL,0,'2024-05-06 07:57:04','2024-05-06 07:57:04'),(13,'special_price','Special Price','price',NULL,'decimal',NULL,15,0,0,0,0,0,0,0,0,0,NULL,0,'2024-05-06 07:57:04','2024-05-06 07:57:04'),(14,'special_price_from','Special Price From','date',NULL,NULL,NULL,16,0,0,0,0,0,0,0,0,1,NULL,0,'2024-05-06 07:57:04','2024-05-06 07:57:04'),(15,'special_price_to','Special Price To','date',NULL,NULL,NULL,17,0,0,0,0,0,0,0,0,1,NULL,0,'2024-05-06 07:57:04','2024-05-06 07:57:04'),(16,'meta_title','Meta Title','textarea',NULL,NULL,NULL,18,0,0,0,0,0,0,0,1,1,NULL,0,'2024-05-06 07:57:04','2024-05-06 07:57:04'),(17,'meta_keywords','Meta Keywords','textarea',NULL,NULL,NULL,20,0,0,0,0,0,0,0,1,1,NULL,0,'2024-05-06 07:57:04','2024-05-06 07:57:04'),(18,'meta_description','Meta Description','textarea',NULL,NULL,NULL,21,0,0,0,0,0,1,0,1,1,NULL,0,'2024-05-06 07:57:04','2024-05-06 07:57:04'),(19,'length','Length','text',NULL,'decimal',NULL,22,0,0,0,0,0,1,0,0,0,NULL,0,'2024-05-06 07:57:04','2024-05-06 07:57:04'),(20,'width','Width','text',NULL,'decimal',NULL,23,0,0,0,0,0,1,0,0,0,NULL,0,'2024-05-06 07:57:04','2024-05-06 07:57:04'),(21,'height','Height','text',NULL,'decimal',NULL,24,0,0,0,0,0,1,0,0,0,NULL,0,'2024-05-06 07:57:04','2024-05-06 07:57:04'),(22,'weight','Weight','text',NULL,'decimal',NULL,25,1,0,0,0,0,0,0,0,0,NULL,0,'2024-05-06 07:57:04','2024-05-06 07:57:04'),(23,'color','Color','select',NULL,NULL,NULL,26,0,0,1,0,1,1,0,0,0,NULL,0,'2024-05-06 07:57:04','2024-05-06 07:57:04'),(24,'size','Size','select',NULL,NULL,NULL,27,0,0,1,0,1,1,0,0,0,NULL,0,'2024-05-06 07:57:04','2024-05-06 07:57:04'),(25,'brand','Brand','select',NULL,NULL,NULL,28,0,0,1,0,0,1,1,0,0,NULL,0,'2024-05-06 07:57:04','2024-05-06 07:57:04'),(26,'guest_checkout','Guest Checkout','boolean',NULL,NULL,NULL,8,1,0,0,0,0,0,0,0,0,NULL,0,'2024-05-06 07:57:04','2024-05-06 07:57:04'),(27,'product_number','Product Number','text',NULL,NULL,NULL,2,0,1,0,0,0,0,0,0,0,NULL,0,'2024-05-06 07:57:04','2024-05-06 07:57:04'),(28,'manage_stock','Manage Stock','boolean',NULL,NULL,NULL,1,0,0,0,0,0,0,0,0,1,1,0,'2024-05-06 07:57:04','2024-05-06 07:57:04'),(29,'per_gram_price','Per Gram Price','price',NULL,NULL,'',NULL,1,0,0,0,0,1,1,0,0,0,0,'2024-05-06 10:18:49','2024-05-06 10:18:49'),(30,'making_charges','Making Charges','price',NULL,NULL,'',NULL,0,0,0,0,0,1,1,0,0,0,0,'2024-05-06 10:19:22','2024-05-06 10:19:22'),(31,'purity','Purity','select','dropdown',NULL,'',NULL,0,0,0,1,0,1,1,0,0,0,0,'2024-05-06 10:21:50','2024-05-06 10:21:50');
/*!40000 ALTER TABLE `attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `customer_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_gift` tinyint(1) NOT NULL DEFAULT '0',
  `items_count` int DEFAULT NULL,
  `items_qty` decimal(12,4) DEFAULT NULL,
  `exchange_rate` decimal(12,4) DEFAULT NULL,
  `global_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `base_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cart_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `grand_total` decimal(12,4) DEFAULT '0.0000',
  `base_grand_total` decimal(12,4) DEFAULT '0.0000',
  `sub_total` decimal(12,4) DEFAULT '0.0000',
  `base_sub_total` decimal(12,4) DEFAULT '0.0000',
  `tax_total` decimal(12,4) DEFAULT '0.0000',
  `base_tax_total` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `checkout_method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_guest` tinyint(1) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `applied_cart_rule_ids` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` int unsigned DEFAULT NULL,
  `channel_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `base_making_charges_amount` decimal(12,4) DEFAULT '0.0000',
  `making_charges_amount` decimal(12,4) DEFAULT '0.0000',
  `base_making_charges_amount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `making_charges_amount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `other_amount` decimal(12,4) DEFAULT '0.0000',
  `base_other_amount` decimal(12,4) DEFAULT '0.0000',
  `other_amount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_other_amount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `sgst_amount` decimal(12,4) DEFAULT '0.0000',
  `base_sgst_amount` decimal(12,4) DEFAULT '0.0000',
  `cgst_amount` decimal(12,4) DEFAULT '0.0000',
  `base_cgst_amount` decimal(12,4) DEFAULT '0.0000',
  `cgst_total` decimal(12,4) DEFAULT '0.0000',
  `base_cgst_total` decimal(12,4) DEFAULT '0.0000',
  `sgst_total` decimal(12,4) DEFAULT '0.0000',
  `base_sgst_total` decimal(12,4) DEFAULT '0.0000',
  `cgst_percent` decimal(12,4) DEFAULT '0.0000',
  `sgst_percent` decimal(12,4) DEFAULT '0.0000',
  PRIMARY KEY (`id`),
  KEY `cart_customer_id_foreign` (`customer_id`),
  KEY `cart_channel_id_foreign` (`channel_id`),
  CONSTRAINT `cart_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (1,NULL,NULL,NULL,NULL,NULL,0,1,1.0000,NULL,'USD','USD','USD','USD',507.1800,507.1800,507.1800,507.1800,0.0000,0.0000,0.0000,0.0000,NULL,1,1,NULL,NULL,1,'2024-05-06 08:08:00','2024-05-06 08:08:00',0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000),(2,NULL,NULL,NULL,NULL,NULL,0,1,1.0000,NULL,'USD','USD','USD','USD',507.1800,507.1800,507.1800,507.1800,0.0000,0.0000,0.0000,0.0000,NULL,1,1,NULL,NULL,1,'2024-05-06 08:08:07','2024-05-06 08:08:07',0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000),(3,NULL,NULL,NULL,NULL,NULL,0,1,1.0000,NULL,'USD','USD','USD','USD',437.4400,437.4400,437.4400,437.4400,0.0000,0.0000,0.0000,0.0000,NULL,1,1,NULL,NULL,1,'2024-05-06 08:08:17','2024-05-06 08:08:17',0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000),(4,NULL,NULL,NULL,NULL,NULL,0,1,3.0000,NULL,'USD','USD','USD','USD',2720.8500,2720.8500,2720.8500,2720.8500,0.0000,0.0000,0.0000,0.0000,NULL,1,1,NULL,NULL,1,'2024-05-06 08:08:35','2024-05-06 08:08:35',0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000),(5,NULL,NULL,NULL,NULL,NULL,0,1,1.0000,NULL,'USD','USD','USD','USD',906.9500,906.9500,906.9500,906.9500,0.0000,0.0000,0.0000,0.0000,NULL,1,1,NULL,NULL,1,'2024-05-06 08:10:05','2024-05-06 08:10:05',0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000),(6,NULL,NULL,NULL,NULL,NULL,0,1,1.0000,NULL,'USD','USD','USD','USD',437.4400,437.4400,437.4400,437.4400,0.0000,0.0000,0.0000,0.0000,NULL,1,1,NULL,NULL,1,'2024-05-06 08:10:26','2024-05-06 08:10:26',0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000),(7,NULL,NULL,NULL,NULL,NULL,0,1,1.0000,NULL,'USD','USD','USD','USD',2.5800,2.5800,2.5800,2.5800,0.0000,0.0000,0.0000,0.0000,NULL,1,1,NULL,NULL,1,'2024-05-06 08:11:34','2024-05-06 08:11:34',0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000),(8,NULL,NULL,NULL,NULL,NULL,0,1,1.0000,NULL,'USD','USD','USD','USD',437.4400,437.4400,437.4400,437.4400,0.0000,0.0000,0.0000,0.0000,NULL,1,1,NULL,NULL,1,'2024-05-06 08:12:17','2024-05-06 08:12:17',0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000),(9,NULL,NULL,NULL,NULL,NULL,0,1,1.0000,NULL,'USD','USD','USD','USD',437.4400,437.4400,437.4400,437.4400,0.0000,0.0000,0.0000,0.0000,NULL,1,1,NULL,NULL,1,'2024-05-06 08:13:17','2024-05-06 08:13:17',0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000),(10,NULL,NULL,NULL,NULL,NULL,0,1,1.0000,NULL,'USD','USD','USD','USD',437.4400,437.4400,437.4400,437.4400,0.0000,0.0000,0.0000,0.0000,NULL,1,1,NULL,NULL,1,'2024-05-06 08:13:39','2024-05-06 08:13:39',0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000),(11,NULL,NULL,NULL,NULL,NULL,0,1,1.0000,NULL,'USD','USD','USD','USD',437.4400,437.4400,437.4400,437.4400,0.0000,0.0000,0.0000,0.0000,NULL,1,1,NULL,NULL,1,'2024-05-06 08:15:29','2024-05-06 08:15:30',0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000),(12,NULL,NULL,NULL,NULL,NULL,0,1,1.0000,NULL,'USD','USD','USD','USD',437.4400,437.4400,437.4400,437.4400,0.0000,0.0000,0.0000,0.0000,NULL,1,1,NULL,NULL,1,'2024-05-06 08:17:00','2024-05-06 08:17:00',0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000),(13,NULL,NULL,NULL,NULL,NULL,0,1,1.0000,NULL,'USD','USD','USD','USD',437.4400,437.4400,437.4400,437.4400,0.0000,0.0000,0.0000,0.0000,NULL,1,1,NULL,NULL,1,'2024-05-06 08:18:44','2024-05-06 08:18:44',0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000),(14,'piyush.jain@example.com','Piyush','Jain',NULL,NULL,0,1,1.0000,NULL,'USD','USD','USD','USD',470.2500,470.2500,437.4400,437.4400,32.8100,32.8100,0.0000,0.0000,NULL,0,1,NULL,11,1,'2024-05-06 08:19:34','2024-05-06 08:20:14',0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000),(15,NULL,NULL,NULL,NULL,NULL,0,1,1.0000,NULL,'USD','USD','USD','USD',682.2900,682.2900,682.2900,682.2900,0.0000,0.0000,0.0000,0.0000,NULL,1,1,NULL,NULL,1,'2024-05-06 08:24:28','2024-05-06 08:24:28',0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000),(16,NULL,NULL,NULL,NULL,NULL,0,1,1.0000,NULL,'USD','USD','USD','USD',690.4500,690.4500,690.4500,690.4500,0.0000,0.0000,0.0000,0.0000,NULL,1,1,NULL,NULL,1,'2024-05-06 08:24:29','2024-05-06 08:24:29',0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000),(17,NULL,NULL,NULL,NULL,NULL,0,1,1.0000,NULL,'USD','USD','USD','USD',507.1800,507.1800,507.1800,507.1800,0.0000,0.0000,0.0000,0.0000,NULL,1,1,NULL,NULL,1,'2024-05-06 08:27:01','2024-05-06 08:27:01',0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000),(18,NULL,NULL,NULL,NULL,NULL,0,1,1.0000,NULL,'USD','USD','USD','USD',507.1800,507.1800,507.1800,507.1800,0.0000,0.0000,0.0000,0.0000,NULL,1,1,NULL,NULL,1,'2024-05-06 08:35:18','2024-05-06 08:35:18',0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000),(19,NULL,NULL,NULL,NULL,NULL,0,1,1.0000,NULL,'USD','USD','USD','USD',682.2900,682.2900,682.2900,682.2900,0.0000,0.0000,0.0000,0.0000,NULL,1,1,NULL,NULL,1,'2024-05-06 08:35:33','2024-05-06 08:35:33',0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000),(20,NULL,NULL,NULL,NULL,NULL,0,1,1.0000,NULL,'USD','USD','USD','USD',2.5800,2.5800,2.5800,2.5800,0.0000,0.0000,0.0000,0.0000,NULL,1,1,NULL,NULL,1,'2024-05-06 08:41:30','2024-05-06 08:41:45',0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000),(21,NULL,NULL,NULL,NULL,NULL,0,1,1.0000,NULL,'USD','USD','USD','USD',507.1800,507.1800,507.1800,507.1800,0.0000,0.0000,0.0000,0.0000,NULL,1,1,NULL,NULL,1,'2024-05-06 08:50:13','2024-05-06 08:50:13',0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000),(22,NULL,NULL,NULL,NULL,NULL,0,1,1.0000,NULL,'USD','USD','USD','USD',906.9500,906.9500,906.9500,906.9500,0.0000,0.0000,0.0000,0.0000,NULL,1,1,NULL,NULL,1,'2024-05-06 08:50:40','2024-05-06 08:50:40',0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000),(23,NULL,NULL,NULL,NULL,NULL,0,1,1.0000,NULL,'USD','USD','USD','USD',507.1800,507.1800,507.1800,507.1800,0.0000,0.0000,0.0000,0.0000,NULL,1,1,NULL,NULL,1,'2024-05-06 08:54:07','2024-05-06 08:54:07',0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000),(34,NULL,NULL,NULL,NULL,NULL,0,1,1.0000,NULL,'USD','USD','USD','USD',3037.0400,3037.0400,2640.9000,2640.9000,396.1400,396.1400,0.0000,0.0000,NULL,1,1,NULL,NULL,1,'2024-05-07 13:40:32','2024-05-07 13:40:32',0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,198.0700,198.0700,198.0700,198.0700,7.5000,7.5000);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_item_inventories`
--

DROP TABLE IF EXISTS `cart_item_inventories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_item_inventories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `qty` int unsigned NOT NULL DEFAULT '0',
  `inventory_source_id` int unsigned DEFAULT NULL,
  `cart_item_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_item_inventories`
--

LOCK TABLES `cart_item_inventories` WRITE;
/*!40000 ALTER TABLE `cart_item_inventories` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_item_inventories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_items`
--

DROP TABLE IF EXISTS `cart_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `quantity` int unsigned NOT NULL DEFAULT '0',
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weight` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total_weight` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total_weight` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `price` decimal(12,4) NOT NULL DEFAULT '1.0000',
  `base_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `custom_price` decimal(12,4) DEFAULT NULL,
  `total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `tax_percent` decimal(12,4) DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `discount_percent` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `parent_id` int unsigned DEFAULT NULL,
  `product_id` int unsigned NOT NULL,
  `cart_id` int unsigned NOT NULL,
  `tax_category_id` int unsigned DEFAULT NULL,
  `applied_cart_rule_ids` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `base_making_charges_amount` decimal(12,4) DEFAULT '0.0000',
  `making_charges_amount` decimal(12,4) DEFAULT '0.0000',
  `base_making_charges_amount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `making_charges_amount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `other_amount` decimal(12,4) DEFAULT '0.0000',
  `base_other_amount` decimal(12,4) DEFAULT '0.0000',
  `other_amount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_other_amount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `sgst_amount` decimal(12,4) DEFAULT '0.0000',
  `base_sgst_amount` decimal(12,4) DEFAULT '0.0000',
  `cgst_amount` decimal(12,4) DEFAULT '0.0000',
  `base_cgst_amount` decimal(12,4) DEFAULT '0.0000',
  PRIMARY KEY (`id`),
  KEY `cart_items_parent_id_foreign` (`parent_id`),
  KEY `cart_items_product_id_foreign` (`product_id`),
  KEY `cart_items_cart_id_foreign` (`cart_id`),
  KEY `cart_items_tax_category_id_foreign` (`tax_category_id`),
  CONSTRAINT `cart_items_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_items_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `cart_items` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_items_tax_category_id_foreign` FOREIGN KEY (`tax_category_id`) REFERENCES `tax_categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_items`
--

LOCK TABLES `cart_items` WRITE;
/*!40000 ALTER TABLE `cart_items` DISABLE KEYS */;
INSERT INTO `cart_items` VALUES (78,1,'d6b28d50-4f67-3f6c-aa53-144443e6bb60','simple','Gold rerum',NULL,10.0000,10.0000,10.0000,264.0900,264.0900,NULL,2640.9000,2640.9000,7.5000,198.0675,198.0675,0.0000,0.0000,0.0000,NULL,118,34,1,NULL,'{\"quantity\": 1, \"product_id\": 118, \"current_cart_id\": \"null\"}','2024-05-07 13:40:32','2024-05-07 13:40:32',0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,198.0675,198.0675,198.0675,198.0675);
/*!40000 ALTER TABLE `cart_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_payment`
--

DROP TABLE IF EXISTS `cart_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_payment` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `method` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cart_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_payment_cart_id_foreign` (`cart_id`),
  CONSTRAINT `cart_payment_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_payment`
--

LOCK TABLES `cart_payment` WRITE;
/*!40000 ALTER TABLE `cart_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_rule_channels`
--

DROP TABLE IF EXISTS `cart_rule_channels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_rule_channels` (
  `cart_rule_id` int unsigned NOT NULL,
  `channel_id` int unsigned NOT NULL,
  PRIMARY KEY (`cart_rule_id`,`channel_id`),
  KEY `cart_rule_channels_channel_id_foreign` (`channel_id`),
  CONSTRAINT `cart_rule_channels_cart_rule_id_foreign` FOREIGN KEY (`cart_rule_id`) REFERENCES `cart_rules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_rule_channels_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_rule_channels`
--

LOCK TABLES `cart_rule_channels` WRITE;
/*!40000 ALTER TABLE `cart_rule_channels` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_rule_channels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_rule_coupon_usage`
--

DROP TABLE IF EXISTS `cart_rule_coupon_usage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_rule_coupon_usage` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `times_used` int NOT NULL DEFAULT '0',
  `cart_rule_coupon_id` int unsigned NOT NULL,
  `customer_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_rule_coupon_usage_cart_rule_coupon_id_foreign` (`cart_rule_coupon_id`),
  KEY `cart_rule_coupon_usage_customer_id_foreign` (`customer_id`),
  CONSTRAINT `cart_rule_coupon_usage_cart_rule_coupon_id_foreign` FOREIGN KEY (`cart_rule_coupon_id`) REFERENCES `cart_rule_coupons` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_rule_coupon_usage_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_rule_coupon_usage`
--

LOCK TABLES `cart_rule_coupon_usage` WRITE;
/*!40000 ALTER TABLE `cart_rule_coupon_usage` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_rule_coupon_usage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_rule_coupons`
--

DROP TABLE IF EXISTS `cart_rule_coupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_rule_coupons` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `usage_limit` int unsigned NOT NULL DEFAULT '0',
  `usage_per_customer` int unsigned NOT NULL DEFAULT '0',
  `times_used` int unsigned NOT NULL DEFAULT '0',
  `type` int unsigned NOT NULL DEFAULT '0',
  `is_primary` tinyint(1) NOT NULL DEFAULT '0',
  `expired_at` date DEFAULT NULL,
  `cart_rule_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_rule_coupons_cart_rule_id_foreign` (`cart_rule_id`),
  CONSTRAINT `cart_rule_coupons_cart_rule_id_foreign` FOREIGN KEY (`cart_rule_id`) REFERENCES `cart_rules` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_rule_coupons`
--

LOCK TABLES `cart_rule_coupons` WRITE;
/*!40000 ALTER TABLE `cart_rule_coupons` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_rule_coupons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_rule_customer_groups`
--

DROP TABLE IF EXISTS `cart_rule_customer_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_rule_customer_groups` (
  `cart_rule_id` int unsigned NOT NULL,
  `customer_group_id` int unsigned NOT NULL,
  PRIMARY KEY (`cart_rule_id`,`customer_group_id`),
  KEY `cart_rule_customer_groups_customer_group_id_foreign` (`customer_group_id`),
  CONSTRAINT `cart_rule_customer_groups_cart_rule_id_foreign` FOREIGN KEY (`cart_rule_id`) REFERENCES `cart_rules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_rule_customer_groups_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_rule_customer_groups`
--

LOCK TABLES `cart_rule_customer_groups` WRITE;
/*!40000 ALTER TABLE `cart_rule_customer_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_rule_customer_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_rule_customers`
--

DROP TABLE IF EXISTS `cart_rule_customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_rule_customers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `times_used` bigint unsigned NOT NULL DEFAULT '0',
  `customer_id` int unsigned NOT NULL,
  `cart_rule_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_rule_customers_cart_rule_id_foreign` (`cart_rule_id`),
  KEY `cart_rule_customers_customer_id_foreign` (`customer_id`),
  CONSTRAINT `cart_rule_customers_cart_rule_id_foreign` FOREIGN KEY (`cart_rule_id`) REFERENCES `cart_rules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_rule_customers_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_rule_customers`
--

LOCK TABLES `cart_rule_customers` WRITE;
/*!40000 ALTER TABLE `cart_rule_customers` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_rule_customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_rule_translations`
--

DROP TABLE IF EXISTS `cart_rule_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_rule_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` text COLLATE utf8mb4_unicode_ci,
  `cart_rule_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cart_rule_translations_cart_rule_id_locale_unique` (`cart_rule_id`,`locale`),
  CONSTRAINT `cart_rule_translations_cart_rule_id_foreign` FOREIGN KEY (`cart_rule_id`) REFERENCES `cart_rules` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_rule_translations`
--

LOCK TABLES `cart_rule_translations` WRITE;
/*!40000 ALTER TABLE `cart_rule_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_rule_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_rules`
--

DROP TABLE IF EXISTS `cart_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_rules` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `starts_from` datetime DEFAULT NULL,
  `ends_till` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `coupon_type` int NOT NULL DEFAULT '1',
  `use_auto_generation` tinyint(1) NOT NULL DEFAULT '0',
  `usage_per_customer` int NOT NULL DEFAULT '0',
  `uses_per_coupon` int NOT NULL DEFAULT '0',
  `times_used` int unsigned NOT NULL DEFAULT '0',
  `condition_type` tinyint(1) NOT NULL DEFAULT '1',
  `conditions` json DEFAULT NULL,
  `end_other_rules` tinyint(1) NOT NULL DEFAULT '0',
  `uses_attribute_conditions` tinyint(1) NOT NULL DEFAULT '0',
  `action_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `discount_quantity` int NOT NULL DEFAULT '1',
  `discount_step` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `apply_to_shipping` tinyint(1) NOT NULL DEFAULT '0',
  `free_shipping` tinyint(1) NOT NULL DEFAULT '0',
  `sort_order` int unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_rules`
--

LOCK TABLES `cart_rules` WRITE;
/*!40000 ALTER TABLE `cart_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_shipping_rates`
--

DROP TABLE IF EXISTS `cart_shipping_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_shipping_rates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `carrier` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `carrier_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method_description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double DEFAULT '0',
  `base_price` double DEFAULT '0',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `is_calculate_tax` tinyint(1) NOT NULL DEFAULT '1',
  `cart_address_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_shipping_rates`
--

LOCK TABLES `cart_shipping_rates` WRITE;
/*!40000 ALTER TABLE `cart_shipping_rates` DISABLE KEYS */;
INSERT INTO `cart_shipping_rates` VALUES (1,'flatrate','Flat Rate','flatrate_flatrate','Flat Rate','Flat Rate Shipping',10,10,0.0000,0.0000,1,2,'2024-05-06 08:20:14','2024-05-06 08:20:14'),(2,'free','Free Shipping','free_free','Free Shipping','Free Shipping',0,0,0.0000,0.0000,1,2,'2024-05-06 08:20:14','2024-05-06 08:20:14');
/*!40000 ALTER TABLE `cart_shipping_rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_rule_channels`
--

DROP TABLE IF EXISTS `catalog_rule_channels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_rule_channels` (
  `catalog_rule_id` int unsigned NOT NULL,
  `channel_id` int unsigned NOT NULL,
  PRIMARY KEY (`catalog_rule_id`,`channel_id`),
  KEY `catalog_rule_channels_channel_id_foreign` (`channel_id`),
  CONSTRAINT `catalog_rule_channels_catalog_rule_id_foreign` FOREIGN KEY (`catalog_rule_id`) REFERENCES `catalog_rules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `catalog_rule_channels_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_rule_channels`
--

LOCK TABLES `catalog_rule_channels` WRITE;
/*!40000 ALTER TABLE `catalog_rule_channels` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_rule_channels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_rule_customer_groups`
--

DROP TABLE IF EXISTS `catalog_rule_customer_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_rule_customer_groups` (
  `catalog_rule_id` int unsigned NOT NULL,
  `customer_group_id` int unsigned NOT NULL,
  PRIMARY KEY (`catalog_rule_id`,`customer_group_id`),
  KEY `catalog_rule_customer_groups_customer_group_id_foreign` (`customer_group_id`),
  CONSTRAINT `catalog_rule_customer_groups_catalog_rule_id_foreign` FOREIGN KEY (`catalog_rule_id`) REFERENCES `catalog_rules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `catalog_rule_customer_groups_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_rule_customer_groups`
--

LOCK TABLES `catalog_rule_customer_groups` WRITE;
/*!40000 ALTER TABLE `catalog_rule_customer_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_rule_customer_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_rule_product_prices`
--

DROP TABLE IF EXISTS `catalog_rule_product_prices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_rule_product_prices` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `rule_date` date NOT NULL,
  `starts_from` datetime DEFAULT NULL,
  `ends_till` datetime DEFAULT NULL,
  `product_id` int unsigned NOT NULL,
  `customer_group_id` int unsigned NOT NULL,
  `catalog_rule_id` int unsigned NOT NULL,
  `channel_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `catalog_rule_product_prices_product_id_foreign` (`product_id`),
  KEY `catalog_rule_product_prices_customer_group_id_foreign` (`customer_group_id`),
  KEY `catalog_rule_product_prices_catalog_rule_id_foreign` (`catalog_rule_id`),
  KEY `catalog_rule_product_prices_channel_id_foreign` (`channel_id`),
  CONSTRAINT `catalog_rule_product_prices_catalog_rule_id_foreign` FOREIGN KEY (`catalog_rule_id`) REFERENCES `catalog_rules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `catalog_rule_product_prices_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `catalog_rule_product_prices_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `catalog_rule_product_prices_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_rule_product_prices`
--

LOCK TABLES `catalog_rule_product_prices` WRITE;
/*!40000 ALTER TABLE `catalog_rule_product_prices` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_rule_product_prices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_rule_products`
--

DROP TABLE IF EXISTS `catalog_rule_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_rule_products` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `starts_from` datetime DEFAULT NULL,
  `ends_till` datetime DEFAULT NULL,
  `end_other_rules` tinyint(1) NOT NULL DEFAULT '0',
  `action_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `sort_order` int unsigned NOT NULL DEFAULT '0',
  `product_id` int unsigned NOT NULL,
  `customer_group_id` int unsigned NOT NULL,
  `catalog_rule_id` int unsigned NOT NULL,
  `channel_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `catalog_rule_products_product_id_foreign` (`product_id`),
  KEY `catalog_rule_products_customer_group_id_foreign` (`customer_group_id`),
  KEY `catalog_rule_products_catalog_rule_id_foreign` (`catalog_rule_id`),
  KEY `catalog_rule_products_channel_id_foreign` (`channel_id`),
  CONSTRAINT `catalog_rule_products_catalog_rule_id_foreign` FOREIGN KEY (`catalog_rule_id`) REFERENCES `catalog_rules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `catalog_rule_products_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `catalog_rule_products_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `catalog_rule_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_rule_products`
--

LOCK TABLES `catalog_rule_products` WRITE;
/*!40000 ALTER TABLE `catalog_rule_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_rule_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_rules`
--

DROP TABLE IF EXISTS `catalog_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_rules` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `starts_from` date DEFAULT NULL,
  `ends_till` date DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `condition_type` tinyint(1) NOT NULL DEFAULT '1',
  `conditions` json DEFAULT NULL,
  `end_other_rules` tinyint(1) NOT NULL DEFAULT '0',
  `action_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `sort_order` int unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_rules`
--

LOCK TABLES `catalog_rules` WRITE;
/*!40000 ALTER TABLE `catalog_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `position` int NOT NULL DEFAULT '0',
  `logo_path` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `display_mode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'products_and_description',
  `_lft` int unsigned NOT NULL DEFAULT '0',
  `_rgt` int unsigned NOT NULL DEFAULT '0',
  `parent_id` int unsigned DEFAULT NULL,
  `additional` json DEFAULT NULL,
  `banner_path` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categories__lft__rgt_parent_id_index` (`_lft`,`_rgt`,`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,1,NULL,1,'products_and_description',1,44,NULL,NULL,NULL,'2024-05-06 07:57:04','2024-05-06 07:57:04'),(2,0,NULL,1,'products_and_description',14,15,1,NULL,NULL,'2024-05-06 08:06:55','2024-05-06 08:06:55'),(3,1,NULL,1,'products_and_description',16,17,1,NULL,NULL,'2024-05-06 08:06:55','2024-05-06 08:06:55'),(4,4,NULL,1,'products_and_description',18,19,1,NULL,NULL,'2024-05-06 08:06:55','2024-05-06 08:06:55'),(5,2,NULL,1,'products_and_description',20,21,1,NULL,NULL,'2024-05-06 08:06:55','2024-05-06 08:06:55'),(6,1,NULL,1,'products_and_description',22,23,1,NULL,NULL,'2024-05-06 08:06:55','2024-05-06 08:06:55'),(7,5,NULL,1,'products_and_description',24,25,1,NULL,NULL,'2024-05-06 08:06:55','2024-05-06 08:06:55'),(8,7,NULL,1,'products_and_description',26,27,1,NULL,NULL,'2024-05-06 08:06:55','2024-05-06 08:06:55'),(9,0,NULL,1,'products_and_description',28,29,1,NULL,NULL,'2024-05-06 08:06:55','2024-05-06 08:06:55'),(10,3,NULL,1,'products_and_description',30,31,1,NULL,NULL,'2024-05-06 08:06:55','2024-05-06 08:06:55'),(11,7,NULL,1,'products_and_description',32,33,1,NULL,NULL,'2024-05-06 08:06:55','2024-05-06 08:06:55'),(12,3,NULL,1,'products_and_description',34,35,1,NULL,NULL,'2024-05-06 08:06:55','2024-05-06 08:06:55'),(13,4,NULL,1,'products_and_description',36,37,1,NULL,NULL,'2024-05-06 08:06:55','2024-05-06 08:06:55'),(14,5,NULL,1,'products_and_description',38,39,1,NULL,NULL,'2024-05-06 08:06:55','2024-05-06 08:06:55'),(15,1,NULL,1,'products_and_description',40,41,1,NULL,NULL,'2024-05-06 08:06:55','2024-05-06 08:06:55'),(16,0,NULL,1,'products_and_description',42,43,1,NULL,NULL,'2024-05-06 08:06:55','2024-05-06 08:06:55');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_filterable_attributes`
--

DROP TABLE IF EXISTS `category_filterable_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_filterable_attributes` (
  `category_id` int unsigned NOT NULL,
  `attribute_id` int unsigned NOT NULL,
  KEY `category_filterable_attributes_category_id_foreign` (`category_id`),
  KEY `category_filterable_attributes_attribute_id_foreign` (`attribute_id`),
  CONSTRAINT `category_filterable_attributes_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `category_filterable_attributes_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_filterable_attributes`
--

LOCK TABLES `category_filterable_attributes` WRITE;
/*!40000 ALTER TABLE `category_filterable_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `category_filterable_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_translations`
--

DROP TABLE IF EXISTS `category_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int unsigned NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url_path` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `meta_title` text COLLATE utf8mb4_unicode_ci,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `locale_id` int unsigned DEFAULT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `category_translations_category_id_slug_locale_unique` (`category_id`,`slug`,`locale`),
  KEY `category_translations_locale_id_foreign` (`locale_id`),
  CONSTRAINT `category_translations_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `category_translations_locale_id_foreign` FOREIGN KEY (`locale_id`) REFERENCES `locales` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_translations`
--

LOCK TABLES `category_translations` WRITE;
/*!40000 ALTER TABLE `category_translations` DISABLE KEYS */;
INSERT INTO `category_translations` VALUES (1,1,'Root','root','','Root Category Description','','','',NULL,'en'),(2,2,'dolores','magni-ut-iste-sit-necessitatibus-ad','','Autem ea officiis voluptatem nihil modi.',NULL,NULL,NULL,1,'en'),(3,3,'aliquam','nihil-architecto-dolores-itaque-ratione-omnis-omnis-repudiandae','','Vel veniam consequuntur ad voluptatem quod aspernatur.',NULL,NULL,NULL,1,'en'),(4,4,'ab','animi-reiciendis-et-iure-omnis-aut-itaque','','Qui voluptas tempore harum placeat totam et.',NULL,NULL,NULL,1,'en'),(5,5,'atque','cupiditate-amet-est-et-eligendi-tempore','','In velit sunt quisquam eum est unde.',NULL,NULL,NULL,1,'en'),(6,6,'quia','et-ut-voluptatem-fuga-ea-natus-tempore','','Dolore et repellendus impedit nihil voluptates.',NULL,NULL,NULL,1,'en'),(7,7,'qui','excepturi-ea-mollitia-perspiciatis-provident-laborum-ab-eos','','Dolores nemo vel similique iste.',NULL,NULL,NULL,1,'en'),(8,8,'cum','modi-consectetur-perspiciatis-vitae-ipsam','','Voluptas hic pariatur numquam praesentium.',NULL,NULL,NULL,1,'en'),(9,9,'laboriosam','voluptas-quis-maiores-est','','Qui fugiat dolorum est officiis rem illo.',NULL,NULL,NULL,1,'en'),(10,10,'ut','quia-deserunt-consectetur-a-et-veritatis','','Quis id iure tempore.',NULL,NULL,NULL,1,'en'),(11,11,'dolores','aperiam-et-est-inventore-impedit-occaecati-debitis-assumenda','','Dolor quod maiores nemo dolorem iusto.',NULL,NULL,NULL,1,'en'),(12,12,'aut','voluptatum-nostrum-et-aut-asperiores','','Impedit quis doloribus consequuntur porro.',NULL,NULL,NULL,1,'en'),(13,13,'illo','qui-commodi-voluptatibus-iure-consequuntur-et-in-rem','','Dolor ut iusto voluptatem nisi molestiae vitae fuga.',NULL,NULL,NULL,1,'en'),(14,14,'molestiae','omnis-a-et-qui-nesciunt-qui-adipisci','','Commodi impedit quis deleniti reprehenderit non ex.',NULL,NULL,NULL,1,'en'),(15,15,'quis','minima-incidunt-blanditiis-alias-voluptate-tenetur-consequatur','','Cumque adipisci molestias aperiam laudantium eius.',NULL,NULL,NULL,1,'en'),(16,16,'qui','consectetur-voluptate-deserunt-et-voluptatem-omnis','','Et saepe rerum dolorem quibusdam.',NULL,NULL,NULL,1,'en');
/*!40000 ALTER TABLE `category_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channel_currencies`
--

DROP TABLE IF EXISTS `channel_currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `channel_currencies` (
  `channel_id` int unsigned NOT NULL,
  `currency_id` int unsigned NOT NULL,
  PRIMARY KEY (`channel_id`,`currency_id`),
  KEY `channel_currencies_currency_id_foreign` (`currency_id`),
  CONSTRAINT `channel_currencies_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `channel_currencies_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channel_currencies`
--

LOCK TABLES `channel_currencies` WRITE;
/*!40000 ALTER TABLE `channel_currencies` DISABLE KEYS */;
INSERT INTO `channel_currencies` VALUES (1,1);
/*!40000 ALTER TABLE `channel_currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channel_inventory_sources`
--

DROP TABLE IF EXISTS `channel_inventory_sources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `channel_inventory_sources` (
  `channel_id` int unsigned NOT NULL,
  `inventory_source_id` int unsigned NOT NULL,
  UNIQUE KEY `channel_inventory_sources_channel_id_inventory_source_id_unique` (`channel_id`,`inventory_source_id`),
  KEY `channel_inventory_sources_inventory_source_id_foreign` (`inventory_source_id`),
  CONSTRAINT `channel_inventory_sources_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `channel_inventory_sources_inventory_source_id_foreign` FOREIGN KEY (`inventory_source_id`) REFERENCES `inventory_sources` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channel_inventory_sources`
--

LOCK TABLES `channel_inventory_sources` WRITE;
/*!40000 ALTER TABLE `channel_inventory_sources` DISABLE KEYS */;
INSERT INTO `channel_inventory_sources` VALUES (1,1);
/*!40000 ALTER TABLE `channel_inventory_sources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channel_locales`
--

DROP TABLE IF EXISTS `channel_locales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `channel_locales` (
  `channel_id` int unsigned NOT NULL,
  `locale_id` int unsigned NOT NULL,
  PRIMARY KEY (`channel_id`,`locale_id`),
  KEY `channel_locales_locale_id_foreign` (`locale_id`),
  CONSTRAINT `channel_locales_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `channel_locales_locale_id_foreign` FOREIGN KEY (`locale_id`) REFERENCES `locales` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channel_locales`
--

LOCK TABLES `channel_locales` WRITE;
/*!40000 ALTER TABLE `channel_locales` DISABLE KEYS */;
INSERT INTO `channel_locales` VALUES (1,1);
/*!40000 ALTER TABLE `channel_locales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channel_translations`
--

DROP TABLE IF EXISTS `channel_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `channel_translations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `channel_id` int unsigned NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `maintenance_mode_text` text COLLATE utf8mb4_unicode_ci,
  `home_seo` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `channel_translations_channel_id_locale_unique` (`channel_id`,`locale`),
  KEY `channel_translations_locale_index` (`locale`),
  CONSTRAINT `channel_translations_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channel_translations`
--

LOCK TABLES `channel_translations` WRITE;
/*!40000 ALTER TABLE `channel_translations` DISABLE KEYS */;
INSERT INTO `channel_translations` VALUES (1,1,'en','Default',NULL,NULL,'{\"meta_title\": \"Demo store\", \"meta_keywords\": \"Demo store meta keyword\", \"meta_description\": \"Demo store meta description\"}',NULL,NULL);
/*!40000 ALTER TABLE `channel_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channels`
--

DROP TABLE IF EXISTS `channels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `channels` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `timezone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `theme` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hostname` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `favicon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `home_seo` json DEFAULT NULL,
  `is_maintenance_on` tinyint(1) NOT NULL DEFAULT '0',
  `allowed_ips` text COLLATE utf8mb4_unicode_ci,
  `root_category_id` int unsigned DEFAULT NULL,
  `default_locale_id` int unsigned NOT NULL,
  `base_currency_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `channels_root_category_id_foreign` (`root_category_id`),
  KEY `channels_default_locale_id_foreign` (`default_locale_id`),
  KEY `channels_base_currency_id_foreign` (`base_currency_id`),
  CONSTRAINT `channels_base_currency_id_foreign` FOREIGN KEY (`base_currency_id`) REFERENCES `currencies` (`id`),
  CONSTRAINT `channels_default_locale_id_foreign` FOREIGN KEY (`default_locale_id`) REFERENCES `locales` (`id`),
  CONSTRAINT `channels_root_category_id_foreign` FOREIGN KEY (`root_category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channels`
--

LOCK TABLES `channels` WRITE;
/*!40000 ALTER TABLE `channels` DISABLE KEYS */;
INSERT INTO `channels` VALUES (1,'default',NULL,'default','http://localhost:8000',NULL,NULL,NULL,0,NULL,1,1,1,'2024-05-06 07:57:04','2024-05-06 07:57:04');
/*!40000 ALTER TABLE `channels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_page_channels`
--

DROP TABLE IF EXISTS `cms_page_channels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms_page_channels` (
  `cms_page_id` int unsigned NOT NULL,
  `channel_id` int unsigned NOT NULL,
  UNIQUE KEY `cms_page_channels_cms_page_id_channel_id_unique` (`cms_page_id`,`channel_id`),
  KEY `cms_page_channels_channel_id_foreign` (`channel_id`),
  CONSTRAINT `cms_page_channels_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cms_page_channels_cms_page_id_foreign` FOREIGN KEY (`cms_page_id`) REFERENCES `cms_pages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_page_channels`
--

LOCK TABLES `cms_page_channels` WRITE;
/*!40000 ALTER TABLE `cms_page_channels` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_page_channels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_page_translations`
--

DROP TABLE IF EXISTS `cms_page_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms_page_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `page_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url_key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `html_content` longtext COLLATE utf8mb4_unicode_ci,
  `meta_title` text COLLATE utf8mb4_unicode_ci,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cms_page_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cms_page_translations_cms_page_id_url_key_locale_unique` (`cms_page_id`,`url_key`,`locale`),
  CONSTRAINT `cms_page_translations_cms_page_id_foreign` FOREIGN KEY (`cms_page_id`) REFERENCES `cms_pages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_page_translations`
--

LOCK TABLES `cms_page_translations` WRITE;
/*!40000 ALTER TABLE `cms_page_translations` DISABLE KEYS */;
INSERT INTO `cms_page_translations` VALUES (1,'About Us','about-us','<div class=\"static-container\"><div class=\"mb-5\">About Us Page Content</div></div>','about us','','aboutus','en',1),(2,'Return Policy','return-policy','<div class=\"static-container\"><div class=\"mb-5\">Return Policy Page Content</div></div>','return policy','','return, policy','en',2),(3,'Refund Policy','refund-policy','<div class=\"static-container\"><div class=\"mb-5\">Refund Policy Page Content</div></div>','Refund policy','','refund, policy','en',3),(4,'Terms & Conditions','terms-conditions','<div class=\"static-container\"><div class=\"mb-5\">Terms & Conditions Page Content</div></div>','Terms & Conditions','','term, conditions','en',4),(5,'Terms of Use','terms-of-use','<div class=\"static-container\"><div class=\"mb-5\">Terms of Use Page Content</div></div>','Terms of use','','term, use','en',5),(6,'Contact Us','contact-us','<div class=\"static-container\"><div class=\"mb-5\">Contact Us Page Content</div></div>','Contact Us','','contact, us','en',6),(7,'Customer Service','customer-service','<div class=\"static-container\"><div class=\"mb-5\">Customer Service Page Content</div></div>','Customer Service','','customer, service','en',7),(8,'What\'s New','whats-new','<div class=\"static-container\"><div class=\"mb-5\">What\'s New page content</div></div>','What\'s New','','new','en',8),(9,'Payment Policy','payment-policy','<div class=\"static-container\"><div class=\"mb-5\">Payment Policy Page Content</div></div>','Payment Policy','','payment, policy','en',9),(10,'Shipping Policy','shipping-policy','<div class=\"static-container\"><div class=\"mb-5\">Shipping Policy Page Content</div></div>','Shipping Policy','','shipping, policy','en',10),(11,'Privacy Policy','privacy-policy','<div class=\"static-container\"><div class=\"mb-5\">Privacy Policy Page Content</div></div>','Privacy Policy','','privacy, policy','en',11);
/*!40000 ALTER TABLE `cms_page_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_pages`
--

DROP TABLE IF EXISTS `cms_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms_pages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `layout` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_pages`
--

LOCK TABLES `cms_pages` WRITE;
/*!40000 ALTER TABLE `cms_pages` DISABLE KEYS */;
INSERT INTO `cms_pages` VALUES (1,NULL,'2024-05-06 07:57:04','2024-05-06 07:57:04'),(2,NULL,'2024-05-06 07:57:04','2024-05-06 07:57:04'),(3,NULL,'2024-05-06 07:57:04','2024-05-06 07:57:04'),(4,NULL,'2024-05-06 07:57:04','2024-05-06 07:57:04'),(5,NULL,'2024-05-06 07:57:04','2024-05-06 07:57:04'),(6,NULL,'2024-05-06 07:57:04','2024-05-06 07:57:04'),(7,NULL,'2024-05-06 07:57:04','2024-05-06 07:57:04'),(8,NULL,'2024-05-06 07:57:04','2024-05-06 07:57:04'),(9,NULL,'2024-05-06 07:57:04','2024-05-06 07:57:04'),(10,NULL,'2024-05-06 07:57:04','2024-05-06 07:57:04'),(11,NULL,'2024-05-06 07:57:04','2024-05-06 07:57:04');
/*!40000 ALTER TABLE `cms_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compare_items`
--

DROP TABLE IF EXISTS `compare_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compare_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int unsigned NOT NULL,
  `customer_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `compare_items_product_id_foreign` (`product_id`),
  KEY `compare_items_customer_id_foreign` (`customer_id`),
  CONSTRAINT `compare_items_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `compare_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compare_items`
--

LOCK TABLES `compare_items` WRITE;
/*!40000 ALTER TABLE `compare_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `compare_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_config`
--

DROP TABLE IF EXISTS `core_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_config` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `channel_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locale_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_config`
--

LOCK TABLES `core_config` WRITE;
/*!40000 ALTER TABLE `core_config` DISABLE KEYS */;
INSERT INTO `core_config` VALUES (1,'catalog.products.guest_checkout.allow_guest_checkout','1',NULL,NULL,'2024-05-06 07:57:04','2024-05-06 14:01:02'),(2,'emails.general.notifications.emails.general.notifications.verification','1',NULL,NULL,'2024-05-06 07:57:04','2024-05-06 07:57:04'),(3,'emails.general.notifications.emails.general.notifications.registration','1',NULL,NULL,'2024-05-06 07:57:04','2024-05-06 07:57:04'),(4,'emails.general.notifications.emails.general.notifications.customer','1',NULL,NULL,'2024-05-06 07:57:04','2024-05-06 07:57:04'),(5,'emails.general.notifications.emails.general.notifications.new_order','1',NULL,NULL,'2024-05-06 07:57:04','2024-05-06 07:57:04'),(6,'emails.general.notifications.emails.general.notifications.new_admin','1',NULL,NULL,'2024-05-06 07:57:04','2024-05-06 07:57:04'),(7,'emails.general.notifications.emails.general.notifications.new_invoice','1',NULL,NULL,'2024-05-06 07:57:04','2024-05-06 07:57:04'),(8,'emails.general.notifications.emails.general.notifications.new_refund','1',NULL,NULL,'2024-05-06 07:57:04','2024-05-06 07:57:04'),(9,'emails.general.notifications.emails.general.notifications.new_shipment','1',NULL,NULL,'2024-05-06 07:57:04','2024-05-06 07:57:04'),(10,'emails.general.notifications.emails.general.notifications.new_inventory_source','1',NULL,NULL,'2024-05-06 07:57:04','2024-05-06 07:57:04'),(11,'emails.general.notifications.emails.general.notifications.cancel_order','1',NULL,NULL,'2024-05-06 07:57:04','2024-05-06 07:57:04'),(12,'customer.settings.social_login.enable_facebook','1','default',NULL,'2024-05-06 07:57:04','2024-05-06 07:57:04'),(13,'customer.settings.social_login.enable_twitter','1','default',NULL,'2024-05-06 07:57:04','2024-05-06 07:57:04'),(14,'customer.settings.social_login.enable_google','1','default',NULL,'2024-05-06 07:57:04','2024-05-06 07:57:04'),(15,'customer.settings.social_login.enable_linkedin','1','default',NULL,'2024-05-06 07:57:04','2024-05-06 07:57:04'),(16,'customer.settings.social_login.enable_github','1','default',NULL,'2024-05-06 07:57:04','2024-05-06 07:57:04'),(17,'catalog.products.product_view_page.no_of_related_products','',NULL,NULL,'2024-05-06 08:08:58','2024-05-06 08:08:58'),(18,'catalog.products.product_view_page.no_of_up_sells_products','',NULL,NULL,'2024-05-06 08:08:58','2024-05-06 08:08:58'),(19,'catalog.products.cart_view_page.no_of_cross_sells_products','',NULL,NULL,'2024-05-06 08:08:58','2024-05-06 08:08:58'),(20,'catalog.products.storefront.search_mode','database',NULL,NULL,'2024-05-06 08:08:58','2024-05-06 08:08:58'),(21,'catalog.products.storefront.products_per_page','12','default',NULL,'2024-05-06 08:08:58','2024-05-06 08:08:58'),(22,'catalog.products.storefront.sort_by','name-asc','default',NULL,'2024-05-06 08:08:58','2024-05-06 08:08:58'),(23,'catalog.products.storefront.buy_now_button_display','0',NULL,NULL,'2024-05-06 08:08:58','2024-05-06 08:08:58'),(24,'catalog.products.cache_small_image.width','',NULL,NULL,'2024-05-06 08:08:58','2024-05-06 08:08:58'),(25,'catalog.products.cache_small_image.height','',NULL,NULL,'2024-05-06 08:08:58','2024-05-06 08:08:58'),(26,'catalog.products.cache_medium_image.width','',NULL,NULL,'2024-05-06 08:08:58','2024-05-06 08:08:58'),(27,'catalog.products.cache_medium_image.height','',NULL,NULL,'2024-05-06 08:08:58','2024-05-06 08:08:58'),(28,'catalog.products.cache_large_image.width','',NULL,NULL,'2024-05-06 08:08:58','2024-05-06 08:08:58'),(29,'catalog.products.cache_large_image.height','',NULL,NULL,'2024-05-06 08:08:58','2024-05-06 08:08:58'),(30,'catalog.products.review.guest_review','0',NULL,NULL,'2024-05-06 08:08:58','2024-05-06 08:08:58'),(31,'catalog.products.attribute.image_attribute_upload_size','',NULL,NULL,'2024-05-06 08:08:58','2024-05-06 08:08:58'),(32,'catalog.products.attribute.file_attribute_upload_size','',NULL,NULL,'2024-05-06 08:08:58','2024-05-06 08:08:58'),(33,'catalog.products.social_share.enabled','0',NULL,NULL,'2024-05-06 08:08:58','2024-05-06 08:08:58'),(34,'catalog.products.social_share.facebook','0',NULL,NULL,'2024-05-06 08:08:58','2024-05-06 08:08:58'),(35,'catalog.products.social_share.twitter','0',NULL,NULL,'2024-05-06 08:08:58','2024-05-06 08:08:58'),(36,'catalog.products.social_share.pinterest','0',NULL,NULL,'2024-05-06 08:08:58','2024-05-06 08:08:58'),(37,'catalog.products.social_share.whatsapp','0',NULL,NULL,'2024-05-06 08:08:58','2024-05-06 08:08:58'),(38,'catalog.products.social_share.linkedin','0',NULL,NULL,'2024-05-06 08:08:58','2024-05-06 08:08:58'),(39,'catalog.products.social_share.email','0',NULL,NULL,'2024-05-06 08:08:58','2024-05-06 08:08:58'),(40,'catalog.products.social_share.share_message','',NULL,NULL,'2024-05-06 08:08:59','2024-05-06 08:08:59'),(41,'general.general.locale_options.weight_unit','kgs','default',NULL,'2024-05-06 10:17:50','2024-05-06 10:17:50');
/*!40000 ALTER TABLE `core_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countries` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=256 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,'AF','Afghanistan'),(2,'AX','Åland Islands'),(3,'AL','Albania'),(4,'DZ','Algeria'),(5,'AS','American Samoa'),(6,'AD','Andorra'),(7,'AO','Angola'),(8,'AI','Anguilla'),(9,'AQ','Antarctica'),(10,'AG','Antigua & Barbuda'),(11,'AR','Argentina'),(12,'AM','Armenia'),(13,'AW','Aruba'),(14,'AC','Ascension Island'),(15,'AU','Australia'),(16,'AT','Austria'),(17,'AZ','Azerbaijan'),(18,'BS','Bahamas'),(19,'BH','Bahrain'),(20,'BD','Bangladesh'),(21,'BB','Barbados'),(22,'BY','Belarus'),(23,'BE','Belgium'),(24,'BZ','Belize'),(25,'BJ','Benin'),(26,'BM','Bermuda'),(27,'BT','Bhutan'),(28,'BO','Bolivia'),(29,'BA','Bosnia & Herzegovina'),(30,'BW','Botswana'),(31,'BR','Brazil'),(32,'IO','British Indian Ocean Territory'),(33,'VG','British Virgin Islands'),(34,'BN','Brunei'),(35,'BG','Bulgaria'),(36,'BF','Burkina Faso'),(37,'BI','Burundi'),(38,'KH','Cambodia'),(39,'CM','Cameroon'),(40,'CA','Canada'),(41,'IC','Canary Islands'),(42,'CV','Cape Verde'),(43,'BQ','Caribbean Netherlands'),(44,'KY','Cayman Islands'),(45,'CF','Central African Republic'),(46,'EA','Ceuta & Melilla'),(47,'TD','Chad'),(48,'CL','Chile'),(49,'CN','China'),(50,'CX','Christmas Island'),(51,'CC','Cocos (Keeling) Islands'),(52,'CO','Colombia'),(53,'KM','Comoros'),(54,'CG','Congo - Brazzaville'),(55,'CD','Congo - Kinshasa'),(56,'CK','Cook Islands'),(57,'CR','Costa Rica'),(58,'CI','Côte d’Ivoire'),(59,'HR','Croatia'),(60,'CU','Cuba'),(61,'CW','Curaçao'),(62,'CY','Cyprus'),(63,'CZ','Czechia'),(64,'DK','Denmark'),(65,'DG','Diego Garcia'),(66,'DJ','Djibouti'),(67,'DM','Dominica'),(68,'DO','Dominican Republic'),(69,'EC','Ecuador'),(70,'EG','Egypt'),(71,'SV','El Salvador'),(72,'GQ','Equatorial Guinea'),(73,'ER','Eritrea'),(74,'EE','Estonia'),(75,'ET','Ethiopia'),(76,'EZ','Eurozone'),(77,'FK','Falkland Islands'),(78,'FO','Faroe Islands'),(79,'FJ','Fiji'),(80,'FI','Finland'),(81,'FR','France'),(82,'GF','French Guiana'),(83,'PF','French Polynesia'),(84,'TF','French Southern Territories'),(85,'GA','Gabon'),(86,'GM','Gambia'),(87,'GE','Georgia'),(88,'DE','Germany'),(89,'GH','Ghana'),(90,'GI','Gibraltar'),(91,'GR','Greece'),(92,'GL','Greenland'),(93,'GD','Grenada'),(94,'GP','Guadeloupe'),(95,'GU','Guam'),(96,'GT','Guatemala'),(97,'GG','Guernsey'),(98,'GN','Guinea'),(99,'GW','Guinea-Bissau'),(100,'GY','Guyana'),(101,'HT','Haiti'),(102,'HN','Honduras'),(103,'HK','Hong Kong SAR China'),(104,'HU','Hungary'),(105,'IS','Iceland'),(106,'IN','India'),(107,'ID','Indonesia'),(108,'IR','Iran'),(109,'IQ','Iraq'),(110,'IE','Ireland'),(111,'IM','Isle of Man'),(112,'IL','Israel'),(113,'IT','Italy'),(114,'JM','Jamaica'),(115,'JP','Japan'),(116,'JE','Jersey'),(117,'JO','Jordan'),(118,'KZ','Kazakhstan'),(119,'KE','Kenya'),(120,'KI','Kiribati'),(121,'XK','Kosovo'),(122,'KW','Kuwait'),(123,'KG','Kyrgyzstan'),(124,'LA','Laos'),(125,'LV','Latvia'),(126,'LB','Lebanon'),(127,'LS','Lesotho'),(128,'LR','Liberia'),(129,'LY','Libya'),(130,'LI','Liechtenstein'),(131,'LT','Lithuania'),(132,'LU','Luxembourg'),(133,'MO','Macau SAR China'),(134,'MK','Macedonia'),(135,'MG','Madagascar'),(136,'MW','Malawi'),(137,'MY','Malaysia'),(138,'MV','Maldives'),(139,'ML','Mali'),(140,'MT','Malta'),(141,'MH','Marshall Islands'),(142,'MQ','Martinique'),(143,'MR','Mauritania'),(144,'MU','Mauritius'),(145,'YT','Mayotte'),(146,'MX','Mexico'),(147,'FM','Micronesia'),(148,'MD','Moldova'),(149,'MC','Monaco'),(150,'MN','Mongolia'),(151,'ME','Montenegro'),(152,'MS','Montserrat'),(153,'MA','Morocco'),(154,'MZ','Mozambique'),(155,'MM','Myanmar (Burma)'),(156,'NA','Namibia'),(157,'NR','Nauru'),(158,'NP','Nepal'),(159,'NL','Netherlands'),(160,'NC','New Caledonia'),(161,'NZ','New Zealand'),(162,'NI','Nicaragua'),(163,'NE','Niger'),(164,'NG','Nigeria'),(165,'NU','Niue'),(166,'NF','Norfolk Island'),(167,'KP','North Korea'),(168,'MP','Northern Mariana Islands'),(169,'NO','Norway'),(170,'OM','Oman'),(171,'PK','Pakistan'),(172,'PW','Palau'),(173,'PS','Palestinian Territories'),(174,'PA','Panama'),(175,'PG','Papua New Guinea'),(176,'PY','Paraguay'),(177,'PE','Peru'),(178,'PH','Philippines'),(179,'PN','Pitcairn Islands'),(180,'PL','Poland'),(181,'PT','Portugal'),(182,'PR','Puerto Rico'),(183,'QA','Qatar'),(184,'RE','Réunion'),(185,'RO','Romania'),(186,'RU','Russia'),(187,'RW','Rwanda'),(188,'WS','Samoa'),(189,'SM','San Marino'),(190,'ST','São Tomé & Príncipe'),(191,'SA','Saudi Arabia'),(192,'SN','Senegal'),(193,'RS','Serbia'),(194,'SC','Seychelles'),(195,'SL','Sierra Leone'),(196,'SG','Singapore'),(197,'SX','Sint Maarten'),(198,'SK','Slovakia'),(199,'SI','Slovenia'),(200,'SB','Solomon Islands'),(201,'SO','Somalia'),(202,'ZA','South Africa'),(203,'GS','South Georgia & South Sandwich Islands'),(204,'KR','South Korea'),(205,'SS','South Sudan'),(206,'ES','Spain'),(207,'LK','Sri Lanka'),(208,'BL','St. Barthélemy'),(209,'SH','St. Helena'),(210,'KN','St. Kitts & Nevis'),(211,'LC','St. Lucia'),(212,'MF','St. Martin'),(213,'PM','St. Pierre & Miquelon'),(214,'VC','St. Vincent & Grenadines'),(215,'SD','Sudan'),(216,'SR','Suriname'),(217,'SJ','Svalbard & Jan Mayen'),(218,'SZ','Swaziland'),(219,'SE','Sweden'),(220,'CH','Switzerland'),(221,'SY','Syria'),(222,'TW','Taiwan'),(223,'TJ','Tajikistan'),(224,'TZ','Tanzania'),(225,'TH','Thailand'),(226,'TL','Timor-Leste'),(227,'TG','Togo'),(228,'TK','Tokelau'),(229,'TO','Tonga'),(230,'TT','Trinidad & Tobago'),(231,'TA','Tristan da Cunha'),(232,'TN','Tunisia'),(233,'TR','Turkey'),(234,'TM','Turkmenistan'),(235,'TC','Turks & Caicos Islands'),(236,'TV','Tuvalu'),(237,'UM','U.S. Outlying Islands'),(238,'VI','U.S. Virgin Islands'),(239,'UG','Uganda'),(240,'UA','Ukraine'),(241,'AE','United Arab Emirates'),(242,'GB','United Kingdom'),(243,'UN','United Nations'),(244,'US','United States'),(245,'UY','Uruguay'),(246,'UZ','Uzbekistan'),(247,'VU','Vanuatu'),(248,'VA','Vatican City'),(249,'VE','Venezuela'),(250,'VN','Vietnam'),(251,'WF','Wallis & Futuna'),(252,'EH','Western Sahara'),(253,'YE','Yemen'),(254,'ZM','Zambia'),(255,'ZW','Zimbabwe');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country_state_translations`
--

DROP TABLE IF EXISTS `country_state_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country_state_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `country_state_id` int unsigned NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `default_name` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `country_state_translations_country_state_id_foreign` (`country_state_id`),
  CONSTRAINT `country_state_translations_country_state_id_foreign` FOREIGN KEY (`country_state_id`) REFERENCES `country_states` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country_state_translations`
--

LOCK TABLES `country_state_translations` WRITE;
/*!40000 ALTER TABLE `country_state_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `country_state_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country_states`
--

DROP TABLE IF EXISTS `country_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country_states` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `country_id` int unsigned DEFAULT NULL,
  `country_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `country_states_country_id_foreign` (`country_id`),
  CONSTRAINT `country_states_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country_states`
--

LOCK TABLES `country_states` WRITE;
/*!40000 ALTER TABLE `country_states` DISABLE KEYS */;
INSERT INTO `country_states` VALUES (1,244,'US','AL','Alabama'),(2,244,'US','AK','Alaska'),(3,244,'US','AS','American Samoa'),(4,244,'US','AZ','Arizona'),(5,244,'US','AR','Arkansas'),(6,244,'US','AE','Armed Forces Africa'),(7,244,'US','AA','Armed Forces Americas'),(8,244,'US','AE','Armed Forces Canada'),(9,244,'US','AE','Armed Forces Europe'),(10,244,'US','AE','Armed Forces Middle East'),(11,244,'US','AP','Armed Forces Pacific'),(12,244,'US','CA','California'),(13,244,'US','CO','Colorado'),(14,244,'US','CT','Connecticut'),(15,244,'US','DE','Delaware'),(16,244,'US','DC','District of Columbia'),(17,244,'US','FM','Federated States Of Micronesia'),(18,244,'US','FL','Florida'),(19,244,'US','GA','Georgia'),(20,244,'US','GU','Guam'),(21,244,'US','HI','Hawaii'),(22,244,'US','ID','Idaho'),(23,244,'US','IL','Illinois'),(24,244,'US','IN','Indiana'),(25,244,'US','IA','Iowa'),(26,244,'US','KS','Kansas'),(27,244,'US','KY','Kentucky'),(28,244,'US','LA','Louisiana'),(29,244,'US','ME','Maine'),(30,244,'US','MH','Marshall Islands'),(31,244,'US','MD','Maryland'),(32,244,'US','MA','Massachusetts'),(33,244,'US','MI','Michigan'),(34,244,'US','MN','Minnesota'),(35,244,'US','MS','Mississippi'),(36,244,'US','MO','Missouri'),(37,244,'US','MT','Montana'),(38,244,'US','NE','Nebraska'),(39,244,'US','NV','Nevada'),(40,244,'US','NH','New Hampshire'),(41,244,'US','NJ','New Jersey'),(42,244,'US','NM','New Mexico'),(43,244,'US','NY','New York'),(44,244,'US','NC','North Carolina'),(45,244,'US','ND','North Dakota'),(46,244,'US','MP','Northern Mariana Islands'),(47,244,'US','OH','Ohio'),(48,244,'US','OK','Oklahoma'),(49,244,'US','OR','Oregon'),(50,244,'US','PW','Palau'),(51,244,'US','PA','Pennsylvania'),(52,244,'US','PR','Puerto Rico'),(53,244,'US','RI','Rhode Island'),(54,244,'US','SC','South Carolina'),(55,244,'US','SD','South Dakota'),(56,244,'US','TN','Tennessee'),(57,244,'US','TX','Texas'),(58,244,'US','UT','Utah'),(59,244,'US','VT','Vermont'),(60,244,'US','VI','Virgin Islands'),(61,244,'US','VA','Virginia'),(62,244,'US','WA','Washington'),(63,244,'US','WV','West Virginia'),(64,244,'US','WI','Wisconsin'),(65,244,'US','WY','Wyoming'),(66,40,'CA','AB','Alberta'),(67,40,'CA','BC','British Columbia'),(68,40,'CA','MB','Manitoba'),(69,40,'CA','NL','Newfoundland and Labrador'),(70,40,'CA','NB','New Brunswick'),(71,40,'CA','NS','Nova Scotia'),(72,40,'CA','NT','Northwest Territories'),(73,40,'CA','NU','Nunavut'),(74,40,'CA','ON','Ontario'),(75,40,'CA','PE','Prince Edward Island'),(76,40,'CA','QC','Quebec'),(77,40,'CA','SK','Saskatchewan'),(78,40,'CA','YT','Yukon Territory'),(79,88,'DE','NDS','Niedersachsen'),(80,88,'DE','BAW','Baden-Württemberg'),(81,88,'DE','BAY','Bayern'),(82,88,'DE','BER','Berlin'),(83,88,'DE','BRG','Brandenburg'),(84,88,'DE','BRE','Bremen'),(85,88,'DE','HAM','Hamburg'),(86,88,'DE','HES','Hessen'),(87,88,'DE','MEC','Mecklenburg-Vorpommern'),(88,88,'DE','NRW','Nordrhein-Westfalen'),(89,88,'DE','RHE','Rheinland-Pfalz'),(90,88,'DE','SAR','Saarland'),(91,88,'DE','SAS','Sachsen'),(92,88,'DE','SAC','Sachsen-Anhalt'),(93,88,'DE','SCN','Schleswig-Holstein'),(94,88,'DE','THE','Thüringen'),(95,16,'AT','WI','Wien'),(96,16,'AT','NO','Niederösterreich'),(97,16,'AT','OO','Oberösterreich'),(98,16,'AT','SB','Salzburg'),(99,16,'AT','KN','Kärnten'),(100,16,'AT','ST','Steiermark'),(101,16,'AT','TI','Tirol'),(102,16,'AT','BL','Burgenland'),(103,16,'AT','VB','Vorarlberg'),(104,220,'CH','AG','Aargau'),(105,220,'CH','AI','Appenzell Innerrhoden'),(106,220,'CH','AR','Appenzell Ausserrhoden'),(107,220,'CH','BE','Bern'),(108,220,'CH','BL','Basel-Landschaft'),(109,220,'CH','BS','Basel-Stadt'),(110,220,'CH','FR','Freiburg'),(111,220,'CH','GE','Genf'),(112,220,'CH','GL','Glarus'),(113,220,'CH','GR','Graubünden'),(114,220,'CH','JU','Jura'),(115,220,'CH','LU','Luzern'),(116,220,'CH','NE','Neuenburg'),(117,220,'CH','NW','Nidwalden'),(118,220,'CH','OW','Obwalden'),(119,220,'CH','SG','St. Gallen'),(120,220,'CH','SH','Schaffhausen'),(121,220,'CH','SO','Solothurn'),(122,220,'CH','SZ','Schwyz'),(123,220,'CH','TG','Thurgau'),(124,220,'CH','TI','Tessin'),(125,220,'CH','UR','Uri'),(126,220,'CH','VD','Waadt'),(127,220,'CH','VS','Wallis'),(128,220,'CH','ZG','Zug'),(129,220,'CH','ZH','Zürich'),(130,206,'ES','A Coruсa','A Coruña'),(131,206,'ES','Alava','Alava'),(132,206,'ES','Albacete','Albacete'),(133,206,'ES','Alicante','Alicante'),(134,206,'ES','Almeria','Almeria'),(135,206,'ES','Asturias','Asturias'),(136,206,'ES','Avila','Avila'),(137,206,'ES','Badajoz','Badajoz'),(138,206,'ES','Baleares','Baleares'),(139,206,'ES','Barcelona','Barcelona'),(140,206,'ES','Burgos','Burgos'),(141,206,'ES','Caceres','Caceres'),(142,206,'ES','Cadiz','Cadiz'),(143,206,'ES','Cantabria','Cantabria'),(144,206,'ES','Castellon','Castellon'),(145,206,'ES','Ceuta','Ceuta'),(146,206,'ES','Ciudad Real','Ciudad Real'),(147,206,'ES','Cordoba','Cordoba'),(148,206,'ES','Cuenca','Cuenca'),(149,206,'ES','Girona','Girona'),(150,206,'ES','Granada','Granada'),(151,206,'ES','Guadalajara','Guadalajara'),(152,206,'ES','Guipuzcoa','Guipuzcoa'),(153,206,'ES','Huelva','Huelva'),(154,206,'ES','Huesca','Huesca'),(155,206,'ES','Jaen','Jaen'),(156,206,'ES','La Rioja','La Rioja'),(157,206,'ES','Las Palmas','Las Palmas'),(158,206,'ES','Leon','Leon'),(159,206,'ES','Lleida','Lleida'),(160,206,'ES','Lugo','Lugo'),(161,206,'ES','Madrid','Madrid'),(162,206,'ES','Malaga','Malaga'),(163,206,'ES','Melilla','Melilla'),(164,206,'ES','Murcia','Murcia'),(165,206,'ES','Navarra','Navarra'),(166,206,'ES','Ourense','Ourense'),(167,206,'ES','Palencia','Palencia'),(168,206,'ES','Pontevedra','Pontevedra'),(169,206,'ES','Salamanca','Salamanca'),(170,206,'ES','Santa Cruz de Tenerife','Santa Cruz de Tenerife'),(171,206,'ES','Segovia','Segovia'),(172,206,'ES','Sevilla','Sevilla'),(173,206,'ES','Soria','Soria'),(174,206,'ES','Tarragona','Tarragona'),(175,206,'ES','Teruel','Teruel'),(176,206,'ES','Toledo','Toledo'),(177,206,'ES','Valencia','Valencia'),(178,206,'ES','Valladolid','Valladolid'),(179,206,'ES','Vizcaya','Vizcaya'),(180,206,'ES','Zamora','Zamora'),(181,206,'ES','Zaragoza','Zaragoza'),(182,81,'FR','1','Ain'),(183,81,'FR','2','Aisne'),(184,81,'FR','3','Allier'),(185,81,'FR','4','Alpes-de-Haute-Provence'),(186,81,'FR','5','Hautes-Alpes'),(187,81,'FR','6','Alpes-Maritimes'),(188,81,'FR','7','Ardèche'),(189,81,'FR','8','Ardennes'),(190,81,'FR','9','Ariège'),(191,81,'FR','10','Aube'),(192,81,'FR','11','Aude'),(193,81,'FR','12','Aveyron'),(194,81,'FR','13','Bouches-du-Rhône'),(195,81,'FR','14','Calvados'),(196,81,'FR','15','Cantal'),(197,81,'FR','16','Charente'),(198,81,'FR','17','Charente-Maritime'),(199,81,'FR','18','Cher'),(200,81,'FR','19','Corrèze'),(201,81,'FR','2A','Corse-du-Sud'),(202,81,'FR','2B','Haute-Corse'),(203,81,'FR','21','Côte-d\'Or'),(204,81,'FR','22','Côtes-d\'Armor'),(205,81,'FR','23','Creuse'),(206,81,'FR','24','Dordogne'),(207,81,'FR','25','Doubs'),(208,81,'FR','26','Drôme'),(209,81,'FR','27','Eure'),(210,81,'FR','28','Eure-et-Loir'),(211,81,'FR','29','Finistère'),(212,81,'FR','30','Gard'),(213,81,'FR','31','Haute-Garonne'),(214,81,'FR','32','Gers'),(215,81,'FR','33','Gironde'),(216,81,'FR','34','Hérault'),(217,81,'FR','35','Ille-et-Vilaine'),(218,81,'FR','36','Indre'),(219,81,'FR','37','Indre-et-Loire'),(220,81,'FR','38','Isère'),(221,81,'FR','39','Jura'),(222,81,'FR','40','Landes'),(223,81,'FR','41','Loir-et-Cher'),(224,81,'FR','42','Loire'),(225,81,'FR','43','Haute-Loire'),(226,81,'FR','44','Loire-Atlantique'),(227,81,'FR','45','Loiret'),(228,81,'FR','46','Lot'),(229,81,'FR','47','Lot-et-Garonne'),(230,81,'FR','48','Lozère'),(231,81,'FR','49','Maine-et-Loire'),(232,81,'FR','50','Manche'),(233,81,'FR','51','Marne'),(234,81,'FR','52','Haute-Marne'),(235,81,'FR','53','Mayenne'),(236,81,'FR','54','Meurthe-et-Moselle'),(237,81,'FR','55','Meuse'),(238,81,'FR','56','Morbihan'),(239,81,'FR','57','Moselle'),(240,81,'FR','58','Nièvre'),(241,81,'FR','59','Nord'),(242,81,'FR','60','Oise'),(243,81,'FR','61','Orne'),(244,81,'FR','62','Pas-de-Calais'),(245,81,'FR','63','Puy-de-Dôme'),(246,81,'FR','64','Pyrénées-Atlantiques'),(247,81,'FR','65','Hautes-Pyrénées'),(248,81,'FR','66','Pyrénées-Orientales'),(249,81,'FR','67','Bas-Rhin'),(250,81,'FR','68','Haut-Rhin'),(251,81,'FR','69','Rhône'),(252,81,'FR','70','Haute-Saône'),(253,81,'FR','71','Saône-et-Loire'),(254,81,'FR','72','Sarthe'),(255,81,'FR','73','Savoie'),(256,81,'FR','74','Haute-Savoie'),(257,81,'FR','75','Paris'),(258,81,'FR','76','Seine-Maritime'),(259,81,'FR','77','Seine-et-Marne'),(260,81,'FR','78','Yvelines'),(261,81,'FR','79','Deux-Sèvres'),(262,81,'FR','80','Somme'),(263,81,'FR','81','Tarn'),(264,81,'FR','82','Tarn-et-Garonne'),(265,81,'FR','83','Var'),(266,81,'FR','84','Vaucluse'),(267,81,'FR','85','Vendée'),(268,81,'FR','86','Vienne'),(269,81,'FR','87','Haute-Vienne'),(270,81,'FR','88','Vosges'),(271,81,'FR','89','Yonne'),(272,81,'FR','90','Territoire-de-Belfort'),(273,81,'FR','91','Essonne'),(274,81,'FR','92','Hauts-de-Seine'),(275,81,'FR','93','Seine-Saint-Denis'),(276,81,'FR','94','Val-de-Marne'),(277,81,'FR','95','Val-d\'Oise'),(278,185,'RO','AB','Alba'),(279,185,'RO','AR','Arad'),(280,185,'RO','AG','Argeş'),(281,185,'RO','BC','Bacău'),(282,185,'RO','BH','Bihor'),(283,185,'RO','BN','Bistriţa-Năsăud'),(284,185,'RO','BT','Botoşani'),(285,185,'RO','BV','Braşov'),(286,185,'RO','BR','Brăila'),(287,185,'RO','B','Bucureşti'),(288,185,'RO','BZ','Buzău'),(289,185,'RO','CS','Caraş-Severin'),(290,185,'RO','CL','Călăraşi'),(291,185,'RO','CJ','Cluj'),(292,185,'RO','CT','Constanţa'),(293,185,'RO','CV','Covasna'),(294,185,'RO','DB','Dâmboviţa'),(295,185,'RO','DJ','Dolj'),(296,185,'RO','GL','Galaţi'),(297,185,'RO','GR','Giurgiu'),(298,185,'RO','GJ','Gorj'),(299,185,'RO','HR','Harghita'),(300,185,'RO','HD','Hunedoara'),(301,185,'RO','IL','Ialomiţa'),(302,185,'RO','IS','Iaşi'),(303,185,'RO','IF','Ilfov'),(304,185,'RO','MM','Maramureş'),(305,185,'RO','MH','Mehedinţi'),(306,185,'RO','MS','Mureş'),(307,185,'RO','NT','Neamţ'),(308,185,'RO','OT','Olt'),(309,185,'RO','PH','Prahova'),(310,185,'RO','SM','Satu-Mare'),(311,185,'RO','SJ','Sălaj'),(312,185,'RO','SB','Sibiu'),(313,185,'RO','SV','Suceava'),(314,185,'RO','TR','Teleorman'),(315,185,'RO','TM','Timiş'),(316,185,'RO','TL','Tulcea'),(317,185,'RO','VS','Vaslui'),(318,185,'RO','VL','Vâlcea'),(319,185,'RO','VN','Vrancea'),(320,80,'FI','Lappi','Lappi'),(321,80,'FI','Pohjois-Pohjanmaa','Pohjois-Pohjanmaa'),(322,80,'FI','Kainuu','Kainuu'),(323,80,'FI','Pohjois-Karjala','Pohjois-Karjala'),(324,80,'FI','Pohjois-Savo','Pohjois-Savo'),(325,80,'FI','Etelä-Savo','Etelä-Savo'),(326,80,'FI','Etelä-Pohjanmaa','Etelä-Pohjanmaa'),(327,80,'FI','Pohjanmaa','Pohjanmaa'),(328,80,'FI','Pirkanmaa','Pirkanmaa'),(329,80,'FI','Satakunta','Satakunta'),(330,80,'FI','Keski-Pohjanmaa','Keski-Pohjanmaa'),(331,80,'FI','Keski-Suomi','Keski-Suomi'),(332,80,'FI','Varsinais-Suomi','Varsinais-Suomi'),(333,80,'FI','Etelä-Karjala','Etelä-Karjala'),(334,80,'FI','Päijät-Häme','Päijät-Häme'),(335,80,'FI','Kanta-Häme','Kanta-Häme'),(336,80,'FI','Uusimaa','Uusimaa'),(337,80,'FI','Itä-Uusimaa','Itä-Uusimaa'),(338,80,'FI','Kymenlaakso','Kymenlaakso'),(339,80,'FI','Ahvenanmaa','Ahvenanmaa'),(340,74,'EE','EE-37','Harjumaa'),(341,74,'EE','EE-39','Hiiumaa'),(342,74,'EE','EE-44','Ida-Virumaa'),(343,74,'EE','EE-49','Jõgevamaa'),(344,74,'EE','EE-51','Järvamaa'),(345,74,'EE','EE-57','Läänemaa'),(346,74,'EE','EE-59','Lääne-Virumaa'),(347,74,'EE','EE-65','Põlvamaa'),(348,74,'EE','EE-67','Pärnumaa'),(349,74,'EE','EE-70','Raplamaa'),(350,74,'EE','EE-74','Saaremaa'),(351,74,'EE','EE-78','Tartumaa'),(352,74,'EE','EE-82','Valgamaa'),(353,74,'EE','EE-84','Viljandimaa'),(354,74,'EE','EE-86','Võrumaa'),(355,125,'LV','LV-DGV','Daugavpils'),(356,125,'LV','LV-JEL','Jelgava'),(357,125,'LV','Jēkabpils','Jēkabpils'),(358,125,'LV','LV-JUR','Jūrmala'),(359,125,'LV','LV-LPX','Liepāja'),(360,125,'LV','LV-LE','Liepājas novads'),(361,125,'LV','LV-REZ','Rēzekne'),(362,125,'LV','LV-RIX','Rīga'),(363,125,'LV','LV-RI','Rīgas novads'),(364,125,'LV','Valmiera','Valmiera'),(365,125,'LV','LV-VEN','Ventspils'),(366,125,'LV','Aglonas novads','Aglonas novads'),(367,125,'LV','LV-AI','Aizkraukles novads'),(368,125,'LV','Aizputes novads','Aizputes novads'),(369,125,'LV','Aknīstes novads','Aknīstes novads'),(370,125,'LV','Alojas novads','Alojas novads'),(371,125,'LV','Alsungas novads','Alsungas novads'),(372,125,'LV','LV-AL','Alūksnes novads'),(373,125,'LV','Amatas novads','Amatas novads'),(374,125,'LV','Apes novads','Apes novads'),(375,125,'LV','Auces novads','Auces novads'),(376,125,'LV','Babītes novads','Babītes novads'),(377,125,'LV','Baldones novads','Baldones novads'),(378,125,'LV','Baltinavas novads','Baltinavas novads'),(379,125,'LV','LV-BL','Balvu novads'),(380,125,'LV','LV-BU','Bauskas novads'),(381,125,'LV','Beverīnas novads','Beverīnas novads'),(382,125,'LV','Brocēnu novads','Brocēnu novads'),(383,125,'LV','Burtnieku novads','Burtnieku novads'),(384,125,'LV','Carnikavas novads','Carnikavas novads'),(385,125,'LV','Cesvaines novads','Cesvaines novads'),(386,125,'LV','Ciblas novads','Ciblas novads'),(387,125,'LV','LV-CE','Cēsu novads'),(388,125,'LV','Dagdas novads','Dagdas novads'),(389,125,'LV','LV-DA','Daugavpils novads'),(390,125,'LV','LV-DO','Dobeles novads'),(391,125,'LV','Dundagas novads','Dundagas novads'),(392,125,'LV','Durbes novads','Durbes novads'),(393,125,'LV','Engures novads','Engures novads'),(394,125,'LV','Garkalnes novads','Garkalnes novads'),(395,125,'LV','Grobiņas novads','Grobiņas novads'),(396,125,'LV','LV-GU','Gulbenes novads'),(397,125,'LV','Iecavas novads','Iecavas novads'),(398,125,'LV','Ikšķiles novads','Ikšķiles novads'),(399,125,'LV','Ilūkstes novads','Ilūkstes novads'),(400,125,'LV','Inčukalna novads','Inčukalna novads'),(401,125,'LV','Jaunjelgavas novads','Jaunjelgavas novads'),(402,125,'LV','Jaunpiebalgas novads','Jaunpiebalgas novads'),(403,125,'LV','Jaunpils novads','Jaunpils novads'),(404,125,'LV','LV-JL','Jelgavas novads'),(405,125,'LV','LV-JK','Jēkabpils novads'),(406,125,'LV','Kandavas novads','Kandavas novads'),(407,125,'LV','Kokneses novads','Kokneses novads'),(408,125,'LV','Krimuldas novads','Krimuldas novads'),(409,125,'LV','Krustpils novads','Krustpils novads'),(410,125,'LV','LV-KR','Krāslavas novads'),(411,125,'LV','LV-KU','Kuldīgas novads'),(412,125,'LV','Kārsavas novads','Kārsavas novads'),(413,125,'LV','Lielvārdes novads','Lielvārdes novads'),(414,125,'LV','LV-LM','Limbažu novads'),(415,125,'LV','Lubānas novads','Lubānas novads'),(416,125,'LV','LV-LU','Ludzas novads'),(417,125,'LV','Līgatnes novads','Līgatnes novads'),(418,125,'LV','Līvānu novads','Līvānu novads'),(419,125,'LV','LV-MA','Madonas novads'),(420,125,'LV','Mazsalacas novads','Mazsalacas novads'),(421,125,'LV','Mālpils novads','Mālpils novads'),(422,125,'LV','Mārupes novads','Mārupes novads'),(423,125,'LV','Naukšēnu novads','Naukšēnu novads'),(424,125,'LV','Neretas novads','Neretas novads'),(425,125,'LV','Nīcas novads','Nīcas novads'),(426,125,'LV','LV-OG','Ogres novads'),(427,125,'LV','Olaines novads','Olaines novads'),(428,125,'LV','Ozolnieku novads','Ozolnieku novads'),(429,125,'LV','LV-PR','Preiļu novads'),(430,125,'LV','Priekules novads','Priekules novads'),(431,125,'LV','Priekuļu novads','Priekuļu novads'),(432,125,'LV','Pārgaujas novads','Pārgaujas novads'),(433,125,'LV','Pāvilostas novads','Pāvilostas novads'),(434,125,'LV','Pļaviņu novads','Pļaviņu novads'),(435,125,'LV','Raunas novads','Raunas novads'),(436,125,'LV','Riebiņu novads','Riebiņu novads'),(437,125,'LV','Rojas novads','Rojas novads'),(438,125,'LV','Ropažu novads','Ropažu novads'),(439,125,'LV','Rucavas novads','Rucavas novads'),(440,125,'LV','Rugāju novads','Rugāju novads'),(441,125,'LV','Rundāles novads','Rundāles novads'),(442,125,'LV','LV-RE','Rēzeknes novads'),(443,125,'LV','Rūjienas novads','Rūjienas novads'),(444,125,'LV','Salacgrīvas novads','Salacgrīvas novads'),(445,125,'LV','Salas novads','Salas novads'),(446,125,'LV','Salaspils novads','Salaspils novads'),(447,125,'LV','LV-SA','Saldus novads'),(448,125,'LV','Saulkrastu novads','Saulkrastu novads'),(449,125,'LV','Siguldas novads','Siguldas novads'),(450,125,'LV','Skrundas novads','Skrundas novads'),(451,125,'LV','Skrīveru novads','Skrīveru novads'),(452,125,'LV','Smiltenes novads','Smiltenes novads'),(453,125,'LV','Stopiņu novads','Stopiņu novads'),(454,125,'LV','Strenču novads','Strenču novads'),(455,125,'LV','Sējas novads','Sējas novads'),(456,125,'LV','LV-TA','Talsu novads'),(457,125,'LV','LV-TU','Tukuma novads'),(458,125,'LV','Tērvetes novads','Tērvetes novads'),(459,125,'LV','Vaiņodes novads','Vaiņodes novads'),(460,125,'LV','LV-VK','Valkas novads'),(461,125,'LV','LV-VM','Valmieras novads'),(462,125,'LV','Varakļānu novads','Varakļānu novads'),(463,125,'LV','Vecpiebalgas novads','Vecpiebalgas novads'),(464,125,'LV','Vecumnieku novads','Vecumnieku novads'),(465,125,'LV','LV-VE','Ventspils novads'),(466,125,'LV','Viesītes novads','Viesītes novads'),(467,125,'LV','Viļakas novads','Viļakas novads'),(468,125,'LV','Viļānu novads','Viļānu novads'),(469,125,'LV','Vārkavas novads','Vārkavas novads'),(470,125,'LV','Zilupes novads','Zilupes novads'),(471,125,'LV','Ādažu novads','Ādažu novads'),(472,125,'LV','Ērgļu novads','Ērgļu novads'),(473,125,'LV','Ķeguma novads','Ķeguma novads'),(474,125,'LV','Ķekavas novads','Ķekavas novads'),(475,131,'LT','LT-AL','Alytaus Apskritis'),(476,131,'LT','LT-KU','Kauno Apskritis'),(477,131,'LT','LT-KL','Klaipėdos Apskritis'),(478,131,'LT','LT-MR','Marijampolės Apskritis'),(479,131,'LT','LT-PN','Panevėžio Apskritis'),(480,131,'LT','LT-SA','Šiaulių Apskritis'),(481,131,'LT','LT-TA','Tauragės Apskritis'),(482,131,'LT','LT-TE','Telšių Apskritis'),(483,131,'LT','LT-UT','Utenos Apskritis'),(484,131,'LT','LT-VL','Vilniaus Apskritis'),(485,31,'BR','AC','Acre'),(486,31,'BR','AL','Alagoas'),(487,31,'BR','AP','Amapá'),(488,31,'BR','AM','Amazonas'),(489,31,'BR','BA','Bahia'),(490,31,'BR','CE','Ceará'),(491,31,'BR','ES','Espírito Santo'),(492,31,'BR','GO','Goiás'),(493,31,'BR','MA','Maranhão'),(494,31,'BR','MT','Mato Grosso'),(495,31,'BR','MS','Mato Grosso do Sul'),(496,31,'BR','MG','Minas Gerais'),(497,31,'BR','PA','Pará'),(498,31,'BR','PB','Paraíba'),(499,31,'BR','PR','Paraná'),(500,31,'BR','PE','Pernambuco'),(501,31,'BR','PI','Piauí'),(502,31,'BR','RJ','Rio de Janeiro'),(503,31,'BR','RN','Rio Grande do Norte'),(504,31,'BR','RS','Rio Grande do Sul'),(505,31,'BR','RO','Rondônia'),(506,31,'BR','RR','Roraima'),(507,31,'BR','SC','Santa Catarina'),(508,31,'BR','SP','São Paulo'),(509,31,'BR','SE','Sergipe'),(510,31,'BR','TO','Tocantins'),(511,31,'BR','DF','Distrito Federal'),(512,59,'HR','HR-01','Zagrebačka županija'),(513,59,'HR','HR-02','Krapinsko-zagorska županija'),(514,59,'HR','HR-03','Sisačko-moslavačka županija'),(515,59,'HR','HR-04','Karlovačka županija'),(516,59,'HR','HR-05','Varaždinska županija'),(517,59,'HR','HR-06','Koprivničko-križevačka županija'),(518,59,'HR','HR-07','Bjelovarsko-bilogorska županija'),(519,59,'HR','HR-08','Primorsko-goranska županija'),(520,59,'HR','HR-09','Ličko-senjska županija'),(521,59,'HR','HR-10','Virovitičko-podravska županija'),(522,59,'HR','HR-11','Požeško-slavonska županija'),(523,59,'HR','HR-12','Brodsko-posavska županija'),(524,59,'HR','HR-13','Zadarska županija'),(525,59,'HR','HR-14','Osječko-baranjska županija'),(526,59,'HR','HR-15','Šibensko-kninska županija'),(527,59,'HR','HR-16','Vukovarsko-srijemska županija'),(528,59,'HR','HR-17','Splitsko-dalmatinska županija'),(529,59,'HR','HR-18','Istarska županija'),(530,59,'HR','HR-19','Dubrovačko-neretvanska županija'),(531,59,'HR','HR-20','Međimurska županija'),(532,59,'HR','HR-21','Grad Zagreb'),(533,106,'IN','AN','Andaman and Nicobar Islands'),(534,106,'IN','AP','Andhra Pradesh'),(535,106,'IN','AR','Arunachal Pradesh'),(536,106,'IN','AS','Assam'),(537,106,'IN','BR','Bihar'),(538,106,'IN','CH','Chandigarh'),(539,106,'IN','CT','Chhattisgarh'),(540,106,'IN','DN','Dadra and Nagar Haveli'),(541,106,'IN','DD','Daman and Diu'),(542,106,'IN','DL','Delhi'),(543,106,'IN','GA','Goa'),(544,106,'IN','GJ','Gujarat'),(545,106,'IN','HR','Haryana'),(546,106,'IN','HP','Himachal Pradesh'),(547,106,'IN','JK','Jammu and Kashmir'),(548,106,'IN','JH','Jharkhand'),(549,106,'IN','KA','Karnataka'),(550,106,'IN','KL','Kerala'),(551,106,'IN','LD','Lakshadweep'),(552,106,'IN','MP','Madhya Pradesh'),(553,106,'IN','MH','Maharashtra'),(554,106,'IN','MN','Manipur'),(555,106,'IN','ML','Meghalaya'),(556,106,'IN','MZ','Mizoram'),(557,106,'IN','NL','Nagaland'),(558,106,'IN','OR','Odisha'),(559,106,'IN','PY','Puducherry'),(560,106,'IN','PB','Punjab'),(561,106,'IN','RJ','Rajasthan'),(562,106,'IN','SK','Sikkim'),(563,106,'IN','TN','Tamil Nadu'),(564,106,'IN','TG','Telangana'),(565,106,'IN','TR','Tripura'),(566,106,'IN','UP','Uttar Pradesh'),(567,106,'IN','UT','Uttarakhand'),(568,106,'IN','WB','West Bengal'),(569,176,'PY','PY-16','Alto Paraguay'),(570,176,'PY','PY-10','Alto Paraná'),(571,176,'PY','PY-13','Amambay'),(572,176,'PY','PY-ASU','Asunción'),(573,176,'PY','PY-19','Boquerón'),(574,176,'PY','PY-5','Caaguazú'),(575,176,'PY','PY-6','Caazapá'),(576,176,'PY','PY-14','Canindeyú'),(577,176,'PY','PY-11','Central'),(578,176,'PY','PY-1','Concepción'),(579,176,'PY','PY-3','Cordillera'),(580,176,'PY','PY-4','Guairá'),(581,176,'PY','PY-7','Itapúa'),(582,176,'PY','PY-8','Misiones'),(583,176,'PY','PY-9','Paraguarí'),(584,176,'PY','PY-15','Presidente Hayes'),(585,176,'PY','PY-2','San Pedro'),(586,176,'PY','PY-12','Ñeembucú');
/*!40000 ALTER TABLE `country_states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country_translations`
--

DROP TABLE IF EXISTS `country_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `country_id` int unsigned NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `country_translations_country_id_foreign` (`country_id`),
  CONSTRAINT `country_translations_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country_translations`
--

LOCK TABLES `country_translations` WRITE;
/*!40000 ALTER TABLE `country_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `country_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currencies`
--

DROP TABLE IF EXISTS `currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `currencies` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `decimal` int unsigned NOT NULL DEFAULT '2',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currencies`
--

LOCK TABLES `currencies` WRITE;
/*!40000 ALTER TABLE `currencies` DISABLE KEYS */;
INSERT INTO `currencies` VALUES (1,'USD','US Dollar','$',2,NULL,NULL),(2,'INR','INR','₹',83,'2024-05-06 15:37:56','2024-05-06 15:37:56');
/*!40000 ALTER TABLE `currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currency_exchange_rates`
--

DROP TABLE IF EXISTS `currency_exchange_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `currency_exchange_rates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `rate` decimal(24,12) NOT NULL,
  `target_currency` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `currency_exchange_rates_target_currency_unique` (`target_currency`),
  CONSTRAINT `currency_exchange_rates_target_currency_foreign` FOREIGN KEY (`target_currency`) REFERENCES `currencies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currency_exchange_rates`
--

LOCK TABLES `currency_exchange_rates` WRITE;
/*!40000 ALTER TABLE `currency_exchange_rates` DISABLE KEYS */;
INSERT INTO `currency_exchange_rates` VALUES (1,83.000000000000,2,'2024-05-06 15:38:39','2024-05-06 15:38:39');
/*!40000 ALTER TABLE `currency_exchange_rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_product_sizes`
--

DROP TABLE IF EXISTS `custom_product_sizes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `custom_product_sizes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` bigint unsigned DEFAULT NULL,
  `product_id` bigint unsigned DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_size` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_size_comments` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_product_sizes`
--

LOCK TABLES `custom_product_sizes` WRITE;
/*!40000 ALTER TABLE `custom_product_sizes` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_product_sizes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_groups`
--

DROP TABLE IF EXISTS `customer_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_groups` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_user_defined` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `customer_groups_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_groups`
--

LOCK TABLES `customer_groups` WRITE;
/*!40000 ALTER TABLE `customer_groups` DISABLE KEYS */;
INSERT INTO `customer_groups` VALUES (1,'guest','Guest',0,NULL,NULL),(2,'general','General',0,NULL,NULL),(3,'wholesale','Wholesale',0,NULL,NULL);
/*!40000 ALTER TABLE `customer_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_notes`
--

DROP TABLE IF EXISTS `customer_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_notes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int unsigned DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_notified` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_notes_customer_id_foreign` (`customer_id`),
  CONSTRAINT `customer_notes_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_notes`
--

LOCK TABLES `customer_notes` WRITE;
/*!40000 ALTER TABLE `customer_notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_password_resets`
--

DROP TABLE IF EXISTS `customer_password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `customer_password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_password_resets`
--

LOCK TABLES `customer_password_resets` WRITE;
/*!40000 ALTER TABLE `customer_password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_social_accounts`
--

DROP TABLE IF EXISTS `customer_social_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_social_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int unsigned NOT NULL,
  `provider_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `customer_social_accounts_provider_id_unique` (`provider_id`),
  KEY `customer_social_accounts_customer_id_foreign` (`customer_id`),
  CONSTRAINT `customer_social_accounts_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_social_accounts`
--

LOCK TABLES `customer_social_accounts` WRITE;
/*!40000 ALTER TABLE `customer_social_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_social_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `api_token` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_group_id` int unsigned DEFAULT NULL,
  `subscribed_to_news_letter` tinyint(1) NOT NULL DEFAULT '0',
  `is_verified` tinyint(1) NOT NULL DEFAULT '0',
  `is_suspended` tinyint unsigned NOT NULL DEFAULT '0',
  `token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `customers_email_unique` (`email`),
  UNIQUE KEY `customers_phone_unique` (`phone`),
  UNIQUE KEY `customers_api_token_unique` (`api_token`),
  KEY `customers_customer_group_id_foreign` (`customer_group_id`),
  CONSTRAINT `customers_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Patsy','Conn','female',NULL,'claudine@example.com',NULL,NULL,1,'$2y$10$ya8pcnr5QOrKkazlOFVq/eEZKFIqiU5wESQ1m3ck6Q0S2dlKt1LMy',NULL,2,0,1,0,NULL,NULL,'2024-05-06 08:06:46','2024-05-06 08:06:46'),(2,'Karl','Brakus','other',NULL,'monique@example.com',NULL,NULL,1,'$2y$10$6m/Nk4dy2zn5xAVrk4MlA.c41hrUznk3h4PQGECBs2Mi2o/xYG/3W',NULL,2,0,1,0,NULL,NULL,'2024-05-06 08:06:46','2024-05-06 08:06:46'),(3,'Isabella','Koelpin','other',NULL,'eldridge@example.com',NULL,NULL,1,'$2y$10$TLIZCUuFrXtKmnUFM0gHtuH.2n2fMhe31CObT/gWNOKck56D2XmlW',NULL,2,0,1,0,NULL,NULL,'2024-05-06 08:06:46','2024-05-06 08:06:46'),(4,'Kris','Haley','other',NULL,'miller@example.com',NULL,NULL,1,'$2y$10$Zs6ue0DHnD5KIq00Xfe69uNELBT3xaRF4D.FNkvM7tKtjDfnw.wDK',NULL,2,0,1,0,NULL,NULL,'2024-05-06 08:06:46','2024-05-06 08:06:46'),(5,'Braden','D\'Amore','female',NULL,'emmie@example.com',NULL,NULL,1,'$2y$10$aFW7NsPUW815cZQyaAC/COwkXMPoSvIXCrMoaN/frUZ3vT44sLhPi',NULL,2,0,1,0,NULL,NULL,'2024-05-06 08:06:46','2024-05-06 08:06:46'),(6,'Jayson','Wiegand','female',NULL,'bridie@example.com',NULL,NULL,1,'$2y$10$k5tbnaVwvXcSnYo9ivM3OuVa5ZGw0ApSrkYo1KL4oEifCzcCljLQS',NULL,2,0,1,0,NULL,NULL,'2024-05-06 08:06:46','2024-05-06 08:06:46'),(7,'Minerva','Tillman','other',NULL,'ted@example.com',NULL,NULL,1,'$2y$10$L2OTasI2RqMEaN1K51Wp9OWKrPKoaEIWQma10ZP5YKVOZeR0.mZiW',NULL,2,0,1,0,NULL,NULL,'2024-05-06 08:06:47','2024-05-06 08:06:47'),(8,'Marjory','Kuhlman','male',NULL,'macy@example.com',NULL,NULL,1,'$2y$10$ATukfrtsCo2mpF.yYfQmvua9KR1nO.Zc59N7423fPns0cvwJ/ElhG',NULL,2,0,1,0,NULL,NULL,'2024-05-06 08:06:47','2024-05-06 08:06:47'),(9,'Carli','Casper','female',NULL,'lessie@example.com',NULL,NULL,1,'$2y$10$KjHwkSwMzOBMr4EGHrgtnuJGy30J7oRXgT6DYiiFg7y6cuhfXv14y',NULL,2,0,1,0,NULL,NULL,'2024-05-06 08:06:47','2024-05-06 08:06:47'),(10,'Derick','Davis','other',NULL,'lisandro@example.com',NULL,NULL,1,'$2y$10$48EbN2ljLqPbNEuPFtc5ue7pcpa4XPs5ZpCA6nf6MnWLQRYU1QYS.',NULL,2,0,1,0,NULL,NULL,'2024-05-06 08:06:47','2024-05-06 08:06:47'),(11,'Piyush','Jain',NULL,NULL,'piyush.jain@example.com',NULL,NULL,1,'$2y$10$CcZz/1Ic2PfbWQ57avRJEO6LzyP7XUVQ082Wftn3fz.y90ddfl7Tq','yZTkme1tYochkwZCUuJrN3w66cBlMks2LH4kjiu0tJLhUxImlCVtcX510AQ8SACOsA4nFX9gXQ9y4A7C',2,0,1,0,'11e8c87cdfbd257b3382ef1d34f19948',NULL,'2024-05-06 08:09:48','2024-05-06 08:09:48');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `downloadable_link_purchased`
--

DROP TABLE IF EXISTS `downloadable_link_purchased`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `downloadable_link_purchased` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `download_bought` int NOT NULL DEFAULT '0',
  `download_used` int NOT NULL DEFAULT '0',
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` int unsigned NOT NULL,
  `order_id` int unsigned NOT NULL,
  `order_item_id` int unsigned NOT NULL,
  `download_canceled` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `downloadable_link_purchased_customer_id_foreign` (`customer_id`),
  KEY `downloadable_link_purchased_order_id_foreign` (`order_id`),
  KEY `downloadable_link_purchased_order_item_id_foreign` (`order_item_id`),
  CONSTRAINT `downloadable_link_purchased_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `downloadable_link_purchased_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `downloadable_link_purchased_order_item_id_foreign` FOREIGN KEY (`order_item_id`) REFERENCES `order_items` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `downloadable_link_purchased`
--

LOCK TABLES `downloadable_link_purchased` WRITE;
/*!40000 ALTER TABLE `downloadable_link_purchased` DISABLE KEYS */;
/*!40000 ALTER TABLE `downloadable_link_purchased` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `import_batches`
--

DROP TABLE IF EXISTS `import_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `import_batches` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `data` json NOT NULL,
  `summary` json DEFAULT NULL,
  `import_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `import_batches_import_id_foreign` (`import_id`),
  CONSTRAINT `import_batches_import_id_foreign` FOREIGN KEY (`import_id`) REFERENCES `imports` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `import_batches`
--

LOCK TABLES `import_batches` WRITE;
/*!40000 ALTER TABLE `import_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `import_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imports`
--

DROP TABLE IF EXISTS `imports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imports` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `process_in_queue` tinyint(1) NOT NULL DEFAULT '1',
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `validation_strategy` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `allowed_errors` int NOT NULL DEFAULT '0',
  `processed_rows_count` int NOT NULL DEFAULT '0',
  `invalid_rows_count` int NOT NULL DEFAULT '0',
  `errors_count` int NOT NULL DEFAULT '0',
  `errors` json DEFAULT NULL,
  `field_separator` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `images_directory_path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `error_file_path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `summary` json DEFAULT NULL,
  `started_at` datetime DEFAULT NULL,
  `completed_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imports`
--

LOCK TABLES `imports` WRITE;
/*!40000 ALTER TABLE `imports` DISABLE KEYS */;
/*!40000 ALTER TABLE `imports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_sources`
--

DROP TABLE IF EXISTS `inventory_sources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory_sources` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `contact_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_fax` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `street` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `postcode` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `priority` int NOT NULL DEFAULT '0',
  `latitude` decimal(10,5) DEFAULT NULL,
  `longitude` decimal(10,5) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `inventory_sources_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_sources`
--

LOCK TABLES `inventory_sources` WRITE;
/*!40000 ALTER TABLE `inventory_sources` DISABLE KEYS */;
INSERT INTO `inventory_sources` VALUES (1,'default','Default',NULL,'Default','warehouse@example.com','1234567899',NULL,'US','MI','Detroit','12th Street','48127',0,NULL,NULL,1,NULL,NULL);
/*!40000 ALTER TABLE `inventory_sources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice_items`
--

DROP TABLE IF EXISTS `invoice_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoice_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `discount_percent` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `product_id` int unsigned DEFAULT NULL,
  `product_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_item_id` int unsigned DEFAULT NULL,
  `invoice_id` int unsigned DEFAULT NULL,
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoice_items_invoice_id_foreign` (`invoice_id`),
  KEY `invoice_items_parent_id_foreign` (`parent_id`),
  CONSTRAINT `invoice_items_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON DELETE CASCADE,
  CONSTRAINT `invoice_items_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `invoice_items` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_items`
--

LOCK TABLES `invoice_items` WRITE;
/*!40000 ALTER TABLE `invoice_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoice_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoices`
--

DROP TABLE IF EXISTS `invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoices` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `increment_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_sent` tinyint(1) NOT NULL DEFAULT '0',
  `total_qty` int DEFAULT NULL,
  `base_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_total` decimal(12,4) DEFAULT '0.0000',
  `base_sub_total` decimal(12,4) DEFAULT '0.0000',
  `grand_total` decimal(12,4) DEFAULT '0.0000',
  `base_grand_total` decimal(12,4) DEFAULT '0.0000',
  `shipping_amount` decimal(12,4) DEFAULT '0.0000',
  `base_shipping_amount` decimal(12,4) DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `order_id` int unsigned DEFAULT NULL,
  `transaction_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reminders` int NOT NULL DEFAULT '0',
  `next_reminder_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoices_order_id_foreign` (`order_id`),
  CONSTRAINT `invoices_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoices`
--

LOCK TABLES `invoices` WRITE;
/*!40000 ALTER TABLE `invoices` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_batches` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
INSERT INTO `job_batches` VALUES ('9bfa0e19-11bd-4f86-8aee-5152bf815296','',1,0,0,'[]','a:0:{}',NULL,1714982806,1714982807),('9bfa0e26-cf45-490a-80c6-e8496973c475','',2,0,0,'[]','a:0:{}',NULL,1714982815,1714982815),('9bfa0e60-6e03-453d-ab3b-60ff9e97ab40','',10,0,0,'[]','a:0:{}',NULL,1714982853,1714982855),('9bfa8bb1-60fb-404b-af0c-927d71185c82','',2,0,0,'[]','a:0:{}',NULL,1715003877,1715003878);
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `live_demo_appointments`
--

DROP TABLE IF EXISTS `live_demo_appointments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `live_demo_appointments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` bigint unsigned DEFAULT NULL,
  `product_id` bigint unsigned DEFAULT NULL,
  `appointment_date` date DEFAULT NULL,
  `appointment_time` time DEFAULT NULL,
  `miro_room_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_info` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `event_type` enum('I am a Groom','I am a Bride','Attending an Event','Other') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `event_type_text` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `what_are_you_looking_for` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'scheduled',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `live_demo_appointments`
--

LOCK TABLES `live_demo_appointments` WRITE;
/*!40000 ALTER TABLE `live_demo_appointments` DISABLE KEYS */;
/*!40000 ALTER TABLE `live_demo_appointments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locales`
--

DROP TABLE IF EXISTS `locales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locales` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `direction` enum('ltr','rtl') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ltr',
  `logo_path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `locales_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locales`
--

LOCK TABLES `locales` WRITE;
/*!40000 ALTER TABLE `locales` DISABLE KEYS */;
INSERT INTO `locales` VALUES (1,'en','English','ltr','locales/YuFazk3QsiQb7LqQGB9qpUAb9YTCaW9Cf2TnE2Kq.png',NULL,NULL);
/*!40000 ALTER TABLE `locales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marketing_campaigns`
--

DROP TABLE IF EXISTS `marketing_campaigns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marketing_campaigns` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mail_to` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `spooling` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_id` int unsigned DEFAULT NULL,
  `customer_group_id` int unsigned DEFAULT NULL,
  `marketing_template_id` int unsigned DEFAULT NULL,
  `marketing_event_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `marketing_campaigns_channel_id_foreign` (`channel_id`),
  KEY `marketing_campaigns_customer_group_id_foreign` (`customer_group_id`),
  KEY `marketing_campaigns_marketing_template_id_foreign` (`marketing_template_id`),
  KEY `marketing_campaigns_marketing_event_id_foreign` (`marketing_event_id`),
  CONSTRAINT `marketing_campaigns_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE SET NULL,
  CONSTRAINT `marketing_campaigns_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE SET NULL,
  CONSTRAINT `marketing_campaigns_marketing_event_id_foreign` FOREIGN KEY (`marketing_event_id`) REFERENCES `marketing_events` (`id`) ON DELETE SET NULL,
  CONSTRAINT `marketing_campaigns_marketing_template_id_foreign` FOREIGN KEY (`marketing_template_id`) REFERENCES `marketing_templates` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marketing_campaigns`
--

LOCK TABLES `marketing_campaigns` WRITE;
/*!40000 ALTER TABLE `marketing_campaigns` DISABLE KEYS */;
/*!40000 ALTER TABLE `marketing_campaigns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marketing_events`
--

DROP TABLE IF EXISTS `marketing_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marketing_events` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marketing_events`
--

LOCK TABLES `marketing_events` WRITE;
/*!40000 ALTER TABLE `marketing_events` DISABLE KEYS */;
INSERT INTO `marketing_events` VALUES (1,'Birthday','Birthday',NULL,NULL,NULL);
/*!40000 ALTER TABLE `marketing_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marketing_templates`
--

DROP TABLE IF EXISTS `marketing_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marketing_templates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marketing_templates`
--

LOCK TABLES `marketing_templates` WRITE;
/*!40000 ALTER TABLE `marketing_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `marketing_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_admin_password_resets_table',1),(3,'2014_10_12_100000_create_password_resets_table',1),(4,'2018_06_12_111907_create_admins_table',1),(5,'2018_06_13_055341_create_roles_table',1),(6,'2018_07_05_130148_create_attributes_table',1),(7,'2018_07_05_132854_create_attribute_translations_table',1),(8,'2018_07_05_135150_create_attribute_families_table',1),(9,'2018_07_05_135152_create_attribute_groups_table',1),(10,'2018_07_05_140832_create_attribute_options_table',1),(11,'2018_07_05_140856_create_attribute_option_translations_table',1),(12,'2018_07_05_142820_create_categories_table',1),(13,'2018_07_10_055143_create_locales_table',1),(14,'2018_07_20_054426_create_countries_table',1),(15,'2018_07_20_054502_create_currencies_table',1),(16,'2018_07_20_054542_create_currency_exchange_rates_table',1),(17,'2018_07_20_064849_create_channels_table',1),(18,'2018_07_21_142836_create_category_translations_table',1),(19,'2018_07_23_110040_create_inventory_sources_table',1),(20,'2018_07_24_082635_create_customer_groups_table',1),(21,'2018_07_24_082930_create_customers_table',1),(22,'2018_07_27_065727_create_products_table',1),(23,'2018_07_27_070011_create_product_attribute_values_table',1),(24,'2018_07_27_092623_create_product_reviews_table',1),(25,'2018_07_27_113941_create_product_images_table',1),(26,'2018_07_27_113956_create_product_inventories_table',1),(27,'2018_08_30_064755_create_tax_categories_table',1),(28,'2018_08_30_065042_create_tax_rates_table',1),(29,'2018_08_30_065840_create_tax_mappings_table',1),(30,'2018_09_05_150444_create_cart_table',1),(31,'2018_09_05_150915_create_cart_items_table',1),(32,'2018_09_11_064045_customer_password_resets',1),(33,'2018_09_19_093453_create_cart_payment',1),(34,'2018_09_19_093508_create_cart_shipping_rates_table',1),(35,'2018_09_20_060658_create_core_config_table',1),(36,'2018_09_27_113154_create_orders_table',1),(37,'2018_09_27_113207_create_order_items_table',1),(38,'2018_09_27_115022_create_shipments_table',1),(39,'2018_09_27_115029_create_shipment_items_table',1),(40,'2018_09_27_115135_create_invoices_table',1),(41,'2018_09_27_115144_create_invoice_items_table',1),(42,'2018_10_01_095504_create_order_payment_table',1),(43,'2018_10_03_025230_create_wishlist_table',1),(44,'2018_10_12_101803_create_country_translations_table',1),(45,'2018_10_12_101913_create_country_states_table',1),(46,'2018_10_12_101923_create_country_state_translations_table',1),(47,'2018_11_16_173504_create_subscribers_list_table',1),(48,'2018_11_21_144411_create_cart_item_inventories_table',1),(49,'2018_12_06_185202_create_product_flat_table',1),(50,'2018_12_24_123812_create_channel_inventory_sources_table',1),(51,'2018_12_26_165327_create_product_ordered_inventories_table',1),(52,'2019_05_13_024321_create_cart_rules_table',1),(53,'2019_05_13_024322_create_cart_rule_channels_table',1),(54,'2019_05_13_024323_create_cart_rule_customer_groups_table',1),(55,'2019_05_13_024324_create_cart_rule_translations_table',1),(56,'2019_05_13_024325_create_cart_rule_customers_table',1),(57,'2019_05_13_024326_create_cart_rule_coupons_table',1),(58,'2019_05_13_024327_create_cart_rule_coupon_usage_table',1),(59,'2019_06_17_180258_create_product_downloadable_samples_table',1),(60,'2019_06_17_180314_create_product_downloadable_sample_translations_table',1),(61,'2019_06_17_180325_create_product_downloadable_links_table',1),(62,'2019_06_17_180346_create_product_downloadable_link_translations_table',1),(63,'2019_06_21_202249_create_downloadable_link_purchased_table',1),(64,'2019_07_30_153530_create_cms_pages_table',1),(65,'2019_07_31_143339_create_category_filterable_attributes_table',1),(66,'2019_08_02_105320_create_product_grouped_products_table',1),(67,'2019_08_20_170510_create_product_bundle_options_table',1),(68,'2019_08_20_170520_create_product_bundle_option_translations_table',1),(69,'2019_08_20_170528_create_product_bundle_option_products_table',1),(70,'2019_09_11_184511_create_refunds_table',1),(71,'2019_09_11_184519_create_refund_items_table',1),(72,'2019_12_03_184613_create_catalog_rules_table',1),(73,'2019_12_03_184651_create_catalog_rule_channels_table',1),(74,'2019_12_03_184732_create_catalog_rule_customer_groups_table',1),(75,'2019_12_06_101110_create_catalog_rule_products_table',1),(76,'2019_12_06_110507_create_catalog_rule_product_prices_table',1),(77,'2019_12_14_000001_create_personal_access_tokens_table',1),(78,'2020_01_14_191854_create_cms_page_translations_table',1),(79,'2020_01_15_130209_create_cms_page_channels_table',1),(80,'2020_04_16_185147_add_table_addresses',1),(81,'2020_05_06_171638_create_order_comments_table',1),(82,'2020_05_21_171500_create_product_customer_group_prices_table',1),(83,'2020_06_25_162154_create_customer_social_accounts_table',1),(84,'2020_11_19_112228_create_product_videos_table',1),(85,'2020_11_26_141455_create_marketing_templates_table',1),(86,'2020_11_26_150534_create_marketing_events_table',1),(87,'2020_11_26_150644_create_marketing_campaigns_table',1),(88,'2020_12_21_000200_create_channel_translations_table',1),(89,'2020_12_27_121950_create_jobs_table',1),(90,'2021_03_11_212124_create_order_transactions_table',1),(91,'2021_04_07_132010_create_product_review_images_table',1),(92,'2021_12_15_104544_notifications',1),(93,'2022_03_15_160510_create_failed_jobs_table',1),(94,'2022_04_01_094622_create_sitemaps_table',1),(95,'2022_10_03_144232_create_product_price_indices_table',1),(96,'2022_10_04_144444_create_job_batches_table',1),(97,'2022_10_08_134150_create_product_inventory_indices_table',1),(98,'2023_05_26_213105_create_wishlist_items_table',1),(99,'2023_05_26_213120_create_compare_items_table',1),(100,'2023_06_27_163529_rename_product_review_images_to_product_review_attachments',1),(101,'2023_07_06_140013_add_logo_path_column_to_locales',1),(102,'2023_07_10_184256_create_theme_customizations_table',1),(103,'2023_07_12_181722_remove_home_page_and_footer_content_column_from_channel_translations_table',1),(104,'2023_07_20_185324_add_column_column_in_attribute_groups_table',1),(105,'2023_07_25_145943_add_regex_column_in_attributes_table',1),(106,'2023_07_25_165945_drop_notes_column_from_customers_table',1),(107,'2023_07_25_171058_create_customer_notes_table',1),(108,'2023_07_31_125232_rename_image_and_category_banner_columns_from_categories_table',1),(109,'2023_09_15_170053_create_theme_customization_translations_table',1),(110,'2023_09_20_102031_add_default_value_column_in_attributes_table',1),(111,'2023_09_20_102635_add_inventories_group_in_attribute_groups_table',1),(112,'2023_10_05_163612_create_visits_table',1),(113,'2023_10_12_090446_add_tax_category_id_column_in_order_items_table',1),(114,'2023_11_08_054614_add_code_column_in_attribute_groups_table',1),(115,'2023_11_08_140116_create_search_terms_table',1),(116,'2023_11_09_162805_create_url_rewrites_table',1),(117,'2023_11_17_150401_create_search_synonyms_table',1),(118,'2023_12_11_054614_add_channel_id_column_in_product_price_indices_table',1),(119,'2024_01_11_154640_create_imports_table',1),(120,'2024_01_11_154741_create_import_batches_table',1),(121,'2024_01_19_170350_add_unique_id_column_in_product_attribute_values_table',1),(122,'2024_01_19_170350_add_unique_id_column_in_product_customer_group_prices_table',1),(123,'2024_01_22_170814_add_unique_index_in_mapping_tables',1),(124,'2024_02_26_153000_add_columns_to_addresses_table',1),(125,'2024_03_28_160506_create_live_demo_appointments_table',1),(126,'2024_04_22_121616_create_custom_product_sizes_table',1),(127,'2024_05_06_153709_alter_orders_table',2),(128,'2024_05_06_155935_alter_carts_table',3),(131,'2024_05_06_194008_alter_cart_table',4);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `read` tinyint(1) NOT NULL DEFAULT '0',
  `order_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_order_id_foreign` (`order_id`),
  CONSTRAINT `notifications_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_comments`
--

DROP TABLE IF EXISTS `order_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_comments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int unsigned DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_notified` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_comments_order_id_foreign` (`order_id`),
  CONSTRAINT `order_comments_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_comments`
--

LOCK TABLES `order_comments` WRITE;
/*!40000 ALTER TABLE `order_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weight` decimal(12,4) DEFAULT '0.0000',
  `total_weight` decimal(12,4) DEFAULT '0.0000',
  `qty_ordered` int DEFAULT '0',
  `qty_shipped` int DEFAULT '0',
  `qty_invoiced` int DEFAULT '0',
  `qty_canceled` int DEFAULT '0',
  `qty_refunded` int DEFAULT '0',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total_invoiced` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total_invoiced` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `amount_refunded` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_amount_refunded` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `discount_percent` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `discount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_discount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `discount_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_discount_refunded` decimal(12,4) DEFAULT '0.0000',
  `tax_percent` decimal(12,4) DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `tax_amount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `tax_amount_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount_refunded` decimal(12,4) DEFAULT '0.0000',
  `product_id` int unsigned DEFAULT NULL,
  `product_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` int unsigned DEFAULT NULL,
  `tax_category_id` int unsigned DEFAULT NULL,
  `parent_id` int unsigned DEFAULT NULL,
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `making_charges_amount` decimal(12,4) DEFAULT '0.0000',
  `base_making_charges_amount` decimal(12,4) DEFAULT '0.0000',
  `making_charges_amount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_making_charges_amount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `other_amount` decimal(12,4) DEFAULT '0.0000',
  `base_other_amount` decimal(12,4) DEFAULT '0.0000',
  `other_amount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_other_amount_invoiced` decimal(12,4) DEFAULT '0.0000',
  PRIMARY KEY (`id`),
  KEY `order_items_order_id_foreign` (`order_id`),
  KEY `order_items_parent_id_foreign` (`parent_id`),
  KEY `order_items_tax_category_id_foreign` (`tax_category_id`),
  CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_items_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `order_items` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_items_tax_category_id_foreign` FOREIGN KEY (`tax_category_id`) REFERENCES `tax_categories` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_payment`
--

DROP TABLE IF EXISTS `order_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_payment` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int unsigned DEFAULT NULL,
  `method` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_payment_order_id_foreign` (`order_id`),
  CONSTRAINT `order_payment_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_payment`
--

LOCK TABLES `order_payment` WRITE;
/*!40000 ALTER TABLE `order_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_transactions`
--

DROP TABLE IF EXISTS `order_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_transactions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `transaction_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(12,4) DEFAULT '0.0000',
  `payment_method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` json DEFAULT NULL,
  `invoice_id` int unsigned NOT NULL,
  `order_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_transactions_order_id_foreign` (`order_id`),
  CONSTRAINT `order_transactions_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_transactions`
--

LOCK TABLES `order_transactions` WRITE;
/*!40000 ALTER TABLE `order_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `increment_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_guest` tinyint(1) DEFAULT NULL,
  `customer_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_gift` tinyint(1) NOT NULL DEFAULT '0',
  `total_item_count` int DEFAULT NULL,
  `total_qty_ordered` int DEFAULT NULL,
  `base_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `grand_total` decimal(12,4) DEFAULT '0.0000',
  `base_grand_total` decimal(12,4) DEFAULT '0.0000',
  `grand_total_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_grand_total_invoiced` decimal(12,4) DEFAULT '0.0000',
  `grand_total_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_grand_total_refunded` decimal(12,4) DEFAULT '0.0000',
  `sub_total` decimal(12,4) DEFAULT '0.0000',
  `base_sub_total` decimal(12,4) DEFAULT '0.0000',
  `sub_total_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_sub_total_invoiced` decimal(12,4) DEFAULT '0.0000',
  `sub_total_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_sub_total_refunded` decimal(12,4) DEFAULT '0.0000',
  `discount_percent` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `discount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_discount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `discount_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_discount_refunded` decimal(12,4) DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `tax_amount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `tax_amount_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount_refunded` decimal(12,4) DEFAULT '0.0000',
  `shipping_amount` decimal(12,4) DEFAULT '0.0000',
  `base_shipping_amount` decimal(12,4) DEFAULT '0.0000',
  `shipping_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_shipping_invoiced` decimal(12,4) DEFAULT '0.0000',
  `shipping_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_shipping_refunded` decimal(12,4) DEFAULT '0.0000',
  `shipping_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_shipping_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `customer_id` int unsigned DEFAULT NULL,
  `customer_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_id` int unsigned DEFAULT NULL,
  `channel_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cart_id` int DEFAULT NULL,
  `applied_cart_rule_ids` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `base_making_charges_amount` decimal(12,4) DEFAULT '0.0000',
  `making_charges_amount` decimal(12,4) DEFAULT '0.0000',
  `base_making_charges_amount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `making_charges_amount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `other_amount` decimal(12,4) DEFAULT '0.0000',
  `base_other_amount` decimal(12,4) DEFAULT '0.0000',
  `other_amount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_other_amount_invoiced` decimal(12,4) DEFAULT '0.0000',
  PRIMARY KEY (`id`),
  UNIQUE KEY `orders_increment_id_unique` (`increment_id`),
  KEY `orders_customer_id_foreign` (`customer_id`),
  KEY `orders_channel_id_foreign` (`channel_id`),
  CONSTRAINT `orders_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE SET NULL,
  CONSTRAINT `orders_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
INSERT INTO `personal_access_tokens` VALUES (1,'Webkul\\User\\Models\\Admin',1,'webapp','f605179ff81fdad046c7b80d8d58f77995cb80c5297cc8697cf9f5736a1f5dd6','[\"role:admin\"]','2024-05-07 13:19:07',NULL,'2024-05-07 12:55:12','2024-05-07 13:19:07');
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_attribute_values`
--

DROP TABLE IF EXISTS `product_attribute_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_attribute_values` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text_value` text COLLATE utf8mb4_unicode_ci,
  `boolean_value` tinyint(1) DEFAULT NULL,
  `integer_value` int DEFAULT NULL,
  `float_value` decimal(12,4) DEFAULT NULL,
  `datetime_value` datetime DEFAULT NULL,
  `date_value` date DEFAULT NULL,
  `json_value` json DEFAULT NULL,
  `product_id` int unsigned NOT NULL,
  `attribute_id` int unsigned NOT NULL,
  `unique_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `chanel_locale_attribute_value_index_unique` (`channel`,`locale`,`attribute_id`,`product_id`),
  UNIQUE KEY `product_attribute_values_unique_id_unique` (`unique_id`),
  KEY `product_attribute_values_product_id_foreign` (`product_id`),
  KEY `product_attribute_values_attribute_id_foreign` (`attribute_id`),
  CONSTRAINT `product_attribute_values_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_attribute_values_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3086 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_attribute_values`
--

LOCK TABLES `product_attribute_values` WRITE;
/*!40000 ALTER TABLE `product_attribute_values` DISABLE KEYS */;
INSERT INTO `product_attribute_values` VALUES (2510,'en','default','1bc4e26e-4833-3610-853a-ab88a5be681b',NULL,NULL,NULL,NULL,NULL,NULL,101,1,NULL),(2511,'en','default','Silver est',NULL,NULL,NULL,NULL,NULL,NULL,101,2,NULL),(2512,'en','default','tenetur-id-consequuntur-ut-aut-voluptas',NULL,NULL,NULL,NULL,NULL,NULL,101,3,NULL),(2513,'en','default',NULL,NULL,1,NULL,NULL,NULL,NULL,101,4,NULL),(2514,'en','default',NULL,1,NULL,NULL,NULL,NULL,NULL,101,5,NULL),(2515,'en','default',NULL,1,NULL,NULL,NULL,NULL,NULL,101,6,NULL),(2516,'en','default',NULL,1,NULL,NULL,NULL,NULL,NULL,101,7,NULL),(2517,'en','default',NULL,0,NULL,NULL,NULL,NULL,NULL,101,8,NULL),(2518,'en','default','Deleniti ut veritatis ut dolores ut.',NULL,NULL,NULL,NULL,NULL,NULL,101,9,NULL),(2519,'en','default','Enim adipisci optio id voluptas et esse impedit. Aperiam vero eos modi non voluptate accusantium. Accusantium maxime non dolores magni voluptatem.',NULL,NULL,NULL,NULL,NULL,NULL,101,10,NULL),(2520,'en','default',NULL,NULL,NULL,439.5800,NULL,NULL,NULL,101,11,NULL),(2521,'en','default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,101,12,NULL),(2522,'en','default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,101,13,NULL),(2523,'en','default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,101,14,NULL),(2524,'en','default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,101,15,NULL),(2525,'en','default','Ut enim error laborum natus eos dolorum consequatur.',NULL,NULL,NULL,NULL,NULL,NULL,101,16,NULL),(2526,'en','default','Reprehenderit enim explicabo architecto similique voluptas consequuntur iure.',NULL,NULL,NULL,NULL,NULL,NULL,101,17,NULL),(2527,'en','default','Neque qui eos facilis aliquid quo rerum.',NULL,NULL,NULL,NULL,NULL,NULL,101,18,NULL),(2528,'en','default','25',NULL,NULL,NULL,NULL,NULL,NULL,101,19,NULL),(2529,'en','default','70',NULL,NULL,NULL,NULL,NULL,NULL,101,20,NULL),(2530,'en','default','69',NULL,NULL,NULL,NULL,NULL,NULL,101,21,NULL),(2531,'en','default','40',NULL,NULL,NULL,NULL,NULL,NULL,101,22,NULL),(2532,'en','default',NULL,1,NULL,NULL,NULL,NULL,NULL,101,26,NULL),(2533,'en','default','PD-641441816',NULL,NULL,NULL,NULL,NULL,NULL,101,27,NULL),(2534,'en','default',NULL,1,NULL,NULL,NULL,NULL,NULL,101,28,NULL),(2535,'en','default',NULL,NULL,NULL,1.0000,NULL,NULL,NULL,101,29,NULL),(2536,'en','default',NULL,NULL,NULL,0.0000,NULL,NULL,NULL,101,30,NULL),(2537,'en','default',NULL,NULL,13,NULL,NULL,NULL,NULL,101,31,NULL),(2538,'en','default','8d69fb60-e22d-3b4c-852b-b631ea999806',NULL,NULL,NULL,NULL,NULL,NULL,102,1,NULL),(2539,'en','default','Silver soluta',NULL,NULL,NULL,NULL,NULL,NULL,102,2,NULL),(2540,'en','default','qui-ut-asperiores-architecto-voluptatum-animi',NULL,NULL,NULL,NULL,NULL,NULL,102,3,NULL),(2541,'en','default',NULL,NULL,1,NULL,NULL,NULL,NULL,102,4,NULL),(2542,'en','default',NULL,1,NULL,NULL,NULL,NULL,NULL,102,5,NULL),(2543,'en','default',NULL,1,NULL,NULL,NULL,NULL,NULL,102,6,NULL),(2544,'en','default',NULL,1,NULL,NULL,NULL,NULL,NULL,102,7,NULL),(2545,'en','default',NULL,0,NULL,NULL,NULL,NULL,NULL,102,8,NULL),(2546,'en','default','Sequi magnam accusamus id tempora vel sed nesciunt.',NULL,NULL,NULL,NULL,NULL,NULL,102,9,NULL),(2547,'en','default','Ad et ullam qui est quo dolores dicta. Reiciendis aut qui aut optio. Ducimus nihil molestiae porro. Est id ut velit dolorum magni voluptates ut. Tempora aut accusantium enim vitae fuga.',NULL,NULL,NULL,NULL,NULL,NULL,102,10,NULL),(2548,'en','default',NULL,NULL,NULL,646.5000,NULL,NULL,NULL,102,11,NULL),(2549,'en','default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,102,12,NULL),(2550,'en','default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,102,13,NULL),(2551,'en','default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,102,14,NULL),(2552,'en','default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,102,15,NULL),(2553,'en','default','Consequuntur ex temporibus adipisci et voluptatibus repudiandae vel.',NULL,NULL,NULL,NULL,NULL,NULL,102,16,NULL),(2554,'en','default','Doloribus suscipit atque numquam ea nemo.',NULL,NULL,NULL,NULL,NULL,NULL,102,17,NULL),(2555,'en','default','Officiis placeat quos eum natus.',NULL,NULL,NULL,NULL,NULL,NULL,102,18,NULL),(2556,'en','default','10',NULL,NULL,NULL,NULL,NULL,NULL,102,19,NULL),(2557,'en','default','36',NULL,NULL,NULL,NULL,NULL,NULL,102,20,NULL),(2558,'en','default','78',NULL,NULL,NULL,NULL,NULL,NULL,102,21,NULL),(2559,'en','default','92',NULL,NULL,NULL,NULL,NULL,NULL,102,22,NULL),(2560,'en','default',NULL,1,NULL,NULL,NULL,NULL,NULL,102,26,NULL),(2561,'en','default','PD-015033099',NULL,NULL,NULL,NULL,NULL,NULL,102,27,NULL),(2562,'en','default',NULL,1,NULL,NULL,NULL,NULL,NULL,102,28,NULL),(2563,'en','default',NULL,NULL,NULL,1.0000,NULL,NULL,NULL,102,29,NULL),(2564,'en','default',NULL,NULL,NULL,0.0000,NULL,NULL,NULL,102,30,NULL),(2565,'en','default',NULL,NULL,10,NULL,NULL,NULL,NULL,102,31,NULL),(2566,'en','default','3a8cb8d3-016c-3f62-9b21-abc986079afc',NULL,NULL,NULL,NULL,NULL,NULL,103,1,NULL),(2567,'en','default','Silver unde',NULL,NULL,NULL,NULL,NULL,NULL,103,2,NULL),(2568,'en','default','minima-quae-eum-ipsum-doloribus',NULL,NULL,NULL,NULL,NULL,NULL,103,3,NULL),(2569,'en','default',NULL,NULL,1,NULL,NULL,NULL,NULL,103,4,NULL),(2570,'en','default',NULL,1,NULL,NULL,NULL,NULL,NULL,103,5,NULL),(2571,'en','default',NULL,1,NULL,NULL,NULL,NULL,NULL,103,6,NULL),(2572,'en','default',NULL,1,NULL,NULL,NULL,NULL,NULL,103,7,NULL),(2573,'en','default',NULL,0,NULL,NULL,NULL,NULL,NULL,103,8,NULL),(2574,'en','default','Sit reprehenderit veritatis omnis alias tempore.',NULL,NULL,NULL,NULL,NULL,NULL,103,9,NULL),(2575,'en','default','Aut explicabo consequuntur et aspernatur rerum debitis. Delectus nostrum praesentium nulla blanditiis ea. Et animi deleniti ea ipsam ea expedita repellat doloremque. Rerum sed ab eius et ut.',NULL,NULL,NULL,NULL,NULL,NULL,103,10,NULL),(2576,'en','default',NULL,NULL,NULL,917.7700,NULL,NULL,NULL,103,11,NULL),(2577,'en','default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,103,12,NULL),(2578,'en','default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,103,13,NULL),(2579,'en','default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,103,14,NULL),(2580,'en','default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,103,15,NULL),(2581,'en','default','Sint non molestiae doloremque.',NULL,NULL,NULL,NULL,NULL,NULL,103,16,NULL),(2582,'en','default','Dolorum enim optio ipsum illum.',NULL,NULL,NULL,NULL,NULL,NULL,103,17,NULL),(2583,'en','default','Et aperiam ut deserunt voluptas recusandae.',NULL,NULL,NULL,NULL,NULL,NULL,103,18,NULL),(2584,'en','default','93',NULL,NULL,NULL,NULL,NULL,NULL,103,19,NULL),(2585,'en','default','70',NULL,NULL,NULL,NULL,NULL,NULL,103,20,NULL),(2586,'en','default','67',NULL,NULL,NULL,NULL,NULL,NULL,103,21,NULL),(2587,'en','default','17',NULL,NULL,NULL,NULL,NULL,NULL,103,22,NULL),(2588,'en','default',NULL,1,NULL,NULL,NULL,NULL,NULL,103,26,NULL),(2589,'en','default','PD-863178111',NULL,NULL,NULL,NULL,NULL,NULL,103,27,NULL),(2590,'en','default',NULL,1,NULL,NULL,NULL,NULL,NULL,103,28,NULL),(2591,'en','default',NULL,NULL,NULL,1.0000,NULL,NULL,NULL,103,29,NULL),(2592,'en','default',NULL,NULL,NULL,0.0000,NULL,NULL,NULL,103,30,NULL),(2593,'en','default',NULL,NULL,12,NULL,NULL,NULL,NULL,103,31,NULL),(2594,'en','default','c707125a-06f7-35d8-abeb-0a07fd8d24e5',NULL,NULL,NULL,NULL,NULL,NULL,104,1,NULL),(2595,'en','default','Platinum blanditiis',NULL,NULL,NULL,NULL,NULL,NULL,104,2,NULL),(2596,'en','default','dolorem-consequuntur-quas-illo-est-aliquam',NULL,NULL,NULL,NULL,NULL,NULL,104,3,NULL),(2597,'en','default',NULL,NULL,1,NULL,NULL,NULL,NULL,104,4,NULL),(2598,'en','default',NULL,1,NULL,NULL,NULL,NULL,NULL,104,5,NULL),(2599,'en','default',NULL,1,NULL,NULL,NULL,NULL,NULL,104,6,NULL),(2600,'en','default',NULL,1,NULL,NULL,NULL,NULL,NULL,104,7,NULL),(2601,'en','default',NULL,0,NULL,NULL,NULL,NULL,NULL,104,8,NULL),(2602,'en','default','Excepturi dolores nisi dolorem aut laudantium.',NULL,NULL,NULL,NULL,NULL,NULL,104,9,NULL),(2603,'en','default','Culpa modi corporis exercitationem vel corrupti. Nisi id nulla velit aut corrupti. Harum id quidem rerum libero repellat dolorem corporis. Perferendis accusantium facilis eveniet culpa aut. Quidem culpa porro voluptas deserunt mollitia deserunt cupiditate.',NULL,NULL,NULL,NULL,NULL,NULL,104,10,NULL),(2604,'en','default',NULL,NULL,NULL,462.0000,NULL,NULL,NULL,104,11,NULL),(2605,'en','default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,104,12,NULL),(2606,'en','default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,104,13,NULL),(2607,'en','default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,104,14,NULL),(2608,'en','default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,104,15,NULL),(2609,'en','default','Tempora est quia id ipsam ullam.',NULL,NULL,NULL,NULL,NULL,NULL,104,16,NULL),(2610,'en','default','Incidunt velit voluptatem eligendi ratione cupiditate rem.',NULL,NULL,NULL,NULL,NULL,NULL,104,17,NULL),(2611,'en','default','Voluptatem velit et magnam.',NULL,NULL,NULL,NULL,NULL,NULL,104,18,NULL),(2612,'en','default','99',NULL,NULL,NULL,NULL,NULL,NULL,104,19,NULL),(2613,'en','default','47',NULL,NULL,NULL,NULL,NULL,NULL,104,20,NULL),(2614,'en','default','65',NULL,NULL,NULL,NULL,NULL,NULL,104,21,NULL),(2615,'en','default','26',NULL,NULL,NULL,NULL,NULL,NULL,104,22,NULL),(2616,'en','default',NULL,1,NULL,NULL,NULL,NULL,NULL,104,26,NULL),(2617,'en','default','PD-201843208',NULL,NULL,NULL,NULL,NULL,NULL,104,27,NULL),(2618,'en','default',NULL,1,NULL,NULL,NULL,NULL,NULL,104,28,NULL),(2619,'en','default',NULL,NULL,NULL,1.0000,NULL,NULL,NULL,104,29,NULL),(2620,'en','default',NULL,NULL,NULL,0.0000,NULL,NULL,NULL,104,30,NULL),(2621,'en','default',NULL,NULL,12,NULL,NULL,NULL,NULL,104,31,NULL),(2622,'en','default','b5841ed9-6b56-3191-973f-bd2815924e6d',NULL,NULL,NULL,NULL,NULL,NULL,105,1,NULL),(2623,'en','default','Gold expedita',NULL,NULL,NULL,NULL,NULL,NULL,105,2,NULL),(2624,'en','default','ullam-omnis-sit-incidunt-repellat-cum-accusantium-ipsa',NULL,NULL,NULL,NULL,NULL,NULL,105,3,NULL),(2625,'en','default',NULL,NULL,1,NULL,NULL,NULL,NULL,105,4,NULL),(2626,'en','default',NULL,1,NULL,NULL,NULL,NULL,NULL,105,5,NULL),(2627,'en','default',NULL,1,NULL,NULL,NULL,NULL,NULL,105,6,NULL),(2628,'en','default',NULL,1,NULL,NULL,NULL,NULL,NULL,105,7,NULL),(2629,'en','default',NULL,0,NULL,NULL,NULL,NULL,NULL,105,8,NULL),(2630,'en','default','Excepturi doloremque suscipit totam qui veritatis et.',NULL,NULL,NULL,NULL,NULL,NULL,105,9,NULL),(2631,'en','default','Enim id eligendi delectus iure consectetur. Quo sunt aliquam et et cumque. Enim cum illo nostrum sunt aperiam vero.',NULL,NULL,NULL,NULL,NULL,NULL,105,10,NULL),(2632,'en','default',NULL,NULL,NULL,406.6500,NULL,NULL,NULL,105,11,NULL),(2633,'en','default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,105,12,NULL),(2634,'en','default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,105,13,NULL),(2635,'en','default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,105,14,NULL),(2636,'en','default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,105,15,NULL),(2637,'en','default','Hic repellendus consequuntur reprehenderit sit.',NULL,NULL,NULL,NULL,NULL,NULL,105,16,NULL),(2638,'en','default','In est ipsa dolores sed.',NULL,NULL,NULL,NULL,NULL,NULL,105,17,NULL),(2639,'en','default','Mollitia facilis vel fuga aliquid tempora voluptatum.',NULL,NULL,NULL,NULL,NULL,NULL,105,18,NULL),(2640,'en','default','11',NULL,NULL,NULL,NULL,NULL,NULL,105,19,NULL),(2641,'en','default','76',NULL,NULL,NULL,NULL,NULL,NULL,105,20,NULL),(2642,'en','default','65',NULL,NULL,NULL,NULL,NULL,NULL,105,21,NULL),(2643,'en','default','80',NULL,NULL,NULL,NULL,NULL,NULL,105,22,NULL),(2644,'en','default',NULL,1,NULL,NULL,NULL,NULL,NULL,105,26,NULL),(2645,'en','default','PD-172418055',NULL,NULL,NULL,NULL,NULL,NULL,105,27,NULL),(2646,'en','default',NULL,1,NULL,NULL,NULL,NULL,NULL,105,28,NULL),(2647,'en','default',NULL,NULL,NULL,1.0000,NULL,NULL,NULL,105,29,NULL),(2648,'en','default',NULL,NULL,NULL,0.0000,NULL,NULL,NULL,105,30,NULL),(2649,'en','default',NULL,NULL,12,NULL,NULL,NULL,NULL,105,31,NULL),(2650,'en','default','7bcc7392-0a1c-3fba-9de1-a524e14aabeb',NULL,NULL,NULL,NULL,NULL,NULL,106,1,NULL),(2651,'en','default','Silver quas',NULL,NULL,NULL,NULL,NULL,NULL,106,2,NULL),(2652,'en','default','ad-fugiat-at-quisquam-quis-voluptatum-natus-dolorem-sed',NULL,NULL,NULL,NULL,NULL,NULL,106,3,NULL),(2653,'en','default',NULL,NULL,1,NULL,NULL,NULL,NULL,106,4,NULL),(2654,'en','default',NULL,1,NULL,NULL,NULL,NULL,NULL,106,5,NULL),(2655,'en','default',NULL,1,NULL,NULL,NULL,NULL,NULL,106,6,NULL),(2656,'en','default',NULL,1,NULL,NULL,NULL,NULL,NULL,106,7,NULL),(2657,'en','default',NULL,0,NULL,NULL,NULL,NULL,NULL,106,8,NULL),(2658,'en','default','Excepturi sed maxime sint sunt magnam deleniti et modi.',NULL,NULL,NULL,NULL,NULL,NULL,106,9,NULL),(2659,'en','default','Sed et sequi reprehenderit mollitia dolores possimus ipsa. Corporis et fuga aliquid inventore id.',NULL,NULL,NULL,NULL,NULL,NULL,106,10,NULL),(2660,'en','default',NULL,NULL,NULL,916.1200,NULL,NULL,NULL,106,11,NULL),(2661,'en','default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,106,12,NULL),(2662,'en','default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,106,13,NULL),(2663,'en','default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,106,14,NULL),(2664,'en','default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,106,15,NULL),(2665,'en','default','Eveniet quis voluptatum qui sed inventore ea ipsum.',NULL,NULL,NULL,NULL,NULL,NULL,106,16,NULL),(2666,'en','default','Consectetur voluptatum beatae molestias illum dolores perferendis iste.',NULL,NULL,NULL,NULL,NULL,NULL,106,17,NULL),(2667,'en','default','Consequuntur possimus id eius odit qui.',NULL,NULL,NULL,NULL,NULL,NULL,106,18,NULL),(2668,'en','default','70',NULL,NULL,NULL,NULL,NULL,NULL,106,19,NULL),(2669,'en','default','52',NULL,NULL,NULL,NULL,NULL,NULL,106,20,NULL),(2670,'en','default','18',NULL,NULL,NULL,NULL,NULL,NULL,106,21,NULL),(2671,'en','default','19',NULL,NULL,NULL,NULL,NULL,NULL,106,22,NULL),(2672,'en','default',NULL,1,NULL,NULL,NULL,NULL,NULL,106,26,NULL),(2673,'en','default','PD-154501060',NULL,NULL,NULL,NULL,NULL,NULL,106,27,NULL),(2674,'en','default',NULL,1,NULL,NULL,NULL,NULL,NULL,106,28,NULL),(2675,'en','default',NULL,NULL,NULL,1.0000,NULL,NULL,NULL,106,29,NULL),(2676,'en','default',NULL,NULL,NULL,0.0000,NULL,NULL,NULL,106,30,NULL),(2677,'en','default',NULL,NULL,13,NULL,NULL,NULL,NULL,106,31,NULL),(2678,'en','default','5a5aa95f-cfc5-390e-984a-5a6c29861a94',NULL,NULL,NULL,NULL,NULL,NULL,107,1,NULL),(2679,'en','default','Silver explicabo',NULL,NULL,NULL,NULL,NULL,NULL,107,2,NULL),(2680,'en','default','et-placeat-quo-ut',NULL,NULL,NULL,NULL,NULL,NULL,107,3,NULL),(2681,'en','default',NULL,NULL,1,NULL,NULL,NULL,NULL,107,4,NULL),(2682,'en','default',NULL,1,NULL,NULL,NULL,NULL,NULL,107,5,NULL),(2683,'en','default',NULL,1,NULL,NULL,NULL,NULL,NULL,107,6,NULL),(2684,'en','default',NULL,1,NULL,NULL,NULL,NULL,NULL,107,7,NULL),(2685,'en','default',NULL,0,NULL,NULL,NULL,NULL,NULL,107,8,NULL),(2686,'en','default','Officiis architecto rem voluptatem molestias expedita quia asperiores et.',NULL,NULL,NULL,NULL,NULL,NULL,107,9,NULL),(2687,'en','default','Quia iste nulla nam maxime ea velit voluptate. Voluptas reprehenderit vero atque. Vero quia quia officia animi distinctio voluptatem.',NULL,NULL,NULL,NULL,NULL,NULL,107,10,NULL),(2688,'en','default',NULL,NULL,NULL,122.0500,NULL,NULL,NULL,107,11,NULL),(2689,'en','default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,107,12,NULL),(2690,'en','default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,107,13,NULL),(2691,'en','default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,107,14,NULL),(2692,'en','default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,107,15,NULL),(2693,'en','default','Laborum voluptatibus voluptates soluta rerum consectetur dolore.',NULL,NULL,NULL,NULL,NULL,NULL,107,16,NULL),(2694,'en','default','Facilis corrupti expedita qui et et repellendus ea.',NULL,NULL,NULL,NULL,NULL,NULL,107,17,NULL),(2695,'en','default','Veritatis quis id quia qui.',NULL,NULL,NULL,NULL,NULL,NULL,107,18,NULL),(2696,'en','default','52',NULL,NULL,NULL,NULL,NULL,NULL,107,19,NULL),(2697,'en','default','100',NULL,NULL,NULL,NULL,NULL,NULL,107,20,NULL),(2698,'en','default','41',NULL,NULL,NULL,NULL,NULL,NULL,107,21,NULL),(2699,'en','default','56',NULL,NULL,NULL,NULL,NULL,NULL,107,22,NULL),(2700,'en','default',NULL,1,NULL,NULL,NULL,NULL,NULL,107,26,NULL),(2701,'en','default','PD-156984971',NULL,NULL,NULL,NULL,NULL,NULL,107,27,NULL),(2702,'en','default',NULL,1,NULL,NULL,NULL,NULL,NULL,107,28,NULL),(2703,'en','default',NULL,NULL,NULL,1.0000,NULL,NULL,NULL,107,29,NULL),(2704,'en','default',NULL,NULL,NULL,0.0000,NULL,NULL,NULL,107,30,NULL),(2705,'en','default',NULL,NULL,14,NULL,NULL,NULL,NULL,107,31,NULL),(2706,'en','default','5dc9b8e1-fcd1-3a6f-bb31-5208144d3d8b',NULL,NULL,NULL,NULL,NULL,NULL,108,1,NULL),(2707,'en','default','Gold a',NULL,NULL,NULL,NULL,NULL,NULL,108,2,NULL),(2708,'en','default','eos-voluptatum-velit-voluptatum-pariatur-sed',NULL,NULL,NULL,NULL,NULL,NULL,108,3,NULL),(2709,'en','default',NULL,NULL,1,NULL,NULL,NULL,NULL,108,4,NULL),(2710,'en','default',NULL,1,NULL,NULL,NULL,NULL,NULL,108,5,NULL),(2711,'en','default',NULL,1,NULL,NULL,NULL,NULL,NULL,108,6,NULL),(2712,'en','default',NULL,1,NULL,NULL,NULL,NULL,NULL,108,7,NULL),(2713,'en','default',NULL,0,NULL,NULL,NULL,NULL,NULL,108,8,NULL),(2714,'en','default','Ratione enim officia impedit non.',NULL,NULL,NULL,NULL,NULL,NULL,108,9,NULL),(2715,'en','default','Qui vel et ut temporibus eaque unde id. Hic cumque ex aliquid pariatur. Numquam dicta rem distinctio voluptas voluptas consectetur nihil.',NULL,NULL,NULL,NULL,NULL,NULL,108,10,NULL),(2716,'en','default',NULL,NULL,NULL,436.1000,NULL,NULL,NULL,108,11,NULL),(2717,'en','default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,108,12,NULL),(2718,'en','default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,108,13,NULL),(2719,'en','default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,108,14,NULL),(2720,'en','default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,108,15,NULL),(2721,'en','default','Quidem sed saepe est.',NULL,NULL,NULL,NULL,NULL,NULL,108,16,NULL),(2722,'en','default','Molestiae porro sed nostrum eveniet.',NULL,NULL,NULL,NULL,NULL,NULL,108,17,NULL),(2723,'en','default','Vel error aut ea placeat.',NULL,NULL,NULL,NULL,NULL,NULL,108,18,NULL),(2724,'en','default','5',NULL,NULL,NULL,NULL,NULL,NULL,108,19,NULL),(2725,'en','default','4',NULL,NULL,NULL,NULL,NULL,NULL,108,20,NULL),(2726,'en','default','85',NULL,NULL,NULL,NULL,NULL,NULL,108,21,NULL),(2727,'en','default','80',NULL,NULL,NULL,NULL,NULL,NULL,108,22,NULL),(2728,'en','default',NULL,1,NULL,NULL,NULL,NULL,NULL,108,26,NULL),(2729,'en','default','PD-624292890',NULL,NULL,NULL,NULL,NULL,NULL,108,27,NULL),(2730,'en','default',NULL,1,NULL,NULL,NULL,NULL,NULL,108,28,NULL),(2731,'en','default',NULL,NULL,NULL,1.0000,NULL,NULL,NULL,108,29,NULL),(2732,'en','default',NULL,NULL,NULL,0.0000,NULL,NULL,NULL,108,30,NULL),(2733,'en','default',NULL,NULL,13,NULL,NULL,NULL,NULL,108,31,NULL),(2734,'en','default','c3c76d6f-a856-3422-bc11-74d46e048ecf',NULL,NULL,NULL,NULL,NULL,NULL,109,1,NULL),(2735,'en','default','Gold quod',NULL,NULL,NULL,NULL,NULL,NULL,109,2,NULL),(2736,'en','default','et-et-voluptates-voluptas-autem-quia-distinctio',NULL,NULL,NULL,NULL,NULL,NULL,109,3,NULL),(2737,'en','default',NULL,NULL,1,NULL,NULL,NULL,NULL,109,4,NULL),(2738,'en','default',NULL,1,NULL,NULL,NULL,NULL,NULL,109,5,NULL),(2739,'en','default',NULL,1,NULL,NULL,NULL,NULL,NULL,109,6,NULL),(2740,'en','default',NULL,1,NULL,NULL,NULL,NULL,NULL,109,7,NULL),(2741,'en','default',NULL,0,NULL,NULL,NULL,NULL,NULL,109,8,NULL),(2742,'en','default','Non et esse aut consequatur sunt nisi molestias.',NULL,NULL,NULL,NULL,NULL,NULL,109,9,NULL),(2743,'en','default','Dolores rem architecto excepturi et. Qui qui dolorem nihil eveniet sint saepe beatae. Repellat laborum nihil dolores et minus est.',NULL,NULL,NULL,NULL,NULL,NULL,109,10,NULL),(2744,'en','default',NULL,NULL,NULL,351.4400,NULL,NULL,NULL,109,11,NULL),(2745,'en','default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,109,12,NULL),(2746,'en','default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,109,13,NULL),(2747,'en','default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,109,14,NULL),(2748,'en','default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,109,15,NULL),(2749,'en','default','Sed excepturi repellendus laboriosam omnis unde non impedit.',NULL,NULL,NULL,NULL,NULL,NULL,109,16,NULL),(2750,'en','default','Similique qui est nobis accusamus aspernatur facilis qui.',NULL,NULL,NULL,NULL,NULL,NULL,109,17,NULL),(2751,'en','default','Voluptas sed sint sapiente esse quas non voluptas dicta.',NULL,NULL,NULL,NULL,NULL,NULL,109,18,NULL),(2752,'en','default','20',NULL,NULL,NULL,NULL,NULL,NULL,109,19,NULL),(2753,'en','default','94',NULL,NULL,NULL,NULL,NULL,NULL,109,20,NULL),(2754,'en','default','90',NULL,NULL,NULL,NULL,NULL,NULL,109,21,NULL),(2755,'en','default','85',NULL,NULL,NULL,NULL,NULL,NULL,109,22,NULL),(2756,'en','default',NULL,1,NULL,NULL,NULL,NULL,NULL,109,26,NULL),(2757,'en','default','PD-289341796',NULL,NULL,NULL,NULL,NULL,NULL,109,27,NULL),(2758,'en','default',NULL,1,NULL,NULL,NULL,NULL,NULL,109,28,NULL),(2759,'en','default',NULL,NULL,NULL,1.0000,NULL,NULL,NULL,109,29,NULL),(2760,'en','default',NULL,NULL,NULL,0.0000,NULL,NULL,NULL,109,30,NULL),(2761,'en','default',NULL,NULL,10,NULL,NULL,NULL,NULL,109,31,NULL),(2762,'en','default','40ceb252-f49f-3907-8191-e40e49413792',NULL,NULL,NULL,NULL,NULL,NULL,110,1,NULL),(2763,'en','default','Silver aperiam',NULL,NULL,NULL,NULL,NULL,NULL,110,2,NULL),(2764,'en','default','numquam-veritatis-culpa-blanditiis-consequatur-animi-a',NULL,NULL,NULL,NULL,NULL,NULL,110,3,NULL),(2765,'en','default',NULL,NULL,1,NULL,NULL,NULL,NULL,110,4,NULL),(2766,'en','default',NULL,1,NULL,NULL,NULL,NULL,NULL,110,5,NULL),(2767,'en','default',NULL,1,NULL,NULL,NULL,NULL,NULL,110,6,NULL),(2768,'en','default',NULL,1,NULL,NULL,NULL,NULL,NULL,110,7,NULL),(2769,'en','default',NULL,0,NULL,NULL,NULL,NULL,NULL,110,8,NULL),(2770,'en','default','Omnis exercitationem quia impedit qui.',NULL,NULL,NULL,NULL,NULL,NULL,110,9,NULL),(2771,'en','default','Ex laboriosam architecto veritatis autem illum cumque modi. Repellendus rem eaque quae voluptatum. Sit est optio ad fugit nobis. Et quam cum omnis similique enim atque quis.',NULL,NULL,NULL,NULL,NULL,NULL,110,10,NULL),(2772,'en','default',NULL,NULL,NULL,22.6000,NULL,NULL,NULL,110,11,NULL),(2773,'en','default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,110,12,NULL),(2774,'en','default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,110,13,NULL),(2775,'en','default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,110,14,NULL),(2776,'en','default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,110,15,NULL),(2777,'en','default','Velit possimus id autem quia ut consequuntur officia.',NULL,NULL,NULL,NULL,NULL,NULL,110,16,NULL),(2778,'en','default','Accusantium ut id sed cupiditate.',NULL,NULL,NULL,NULL,NULL,NULL,110,17,NULL),(2779,'en','default','Vel et perferendis qui est ratione animi.',NULL,NULL,NULL,NULL,NULL,NULL,110,18,NULL),(2780,'en','default','99',NULL,NULL,NULL,NULL,NULL,NULL,110,19,NULL),(2781,'en','default','83',NULL,NULL,NULL,NULL,NULL,NULL,110,20,NULL),(2782,'en','default','75',NULL,NULL,NULL,NULL,NULL,NULL,110,21,NULL),(2783,'en','default','32',NULL,NULL,NULL,NULL,NULL,NULL,110,22,NULL),(2784,'en','default',NULL,1,NULL,NULL,NULL,NULL,NULL,110,26,NULL),(2785,'en','default','PD-372886253',NULL,NULL,NULL,NULL,NULL,NULL,110,27,NULL),(2786,'en','default',NULL,1,NULL,NULL,NULL,NULL,NULL,110,28,NULL),(2787,'en','default',NULL,NULL,NULL,1.0000,NULL,NULL,NULL,110,29,NULL),(2788,'en','default',NULL,NULL,NULL,0.0000,NULL,NULL,NULL,110,30,NULL),(2789,'en','default',NULL,NULL,13,NULL,NULL,NULL,NULL,110,31,NULL),(2790,'en','default','c5c5d45d-9a9d-3234-90b7-9a9d567123a2',NULL,NULL,NULL,NULL,NULL,NULL,111,1,NULL),(2791,'en','default','Gold similique',NULL,NULL,NULL,NULL,NULL,NULL,111,2,NULL),(2792,'en','default','enim-enim-minima-quod-temporibus-fuga-nihil-eum',NULL,NULL,NULL,NULL,NULL,NULL,111,3,NULL),(2793,'en','default',NULL,NULL,1,NULL,NULL,NULL,NULL,111,4,NULL),(2794,'en','default',NULL,1,NULL,NULL,NULL,NULL,NULL,111,5,NULL),(2795,'en','default',NULL,1,NULL,NULL,NULL,NULL,NULL,111,6,NULL),(2796,'en','default',NULL,1,NULL,NULL,NULL,NULL,NULL,111,7,NULL),(2797,'en','default',NULL,1,NULL,NULL,NULL,NULL,NULL,111,8,NULL),(2798,'en','default','<p>Vel nihil nihil architecto eos placeat accusantium nam.</p>',NULL,NULL,NULL,NULL,NULL,NULL,111,9,NULL),(2799,'en','default','<p>Fuga expedita architecto dicta expedita vitae. Et dicta rerum officiis ratione incidunt quo et. Quos quis eveniet facilis iure totam nisi reiciendis.</p>',NULL,NULL,NULL,NULL,NULL,NULL,111,10,NULL),(2800,'en','default',NULL,NULL,NULL,351.0700,NULL,NULL,NULL,111,11,NULL),(2801,'en','default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,111,12,NULL),(2802,'en','default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,111,13,NULL),(2803,'en','default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,111,14,NULL),(2804,'en','default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,111,15,NULL),(2805,'en','default','Incidunt et eveniet debitis eum consequatur.',NULL,NULL,NULL,NULL,NULL,NULL,111,16,NULL),(2806,'en','default','Doloremque ab ut fuga accusamus optio possimus.',NULL,NULL,NULL,NULL,NULL,NULL,111,17,NULL),(2807,'en','default','Quod ipsum corrupti animi animi eligendi.',NULL,NULL,NULL,NULL,NULL,NULL,111,18,NULL),(2808,'en','default','2',NULL,NULL,NULL,NULL,NULL,NULL,111,19,NULL),(2809,'en','default','5',NULL,NULL,NULL,NULL,NULL,NULL,111,20,NULL),(2810,'en','default','22',NULL,NULL,NULL,NULL,NULL,NULL,111,21,NULL),(2811,'en','default','9',NULL,NULL,NULL,NULL,NULL,NULL,111,22,NULL),(2812,'en','default',NULL,1,NULL,NULL,NULL,NULL,NULL,111,26,NULL),(2813,'en','default','PD-943059916',NULL,NULL,NULL,NULL,NULL,NULL,111,27,NULL),(2814,'en','default',NULL,1,NULL,NULL,NULL,NULL,NULL,111,28,NULL),(2815,'en','default',NULL,NULL,NULL,1.0000,NULL,NULL,NULL,111,29,NULL),(2816,'en','default',NULL,NULL,NULL,0.0000,NULL,NULL,NULL,111,30,NULL),(2817,'en','default',NULL,NULL,14,NULL,NULL,NULL,NULL,111,31,NULL),(2818,'en','default','d46577d2-0f77-31b5-b6b4-3fd8aa5ca514',NULL,NULL,NULL,NULL,NULL,NULL,112,1,NULL),(2819,'en','default','Gold at',NULL,NULL,NULL,NULL,NULL,NULL,112,2,NULL),(2820,'en','default','corporis-quidem-voluptates-aliquid',NULL,NULL,NULL,NULL,NULL,NULL,112,3,NULL),(2821,'en','default',NULL,NULL,1,NULL,NULL,NULL,NULL,112,4,NULL),(2822,'en','default',NULL,1,NULL,NULL,NULL,NULL,NULL,112,5,NULL),(2823,'en','default',NULL,1,NULL,NULL,NULL,NULL,NULL,112,6,NULL),(2824,'en','default',NULL,1,NULL,NULL,NULL,NULL,NULL,112,7,NULL),(2825,'en','default',NULL,1,NULL,NULL,NULL,NULL,NULL,112,8,NULL),(2826,'en','default','<p>Aut placeat in animi adipisci.</p>',NULL,NULL,NULL,NULL,NULL,NULL,112,9,NULL),(2827,'en','default','<p>Molestiae debitis in magni nam non. Consequatur qui enim deleniti rerum temporibus sint. Dolor omnis repellat blanditiis qui qui commodi. Necessitatibus sint vel iste voluptatibus repellat.</p>',NULL,NULL,NULL,NULL,NULL,NULL,112,10,NULL),(2828,'en','default',NULL,NULL,NULL,747.8300,NULL,NULL,NULL,112,11,NULL),(2829,'en','default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,112,12,NULL),(2830,'en','default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,112,13,NULL),(2831,'en','default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,112,14,NULL),(2832,'en','default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,112,15,NULL),(2833,'en','default','Et debitis eum consequatur eius earum qui.',NULL,NULL,NULL,NULL,NULL,NULL,112,16,NULL),(2834,'en','default','Quia doloribus atque vel.',NULL,NULL,NULL,NULL,NULL,NULL,112,17,NULL),(2835,'en','default','Veritatis voluptatibus fugit ut quisquam.',NULL,NULL,NULL,NULL,NULL,NULL,112,18,NULL),(2836,'en','default','31',NULL,NULL,NULL,NULL,NULL,NULL,112,19,NULL),(2837,'en','default','97',NULL,NULL,NULL,NULL,NULL,NULL,112,20,NULL),(2838,'en','default','96',NULL,NULL,NULL,NULL,NULL,NULL,112,21,NULL),(2839,'en','default','4',NULL,NULL,NULL,NULL,NULL,NULL,112,22,NULL),(2840,'en','default',NULL,1,NULL,NULL,NULL,NULL,NULL,112,26,NULL),(2841,'en','default','PD-286590392',NULL,NULL,NULL,NULL,NULL,NULL,112,27,NULL),(2842,'en','default',NULL,1,NULL,NULL,NULL,NULL,NULL,112,28,NULL),(2843,'en','default',NULL,NULL,NULL,1.0000,NULL,NULL,NULL,112,29,NULL),(2844,'en','default',NULL,NULL,NULL,0.0000,NULL,NULL,NULL,112,30,NULL),(2845,'en','default',NULL,NULL,10,NULL,NULL,NULL,NULL,112,31,NULL),(2846,'en','default','04ed09f2-2b29-3831-85af-d83eec8896f7',NULL,NULL,NULL,NULL,NULL,NULL,113,1,NULL),(2847,'en','default','Silver accusantium',NULL,NULL,NULL,NULL,NULL,NULL,113,2,NULL),(2848,'en','default','magni-doloremque-placeat-debitis-labore',NULL,NULL,NULL,NULL,NULL,NULL,113,3,NULL),(2849,'en','default',NULL,NULL,1,NULL,NULL,NULL,NULL,113,4,NULL),(2850,'en','default',NULL,1,NULL,NULL,NULL,NULL,NULL,113,5,NULL),(2851,'en','default',NULL,1,NULL,NULL,NULL,NULL,NULL,113,6,NULL),(2852,'en','default',NULL,1,NULL,NULL,NULL,NULL,NULL,113,7,NULL),(2853,'en','default',NULL,1,NULL,NULL,NULL,NULL,NULL,113,8,NULL),(2854,'en','default','<p>Sit dolorum voluptas ipsam eius.</p>',NULL,NULL,NULL,NULL,NULL,NULL,113,9,NULL),(2855,'en','default','<p>Unde excepturi sint ea iusto et. Possimus autem laboriosam voluptatibus sit dignissimos. Aut sed consequatur in sit voluptatem.</p>',NULL,NULL,NULL,NULL,NULL,NULL,113,10,NULL),(2856,'en','default',NULL,NULL,NULL,235.2500,NULL,NULL,NULL,113,11,NULL),(2857,'en','default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,113,12,NULL),(2858,'en','default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,113,13,NULL),(2859,'en','default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,113,14,NULL),(2860,'en','default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,113,15,NULL),(2861,'en','default','Officia consequuntur ipsum dolorem vero.',NULL,NULL,NULL,NULL,NULL,NULL,113,16,NULL),(2862,'en','default','Perferendis error omnis itaque ex quod.',NULL,NULL,NULL,NULL,NULL,NULL,113,17,NULL),(2863,'en','default','Rerum cupiditate quis quia.',NULL,NULL,NULL,NULL,NULL,NULL,113,18,NULL),(2864,'en','default','92',NULL,NULL,NULL,NULL,NULL,NULL,113,19,NULL),(2865,'en','default','12',NULL,NULL,NULL,NULL,NULL,NULL,113,20,NULL),(2866,'en','default','72',NULL,NULL,NULL,NULL,NULL,NULL,113,21,NULL),(2867,'en','default','1',NULL,NULL,NULL,NULL,NULL,NULL,113,22,NULL),(2868,'en','default',NULL,1,NULL,NULL,NULL,NULL,NULL,113,26,NULL),(2869,'en','default','PD-464427607',NULL,NULL,NULL,NULL,NULL,NULL,113,27,NULL),(2870,'en','default',NULL,1,NULL,NULL,NULL,NULL,NULL,113,28,NULL),(2871,'en','default',NULL,NULL,NULL,1.0000,NULL,NULL,NULL,113,29,NULL),(2872,'en','default',NULL,NULL,NULL,0.0000,NULL,NULL,NULL,113,30,NULL),(2873,'en','default',NULL,NULL,10,NULL,NULL,NULL,NULL,113,31,NULL),(2874,'en','default','d3026f08-6164-3875-b083-11a4ac98be5c',NULL,NULL,NULL,NULL,NULL,NULL,114,1,NULL),(2875,'en','default','Silver qui',NULL,NULL,NULL,NULL,NULL,NULL,114,2,NULL),(2876,'en','default','rem-consequatur-eveniet-iusto-tenetur-molestiae',NULL,NULL,NULL,NULL,NULL,NULL,114,3,NULL),(2877,'en','default',NULL,NULL,1,NULL,NULL,NULL,NULL,114,4,NULL),(2878,'en','default',NULL,1,NULL,NULL,NULL,NULL,NULL,114,5,NULL),(2879,'en','default',NULL,1,NULL,NULL,NULL,NULL,NULL,114,6,NULL),(2880,'en','default',NULL,1,NULL,NULL,NULL,NULL,NULL,114,7,NULL),(2881,'en','default',NULL,1,NULL,NULL,NULL,NULL,NULL,114,8,NULL),(2882,'en','default','<p>Et molestiae praesentium eum quam rerum magni.</p>',NULL,NULL,NULL,NULL,NULL,NULL,114,9,NULL),(2883,'en','default','<p>Veritatis rem sit dolor voluptates nobis. Deleniti delectus eveniet perferendis quasi amet voluptates.</p>',NULL,NULL,NULL,NULL,NULL,NULL,114,10,NULL),(2884,'en','default',NULL,NULL,NULL,878.7400,NULL,NULL,NULL,114,11,NULL),(2885,'en','default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,114,12,NULL),(2886,'en','default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,114,13,NULL),(2887,'en','default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,114,14,NULL),(2888,'en','default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,114,15,NULL),(2889,'en','default','Maxime corporis saepe quaerat quos.',NULL,NULL,NULL,NULL,NULL,NULL,114,16,NULL),(2890,'en','default','Iure quaerat voluptate quo hic aliquam nobis.',NULL,NULL,NULL,NULL,NULL,NULL,114,17,NULL),(2891,'en','default','Et fugiat officiis quia voluptatem saepe.',NULL,NULL,NULL,NULL,NULL,NULL,114,18,NULL),(2892,'en','default','85',NULL,NULL,NULL,NULL,NULL,NULL,114,19,NULL),(2893,'en','default','88',NULL,NULL,NULL,NULL,NULL,NULL,114,20,NULL),(2894,'en','default','29',NULL,NULL,NULL,NULL,NULL,NULL,114,21,NULL),(2895,'en','default','4',NULL,NULL,NULL,NULL,NULL,NULL,114,22,NULL),(2896,'en','default',NULL,1,NULL,NULL,NULL,NULL,NULL,114,26,NULL),(2897,'en','default','PD-529402983',NULL,NULL,NULL,NULL,NULL,NULL,114,27,NULL),(2898,'en','default',NULL,1,NULL,NULL,NULL,NULL,NULL,114,28,NULL),(2899,'en','default',NULL,NULL,NULL,1.0000,NULL,NULL,NULL,114,29,NULL),(2900,'en','default',NULL,NULL,NULL,0.0000,NULL,NULL,NULL,114,30,NULL),(2901,'en','default',NULL,NULL,12,NULL,NULL,NULL,NULL,114,31,NULL),(2902,'en','default','74961379-4ce3-35c9-b3ab-69bf7b9636bb',NULL,NULL,NULL,NULL,NULL,NULL,115,1,NULL),(2903,'en','default','Silver fugit',NULL,NULL,NULL,NULL,NULL,NULL,115,2,NULL),(2904,'en','default','atque-dolor-non-unde-adipisci-rerum-qui',NULL,NULL,NULL,NULL,NULL,NULL,115,3,NULL),(2905,'en','default',NULL,NULL,1,NULL,NULL,NULL,NULL,115,4,NULL),(2906,'en','default',NULL,1,NULL,NULL,NULL,NULL,NULL,115,5,NULL),(2907,'en','default',NULL,1,NULL,NULL,NULL,NULL,NULL,115,6,NULL),(2908,'en','default',NULL,1,NULL,NULL,NULL,NULL,NULL,115,7,NULL),(2909,'en','default',NULL,1,NULL,NULL,NULL,NULL,NULL,115,8,NULL),(2910,'en','default','<p>Autem et aut qui ut et quae et.</p>',NULL,NULL,NULL,NULL,NULL,NULL,115,9,NULL),(2911,'en','default','<p>Veniam ad veniam fugiat nam quia. Voluptate consequuntur nisi aliquam vero. Sequi consequuntur dolorem placeat ut minima sint.</p>',NULL,NULL,NULL,NULL,NULL,NULL,115,10,NULL),(2912,'en','default',NULL,NULL,NULL,876.7500,NULL,NULL,NULL,115,11,NULL),(2913,'en','default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,115,12,NULL),(2914,'en','default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,115,13,NULL),(2915,'en','default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,115,14,NULL),(2916,'en','default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,115,15,NULL),(2917,'en','default','Necessitatibus quo quos ullam dolor.',NULL,NULL,NULL,NULL,NULL,NULL,115,16,NULL),(2918,'en','default','Repellendus ad consequatur nihil.',NULL,NULL,NULL,NULL,NULL,NULL,115,17,NULL),(2919,'en','default','Excepturi iure doloremque ut molestias laboriosam perferendis est.',NULL,NULL,NULL,NULL,NULL,NULL,115,18,NULL),(2920,'en','default','26',NULL,NULL,NULL,NULL,NULL,NULL,115,19,NULL),(2921,'en','default','20',NULL,NULL,NULL,NULL,NULL,NULL,115,20,NULL),(2922,'en','default','55',NULL,NULL,NULL,NULL,NULL,NULL,115,21,NULL),(2923,'en','default','64',NULL,NULL,NULL,NULL,NULL,NULL,115,22,NULL),(2924,'en','default',NULL,1,NULL,NULL,NULL,NULL,NULL,115,26,NULL),(2925,'en','default','PD-900065619',NULL,NULL,NULL,NULL,NULL,NULL,115,27,NULL),(2926,'en','default',NULL,1,NULL,NULL,NULL,NULL,NULL,115,28,NULL),(2927,'en','default',NULL,NULL,NULL,1.0000,NULL,NULL,NULL,115,29,NULL),(2928,'en','default',NULL,NULL,NULL,0.0000,NULL,NULL,NULL,115,30,NULL),(2929,'en','default',NULL,NULL,10,NULL,NULL,NULL,NULL,115,31,NULL),(2930,'en','default','df714ed0-136f-3db8-9977-4af2fe106d77',NULL,NULL,NULL,NULL,NULL,NULL,116,1,NULL),(2931,'en','default','Gold ea',NULL,NULL,NULL,NULL,NULL,NULL,116,2,NULL),(2932,'en','default','quam-amet-molestiae-ut-alias-nam-aspernatur-unde',NULL,NULL,NULL,NULL,NULL,NULL,116,3,NULL),(2933,'en','default',NULL,NULL,1,NULL,NULL,NULL,NULL,116,4,NULL),(2934,'en','default',NULL,1,NULL,NULL,NULL,NULL,NULL,116,5,NULL),(2935,'en','default',NULL,1,NULL,NULL,NULL,NULL,NULL,116,6,NULL),(2936,'en','default',NULL,1,NULL,NULL,NULL,NULL,NULL,116,7,NULL),(2937,'en','default',NULL,1,NULL,NULL,NULL,NULL,NULL,116,8,NULL),(2938,'en','default','<p>At aut nihil saepe sapiente sit nesciunt excepturi.</p>',NULL,NULL,NULL,NULL,NULL,NULL,116,9,NULL),(2939,'en','default','<p>Nihil occaecati eos voluptas sit a qui dolorem. Aut qui culpa ex debitis in magni. Ad sit tempora quasi aut est.</p>',NULL,NULL,NULL,NULL,NULL,NULL,116,10,NULL),(2940,'en','default',NULL,NULL,NULL,466.3600,NULL,NULL,NULL,116,11,NULL),(2941,'en','default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,116,12,NULL),(2942,'en','default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,116,13,NULL),(2943,'en','default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,116,14,NULL),(2944,'en','default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,116,15,NULL),(2945,'en','default','Quas dignissimos dolor culpa expedita adipisci consequuntur.',NULL,NULL,NULL,NULL,NULL,NULL,116,16,NULL),(2946,'en','default','Perferendis et sed dolores.',NULL,NULL,NULL,NULL,NULL,NULL,116,17,NULL),(2947,'en','default','Esse eum molestias voluptatem commodi aliquam et.',NULL,NULL,NULL,NULL,NULL,NULL,116,18,NULL),(2948,'en','default','89',NULL,NULL,NULL,NULL,NULL,NULL,116,19,NULL),(2949,'en','default','69',NULL,NULL,NULL,NULL,NULL,NULL,116,20,NULL),(2950,'en','default','83',NULL,NULL,NULL,NULL,NULL,NULL,116,21,NULL),(2951,'en','default','46',NULL,NULL,NULL,NULL,NULL,NULL,116,22,NULL),(2952,'en','default',NULL,1,NULL,NULL,NULL,NULL,NULL,116,26,NULL),(2953,'en','default','PD-810195036',NULL,NULL,NULL,NULL,NULL,NULL,116,27,NULL),(2954,'en','default',NULL,1,NULL,NULL,NULL,NULL,NULL,116,28,NULL),(2955,'en','default',NULL,NULL,NULL,1.0000,NULL,NULL,NULL,116,29,NULL),(2956,'en','default',NULL,NULL,NULL,0.0000,NULL,NULL,NULL,116,30,NULL),(2957,'en','default',NULL,NULL,13,NULL,NULL,NULL,NULL,116,31,NULL),(2958,'en','default','adf62e24-880b-3dcd-b969-047872ca7da9',NULL,NULL,NULL,NULL,NULL,NULL,117,1,NULL),(2959,'en','default','Platinum omnis',NULL,NULL,NULL,NULL,NULL,NULL,117,2,NULL),(2960,'en','default','et-deleniti-voluptas-accusantium',NULL,NULL,NULL,NULL,NULL,NULL,117,3,NULL),(2961,'en','default',NULL,NULL,1,NULL,NULL,NULL,NULL,117,4,NULL),(2962,'en','default',NULL,1,NULL,NULL,NULL,NULL,NULL,117,5,NULL),(2963,'en','default',NULL,1,NULL,NULL,NULL,NULL,NULL,117,6,NULL),(2964,'en','default',NULL,1,NULL,NULL,NULL,NULL,NULL,117,7,NULL),(2965,'en','default',NULL,1,NULL,NULL,NULL,NULL,NULL,117,8,NULL),(2966,'en','default','<p>Neque repellat sit aut fugiat.</p>',NULL,NULL,NULL,NULL,NULL,NULL,117,9,NULL),(2967,'en','default','<p>Dolores voluptatem fugit hic rerum quia dicta. Rerum et autem quasi voluptas. Quidem unde et quidem nobis modi non. Quia impedit culpa veritatis cupiditate perspiciatis magni eos.</p>',NULL,NULL,NULL,NULL,NULL,NULL,117,10,NULL),(2968,'en','default',NULL,NULL,NULL,852.8700,NULL,NULL,NULL,117,11,NULL),(2969,'en','default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,117,12,NULL),(2970,'en','default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,117,13,NULL),(2971,'en','default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,117,14,NULL),(2972,'en','default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,117,15,NULL),(2973,'en','default','Blanditiis hic voluptatibus natus.',NULL,NULL,NULL,NULL,NULL,NULL,117,16,NULL),(2974,'en','default','Sequi numquam in veniam debitis facilis natus qui.',NULL,NULL,NULL,NULL,NULL,NULL,117,17,NULL),(2975,'en','default','Aliquid deleniti aut quasi ut.',NULL,NULL,NULL,NULL,NULL,NULL,117,18,NULL),(2976,'en','default','72',NULL,NULL,NULL,NULL,NULL,NULL,117,19,NULL),(2977,'en','default','92',NULL,NULL,NULL,NULL,NULL,NULL,117,20,NULL),(2978,'en','default','51',NULL,NULL,NULL,NULL,NULL,NULL,117,21,NULL),(2979,'en','default','97',NULL,NULL,NULL,NULL,NULL,NULL,117,22,NULL),(2980,'en','default',NULL,1,NULL,NULL,NULL,NULL,NULL,117,26,NULL),(2981,'en','default','PD-955994551',NULL,NULL,NULL,NULL,NULL,NULL,117,27,NULL),(2982,'en','default',NULL,1,NULL,NULL,NULL,NULL,NULL,117,28,NULL),(2983,'en','default',NULL,NULL,NULL,1.0000,NULL,NULL,NULL,117,29,NULL),(2984,'en','default',NULL,NULL,NULL,0.0000,NULL,NULL,NULL,117,30,NULL),(2985,'en','default',NULL,NULL,14,NULL,NULL,NULL,NULL,117,31,NULL),(2986,'en','default','d6b28d50-4f67-3f6c-aa53-144443e6bb60',NULL,NULL,NULL,NULL,NULL,NULL,118,1,NULL),(2987,'en','default','Gold rerum',NULL,NULL,NULL,NULL,NULL,NULL,118,2,NULL),(2988,'en','default','tempore-quibusdam-enim-numquam-quae',NULL,NULL,NULL,NULL,NULL,NULL,118,3,NULL),(2989,'en','default',NULL,NULL,1,NULL,NULL,NULL,NULL,118,4,NULL),(2990,'en','default',NULL,1,NULL,NULL,NULL,NULL,NULL,118,5,NULL),(2991,'en','default',NULL,1,NULL,NULL,NULL,NULL,NULL,118,6,NULL),(2992,'en','default',NULL,1,NULL,NULL,NULL,NULL,NULL,118,7,NULL),(2993,'en','default',NULL,1,NULL,NULL,NULL,NULL,NULL,118,8,NULL),(2994,'en','default','<p>Commodi corporis illo consequatur sit itaque.</p>',NULL,NULL,NULL,NULL,NULL,NULL,118,9,NULL),(2995,'en','default','<p>Optio voluptatem quis qui quasi. Aliquid laborum beatae ut error praesentium deleniti. Nostrum odit delectus iusto asperiores quasi eos voluptatem placeat. Dolorum illo vero in voluptatem.</p>',NULL,NULL,NULL,NULL,NULL,NULL,118,10,NULL),(2996,'en','default',NULL,NULL,NULL,264.0900,NULL,NULL,NULL,118,11,NULL),(2997,'en','default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,118,12,NULL),(2998,'en','default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,118,13,NULL),(2999,'en','default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,118,14,NULL),(3000,'en','default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,118,15,NULL),(3001,'en','default','Et necessitatibus ipsam rerum.',NULL,NULL,NULL,NULL,NULL,NULL,118,16,NULL),(3002,'en','default','Suscipit officia molestiae ut omnis dolorum voluptas.',NULL,NULL,NULL,NULL,NULL,NULL,118,17,NULL),(3003,'en','default','Veritatis nihil velit in dolorem ut in.',NULL,NULL,NULL,NULL,NULL,NULL,118,18,NULL),(3004,'en','default','10',NULL,NULL,NULL,NULL,NULL,NULL,118,19,NULL),(3005,'en','default','27',NULL,NULL,NULL,NULL,NULL,NULL,118,20,NULL),(3006,'en','default','95',NULL,NULL,NULL,NULL,NULL,NULL,118,21,NULL),(3007,'en','default','10',NULL,NULL,NULL,NULL,NULL,NULL,118,22,NULL),(3008,'en','default',NULL,1,NULL,NULL,NULL,NULL,NULL,118,26,NULL),(3009,'en','default','PD-825235471',NULL,NULL,NULL,NULL,NULL,NULL,118,27,NULL),(3010,'en','default',NULL,1,NULL,NULL,NULL,NULL,NULL,118,28,NULL),(3011,'en','default',NULL,NULL,NULL,1.0000,NULL,NULL,NULL,118,29,NULL),(3012,'en','default',NULL,NULL,NULL,0.0000,NULL,NULL,NULL,118,30,NULL),(3013,'en','default',NULL,NULL,13,NULL,NULL,NULL,NULL,118,31,NULL),(3014,'en','default','3c2fde50-7b70-3477-bf41-750b32257c02',NULL,NULL,NULL,NULL,NULL,NULL,119,1,NULL),(3015,'en','default','Silver dolorem',NULL,NULL,NULL,NULL,NULL,NULL,119,2,NULL),(3016,'en','default','unde-est-officiis-nobis-sunt-iure-ut',NULL,NULL,NULL,NULL,NULL,NULL,119,3,NULL),(3017,'en','default',NULL,NULL,1,NULL,NULL,NULL,NULL,119,4,NULL),(3018,'en','default',NULL,1,NULL,NULL,NULL,NULL,NULL,119,5,NULL),(3019,'en','default',NULL,1,NULL,NULL,NULL,NULL,NULL,119,6,NULL),(3020,'en','default',NULL,1,NULL,NULL,NULL,NULL,NULL,119,7,NULL),(3021,'en','default',NULL,1,NULL,NULL,NULL,NULL,NULL,119,8,NULL),(3022,'en','default','<p>Quibusdam et vitae rerum et molestias amet tempore doloribus.</p>',NULL,NULL,NULL,NULL,NULL,NULL,119,9,NULL),(3023,'en','default','<p>Qui in ut maxime. Enim ex in rerum illum error voluptas consectetur optio. Excepturi id molestiae non dolorum dolor omnis fugit et.</p>',NULL,NULL,NULL,NULL,NULL,NULL,119,10,NULL),(3024,'en','default',NULL,NULL,NULL,607.9800,NULL,NULL,NULL,119,11,NULL),(3025,'en','default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,119,12,NULL),(3026,'en','default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,119,13,NULL),(3027,'en','default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,119,14,NULL),(3028,'en','default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,119,15,NULL),(3029,'en','default','Iste consequatur ex cupiditate nihil et libero officia.',NULL,NULL,NULL,NULL,NULL,NULL,119,16,NULL),(3030,'en','default','Dolore fuga ut id sed.',NULL,NULL,NULL,NULL,NULL,NULL,119,17,NULL),(3031,'en','default','Neque tenetur nam exercitationem quia reiciendis.',NULL,NULL,NULL,NULL,NULL,NULL,119,18,NULL),(3032,'en','default','32',NULL,NULL,NULL,NULL,NULL,NULL,119,19,NULL),(3033,'en','default','41',NULL,NULL,NULL,NULL,NULL,NULL,119,20,NULL),(3034,'en','default','19',NULL,NULL,NULL,NULL,NULL,NULL,119,21,NULL),(3035,'en','default','88',NULL,NULL,NULL,NULL,NULL,NULL,119,22,NULL),(3036,'en','default',NULL,1,NULL,NULL,NULL,NULL,NULL,119,26,NULL),(3037,'en','default','PD-879553196',NULL,NULL,NULL,NULL,NULL,NULL,119,27,NULL),(3038,'en','default',NULL,1,NULL,NULL,NULL,NULL,NULL,119,28,NULL),(3039,'en','default',NULL,NULL,NULL,1.0000,NULL,NULL,NULL,119,29,NULL),(3040,'en','default',NULL,NULL,NULL,0.0000,NULL,NULL,NULL,119,30,NULL),(3041,'en','default',NULL,NULL,11,NULL,NULL,NULL,NULL,119,31,NULL),(3042,'en','default','a4c85c8a-60ff-37f4-bd2e-21b1833d110b',NULL,NULL,NULL,NULL,NULL,NULL,120,1,NULL),(3043,'en','default','Platinum animi',NULL,NULL,NULL,NULL,NULL,NULL,120,2,NULL),(3044,'en','default','quas-placeat-qui-tempore-molestiae-optio-id',NULL,NULL,NULL,NULL,NULL,NULL,120,3,NULL),(3045,'en','default',NULL,NULL,1,NULL,NULL,NULL,NULL,120,4,NULL),(3046,'en','default',NULL,1,NULL,NULL,NULL,NULL,NULL,120,5,NULL),(3047,'en','default',NULL,1,NULL,NULL,NULL,NULL,NULL,120,6,NULL),(3048,'en','default',NULL,1,NULL,NULL,NULL,NULL,NULL,120,7,NULL),(3049,'en','default',NULL,1,NULL,NULL,NULL,NULL,NULL,120,8,NULL),(3050,'en','default','<p>Dolorem qui dicta aliquid eius beatae.</p>',NULL,NULL,NULL,NULL,NULL,NULL,120,9,NULL),(3051,'en','default','<p>Omnis tempore est eum voluptatem est. Delectus et reiciendis sequi et et nostrum laudantium. Nihil natus ducimus aspernatur quia neque vel amet. Nisi eum pariatur consequatur qui.</p>',NULL,NULL,NULL,NULL,NULL,NULL,120,10,NULL),(3052,'en','default',NULL,NULL,NULL,592.5900,NULL,NULL,NULL,120,11,NULL),(3053,'en','default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,120,12,NULL),(3054,'en','default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,120,13,NULL),(3055,'en','default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,120,14,NULL),(3056,'en','default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,120,15,NULL),(3057,'en','default','Hic atque accusantium quo nihil magni atque quisquam.',NULL,NULL,NULL,NULL,NULL,NULL,120,16,NULL),(3058,'en','default','Laudantium rem et labore unde repellendus aspernatur ducimus.',NULL,NULL,NULL,NULL,NULL,NULL,120,17,NULL),(3059,'en','default','Ullam recusandae perferendis omnis officia in voluptatum autem.',NULL,NULL,NULL,NULL,NULL,NULL,120,18,NULL),(3060,'en','default','37',NULL,NULL,NULL,NULL,NULL,NULL,120,19,NULL),(3061,'en','default','14',NULL,NULL,NULL,NULL,NULL,NULL,120,20,NULL),(3062,'en','default','46',NULL,NULL,NULL,NULL,NULL,NULL,120,21,NULL),(3063,'en','default','77',NULL,NULL,NULL,NULL,NULL,NULL,120,22,NULL),(3064,'en','default',NULL,1,NULL,NULL,NULL,NULL,NULL,120,26,NULL),(3065,'en','default','PD-389400830',NULL,NULL,NULL,NULL,NULL,NULL,120,27,NULL),(3066,'en','default',NULL,1,NULL,NULL,NULL,NULL,NULL,120,28,NULL),(3067,'en','default',NULL,NULL,NULL,1.0000,NULL,NULL,NULL,120,29,NULL),(3068,'en','default',NULL,NULL,NULL,0.0000,NULL,NULL,NULL,120,30,NULL),(3069,'en','default',NULL,NULL,13,NULL,NULL,NULL,NULL,120,31,NULL),(3070,'en','default','sjfgkfshfgjkhskfd',NULL,NULL,NULL,NULL,NULL,NULL,122,9,'default|en|122|9'),(3071,'en','default','kfjhsdijfhdjkshfkjdskfjhdsk',NULL,NULL,NULL,NULL,NULL,NULL,122,10,'default|en|122|10'),(3072,NULL,NULL,'3847293649274234234',NULL,NULL,NULL,NULL,NULL,NULL,122,1,'default|en|122|1'),(3073,'en','default','Produc1',NULL,NULL,NULL,NULL,NULL,NULL,122,2,'default|en|122|2'),(3074,NULL,NULL,'Produc1',NULL,NULL,NULL,NULL,NULL,NULL,122,3,'default|en|122|3'),(3075,NULL,'default',NULL,NULL,1,NULL,NULL,NULL,NULL,122,4,'default|en|122|4'),(3076,NULL,NULL,NULL,NULL,10,NULL,NULL,NULL,NULL,122,31,'default|en|122|31'),(3077,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,122,28,'default|en|122|28'),(3078,'en','default',NULL,NULL,NULL,12.0000,NULL,NULL,NULL,122,11,'default|en|122|11'),(3079,NULL,NULL,NULL,NULL,NULL,12.0000,NULL,NULL,NULL,122,29,'default|en|122|29'),(3080,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,122,5,'default|en|122|5'),(3081,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,122,6,'default|en|122|6'),(3082,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,122,7,'default|en|122|7'),(3083,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,122,8,'default|en|122|8'),(3084,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,122,26,'default|en|122|26'),(3085,NULL,NULL,'500',NULL,NULL,NULL,NULL,NULL,NULL,122,22,'default|en|122|22');
/*!40000 ALTER TABLE `product_attribute_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_bundle_option_products`
--

DROP TABLE IF EXISTS `product_bundle_option_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_bundle_option_products` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int unsigned NOT NULL,
  `product_bundle_option_id` int unsigned NOT NULL,
  `qty` int NOT NULL DEFAULT '0',
  `is_user_defined` tinyint(1) NOT NULL DEFAULT '1',
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `sort_order` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `bundle_option_products_product_id_bundle_option_id_unique` (`product_id`,`product_bundle_option_id`),
  KEY `product_bundle_option_products_product_bundle_option_id_foreign` (`product_bundle_option_id`),
  CONSTRAINT `product_bundle_option_products_product_bundle_option_id_foreign` FOREIGN KEY (`product_bundle_option_id`) REFERENCES `product_bundle_options` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_bundle_option_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_bundle_option_products`
--

LOCK TABLES `product_bundle_option_products` WRITE;
/*!40000 ALTER TABLE `product_bundle_option_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_bundle_option_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_bundle_option_translations`
--

DROP TABLE IF EXISTS `product_bundle_option_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_bundle_option_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_bundle_option_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_bundle_option_translations_option_id_locale_unique` (`product_bundle_option_id`,`locale`),
  UNIQUE KEY `bundle_option_translations_locale_label_bundle_option_id_unique` (`locale`,`label`,`product_bundle_option_id`),
  CONSTRAINT `product_bundle_option_translations_option_id_foreign` FOREIGN KEY (`product_bundle_option_id`) REFERENCES `product_bundle_options` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_bundle_option_translations`
--

LOCK TABLES `product_bundle_option_translations` WRITE;
/*!40000 ALTER TABLE `product_bundle_option_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_bundle_option_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_bundle_options`
--

DROP TABLE IF EXISTS `product_bundle_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_bundle_options` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int unsigned NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_required` tinyint(1) NOT NULL DEFAULT '1',
  `sort_order` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `product_bundle_options_product_id_foreign` (`product_id`),
  CONSTRAINT `product_bundle_options_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_bundle_options`
--

LOCK TABLES `product_bundle_options` WRITE;
/*!40000 ALTER TABLE `product_bundle_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_bundle_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_categories`
--

DROP TABLE IF EXISTS `product_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_categories` (
  `product_id` int unsigned NOT NULL,
  `category_id` int unsigned NOT NULL,
  UNIQUE KEY `product_categories_product_id_category_id_unique` (`product_id`,`category_id`),
  KEY `product_categories_category_id_foreign` (`category_id`),
  CONSTRAINT `product_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_categories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_categories`
--

LOCK TABLES `product_categories` WRITE;
/*!40000 ALTER TABLE `product_categories` DISABLE KEYS */;
INSERT INTO `product_categories` VALUES (122,2),(122,3),(122,4),(101,5),(102,5),(103,5),(104,5),(105,5),(106,5),(107,5),(108,5),(109,5),(110,5),(111,6),(112,6),(113,6),(114,6),(115,6),(116,6),(117,6),(118,6),(119,6),(120,6),(111,13),(112,13),(113,13),(114,13),(115,13),(116,13),(117,13),(118,13),(119,13),(120,13),(101,15),(102,15),(103,15),(104,15),(105,15),(106,15),(107,15),(108,15),(109,15),(110,15);
/*!40000 ALTER TABLE `product_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_cross_sells`
--

DROP TABLE IF EXISTS `product_cross_sells`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_cross_sells` (
  `parent_id` int unsigned NOT NULL,
  `child_id` int unsigned NOT NULL,
  UNIQUE KEY `product_cross_sells_parent_id_child_id_unique` (`parent_id`,`child_id`),
  KEY `product_cross_sells_child_id_foreign` (`child_id`),
  CONSTRAINT `product_cross_sells_child_id_foreign` FOREIGN KEY (`child_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_cross_sells_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_cross_sells`
--

LOCK TABLES `product_cross_sells` WRITE;
/*!40000 ALTER TABLE `product_cross_sells` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_cross_sells` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_customer_group_prices`
--

DROP TABLE IF EXISTS `product_customer_group_prices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_customer_group_prices` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `qty` int NOT NULL DEFAULT '0',
  `value_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `product_id` int unsigned NOT NULL,
  `customer_group_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `unique_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_customer_group_prices_unique_id_unique` (`unique_id`),
  KEY `product_customer_group_prices_product_id_foreign` (`product_id`),
  KEY `product_customer_group_prices_customer_group_id_foreign` (`customer_group_id`),
  CONSTRAINT `product_customer_group_prices_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_customer_group_prices_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_customer_group_prices`
--

LOCK TABLES `product_customer_group_prices` WRITE;
/*!40000 ALTER TABLE `product_customer_group_prices` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_customer_group_prices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_downloadable_link_translations`
--

DROP TABLE IF EXISTS `product_downloadable_link_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_downloadable_link_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_downloadable_link_id` int unsigned NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `link_translations_link_id_foreign` (`product_downloadable_link_id`),
  CONSTRAINT `link_translations_link_id_foreign` FOREIGN KEY (`product_downloadable_link_id`) REFERENCES `product_downloadable_links` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_downloadable_link_translations`
--

LOCK TABLES `product_downloadable_link_translations` WRITE;
/*!40000 ALTER TABLE `product_downloadable_link_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_downloadable_link_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_downloadable_links`
--

DROP TABLE IF EXISTS `product_downloadable_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_downloadable_links` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int unsigned NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `sample_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sample_file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sample_file_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sample_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `downloads` int NOT NULL DEFAULT '0',
  `sort_order` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_downloadable_links_product_id_foreign` (`product_id`),
  CONSTRAINT `product_downloadable_links_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_downloadable_links`
--

LOCK TABLES `product_downloadable_links` WRITE;
/*!40000 ALTER TABLE `product_downloadable_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_downloadable_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_downloadable_sample_translations`
--

DROP TABLE IF EXISTS `product_downloadable_sample_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_downloadable_sample_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_downloadable_sample_id` int unsigned NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `sample_translations_sample_id_foreign` (`product_downloadable_sample_id`),
  CONSTRAINT `sample_translations_sample_id_foreign` FOREIGN KEY (`product_downloadable_sample_id`) REFERENCES `product_downloadable_samples` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_downloadable_sample_translations`
--

LOCK TABLES `product_downloadable_sample_translations` WRITE;
/*!40000 ALTER TABLE `product_downloadable_sample_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_downloadable_sample_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_downloadable_samples`
--

DROP TABLE IF EXISTS `product_downloadable_samples`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_downloadable_samples` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int unsigned NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort_order` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_downloadable_samples_product_id_foreign` (`product_id`),
  CONSTRAINT `product_downloadable_samples_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_downloadable_samples`
--

LOCK TABLES `product_downloadable_samples` WRITE;
/*!40000 ALTER TABLE `product_downloadable_samples` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_downloadable_samples` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_flat`
--

DROP TABLE IF EXISTS `product_flat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_flat` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `short_description` text COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  `url_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `new` tinyint(1) DEFAULT NULL,
  `featured` tinyint(1) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `meta_title` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `price` decimal(12,4) DEFAULT NULL,
  `special_price` decimal(12,4) DEFAULT NULL,
  `special_price_from` date DEFAULT NULL,
  `special_price_to` date DEFAULT NULL,
  `weight` decimal(12,4) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attribute_family_id` int unsigned DEFAULT NULL,
  `product_id` int unsigned NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `parent_id` int unsigned DEFAULT NULL,
  `visible_individually` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_flat_unique_index` (`product_id`,`channel`,`locale`),
  KEY `product_flat_attribute_family_id_foreign` (`attribute_family_id`),
  KEY `product_flat_parent_id_foreign` (`parent_id`),
  CONSTRAINT `product_flat_attribute_family_id_foreign` FOREIGN KEY (`attribute_family_id`) REFERENCES `attribute_families` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `product_flat_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `product_flat` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_flat_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_flat`
--

LOCK TABLES `product_flat` WRITE;
/*!40000 ALTER TABLE `product_flat` DISABLE KEYS */;
INSERT INTO `product_flat` VALUES (101,'f485335d-ce8b-3ba1-9191-30fd2454cceb','simple','PD-641441816','Silver est','Deleniti ut veritatis ut dolores ut.','Enim adipisci optio id voluptas et esse impedit. Aperiam vero eos modi non voluptate accusantium. Accusantium maxime non dolores magni voluptatem.','tenetur-id-consequuntur-ut-aut-voluptas',1,1,0,'Ut enim error laborum natus eos dolorum consequatur.','Reprehenderit enim explicabo architecto similique voluptas consequuntur iure.','Neque qui eos facilis aliquid quo rerum.',439.5800,NULL,NULL,NULL,40.0000,'2024-05-06 19:27:58','en','default',1,101,'2024-05-06 20:39:56',NULL,1),(102,'e3a872f9-e538-33ee-83ab-81d2ff44d7f1','simple','PD-015033099','Silver soluta','Sequi magnam accusamus id tempora vel sed nesciunt.','Ad et ullam qui est quo dolores dicta. Reiciendis aut qui aut optio. Ducimus nihil molestiae porro. Est id ut velit dolorum magni voluptates ut. Tempora aut accusantium enim vitae fuga.','qui-ut-asperiores-architecto-voluptatum-animi',1,1,0,'Consequuntur ex temporibus adipisci et voluptatibus repudiandae vel.','Doloribus suscipit atque numquam ea nemo.','Officiis placeat quos eum natus.',646.5000,NULL,NULL,NULL,92.0000,'2024-05-06 19:27:58','en','default',1,102,'2024-05-06 20:39:56',NULL,1),(103,'36d77023-5e34-3403-a9a4-04b417318dd0','simple','PD-863178111','Silver unde','Sit reprehenderit veritatis omnis alias tempore.','Aut explicabo consequuntur et aspernatur rerum debitis. Delectus nostrum praesentium nulla blanditiis ea. Et animi deleniti ea ipsam ea expedita repellat doloremque. Rerum sed ab eius et ut.','minima-quae-eum-ipsum-doloribus',1,1,0,'Sint non molestiae doloremque.','Dolorum enim optio ipsum illum.','Et aperiam ut deserunt voluptas recusandae.',917.7700,NULL,NULL,NULL,17.0000,'2024-05-06 19:27:58','en','default',1,103,'2024-05-06 20:39:56',NULL,1),(104,'ee141721-b5d8-37cb-9483-67e3b64da72f','simple','PD-201843208','Platinum blanditiis','Excepturi dolores nisi dolorem aut laudantium.','Culpa modi corporis exercitationem vel corrupti. Nisi id nulla velit aut corrupti. Harum id quidem rerum libero repellat dolorem corporis. Perferendis accusantium facilis eveniet culpa aut. Quidem culpa porro voluptas deserunt mollitia deserunt cupiditate.','dolorem-consequuntur-quas-illo-est-aliquam',1,1,0,'Tempora est quia id ipsam ullam.','Incidunt velit voluptatem eligendi ratione cupiditate rem.','Voluptatem velit et magnam.',462.0000,NULL,NULL,NULL,26.0000,'2024-05-06 19:27:58','en','default',1,104,'2024-05-06 20:39:56',NULL,1),(105,'b257b213-e022-3000-9df5-dd1c9e13554b','simple','PD-172418055','Gold expedita','Excepturi doloremque suscipit totam qui veritatis et.','Enim id eligendi delectus iure consectetur. Quo sunt aliquam et et cumque. Enim cum illo nostrum sunt aperiam vero.','ullam-omnis-sit-incidunt-repellat-cum-accusantium-ipsa',1,1,0,'Hic repellendus consequuntur reprehenderit sit.','In est ipsa dolores sed.','Mollitia facilis vel fuga aliquid tempora voluptatum.',406.6500,NULL,NULL,NULL,80.0000,'2024-05-06 19:27:58','en','default',1,105,'2024-05-06 20:39:56',NULL,1),(106,'8725cbcc-b0d6-363f-970c-1ab1001a2601','simple','PD-154501060','Silver quas','Excepturi sed maxime sint sunt magnam deleniti et modi.','Sed et sequi reprehenderit mollitia dolores possimus ipsa. Corporis et fuga aliquid inventore id.','ad-fugiat-at-quisquam-quis-voluptatum-natus-dolorem-sed',1,1,0,'Eveniet quis voluptatum qui sed inventore ea ipsum.','Consectetur voluptatum beatae molestias illum dolores perferendis iste.','Consequuntur possimus id eius odit qui.',916.1200,NULL,NULL,NULL,19.0000,'2024-05-06 19:27:58','en','default',1,106,'2024-05-06 20:39:56',NULL,1),(107,'74f071bc-18ad-3c53-9b78-c3828cf9370c','simple','PD-156984971','Silver explicabo','Officiis architecto rem voluptatem molestias expedita quia asperiores et.','Quia iste nulla nam maxime ea velit voluptate. Voluptas reprehenderit vero atque. Vero quia quia officia animi distinctio voluptatem.','et-placeat-quo-ut',1,1,0,'Laborum voluptatibus voluptates soluta rerum consectetur dolore.','Facilis corrupti expedita qui et et repellendus ea.','Veritatis quis id quia qui.',122.0500,NULL,NULL,NULL,56.0000,'2024-05-06 19:27:58','en','default',1,107,'2024-05-06 20:39:56',NULL,1),(108,'17ca6e3a-668c-32da-acb9-49b7e65585cf','simple','PD-624292890','Gold a','Ratione enim officia impedit non.','Qui vel et ut temporibus eaque unde id. Hic cumque ex aliquid pariatur. Numquam dicta rem distinctio voluptas voluptas consectetur nihil.','eos-voluptatum-velit-voluptatum-pariatur-sed',1,1,0,'Quidem sed saepe est.','Molestiae porro sed nostrum eveniet.','Vel error aut ea placeat.',436.1000,NULL,NULL,NULL,80.0000,'2024-05-06 19:27:58','en','default',1,108,'2024-05-06 20:39:56',NULL,1),(109,'7abd023d-ee7a-38d7-a0ce-862fe9a7dd9d','simple','PD-289341796','Gold quod','Non et esse aut consequatur sunt nisi molestias.','Dolores rem architecto excepturi et. Qui qui dolorem nihil eveniet sint saepe beatae. Repellat laborum nihil dolores et minus est.','et-et-voluptates-voluptas-autem-quia-distinctio',1,1,0,'Sed excepturi repellendus laboriosam omnis unde non impedit.','Similique qui est nobis accusamus aspernatur facilis qui.','Voluptas sed sint sapiente esse quas non voluptas dicta.',351.4400,NULL,NULL,NULL,85.0000,'2024-05-06 19:27:58','en','default',1,109,'2024-05-06 20:39:56',NULL,1),(110,'df89f255-f792-3276-9660-8392437cded7','simple','PD-372886253','Silver aperiam','Omnis exercitationem quia impedit qui.','Ex laboriosam architecto veritatis autem illum cumque modi. Repellendus rem eaque quae voluptatum. Sit est optio ad fugit nobis. Et quam cum omnis similique enim atque quis.','numquam-veritatis-culpa-blanditiis-consequatur-animi-a',1,1,0,'Velit possimus id autem quia ut consequuntur officia.','Accusantium ut id sed cupiditate.','Vel et perferendis qui est ratione animi.',22.6000,NULL,NULL,NULL,32.0000,'2024-05-06 19:27:58','en','default',1,110,'2024-05-06 20:39:55',NULL,1),(111,'c5c5d45d-9a9d-3234-90b7-9a9d567123a2','simple','PD-943059916','Gold similique','<p>Vel nihil nihil architecto eos placeat accusantium nam.</p>','<p>Fuga expedita architecto dicta expedita vitae. Et dicta rerum officiis ratione incidunt quo et. Quos quis eveniet facilis iure totam nisi reiciendis.</p>','enim-enim-minima-quod-temporibus-fuga-nihil-eum',1,1,1,'Incidunt et eveniet debitis eum consequatur.','Doloremque ab ut fuga accusamus optio possimus.','Quod ipsum corrupti animi animi eligendi.',351.0700,NULL,NULL,NULL,9.0000,'2024-05-06 19:27:58','en','default',1,111,'2024-05-06 20:39:43',NULL,1),(112,'d46577d2-0f77-31b5-b6b4-3fd8aa5ca514','simple','PD-286590392','Gold at','<p>Aut placeat in animi adipisci.</p>','<p>Molestiae debitis in magni nam non. Consequatur qui enim deleniti rerum temporibus sint. Dolor omnis repellat blanditiis qui qui commodi. Necessitatibus sint vel iste voluptatibus repellat.</p>','corporis-quidem-voluptates-aliquid',1,1,1,'Et debitis eum consequatur eius earum qui.','Quia doloribus atque vel.','Veritatis voluptatibus fugit ut quisquam.',747.8300,NULL,NULL,NULL,4.0000,'2024-05-06 19:27:58','en','default',1,112,'2024-05-06 20:39:28',NULL,1),(113,'04ed09f2-2b29-3831-85af-d83eec8896f7','simple','PD-464427607','Silver accusantium','<p>Sit dolorum voluptas ipsam eius.</p>','<p>Unde excepturi sint ea iusto et. Possimus autem laboriosam voluptatibus sit dignissimos. Aut sed consequatur in sit voluptatem.</p>','magni-doloremque-placeat-debitis-labore',1,1,1,'Officia consequuntur ipsum dolorem vero.','Perferendis error omnis itaque ex quod.','Rerum cupiditate quis quia.',235.2500,NULL,NULL,NULL,1.0000,'2024-05-06 19:27:58','en','default',1,113,'2024-05-06 20:39:20',NULL,1),(114,'d3026f08-6164-3875-b083-11a4ac98be5c','simple','PD-529402983','Silver qui','<p>Et molestiae praesentium eum quam rerum magni.</p>','<p>Veritatis rem sit dolor voluptates nobis. Deleniti delectus eveniet perferendis quasi amet voluptates.</p>','rem-consequatur-eveniet-iusto-tenetur-molestiae',1,1,1,'Maxime corporis saepe quaerat quos.','Iure quaerat voluptate quo hic aliquam nobis.','Et fugiat officiis quia voluptatem saepe.',878.7400,NULL,NULL,NULL,4.0000,'2024-05-06 19:27:58','en','default',1,114,'2024-05-06 20:39:11',NULL,1),(115,'74961379-4ce3-35c9-b3ab-69bf7b9636bb','simple','PD-900065619','Silver fugit','<p>Autem et aut qui ut et quae et.</p>','<p>Veniam ad veniam fugiat nam quia. Voluptate consequuntur nisi aliquam vero. Sequi consequuntur dolorem placeat ut minima sint.</p>','atque-dolor-non-unde-adipisci-rerum-qui',1,1,1,'Necessitatibus quo quos ullam dolor.','Repellendus ad consequatur nihil.','Excepturi iure doloremque ut molestias laboriosam perferendis est.',876.7500,NULL,NULL,NULL,64.0000,'2024-05-06 19:27:58','en','default',1,115,'2024-05-06 20:39:02',NULL,1),(116,'df714ed0-136f-3db8-9977-4af2fe106d77','simple','PD-810195036','Gold ea','<p>At aut nihil saepe sapiente sit nesciunt excepturi.</p>','<p>Nihil occaecati eos voluptas sit a qui dolorem. Aut qui culpa ex debitis in magni. Ad sit tempora quasi aut est.</p>','quam-amet-molestiae-ut-alias-nam-aspernatur-unde',1,1,1,'Quas dignissimos dolor culpa expedita adipisci consequuntur.','Perferendis et sed dolores.','Esse eum molestias voluptatem commodi aliquam et.',466.3600,NULL,NULL,NULL,46.0000,'2024-05-06 19:27:58','en','default',1,116,'2024-05-06 20:38:41',NULL,1),(117,'adf62e24-880b-3dcd-b969-047872ca7da9','simple','PD-955994551','Platinum omnis','<p>Neque repellat sit aut fugiat.</p>','<p>Dolores voluptatem fugit hic rerum quia dicta. Rerum et autem quasi voluptas. Quidem unde et quidem nobis modi non. Quia impedit culpa veritatis cupiditate perspiciatis magni eos.</p>','et-deleniti-voluptas-accusantium',1,1,1,'Blanditiis hic voluptatibus natus.','Sequi numquam in veniam debitis facilis natus qui.','Aliquid deleniti aut quasi ut.',852.8700,NULL,NULL,NULL,97.0000,'2024-05-06 19:27:58','en','default',1,117,'2024-05-06 20:38:50',NULL,1),(118,'d6b28d50-4f67-3f6c-aa53-144443e6bb60','simple','PD-825235471','Gold rerum','<p>Commodi corporis illo consequatur sit itaque.</p>','<p>Optio voluptatem quis qui quasi. Aliquid laborum beatae ut error praesentium deleniti. Nostrum odit delectus iusto asperiores quasi eos voluptatem placeat. Dolorum illo vero in voluptatem.</p>','tempore-quibusdam-enim-numquam-quae',1,1,1,'Et necessitatibus ipsam rerum.','Suscipit officia molestiae ut omnis dolorum voluptas.','Veritatis nihil velit in dolorem ut in.',264.0900,NULL,NULL,NULL,10.0000,'2024-05-06 19:27:58','en','default',1,118,'2024-05-06 20:38:29',NULL,1),(119,'3c2fde50-7b70-3477-bf41-750b32257c02','simple','PD-879553196','Silver dolorem','<p>Quibusdam et vitae rerum et molestias amet tempore doloribus.</p>','<p>Qui in ut maxime. Enim ex in rerum illum error voluptas consectetur optio. Excepturi id molestiae non dolorum dolor omnis fugit et.</p>','unde-est-officiis-nobis-sunt-iure-ut',1,1,1,'Iste consequatur ex cupiditate nihil et libero officia.','Dolore fuga ut id sed.','Neque tenetur nam exercitationem quia reiciendis.',607.9800,NULL,NULL,NULL,88.0000,'2024-05-06 19:27:58','en','default',1,119,'2024-05-06 20:38:17',NULL,1),(120,'a4c85c8a-60ff-37f4-bd2e-21b1833d110b','simple','PD-389400830','Platinum animi','<p>Dolorem qui dicta aliquid eius beatae.</p>','<p>Omnis tempore est eum voluptatem est. Delectus et reiciendis sequi et et nostrum laudantium. Nihil natus ducimus aspernatur quia neque vel amet. Nisi eum pariatur consequatur qui.</p>','quas-placeat-qui-tempore-molestiae-optio-id',1,1,1,'Hic atque accusantium quo nihil magni atque quisquam.','Laudantium rem et labore unde repellendus aspernatur ducimus.','Ullam recusandae perferendis omnis officia in voluptatum autem.',592.5900,NULL,NULL,NULL,77.0000,'2024-05-06 19:27:58','en','default',1,120,'2024-05-07 18:46:51',NULL,1),(122,'3847293649274234234','simple',NULL,'Produc1','sjfgkfshfgjkhskfd','kfjhsdijfhdjkshfkjdskfjhdsk','Produc1',0,0,1,NULL,NULL,NULL,12.0000,NULL,NULL,NULL,500.0000,'2024-05-07 18:34:46','en','default',1,122,'2024-05-07 18:49:07',NULL,1);
/*!40000 ALTER TABLE `product_flat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_grouped_products`
--

DROP TABLE IF EXISTS `product_grouped_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_grouped_products` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int unsigned NOT NULL,
  `associated_product_id` int unsigned NOT NULL,
  `qty` int NOT NULL DEFAULT '0',
  `sort_order` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_grouped_products_product_id_associated_product_id_unique` (`product_id`,`associated_product_id`),
  KEY `product_grouped_products_associated_product_id_foreign` (`associated_product_id`),
  CONSTRAINT `product_grouped_products_associated_product_id_foreign` FOREIGN KEY (`associated_product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_grouped_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_grouped_products`
--

LOCK TABLES `product_grouped_products` WRITE;
/*!40000 ALTER TABLE `product_grouped_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_grouped_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_images`
--

DROP TABLE IF EXISTS `product_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_images` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int unsigned NOT NULL,
  `position` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `product_images_product_id_foreign` (`product_id`),
  CONSTRAINT `product_images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_images`
--

LOCK TABLES `product_images` WRITE;
/*!40000 ALTER TABLE `product_images` DISABLE KEYS */;
INSERT INTO `product_images` VALUES (1,'images','product/120/4LJrRXlcq7O8SK03yIqwaJKYcBY5JPPIlJIn46po.webp',120,1),(2,'images','product/119/6aJ37qhqbOgJUI3WLkxlxbg8BwPL7eQjqUemy0k2.webp',119,1),(3,'images','product/118/FK3aWr5EfJT4s7g5Ch5sxWI4VGaCZ5tgWUz7kRv3.webp',118,1),(4,'images','product/116/N4ndnC9oyb4aThPzr3X8bBCUtmIJUclxlWmIVufg.webp',116,1),(5,'images','product/117/4yj66dxRyOmSF350BKjyErKl3K5yeL7aSuMllICM.webp',117,1),(6,'images','product/115/QNFH701gt3RDcISY1m2W0GVsQcX7QDM6hyQz0s7F.webp',115,1),(7,'images','product/114/k2t65X2H33aPmizeOYzM1P2FBLGV6BHilMWpT1TB.webp',114,1),(8,'images','product/113/rkC13wfT8S501KP6qRftkZVqPkyc2DU0ubJOMiDw.webp',113,1),(9,'images','product/112/3wFko3jwRDBMX9lGgbnTN8LGWH9lr5VPo1hdhW2N.webp',112,1),(10,'images','product/111/1V3KMZVSDMG0sJfP9J0q234Tr4hG8O9CKcVfwZ5v.webp',111,1);
/*!40000 ALTER TABLE `product_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_inventories`
--

DROP TABLE IF EXISTS `product_inventories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_inventories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `qty` int NOT NULL DEFAULT '0',
  `product_id` int unsigned NOT NULL,
  `vendor_id` int NOT NULL DEFAULT '0',
  `inventory_source_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_source_vendor_index_unique` (`product_id`,`inventory_source_id`,`vendor_id`),
  KEY `product_inventories_inventory_source_id_foreign` (`inventory_source_id`),
  CONSTRAINT `product_inventories_inventory_source_id_foreign` FOREIGN KEY (`inventory_source_id`) REFERENCES `inventory_sources` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_inventories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_inventories`
--

LOCK TABLES `product_inventories` WRITE;
/*!40000 ALTER TABLE `product_inventories` DISABLE KEYS */;
INSERT INTO `product_inventories` VALUES (101,181,101,0,1),(102,124,102,0,1),(103,119,103,0,1),(104,186,104,0,1),(105,109,105,0,1),(106,151,106,0,1),(107,193,107,0,1),(108,195,108,0,1),(109,146,109,0,1),(110,136,110,0,1),(111,144,111,0,1),(112,150,112,0,1),(113,109,113,0,1),(114,163,114,0,1),(115,156,115,0,1),(116,172,116,0,1),(117,183,117,0,1),(118,136,118,0,1),(119,143,119,0,1),(120,155,120,0,1),(121,100,122,0,1);
/*!40000 ALTER TABLE `product_inventories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_inventory_indices`
--

DROP TABLE IF EXISTS `product_inventory_indices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_inventory_indices` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `qty` int NOT NULL DEFAULT '0',
  `product_id` int unsigned NOT NULL,
  `channel_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_inventory_indices_product_id_channel_id_unique` (`product_id`,`channel_id`),
  KEY `product_inventory_indices_channel_id_foreign` (`channel_id`),
  CONSTRAINT `product_inventory_indices_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_inventory_indices_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_inventory_indices`
--

LOCK TABLES `product_inventory_indices` WRITE;
/*!40000 ALTER TABLE `product_inventory_indices` DISABLE KEYS */;
INSERT INTO `product_inventory_indices` VALUES (101,181,101,1,NULL,NULL),(102,124,102,1,NULL,NULL),(103,119,103,1,NULL,NULL),(104,186,104,1,NULL,NULL),(105,109,105,1,NULL,NULL),(106,151,106,1,NULL,NULL),(107,193,107,1,NULL,NULL),(108,195,108,1,NULL,NULL),(109,146,109,1,NULL,NULL),(110,136,110,1,NULL,NULL),(111,144,111,1,NULL,NULL),(112,150,112,1,NULL,NULL),(113,109,113,1,NULL,NULL),(114,163,114,1,NULL,NULL),(115,156,115,1,NULL,NULL),(116,172,116,1,NULL,NULL),(117,183,117,1,NULL,NULL),(118,136,118,1,NULL,NULL),(119,143,119,1,NULL,NULL),(120,155,120,1,NULL,NULL),(121,100,122,1,NULL,NULL);
/*!40000 ALTER TABLE `product_inventory_indices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_ordered_inventories`
--

DROP TABLE IF EXISTS `product_ordered_inventories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_ordered_inventories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `qty` int NOT NULL DEFAULT '0',
  `product_id` int unsigned NOT NULL,
  `channel_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_ordered_inventories_product_id_channel_id_unique` (`product_id`,`channel_id`),
  KEY `product_ordered_inventories_channel_id_foreign` (`channel_id`),
  CONSTRAINT `product_ordered_inventories_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_ordered_inventories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_ordered_inventories`
--

LOCK TABLES `product_ordered_inventories` WRITE;
/*!40000 ALTER TABLE `product_ordered_inventories` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_ordered_inventories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_price_indices`
--

DROP TABLE IF EXISTS `product_price_indices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_price_indices` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int unsigned NOT NULL,
  `customer_group_id` int unsigned DEFAULT NULL,
  `channel_id` int unsigned NOT NULL DEFAULT '1',
  `min_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `regular_min_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `max_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `regular_max_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `price_indices_product_id_customer_group_id_channel_id_unique` (`product_id`,`customer_group_id`,`channel_id`),
  KEY `product_price_indices_channel_id_foreign` (`channel_id`),
  KEY `product_price_indices_customer_group_id_foreign` (`customer_group_id`),
  CONSTRAINT `product_price_indices_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_price_indices_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_price_indices_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=364 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_price_indices`
--

LOCK TABLES `product_price_indices` WRITE;
/*!40000 ALTER TABLE `product_price_indices` DISABLE KEYS */;
INSERT INTO `product_price_indices` VALUES (301,101,1,1,439.5800,439.5800,439.5800,439.5800,NULL,NULL),(302,101,2,1,439.5800,439.5800,439.5800,439.5800,NULL,NULL),(303,101,3,1,439.5800,439.5800,439.5800,439.5800,NULL,NULL),(304,102,1,1,646.5000,646.5000,646.5000,646.5000,NULL,NULL),(305,102,2,1,646.5000,646.5000,646.5000,646.5000,NULL,NULL),(306,102,3,1,646.5000,646.5000,646.5000,646.5000,NULL,NULL),(307,103,1,1,917.7700,917.7700,917.7700,917.7700,NULL,NULL),(308,103,2,1,917.7700,917.7700,917.7700,917.7700,NULL,NULL),(309,103,3,1,917.7700,917.7700,917.7700,917.7700,NULL,NULL),(310,104,1,1,462.0000,462.0000,462.0000,462.0000,NULL,NULL),(311,104,2,1,462.0000,462.0000,462.0000,462.0000,NULL,NULL),(312,104,3,1,462.0000,462.0000,462.0000,462.0000,NULL,NULL),(313,105,1,1,406.6500,406.6500,406.6500,406.6500,NULL,NULL),(314,105,2,1,406.6500,406.6500,406.6500,406.6500,NULL,NULL),(315,105,3,1,406.6500,406.6500,406.6500,406.6500,NULL,NULL),(316,106,1,1,916.1200,916.1200,916.1200,916.1200,NULL,NULL),(317,106,2,1,916.1200,916.1200,916.1200,916.1200,NULL,NULL),(318,106,3,1,916.1200,916.1200,916.1200,916.1200,NULL,NULL),(319,107,1,1,122.0500,122.0500,122.0500,122.0500,NULL,NULL),(320,107,2,1,122.0500,122.0500,122.0500,122.0500,NULL,NULL),(321,107,3,1,122.0500,122.0500,122.0500,122.0500,NULL,NULL),(322,108,1,1,436.1000,436.1000,436.1000,436.1000,NULL,NULL),(323,108,2,1,436.1000,436.1000,436.1000,436.1000,NULL,NULL),(324,108,3,1,436.1000,436.1000,436.1000,436.1000,NULL,NULL),(325,109,1,1,351.4400,351.4400,351.4400,351.4400,NULL,NULL),(326,109,2,1,351.4400,351.4400,351.4400,351.4400,NULL,NULL),(327,109,3,1,351.4400,351.4400,351.4400,351.4400,NULL,NULL),(328,110,1,1,22.6000,22.6000,22.6000,22.6000,NULL,NULL),(329,110,2,1,22.6000,22.6000,22.6000,22.6000,NULL,NULL),(330,110,3,1,22.6000,22.6000,22.6000,22.6000,NULL,NULL),(331,111,1,1,351.0700,351.0700,351.0700,351.0700,NULL,NULL),(332,111,2,1,351.0700,351.0700,351.0700,351.0700,NULL,NULL),(333,111,3,1,351.0700,351.0700,351.0700,351.0700,NULL,NULL),(334,112,1,1,747.8300,747.8300,747.8300,747.8300,NULL,NULL),(335,112,2,1,747.8300,747.8300,747.8300,747.8300,NULL,NULL),(336,112,3,1,747.8300,747.8300,747.8300,747.8300,NULL,NULL),(337,113,1,1,235.2500,235.2500,235.2500,235.2500,NULL,NULL),(338,113,2,1,235.2500,235.2500,235.2500,235.2500,NULL,NULL),(339,113,3,1,235.2500,235.2500,235.2500,235.2500,NULL,NULL),(340,114,1,1,878.7400,878.7400,878.7400,878.7400,NULL,NULL),(341,114,2,1,878.7400,878.7400,878.7400,878.7400,NULL,NULL),(342,114,3,1,878.7400,878.7400,878.7400,878.7400,NULL,NULL),(343,115,1,1,876.7500,876.7500,876.7500,876.7500,NULL,NULL),(344,115,2,1,876.7500,876.7500,876.7500,876.7500,NULL,NULL),(345,115,3,1,876.7500,876.7500,876.7500,876.7500,NULL,NULL),(346,116,1,1,466.3600,466.3600,466.3600,466.3600,NULL,NULL),(347,116,2,1,466.3600,466.3600,466.3600,466.3600,NULL,NULL),(348,116,3,1,466.3600,466.3600,466.3600,466.3600,NULL,NULL),(349,117,1,1,852.8700,852.8700,852.8700,852.8700,NULL,NULL),(350,117,2,1,852.8700,852.8700,852.8700,852.8700,NULL,NULL),(351,117,3,1,852.8700,852.8700,852.8700,852.8700,NULL,NULL),(352,118,1,1,264.0900,264.0900,264.0900,264.0900,NULL,NULL),(353,118,2,1,264.0900,264.0900,264.0900,264.0900,NULL,NULL),(354,118,3,1,264.0900,264.0900,264.0900,264.0900,NULL,NULL),(355,119,1,1,607.9800,607.9800,607.9800,607.9800,NULL,NULL),(356,119,2,1,607.9800,607.9800,607.9800,607.9800,NULL,NULL),(357,119,3,1,607.9800,607.9800,607.9800,607.9800,NULL,NULL),(358,120,1,1,592.5900,592.5900,592.5900,592.5900,NULL,NULL),(359,120,2,1,592.5900,592.5900,592.5900,592.5900,NULL,NULL),(360,120,3,1,592.5900,592.5900,592.5900,592.5900,NULL,NULL),(361,122,1,1,12.0000,12.0000,12.0000,12.0000,NULL,NULL),(362,122,2,1,12.0000,12.0000,12.0000,12.0000,NULL,NULL),(363,122,3,1,12.0000,12.0000,12.0000,12.0000,NULL,NULL);
/*!40000 ALTER TABLE `product_price_indices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_relations`
--

DROP TABLE IF EXISTS `product_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_relations` (
  `parent_id` int unsigned NOT NULL,
  `child_id` int unsigned NOT NULL,
  UNIQUE KEY `product_relations_parent_id_child_id_unique` (`parent_id`,`child_id`),
  KEY `product_relations_child_id_foreign` (`child_id`),
  CONSTRAINT `product_relations_child_id_foreign` FOREIGN KEY (`child_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_relations_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_relations`
--

LOCK TABLES `product_relations` WRITE;
/*!40000 ALTER TABLE `product_relations` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_review_attachments`
--

DROP TABLE IF EXISTS `product_review_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_review_attachments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `review_id` int unsigned NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'image',
  `mime_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_review_images_review_id_foreign` (`review_id`),
  CONSTRAINT `product_review_images_review_id_foreign` FOREIGN KEY (`review_id`) REFERENCES `product_reviews` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_review_attachments`
--

LOCK TABLES `product_review_attachments` WRITE;
/*!40000 ALTER TABLE `product_review_attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_review_attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_reviews`
--

DROP TABLE IF EXISTS `product_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_reviews` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rating` int NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int unsigned NOT NULL,
  `customer_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_reviews_product_id_foreign` (`product_id`),
  CONSTRAINT `product_reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_reviews`
--

LOCK TABLES `product_reviews` WRITE;
/*!40000 ALTER TABLE `product_reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_super_attributes`
--

DROP TABLE IF EXISTS `product_super_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_super_attributes` (
  `product_id` int unsigned NOT NULL,
  `attribute_id` int unsigned NOT NULL,
  UNIQUE KEY `product_super_attributes_product_id_attribute_id_unique` (`product_id`,`attribute_id`),
  KEY `product_super_attributes_attribute_id_foreign` (`attribute_id`),
  CONSTRAINT `product_super_attributes_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `product_super_attributes_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_super_attributes`
--

LOCK TABLES `product_super_attributes` WRITE;
/*!40000 ALTER TABLE `product_super_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_super_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_up_sells`
--

DROP TABLE IF EXISTS `product_up_sells`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_up_sells` (
  `parent_id` int unsigned NOT NULL,
  `child_id` int unsigned NOT NULL,
  UNIQUE KEY `product_up_sells_parent_id_child_id_unique` (`parent_id`,`child_id`),
  KEY `product_up_sells_child_id_foreign` (`child_id`),
  CONSTRAINT `product_up_sells_child_id_foreign` FOREIGN KEY (`child_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_up_sells_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_up_sells`
--

LOCK TABLES `product_up_sells` WRITE;
/*!40000 ALTER TABLE `product_up_sells` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_up_sells` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_videos`
--

DROP TABLE IF EXISTS `product_videos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_videos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int unsigned NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `product_videos_product_id_foreign` (`product_id`),
  CONSTRAINT `product_videos_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_videos`
--

LOCK TABLES `product_videos` WRITE;
/*!40000 ALTER TABLE `product_videos` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_videos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int unsigned DEFAULT NULL,
  `attribute_family_id` int unsigned DEFAULT NULL,
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_sku_unique` (`sku`),
  KEY `products_attribute_family_id_foreign` (`attribute_family_id`),
  KEY `products_parent_id_foreign` (`parent_id`),
  CONSTRAINT `products_attribute_family_id_foreign` FOREIGN KEY (`attribute_family_id`) REFERENCES `attribute_families` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `products_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (101,'f485335d-ce8b-3ba1-9191-30fd2454cceb','simple',NULL,1,NULL,'2024-05-06 13:57:58','2024-05-06 13:57:58'),(102,'e3a872f9-e538-33ee-83ab-81d2ff44d7f1','simple',NULL,1,NULL,'2024-05-06 13:57:58','2024-05-06 13:57:58'),(103,'36d77023-5e34-3403-a9a4-04b417318dd0','simple',NULL,1,NULL,'2024-05-06 13:57:58','2024-05-06 13:57:58'),(104,'ee141721-b5d8-37cb-9483-67e3b64da72f','simple',NULL,1,NULL,'2024-05-06 13:57:58','2024-05-06 13:57:58'),(105,'b257b213-e022-3000-9df5-dd1c9e13554b','simple',NULL,1,NULL,'2024-05-06 13:57:58','2024-05-06 13:57:58'),(106,'8725cbcc-b0d6-363f-970c-1ab1001a2601','simple',NULL,1,NULL,'2024-05-06 13:57:58','2024-05-06 13:57:58'),(107,'74f071bc-18ad-3c53-9b78-c3828cf9370c','simple',NULL,1,NULL,'2024-05-06 13:57:58','2024-05-06 13:57:58'),(108,'17ca6e3a-668c-32da-acb9-49b7e65585cf','simple',NULL,1,NULL,'2024-05-06 13:57:58','2024-05-06 13:57:58'),(109,'7abd023d-ee7a-38d7-a0ce-862fe9a7dd9d','simple',NULL,1,NULL,'2024-05-06 13:57:58','2024-05-06 13:57:58'),(110,'df89f255-f792-3276-9660-8392437cded7','simple',NULL,1,NULL,'2024-05-06 13:57:58','2024-05-06 13:57:58'),(111,'c5c5d45d-9a9d-3234-90b7-9a9d567123a2','simple',NULL,1,NULL,'2024-05-06 13:57:58','2024-05-06 13:57:58'),(112,'d46577d2-0f77-31b5-b6b4-3fd8aa5ca514','simple',NULL,1,NULL,'2024-05-06 13:57:58','2024-05-06 13:57:58'),(113,'04ed09f2-2b29-3831-85af-d83eec8896f7','simple',NULL,1,NULL,'2024-05-06 13:57:58','2024-05-06 13:57:58'),(114,'d3026f08-6164-3875-b083-11a4ac98be5c','simple',NULL,1,NULL,'2024-05-06 13:57:58','2024-05-06 13:57:58'),(115,'74961379-4ce3-35c9-b3ab-69bf7b9636bb','simple',NULL,1,NULL,'2024-05-06 13:57:58','2024-05-06 13:57:58'),(116,'df714ed0-136f-3db8-9977-4af2fe106d77','simple',NULL,1,NULL,'2024-05-06 13:57:58','2024-05-06 13:57:58'),(117,'adf62e24-880b-3dcd-b969-047872ca7da9','simple',NULL,1,NULL,'2024-05-06 13:57:58','2024-05-06 13:57:58'),(118,'d6b28d50-4f67-3f6c-aa53-144443e6bb60','simple',NULL,1,NULL,'2024-05-06 13:57:58','2024-05-06 13:57:58'),(119,'3c2fde50-7b70-3477-bf41-750b32257c02','simple',NULL,1,NULL,'2024-05-06 13:57:58','2024-05-06 13:57:58'),(120,'a4c85c8a-60ff-37f4-bd2e-21b1833d110b','simple',NULL,1,NULL,'2024-05-06 13:57:58','2024-05-06 13:57:58'),(122,'3847293649274234234','simple',NULL,1,NULL,'2024-05-07 13:04:46','2024-05-07 13:04:46');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refund_items`
--

DROP TABLE IF EXISTS `refund_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `refund_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `discount_percent` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `product_id` int unsigned DEFAULT NULL,
  `product_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_item_id` int unsigned DEFAULT NULL,
  `refund_id` int unsigned DEFAULT NULL,
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `refund_items_parent_id_foreign` (`parent_id`),
  KEY `refund_items_order_item_id_foreign` (`order_item_id`),
  KEY `refund_items_refund_id_foreign` (`refund_id`),
  CONSTRAINT `refund_items_order_item_id_foreign` FOREIGN KEY (`order_item_id`) REFERENCES `order_items` (`id`) ON DELETE CASCADE,
  CONSTRAINT `refund_items_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `refund_items` (`id`) ON DELETE CASCADE,
  CONSTRAINT `refund_items_refund_id_foreign` FOREIGN KEY (`refund_id`) REFERENCES `refunds` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refund_items`
--

LOCK TABLES `refund_items` WRITE;
/*!40000 ALTER TABLE `refund_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `refund_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refunds`
--

DROP TABLE IF EXISTS `refunds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `refunds` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `increment_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_sent` tinyint(1) NOT NULL DEFAULT '0',
  `total_qty` int DEFAULT NULL,
  `base_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adjustment_refund` decimal(12,4) DEFAULT '0.0000',
  `base_adjustment_refund` decimal(12,4) DEFAULT '0.0000',
  `adjustment_fee` decimal(12,4) DEFAULT '0.0000',
  `base_adjustment_fee` decimal(12,4) DEFAULT '0.0000',
  `sub_total` decimal(12,4) DEFAULT '0.0000',
  `base_sub_total` decimal(12,4) DEFAULT '0.0000',
  `grand_total` decimal(12,4) DEFAULT '0.0000',
  `base_grand_total` decimal(12,4) DEFAULT '0.0000',
  `shipping_amount` decimal(12,4) DEFAULT '0.0000',
  `base_shipping_amount` decimal(12,4) DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `discount_percent` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `order_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `refunds_order_id_foreign` (`order_id`),
  CONSTRAINT `refunds_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refunds`
--

LOCK TABLES `refunds` WRITE;
/*!40000 ALTER TABLE `refunds` DISABLE KEYS */;
/*!40000 ALTER TABLE `refunds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permission_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Administrator','This role users will have all the access','all',NULL,NULL,NULL);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `search_synonyms`
--

DROP TABLE IF EXISTS `search_synonyms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `search_synonyms` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `terms` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search_synonyms`
--

LOCK TABLES `search_synonyms` WRITE;
/*!40000 ALTER TABLE `search_synonyms` DISABLE KEYS */;
/*!40000 ALTER TABLE `search_synonyms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `search_terms`
--

DROP TABLE IF EXISTS `search_terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `search_terms` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `term` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `results` int NOT NULL DEFAULT '0',
  `uses` int NOT NULL DEFAULT '0',
  `redirect_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `display_in_suggested_terms` tinyint(1) NOT NULL DEFAULT '0',
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `channel_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `search_terms_channel_id_foreign` (`channel_id`),
  CONSTRAINT `search_terms_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search_terms`
--

LOCK TABLES `search_terms` WRITE;
/*!40000 ALTER TABLE `search_terms` DISABLE KEYS */;
/*!40000 ALTER TABLE `search_terms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipment_items`
--

DROP TABLE IF EXISTS `shipment_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shipment_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `weight` int DEFAULT NULL,
  `price` decimal(12,4) DEFAULT '0.0000',
  `base_price` decimal(12,4) DEFAULT '0.0000',
  `total` decimal(12,4) DEFAULT '0.0000',
  `base_total` decimal(12,4) DEFAULT '0.0000',
  `product_id` int unsigned DEFAULT NULL,
  `product_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_item_id` int unsigned DEFAULT NULL,
  `shipment_id` int unsigned NOT NULL,
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shipment_items_shipment_id_foreign` (`shipment_id`),
  CONSTRAINT `shipment_items_shipment_id_foreign` FOREIGN KEY (`shipment_id`) REFERENCES `shipments` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipment_items`
--

LOCK TABLES `shipment_items` WRITE;
/*!40000 ALTER TABLE `shipment_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `shipment_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipments`
--

DROP TABLE IF EXISTS `shipments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shipments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_qty` int DEFAULT NULL,
  `total_weight` int DEFAULT NULL,
  `carrier_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `carrier_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `track_number` text COLLATE utf8mb4_unicode_ci,
  `email_sent` tinyint(1) NOT NULL DEFAULT '0',
  `customer_id` int unsigned DEFAULT NULL,
  `customer_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` int unsigned NOT NULL,
  `order_address_id` int unsigned DEFAULT NULL,
  `inventory_source_id` int unsigned DEFAULT NULL,
  `inventory_source_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shipments_order_id_foreign` (`order_id`),
  KEY `shipments_inventory_source_id_foreign` (`inventory_source_id`),
  CONSTRAINT `shipments_inventory_source_id_foreign` FOREIGN KEY (`inventory_source_id`) REFERENCES `inventory_sources` (`id`) ON DELETE SET NULL,
  CONSTRAINT `shipments_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipments`
--

LOCK TABLES `shipments` WRITE;
/*!40000 ALTER TABLE `shipments` DISABLE KEYS */;
/*!40000 ALTER TABLE `shipments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sitemaps`
--

DROP TABLE IF EXISTS `sitemaps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sitemaps` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `generated_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sitemaps`
--

LOCK TABLES `sitemaps` WRITE;
/*!40000 ALTER TABLE `sitemaps` DISABLE KEYS */;
/*!40000 ALTER TABLE `sitemaps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscribers_list`
--

DROP TABLE IF EXISTS `subscribers_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscribers_list` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_subscribed` tinyint(1) NOT NULL DEFAULT '0',
  `token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` int unsigned DEFAULT NULL,
  `channel_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subscribers_list_customer_id_foreign` (`customer_id`),
  KEY `subscribers_list_channel_id_foreign` (`channel_id`),
  CONSTRAINT `subscribers_list_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `subscribers_list_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscribers_list`
--

LOCK TABLES `subscribers_list` WRITE;
/*!40000 ALTER TABLE `subscribers_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscribers_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax_categories`
--

DROP TABLE IF EXISTS `tax_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tax_categories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tax_categories_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax_categories`
--

LOCK TABLES `tax_categories` WRITE;
/*!40000 ALTER TABLE `tax_categories` DISABLE KEYS */;
INSERT INTO `tax_categories` VALUES (1,'GST','GST','GST','2024-05-06 08:01:16','2024-05-06 08:01:16');
/*!40000 ALTER TABLE `tax_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax_categories_tax_rates`
--

DROP TABLE IF EXISTS `tax_categories_tax_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tax_categories_tax_rates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `tax_category_id` int unsigned NOT NULL,
  `tax_rate_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tax_map_index_unique` (`tax_category_id`,`tax_rate_id`),
  KEY `tax_categories_tax_rates_tax_rate_id_foreign` (`tax_rate_id`),
  CONSTRAINT `tax_categories_tax_rates_tax_category_id_foreign` FOREIGN KEY (`tax_category_id`) REFERENCES `tax_categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tax_categories_tax_rates_tax_rate_id_foreign` FOREIGN KEY (`tax_rate_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax_categories_tax_rates`
--

LOCK TABLES `tax_categories_tax_rates` WRITE;
/*!40000 ALTER TABLE `tax_categories_tax_rates` DISABLE KEYS */;
INSERT INTO `tax_categories_tax_rates` VALUES (1,1,1,NULL,NULL),(2,1,2,NULL,NULL);
/*!40000 ALTER TABLE `tax_categories_tax_rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax_rates`
--

DROP TABLE IF EXISTS `tax_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tax_rates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_zip` tinyint(1) NOT NULL DEFAULT '0',
  `zip_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_from` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_to` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tax_rate` decimal(12,4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tax_rates_identifier_unique` (`identifier`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax_rates`
--

LOCK TABLES `tax_rates` WRITE;
/*!40000 ALTER TABLE `tax_rates` DISABLE KEYS */;
INSERT INTO `tax_rates` VALUES (1,'CGST',1,NULL,'000001','999999','MP','IN',7.5000,'2024-05-06 08:00:46','2024-05-06 08:00:46'),(2,'SGST',1,NULL,'000001','999999','MP','IN',7.5000,'2024-05-06 08:01:03','2024-05-06 08:01:03');
/*!40000 ALTER TABLE `tax_rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `theme_customization_translations`
--

DROP TABLE IF EXISTS `theme_customization_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `theme_customization_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `theme_customization_id` int unsigned NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` json NOT NULL,
  PRIMARY KEY (`id`),
  KEY `theme_customization_translations_theme_customization_id_foreign` (`theme_customization_id`),
  CONSTRAINT `theme_customization_translations_theme_customization_id_foreign` FOREIGN KEY (`theme_customization_id`) REFERENCES `theme_customizations` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theme_customization_translations`
--

LOCK TABLES `theme_customization_translations` WRITE;
/*!40000 ALTER TABLE `theme_customization_translations` DISABLE KEYS */;
INSERT INTO `theme_customization_translations` VALUES (1,1,'en','{\"images\": [{\"link\": \"\", \"image\": \"storage/theme/1/XrX0w1NYgVf4LGozkAkbMPWMVLMmbz56COCJQSc0.webp\", \"title\": \"Get Ready For New Collection\"}, {\"link\": \"\", \"image\": \"storage/theme/1/6djeg88iqLD7u7gl62phIGd4IES7lbXeGZcgoXdW.webp\", \"title\": \"Get Ready For New Collection\"}, {\"link\": \"\", \"image\": \"storage/theme/1/L3ou2rnh0Y30qV6xmDoUvSBvTAldxa8YQB08CCEH.webp\", \"title\": \"Get Ready For New Collection\"}, {\"link\": \"\", \"image\": \"storage/theme/1/IAVGQ6NnGE2oAlagjM2AaCFrDndSh5JlKIhnfaEd.webp\", \"title\": \"Get Ready For New Collection\"}]}'),(2,2,'en','{\"css\": \".home-offer h1 {display: block;font-weight: 500;text-align: center;font-size: 22px;font-family: DM Serif Display;background-color: #E8EDFE;padding-top: 20px;padding-bottom: 20px;}@media (max-width:768px){.home-offer h1 {font-size:18px;}@media (max-width:525px) {.home-offer h1 {font-size:14px;}}\", \"html\": \"<div class=\\\"home-offer\\\"><h1>Get UPTO 40% OFF on your 1st order SHOP NOW</h1></div>\"}'),(3,3,'en','{\"filters\": {\"sort\": \"asc\", \"limit\": 10, \"parent_id\": 1}}'),(4,4,'en','{\"title\": \"New Products\", \"filters\": {\"new\": 1, \"sort\": \"asc\", \"limit\": 10}}'),(5,5,'en','{\"css\": \".top-collection-container {overflow: hidden;}.top-collection-header {padding-left: 15px;padding-right: 15px;text-align: center;font-size: 70px;line-height: 90px;color: #060C3B;margin-top: 80px;}.top-collection-header h2 {max-width: 595px;margin-left: auto;margin-right: auto;font-family: DM Serif Display;}.top-collection-grid {display: flex;flex-wrap: wrap;gap: 32px;justify-content: center;margin-top: 60px;width: 100%;margin-right: auto;margin-left: auto;padding-right: 90px;padding-left: 90px;}.top-collection-card {position: relative;background: #f9fafb;overflow:hidden;border-radius:20px;}.top-collection-card img {border-radius: 16px;max-width: 100%;text-indent:-9999px;}.top-collection-card:hover img {transform: scale(1.05);transition: all 300ms ease;}.top-collection-card h3 {color: #060C3B;font-size: 30px;font-family: DM Serif Display;transform: translateX(-50%);width: max-content;left: 50%;bottom: 30px;position: absolute;margin: 0;font-weight: inherit;}@media not all and (min-width: 525px) {.top-collection-header {margin-top: 30px;}.top-collection-header {font-size: 32px;line-height: 1.5;}.top-collection-grid {gap: 15px;}}@media not all and (min-width: 1024px) {.top-collection-grid {padding-left: 30px;padding-right: 30px;}}@media (max-width: 640px) {.top-collection-grid {margin-top: 20px;}}\", \"html\": \"<div class=\\\"top-collection-container\\\"><div class=\\\"top-collection-header\\\"><h2>The game with our new additions!</h2></div><div class=\\\"container top-collection-grid\\\"><div class=\\\"top-collection-card\\\"><img src=\\\"\\\" data-src=\\\"storage/theme/5/QV6Klqu61cwvG7k7ycFcKucWRiBd9kMXRfagMxmK.webp\\\" class=\\\"lazy\\\" width=\\\"396\\\" height=\\\"396\\\" alt=\\\"The game with our new additions!\\\"><h3>Our Collections</h3></div><div class=\\\"top-collection-card\\\"><img src=\\\"\\\" data-src=\\\"storage/theme/5/g5WkYSIJEh4oCtoybolZY5vLEO1qfc80bnRXLGt2.webp\\\" class=\\\"lazy\\\" width=\\\"396\\\" height=\\\"396\\\" alt=\\\"The game with our new additions!\\\"><h3>Our Collections</h3></div><div class=\\\"top-collection-card\\\"><img src=\\\"\\\" data-src=\\\"storage/theme/5/acQImgAo12HwvsfCGus1x50FAivqB4RbpR2l2IXc.webp\\\" class=\\\"lazy\\\" width=\\\"396\\\" height=\\\"396\\\" alt=\\\"The game with our new additions!\\\"><h3>Our Collections</h3></div><div class=\\\"top-collection-card\\\"><img src=\\\"\\\" data-src=\\\"storage/theme/5/RZNIbMXGziDUNke4S8yXIytESjFAF11h8WMtSW3M.webp\\\" class=\\\"lazy\\\" width=\\\"396\\\" height=\\\"396\\\" alt=\\\"The game with our new additions!\\\"><h3>Our Collections</h3></div><div class=\\\"top-collection-card\\\"><img src=\\\"\\\" data-src=\\\"storage/theme/5/0aRrgG8U7GBOCIEHaQlxLtheCC9R15FL8RhvHxtg.webp\\\" class=\\\"lazy\\\" width=\\\"396\\\" height=\\\"396\\\" alt=\\\"The game with our new additions!\\\"><h3>Our Collections</h3></div><div class=\\\"top-collection-card\\\"><img src=\\\"\\\" data-src=\\\"storage/theme/5/hBu6NnEJa7QZ227w1irYewM6pYf9vCmBu7tlF9eX.webp\\\" class=\\\"lazy\\\" width=\\\"396\\\" height=\\\"396\\\" alt=\\\"The game with our new additions!\\\"><h3>Our Collections</h3></div></div></div>\"}'),(6,6,'en','{\"css\": \".section-gap{margin-top:80px}.direction-ltr{direction:ltr}.direction-rtl{direction:rtl}.inline-col-wrapper{display:grid;grid-template-columns:auto 1fr;grid-gap:60px;align-items:center}.inline-col-wrapper .inline-col-image-wrapper{overflow:hidden}.inline-col-wrapper .inline-col-image-wrapper img{max-width:100%;height:auto;border-radius:16px;text-indent:-9999px}.inline-col-wrapper .inline-col-content-wrapper{display:flex;flex-wrap:wrap;gap:20px;max-width:464px}.inline-col-wrapper .inline-col-content-wrapper .inline-col-title{max-width:442px;font-size:60px;font-weight:400;color:#060c3b;line-height:70px;font-family:DM Serif Display;margin:0}.inline-col-wrapper .inline-col-content-wrapper .inline-col-description{margin:0;font-size:18px;color:#6e6e6e;font-family:Poppins}@media (max-width:991px){.inline-col-wrapper{grid-template-columns:1fr;grid-gap:16px}.inline-col-wrapper .inline-col-content-wrapper{gap:10px}}@media (max-width:525px){.inline-col-wrapper .inline-col-content-wrapper .inline-col-title{font-size:30px;line-height:normal}}\", \"html\": \"<div class=\\\"container section-gap\\\"> <div class=\\\"inline-col-wrapper\\\"> <div class=\\\"inline-col-image-wrapper\\\"> <img src=\\\"\\\" data-src=\\\"storage/theme/6/rax3lR7qd6XiAiHo8Cha3CAJi5ntjVlsvNIItJJe.webp\\\" class=\\\"lazy\\\" width=\\\"632\\\" height=\\\"510\\\" alt=\\\"Get Ready for our new Bold Collections!\\\"> </div> <div class=\\\"inline-col-content-wrapper\\\"> <h2 class=\\\"inline-col-title\\\"> Get Ready for our new Bold Collections! </h2> <p class=\\\"inline-col-description\\\">Introducing Our New Bold Collections! Elevate your style with daring designs and vibrant statements. Explore striking patterns and bold colors that redefine your wardrobe. Get ready to embrace the extraordinary!</p> <button class=\\\"primary-button\\\">View All</button> </div> </div> </div>\"}'),(7,7,'en','{\"title\": \"Featured Products\", \"filters\": {\"sort\": \"desc\", \"limit\": 10, \"featured\": 1}}'),(8,8,'en','{\"css\": \".section-game {overflow: hidden;}.section-title,.section-title h2{font-weight:400;font-family:DM Serif Display}.section-title{margin-top:80px;padding-left:15px;padding-right:15px;text-align:center;line-height:90px}.section-title h2{font-size:70px;color:#060c3b;max-width:595px;margin:auto}.collection-card-wrapper{display:flex;flex-wrap:wrap;justify-content:center;gap:30px}.collection-card-wrapper .single-collection-card{position:relative}.collection-card-wrapper .single-collection-card img{border-radius:16px;background-color:#f5f5f5;max-width:100%;height:auto;text-indent:-9999px}.collection-card-wrapper .single-collection-card .overlay-text{font-size:50px;font-weight:400;max-width:234px;font-style:italic;color:#060c3b;font-family:DM Serif Display;position:absolute;bottom:30px;left:30px;margin:0}@media (max-width:1024px){.section-title{padding:0 30px}}@media (max-width:991px){.collection-card-wrapper{flex-wrap:wrap}}@media (max-width:525px){.collection-card-wrapper .single-collection-card .overlay-text{font-size:30px}.container{padding:0 30px;margin-top:20px}.section-title{margin-top:30px}.section-title h2{font-size:30px;line-height:normal}}\", \"html\": \"<div class=\\\"section-game\\\"><div class=\\\"section-title\\\"> <h2>The game with our new additions!</h2> </div> <div class=\\\"container section-gap\\\"> <div class=\\\"collection-card-wrapper\\\"> <div class=\\\"single-collection-card\\\"> <img src=\\\"\\\" data-src=\\\"storage/theme/8/L6dtCZNCBL0VTSmhp9goZkfRpFWycU3C91kiS8wk.webp\\\" class=\\\"lazy\\\" width=\\\"615\\\" height=\\\"600\\\" alt=\\\"The game with our new additions!\\\"> <h3 class=\\\"overlay-text\\\">Our Collections</h3> </div> <div class=\\\"single-collection-card\\\"> <img src=\\\"\\\" data-src=\\\"storage/theme/8/vecTYUuirPD4AxxPuo4LxyybPyV2YAJ2NSGegtPN.webp\\\" class=\\\"lazy\\\" width=\\\"615\\\" height=\\\"600\\\" alt=\\\"The game with our new additions!\\\"> <h3 class=\\\"overlay-text\\\"> Our Collections </h3> </div> </div> </div> </div>\"}'),(9,9,'en','{\"title\": \"All Products\", \"filters\": {\"sort\": \"desc\", \"limit\": 10}}'),(10,10,'en','{\"css\": \".section-gap{margin-top:80px}.direction-ltr{direction:ltr}.direction-rtl{direction:rtl}.inline-col-wrapper{display:grid;grid-template-columns:auto 1fr;grid-gap:60px;align-items:center}.inline-col-wrapper .inline-col-image-wrapper{overflow:hidden}.inline-col-wrapper .inline-col-image-wrapper img{max-width:100%;height:auto;border-radius:16px;text-indent:-9999px}.inline-col-wrapper .inline-col-content-wrapper{display:flex;flex-wrap:wrap;gap:20px;max-width:464px}.inline-col-wrapper .inline-col-content-wrapper .inline-col-title{max-width:442px;font-size:60px;font-weight:400;color:#060c3b;line-height:70px;font-family:DM Serif Display;margin:0}.inline-col-wrapper .inline-col-content-wrapper .inline-col-description{margin:0;font-size:18px;color:#6e6e6e;font-family:Poppins}@media (max-width:991px){.inline-col-wrapper{grid-template-columns:1fr;grid-gap:16px}.inline-col-wrapper .inline-col-content-wrapper{gap:10px}}@media (max-width:525px){.inline-col-wrapper .inline-col-content-wrapper .inline-col-title{font-size:30px;line-height:normal}}\", \"html\": \"<div class=\\\"container section-gap\\\"> <div class=\\\"inline-col-wrapper direction-rtl\\\"> <div class=\\\"inline-col-image-wrapper \\\"> <img src=\\\"\\\" data-src=\\\"storage/theme/10/bdqwa1ieJMXAISZxSKpBZwUbD73wKSzruvFN2Ha7.webp\\\" class=\\\"lazy\\\" width=\\\"632\\\" height=\\\"510\\\" alt=\\\"Get Ready for our new Bold Collections!\\\"> </div> <div class=\\\"inline-col-content-wrapper direction-ltr\\\"> <h2 class=\\\"inline-col-title\\\"> Get Ready for our new Bold Collections! </h2> <p class=\\\"inline-col-description\\\">Introducing Our New Bold Collections! Elevate your style with daring designs and vibrant statements. Explore striking patterns and bold colors that redefine your wardrobe. Get ready to embrace the extraordinary!</p> <button class=\\\"primary-button\\\">View All</button> </div> </div> </div>\"}'),(11,11,'en','{\"column_1\": [{\"url\": \"http://localhost:8000/page/about-us\", \"title\": \"About Us\", \"sort_order\": 1}, {\"url\": \"http://localhost:8000/page/contact-us\", \"title\": \"Contact Us\", \"sort_order\": 2}, {\"url\": \"http://localhost:8000/page/customer-service\", \"title\": \"Customer Service\", \"sort_order\": 3}, {\"url\": \"http://localhost:8000/page/whats-new\", \"title\": \"What\'s New\", \"sort_order\": 4}, {\"url\": \"http://localhost:8000/page/terms-of-use\", \"title\": \"Terms of Use\", \"sort_order\": 5}, {\"url\": \"http://localhost:8000/page/terms-conditions\", \"title\": \"Terms & Conditions\", \"sort_order\": 6}], \"column_2\": [{\"url\": \"http://localhost:8000/page/privacy-policy\", \"title\": \"Privacy Policy\", \"sort_order\": 1}, {\"url\": \"http://localhost:8000/page/payment-policy\", \"title\": \"Payment Policy\", \"sort_order\": 2}, {\"url\": \"http://localhost:8000/page/shipping-policy\", \"title\": \"Shipping Policy\", \"sort_order\": 3}, {\"url\": \"http://localhost:8000/page/refund-policy\", \"title\": \"Refund Policy\", \"sort_order\": 4}, {\"url\": \"http://localhost:8000/page/return-policy\", \"title\": \"Return Policy\", \"sort_order\": 5}]}'),(12,12,'en','{\"services\": [{\"title\": \"Free Shipping\", \"description\": \"Enjoy free shipping on all orders\", \"service_icon\": \"icon-truck\"}, {\"title\": \"Product Replace\", \"description\": \"Easy Product Replacement Available!\", \"service_icon\": \"icon-product\"}, {\"title\": \"Emi Available\", \"description\": \"No cost EMI available on all major credit cards\", \"service_icon\": \"icon-dollar-sign\"}, {\"title\": \"24/7 Support\", \"description\": \"Dedicated 24/7 support via chat and email\", \"service_icon\": \"icon-support\"}]}');
/*!40000 ALTER TABLE `theme_customization_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `theme_customizations`
--

DROP TABLE IF EXISTS `theme_customizations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `theme_customizations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort_order` int NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `channel_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `theme_customizations_channel_id_foreign` (`channel_id`),
  CONSTRAINT `theme_customizations_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theme_customizations`
--

LOCK TABLES `theme_customizations` WRITE;
/*!40000 ALTER TABLE `theme_customizations` DISABLE KEYS */;
INSERT INTO `theme_customizations` VALUES (1,'image_carousel','Image Carousel',1,1,1,'2024-05-06 07:57:04','2024-05-06 07:57:04'),(2,'static_content','Offer Information',2,1,1,'2024-05-06 07:57:04','2024-05-06 07:57:04'),(3,'category_carousel','Categories Collections',3,1,1,'2024-05-06 07:57:04','2024-05-06 07:57:04'),(4,'product_carousel','New Products',4,1,1,'2024-05-06 07:57:04','2024-05-06 07:57:04'),(5,'static_content','Top Collections',5,1,1,'2024-05-06 07:57:04','2024-05-06 07:57:04'),(6,'static_content','Bold Collections',6,1,1,'2024-05-06 07:57:04','2024-05-06 07:57:04'),(7,'product_carousel','Featured Collections',7,1,1,'2024-05-06 07:57:04','2024-05-06 07:57:04'),(8,'static_content','Game Container',8,1,1,'2024-05-06 07:57:04','2024-05-06 07:57:04'),(9,'product_carousel','All Products',9,1,1,'2024-05-06 07:57:04','2024-05-06 07:57:04'),(10,'static_content','Bold Collections',10,1,1,'2024-05-06 07:57:04','2024-05-06 07:57:04'),(11,'footer_links','Footer Links',11,1,1,'2024-05-06 07:57:04','2024-05-06 07:57:04'),(12,'services_content','Services Content',12,1,1,'2024-05-06 07:57:04','2024-05-06 07:57:04');
/*!40000 ALTER TABLE `theme_customizations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_rewrites`
--

DROP TABLE IF EXISTS `url_rewrites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `url_rewrites` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entity_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `request_path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target_path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_rewrites`
--

LOCK TABLES `url_rewrites` WRITE;
/*!40000 ALTER TABLE `url_rewrites` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_rewrites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visits`
--

DROP TABLE IF EXISTS `visits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `visits` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `request` mediumtext COLLATE utf8mb4_unicode_ci,
  `url` mediumtext COLLATE utf8mb4_unicode_ci,
  `referer` mediumtext COLLATE utf8mb4_unicode_ci,
  `languages` text COLLATE utf8mb4_unicode_ci,
  `useragent` text COLLATE utf8mb4_unicode_ci,
  `headers` text COLLATE utf8mb4_unicode_ci,
  `device` text COLLATE utf8mb4_unicode_ci,
  `platform` text COLLATE utf8mb4_unicode_ci,
  `browser` text COLLATE utf8mb4_unicode_ci,
  `ip` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visitable_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visitable_id` bigint unsigned DEFAULT NULL,
  `visitor_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visitor_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `visits_visitable_type_visitable_id_index` (`visitable_type`,`visitable_id`),
  KEY `visits_visitor_type_visitor_id_index` (`visitor_type`,`visitor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=170 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visits`
--

LOCK TABLES `visits` WRITE;
/*!40000 ALTER TABLE `visits` DISABLE KEYS */;
INSERT INTO `visits` VALUES (1,'GET','[]','http://localhost:8000','http://localhost:8000/admin/catalog/products/edit/1','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/localhost:8000\\/admin\\/catalog\\/products\\/edit\\/1\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6ImJ5TTNxWkhuek5oRWo4UE9ZTHhnUnc9PSIsInZhbHVlIjoiWWJvYlAyekYxRHFIbC9DUzV1T1U4eStmWVVRa3VmU0FkMDNSOHBSOG1hOEY4ZGVFNGM3ZWk4KytBVW1YcVFTdGx6YjRUdUZOaXNlNk5QMStqbXdOaXIrMFd5M1ZDT3hRR3FWbTlxVHM2NjUzWmZ3NCswdHpUNW15TGZ0RCtqTGEiLCJtYWMiOiJlMDFjYzA4YTdmNDAxODJkYzI1OTNlN2U0MTNmYmY4MmY0ZmYwY2U4Mjc5MjVlNThmOGNhNTRlYzliMTQ5YjRiIiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6ImdUNVpuRGhGLzh5Mkxhb1p6U2xQM2c9PSIsInZhbHVlIjoidFNWN2JZc2ZTZE9xK283RGFNTHFKY1ZTYklFSVRkcmgyUENjbDZRUGhQNXhYTWt5eFZTd1FSeEVUMEtnZWV5RllQR0xpTEszYUdRdFJIV050VHM4azRKVU1aSkc1N1Jmb3FTUUIyZ3VNRjYxcmc1WTRpQVhrY2lMTEtBZU5OSVgiLCJtYWMiOiJkMjVkYzMyOGU4NWZiZjM5ZDMwYzE0ODI5MmQ3ZDBlMWU4ZjZiZmNmMDNhM2I3MzEzYTZiMDZjNmEzZmVkMDlmIiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,NULL,NULL,'2024-05-06 08:07:55','2024-05-06 08:07:55'),(2,'GET','[]','http://localhost:8000/storage/locales/xpXiUaFu5GzEe5W9tzBw6JHk4z3EXOfdwcWVX3hG.png','http://localhost:8000/','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6Im1ERkdTZFJlalJCaVlNcHUrYWVCSHc9PSIsInZhbHVlIjoiOXBXUDVycW1DbS9lSHZBVmM5TjJoc2FmbVdkYW44TDlCSFlQem92S0dJT1Y0NWNnWG1qalBDMU5OOFY4MEJGMERLa1hCaDYrNXRSdDNhVGowMmFlRkQ4cCtaTWJvMXIvU0RxM0VjU09mTkprL09FUEVYL3pmT21JYkNMZkZQRE0iLCJtYWMiOiI3MDdjODk2ZTlhZGMzYzMxOTYwNzMzNGVkYzlkMTZjNjEzNGZjY2ZlNGQ4YTllNmJkY2RiMDc0MjJkMzE1YzgyIiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6IndDRnA5NmVQbUE2ZCtXZzBhOHRNYnc9PSIsInZhbHVlIjoiTFpRR2I0NFBrcG9CNXZlUkdVTXhJWWJodmhTdDl2TTZQUWFtNkVMUXJxTk1kVkhTTjR2aXYxbmpRYXRxUTlXSU1iMEkvVStnZkttemNwWGluTUdvME1kL0ZKdnlkU3hPNE52WlV0Q0VFQldjRlpKdVVxM2VKU2w1c0s1blJQeVkiLCJtYWMiOiJlYTA5Y2MzOGNmMDY4ZjhlN2U2NGYxOTlkMzQzNTQ2YTgyNGNkYzE2MDkyYzVmYWNhMmViMzA1NjY3M2M5NjM4IiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,NULL,NULL,'2024-05-06 08:07:55','2024-05-06 08:07:55'),(3,'GET','[]','http://localhost:8000/storage/locales/xpXiUaFu5GzEe5W9tzBw6JHk4z3EXOfdwcWVX3hG.png','http://localhost:8000/','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6ImdFQ2RXNkpxOENBUlhSQkgyaTJEQnc9PSIsInZhbHVlIjoiYTJuYnBFSUo5c1o2c1owSFJwcDhkVVQwcVJwVE9oMmUycmZ3bnBoblpzUmdKVFdHTWh3N2UvcEpLcDJMejZWeitNaE9oby9hRGFLNFluUkQyd0VQS0p2cDhDbFA4TjVqcDNGWHV6dHlyVEFSMEJMcTE4YVQxYWloc2NaWUVIZVIiLCJtYWMiOiJjNjAyZDgxNmYwZTUwMzZiYTA5Mjk0MTAwMTRiZjhlYjViMTYwOGVhYjM0NTMxMzExOGM5OTlhMzVmODNiNDAxIiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6IncyQjVPTExuZHpKNWtUdXBseHJnU2c9PSIsInZhbHVlIjoiMzlLd2MwdmNwbXlTQzZTZjlhR2l5dXl5ZFA2c3RocG1kMisxcjNYbHZERmJ3VHZVblM2cXlETTl0dkxjdlBNdHkxdzFOdE9lSGhUMjdSWjJwODBJWmZZVE1VOVJDNG9OeXh0NFJVSzFmdTd2M1F1Mm5FWHFBS09VcjZnQWFCenkiLCJtYWMiOiIyOWFlMDZmMTJlYjQ4Yzk5MzIwODYyN2YzYTI3NWVlNTMxMzZmMzBjMmQ0ZGFmNGMxN2E0MWZlYWRlOGM2ZjU5IiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,NULL,NULL,'2024-05-06 08:07:55','2024-05-06 08:07:55'),(4,'GET','[]','http://localhost:8000/storage/locales/YuFazk3QsiQb7LqQGB9qpUAb9YTCaW9Cf2TnE2Kq.png','http://localhost:8000/','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6Ik9TQ1JlcERENENhTXVRSHY2REo1SUE9PSIsInZhbHVlIjoiSlgrR200Q1VlQlRnWUdVV0ZPamprNHBqZ3BzV1NXV05OSWJWWWhvTWRpbllhOGV0VGdsby9VUGQxU09BaFN6Skh0ZHp6K1pTamRBa3BLQ1VTZFhDa0xRM3pyMnhoZDBUM2NqSzdTSkozeThuMFNiMTUwVmJCOU9oUm5Gdk5aYS8iLCJtYWMiOiI2ZjZkMGI5YTk2NjllNjlhNzEyOTlhMWY2NzZiZDcxZDJlYzFhNGMzYjNiNjcyZmM5OWQ5ZjQ1NDYxYTdkZmUzIiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6IlZtMnA0VDhyeE94bXR5SG9wbDluS0E9PSIsInZhbHVlIjoiNnFKUEJuYzhZaEh3ZnNsMjlTOStORmRRVUU5RlB0VStBUDdXVDUzODFCSGFLQWVRMDNwSitqR3AwbHp4OE1lTDBLWGZEaEQrUnM0SHg0VGdjYjE5azZvaDdUSU1rOUI2bit5d3d3eDRDbzB4N1c2MDJtUTBkVWxmaGowb1JTRXAiLCJtYWMiOiI5OTYyNjg1N2QwMzk5ODQ2OTgxOTI1Y2ZlMWFiNWQ4YWRlODg2MzAxMTE3NTI4YmRmZDhlNzcyMWZiZWJlZjJjIiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,NULL,NULL,'2024-05-06 08:07:56','2024-05-06 08:07:56'),(5,'GET','[]','http://localhost:8000/storage/theme/1/XrX0w1NYgVf4LGozkAkbMPWMVLMmbz56COCJQSc0.webp','http://localhost:8000/','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6Ik9TQ1JlcERENENhTXVRSHY2REo1SUE9PSIsInZhbHVlIjoiSlgrR200Q1VlQlRnWUdVV0ZPamprNHBqZ3BzV1NXV05OSWJWWWhvTWRpbllhOGV0VGdsby9VUGQxU09BaFN6Skh0ZHp6K1pTamRBa3BLQ1VTZFhDa0xRM3pyMnhoZDBUM2NqSzdTSkozeThuMFNiMTUwVmJCOU9oUm5Gdk5aYS8iLCJtYWMiOiI2ZjZkMGI5YTk2NjllNjlhNzEyOTlhMWY2NzZiZDcxZDJlYzFhNGMzYjNiNjcyZmM5OWQ5ZjQ1NDYxYTdkZmUzIiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6IlZtMnA0VDhyeE94bXR5SG9wbDluS0E9PSIsInZhbHVlIjoiNnFKUEJuYzhZaEh3ZnNsMjlTOStORmRRVUU5RlB0VStBUDdXVDUzODFCSGFLQWVRMDNwSitqR3AwbHp4OE1lTDBLWGZEaEQrUnM0SHg0VGdjYjE5azZvaDdUSU1rOUI2bit5d3d3eDRDbzB4N1c2MDJtUTBkVWxmaGowb1JTRXAiLCJtYWMiOiI5OTYyNjg1N2QwMzk5ODQ2OTgxOTI1Y2ZlMWFiNWQ4YWRlODg2MzAxMTE3NTI4YmRmZDhlNzcyMWZiZWJlZjJjIiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,NULL,NULL,'2024-05-06 08:07:56','2024-05-06 08:07:56'),(6,'GET','[]','http://localhost:8000/storage/theme/1/6djeg88iqLD7u7gl62phIGd4IES7lbXeGZcgoXdW.webp','http://localhost:8000/','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6Ik9TQ1JlcERENENhTXVRSHY2REo1SUE9PSIsInZhbHVlIjoiSlgrR200Q1VlQlRnWUdVV0ZPamprNHBqZ3BzV1NXV05OSWJWWWhvTWRpbllhOGV0VGdsby9VUGQxU09BaFN6Skh0ZHp6K1pTamRBa3BLQ1VTZFhDa0xRM3pyMnhoZDBUM2NqSzdTSkozeThuMFNiMTUwVmJCOU9oUm5Gdk5aYS8iLCJtYWMiOiI2ZjZkMGI5YTk2NjllNjlhNzEyOTlhMWY2NzZiZDcxZDJlYzFhNGMzYjNiNjcyZmM5OWQ5ZjQ1NDYxYTdkZmUzIiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6IlZtMnA0VDhyeE94bXR5SG9wbDluS0E9PSIsInZhbHVlIjoiNnFKUEJuYzhZaEh3ZnNsMjlTOStORmRRVUU5RlB0VStBUDdXVDUzODFCSGFLQWVRMDNwSitqR3AwbHp4OE1lTDBLWGZEaEQrUnM0SHg0VGdjYjE5azZvaDdUSU1rOUI2bit5d3d3eDRDbzB4N1c2MDJtUTBkVWxmaGowb1JTRXAiLCJtYWMiOiI5OTYyNjg1N2QwMzk5ODQ2OTgxOTI1Y2ZlMWFiNWQ4YWRlODg2MzAxMTE3NTI4YmRmZDhlNzcyMWZiZWJlZjJjIiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,NULL,NULL,'2024-05-06 08:07:56','2024-05-06 08:07:56'),(7,'GET','[]','http://localhost:8000/storage/theme/1/L3ou2rnh0Y30qV6xmDoUvSBvTAldxa8YQB08CCEH.webp','http://localhost:8000/','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6Ik9TQ1JlcERENENhTXVRSHY2REo1SUE9PSIsInZhbHVlIjoiSlgrR200Q1VlQlRnWUdVV0ZPamprNHBqZ3BzV1NXV05OSWJWWWhvTWRpbllhOGV0VGdsby9VUGQxU09BaFN6Skh0ZHp6K1pTamRBa3BLQ1VTZFhDa0xRM3pyMnhoZDBUM2NqSzdTSkozeThuMFNiMTUwVmJCOU9oUm5Gdk5aYS8iLCJtYWMiOiI2ZjZkMGI5YTk2NjllNjlhNzEyOTlhMWY2NzZiZDcxZDJlYzFhNGMzYjNiNjcyZmM5OWQ5ZjQ1NDYxYTdkZmUzIiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6IlZtMnA0VDhyeE94bXR5SG9wbDluS0E9PSIsInZhbHVlIjoiNnFKUEJuYzhZaEh3ZnNsMjlTOStORmRRVUU5RlB0VStBUDdXVDUzODFCSGFLQWVRMDNwSitqR3AwbHp4OE1lTDBLWGZEaEQrUnM0SHg0VGdjYjE5azZvaDdUSU1rOUI2bit5d3d3eDRDbzB4N1c2MDJtUTBkVWxmaGowb1JTRXAiLCJtYWMiOiI5OTYyNjg1N2QwMzk5ODQ2OTgxOTI1Y2ZlMWFiNWQ4YWRlODg2MzAxMTE3NTI4YmRmZDhlNzcyMWZiZWJlZjJjIiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,NULL,NULL,'2024-05-06 08:07:56','2024-05-06 08:07:56'),(8,'GET','[]','http://localhost:8000/storage/theme/1/IAVGQ6NnGE2oAlagjM2AaCFrDndSh5JlKIhnfaEd.webp','http://localhost:8000/','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6ImdqRHFTeE1LZ2gxNTl2bThxL0x4MUE9PSIsInZhbHVlIjoiTGRUb3lKOFJLckQzdkgxcjVzZzFZaUtzNnBKQXRUcjRZalF4MUFybFRodVQvb1kzOFZ5TlJ2ZjIwTDNNTklPY3dCd2dNTGp1dFVidE8vWmRiaWQrTm85VHF0QVJ6R3QxSjRtYmRWV2pHMWUvR292amRCMlNHRmt1SWxnYzFIaWgiLCJtYWMiOiIyNzI2MTdkNzM3Nzc5YjAxYTFjMzVhMmJmNjg2NWIwNjYwOWQzMmFjYjlkZWE5OWI0NTc3MDQzMzY0ZmRlMmQxIiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6IlNFNXNDVGl3U3c4Qlg1VmdoUWxCaXc9PSIsInZhbHVlIjoiVmxtcWkya0orczZ5SkdRNHFPYi9YV2ZLT09KejVqSVNENlQzTm56WCtNdTArWWNUaXpFaEd0WXlzSWxvbUd0T1ZCSVduVzl0UjcyQjE1TVNSeWZuUlJsOE02M0xEcmpoSGhsaUVhSnpZaUJGZklXR2VvbzlDSkZ0dStIa3Evbm8iLCJtYWMiOiJhOGU0NTU2NWE1OTllNzU2YmM3ZDZmN2JmZmMwMDQyM2Q4ZDZkNGEyMDM4Yzk4MGI3MjJjNzNiOWI2YzAwYjJiIiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,NULL,NULL,'2024-05-06 08:07:56','2024-05-06 08:07:56'),(9,'GET','[]','http://localhost:8000/quaerat-voluptas-earum-non-est-possimus-vel','http://localhost:8000/','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/localhost:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6InF3dGZ4b0FEY3dwbkVOU2R4b0JHN3c9PSIsInZhbHVlIjoiMk4wSjV3VE5oUVVOemIrdExwUkozZ001eE5UMm1mS2doVU5OMjNXU2Q4ak9Ya1BLUjB1Mk5YRjhsWlJVVmZ6MitvOUI3NlloN1A5TUZ5eVNvSzVJS29URGkzem1DaDdoMUdMMzU0MlBVN3VHK25YUDBvdVA1eDEvbHVEeks0TEsiLCJtYWMiOiJlNjIwNzhlYWEyYzg1MjEyOWFkMDQ3Nzg4NjdlMDM2OTA1NmUxYjY3OGIxMjA3NGY5OTdhNmJkMzBhNjVmOGQ1IiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6Im1vSXVGZGxoc2wvRTlDd2d1ZDVZVkE9PSIsInZhbHVlIjoicWR5Mm5oM3MrTUx6aXhSVi9UZXNOMlRvbVdBaEdENTJmcHhoUXZoR29BMHUzVGRxdTVOS1FVY2pvUXBWdFplb01LZGQ4WWh6a1d2aHdTdkRxZStqWFk4SHB6M2FRSW01cnNWVEMxZTdDdWMwQmtlQ0tCTEl3UVJWd2Z0R0xBSDIiLCJtYWMiOiI1NGViNmM3NmNiYmVlOWQzOWZiZTMwNTkzMWZlNzdmMTQ5ZGU3MzZlOTU2NjE5YjcwNmE3OTFiNGQxMTA2YWUxIiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1','Webkul\\Product\\Models\\Product',86,NULL,NULL,'2024-05-06 08:07:59','2024-05-06 08:07:59'),(10,'GET','[]','http://localhost:8000/storage/locales/YuFazk3QsiQb7LqQGB9qpUAb9YTCaW9Cf2TnE2Kq.png','http://localhost:8000/quaerat-voluptas-earum-non-est-possimus-vel','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/quaerat-voluptas-earum-non-est-possimus-vel\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6ImxtakJpaHlMNXZGeVJuQm9NRndCaEE9PSIsInZhbHVlIjoicnpVRXFaY3g4L2ZvNWs2QUx4eld3bitad3JseGpUL2R0L1Q5RlRhZnJBTlVaTUpHZlorOThLRW10bXlDRUxZdksxK2tibkNSMlhZdkE2MW82UndydnZzdE1MVEFkVDNhbXBWRXFJVHRDbEZKMmNQdytTdEZLNEFWY2M5ZkU0WjciLCJtYWMiOiIxOGFkMmNjZTEwMjlmM2ZjM2FhYzQzMWI4OWZiNzk2MDcyMDBkOGI0ODMwYmFmOWMyMDlhYWZhMWU1MjRkN2EwIiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6ImhUZVRmMTRYL3FSZVZ2b3BwYStiUUE9PSIsInZhbHVlIjoiNlYwVTFENTEyaDVpMXduZzlvcXdQU2ZyRWQ0WXRYYU4rRlJCUWM1S0RLcS96eEhQMjVwNWJQZWZ4dlRkdGFNazE2TjhNU0ZtbkZUa0grVDhvZXJFK2JWYzc2WFRvQmpJL3pQQVpSUFl2UC84THdORkJEcVZRZTZzRkdTVTIvYzciLCJtYWMiOiJhZjk4Y2Y3YjllNjhhZDI5MzEyZTliYTRkZDE5MWRhNmNhN2U3YTY4MWZjY2M3YjlmYTZiY2JhMjA5MDE3YjQyIiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,NULL,NULL,'2024-05-06 08:07:59','2024-05-06 08:07:59'),(11,'GET','[]','http://localhost:8000/storage/locales/YuFazk3QsiQb7LqQGB9qpUAb9YTCaW9Cf2TnE2Kq.png','http://localhost:8000/quaerat-voluptas-earum-non-est-possimus-vel','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/quaerat-voluptas-earum-non-est-possimus-vel\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6IklDUlQzWG9mb0NkSDJLdnlzNnFiWmc9PSIsInZhbHVlIjoiMnVTWW9RK1BZSGpFODhLYzUrWFpOVzJVMkNjOWduU0JpMi93elExQm5va3dnb0VGVU11eTVtNXQweHRmZTl1SmdySnlIM3hnZmtwZ2pvNWIvdnJla3FUYmNvdlhlTjFlRGxBVmVmN2RMd2trem9VOGdKYndjY0sySkRhTXNEYysiLCJtYWMiOiI5YWNmOWZlODJmNjc2N2FiZDI4Yzk1NjFmZTA2NGUxYTZjMmEwNDNkN2IxOTEyY2IwZTFkMTEwZmI2YmFkYTBmIiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6Iit0c2owYXZxWU85dHRTbkI3dUo4UXc9PSIsInZhbHVlIjoiemJVb0dKZHB1bHh0dFAxSkRzUUcvQUNHS1ZyRE1IWkJlcmZLT3pqdnRleU1QMUd2Y3UvVFpsUkpkR3FOYWRUOUtQcUFRRlI0K3l0UWQ3akIvemRxbnk5VVFnRnBJaHNqaXlOUmZuU1padUUrL2UraEkvS1hOalBHZ0pzMGsvSVUiLCJtYWMiOiJiYTQ4M2E1NTg2MjUzNTMwY2ViNjQzZTljYjZiNjZmOGMxZDg3ZDcyMDVkYWRkOTY4MGYzNTcxMGM0NDQ4NTNmIiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,NULL,NULL,'2024-05-06 08:07:59','2024-05-06 08:07:59'),(12,'GET','[]','http://localhost:8000/storage/locales/YuFazk3QsiQb7LqQGB9qpUAb9YTCaW9Cf2TnE2Kq.png','http://localhost:8000/quaerat-voluptas-earum-non-est-possimus-vel','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/quaerat-voluptas-earum-non-est-possimus-vel\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6IjI0N0FEVGJadDRmL3BkN0pHeEptTHc9PSIsInZhbHVlIjoiTFFvQnZyWXZncW1MSDUzNmZBTyt5djU5ZG9kNFJsREh5YmxpWFdHYktMenRncml2M1lGUG91QStaRmt6QkloSk95SDhzYXM4NDJpa1RXVyttdGhwRmNPNHJjZ29UTVpYK0ZhMENYcXJ2dEt2WklSTlRQOHg2Q0lkZmhqandCY2EiLCJtYWMiOiI2ZmVjODk0YTI4ZTk0NmQ3N2FmNDhmYWVmYzAzZGYwZmY3OTU5NzdlY2UzYmViNmEwMjI2N2VkMTg0YmQ4OThlIiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6Ijk5U0p4NUhPNTZJc0hoRkpoajNzaVE9PSIsInZhbHVlIjoiTTV1U1Jnb0ZBTzAxUEhibDl6UHpraFErRnJvRlZWbmpWK0dDZEN6RTlxMHQ1RzE5T3pHQlZUZ0RZNUhLQnYyZStTbzlNMERneUM4aUFXaTFuUTZsLzQ1bWM5T1FjZ201NS9ybmd4aStHeHFxa3lVMm5EM3VBV0tFSlNHRjBaQkEiLCJtYWMiOiJkZDA1OTUwMGMyYTRiN2Q3NWRiNzRkYjdjNTNjOWRkZDAzZDZkNDNmMGVlMjhhZDVlZGMzNTgyNDAwM2JiYzQzIiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,NULL,NULL,'2024-05-06 08:08:05','2024-05-06 08:08:05'),(13,'GET','[]','http://localhost:8000/storage/locales/YuFazk3QsiQb7LqQGB9qpUAb9YTCaW9Cf2TnE2Kq.png','http://localhost:8000/quaerat-voluptas-earum-non-est-possimus-vel','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/quaerat-voluptas-earum-non-est-possimus-vel\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6InJLcEhjM1RSa0RVZEo2SmlWYzYvSFE9PSIsInZhbHVlIjoiemswS1lMZHQ2bWNkSHFIWUtKUVBpcVhZbGl2emd0akJLOFVrUkdudmQ3Q2J4OHdDQWFtNmYxZWNLZ1NiY0t1KzZZNDhsT1VPRDZMcGpPY01CVW41KzBmdENETFlFeGJVN3ZOMWRLRzZHbnlFcXRzQjRkVlVMQmxBY2FuS0tjYzUiLCJtYWMiOiJjZGY3ZTk0ZWFmNzcxMjRjMWEwMTM3ZjU0ZGE4Y2RiNmE5NGY4OGRlNWQ0NDgxMDRkZTI3ZWM2YTQ1N2JhOTA1IiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6InNIQzdpNDh2MG9oQXQ4dG9zczBBK3c9PSIsInZhbHVlIjoiL1YvVVJPL1JBL0k1MVgyR3VkVW9wanc3UTRpR3JkQXdNMjBxa09IWXJ4b2oxRlBZaDZ4MXhxcHk3WXkwSnl0QU0xdzNTL1k0dXNCYzZSWUY0ZXlSdEhib2c4ejF0SWQ0Q0M1T2c2MlM3TnNhcHJ4SytLWlJkc2ZMZHdXNXkwVXMiLCJtYWMiOiI1YjlhYmYyNWE5ZGVjNDkwMDM5NDkxMTgxMDUyNzI5NzEyZjY2YjI2NzZkNTZjOGVmNzBkYTUyNWQ5NDc2MWQ2IiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,NULL,NULL,'2024-05-06 08:08:05','2024-05-06 08:08:05'),(14,'GET','[]','http://localhost:8000','http://localhost:8000/checkout/cart','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/localhost:8000\\/checkout\\/cart\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6IkFMRGxJd2ZZbkpVRGVzTnpZeGc3bGc9PSIsInZhbHVlIjoiN01mUFpoM1J1Y0N5eUZZd2Z5ZXpEU0FNZG9EMXpjTE84QnFZL2ZaRmQ4UWFMUVpIQ1AycWNKaytiY09SRHk5L1loU3p6UnBOcnRIWXBJcHYreXRzRnVHSXVkNC94cjdaL3BHRnR6MGpQeUZOcE1KL3JITDQ3VnFrRytIdUxXQTAiLCJtYWMiOiJlZjYxNTUzYzY5MDQ1N2RhZWE2YTRhMzIzZmNmNDU2YzY5MjZjYmU2MmJmOWM2ZmUwZjdjNTY3OWU3Y2U2OTMzIiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6IlVXd2xmd1Nxa3VGZm1vaWFOZTNlR0E9PSIsInZhbHVlIjoiYVpxcDBmODA4b3luMXR6cHNhb2pRYzVjd0M1MUwwWW1XTmJ6VTllTHljcjZLL09FT1lNbmM3UGVEUGYzOHVRNzMrbHFLOWdxTGR0NGZ4UWhObU9LN21wSHBwZ3BQVXpnOU1QVGxUNFlvSnlsUzNLb0dzYUduSWNHVzIxODZCWmMiLCJtYWMiOiIwNWZiMWEyM2YyZmY1MTc4MjI1YTRkODVlZTkxYWE0YjViODM0ZDgxMzVhNmUyMTY2NGM3NThlZDkwNDJjYjRkIiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,NULL,NULL,'2024-05-06 08:08:13','2024-05-06 08:08:13'),(15,'GET','[]','http://localhost:8000/storage/locales/xpXiUaFu5GzEe5W9tzBw6JHk4z3EXOfdwcWVX3hG.png','http://localhost:8000/','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6ImJZVzVKMUN6ZDB2SmtmTW0wMkFtUHc9PSIsInZhbHVlIjoieGluMDhneVVnbjE5bFA4a3VmZGZITGpMMnZneDlaYnFJT0hFcDZGNXRJQW80RE1RaFRGaHlJWmxQYW1sd3lrc1UxMXB2Tm5aWk1SVWtEMGZ3NUN0MXpLaHplWTRaMnA5YUtjR2tkcGp3bDFUdGRpQUJES0VpclVYQ0ViWWp3TlAiLCJtYWMiOiJkNDFjNmE4NDczM2FkYjhhZmIzNTQyNGYyOTdjYzY1NWIzMDQzZTUwNmM5MTE5YWFjNTE5NzM2OTdjMGE5M2E3IiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6IjhMTDgwdC9EOEQ5VVBxUVBON3prV1E9PSIsInZhbHVlIjoiaEpVVTViVXJ4Sm5MY21TdG12VHRrSy9vTmFiNXYzWFJCK0YzdURoTDVNRW5QczZQMllWNVZSaDB5YzJYbWVycUhML1J5aEZwSHFLaVdrQ3RnZXQwNE1pbytMQjJ3TzYwSll3NmhOUWlrKzJTOEhsbWJGZ0VaUUsvT1dWcDlKYUciLCJtYWMiOiJlNmYyMDgwNTNmNGIyNmFhYmFmY2JjYTIxNTI0OTNlZjQ4ZGQ3MjNhYmZiM2M2ZjI3NjNhMDE2YWY5MzUzN2I5IiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,NULL,NULL,'2024-05-06 08:08:13','2024-05-06 08:08:13'),(16,'GET','[]','http://localhost:8000/storage/locales/xpXiUaFu5GzEe5W9tzBw6JHk4z3EXOfdwcWVX3hG.png','http://localhost:8000/','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6IjB2Y1MrUW9JRUdKWS9qVEVwK2VtUlE9PSIsInZhbHVlIjoiRjlBM05iN3daWitUM0h3UU5OMENoOGV1TjBqaC9yRGtNRHF3UGdYT0dkKzRWV211ZlpQemlkZk9rNzArUko0Sk1SenBvNnNxZncxN2NWRmJFdjdJNHl2N3RFVUR3TUlyVC9MWVY2b3IwbnRkTEM5Y0xMS1hmM2Yyb1o4cXM2aEciLCJtYWMiOiJjOTJlMmYzOTQ0NmMxMGE3NzhmZGRjZWUzMWRkZTMxNzBkOWY2ODZiM2U3YWM2MWNmYzlmYTJkZjNkZjNmMjdkIiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6IjY1dXpTMitSeTlnYlArRWF5emhvZ2c9PSIsInZhbHVlIjoiaFV6TG00cFZoKzExZVZLSFBDRGRESElaUmF2TU5lTzFya2JOOTlGeUZzcFJYL2l6WS9ObzIwTlZiTUVSd21LNjQ0M1Z1YmhRL1hnbzB1TU5WSFZuMFo2RlM3QkhxdzJQdm9XdWtNeU91MUdWdVFFdWRtUkZnNmd4bnpGMXdqUzIiLCJtYWMiOiIzYWI0MjU4ZTM1MDI1NjM0M2Q1MTQ0MzBhZjNlMmU5MGU5Mjg1ODRmM2RiYjVlMzkxOTEwMjM4YWEwNzQ4NmUwIiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,NULL,NULL,'2024-05-06 08:08:14','2024-05-06 08:08:14'),(17,'GET','[]','http://localhost:8000/storage/locales/YuFazk3QsiQb7LqQGB9qpUAb9YTCaW9Cf2TnE2Kq.png','http://localhost:8000/','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6InVwWDlhemxOWWRFSTNJUUxCUFlJSnc9PSIsInZhbHVlIjoibFpQTTlOTm81UjRCUDlVZXlhWEo4ZGppYjhFVWxGT1p3WkY1RjRKRnorMlRkei83QnNEalp6YVl6a2NDdzlscFA2U1BMMitFUnUvWGVYY2Z4NVVlc1pESktMQXNuTzhDSnVlaHFncmlBQVlRNGNLbmdVS0ozYm9VYTZ2RGhjUDYiLCJtYWMiOiI2YTcxZmE2NWE2N2U5ZTg2ZDU3ZjFmMjI5NGE4MDRhNmNhNTNkNTYwNDg4OWFjMjQ5NGYwZmM5MDBmMzk3Mjc3IiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6Ims1MG1HN095VXVrdnlVd3NHclRVNkE9PSIsInZhbHVlIjoiTExKUG5CZW9uM1ovdlJzTDUzYTZ3MXYvdER1OTQxeTNxcWFKclc0eTNoTHhUVGJRUy9UU3BpN3grWVB1WEZJNitja0w4UHBiaGxoWWM3aGpZOWhxd3FzR1F2Sy9ZVllOTVZIZC9GbFd4Qjh2SFhCRlFmQzc2QzlqSGtpRU1uMWUiLCJtYWMiOiI2NTUyZGFiN2Y0YjRkMjU1OWE1YWRjZDk2ZWQyNzA2OWM2NzNkZDVmYmY1MTc0MzVlZGVmZWQyODNlYjFiZDhlIiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,NULL,NULL,'2024-05-06 08:08:14','2024-05-06 08:08:14'),(18,'GET','[]','http://localhost:8000/storage/theme/1/XrX0w1NYgVf4LGozkAkbMPWMVLMmbz56COCJQSc0.webp','http://localhost:8000/','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6InVwWDlhemxOWWRFSTNJUUxCUFlJSnc9PSIsInZhbHVlIjoibFpQTTlOTm81UjRCUDlVZXlhWEo4ZGppYjhFVWxGT1p3WkY1RjRKRnorMlRkei83QnNEalp6YVl6a2NDdzlscFA2U1BMMitFUnUvWGVYY2Z4NVVlc1pESktMQXNuTzhDSnVlaHFncmlBQVlRNGNLbmdVS0ozYm9VYTZ2RGhjUDYiLCJtYWMiOiI2YTcxZmE2NWE2N2U5ZTg2ZDU3ZjFmMjI5NGE4MDRhNmNhNTNkNTYwNDg4OWFjMjQ5NGYwZmM5MDBmMzk3Mjc3IiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6Ims1MG1HN095VXVrdnlVd3NHclRVNkE9PSIsInZhbHVlIjoiTExKUG5CZW9uM1ovdlJzTDUzYTZ3MXYvdER1OTQxeTNxcWFKclc0eTNoTHhUVGJRUy9UU3BpN3grWVB1WEZJNitja0w4UHBiaGxoWWM3aGpZOWhxd3FzR1F2Sy9ZVllOTVZIZC9GbFd4Qjh2SFhCRlFmQzc2QzlqSGtpRU1uMWUiLCJtYWMiOiI2NTUyZGFiN2Y0YjRkMjU1OWE1YWRjZDk2ZWQyNzA2OWM2NzNkZDVmYmY1MTc0MzVlZGVmZWQyODNlYjFiZDhlIiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,NULL,NULL,'2024-05-06 08:08:14','2024-05-06 08:08:14'),(19,'GET','[]','http://localhost:8000/storage/theme/1/6djeg88iqLD7u7gl62phIGd4IES7lbXeGZcgoXdW.webp','http://localhost:8000/','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6InVwWDlhemxOWWRFSTNJUUxCUFlJSnc9PSIsInZhbHVlIjoibFpQTTlOTm81UjRCUDlVZXlhWEo4ZGppYjhFVWxGT1p3WkY1RjRKRnorMlRkei83QnNEalp6YVl6a2NDdzlscFA2U1BMMitFUnUvWGVYY2Z4NVVlc1pESktMQXNuTzhDSnVlaHFncmlBQVlRNGNLbmdVS0ozYm9VYTZ2RGhjUDYiLCJtYWMiOiI2YTcxZmE2NWE2N2U5ZTg2ZDU3ZjFmMjI5NGE4MDRhNmNhNTNkNTYwNDg4OWFjMjQ5NGYwZmM5MDBmMzk3Mjc3IiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6Ims1MG1HN095VXVrdnlVd3NHclRVNkE9PSIsInZhbHVlIjoiTExKUG5CZW9uM1ovdlJzTDUzYTZ3MXYvdER1OTQxeTNxcWFKclc0eTNoTHhUVGJRUy9UU3BpN3grWVB1WEZJNitja0w4UHBiaGxoWWM3aGpZOWhxd3FzR1F2Sy9ZVllOTVZIZC9GbFd4Qjh2SFhCRlFmQzc2QzlqSGtpRU1uMWUiLCJtYWMiOiI2NTUyZGFiN2Y0YjRkMjU1OWE1YWRjZDk2ZWQyNzA2OWM2NzNkZDVmYmY1MTc0MzVlZGVmZWQyODNlYjFiZDhlIiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,NULL,NULL,'2024-05-06 08:08:14','2024-05-06 08:08:14'),(20,'GET','[]','http://localhost:8000/storage/theme/1/L3ou2rnh0Y30qV6xmDoUvSBvTAldxa8YQB08CCEH.webp','http://localhost:8000/','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6InVwWDlhemxOWWRFSTNJUUxCUFlJSnc9PSIsInZhbHVlIjoibFpQTTlOTm81UjRCUDlVZXlhWEo4ZGppYjhFVWxGT1p3WkY1RjRKRnorMlRkei83QnNEalp6YVl6a2NDdzlscFA2U1BMMitFUnUvWGVYY2Z4NVVlc1pESktMQXNuTzhDSnVlaHFncmlBQVlRNGNLbmdVS0ozYm9VYTZ2RGhjUDYiLCJtYWMiOiI2YTcxZmE2NWE2N2U5ZTg2ZDU3ZjFmMjI5NGE4MDRhNmNhNTNkNTYwNDg4OWFjMjQ5NGYwZmM5MDBmMzk3Mjc3IiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6Ims1MG1HN095VXVrdnlVd3NHclRVNkE9PSIsInZhbHVlIjoiTExKUG5CZW9uM1ovdlJzTDUzYTZ3MXYvdER1OTQxeTNxcWFKclc0eTNoTHhUVGJRUy9UU3BpN3grWVB1WEZJNitja0w4UHBiaGxoWWM3aGpZOWhxd3FzR1F2Sy9ZVllOTVZIZC9GbFd4Qjh2SFhCRlFmQzc2QzlqSGtpRU1uMWUiLCJtYWMiOiI2NTUyZGFiN2Y0YjRkMjU1OWE1YWRjZDk2ZWQyNzA2OWM2NzNkZDVmYmY1MTc0MzVlZGVmZWQyODNlYjFiZDhlIiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,NULL,NULL,'2024-05-06 08:08:14','2024-05-06 08:08:14'),(21,'GET','[]','http://localhost:8000/storage/theme/1/IAVGQ6NnGE2oAlagjM2AaCFrDndSh5JlKIhnfaEd.webp','http://localhost:8000/','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6InVwWDlhemxOWWRFSTNJUUxCUFlJSnc9PSIsInZhbHVlIjoibFpQTTlOTm81UjRCUDlVZXlhWEo4ZGppYjhFVWxGT1p3WkY1RjRKRnorMlRkei83QnNEalp6YVl6a2NDdzlscFA2U1BMMitFUnUvWGVYY2Z4NVVlc1pESktMQXNuTzhDSnVlaHFncmlBQVlRNGNLbmdVS0ozYm9VYTZ2RGhjUDYiLCJtYWMiOiI2YTcxZmE2NWE2N2U5ZTg2ZDU3ZjFmMjI5NGE4MDRhNmNhNTNkNTYwNDg4OWFjMjQ5NGYwZmM5MDBmMzk3Mjc3IiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6Ims1MG1HN095VXVrdnlVd3NHclRVNkE9PSIsInZhbHVlIjoiTExKUG5CZW9uM1ovdlJzTDUzYTZ3MXYvdER1OTQxeTNxcWFKclc0eTNoTHhUVGJRUy9UU3BpN3grWVB1WEZJNitja0w4UHBiaGxoWWM3aGpZOWhxd3FzR1F2Sy9ZVllOTVZIZC9GbFd4Qjh2SFhCRlFmQzc2QzlqSGtpRU1uMWUiLCJtYWMiOiI2NTUyZGFiN2Y0YjRkMjU1OWE1YWRjZDk2ZWQyNzA2OWM2NzNkZDVmYmY1MTc0MzVlZGVmZWQyODNlYjFiZDhlIiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,NULL,NULL,'2024-05-06 08:08:15','2024-05-06 08:08:15'),(22,'GET','[]','http://localhost:8000','http://localhost:8000/checkout/cart','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/localhost:8000\\/checkout\\/cart\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6IlZIekZLUmRXdklSN3Nsck93L3JBMWc9PSIsInZhbHVlIjoiUVNoVWdGQm9taklOQ0padWVBaU01SzBZY0lhYkwyNnZ0Q3Q2bmd5dVlyYTZMSVFoNm84dDR2dWJlVWNtSUJBVG9aeFA2SW5RQUpuTXJQVUY0Y20xZTRDMFBRVlJaRWxQTWNxV2wzNHdNV3NuVWtWMElkR0I5NTJPek5uVkYxM3ciLCJtYWMiOiJmMjg0NTBlY2IwMTkwMTg5MDg2MDQ3YjU2N2Q1NzVmYzg1N2QxYjQyMjMyNGRmY2ZmYjU5NTI5M2RlNjNhYmEzIiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6InZxdUZNYUg0VGZuS2w0Ykt6S0ZtV2c9PSIsInZhbHVlIjoibk9DWXNlMStDU0JIUDhFWFRDK0w2a0t3TjhzSVNCeHJIZzJaQmJGZElDcXlIdmo2REx0bnpyQlN4a3I4YXdaejU0MU4vaENGclFmVnZ2dXJ6Y1JQR2dCaGFOQ2YyTGNFUWRuakNSdlZ1aHk4eWdFYjZsMzdPRmY3ZXdNMHRWSmwiLCJtYWMiOiJjZmI1NjcwNTY5Y2Y4ZjJkNGZkYThhMDdkMzlmOTcxNTRhZTEzYzY5ZmQxMzAwZDI4ZmEwNGM4YjJjMTYzMDYzIiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,NULL,NULL,'2024-05-06 08:08:25','2024-05-06 08:08:25'),(23,'GET','[]','http://localhost:8000/storage/locales/xpXiUaFu5GzEe5W9tzBw6JHk4z3EXOfdwcWVX3hG.png','http://localhost:8000/','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6IktEWmF2RXhuRWRuUU1ScUlJSW55ZkE9PSIsInZhbHVlIjoieGxlREE5ZHpvejJDdVJVUnNIV3BUZnRLQ2NDcnRGV2l4VTRaa3Bjd1E4U0t5TGZ4V0lKQnE2ZTQ3WWJmb2JRbTVZTGlWMnZtOEVnZzlocW9sNjg2NnFiRE5PSUFoc0VhZGVuVWFhUjR6S1VDZjJaK1BiTzRnRm5Qdk9Ob09kOG4iLCJtYWMiOiIwZWQzYTBhMDY5YTIyYmI5N2VhYjIyZTIyOWMwNTNmMGExNzlmMjhjYmU3Nzg5NmMxNTI2OWE4NGY1YWRmMWQwIiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6ImRlOUJ6TEx1UTZFMDlvVzd3cXJJbnc9PSIsInZhbHVlIjoiajZDa3hRb3h0alhxSytSUWJLMmhjQ3RudnRTT3lqQ2xjbE9zdHdJSFg5MG9VNm1NbUdhZHF3eHhnbWtuemJrQ1FIMnJLTllZc041RTVDTXFvdG5Hb3FKSk1ZSFVoUmdrY1U0WHhiZWNtVUlPQ1JCOVhxYTd2N3FsNTh2b3NZekoiLCJtYWMiOiJhMmJiMTRmZjZlNDFjYTI1YWIxOGY4NDlmOWI5ZDk0NzgyN2FjNmVlY2JjZjVhNTk4ZDk4YzJmZjU0M2Y2ZDU3IiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,NULL,NULL,'2024-05-06 08:08:25','2024-05-06 08:08:25'),(24,'GET','[]','http://localhost:8000/storage/locales/xpXiUaFu5GzEe5W9tzBw6JHk4z3EXOfdwcWVX3hG.png','http://localhost:8000/','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6Ii9mNkFTTFFQVFdNUjhrdVZEQ3d5M3c9PSIsInZhbHVlIjoiblBIMlJSUWtqcmg0c1lXU09FdzM1MGdsdC9uWEFoZTFBWXNVYkxWV3VTMzBYZk9UdWFac01hS1p1RkQ2dnM4Zk90ZHlOSVVodUFjeVloSzAwM0l5bmhZM1VRVVRBRmNLZThIdmlWU0l0TmxGdVZBaXpMWDhnNGUvOEloVVFVTk0iLCJtYWMiOiJlYTU1YTdiYjYwNGJmNGU1YTZkNjQ2NWQ0YjM3ODBjMmU1NjBjMTRjOGEzNDk4YTdiYmIwNTcxM2IzMzEwNzAzIiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6Im96ZTBaQjF2dzJoR2dqOW1ZZjc0eUE9PSIsInZhbHVlIjoicUVRaEVLNy9rdFo5TDRKcDVEMnZCMGMzOTlTUGJoRDZwZ1lxOTN4QzNqaGJnNW45cFRrNVdJN2JoV2h4TzFvVytMU2o2YWd3UnZFZW1IK205Wjljdnp1dEJZMmQ1Y0JKakE2bEhBNkd4a2o2eTBFZUNWbzEvcDV3RytnT3RsY2QiLCJtYWMiOiI3MzU4NTA5NTkzYzEyNzM1OTJiMGVjYmZmMWQxYTgyMWYwYTAwODMxNjQ2MDUwMzliM2RmNmE3NmJhZWI2OTQ3IiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,NULL,NULL,'2024-05-06 08:08:26','2024-05-06 08:08:26'),(25,'GET','[]','http://localhost:8000/storage/locales/YuFazk3QsiQb7LqQGB9qpUAb9YTCaW9Cf2TnE2Kq.png','http://localhost:8000/','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6Ii9XbXkvMlpPenJ6dDkxb2IycHd0dGc9PSIsInZhbHVlIjoiclFrQVZQTXpJZFJvSW9FbjVxSzBnR0s5V1JGTm8xQmUwWXVkWS84YUdyU3JDS2JBSHQ3a0pFQnZhRmxkVTJOVXRYYU1jK1NsNkJMNTUyOWVhSEduR1pyQURlRVRxOWF6OXZ5VlY1YTA3UEdqNFVGNEpRdDBxbHl4WktSVmg0T2IiLCJtYWMiOiIyMDc4NTZjYjQ0ZGVkNmYyMTZlOWY3YmE4NmViNzAzODEyYjQ5Mjk5YWJmMWMzY2RmNTIzMDk0ZmI3NjA1ZmE5IiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6ImNkVzFiTmZuSUxUaEoxWkJQSWtVaHc9PSIsInZhbHVlIjoiajBQRzhEQXFBZXBvcmVjeEJOc3AwTW4yK3dyUUQ0M1lmNkJBWHFxeHhJUzVNMEp1YzlqM2lzNElCQi9nT2twTnZFa1prVkNoalBRaUI5RGlqMzU0TjBnL3dpcHdKd2RRSmZrSTE4ZGIvMHo3TS9iaVhhQkNtc2NuNkNsMnd5cW0iLCJtYWMiOiI4MWE4NDA4NzdmNDNjNzk2ZmRhYTg2OWNmYmVhYzJiM2VkM2IxMWRjNzM1ODVkMTJiYjhlYmNkYjMyNzBlOTUyIiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,NULL,NULL,'2024-05-06 08:08:27','2024-05-06 08:08:27'),(26,'GET','[]','http://localhost:8000/storage/theme/1/XrX0w1NYgVf4LGozkAkbMPWMVLMmbz56COCJQSc0.webp','http://localhost:8000/','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6Ii9XbXkvMlpPenJ6dDkxb2IycHd0dGc9PSIsInZhbHVlIjoiclFrQVZQTXpJZFJvSW9FbjVxSzBnR0s5V1JGTm8xQmUwWXVkWS84YUdyU3JDS2JBSHQ3a0pFQnZhRmxkVTJOVXRYYU1jK1NsNkJMNTUyOWVhSEduR1pyQURlRVRxOWF6OXZ5VlY1YTA3UEdqNFVGNEpRdDBxbHl4WktSVmg0T2IiLCJtYWMiOiIyMDc4NTZjYjQ0ZGVkNmYyMTZlOWY3YmE4NmViNzAzODEyYjQ5Mjk5YWJmMWMzY2RmNTIzMDk0ZmI3NjA1ZmE5IiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6ImNkVzFiTmZuSUxUaEoxWkJQSWtVaHc9PSIsInZhbHVlIjoiajBQRzhEQXFBZXBvcmVjeEJOc3AwTW4yK3dyUUQ0M1lmNkJBWHFxeHhJUzVNMEp1YzlqM2lzNElCQi9nT2twTnZFa1prVkNoalBRaUI5RGlqMzU0TjBnL3dpcHdKd2RRSmZrSTE4ZGIvMHo3TS9iaVhhQkNtc2NuNkNsMnd5cW0iLCJtYWMiOiI4MWE4NDA4NzdmNDNjNzk2ZmRhYTg2OWNmYmVhYzJiM2VkM2IxMWRjNzM1ODVkMTJiYjhlYmNkYjMyNzBlOTUyIiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,NULL,NULL,'2024-05-06 08:08:27','2024-05-06 08:08:27'),(27,'GET','[]','http://localhost:8000/storage/theme/1/6djeg88iqLD7u7gl62phIGd4IES7lbXeGZcgoXdW.webp','http://localhost:8000/','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6Ii9XbXkvMlpPenJ6dDkxb2IycHd0dGc9PSIsInZhbHVlIjoiclFrQVZQTXpJZFJvSW9FbjVxSzBnR0s5V1JGTm8xQmUwWXVkWS84YUdyU3JDS2JBSHQ3a0pFQnZhRmxkVTJOVXRYYU1jK1NsNkJMNTUyOWVhSEduR1pyQURlRVRxOWF6OXZ5VlY1YTA3UEdqNFVGNEpRdDBxbHl4WktSVmg0T2IiLCJtYWMiOiIyMDc4NTZjYjQ0ZGVkNmYyMTZlOWY3YmE4NmViNzAzODEyYjQ5Mjk5YWJmMWMzY2RmNTIzMDk0ZmI3NjA1ZmE5IiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6ImNkVzFiTmZuSUxUaEoxWkJQSWtVaHc9PSIsInZhbHVlIjoiajBQRzhEQXFBZXBvcmVjeEJOc3AwTW4yK3dyUUQ0M1lmNkJBWHFxeHhJUzVNMEp1YzlqM2lzNElCQi9nT2twTnZFa1prVkNoalBRaUI5RGlqMzU0TjBnL3dpcHdKd2RRSmZrSTE4ZGIvMHo3TS9iaVhhQkNtc2NuNkNsMnd5cW0iLCJtYWMiOiI4MWE4NDA4NzdmNDNjNzk2ZmRhYTg2OWNmYmVhYzJiM2VkM2IxMWRjNzM1ODVkMTJiYjhlYmNkYjMyNzBlOTUyIiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,NULL,NULL,'2024-05-06 08:08:27','2024-05-06 08:08:27'),(28,'GET','[]','http://localhost:8000/storage/theme/1/L3ou2rnh0Y30qV6xmDoUvSBvTAldxa8YQB08CCEH.webp','http://localhost:8000/','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6Ii9XbXkvMlpPenJ6dDkxb2IycHd0dGc9PSIsInZhbHVlIjoiclFrQVZQTXpJZFJvSW9FbjVxSzBnR0s5V1JGTm8xQmUwWXVkWS84YUdyU3JDS2JBSHQ3a0pFQnZhRmxkVTJOVXRYYU1jK1NsNkJMNTUyOWVhSEduR1pyQURlRVRxOWF6OXZ5VlY1YTA3UEdqNFVGNEpRdDBxbHl4WktSVmg0T2IiLCJtYWMiOiIyMDc4NTZjYjQ0ZGVkNmYyMTZlOWY3YmE4NmViNzAzODEyYjQ5Mjk5YWJmMWMzY2RmNTIzMDk0ZmI3NjA1ZmE5IiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6ImNkVzFiTmZuSUxUaEoxWkJQSWtVaHc9PSIsInZhbHVlIjoiajBQRzhEQXFBZXBvcmVjeEJOc3AwTW4yK3dyUUQ0M1lmNkJBWHFxeHhJUzVNMEp1YzlqM2lzNElCQi9nT2twTnZFa1prVkNoalBRaUI5RGlqMzU0TjBnL3dpcHdKd2RRSmZrSTE4ZGIvMHo3TS9iaVhhQkNtc2NuNkNsMnd5cW0iLCJtYWMiOiI4MWE4NDA4NzdmNDNjNzk2ZmRhYTg2OWNmYmVhYzJiM2VkM2IxMWRjNzM1ODVkMTJiYjhlYmNkYjMyNzBlOTUyIiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,NULL,NULL,'2024-05-06 08:08:27','2024-05-06 08:08:27'),(29,'GET','[]','http://localhost:8000/storage/theme/1/IAVGQ6NnGE2oAlagjM2AaCFrDndSh5JlKIhnfaEd.webp','http://localhost:8000/','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6Ii9XbXkvMlpPenJ6dDkxb2IycHd0dGc9PSIsInZhbHVlIjoiclFrQVZQTXpJZFJvSW9FbjVxSzBnR0s5V1JGTm8xQmUwWXVkWS84YUdyU3JDS2JBSHQ3a0pFQnZhRmxkVTJOVXRYYU1jK1NsNkJMNTUyOWVhSEduR1pyQURlRVRxOWF6OXZ5VlY1YTA3UEdqNFVGNEpRdDBxbHl4WktSVmg0T2IiLCJtYWMiOiIyMDc4NTZjYjQ0ZGVkNmYyMTZlOWY3YmE4NmViNzAzODEyYjQ5Mjk5YWJmMWMzY2RmNTIzMDk0ZmI3NjA1ZmE5IiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6ImNkVzFiTmZuSUxUaEoxWkJQSWtVaHc9PSIsInZhbHVlIjoiajBQRzhEQXFBZXBvcmVjeEJOc3AwTW4yK3dyUUQ0M1lmNkJBWHFxeHhJUzVNMEp1YzlqM2lzNElCQi9nT2twTnZFa1prVkNoalBRaUI5RGlqMzU0TjBnL3dpcHdKd2RRSmZrSTE4ZGIvMHo3TS9iaVhhQkNtc2NuNkNsMnd5cW0iLCJtYWMiOiI4MWE4NDA4NzdmNDNjNzk2ZmRhYTg2OWNmYmVhYzJiM2VkM2IxMWRjNzM1ODVkMTJiYjhlYmNkYjMyNzBlOTUyIiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,NULL,NULL,'2024-05-06 08:08:27','2024-05-06 08:08:27'),(30,'GET','[]','http://localhost:8000/storage/theme/5/QV6Klqu61cwvG7k7ycFcKucWRiBd9kMXRfagMxmK.webp','http://localhost:8000/','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6ImZLK0F1cHd0dk1yUGlhQm5XWCsxSUE9PSIsInZhbHVlIjoibFBTMXJmajVKbDd5NS9CMzEyTnVhLzl2bWkxd2pnMmxiS1BMNHVteGNzUnlSZUZOemdTK3NsSkRSOXJVNGdTRnh4SHk5Q3R3anVnRUZwMVRTRGJoWnFUc3JYV2o3R1J3ZlNVMlA3aHpIR3RVeCtTRHdxYnlqWkhpQS8zemo2OG8iLCJtYWMiOiIwMjk2ZDRlMDA1OTM4ODAwOThiN2ZlZjVjMzQ1NDY4YzkxODY3NjQ0NDc2Y2I0MDA5Y2M0NTRjODE5ODFmOTkyIiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6InJGYkdTYlRLbE5nU0dORHRnWVlJaFE9PSIsInZhbHVlIjoiYWdQdG5PeVdvQWpNc0Nsc0E1ekN1ZDFUQUNVWnZ2OE1Bc3V3WWtFUHBPd2htaXpTRTZPczkrZVVKVXY0dTc5Q2hLUmJnR0dVd3RDSVVuNFhBWmgyQzk0RzR1ek1oN040ZWpkOVQ1ZDRYaGFFdkJQVW5SWm9Gd3ZlbXpQSW4yRjYiLCJtYWMiOiJhNTEyNmZmNTc2MmJhZWRhYjY5NTNiMjU2ODVjZTdkMWM1NDAwOTc0MzcwZGE5NWRhYTZiN2JmNDkwMDZlZjJmIiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,NULL,NULL,'2024-05-06 08:08:30','2024-05-06 08:08:30'),(31,'GET','[]','http://localhost:8000/storage/theme/5/g5WkYSIJEh4oCtoybolZY5vLEO1qfc80bnRXLGt2.webp','http://localhost:8000/','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6ImZLK0F1cHd0dk1yUGlhQm5XWCsxSUE9PSIsInZhbHVlIjoibFBTMXJmajVKbDd5NS9CMzEyTnVhLzl2bWkxd2pnMmxiS1BMNHVteGNzUnlSZUZOemdTK3NsSkRSOXJVNGdTRnh4SHk5Q3R3anVnRUZwMVRTRGJoWnFUc3JYV2o3R1J3ZlNVMlA3aHpIR3RVeCtTRHdxYnlqWkhpQS8zemo2OG8iLCJtYWMiOiIwMjk2ZDRlMDA1OTM4ODAwOThiN2ZlZjVjMzQ1NDY4YzkxODY3NjQ0NDc2Y2I0MDA5Y2M0NTRjODE5ODFmOTkyIiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6InJGYkdTYlRLbE5nU0dORHRnWVlJaFE9PSIsInZhbHVlIjoiYWdQdG5PeVdvQWpNc0Nsc0E1ekN1ZDFUQUNVWnZ2OE1Bc3V3WWtFUHBPd2htaXpTRTZPczkrZVVKVXY0dTc5Q2hLUmJnR0dVd3RDSVVuNFhBWmgyQzk0RzR1ek1oN040ZWpkOVQ1ZDRYaGFFdkJQVW5SWm9Gd3ZlbXpQSW4yRjYiLCJtYWMiOiJhNTEyNmZmNTc2MmJhZWRhYjY5NTNiMjU2ODVjZTdkMWM1NDAwOTc0MzcwZGE5NWRhYTZiN2JmNDkwMDZlZjJmIiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,NULL,NULL,'2024-05-06 08:08:30','2024-05-06 08:08:30'),(32,'GET','[]','http://localhost:8000/storage/theme/5/acQImgAo12HwvsfCGus1x50FAivqB4RbpR2l2IXc.webp','http://localhost:8000/','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6ImZLK0F1cHd0dk1yUGlhQm5XWCsxSUE9PSIsInZhbHVlIjoibFBTMXJmajVKbDd5NS9CMzEyTnVhLzl2bWkxd2pnMmxiS1BMNHVteGNzUnlSZUZOemdTK3NsSkRSOXJVNGdTRnh4SHk5Q3R3anVnRUZwMVRTRGJoWnFUc3JYV2o3R1J3ZlNVMlA3aHpIR3RVeCtTRHdxYnlqWkhpQS8zemo2OG8iLCJtYWMiOiIwMjk2ZDRlMDA1OTM4ODAwOThiN2ZlZjVjMzQ1NDY4YzkxODY3NjQ0NDc2Y2I0MDA5Y2M0NTRjODE5ODFmOTkyIiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6InJGYkdTYlRLbE5nU0dORHRnWVlJaFE9PSIsInZhbHVlIjoiYWdQdG5PeVdvQWpNc0Nsc0E1ekN1ZDFUQUNVWnZ2OE1Bc3V3WWtFUHBPd2htaXpTRTZPczkrZVVKVXY0dTc5Q2hLUmJnR0dVd3RDSVVuNFhBWmgyQzk0RzR1ek1oN040ZWpkOVQ1ZDRYaGFFdkJQVW5SWm9Gd3ZlbXpQSW4yRjYiLCJtYWMiOiJhNTEyNmZmNTc2MmJhZWRhYjY5NTNiMjU2ODVjZTdkMWM1NDAwOTc0MzcwZGE5NWRhYTZiN2JmNDkwMDZlZjJmIiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,NULL,NULL,'2024-05-06 08:08:31','2024-05-06 08:08:31'),(33,'GET','[]','http://localhost:8000/storage/theme/5/RZNIbMXGziDUNke4S8yXIytESjFAF11h8WMtSW3M.webp','http://localhost:8000/','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6InZLamp6YjhnTVNvOXEzekVGZzc4UHc9PSIsInZhbHVlIjoiTjdUQURHSksyL0E5M0VNaXQzaEpjaUFXeWhyZDdXdWhrVGdIYkFOL0wzdFQ2VHp1M0UyVUZZdGxZWE1qdnB3bDV4MEd1Mng3anowSUgzVDBEdEE3OWdNb1M3eHAzZ0lYVHFIdkYyRy9RUGtDb3FLTGo2c2c1K2g1cVVQZEpsRGQiLCJtYWMiOiI5M2U5ZDZhMjcwMmJlNDE2MDQ1NDBmMDRjZGYyNzBlYjYxMTA0MjBiZWRhOGM1MzI5NThhMzNjNDQyZDkyOTRmIiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6IjlSRWUya1NaZzdQZzd1dHFWdWsxRUE9PSIsInZhbHVlIjoiTWJOSmh6NHhFejZqWmd0V1FpNDgvdWpsKzQvbFEyNnJJWEdxQjgwWmhZamxCUXpvNEZ4ZmVlQ0M2R2ZaQklTZWRMTnFkVXdNZTNkbnkxQWZkQzBNNDRvbTVlcDMzWTVhc1I1eThVL2I1eS9ieVZ5dTJGSHJkTU1hRE5wNWRNUmYiLCJtYWMiOiJmYTI1Nzg1MDQ1ZTEwYjIwY2IyZmIwMTgwOTlmY2RiMTMwZDc2NTZkODkwNmVmZWU4MzcxMTE0NDMyOTQ2Nzk4IiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,NULL,NULL,'2024-05-06 08:08:31','2024-05-06 08:08:31'),(34,'GET','[]','http://localhost:8000/storage/theme/5/0aRrgG8U7GBOCIEHaQlxLtheCC9R15FL8RhvHxtg.webp','http://localhost:8000/','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6InZLamp6YjhnTVNvOXEzekVGZzc4UHc9PSIsInZhbHVlIjoiTjdUQURHSksyL0E5M0VNaXQzaEpjaUFXeWhyZDdXdWhrVGdIYkFOL0wzdFQ2VHp1M0UyVUZZdGxZWE1qdnB3bDV4MEd1Mng3anowSUgzVDBEdEE3OWdNb1M3eHAzZ0lYVHFIdkYyRy9RUGtDb3FLTGo2c2c1K2g1cVVQZEpsRGQiLCJtYWMiOiI5M2U5ZDZhMjcwMmJlNDE2MDQ1NDBmMDRjZGYyNzBlYjYxMTA0MjBiZWRhOGM1MzI5NThhMzNjNDQyZDkyOTRmIiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6IjlSRWUya1NaZzdQZzd1dHFWdWsxRUE9PSIsInZhbHVlIjoiTWJOSmh6NHhFejZqWmd0V1FpNDgvdWpsKzQvbFEyNnJJWEdxQjgwWmhZamxCUXpvNEZ4ZmVlQ0M2R2ZaQklTZWRMTnFkVXdNZTNkbnkxQWZkQzBNNDRvbTVlcDMzWTVhc1I1eThVL2I1eS9ieVZ5dTJGSHJkTU1hRE5wNWRNUmYiLCJtYWMiOiJmYTI1Nzg1MDQ1ZTEwYjIwY2IyZmIwMTgwOTlmY2RiMTMwZDc2NTZkODkwNmVmZWU4MzcxMTE0NDMyOTQ2Nzk4IiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,NULL,NULL,'2024-05-06 08:08:31','2024-05-06 08:08:31'),(35,'GET','[]','http://localhost:8000/storage/theme/5/hBu6NnEJa7QZ227w1irYewM6pYf9vCmBu7tlF9eX.webp','http://localhost:8000/','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6InZLamp6YjhnTVNvOXEzekVGZzc4UHc9PSIsInZhbHVlIjoiTjdUQURHSksyL0E5M0VNaXQzaEpjaUFXeWhyZDdXdWhrVGdIYkFOL0wzdFQ2VHp1M0UyVUZZdGxZWE1qdnB3bDV4MEd1Mng3anowSUgzVDBEdEE3OWdNb1M3eHAzZ0lYVHFIdkYyRy9RUGtDb3FLTGo2c2c1K2g1cVVQZEpsRGQiLCJtYWMiOiI5M2U5ZDZhMjcwMmJlNDE2MDQ1NDBmMDRjZGYyNzBlYjYxMTA0MjBiZWRhOGM1MzI5NThhMzNjNDQyZDkyOTRmIiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6IjlSRWUya1NaZzdQZzd1dHFWdWsxRUE9PSIsInZhbHVlIjoiTWJOSmh6NHhFejZqWmd0V1FpNDgvdWpsKzQvbFEyNnJJWEdxQjgwWmhZamxCUXpvNEZ4ZmVlQ0M2R2ZaQklTZWRMTnFkVXdNZTNkbnkxQWZkQzBNNDRvbTVlcDMzWTVhc1I1eThVL2I1eS9ieVZ5dTJGSHJkTU1hRE5wNWRNUmYiLCJtYWMiOiJmYTI1Nzg1MDQ1ZTEwYjIwY2IyZmIwMTgwOTlmY2RiMTMwZDc2NTZkODkwNmVmZWU4MzcxMTE0NDMyOTQ2Nzk4IiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,NULL,NULL,'2024-05-06 08:08:31','2024-05-06 08:08:31'),(36,'GET','[]','http://localhost:8000/storage/theme/6/rax3lR7qd6XiAiHo8Cha3CAJi5ntjVlsvNIItJJe.webp','http://localhost:8000/','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6InlkNnZVdlJHQldtUmtsK3JSZGU1b3c9PSIsInZhbHVlIjoieExmS1dqRzZiK1VkNzZlcEF0YmIrQ2ZGSDNWNUYvK1RJNGFCV0dpNVFZSTdmazI5TVVuR2IwRXBkK1dwOVJ2WkZKQWE0K3lFUTNOWkQzY0Y1Q2NQNFdOUWpzbHg1QlVJYmdHSTl2TXQycGh0azB1YnhuUHFkdzNFS0pjeXg1dC8iLCJtYWMiOiJhODg3MGRiYjQzNTM4NmI5MWNiMzExMDNmMjdjYzkwMGNhMWNmY2JiNDRhODNlOTcyNDc0ZmM1NGY0M2M4NDM3IiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6Ik43d1JDa1dsbHQybVBNaTNVbGpQeFE9PSIsInZhbHVlIjoiVlQwd2xJMzl2bmU1T2NGN1N1UmhXV1dzYTd3cW9QUFJaZjlreU44QmU3MjJBZytzM3ZsQm5pQkcxVlcrL0svdlhSTnJJT3RNOWlscTdJYU8wZkdRWElkcy9MZ204Z1lmZlpCMzUzV0g0a0lXN0NnTDhyLzl3azJLcHhvL014WUsiLCJtYWMiOiIyOGMzNjZhZWRmYjkyYzA0YjI1NGI0ZGNmZGU3ZWQ1M2QwM2M2MjdjYmNmZDM5NWQ1ZGJmM2UwMGQwMTI5Nzk1IiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,NULL,NULL,'2024-05-06 08:08:31','2024-05-06 08:08:31'),(37,'GET','[]','http://localhost:8000/eligendi-odit-qui-quis-molestiae','http://localhost:8000/','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/localhost:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6Ik9yVnRvaENmaGtHYWFySnVQQ281S2c9PSIsInZhbHVlIjoiZDh3ZXZzYWFubFdQcEJqb0tTT1pjd1JJb0V3UEhHT0c3UUtKVjh6cTByM21HZ2dvU3Z5alRSc3AxV1ZNQUlNaVJJYVRhVXJsaXd4UGtlTWlXSTV6UVRrUnhnbGJSVlFyaitWcm9JYlN1MlRWaDltOWt4VDRjU0tmNDZGU1liMWQiLCJtYWMiOiJiYTdlNjc1ZTNhMjhmMjk3NzBlZTI4OTI2Y2NmOGY2MmI1OTVlOGJiY2I4NTZmNTM3ODRjZmVlYjM3MTA4YjUxIiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6IjdQYnpmT0QxTnhUSHBLZ2R3WEt5M1E9PSIsInZhbHVlIjoiTUpScG4vU1NaK0dmQ0txMWNSR2JnTENpYlA0d0kzQStqenR5VWJleG9xcFBSa3p1TEhndGcrUy9JSXNvQWRTTit6eEpkWUJoMXBJUEk1eXFvY21Tcmc3TUhjTUdoYVRibnZHamtkM0kxSXBTUjdNcEpIT0R0MHZ6RFZsOEVVMFkiLCJtYWMiOiI2YmViYTdlMWZlMzJjMjg5MTRiYjgyZjU4MGNkMzkzM2FiNzQxN2FiYjQ3Mzg5ZGNlODgzM2M4ZjFlMGY0NWNkIiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1','Webkul\\Product\\Models\\Product',93,NULL,NULL,'2024-05-06 08:08:33','2024-05-06 08:08:33'),(38,'GET','[]','http://localhost:8000/storage/locales/YuFazk3QsiQb7LqQGB9qpUAb9YTCaW9Cf2TnE2Kq.png','http://localhost:8000/eligendi-odit-qui-quis-molestiae','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/eligendi-odit-qui-quis-molestiae\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6ImQrb1BNb0dSc3dGeExJb0cvT1FqRnc9PSIsInZhbHVlIjoiYXRPTER4MHN6anlMd3RZQUxHN1pyL2VLRjYrOFJlWlhHdmIrTnBQN3ZNY2ZhS1NGeXh3cEJzVm5TdGxZVmgzTWFqL2RoRXIrbTlZRWU2Z2c4cGNEakljUDBoV1JwVi9ZUUZuSU9JeUdjRHNtbXdTa25RMkdwM2luN3RTVDVpamsiLCJtYWMiOiI5Y2RmNDcwYjAyY2Y3MzRkMDBkOTRmNWFiNzFkOTg0MDc0NGY1NmYxOGM2MjVmZTgzOGQ3NWYzZTMxODQ4NDg0IiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6IlU5RHZIQTZrQThRWmRQcFF2TVNIU0E9PSIsInZhbHVlIjoiaWV2NE5WY0NheXNxajd0ekh4QXlhRlg2azl6R0FZZkc2ZXdtTVM5SkxwTW9FNXJxWXgwYUZiSGdlVTZBVU11dTFZZ2JuNks0RWIzYldFa2JhT0gxa1N1V1NRa1FWMU9LbkVJODR3Qi9vR1NiaG9WbGIrUCtCN0tQU0xZdXJrMm8iLCJtYWMiOiI3MjlhYjgwZjcwYmQ4ZjkzNzE4ZmFmMTE2YzI5ZjBiZjUyZjA4YjEwZTU4NjQ3Y2M5OWIyZmNhMmM5ZmZmNTlhIiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,NULL,NULL,'2024-05-06 08:08:33','2024-05-06 08:08:33'),(39,'GET','[]','http://localhost:8000/storage/locales/YuFazk3QsiQb7LqQGB9qpUAb9YTCaW9Cf2TnE2Kq.png','http://localhost:8000/eligendi-odit-qui-quis-molestiae','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/eligendi-odit-qui-quis-molestiae\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6Im8xMTRrVC9PdE0yaDcxdHB5Y0ZyOFE9PSIsInZhbHVlIjoiWWY4bmRtQmRNNGZyQW5wb0hlU2JSWmN4Skg3Nm1lWFZWKzk4bjFpaDVDME5EZnROcjdwSnF4YTZobmVzS3YrdmdxYnVOY3B0aTlMMndGRXd5NzR4TnFHQ251WjF2SldiZWVSUzBEdGViRFlka2VrRGJiVWxVVENSU1p3engvVjIiLCJtYWMiOiI4MzJlNmU5M2UyNmMwYjcyNDJhNzllMjk3ZGU2NmI3ZGQyMjFjYmU5YzQwYzliMzFmODY0OTA2NTAxMTU0ODBiIiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6IjF3bGwxV3Q3LzFHMXNWd1gxSGVSa1E9PSIsInZhbHVlIjoiQ3VSc2E1a0pwTlkvb1ZyRzBwTldrK0RmYUlHYXM3THRiNlBkejk4bmdmTUlLbXN3OTNORzZnbVZ0SUlJTlI5YUtVWUZYUXVxbXRkNVRBOGlHUWNka3ZXc3QxNkVhNkw2eHltZEpnTnJTSjVLSFBEQTNMeXhkSWlkc1RqQjgxMGUiLCJtYWMiOiI0NDI0ZDMyMmZkZDVjOTU2ODk3OTJhYzI1N2MyNTM4ZDI3MjQ5YmQwMzNkN2IwMzJkMjJlOTI5NmUxYTlkNmYzIiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,NULL,NULL,'2024-05-06 08:08:33','2024-05-06 08:08:33'),(40,'GET','[]','http://localhost:8000','http://localhost:8000/admin/customers/customers','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/localhost:8000\\/admin\\/customers\\/customers\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6IllRbEZNUFFTWTFaTlFmb1BHZjVHUWc9PSIsInZhbHVlIjoiYWJ1QVJ2R0lqR1MyN1U4ZzZwNGNoRU1uS2hRTHovZ1VVcWlaUjh6VDdTQjZrc3FkODZyc05rdEJnZDhocXNUNHFNaWhKdStMb3VRaGl6ZkdzN1QrVnFiQzFyOFlsemFsbENTSUlia3dIUEJCb2RCQzdmVE1tK3dkOG9PRElMeVEiLCJtYWMiOiJhOWNmYmMwMWM1MzdkMDYyNWRjMTAyYzAzY2JjNjg3NGY1NzBjODgxODJhYzlmZTA4MmI3OGIxMDg1MDExZmI0IiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6InNQOHNETXRJalZ6OTNNNmJBR3lEZnc9PSIsInZhbHVlIjoiRlJYd3lMeEhrdG42TS9DVjllUmo2blBORjdDaGNwUElBZzc1T2dBYUxhaHIrMHJDNmlISmZaVHJrU0FKRWQxUlBKeHE3Wmw2dXZtN3hKOExJVHVFVE80RU94MzA0MnVLWmhRVEhzMzUzREdNaUlxRW5wTnZmQlFiaURQZFJrT3YiLCJtYWMiOiIzZjQ3OGViYzQ3NWY0MTAyOGJiNzk1MGMyNzBkZjM2Zjk4YjcyMzcxNDk4NDcwNTM2ZDg1NDYwZDdjZjcxZDIwIiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,NULL,NULL,'2024-05-06 08:09:06','2024-05-06 08:09:06'),(41,'GET','[]','http://localhost:8000/storage/locales/xpXiUaFu5GzEe5W9tzBw6JHk4z3EXOfdwcWVX3hG.png','http://localhost:8000/','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6IndXL2dUQm9jQ2tBRUxweEpRRTMxOWc9PSIsInZhbHVlIjoiZkoyZEVVb0U4K1BUUUtKSXo3UkpoaWxMV1V4V1Nra2x5S0dlWjk3QnVNUDRGTFhoWTM5aWZ0ejQwa05pSnRZYWxrcXlhRzBpQUF3SExJRFRRSCtISDRmRXJ4S3hBbXczZEpON1o3RDlxci80RkQ5ZEJDOUt2YjR2b1VlSGo3L2siLCJtYWMiOiIyYTRiNDA0YjE1MmNlYmI0Yjk3MDI0OTZiOGYxY2JiYzg5MTM3ZmE1YjYzNjY4OTYzYTc1YWVlZWU2ZTZhYjU5IiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6IkYxazRKTjJFSGtObXMrQXpxQS9ISmc9PSIsInZhbHVlIjoiVVp1cmM4OEdKYjJUd05LYWVVYjhHRjQvS2hPdGNyRHI5UXBaRmxsdW9lZmVacWVWbzdualdqcDY0dFgrTklHdU1QbTltZnlmU093V1dpbXQwcHdWc0I0a0J1dGlyVmpYQjh0c0NlT01qS2Zqanc3QkhUMm5kdFFsNUlDUENuZVQiLCJtYWMiOiJmMjMyZmNhN2Y4Yzg5OTMwOWQ4NzY2YTk0YzUwM2Q5M2U4ZWYwMzNjYzY4ZTU3NWZiYmViNTZhNzY0OWI2NGY2IiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,NULL,NULL,'2024-05-06 08:09:06','2024-05-06 08:09:06'),(42,'GET','[]','http://localhost:8000/storage/locales/xpXiUaFu5GzEe5W9tzBw6JHk4z3EXOfdwcWVX3hG.png','http://localhost:8000/','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6InU5RzdpSUViaFhJWlV6Y2tXcTlYUmc9PSIsInZhbHVlIjoiZVErYzJHaDIvcG0rc2x2d0pTeG16bWJXQ3RwNGxzTGFHY1JPUHpqdlhwNDVVWHV6bUpwdmlQRUR4M1BjYnZOT0VWZkF1QldTdDFpM0dEM3AxbXo3UzJuZzRqTEtFd3ZSMFhCTkI4NEM4TGZrWkhJVVpuVGErcHF6UUZyelVlUEQiLCJtYWMiOiJhNGRiN2I4ZmYxNDFmYzI4YjkzMjM0ZGQyMTkyZDEwN2MxZTMyYzQwNmJlMDVmZmIxZTcxNmE3MGU4YTMyMzJhIiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6IlU1aFE3YVl5bTJMY3N5SWIvTHpKWXc9PSIsInZhbHVlIjoiaytZdlJ1SEh6V1hwR3R0cnlINWFpNm5qdm10QTVsL0FvdE93ZHJyUzhyL1ExK1dHV1REc1U1cDZkWXZaNWhUT1BkRUFEcjEzRW9WVUt5RHlDdGFFWmxzblJVUnZCMHJKU1dDZk9sMU5WNWVRVUF2aFYzb3h2bjM0Z1VxWjloRDciLCJtYWMiOiI5ZDhiMmRiNjNkZmRlNjQ2YTU2MjE5OWM3NTRjNWI3MjA2ZmQ2MThjZjNlMTRhNTA0ODJjY2RhMmRlZmNmYjgyIiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,NULL,NULL,'2024-05-06 08:09:07','2024-05-06 08:09:07'),(43,'GET','[]','http://localhost:8000/storage/locales/YuFazk3QsiQb7LqQGB9qpUAb9YTCaW9Cf2TnE2Kq.png','http://localhost:8000/','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6ImhzQTRicHNrSFFsSjNpL1VBVmc3RGc9PSIsInZhbHVlIjoiUDhNTkt5Z1VBSmVPc25VNDYwNWJ2OWs4WitSTEgyRklFYXpCdkp0SXJEUVFINU1CbGkvMlorb2hnSjhQc1dwTFh4KzRVMXpaTGVvbElVcHVTNVh4MlJGRWZZOC83SEJnNXZQUlZVSkMwbE1hRVlhT2pUdWp3QXlmUEdST0VCcjgiLCJtYWMiOiJkMDBkZTY0MjQ1MmExOGU3ZTM3ZTc5YWNjZWM2ZjlhYzczZWE1M2M5OGY4OGU3MDY4N2ZjMTExMTBlNmJlNmIwIiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6IkVrdUNTRitIQ3ZoWURlVzUxbFBhYXc9PSIsInZhbHVlIjoiTmlrMHBBa1JzaXo4ZlcwZjFNUHFmZUtUdC9pMDU4ZzRMYmNxb1AzZElUd3dvM2s0NmZZZFRkblRzVDRITUs2bnQ0L0RjR21rekZ2MzVoUUdwazVScDhYbGQxUHdLV0IxY2hWNjNPMjk1Z0RSTjZadWNLeG84RXc0K2dEYTV0QjUiLCJtYWMiOiI5YmI4MTdmNTY3YjFkNzc5Y2E0ZGI1YThhMTk3N2E0M2IzODY3NTQ3ZDIzMDUwMzk4ZWQyMDU5YmZlYzFiNzhmIiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,NULL,NULL,'2024-05-06 08:09:07','2024-05-06 08:09:07'),(44,'GET','[]','http://localhost:8000/storage/theme/1/XrX0w1NYgVf4LGozkAkbMPWMVLMmbz56COCJQSc0.webp','http://localhost:8000/','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6ImhzQTRicHNrSFFsSjNpL1VBVmc3RGc9PSIsInZhbHVlIjoiUDhNTkt5Z1VBSmVPc25VNDYwNWJ2OWs4WitSTEgyRklFYXpCdkp0SXJEUVFINU1CbGkvMlorb2hnSjhQc1dwTFh4KzRVMXpaTGVvbElVcHVTNVh4MlJGRWZZOC83SEJnNXZQUlZVSkMwbE1hRVlhT2pUdWp3QXlmUEdST0VCcjgiLCJtYWMiOiJkMDBkZTY0MjQ1MmExOGU3ZTM3ZTc5YWNjZWM2ZjlhYzczZWE1M2M5OGY4OGU3MDY4N2ZjMTExMTBlNmJlNmIwIiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6IkVrdUNTRitIQ3ZoWURlVzUxbFBhYXc9PSIsInZhbHVlIjoiTmlrMHBBa1JzaXo4ZlcwZjFNUHFmZUtUdC9pMDU4ZzRMYmNxb1AzZElUd3dvM2s0NmZZZFRkblRzVDRITUs2bnQ0L0RjR21rekZ2MzVoUUdwazVScDhYbGQxUHdLV0IxY2hWNjNPMjk1Z0RSTjZadWNLeG84RXc0K2dEYTV0QjUiLCJtYWMiOiI5YmI4MTdmNTY3YjFkNzc5Y2E0ZGI1YThhMTk3N2E0M2IzODY3NTQ3ZDIzMDUwMzk4ZWQyMDU5YmZlYzFiNzhmIiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,NULL,NULL,'2024-05-06 08:09:08','2024-05-06 08:09:08'),(45,'GET','[]','http://localhost:8000/storage/theme/1/6djeg88iqLD7u7gl62phIGd4IES7lbXeGZcgoXdW.webp','http://localhost:8000/','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6ImhzQTRicHNrSFFsSjNpL1VBVmc3RGc9PSIsInZhbHVlIjoiUDhNTkt5Z1VBSmVPc25VNDYwNWJ2OWs4WitSTEgyRklFYXpCdkp0SXJEUVFINU1CbGkvMlorb2hnSjhQc1dwTFh4KzRVMXpaTGVvbElVcHVTNVh4MlJGRWZZOC83SEJnNXZQUlZVSkMwbE1hRVlhT2pUdWp3QXlmUEdST0VCcjgiLCJtYWMiOiJkMDBkZTY0MjQ1MmExOGU3ZTM3ZTc5YWNjZWM2ZjlhYzczZWE1M2M5OGY4OGU3MDY4N2ZjMTExMTBlNmJlNmIwIiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6IkVrdUNTRitIQ3ZoWURlVzUxbFBhYXc9PSIsInZhbHVlIjoiTmlrMHBBa1JzaXo4ZlcwZjFNUHFmZUtUdC9pMDU4ZzRMYmNxb1AzZElUd3dvM2s0NmZZZFRkblRzVDRITUs2bnQ0L0RjR21rekZ2MzVoUUdwazVScDhYbGQxUHdLV0IxY2hWNjNPMjk1Z0RSTjZadWNLeG84RXc0K2dEYTV0QjUiLCJtYWMiOiI5YmI4MTdmNTY3YjFkNzc5Y2E0ZGI1YThhMTk3N2E0M2IzODY3NTQ3ZDIzMDUwMzk4ZWQyMDU5YmZlYzFiNzhmIiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,NULL,NULL,'2024-05-06 08:09:08','2024-05-06 08:09:08'),(46,'GET','[]','http://localhost:8000/storage/theme/1/L3ou2rnh0Y30qV6xmDoUvSBvTAldxa8YQB08CCEH.webp','http://localhost:8000/','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6ImhzQTRicHNrSFFsSjNpL1VBVmc3RGc9PSIsInZhbHVlIjoiUDhNTkt5Z1VBSmVPc25VNDYwNWJ2OWs4WitSTEgyRklFYXpCdkp0SXJEUVFINU1CbGkvMlorb2hnSjhQc1dwTFh4KzRVMXpaTGVvbElVcHVTNVh4MlJGRWZZOC83SEJnNXZQUlZVSkMwbE1hRVlhT2pUdWp3QXlmUEdST0VCcjgiLCJtYWMiOiJkMDBkZTY0MjQ1MmExOGU3ZTM3ZTc5YWNjZWM2ZjlhYzczZWE1M2M5OGY4OGU3MDY4N2ZjMTExMTBlNmJlNmIwIiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6IkVrdUNTRitIQ3ZoWURlVzUxbFBhYXc9PSIsInZhbHVlIjoiTmlrMHBBa1JzaXo4ZlcwZjFNUHFmZUtUdC9pMDU4ZzRMYmNxb1AzZElUd3dvM2s0NmZZZFRkblRzVDRITUs2bnQ0L0RjR21rekZ2MzVoUUdwazVScDhYbGQxUHdLV0IxY2hWNjNPMjk1Z0RSTjZadWNLeG84RXc0K2dEYTV0QjUiLCJtYWMiOiI5YmI4MTdmNTY3YjFkNzc5Y2E0ZGI1YThhMTk3N2E0M2IzODY3NTQ3ZDIzMDUwMzk4ZWQyMDU5YmZlYzFiNzhmIiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,NULL,NULL,'2024-05-06 08:09:08','2024-05-06 08:09:08'),(47,'GET','[]','http://localhost:8000/storage/theme/1/IAVGQ6NnGE2oAlagjM2AaCFrDndSh5JlKIhnfaEd.webp','http://localhost:8000/','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6IjgwSzlPblVleTg4VytVbC9XejhUV2c9PSIsInZhbHVlIjoiWTJ0aytTWEp6S1BNRWZHSmdhL1JVVVhmMkJKTzBucU5LSVB1eG5qMzR4TGV0ak1UeXcwVk8wY0xJM2dFSURtVFAwUEpqckFvSjFMZWMwMzc1Z0pPMnIwR0k5eGo1VDFScVZYejVvMzF4V3Z0Vks5NVdMSjcwbFB4TDk3TUtONnEiLCJtYWMiOiJkYmQ3NzAwZTVmNjU2MWZiMDc2NTY4MTRiZDc1NWM1ODMxNjQ5ZmRjYWE1OTRmMTFhN2RkYzIxZTRmYmRkNjQ5IiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6ImpIc2liS291eFBreDNVQWJ1ZGZtbHc9PSIsInZhbHVlIjoid2p6SjhML2o1dzIzVTVpNXBWZlFKVEczUUg4K1lNdVlBL1pZK3BTUUtBMXBmVHZuQXB3elI5dHpZTnJ1eG9KeWxRZ2VsVDhEeTNhaUc5KzhubXJkbFRJcDRmNDBsaVkrRURlaHBvYVo0cUdTbkI1NHoxejJyYW4wSW9aR2VudE4iLCJtYWMiOiI4ZGNlZTNlNjNmNzE4NWMzNzdjYTVkZmU4ZmFjM2ExMTgyZDdjMzc3MzJkN2I3OWQzMDdhMGM2OWVlOWQ2ODViIiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,NULL,NULL,'2024-05-06 08:09:08','2024-05-06 08:09:08'),(48,'GET','[]','http://localhost:8000','http://localhost:8000/customer/login','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"cache-control\":[\"max-age=0\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"referer\":[\"http:\\/\\/localhost:8000\\/customer\\/login\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6InNQTkRwQTdKaGw2NVRXK0h2Q05oRmc9PSIsInZhbHVlIjoiWWRZVkVpUVE5Ujk3SDlPTWVKUE8xUmhiUHFyd0hPVWhlRGJ5Q08zUG5nY3pNekxSR0NrNkJWWlg0dVNOWVpJTGx6UTVYRWxwNFV0emdYWkVkK0dXZWNwQUJkejAxT2dkR0FSNTMxbkJvQzhFWm9kVEZnUGJQelJhY1lLRWlKWEYiLCJtYWMiOiI3YTJjOWM3MjYzMTRhNWE4YWFiZTdkNGQyN2VhNmMwNzIxYjZjYTVjNzJjNjg3MDE4NTcyZDdmNGIxN2ZjMDc3IiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6Ik42SUZPT0llZnpHUW9MNmRhbGpibVE9PSIsInZhbHVlIjoiTkY2NDgxVzRMUUpvUEpvTmM5UVF6MVljTDBEaGRiNmdscFZ2ekd6S0c2TWZIOGdmbWlXM3NpQVpnSDlsSXdhS2phbEs2ZHUxaUdHSSsxSlRBYVVNY0VsQlU1cFU5c0JDNWppWWZDckhweklaNHdrMEI1UDZKNFB3QjMwR2RNZEMiLCJtYWMiOiI1ZTFkZDVhZTE2MDc5Nzg5OTI5ODFiZDkwMWZiZTNiMGFiMjFmYjI2MjlkNWFkYzVhYTRkMTI1MzhmNGE1YzZmIiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,'Webkul\\Customer\\Models\\Customer',11,'2024-05-06 08:10:01','2024-05-06 08:10:01'),(49,'GET','[]','http://localhost:8000/storage/locales/xpXiUaFu5GzEe5W9tzBw6JHk4z3EXOfdwcWVX3hG.png','http://localhost:8000/','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6ImhoODBVVkowYmd5NE01KzdVZmIzcmc9PSIsInZhbHVlIjoiU013azZVMnZwQWFjbHVZVVc3MGhaTWFzY2JFMmQvZm1TbTV2ZWxRMGZlRGg2ZGUxcEV3MkI1ZzV6M3pzSmdzV1QxYnQrRkVBYldmWlU2VThNUFlaRVVlbWNINnV1cHRmNENoYzF1eXFNWCtpdjQzZ04xeGo3NkdUckc2VHJhMHgiLCJtYWMiOiIzZTQ3NTk5OGNmZDkwZmVjOGU5NzEwNGFjNDVlNzZjMWYyMWMwZTc1YTNhZDFhOThmMjM3YmZkODY0YTM4ODZlIiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6ImtyTU85NUNkczE2RUo0a1JUWGlDMXc9PSIsInZhbHVlIjoiRjBYY3JOM0JDVGFaV0xMVlY0Zk5KR21MRGlIemFSWkQ5aks0bmgxd1NPQnpSSURiU0xvUTRONEJKa0VOKzZvOXZGWmluYnZPQmhFWGdVQzJ2UHhuTnpvVlk2WUVtYnhLZzZhYnl2R1ExOXJDQk5IYzBWZ2dqS1JxVnE5ZWM2S0siLCJtYWMiOiJiYTI3OGQyZTc5NDZiZjY2M2RkZDk5YzM3Mjk1NGM5MDA0YmFkNDc3MzQ5YmNhNDI2MjkzN2ExMTJkNjRjZDlkIiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,'Webkul\\Customer\\Models\\Customer',11,'2024-05-06 08:10:01','2024-05-06 08:10:01'),(50,'GET','[]','http://localhost:8000/storage/locales/xpXiUaFu5GzEe5W9tzBw6JHk4z3EXOfdwcWVX3hG.png','http://localhost:8000/','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6IlFhRjJ6d0xtYW9UbHlBODNOY1d2anc9PSIsInZhbHVlIjoiT0ZBblpaSWdqaEJ6ZHhiYkkrUkx4YnNhRkNmQU1QUU5pQnRkKzRXNTdCZWFQSysrQk1qOEMxTDByWDY4VW5uWlBWeHhBRHVXNGYzMUhOYkZnUWFXSURJblh2WFdzZDlZUFVVcC9rZ0ZnUFZNbkQwVTF6MWdxY2diQkVzUkNOK1IiLCJtYWMiOiIyYTcwMzc4YzFjNWViZWEwMzJhNmQ1YzZkZDlkMGQzZTZkZmViMjIyNDZjOWFlZDk5MzJjYjg0ZGI0NzY3MWQ5IiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6InA2OHNtVmZVb3pid3h1NzNsbUJwR2c9PSIsInZhbHVlIjoidW1WZVNHVy9QVWNiQmFyaDhwTUo4ZzBseHBEak9xWXEwMVVKKzlidCtHMWFrRlg1SExYZHNUQytVOHJZSm9iQVZmbXJLNlFwZzJvWjZGeTIzTnI0TE1rSE1DT1AyWFlrZDhqblNXd2FYNDRkbm8rSnJGeXlTUzdYaTZ0WmZLTlUiLCJtYWMiOiJjYzY5NTc3OGI4MDU4MDMxZDlmYTRhYjY4NDRhZjk0NWVjNTllNDQwMzJmZTRhMDVkZWQ2NGQ5ZjJmYTEwOTQ0IiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,'Webkul\\Customer\\Models\\Customer',11,'2024-05-06 08:10:02','2024-05-06 08:10:02'),(51,'GET','[]','http://localhost:8000/storage/locales/YuFazk3QsiQb7LqQGB9qpUAb9YTCaW9Cf2TnE2Kq.png','http://localhost:8000/','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6IkJJYTFJV1dycGdCUE9NQkVXaFk5cmc9PSIsInZhbHVlIjoicm45cEY0TWpUUlAzSkxvTUVYUUNPUTY4ZGNBSHhiRjlFOEh1UzJBRTRyKzhpVTJlYTI2bEZicUpaL0w0ckdwSmdhb3V2LzFKLzNvTWF5U05iZU5FdHR1MTVBa1ZWeHhETURML0YzV3Y1SHNlZHJiZGp6VHplK2dFRWkySElxN1giLCJtYWMiOiI0Y2M0NWRiZjQ1ZGUyMzMwYTRlYjI2NWM5MTI4YmY1YWFhNmE3YzgwYThmMjE2OWJmOTQyOTBkYmIxYzRlMzc0IiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6ImtZZFRZaTFUaW1VQnJMNE9lQW5ERmc9PSIsInZhbHVlIjoic2lSNDV3WE53cm1LVklQeFUxbkxsMVVKT08va1E5a0xZQ0FteU5vbGVTcHo0QjdwMy9COXJETHVRaWtOeVNBVTdWK055TWtHSjliWFVhK1lyVWRkSC9sVGZvSy80MndHQnZnUWdWZ2NraTdSeWMzcWFMQ3g0NkxTeUVaVnJRajMiLCJtYWMiOiJjODYzMmVkNDU5YjI1NDNhMjFlMWU3NWFhYTM3MGI3NmIzY2JlM2I3MzQyOTQ1YjQzMTdiOTQxMDZkM2FiYWY4IiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,'Webkul\\Customer\\Models\\Customer',11,'2024-05-06 08:10:02','2024-05-06 08:10:02'),(52,'GET','[]','http://localhost:8000/storage/theme/1/XrX0w1NYgVf4LGozkAkbMPWMVLMmbz56COCJQSc0.webp','http://localhost:8000/','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6IkJJYTFJV1dycGdCUE9NQkVXaFk5cmc9PSIsInZhbHVlIjoicm45cEY0TWpUUlAzSkxvTUVYUUNPUTY4ZGNBSHhiRjlFOEh1UzJBRTRyKzhpVTJlYTI2bEZicUpaL0w0ckdwSmdhb3V2LzFKLzNvTWF5U05iZU5FdHR1MTVBa1ZWeHhETURML0YzV3Y1SHNlZHJiZGp6VHplK2dFRWkySElxN1giLCJtYWMiOiI0Y2M0NWRiZjQ1ZGUyMzMwYTRlYjI2NWM5MTI4YmY1YWFhNmE3YzgwYThmMjE2OWJmOTQyOTBkYmIxYzRlMzc0IiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6ImtZZFRZaTFUaW1VQnJMNE9lQW5ERmc9PSIsInZhbHVlIjoic2lSNDV3WE53cm1LVklQeFUxbkxsMVVKT08va1E5a0xZQ0FteU5vbGVTcHo0QjdwMy9COXJETHVRaWtOeVNBVTdWK055TWtHSjliWFVhK1lyVWRkSC9sVGZvSy80MndHQnZnUWdWZ2NraTdSeWMzcWFMQ3g0NkxTeUVaVnJRajMiLCJtYWMiOiJjODYzMmVkNDU5YjI1NDNhMjFlMWU3NWFhYTM3MGI3NmIzY2JlM2I3MzQyOTQ1YjQzMTdiOTQxMDZkM2FiYWY4IiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,'Webkul\\Customer\\Models\\Customer',11,'2024-05-06 08:10:02','2024-05-06 08:10:02'),(53,'GET','[]','http://localhost:8000/storage/theme/1/6djeg88iqLD7u7gl62phIGd4IES7lbXeGZcgoXdW.webp','http://localhost:8000/','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6IkJJYTFJV1dycGdCUE9NQkVXaFk5cmc9PSIsInZhbHVlIjoicm45cEY0TWpUUlAzSkxvTUVYUUNPUTY4ZGNBSHhiRjlFOEh1UzJBRTRyKzhpVTJlYTI2bEZicUpaL0w0ckdwSmdhb3V2LzFKLzNvTWF5U05iZU5FdHR1MTVBa1ZWeHhETURML0YzV3Y1SHNlZHJiZGp6VHplK2dFRWkySElxN1giLCJtYWMiOiI0Y2M0NWRiZjQ1ZGUyMzMwYTRlYjI2NWM5MTI4YmY1YWFhNmE3YzgwYThmMjE2OWJmOTQyOTBkYmIxYzRlMzc0IiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6ImtZZFRZaTFUaW1VQnJMNE9lQW5ERmc9PSIsInZhbHVlIjoic2lSNDV3WE53cm1LVklQeFUxbkxsMVVKT08va1E5a0xZQ0FteU5vbGVTcHo0QjdwMy9COXJETHVRaWtOeVNBVTdWK055TWtHSjliWFVhK1lyVWRkSC9sVGZvSy80MndHQnZnUWdWZ2NraTdSeWMzcWFMQ3g0NkxTeUVaVnJRajMiLCJtYWMiOiJjODYzMmVkNDU5YjI1NDNhMjFlMWU3NWFhYTM3MGI3NmIzY2JlM2I3MzQyOTQ1YjQzMTdiOTQxMDZkM2FiYWY4IiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,'Webkul\\Customer\\Models\\Customer',11,'2024-05-06 08:10:02','2024-05-06 08:10:02'),(54,'GET','[]','http://localhost:8000/storage/theme/1/L3ou2rnh0Y30qV6xmDoUvSBvTAldxa8YQB08CCEH.webp','http://localhost:8000/','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6IkJJYTFJV1dycGdCUE9NQkVXaFk5cmc9PSIsInZhbHVlIjoicm45cEY0TWpUUlAzSkxvTUVYUUNPUTY4ZGNBSHhiRjlFOEh1UzJBRTRyKzhpVTJlYTI2bEZicUpaL0w0ckdwSmdhb3V2LzFKLzNvTWF5U05iZU5FdHR1MTVBa1ZWeHhETURML0YzV3Y1SHNlZHJiZGp6VHplK2dFRWkySElxN1giLCJtYWMiOiI0Y2M0NWRiZjQ1ZGUyMzMwYTRlYjI2NWM5MTI4YmY1YWFhNmE3YzgwYThmMjE2OWJmOTQyOTBkYmIxYzRlMzc0IiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6ImtZZFRZaTFUaW1VQnJMNE9lQW5ERmc9PSIsInZhbHVlIjoic2lSNDV3WE53cm1LVklQeFUxbkxsMVVKT08va1E5a0xZQ0FteU5vbGVTcHo0QjdwMy9COXJETHVRaWtOeVNBVTdWK055TWtHSjliWFVhK1lyVWRkSC9sVGZvSy80MndHQnZnUWdWZ2NraTdSeWMzcWFMQ3g0NkxTeUVaVnJRajMiLCJtYWMiOiJjODYzMmVkNDU5YjI1NDNhMjFlMWU3NWFhYTM3MGI3NmIzY2JlM2I3MzQyOTQ1YjQzMTdiOTQxMDZkM2FiYWY4IiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,'Webkul\\Customer\\Models\\Customer',11,'2024-05-06 08:10:02','2024-05-06 08:10:02'),(55,'GET','[]','http://localhost:8000/storage/theme/1/IAVGQ6NnGE2oAlagjM2AaCFrDndSh5JlKIhnfaEd.webp','http://localhost:8000/','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6Ik51dkcybys2ZXlRblFTNFFYc08rL3c9PSIsInZhbHVlIjoiakJIMlRHRWxPSHY0bnZNSnJISG8rMitMVlpFSDRyZEdGWmVJY2lhYnVUNk1GTmJOU1pRYUUrcXF3VlRlYWNWbkRzSDdjMWdoWHV4ZGM1Rk12c0RqWWM2NjhUc3pMVUluUVA2U0lYSTlwanRXWUU2T01MbFlieXg4dVdTQTNWY0kiLCJtYWMiOiJmZGIyNmJlMTdmNWY5OTRlOWVkZDY2MGE3MWIzYWE0ODhlODZiNzdjMjdlOTIxMDA1N2ExZjcxMmVmNDVhODJjIiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6IlJyVjQ1QW5WdS9qYlArQU5lM2tmZFE9PSIsInZhbHVlIjoib1cwdlpFYkJHcFl5WkdYR2JTc0JaUkI5UnU0WUxtTTNqZkVzanNGNUowZWkyRjF3bnVVd01qSkdjTFNCZS9Pc2pCY0JETWZBeE91ZTA0UFBTSmNKMVVkOVJTaVErV2hra3l4bituWnY4T0Y3anExT04xQVJhamxUYnlIUFQrZGkiLCJtYWMiOiJiYzRmODhkNDdkYWUyYjYwOTYwYjEwOWQ5MmIyZDdmZDMzNWIxM2MyODRlNGUyN2RmMGY5ZDdkZTYzNTM4MjcwIiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,'Webkul\\Customer\\Models\\Customer',11,'2024-05-06 08:10:03','2024-05-06 08:10:03'),(56,'GET','[]','http://localhost:8000/eligendi-odit-qui-quis-molestiae','http://localhost:8000/','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/localhost:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6InJSMDB6OUlQYWNPY3RleWZVYktPWkE9PSIsInZhbHVlIjoiOHRxRWwyb0lxZHIzQVJCSUFWNTNXQ0RnYzJ4K0JGd2Q1dGtrSEUzWUhONHFucU1IR2w2dUZwQWtYa2JPQTFhWS92V0RKU09GNy9zL0IxeHpmbHVONjdBK2tLS2JCVWJNYW1UbEgwWVlFcjAxWVlIWVVzdkJRQnlVRTRhemNhY0siLCJtYWMiOiJkMDkyZWJmNDI5MDRlY2FkNmZjNTllNzQyNWRkNWM4ZmVhZjQ1ZDQ4YjUwMDY4YmQ0MDcxNWNlYTRjNDgwOGIzIiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6IkJEaTV3cXkzZ2JycDZ2aGxteEZJbEE9PSIsInZhbHVlIjoiUnIvc3JwODAxTk1WYUFQa25FZzhySVdKeU1Sc09rTWUyRVVOcWRRbTFQbXBNeEhlWXhkdUFnSkcvQWlTVzBncDNJUkZaWVA0bEpUdUpZWk5ocmwwNS9LSlE2aytXYU5teHRVckUvcGduN293OXhucXVOY2VjK29Xd0JsQWdmOTUiLCJtYWMiOiIwNzg3ZmUxOWEyMzYyMmEzMTVkM2NlMzUxM2QzZWZkMmFmOGMyMWY3ODJkMTVmYTQ5NzJjMGI0MTRlYTZhMDQ3IiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1','Webkul\\Product\\Models\\Product',93,'Webkul\\Customer\\Models\\Customer',11,'2024-05-06 08:10:04','2024-05-06 08:10:04'),(57,'GET','[]','http://localhost:8000/storage/locales/YuFazk3QsiQb7LqQGB9qpUAb9YTCaW9Cf2TnE2Kq.png','http://localhost:8000/eligendi-odit-qui-quis-molestiae','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/eligendi-odit-qui-quis-molestiae\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6ImtHYVRkd0JjQ3hCd3oyUjJnM296bUE9PSIsInZhbHVlIjoiRnZlR1NkMCt0RitYNTZjbmlOMGRTVFJobTE2aU0xVHpJdWdFbFEzMURIS2pSUjRPY0tvRG1MY3VpRU9HaXZwdEMzMzhQcmRRYlJITHlyc0krVlBxdDFtQXVrcG5FOFFCbW4ydWZhTGw4WGxlZ1JycWVMTWxCUExkNXFsdWhTOHkiLCJtYWMiOiIwNWI4YzAxM2ViMDc3MmYxZGE5NDkwOGFlZTdjNTZkOThlZGY0Yzg2NzQxNDI0NzNkNDQ4ZGQyNjY2ODg0MDgzIiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6Ijh4Nkc3U3p1dG9oditueklQUGc4dnc9PSIsInZhbHVlIjoia1VoZm9ydUh6R091M2JSZmhnWHRTc0xyNkYwelZoWTgyYklQTVhVZjlmZ2ltM2tOT0U0TUJWcS9mYkpzRVRKd1FWTDZDNVBweXErZnVzUHBPd2hXS21IVWNCbStHZnpnRlRVc0JVU2FwdEw2M1pyakpERXhTR04wWlNHUUEvYSsiLCJtYWMiOiJiMDJkOWU4ZWNmYTlhZTlhYjAyNDI5ZjBmYjZjMThkYmNmOGRmY2NlZjY3MDhmZmM4ZDE3MjYwMDcyOGFiZDFjIiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,'Webkul\\Customer\\Models\\Customer',11,'2024-05-06 08:10:04','2024-05-06 08:10:04'),(58,'GET','[]','http://localhost:8000/storage/locales/YuFazk3QsiQb7LqQGB9qpUAb9YTCaW9Cf2TnE2Kq.png','http://localhost:8000/eligendi-odit-qui-quis-molestiae','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/eligendi-odit-qui-quis-molestiae\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6IjVWTCtzZHNEUkx6VnpISHpzN1M4ZWc9PSIsInZhbHVlIjoiTSt2NTNPOUtpWm05T2pidEovcTNpUjkxV2EzYU1xTkVoN1Y1S1lDbjNTeVh5TkR1Z1lycGhrakhpM0NwbkFZVW9rVjN0MzVVQkR1VVVWSjJSTll1QzFTdU96VVd2aGhONkpxK25uTlBEVWFnNjJQLzEwRlppMjdNOUZONXpoVWUiLCJtYWMiOiJiMDE0Nzg3YmMzMDdjZTI4NThmNmUxOWNlOGEwOWQ0MTY1NWUwNTk2NGQ1ZGY4NWY3NDljYzE3OTE4MjhjNmM4IiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6ImkwSm9jUlZHaG1ZNHVjcnVkRkVDOGc9PSIsInZhbHVlIjoiRWhGcWpDZUZBcTFETXQ0NldvTmtMeFV4S2x3NFdDZSt0NTJwNm5MTCtIQ3o2ekliTjdPeTM3UzBXMmpXalpIUVB4TW1IU2M5dGkxKzJncVpUaytTcTVCOUZWQlU4ZG8wUmMzQlRIeDlUcURSRjQyZnFWeFJkcGJXclQwRHp5Q0UiLCJtYWMiOiIxNTRlYmRlMGEzMTkxNzk4MWMzMTY2ZGE0ZjIyMGE1ZjY3MjFjZTYwZGQ5ZDg3MDE2NWIzYTdmYjg0ZWQ2ZmU5IiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,'Webkul\\Customer\\Models\\Customer',11,'2024-05-06 08:10:04','2024-05-06 08:10:04'),(59,'GET','[]','http://localhost:8000','http://localhost:8000/checkout/cart','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/localhost:8000\\/checkout\\/cart\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6InVlT3BBUllHa0ROcG5Tcmo0RGkrZmc9PSIsInZhbHVlIjoiRUlqdkphNkRpQVpTM0pNbXQ3cHBrcEdNd2hiSnpmRGdyZ0lkL0xmTFRjNEFhamhwbFUvQ1psaVVKMmFBUEFpRlN2bVk0VW82b2IxQ08vanBRNC9NN2JVdWh4QjVlQnhWSzJxR0JzT0Z6SEZ4emtZaFpSajlETmcyejV6T3A0bFYiLCJtYWMiOiI4NDJiMDEwMmVhNjUwZTcxZjA2OGE0YWM4NGI1ZWZjZjlkMGU1M2RiZmY1ZjJiNGJkYTMxODA2NDU1ZDBiMjI1IiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6IkwxYjNuRmxoNnF0UFRJOEZlNTQ0NHc9PSIsInZhbHVlIjoicVB5ZlhJendQY3FJRE5OcFIzaVhqMmVPTlRuRGlkYkZTQnZ3ekFSdDVwRHhueHNqbU1VcERKNFI0ZHVmbFBhdnhpWFErbnRVTjJhNmJOVkZMSFZWNGgzTEdiL3h6ZFNuSFpKVVk2a2J4ZkVQZnZQQm51WjdkRnlSeTYzYXlqczYiLCJtYWMiOiI2YTU4ODdiNDhjZGFlMmMwYTM2YmYzMDk5NmE0ZmMxOWMwOTZhZTQ4NDFmMGFkZmNmNzRhMDM2NjZmYzI5YTA0IiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,'Webkul\\Customer\\Models\\Customer',11,'2024-05-06 08:10:24','2024-05-06 08:10:24'),(60,'GET','[]','http://localhost:8000/storage/locales/xpXiUaFu5GzEe5W9tzBw6JHk4z3EXOfdwcWVX3hG.png','http://localhost:8000/','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6ImdRdmJYTFVBNndpbGM5VGRkdVdjUGc9PSIsInZhbHVlIjoiUHVYSmx0YXZLcUR3UC9oaUxQODV0THdCZEtqdjFMcTBmVWlEYkpnSHk0UjBYYythM1dveGpNZUtSY0hoMnZhVkdrQ29CQmg0d095L3JuYk9SQllqTXg3Rk8yMkZmdnJLR29LWFFHTXZBNjF4amUzc2VKVlhNamZyRjVreGtVa1ciLCJtYWMiOiI4MmQwMDg4NjY4NjA2MjkwMTVmMjcxNWZkMjZiNGY3OTdhOWI3ZTlkNGRhODIyOTU4OGYyYWY0MmU4ZjY1OGRlIiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6Ik52K2FadEFiZTdvSkNZUDFITDZ3d3c9PSIsInZhbHVlIjoiamhZL1p6ZU01Slc3WmZmdDE1MnA0Ym5SYWtTTW94ekExN1BZd3VMZlpzdmduZ2hnWlE0dWVLVzlVbjdLM1cyMzYxcXdoMloxYXlXMEhoeDJKZE1HdXJteGlFNVRWRHZlMERPTDNKVGlqZHNHdEQ5cWxpZXpldFdYcC9IeTNjTm4iLCJtYWMiOiJlYWM0YzZiODNhMGUwNTYwMzNjYTI4ZWE3M2FjYWE0ZTRkNTY5MzAwYzZjM2EyODhhMDRkN2M5ZjBkN2U5ZDJmIiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,'Webkul\\Customer\\Models\\Customer',11,'2024-05-06 08:10:24','2024-05-06 08:10:24'),(61,'GET','[]','http://localhost:8000/storage/locales/xpXiUaFu5GzEe5W9tzBw6JHk4z3EXOfdwcWVX3hG.png','http://localhost:8000/','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6IlpwNzRUd0hzZlMxMHBMdEljZmtYcGc9PSIsInZhbHVlIjoibUh3dFhFQlQ3TVB5MjVGN2FCZDlhM0VUbkFVMkxaYWRmNXFETnE2ck15Sk12NWpGaW9BdlJjcVZFWlAvRjdZS29MOEhJYmgzY1dTSDJNRlUzdVRURStsT0FhVlhNS200eElHYVVKS1VvbjFwVnc5ZDhWVzFXR2pvam5STFoyVzIiLCJtYWMiOiIzYWZjYjJlMDk3NGRlODNhODc3MWIyYmZkOGI2ZmNjYTQxMjc4ZjEwZTAyYTJmYjgwMTA0ZWYzZjY5NmUwMGI0IiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6Ik9oRFIzekM3SmVrdEZOeHh0ZjJJWmc9PSIsInZhbHVlIjoiemZURzZQenJZaXF5bzBRRjVjblN6SDhPVmVCQmxhOU0wbTlVd1ZSOVJFcloyK0FRbG11dkVVd3BRMWc2R21IdkUremQ4U25BdU1YWDRUNTJQSklzOHZYTUp4NGNyWHZ1NWphSGkxV29UVXVTem5QSHN6SlY1TWRuYXJSeDRRdEciLCJtYWMiOiI1NzVmZWYwOTUyMzU2YzUzM2E5YzJkMWE5YmY0ZWQ2OGQyNzIxYjYzZDNmMzA1ODMxZWI4YTRlN2UwNzE2YjE1IiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,'Webkul\\Customer\\Models\\Customer',11,'2024-05-06 08:10:24','2024-05-06 08:10:24'),(62,'GET','[]','http://localhost:8000/storage/locales/YuFazk3QsiQb7LqQGB9qpUAb9YTCaW9Cf2TnE2Kq.png','http://localhost:8000/','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6IjFmTWY0ajQ0WEFYY1gycVk5cmo3R2c9PSIsInZhbHVlIjoiNjUyMy9TYW5YVmVseWE1YmhQWnJmbTloSWdYTDc2TVVZRFU4SzRoTVk0ZFpmMmE4ejlDR25NZm52elRqd21EM0tJR0YxeHcvTUkzak05SVZrR1hBSW5HREtnVHI4NldlWVVVOTE3RytsUG1RTERvKzdnVi9rbjd1Yy9iKzJDVVQiLCJtYWMiOiI0MjBjYTBkMTQ3NzdjOTA3M2VlN2Y5ZTFlMGU2MjAzOGQzMzdlZDBjODgzMDQ0YWM5ZDQ3YzkwMDQyYjk2MDA1IiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6IlA2Yk9CU1pOM0RmRmwyL1MyQ2RXU2c9PSIsInZhbHVlIjoiUTVYOTVSWjlIbktCTXFLQkR5eW40dXhWRFhJVExQSVlPY09WVVJ2SHFGNytjaWN1VVpuQVYwdHZ3NXFJL3NDUW5GenZaQStJQWI1TENnOWdxektqYTFwME1PY2ZrT09TL1hESHN4VXFhcjhNQWEzZVhVTFRtenVhdUhsMGV2Qk8iLCJtYWMiOiI0OTQ4Yjg0YjdkZDUwYWE2MzAyY2U5YjVhNWU0NDk0ZThiODUxNzg2NmNmODVjY2E5NjQ0MGY4MWNmYTNjMzZkIiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,'Webkul\\Customer\\Models\\Customer',11,'2024-05-06 08:10:25','2024-05-06 08:10:25'),(63,'GET','[]','http://localhost:8000/storage/theme/1/XrX0w1NYgVf4LGozkAkbMPWMVLMmbz56COCJQSc0.webp','http://localhost:8000/','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6IjFmTWY0ajQ0WEFYY1gycVk5cmo3R2c9PSIsInZhbHVlIjoiNjUyMy9TYW5YVmVseWE1YmhQWnJmbTloSWdYTDc2TVVZRFU4SzRoTVk0ZFpmMmE4ejlDR25NZm52elRqd21EM0tJR0YxeHcvTUkzak05SVZrR1hBSW5HREtnVHI4NldlWVVVOTE3RytsUG1RTERvKzdnVi9rbjd1Yy9iKzJDVVQiLCJtYWMiOiI0MjBjYTBkMTQ3NzdjOTA3M2VlN2Y5ZTFlMGU2MjAzOGQzMzdlZDBjODgzMDQ0YWM5ZDQ3YzkwMDQyYjk2MDA1IiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6IlA2Yk9CU1pOM0RmRmwyL1MyQ2RXU2c9PSIsInZhbHVlIjoiUTVYOTVSWjlIbktCTXFLQkR5eW40dXhWRFhJVExQSVlPY09WVVJ2SHFGNytjaWN1VVpuQVYwdHZ3NXFJL3NDUW5GenZaQStJQWI1TENnOWdxektqYTFwME1PY2ZrT09TL1hESHN4VXFhcjhNQWEzZVhVTFRtenVhdUhsMGV2Qk8iLCJtYWMiOiI0OTQ4Yjg0YjdkZDUwYWE2MzAyY2U5YjVhNWU0NDk0ZThiODUxNzg2NmNmODVjY2E5NjQ0MGY4MWNmYTNjMzZkIiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,'Webkul\\Customer\\Models\\Customer',11,'2024-05-06 08:10:25','2024-05-06 08:10:25'),(64,'GET','[]','http://localhost:8000/storage/theme/1/6djeg88iqLD7u7gl62phIGd4IES7lbXeGZcgoXdW.webp','http://localhost:8000/','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6IjFmTWY0ajQ0WEFYY1gycVk5cmo3R2c9PSIsInZhbHVlIjoiNjUyMy9TYW5YVmVseWE1YmhQWnJmbTloSWdYTDc2TVVZRFU4SzRoTVk0ZFpmMmE4ejlDR25NZm52elRqd21EM0tJR0YxeHcvTUkzak05SVZrR1hBSW5HREtnVHI4NldlWVVVOTE3RytsUG1RTERvKzdnVi9rbjd1Yy9iKzJDVVQiLCJtYWMiOiI0MjBjYTBkMTQ3NzdjOTA3M2VlN2Y5ZTFlMGU2MjAzOGQzMzdlZDBjODgzMDQ0YWM5ZDQ3YzkwMDQyYjk2MDA1IiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6IlA2Yk9CU1pOM0RmRmwyL1MyQ2RXU2c9PSIsInZhbHVlIjoiUTVYOTVSWjlIbktCTXFLQkR5eW40dXhWRFhJVExQSVlPY09WVVJ2SHFGNytjaWN1VVpuQVYwdHZ3NXFJL3NDUW5GenZaQStJQWI1TENnOWdxektqYTFwME1PY2ZrT09TL1hESHN4VXFhcjhNQWEzZVhVTFRtenVhdUhsMGV2Qk8iLCJtYWMiOiI0OTQ4Yjg0YjdkZDUwYWE2MzAyY2U5YjVhNWU0NDk0ZThiODUxNzg2NmNmODVjY2E5NjQ0MGY4MWNmYTNjMzZkIiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,'Webkul\\Customer\\Models\\Customer',11,'2024-05-06 08:10:25','2024-05-06 08:10:25'),(65,'GET','[]','http://localhost:8000/storage/theme/1/L3ou2rnh0Y30qV6xmDoUvSBvTAldxa8YQB08CCEH.webp','http://localhost:8000/','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6IjFmTWY0ajQ0WEFYY1gycVk5cmo3R2c9PSIsInZhbHVlIjoiNjUyMy9TYW5YVmVseWE1YmhQWnJmbTloSWdYTDc2TVVZRFU4SzRoTVk0ZFpmMmE4ejlDR25NZm52elRqd21EM0tJR0YxeHcvTUkzak05SVZrR1hBSW5HREtnVHI4NldlWVVVOTE3RytsUG1RTERvKzdnVi9rbjd1Yy9iKzJDVVQiLCJtYWMiOiI0MjBjYTBkMTQ3NzdjOTA3M2VlN2Y5ZTFlMGU2MjAzOGQzMzdlZDBjODgzMDQ0YWM5ZDQ3YzkwMDQyYjk2MDA1IiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6IlA2Yk9CU1pOM0RmRmwyL1MyQ2RXU2c9PSIsInZhbHVlIjoiUTVYOTVSWjlIbktCTXFLQkR5eW40dXhWRFhJVExQSVlPY09WVVJ2SHFGNytjaWN1VVpuQVYwdHZ3NXFJL3NDUW5GenZaQStJQWI1TENnOWdxektqYTFwME1PY2ZrT09TL1hESHN4VXFhcjhNQWEzZVhVTFRtenVhdUhsMGV2Qk8iLCJtYWMiOiI0OTQ4Yjg0YjdkZDUwYWE2MzAyY2U5YjVhNWU0NDk0ZThiODUxNzg2NmNmODVjY2E5NjQ0MGY4MWNmYTNjMzZkIiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,'Webkul\\Customer\\Models\\Customer',11,'2024-05-06 08:10:25','2024-05-06 08:10:25'),(66,'GET','[]','http://localhost:8000/storage/theme/1/IAVGQ6NnGE2oAlagjM2AaCFrDndSh5JlKIhnfaEd.webp','http://localhost:8000/','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6IjFmTWY0ajQ0WEFYY1gycVk5cmo3R2c9PSIsInZhbHVlIjoiNjUyMy9TYW5YVmVseWE1YmhQWnJmbTloSWdYTDc2TVVZRFU4SzRoTVk0ZFpmMmE4ejlDR25NZm52elRqd21EM0tJR0YxeHcvTUkzak05SVZrR1hBSW5HREtnVHI4NldlWVVVOTE3RytsUG1RTERvKzdnVi9rbjd1Yy9iKzJDVVQiLCJtYWMiOiI0MjBjYTBkMTQ3NzdjOTA3M2VlN2Y5ZTFlMGU2MjAzOGQzMzdlZDBjODgzMDQ0YWM5ZDQ3YzkwMDQyYjk2MDA1IiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6IlA2Yk9CU1pOM0RmRmwyL1MyQ2RXU2c9PSIsInZhbHVlIjoiUTVYOTVSWjlIbktCTXFLQkR5eW40dXhWRFhJVExQSVlPY09WVVJ2SHFGNytjaWN1VVpuQVYwdHZ3NXFJL3NDUW5GenZaQStJQWI1TENnOWdxektqYTFwME1PY2ZrT09TL1hESHN4VXFhcjhNQWEzZVhVTFRtenVhdUhsMGV2Qk8iLCJtYWMiOiI0OTQ4Yjg0YjdkZDUwYWE2MzAyY2U5YjVhNWU0NDk0ZThiODUxNzg2NmNmODVjY2E5NjQ0MGY4MWNmYTNjMzZkIiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,'Webkul\\Customer\\Models\\Customer',11,'2024-05-06 08:10:25','2024-05-06 08:10:25'),(67,'GET','[]','http://localhost:8000','http://localhost:8000/checkout/cart','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/localhost:8000\\/checkout\\/cart\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6IkJYd3pGWDF5MU11V0tKUnhLaWdQWVE9PSIsInZhbHVlIjoiMVBYOWd5WTR4TXRtbThZRFM2OEJQWE5FTmFTMWxLWkMxY2daME9yNWpUUFBCRXVnVDI4dWhaM0ZDYXdHZmQwTFloblJnRk8zS0U0R1IzaytzYW51ODJINDdOeEJkSkRKOXdqVmZmdEtNQjIzZFNWZmVJQ1BSTCt1NGxOOHVDUzYiLCJtYWMiOiJmOThkNGQyYzM3MzZiMTA2YjNiZTc4MTYyNDYyNjc1ZmUzNzRmNDNhOGI3YTg5MzE1MWY0Mzc2YzhmMTc5NjZkIiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6Ik5POTFHL08vem5lVG5Ed29JOWIyVWc9PSIsInZhbHVlIjoiNG00S2xHTUZ4T0dGQkhncUwvUkxOL2tYbzRaQm55azkybGIxT0pJYjEva1pHeG1XN3ozaTZSdSsyNitHd1VTcVNOYmtPRHJOYWJPOU42TlVJMjV6OWxRS3ExbHpOTUR1VEJ3Tmg2aCtGbzgrM3hNVGRJRnJRRDFmai9qSGl5TUUiLCJtYWMiOiI1YTA1ZDBkZDBhMThkMGFjYzQxNGM0MDFiMDcyZmEzMjk5NzJlZWM1ZjRmZWUzZWFkMGJiZjM3ZGE0NThiZTJiIiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,'Webkul\\Customer\\Models\\Customer',11,'2024-05-06 08:11:21','2024-05-06 08:11:21'),(68,'GET','[]','http://localhost:8000/storage/locales/xpXiUaFu5GzEe5W9tzBw6JHk4z3EXOfdwcWVX3hG.png','http://localhost:8000/','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6ImJ1VUJqYWxSUmg1Z0NyRFIyc1BuNXc9PSIsInZhbHVlIjoiYTZaaW0zQW5XanhqMHo2YUFsVEVNNkowSnNVdXF0aXRDTG1XSWdwMlFya0xYdytsMlJZRG9LS0lPS0NzMVVpcmdDRG9NRVZ4RGNoT0NGYi8xQW8wUmpVQjd2MkxkMHJmbUxtSGs5T3NOQ3UxUjhWTG96MmdkSEdvaS8wdk8xWEgiLCJtYWMiOiI0YTJmMTM0ZGMxZGFlOWM0MTA4MjRjMDI0OTE5YWEwODlmOTkyMzEyOWQ1MGY2OTljMDE3MmMxZTdjMTgwOGQ3IiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6ImpuQ3Q0MkJ4ZG53ZGVxeHlTY04xNUE9PSIsInZhbHVlIjoiRWxXNDg1S3M0YkFnS3UrR1BLYkVnZVNmRDhOMUMzUURlcUNlMEp3VnAxMnZWN3Y5a1ZEQ09DR1pUN2hVV1hYMjNRa3MvRXNiaGhCM3pVWklVU2UrMGJWSmphWFN1R2R1cEwxZm9saTNoNlZjTzk0cERnTTBDMnlRVmQ2K3FQRG4iLCJtYWMiOiJjZjAwOWVmZTVhNzRjNWU1MzNmYjY2ZjlhNDI3MzViMjAyZjUwNjk5MTMxYzIxMzIxNGQ4NTFhODYwNWNjYWJiIiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,'Webkul\\Customer\\Models\\Customer',11,'2024-05-06 08:11:21','2024-05-06 08:11:21'),(69,'GET','[]','http://localhost:8000/storage/locales/xpXiUaFu5GzEe5W9tzBw6JHk4z3EXOfdwcWVX3hG.png','http://localhost:8000/','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6Ijkzc0xMeE9uMWY5ejJXdWJzUWg3ZHc9PSIsInZhbHVlIjoiTkQ4ektJQnZOSmlMZWg5eFZtZVcvdjllVmV3RUV1Q3U0M2dhZndvNWZFMkFwazNPQ282Z1JBN3pqU1h6M1k1V2hOTEpRdnJ6TndyYU5pZkFSeXVoNHRxTzhBY2VIVFkzVGhOMEZvWjJ0VzRCOW1rYU16UmVkdUszR294YzVEQmIiLCJtYWMiOiJjODJmYjBhODAyZGE5NDlkZGQ1NzZlZjdkZTZkNjkwNjRmOGU2NDBhYmZhZjJlYzIwNzQxM2VlMmNmMDkxMmMxIiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6IkpISFM4NmlwUVFLSC9ibEs5dTJpb2c9PSIsInZhbHVlIjoiZmlsdDNvdU9JbXZxTnc2dU5kUUJpOHQzbzN2NjdibkVUK241ZW81K0xOblpqUjlTdjVsVkc4TzVOVkVwMWJyRTVJMyt4Smkxd29OZEVuRzhFenF6cE1sUGVTRjlwQTI3clhJMHhyQjRhbmNDeVdUVmJpNVh2cFRiV2h5cU0ycngiLCJtYWMiOiIwYzk0OGE2YTNkZjNiOGEzNmVhMzVlNDkwMWQ3NzdmYzBiMGJhNmViYWZmNDFmZTQ2YTFhODcxNmE1NjJkZWZiIiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,'Webkul\\Customer\\Models\\Customer',11,'2024-05-06 08:11:22','2024-05-06 08:11:22'),(70,'GET','[]','http://localhost:8000/storage/locales/YuFazk3QsiQb7LqQGB9qpUAb9YTCaW9Cf2TnE2Kq.png','http://localhost:8000/','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6IjFocEFMRUZ3dWgrbFUzdWhQM2F4Y3c9PSIsInZhbHVlIjoiYUJHS0lKK29NOWVRWCtCWDVoNE5EdVlpYjlHMjloL2pqL2ZCTVZiZ1RzWlppRlhJZWdwcHpRQk5KYVhnMGR4U2RCZ29oQnE5U1VFSGVLUGtiY3lKeDZsSzRiUkw2SWZLR1F2bGZxQTVhamM3TTMweFJnVk1STzJEVUROY2JiR2EiLCJtYWMiOiI4ZGRkZTU3MmUwOWNhNTI4YmJiZWU4NDU4M2IxYTNmMmM4ZTEzMzMzMjBiNzVjNzJiM2IyYTUwYTEwNmE2NzY3IiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6Ik1PeHozeG5LQmhQZmRPaXFKT0trdlE9PSIsInZhbHVlIjoiOGkrSEQrcjR5MTdQbDY2Zm05eE95cmpqY2crN28xMmYvWHkvSFJhVm1GSUlxSGJPbmR4S2sxNC83NitUU2FGNWtPejM0cHJ3NGlKVzc2YldPajIzMW5Jb095QUdxS1YwazBlK1JqVVdrNm5jVzJDTmlkalNVWk02QlZWU0RCcDkiLCJtYWMiOiI2NjIyYWU3YjY2Yzk3ODAzYWM3ZjNkMjQwNTFkOWQzMTFlMzFiOGQxMDc3YWVmMDNjNGIyMjQ4MGE4YjdmNzkzIiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,'Webkul\\Customer\\Models\\Customer',11,'2024-05-06 08:11:22','2024-05-06 08:11:22'),(71,'GET','[]','http://localhost:8000/storage/theme/1/XrX0w1NYgVf4LGozkAkbMPWMVLMmbz56COCJQSc0.webp','http://localhost:8000/','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6IjFocEFMRUZ3dWgrbFUzdWhQM2F4Y3c9PSIsInZhbHVlIjoiYUJHS0lKK29NOWVRWCtCWDVoNE5EdVlpYjlHMjloL2pqL2ZCTVZiZ1RzWlppRlhJZWdwcHpRQk5KYVhnMGR4U2RCZ29oQnE5U1VFSGVLUGtiY3lKeDZsSzRiUkw2SWZLR1F2bGZxQTVhamM3TTMweFJnVk1STzJEVUROY2JiR2EiLCJtYWMiOiI4ZGRkZTU3MmUwOWNhNTI4YmJiZWU4NDU4M2IxYTNmMmM4ZTEzMzMzMjBiNzVjNzJiM2IyYTUwYTEwNmE2NzY3IiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6Ik1PeHozeG5LQmhQZmRPaXFKT0trdlE9PSIsInZhbHVlIjoiOGkrSEQrcjR5MTdQbDY2Zm05eE95cmpqY2crN28xMmYvWHkvSFJhVm1GSUlxSGJPbmR4S2sxNC83NitUU2FGNWtPejM0cHJ3NGlKVzc2YldPajIzMW5Jb095QUdxS1YwazBlK1JqVVdrNm5jVzJDTmlkalNVWk02QlZWU0RCcDkiLCJtYWMiOiI2NjIyYWU3YjY2Yzk3ODAzYWM3ZjNkMjQwNTFkOWQzMTFlMzFiOGQxMDc3YWVmMDNjNGIyMjQ4MGE4YjdmNzkzIiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,'Webkul\\Customer\\Models\\Customer',11,'2024-05-06 08:11:22','2024-05-06 08:11:22'),(72,'GET','[]','http://localhost:8000/storage/theme/1/6djeg88iqLD7u7gl62phIGd4IES7lbXeGZcgoXdW.webp','http://localhost:8000/','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6IjFocEFMRUZ3dWgrbFUzdWhQM2F4Y3c9PSIsInZhbHVlIjoiYUJHS0lKK29NOWVRWCtCWDVoNE5EdVlpYjlHMjloL2pqL2ZCTVZiZ1RzWlppRlhJZWdwcHpRQk5KYVhnMGR4U2RCZ29oQnE5U1VFSGVLUGtiY3lKeDZsSzRiUkw2SWZLR1F2bGZxQTVhamM3TTMweFJnVk1STzJEVUROY2JiR2EiLCJtYWMiOiI4ZGRkZTU3MmUwOWNhNTI4YmJiZWU4NDU4M2IxYTNmMmM4ZTEzMzMzMjBiNzVjNzJiM2IyYTUwYTEwNmE2NzY3IiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6Ik1PeHozeG5LQmhQZmRPaXFKT0trdlE9PSIsInZhbHVlIjoiOGkrSEQrcjR5MTdQbDY2Zm05eE95cmpqY2crN28xMmYvWHkvSFJhVm1GSUlxSGJPbmR4S2sxNC83NitUU2FGNWtPejM0cHJ3NGlKVzc2YldPajIzMW5Jb095QUdxS1YwazBlK1JqVVdrNm5jVzJDTmlkalNVWk02QlZWU0RCcDkiLCJtYWMiOiI2NjIyYWU3YjY2Yzk3ODAzYWM3ZjNkMjQwNTFkOWQzMTFlMzFiOGQxMDc3YWVmMDNjNGIyMjQ4MGE4YjdmNzkzIiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,'Webkul\\Customer\\Models\\Customer',11,'2024-05-06 08:11:23','2024-05-06 08:11:23'),(73,'GET','[]','http://localhost:8000/storage/theme/1/L3ou2rnh0Y30qV6xmDoUvSBvTAldxa8YQB08CCEH.webp','http://localhost:8000/','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6IjFocEFMRUZ3dWgrbFUzdWhQM2F4Y3c9PSIsInZhbHVlIjoiYUJHS0lKK29NOWVRWCtCWDVoNE5EdVlpYjlHMjloL2pqL2ZCTVZiZ1RzWlppRlhJZWdwcHpRQk5KYVhnMGR4U2RCZ29oQnE5U1VFSGVLUGtiY3lKeDZsSzRiUkw2SWZLR1F2bGZxQTVhamM3TTMweFJnVk1STzJEVUROY2JiR2EiLCJtYWMiOiI4ZGRkZTU3MmUwOWNhNTI4YmJiZWU4NDU4M2IxYTNmMmM4ZTEzMzMzMjBiNzVjNzJiM2IyYTUwYTEwNmE2NzY3IiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6Ik1PeHozeG5LQmhQZmRPaXFKT0trdlE9PSIsInZhbHVlIjoiOGkrSEQrcjR5MTdQbDY2Zm05eE95cmpqY2crN28xMmYvWHkvSFJhVm1GSUlxSGJPbmR4S2sxNC83NitUU2FGNWtPejM0cHJ3NGlKVzc2YldPajIzMW5Jb095QUdxS1YwazBlK1JqVVdrNm5jVzJDTmlkalNVWk02QlZWU0RCcDkiLCJtYWMiOiI2NjIyYWU3YjY2Yzk3ODAzYWM3ZjNkMjQwNTFkOWQzMTFlMzFiOGQxMDc3YWVmMDNjNGIyMjQ4MGE4YjdmNzkzIiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,'Webkul\\Customer\\Models\\Customer',11,'2024-05-06 08:11:23','2024-05-06 08:11:23'),(74,'GET','[]','http://localhost:8000/storage/theme/1/IAVGQ6NnGE2oAlagjM2AaCFrDndSh5JlKIhnfaEd.webp','http://localhost:8000/','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6IjFocEFMRUZ3dWgrbFUzdWhQM2F4Y3c9PSIsInZhbHVlIjoiYUJHS0lKK29NOWVRWCtCWDVoNE5EdVlpYjlHMjloL2pqL2ZCTVZiZ1RzWlppRlhJZWdwcHpRQk5KYVhnMGR4U2RCZ29oQnE5U1VFSGVLUGtiY3lKeDZsSzRiUkw2SWZLR1F2bGZxQTVhamM3TTMweFJnVk1STzJEVUROY2JiR2EiLCJtYWMiOiI4ZGRkZTU3MmUwOWNhNTI4YmJiZWU4NDU4M2IxYTNmMmM4ZTEzMzMzMjBiNzVjNzJiM2IyYTUwYTEwNmE2NzY3IiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6Ik1PeHozeG5LQmhQZmRPaXFKT0trdlE9PSIsInZhbHVlIjoiOGkrSEQrcjR5MTdQbDY2Zm05eE95cmpqY2crN28xMmYvWHkvSFJhVm1GSUlxSGJPbmR4S2sxNC83NitUU2FGNWtPejM0cHJ3NGlKVzc2YldPajIzMW5Jb095QUdxS1YwazBlK1JqVVdrNm5jVzJDTmlkalNVWk02QlZWU0RCcDkiLCJtYWMiOiI2NjIyYWU3YjY2Yzk3ODAzYWM3ZjNkMjQwNTFkOWQzMTFlMzFiOGQxMDc3YWVmMDNjNGIyMjQ4MGE4YjdmNzkzIiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,'Webkul\\Customer\\Models\\Customer',11,'2024-05-06 08:11:23','2024-05-06 08:11:23'),(75,'GET','[]','http://localhost:8000/quia-deserunt-consectetur-a-et-veritatis','http://localhost:8000/','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/localhost:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6IktuenlRTGF5VGVRM0poSkxDNHhFbkE9PSIsInZhbHVlIjoieGkvNExhNm5wZ1hSZS9NL0YzTGt6U3hDZHR1WXF3eW9LTkd6WHZiQjNrRXhuLzgzc1NubWkzd2VZVXJJREdSZnFGRHBUY0h6NWxud0JNdnpBdnY2aFdMUlQwQVRuVG1wazNHa00rUEdMNHJkd1NYZkx1L2Zac3VPSkpPVU5Db2UiLCJtYWMiOiI5MzZlMjFjMDlkZjI2MDYzMjAyNWUyODc3OWEwNmNmOTc5MmM5NTQ0ZmVhOTIyNDk2NzdkOWEwYjU3OGEyMzczIiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6Ikh4eHdJWEdjSEhCaTZDQW5ZV2F0NXc9PSIsInZhbHVlIjoibGFCOFJua0JLR29wVlc5OG9VYUpTcUhBUVBUd2ZkMlhRbTV5OVUwQkZqM1V4emFIS3hkMW1neEVpdVoxaGt3ejZqTGttMzhMekNIM2ZqMktoSzVHS3luTWg5RTJRdkVXUnErbzJRY3FNMzFOd2JxVDM1Smh4ZEh4dy9BQldFaWMiLCJtYWMiOiJmNzNlMmMwMmU1OGE5OTVmNzhmNjI4YjUyYzYxOTNjMTMwMTc0NWM4MzlmZDkxNTU5NDc3YWVkNjJlMjgxY2VjIiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1','Webkul\\Category\\Models\\Category',10,'Webkul\\Customer\\Models\\Customer',11,'2024-05-06 08:11:26','2024-05-06 08:11:26'),(76,'GET','[]','http://localhost:8000/storage/locales/YuFazk3QsiQb7LqQGB9qpUAb9YTCaW9Cf2TnE2Kq.png','http://localhost:8000/quia-deserunt-consectetur-a-et-veritatis','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/quia-deserunt-consectetur-a-et-veritatis\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6ImtkcGUwY0ptWlAyWlVKVnFYQUJtSlE9PSIsInZhbHVlIjoiL29YZ1oxT0RTb1pPRFFUekpvcTdlZlp5Uk11TURUc0pEWkNaV3E4TWpQMXk4TkxjR0FheHllMkxnb24wZ0JQWGhHOTBxd2k2aUw3WWZTSUlxYTJNT0JZN0xrRzUveXl0djN2bExmMjBXTnB1RHU5QzY5R1VYWFI3czJKYWk5ODIiLCJtYWMiOiIwOGExMWM5NTkzY2QzNDJlNDg5OTEzNmZlMDdkOWM5ZjM0OGRmNjQ3ZTU2OGU1NmY3YWEwOTc1MTFiYWU3Njc4IiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6IitOV2pSbE10akFUQVhXZDlmUzc5aGc9PSIsInZhbHVlIjoiOEcwVlNFc2ZCOGt0Qm9Vb0k0SDZ5OGkwbXluR3BnbENVd2VVUnN3dWFwYlpBSElWZ1lpVzI5OTJacXQxRjdOOVFrbWhMODRFZzlDR1lkSy9sMXpOOHJ4TXpvcmp3NGJlaGh3K1dUcmNGTW16MnQ3Mlo4cUtXZHo4NWRYRmVPaHkiLCJtYWMiOiJhYjY0YzNhNjA2OGE0YjA5NGI0MDBkMmE1MzU5ZTYyYWYyM2Y2YzA1NDQ4NGE2NGJjYjg5MzQ1MjcyNmRkYjI1IiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,'Webkul\\Customer\\Models\\Customer',11,'2024-05-06 08:11:26','2024-05-06 08:11:26'),(77,'GET','[]','http://localhost:8000/storage/locales/YuFazk3QsiQb7LqQGB9qpUAb9YTCaW9Cf2TnE2Kq.png','http://localhost:8000/quia-deserunt-consectetur-a-et-veritatis','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/quia-deserunt-consectetur-a-et-veritatis\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6IlpJVGpBbWw2WWg5dHVnSEpHZkVJd2c9PSIsInZhbHVlIjoiVWdBQmJoanRWbXNwc1ptWFpGcXd2TS9Wdjc2UG5jeG1QQUN6bU80MGNpTWl5VHZDeE8yazJyamw1d25WVk5IcmlZeGZaOE1JL3UrTWlpaU9kbE1BRzg3VnFoZk1aUnBRZ2g3Tkhabk5ZVlpzMlUyVlhlVE5NWFVXYThuZmhSQUciLCJtYWMiOiIxYjRlMmI3N2RmZWVkZTE1NzA0NWUxMDUxNDJkZmI0NTRhMGQ0OTg5ZDBlMjRlM2I4NjA4ZDQ4ZTE4NDA0YTBkIiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6IjVMVWVLTTF6L1pOcGVyRmNYbVVmSGc9PSIsInZhbHVlIjoiMUFsMVlxVjJ5Z0hDTEY2UzRiMkFMU0ZicUlsd3IyRmpPZjFuVzdvMStOeWgzcE9vTVEvdTl3eW0zV21KV0diSHlVbHQ4NU9Ub1MwUll5ZER2aTRZbjduMW82YzlwbmhRdEVZWXdoNXBiN2NvYm9FWjMxeERTcDJFRVpFOWtuUEEiLCJtYWMiOiIxOTA0NzQxYzUxYmI2NDJkZWI2YWMyZjc1MjQyZmJkM2VkOTE5NTMzNjgxOTFmNjUzNDFiM2JkMzZiYWRmZGRjIiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,'Webkul\\Customer\\Models\\Customer',11,'2024-05-06 08:11:26','2024-05-06 08:11:26'),(78,'GET','[]','http://localhost:8000/ratione-voluptatibus-aliquam-et-illum-qui-quaerat','http://localhost:8000/quia-deserunt-consectetur-a-et-veritatis','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/localhost:8000\\/quia-deserunt-consectetur-a-et-veritatis\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6IjFsaEorY2llbUV5SGRqRC9aUHBlaHc9PSIsInZhbHVlIjoiQU9yNC9ZMDNUTmdhTVNUVWxoZ0xZMjBqQzI3bm01MlVxN1AwNWRmUm55a2dHNml1eGV4WGE4VWJISmZpL3Z5eDBTQWFrZlpvK0FEYzdqMDhnUS9DL0paSWVyM0lWMk1OVk5tTmhBQ0lPaVpNd1lyTDJobHFqWnNicElFNWdFYmkiLCJtYWMiOiJmZTEwZmViN2YxNzJjMjM5MjgxZWQ1MzNlMGEzMTgwYjJjYTQyMmEwY2FhODdiMGZmZGIyMjZiZmM4OGE1ZDAzIiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6ImRseGZvRjh3UDhOaWxpZjc2NzBQOXc9PSIsInZhbHVlIjoiRWkwd0N4NUJFVmhVL2xVTnE1WDlCdm5RVW1VVDV2dmQ4OFJRcFQvaU1iNmMzTmpYM1Q0ektLMndyQjJOUjFwVXJDUnBxYkRzM3VtcUQ3ZGNHeWVxYlRHYWtzdFNxUGN2cDhpT2svYm4rRzlaRVlWT2hRc3BFUjdOaWVPUWlib1giLCJtYWMiOiIxNGJkNDdiOWE3Yjk1MzJlMTg0NDNhYjU4MmEwMGM1M2I1MzAzODFkZDM0MWY5MTQ2YjM3Njk5MjBjOTQ3OTVmIiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1','Webkul\\Product\\Models\\Product',39,'Webkul\\Customer\\Models\\Customer',11,'2024-05-06 08:11:27','2024-05-06 08:11:27'),(79,'GET','[]','http://localhost:8000/storage/locales/YuFazk3QsiQb7LqQGB9qpUAb9YTCaW9Cf2TnE2Kq.png','http://localhost:8000/ratione-voluptatibus-aliquam-et-illum-qui-quaerat','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/ratione-voluptatibus-aliquam-et-illum-qui-quaerat\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6Ik5VQ2FxUXRTMStDcHFGWE1xRWpvdlE9PSIsInZhbHVlIjoiRTFmVzU3VDl2T1oyTW1HUnZ0TWJmK1d2bUNCajZFWXlKaWw2ckpEOXdVcVhUUHRxTEdjMmlTVWZMdkZWVjJsU0pMR3pnVy80d1hiT1lpV3FmTG5EamJqS1NoUmppS2srR1k3YUxOTDBid3BGWVhPQVZhWWtvbWlUM0Y4VkJEL0giLCJtYWMiOiJlNTZkZDIxM2M2Yjg2ODU0MDZiYjJmMjExYzE5NWZjYTllZmZhYjMwMjI2NWZlOGQ2ZDBlY2JlMzAyOTY2MTA1IiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6IjRmL2szWWpXREZJSzYzOVhnR2JHTlE9PSIsInZhbHVlIjoiZk11T3FYZnBvTitjRDNLMmFwalVXUVBaNVFvOTUzM1pYaC9WbmZjamg4NHU3dW9qVzNwYlV0UXNQV25YeTJxbXFEaTVnZ3J3UkN6WmJJUU52dm9icjZvNTA5RTk2Z2RoNnF1ZTRUVzJZeHRoYXo2anRIcTZFRkV2QmhsRVp4YXUiLCJtYWMiOiJhYmQwYjYwNjhmMmU0ZTRjOGQ2M2Y0MWJmMWI2ZjVmMzE5ZGNiYjk2ZGVlZWI3MDg1Mzg4NTI1NDZkMzE4Nzg0IiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,'Webkul\\Customer\\Models\\Customer',11,'2024-05-06 08:11:27','2024-05-06 08:11:27'),(80,'GET','[]','http://localhost:8000/storage/locales/YuFazk3QsiQb7LqQGB9qpUAb9YTCaW9Cf2TnE2Kq.png','http://localhost:8000/ratione-voluptatibus-aliquam-et-illum-qui-quaerat','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/ratione-voluptatibus-aliquam-et-illum-qui-quaerat\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6IjlUcWU4VEd5R0QvN09mRXl2b0ttSmc9PSIsInZhbHVlIjoiOHI3bStoRlkxZkdxNDBYckQrTUp1amlLUm04ditXMzFuOG1wQVBlTGcwbjRsR0tUK0tKZ1EyZWUvRTduUEtzNnZ4WXB2dTFmbUtCQ3pOL3B2RnZUU2R5VHRISUx6bDJDSlE2QUVmR3pvK1JiQm5vTEVlTElrTmxLRm9PYXJCeGQiLCJtYWMiOiJjY2RmNTZmYzQ3MDNjNzZkMGZiNzUxOWIzYjZlMDNmODEyYTczYjE2ODY2ZWY4ZDc0YmFkY2VhYzk2ZDdkYWUxIiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6ImpPVXJmY2ZWK244ZHovQWE1QjF5cEE9PSIsInZhbHVlIjoiNjRycUpBQ2g3YXBqL2d4QWlzc0lYNVZYYnVEM3NrNEw4dkJJZG55bk5GMklRUXFLbjQxVW1wc3hlYTk2Y0ZwcVNEQkhsKzYwaW5FSlpiMkhlSDZxSFZQYUR1RytLUEFhL1lVaGNKVW9OOHl3blc5NGpPTE8vdmsvVmxsOEVuUUUiLCJtYWMiOiJlM2U3OWZlMzIxZWRkNDdlODY3ZDRiMmEzNmE1MGE1ZWYwM2ZmOTg2YTc3ZTAxM2Y4NzEwNjEwYzBmZDQ3ODkxIiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,'Webkul\\Customer\\Models\\Customer',11,'2024-05-06 08:11:28','2024-05-06 08:11:28'),(81,'GET','[]','http://localhost:8000','http://localhost:8000/checkout/cart','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/localhost:8000\\/checkout\\/cart\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6InVkZzViMnBtMnkrWW9DdWtseXUyZGc9PSIsInZhbHVlIjoiSld5ZUpHWmdCcUx3eVdJRkc1V2tZbWVTZXRFeFRhTm41RUpjdXVDS0pQU3ptbmtFV0Fld2RIdFlMcGFPR0w0NnZ1cVA2elBvWkM1b0dyeFlGK29NNW85eHNoWnNUdm44Zmd3d0NNNG5oTWtZb2hwNDNubCtZYU5ZaTRCZ2NYKzciLCJtYWMiOiJmNDVlMjcxYmY2ZGIzNzkyZjM5ZGQ2YjYxOGFkM2QwMjY0OWUxNmUyNDg5Y2E3ZDVlMjI0YWQ4Y2RkNzE4YzdiIiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6IkRRemJHWEJIREFQKzhvTDBncHI3OFE9PSIsInZhbHVlIjoiOFNCS2ZocjRLbS8xMEVFaDdYYkdLVWRsNWlZVzdhV3NMa1VEQTZwby9WaFBOeVpSZjlDOWRzNk1aK3hKL1BhNnNxekR0ZlR2SHJ2VkRxZnExbmdQWjZpSVEvSitFdEpBeWJyMnpLYVpzTkFpN0ZYU3hvbE9EMms4L1dSNjJ3ME4iLCJtYWMiOiJkZjI4YjA0M2U0YzU1MjBmMWFhNDllYTc3NzU4OGI2NzZmMDM1YzczNzQwZmE4YWNkNGNlZDJiZTIyZWU3OGY1IiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,'Webkul\\Customer\\Models\\Customer',11,'2024-05-06 08:11:53','2024-05-06 08:11:53'),(82,'GET','[]','http://localhost:8000/storage/locales/xpXiUaFu5GzEe5W9tzBw6JHk4z3EXOfdwcWVX3hG.png','http://localhost:8000/','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6Im52c1lLd21MREswOTZNWFZqTVN6VEE9PSIsInZhbHVlIjoiamJHc20vMXRtMDgrbmVEbzRJdXNKVjBxQWdKMHM4ZGJMZ1J5WTd2eG1ndmlKbTFIMCtyUlY1aG1rUzFqdVRScDBjOGVuZWdaTHJXeitLeFZLckRVbHUzejRNMEhoOW00cnB4dnBncU5DK3Z4MVFRazhPTU5EMzYxN0hIK3FNY1QiLCJtYWMiOiIxMjRlYjQzOTY3OTQxZmQ4ODUxZThhZWEyMThmN2RiNDM4NmE3ZmQyZDcyMjg2MjRjMTVkOWE0NmVmNTYwZDhiIiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6IjI4UDNNSTM5dEFtdUE5eUZHWnlWZlE9PSIsInZhbHVlIjoiei9lMUdzS0tOamNIUC8xMmZEekE3d1Z0SHROdFpMOW5Tb2NPSFYwUVQyYk5ZY0lTeTk5Y0NudENzNUtIbVgwQXBvY1ZwbVR0UzVqTTJNWmhKSjRLbmhncCt6ZWN5djBJVzZWY3hiVGVJN3hVd095YlhqMkU4NEtSRk5uZ1lOdFkiLCJtYWMiOiI4NjllMjVmNDVhODgzZDA3ZmEzN2NiMjJmODBlM2M0M2EzNmQ2MjhiMzIzMjdhMTAwMzY0OWYyOGE1N2M1NzYxIiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,'Webkul\\Customer\\Models\\Customer',11,'2024-05-06 08:11:53','2024-05-06 08:11:53'),(83,'GET','[]','http://localhost:8000/storage/locales/xpXiUaFu5GzEe5W9tzBw6JHk4z3EXOfdwcWVX3hG.png','http://localhost:8000/','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6IndBMDI5eW5yTHpZbE8vNnNybVd5NUE9PSIsInZhbHVlIjoic3M2aWJmVm13WXRmTWZwc0lBc0J6Nms1MS8yYWIzMkl2SUlUYlNYbFFiMElQRnBkZy9UTDdRcFp4SXpFWmpyUEpCcmdrWFBjZTBWUGJadGtIU04wdkFDR2FrZlh0bjFNRzJVTVQxVm56MVpTSEVZR2owMHlnYUpsWlpFY0JMTUsiLCJtYWMiOiJhNDVjZDg4NjI4OTUwZThkNWE2Njc0MGExYWZjMzA1NGQ3NmM4MmQwOTNjMzEyZmJiYzRmMmQyZjdmNzBkMTliIiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6ImExbU9MQ2Z4bTExK3EvSG5yMlQ1OUE9PSIsInZhbHVlIjoiMlNYR1R5MCthYkI4dEtKTEJWUEswRHJmOWRXU3JDTVI4a08vb0ttMkRQREJwNTFVZFhscEVJdWdjdkNXOGNUVytxVHB4VjVNK3pyalk4VHRRandlWDdkcGhUN3hHTEI3M05ZWkhMb242OS90OEpDcDhoQVl1eHNva0NlL2dibzMiLCJtYWMiOiJiM2EwMzk5NTZjNGVhMzRiZGExZTM5Y2I3MTY5NGY1Y2MxNzllYTE2OTdkY2E1ODYzM2I5NTFjMWY5ZTBhNzYxIiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,'Webkul\\Customer\\Models\\Customer',11,'2024-05-06 08:11:54','2024-05-06 08:11:54'),(84,'GET','[]','http://localhost:8000/storage/locales/YuFazk3QsiQb7LqQGB9qpUAb9YTCaW9Cf2TnE2Kq.png','http://localhost:8000/','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6IkJBZ1ZiL1R0dk5wQmZJSzk3TXJzTGc9PSIsInZhbHVlIjoiNGRGSkRBSjYybmcycm5yL1hDeVQyb0J1QkhjeGZLejU3LzhaZmM4dTRSNUpoRHd2aWlKaDhGMHRTSjRJS1IySlhaWW93MU5ZZldxL3dwREo4cjVvUjl0SW5yT1JJVXhScTBTZEpOaDJzaGRySjJaWnl4YVVrWVlRRUhDZ016ZWEiLCJtYWMiOiJlZGZmMjczOGZlMWU4NzY4YmQzNjcyYTE0ZmRiOTUwN2E5MTQ4NjhkYjcwNDcwNGZhZTY2NWMzOWE1NmY2MjcwIiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6IlRNdFQ1SG1hbENDaXVRdHFPdHVwOVE9PSIsInZhbHVlIjoiY2h4Rkk2OVlQdlB4QWZSakdSUGpwNzZLVytjcnF6cnpJdnIxTW05T0NGY3VnWnRkYmJuZXFKdE4xTXhCL3p4NFYzU0tManZGc2k4VUlCK2tBWXR3dWk4Z2pONkVSS3hDQUVHSFJMVE1NZjhBU1RLbDE5djlPcDlzSVhQcWFMZGkiLCJtYWMiOiJjM2EyNmRmZjBhODExMGYwOGFjMGIxMTQxYzdiY2VkMDY4ODY1YmY3ZjYxY2ViZDFlOGFlYjA0N2NlYzIzMjgwIiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,'Webkul\\Customer\\Models\\Customer',11,'2024-05-06 08:11:54','2024-05-06 08:11:54'),(85,'GET','[]','http://localhost:8000/storage/theme/1/XrX0w1NYgVf4LGozkAkbMPWMVLMmbz56COCJQSc0.webp','http://localhost:8000/','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6IkJBZ1ZiL1R0dk5wQmZJSzk3TXJzTGc9PSIsInZhbHVlIjoiNGRGSkRBSjYybmcycm5yL1hDeVQyb0J1QkhjeGZLejU3LzhaZmM4dTRSNUpoRHd2aWlKaDhGMHRTSjRJS1IySlhaWW93MU5ZZldxL3dwREo4cjVvUjl0SW5yT1JJVXhScTBTZEpOaDJzaGRySjJaWnl4YVVrWVlRRUhDZ016ZWEiLCJtYWMiOiJlZGZmMjczOGZlMWU4NzY4YmQzNjcyYTE0ZmRiOTUwN2E5MTQ4NjhkYjcwNDcwNGZhZTY2NWMzOWE1NmY2MjcwIiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6IlRNdFQ1SG1hbENDaXVRdHFPdHVwOVE9PSIsInZhbHVlIjoiY2h4Rkk2OVlQdlB4QWZSakdSUGpwNzZLVytjcnF6cnpJdnIxTW05T0NGY3VnWnRkYmJuZXFKdE4xTXhCL3p4NFYzU0tManZGc2k4VUlCK2tBWXR3dWk4Z2pONkVSS3hDQUVHSFJMVE1NZjhBU1RLbDE5djlPcDlzSVhQcWFMZGkiLCJtYWMiOiJjM2EyNmRmZjBhODExMGYwOGFjMGIxMTQxYzdiY2VkMDY4ODY1YmY3ZjYxY2ViZDFlOGFlYjA0N2NlYzIzMjgwIiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,'Webkul\\Customer\\Models\\Customer',11,'2024-05-06 08:11:54','2024-05-06 08:11:54'),(86,'GET','[]','http://localhost:8000/storage/theme/1/6djeg88iqLD7u7gl62phIGd4IES7lbXeGZcgoXdW.webp','http://localhost:8000/','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6IkJBZ1ZiL1R0dk5wQmZJSzk3TXJzTGc9PSIsInZhbHVlIjoiNGRGSkRBSjYybmcycm5yL1hDeVQyb0J1QkhjeGZLejU3LzhaZmM4dTRSNUpoRHd2aWlKaDhGMHRTSjRJS1IySlhaWW93MU5ZZldxL3dwREo4cjVvUjl0SW5yT1JJVXhScTBTZEpOaDJzaGRySjJaWnl4YVVrWVlRRUhDZ016ZWEiLCJtYWMiOiJlZGZmMjczOGZlMWU4NzY4YmQzNjcyYTE0ZmRiOTUwN2E5MTQ4NjhkYjcwNDcwNGZhZTY2NWMzOWE1NmY2MjcwIiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6IlRNdFQ1SG1hbENDaXVRdHFPdHVwOVE9PSIsInZhbHVlIjoiY2h4Rkk2OVlQdlB4QWZSakdSUGpwNzZLVytjcnF6cnpJdnIxTW05T0NGY3VnWnRkYmJuZXFKdE4xTXhCL3p4NFYzU0tManZGc2k4VUlCK2tBWXR3dWk4Z2pONkVSS3hDQUVHSFJMVE1NZjhBU1RLbDE5djlPcDlzSVhQcWFMZGkiLCJtYWMiOiJjM2EyNmRmZjBhODExMGYwOGFjMGIxMTQxYzdiY2VkMDY4ODY1YmY3ZjYxY2ViZDFlOGFlYjA0N2NlYzIzMjgwIiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,'Webkul\\Customer\\Models\\Customer',11,'2024-05-06 08:11:54','2024-05-06 08:11:54'),(87,'GET','[]','http://localhost:8000/storage/theme/1/L3ou2rnh0Y30qV6xmDoUvSBvTAldxa8YQB08CCEH.webp','http://localhost:8000/','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6IkJBZ1ZiL1R0dk5wQmZJSzk3TXJzTGc9PSIsInZhbHVlIjoiNGRGSkRBSjYybmcycm5yL1hDeVQyb0J1QkhjeGZLejU3LzhaZmM4dTRSNUpoRHd2aWlKaDhGMHRTSjRJS1IySlhaWW93MU5ZZldxL3dwREo4cjVvUjl0SW5yT1JJVXhScTBTZEpOaDJzaGRySjJaWnl4YVVrWVlRRUhDZ016ZWEiLCJtYWMiOiJlZGZmMjczOGZlMWU4NzY4YmQzNjcyYTE0ZmRiOTUwN2E5MTQ4NjhkYjcwNDcwNGZhZTY2NWMzOWE1NmY2MjcwIiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6IlRNdFQ1SG1hbENDaXVRdHFPdHVwOVE9PSIsInZhbHVlIjoiY2h4Rkk2OVlQdlB4QWZSakdSUGpwNzZLVytjcnF6cnpJdnIxTW05T0NGY3VnWnRkYmJuZXFKdE4xTXhCL3p4NFYzU0tManZGc2k4VUlCK2tBWXR3dWk4Z2pONkVSS3hDQUVHSFJMVE1NZjhBU1RLbDE5djlPcDlzSVhQcWFMZGkiLCJtYWMiOiJjM2EyNmRmZjBhODExMGYwOGFjMGIxMTQxYzdiY2VkMDY4ODY1YmY3ZjYxY2ViZDFlOGFlYjA0N2NlYzIzMjgwIiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,'Webkul\\Customer\\Models\\Customer',11,'2024-05-06 08:11:54','2024-05-06 08:11:54'),(88,'GET','[]','http://localhost:8000/storage/theme/1/IAVGQ6NnGE2oAlagjM2AaCFrDndSh5JlKIhnfaEd.webp','http://localhost:8000/','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6IkJBZ1ZiL1R0dk5wQmZJSzk3TXJzTGc9PSIsInZhbHVlIjoiNGRGSkRBSjYybmcycm5yL1hDeVQyb0J1QkhjeGZLejU3LzhaZmM4dTRSNUpoRHd2aWlKaDhGMHRTSjRJS1IySlhaWW93MU5ZZldxL3dwREo4cjVvUjl0SW5yT1JJVXhScTBTZEpOaDJzaGRySjJaWnl4YVVrWVlRRUhDZ016ZWEiLCJtYWMiOiJlZGZmMjczOGZlMWU4NzY4YmQzNjcyYTE0ZmRiOTUwN2E5MTQ4NjhkYjcwNDcwNGZhZTY2NWMzOWE1NmY2MjcwIiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6IlRNdFQ1SG1hbENDaXVRdHFPdHVwOVE9PSIsInZhbHVlIjoiY2h4Rkk2OVlQdlB4QWZSakdSUGpwNzZLVytjcnF6cnpJdnIxTW05T0NGY3VnWnRkYmJuZXFKdE4xTXhCL3p4NFYzU0tManZGc2k4VUlCK2tBWXR3dWk4Z2pONkVSS3hDQUVHSFJMVE1NZjhBU1RLbDE5djlPcDlzSVhQcWFMZGkiLCJtYWMiOiJjM2EyNmRmZjBhODExMGYwOGFjMGIxMTQxYzdiY2VkMDY4ODY1YmY3ZjYxY2ViZDFlOGFlYjA0N2NlYzIzMjgwIiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,'Webkul\\Customer\\Models\\Customer',11,'2024-05-06 08:11:54','2024-05-06 08:11:54'),(89,'GET','[]','http://localhost:8000/storage/theme/5/QV6Klqu61cwvG7k7ycFcKucWRiBd9kMXRfagMxmK.webp','http://localhost:8000/','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6IlRxV0lER2NhMlByNDlSR3hFZjZmaEE9PSIsInZhbHVlIjoiSUdhVGU4RndtN3V0RWNnRDdIQURYb0YvbWhLbXM5d0QvV1c3bFNubEdoazRhekQwbDJ2Z3ZQRm1tN3VmUHBWWlR2Mm5RdGYzOERPVHE0bHI3WDkwd0ZwYWNQaTdtREM2WVlvVjZFTjlvejd0eXBic3JsQ0pqc3RKWVAwTEk4cXEiLCJtYWMiOiJhZGIyZjNjNTVkMmQ0OGI1MzFkNzE0YTljOGYxMzMwMWQ0YjU1ZGNlYWQ4YjQyMjdjYTU1YzBjZWM0YmVjOGVlIiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6IjdPbXpyR0QzYXhEWXpjeEx1N292MUE9PSIsInZhbHVlIjoibm5wbWNuc1h4RUVvdHhjak4xTHFUOU5QZ2JTUGRuUE45WTJLZENjU05YWVlyRkk2ZmJRYnZ3L3Z4U2NYbkZYWDdROE9LWFptNWJjNjBXd2lnTmRrdDRPME1VWGwzdXY1YkxLZWJtQkRJVGcyK0RhTUpEMm9sYlR2a0hPZjlDR2kiLCJtYWMiOiJlMzI1YWMxYWZjMTI0M2Q5ZWQzYTkzNjgyYWFiNTZhY2IzMTcwMGU0ODI4YjFiMWIyMGUyMzMzZjE5ZmMzNmI3IiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,'Webkul\\Customer\\Models\\Customer',11,'2024-05-06 08:12:15','2024-05-06 08:12:15'),(90,'GET','[]','http://localhost:8000/storage/theme/5/g5WkYSIJEh4oCtoybolZY5vLEO1qfc80bnRXLGt2.webp','http://localhost:8000/','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6IlRxV0lER2NhMlByNDlSR3hFZjZmaEE9PSIsInZhbHVlIjoiSUdhVGU4RndtN3V0RWNnRDdIQURYb0YvbWhLbXM5d0QvV1c3bFNubEdoazRhekQwbDJ2Z3ZQRm1tN3VmUHBWWlR2Mm5RdGYzOERPVHE0bHI3WDkwd0ZwYWNQaTdtREM2WVlvVjZFTjlvejd0eXBic3JsQ0pqc3RKWVAwTEk4cXEiLCJtYWMiOiJhZGIyZjNjNTVkMmQ0OGI1MzFkNzE0YTljOGYxMzMwMWQ0YjU1ZGNlYWQ4YjQyMjdjYTU1YzBjZWM0YmVjOGVlIiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6IjdPbXpyR0QzYXhEWXpjeEx1N292MUE9PSIsInZhbHVlIjoibm5wbWNuc1h4RUVvdHhjak4xTHFUOU5QZ2JTUGRuUE45WTJLZENjU05YWVlyRkk2ZmJRYnZ3L3Z4U2NYbkZYWDdROE9LWFptNWJjNjBXd2lnTmRrdDRPME1VWGwzdXY1YkxLZWJtQkRJVGcyK0RhTUpEMm9sYlR2a0hPZjlDR2kiLCJtYWMiOiJlMzI1YWMxYWZjMTI0M2Q5ZWQzYTkzNjgyYWFiNTZhY2IzMTcwMGU0ODI4YjFiMWIyMGUyMzMzZjE5ZmMzNmI3IiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,'Webkul\\Customer\\Models\\Customer',11,'2024-05-06 08:12:16','2024-05-06 08:12:16'),(91,'GET','[]','http://localhost:8000/storage/theme/5/acQImgAo12HwvsfCGus1x50FAivqB4RbpR2l2IXc.webp','http://localhost:8000/','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6IlRxV0lER2NhMlByNDlSR3hFZjZmaEE9PSIsInZhbHVlIjoiSUdhVGU4RndtN3V0RWNnRDdIQURYb0YvbWhLbXM5d0QvV1c3bFNubEdoazRhekQwbDJ2Z3ZQRm1tN3VmUHBWWlR2Mm5RdGYzOERPVHE0bHI3WDkwd0ZwYWNQaTdtREM2WVlvVjZFTjlvejd0eXBic3JsQ0pqc3RKWVAwTEk4cXEiLCJtYWMiOiJhZGIyZjNjNTVkMmQ0OGI1MzFkNzE0YTljOGYxMzMwMWQ0YjU1ZGNlYWQ4YjQyMjdjYTU1YzBjZWM0YmVjOGVlIiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6IjdPbXpyR0QzYXhEWXpjeEx1N292MUE9PSIsInZhbHVlIjoibm5wbWNuc1h4RUVvdHhjak4xTHFUOU5QZ2JTUGRuUE45WTJLZENjU05YWVlyRkk2ZmJRYnZ3L3Z4U2NYbkZYWDdROE9LWFptNWJjNjBXd2lnTmRrdDRPME1VWGwzdXY1YkxLZWJtQkRJVGcyK0RhTUpEMm9sYlR2a0hPZjlDR2kiLCJtYWMiOiJlMzI1YWMxYWZjMTI0M2Q5ZWQzYTkzNjgyYWFiNTZhY2IzMTcwMGU0ODI4YjFiMWIyMGUyMzMzZjE5ZmMzNmI3IiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,'Webkul\\Customer\\Models\\Customer',11,'2024-05-06 08:12:16','2024-05-06 08:12:16'),(92,'GET','[]','http://localhost:8000',NULL,'[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"cache-control\":[\"max-age=0\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"none\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6Ik9UOGVSSi9PTCtSRyszK3dOOU5ZN1E9PSIsInZhbHVlIjoiY2hvVUtHOWpTb3puR1hGSlZ1azdJVkJiN0xCWEp0aWRFaUp1WUd1ZzRxRzBJTU9kQzhuY0xIbFdkV044eEk4SENuSkh0REpwVk9YUUJwenowWEN2cGpqWkxoeDlMZ3JDRVlpTm9qTW04RnFPSndHQ3R3cXFxY0QreG80ZXUzMXEiLCJtYWMiOiJhOTVjNDVjMGRmMTdhNGU3MzY3NjJkYzNlYmM3YzI5YjNmZjJkMWNhZTlhNDJkNjJiZTUwMjAwNTZmMTIyODRkIiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6InZITkhEalAyeDRXbGtRSC84ZWJyTEE9PSIsInZhbHVlIjoieUNpMCszTG9XbDJveWh6dnZHa3JLUkVVVTJvejVmZWN1QkV3cGVzK25kelNEQ2VCME5QUWxBcHlNS2o1ZXlldzJVVzZONk9kYVl2WjZkclArSU16dUJ0dlBHR3lrVnZMazZpWDV4VzZkeXFMM3JqdzZSY0orQ1I3NlhOUUlxRWIiLCJtYWMiOiJmMjg2ZDNiYTYxNTM4OGZkMmE0ZmE2NDhjNGI5YTZkZDk1MWE0YzFjOTViMmYwZjQwMTI3M2IyM2YxMTc2OWQ2IiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,'Webkul\\Customer\\Models\\Customer',11,'2024-05-06 08:13:11','2024-05-06 08:13:11'),(93,'GET','[]','http://localhost:8000/storage/locales/xpXiUaFu5GzEe5W9tzBw6JHk4z3EXOfdwcWVX3hG.png','http://localhost:8000/','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6IjJFZ3RNRUhJSHpDcXE1eWFlZk5PSnc9PSIsInZhbHVlIjoieGU0YVI3TTdJRGhSLzY0Ly90MytYQ2V2TFh5M1NvSXU1OGRVejBqTDdGZno1RGNDbjh6Rkk2bVZaR3VUdnZaWG9ZWkl0cWNwSmQ0cVdSNHdLWkxoSEU3T3ZOSS8raStvZWRuckZ3WWVmVER3L2Rqbk03encybE53SU9lUXFuMi8iLCJtYWMiOiI4NGJjNGFkY2M2NzEzNTY2YjczNzc0MmI4ZjJiMWFiNjU0NDFkNzBlZDc0ODFjZDhmYWFmOTdlN2FjYjAxNzJkIiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6IkFDbVE1bk5NOHlOcHpscGsxQzdkY1E9PSIsInZhbHVlIjoibjJicjFWWlRUQjVTSGc4ZmNiQUFXMmRicVM3OFV6aWUxNTA1bFFZc2VodUwvWUhLL0FaNGc0dnpDbDRVYnRrYnZrOWI1dW9Pbk8xYnc3QmdzQnRLRW5aTEVucEVCRTZOUFZqVEM5VlJlNXdxT2M3VnBFanh0enN4enk0cmdEV2siLCJtYWMiOiJiNmIyZmJmOWVmM2U5ZWI2ZjQ2NjUzZjY5NmI2NGRlNmMxMWQ1ODQzYjdmZjFhNDI4NGFlNzdjYmRhNzE0Mjg0IiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,'Webkul\\Customer\\Models\\Customer',11,'2024-05-06 08:13:11','2024-05-06 08:13:11'),(94,'GET','[]','http://localhost:8000/storage/theme/5/QV6Klqu61cwvG7k7ycFcKucWRiBd9kMXRfagMxmK.webp','http://localhost:8000/','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6Im5HL3ZPVk00T0hKRmYvY3VvQkpVUkE9PSIsInZhbHVlIjoibzRQeTNvYzRGV1pjNUNhWXhkc29LT0pMb2hqck5JK3pwM3FzakhtdlN4S3ZBdjh3dVVzNHJnMDNSeDlZNGxLbnErdjdkbk1rbFN6bkdJZkZOeTlmZGdYM0pFTXg5YW10THBmRlVxeWNIOC9vcnRVcnEvWmZQbm0rT1AyTmdjR08iLCJtYWMiOiIxZjA1ZGRhM2NkZGU4NzY1YmNiMzhhNDk3N2RhOTcyZDk1ZDY5N2FkOWYxMWRhYTQ5NDI5YTY4NDE2MjYxYzcxIiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6IldMM0dLcklwMTI0V3QvZnRkNzR4RHc9PSIsInZhbHVlIjoiK05GT0NrbllUUEI0bFZQSkZQK000RnF3aGxSZ2JkbHdvSHVvelBnYjBmMktWRU5kdFVwZ09EdElKTG1IcjVOTkJTTVZuekpVVDNLYmNQVXMvWEFnREdnbzBEeURCbDl6bHIzNUo1Mk5iSnhnakVxa2drVThPVXhxanJ4dkgyYkkiLCJtYWMiOiI3ZTk5ODBjMTk4MTEyYjNiMjdkNWFkYjY2MGIzOGVkYjFiZDNhZWEzNmExYjYzMjg3MDZmNWE3MDY5ODliNTNlIiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,'Webkul\\Customer\\Models\\Customer',11,'2024-05-06 08:13:11','2024-05-06 08:13:11'),(95,'GET','[]','http://localhost:8000/storage/theme/5/acQImgAo12HwvsfCGus1x50FAivqB4RbpR2l2IXc.webp','http://localhost:8000/','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6Im5HL3ZPVk00T0hKRmYvY3VvQkpVUkE9PSIsInZhbHVlIjoibzRQeTNvYzRGV1pjNUNhWXhkc29LT0pMb2hqck5JK3pwM3FzakhtdlN4S3ZBdjh3dVVzNHJnMDNSeDlZNGxLbnErdjdkbk1rbFN6bkdJZkZOeTlmZGdYM0pFTXg5YW10THBmRlVxeWNIOC9vcnRVcnEvWmZQbm0rT1AyTmdjR08iLCJtYWMiOiIxZjA1ZGRhM2NkZGU4NzY1YmNiMzhhNDk3N2RhOTcyZDk1ZDY5N2FkOWYxMWRhYTQ5NDI5YTY4NDE2MjYxYzcxIiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6IldMM0dLcklwMTI0V3QvZnRkNzR4RHc9PSIsInZhbHVlIjoiK05GT0NrbllUUEI0bFZQSkZQK000RnF3aGxSZ2JkbHdvSHVvelBnYjBmMktWRU5kdFVwZ09EdElKTG1IcjVOTkJTTVZuekpVVDNLYmNQVXMvWEFnREdnbzBEeURCbDl6bHIzNUo1Mk5iSnhnakVxa2drVThPVXhxanJ4dkgyYkkiLCJtYWMiOiI3ZTk5ODBjMTk4MTEyYjNiMjdkNWFkYjY2MGIzOGVkYjFiZDNhZWEzNmExYjYzMjg3MDZmNWE3MDY5ODliNTNlIiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,'Webkul\\Customer\\Models\\Customer',11,'2024-05-06 08:13:12','2024-05-06 08:13:12'),(96,'GET','[]','http://localhost:8000/storage/theme/5/g5WkYSIJEh4oCtoybolZY5vLEO1qfc80bnRXLGt2.webp','http://localhost:8000/','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6Im5HL3ZPVk00T0hKRmYvY3VvQkpVUkE9PSIsInZhbHVlIjoibzRQeTNvYzRGV1pjNUNhWXhkc29LT0pMb2hqck5JK3pwM3FzakhtdlN4S3ZBdjh3dVVzNHJnMDNSeDlZNGxLbnErdjdkbk1rbFN6bkdJZkZOeTlmZGdYM0pFTXg5YW10THBmRlVxeWNIOC9vcnRVcnEvWmZQbm0rT1AyTmdjR08iLCJtYWMiOiIxZjA1ZGRhM2NkZGU4NzY1YmNiMzhhNDk3N2RhOTcyZDk1ZDY5N2FkOWYxMWRhYTQ5NDI5YTY4NDE2MjYxYzcxIiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6IldMM0dLcklwMTI0V3QvZnRkNzR4RHc9PSIsInZhbHVlIjoiK05GT0NrbllUUEI0bFZQSkZQK000RnF3aGxSZ2JkbHdvSHVvelBnYjBmMktWRU5kdFVwZ09EdElKTG1IcjVOTkJTTVZuekpVVDNLYmNQVXMvWEFnREdnbzBEeURCbDl6bHIzNUo1Mk5iSnhnakVxa2drVThPVXhxanJ4dkgyYkkiLCJtYWMiOiI3ZTk5ODBjMTk4MTEyYjNiMjdkNWFkYjY2MGIzOGVkYjFiZDNhZWEzNmExYjYzMjg3MDZmNWE3MDY5ODliNTNlIiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,'Webkul\\Customer\\Models\\Customer',11,'2024-05-06 08:13:12','2024-05-06 08:13:12'),(97,'GET','[]','http://localhost:8000/storage/locales/xpXiUaFu5GzEe5W9tzBw6JHk4z3EXOfdwcWVX3hG.png','http://localhost:8000/','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6IjRLdHkzcmp3OGZaSGRsUlRvMUcrQkE9PSIsInZhbHVlIjoiUUtZUGliaTRBSkNsTkM1SFZySDB2YmJKYjl5eGdWODJ0c20rclhVNDEvRWNtWjEyNDFTMU1IT1cxd0JvMUh3U3lzN1RpY3BZV2pEaEpyUFd2NnZsZGNsMHY1VXkvNVUrR1RFczJtTklhd3RsbmRlNUY3dHFPRUpSYklCNW8zMTkiLCJtYWMiOiI5MzQ3ZDY5MTA5OGUxMjRhNWU4MjI2NWNlMGNkMDI2ZDMxM2U3MGVmYzQ0ZTY5YjBjMzAwYmUwZTMwZGM2NWVkIiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6IldGRmVGQkF3ZHFLNE0xWllKWGpGYnc9PSIsInZhbHVlIjoieWhDV1B2OGlYVjIvanJJMlh2YzhKVWEyL0hhRENnTFVBMU1XZzM0dVBGK1JHbjdkV1pVMDRmVjkrdENSejlod2FDdmNGMDhndnFpN21Sb3pzZmZ0SmNmVFpXVy9wYTl1UTF2alViTFRtbmY0ajc4VStkTkc3WDZYNXJZMSs4dWsiLCJtYWMiOiJmOTEyMDQ2M2VhNThhZGI3YjhiZDczMTcwOTM3OGIyYzc1ZDc2ZWZmYWQ0NTQxODliYmM4NzE5YWUwZmY5YTc2IiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,'Webkul\\Customer\\Models\\Customer',11,'2024-05-06 08:13:12','2024-05-06 08:13:12'),(98,'GET','[]','http://localhost:8000/storage/locales/YuFazk3QsiQb7LqQGB9qpUAb9YTCaW9Cf2TnE2Kq.png','http://localhost:8000/','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6IjRLdHkzcmp3OGZaSGRsUlRvMUcrQkE9PSIsInZhbHVlIjoiUUtZUGliaTRBSkNsTkM1SFZySDB2YmJKYjl5eGdWODJ0c20rclhVNDEvRWNtWjEyNDFTMU1IT1cxd0JvMUh3U3lzN1RpY3BZV2pEaEpyUFd2NnZsZGNsMHY1VXkvNVUrR1RFczJtTklhd3RsbmRlNUY3dHFPRUpSYklCNW8zMTkiLCJtYWMiOiI5MzQ3ZDY5MTA5OGUxMjRhNWU4MjI2NWNlMGNkMDI2ZDMxM2U3MGVmYzQ0ZTY5YjBjMzAwYmUwZTMwZGM2NWVkIiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6IldGRmVGQkF3ZHFLNE0xWllKWGpGYnc9PSIsInZhbHVlIjoieWhDV1B2OGlYVjIvanJJMlh2YzhKVWEyL0hhRENnTFVBMU1XZzM0dVBGK1JHbjdkV1pVMDRmVjkrdENSejlod2FDdmNGMDhndnFpN21Sb3pzZmZ0SmNmVFpXVy9wYTl1UTF2alViTFRtbmY0ajc4VStkTkc3WDZYNXJZMSs4dWsiLCJtYWMiOiJmOTEyMDQ2M2VhNThhZGI3YjhiZDczMTcwOTM3OGIyYzc1ZDc2ZWZmYWQ0NTQxODliYmM4NzE5YWUwZmY5YTc2IiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,'Webkul\\Customer\\Models\\Customer',11,'2024-05-06 08:13:12','2024-05-06 08:13:12'),(99,'GET','[]','http://localhost:8000/storage/theme/1/XrX0w1NYgVf4LGozkAkbMPWMVLMmbz56COCJQSc0.webp','http://localhost:8000/','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6IjRLdHkzcmp3OGZaSGRsUlRvMUcrQkE9PSIsInZhbHVlIjoiUUtZUGliaTRBSkNsTkM1SFZySDB2YmJKYjl5eGdWODJ0c20rclhVNDEvRWNtWjEyNDFTMU1IT1cxd0JvMUh3U3lzN1RpY3BZV2pEaEpyUFd2NnZsZGNsMHY1VXkvNVUrR1RFczJtTklhd3RsbmRlNUY3dHFPRUpSYklCNW8zMTkiLCJtYWMiOiI5MzQ3ZDY5MTA5OGUxMjRhNWU4MjI2NWNlMGNkMDI2ZDMxM2U3MGVmYzQ0ZTY5YjBjMzAwYmUwZTMwZGM2NWVkIiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6IldGRmVGQkF3ZHFLNE0xWllKWGpGYnc9PSIsInZhbHVlIjoieWhDV1B2OGlYVjIvanJJMlh2YzhKVWEyL0hhRENnTFVBMU1XZzM0dVBGK1JHbjdkV1pVMDRmVjkrdENSejlod2FDdmNGMDhndnFpN21Sb3pzZmZ0SmNmVFpXVy9wYTl1UTF2alViTFRtbmY0ajc4VStkTkc3WDZYNXJZMSs4dWsiLCJtYWMiOiJmOTEyMDQ2M2VhNThhZGI3YjhiZDczMTcwOTM3OGIyYzc1ZDc2ZWZmYWQ0NTQxODliYmM4NzE5YWUwZmY5YTc2IiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,'Webkul\\Customer\\Models\\Customer',11,'2024-05-06 08:13:12','2024-05-06 08:13:12'),(100,'GET','[]','http://localhost:8000/storage/theme/1/6djeg88iqLD7u7gl62phIGd4IES7lbXeGZcgoXdW.webp','http://localhost:8000/','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6IjRLdHkzcmp3OGZaSGRsUlRvMUcrQkE9PSIsInZhbHVlIjoiUUtZUGliaTRBSkNsTkM1SFZySDB2YmJKYjl5eGdWODJ0c20rclhVNDEvRWNtWjEyNDFTMU1IT1cxd0JvMUh3U3lzN1RpY3BZV2pEaEpyUFd2NnZsZGNsMHY1VXkvNVUrR1RFczJtTklhd3RsbmRlNUY3dHFPRUpSYklCNW8zMTkiLCJtYWMiOiI5MzQ3ZDY5MTA5OGUxMjRhNWU4MjI2NWNlMGNkMDI2ZDMxM2U3MGVmYzQ0ZTY5YjBjMzAwYmUwZTMwZGM2NWVkIiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6IldGRmVGQkF3ZHFLNE0xWllKWGpGYnc9PSIsInZhbHVlIjoieWhDV1B2OGlYVjIvanJJMlh2YzhKVWEyL0hhRENnTFVBMU1XZzM0dVBGK1JHbjdkV1pVMDRmVjkrdENSejlod2FDdmNGMDhndnFpN21Sb3pzZmZ0SmNmVFpXVy9wYTl1UTF2alViTFRtbmY0ajc4VStkTkc3WDZYNXJZMSs4dWsiLCJtYWMiOiJmOTEyMDQ2M2VhNThhZGI3YjhiZDczMTcwOTM3OGIyYzc1ZDc2ZWZmYWQ0NTQxODliYmM4NzE5YWUwZmY5YTc2IiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,'Webkul\\Customer\\Models\\Customer',11,'2024-05-06 08:13:12','2024-05-06 08:13:12'),(101,'GET','[]','http://localhost:8000/storage/theme/1/L3ou2rnh0Y30qV6xmDoUvSBvTAldxa8YQB08CCEH.webp','http://localhost:8000/','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6IjRLdHkzcmp3OGZaSGRsUlRvMUcrQkE9PSIsInZhbHVlIjoiUUtZUGliaTRBSkNsTkM1SFZySDB2YmJKYjl5eGdWODJ0c20rclhVNDEvRWNtWjEyNDFTMU1IT1cxd0JvMUh3U3lzN1RpY3BZV2pEaEpyUFd2NnZsZGNsMHY1VXkvNVUrR1RFczJtTklhd3RsbmRlNUY3dHFPRUpSYklCNW8zMTkiLCJtYWMiOiI5MzQ3ZDY5MTA5OGUxMjRhNWU4MjI2NWNlMGNkMDI2ZDMxM2U3MGVmYzQ0ZTY5YjBjMzAwYmUwZTMwZGM2NWVkIiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6IldGRmVGQkF3ZHFLNE0xWllKWGpGYnc9PSIsInZhbHVlIjoieWhDV1B2OGlYVjIvanJJMlh2YzhKVWEyL0hhRENnTFVBMU1XZzM0dVBGK1JHbjdkV1pVMDRmVjkrdENSejlod2FDdmNGMDhndnFpN21Sb3pzZmZ0SmNmVFpXVy9wYTl1UTF2alViTFRtbmY0ajc4VStkTkc3WDZYNXJZMSs4dWsiLCJtYWMiOiJmOTEyMDQ2M2VhNThhZGI3YjhiZDczMTcwOTM3OGIyYzc1ZDc2ZWZmYWQ0NTQxODliYmM4NzE5YWUwZmY5YTc2IiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,'Webkul\\Customer\\Models\\Customer',11,'2024-05-06 08:13:12','2024-05-06 08:13:12'),(102,'GET','[]','http://localhost:8000/storage/theme/1/IAVGQ6NnGE2oAlagjM2AaCFrDndSh5JlKIhnfaEd.webp','http://localhost:8000/','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6IjRLdHkzcmp3OGZaSGRsUlRvMUcrQkE9PSIsInZhbHVlIjoiUUtZUGliaTRBSkNsTkM1SFZySDB2YmJKYjl5eGdWODJ0c20rclhVNDEvRWNtWjEyNDFTMU1IT1cxd0JvMUh3U3lzN1RpY3BZV2pEaEpyUFd2NnZsZGNsMHY1VXkvNVUrR1RFczJtTklhd3RsbmRlNUY3dHFPRUpSYklCNW8zMTkiLCJtYWMiOiI5MzQ3ZDY5MTA5OGUxMjRhNWU4MjI2NWNlMGNkMDI2ZDMxM2U3MGVmYzQ0ZTY5YjBjMzAwYmUwZTMwZGM2NWVkIiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6IldGRmVGQkF3ZHFLNE0xWllKWGpGYnc9PSIsInZhbHVlIjoieWhDV1B2OGlYVjIvanJJMlh2YzhKVWEyL0hhRENnTFVBMU1XZzM0dVBGK1JHbjdkV1pVMDRmVjkrdENSejlod2FDdmNGMDhndnFpN21Sb3pzZmZ0SmNmVFpXVy9wYTl1UTF2alViTFRtbmY0ajc4VStkTkc3WDZYNXJZMSs4dWsiLCJtYWMiOiJmOTEyMDQ2M2VhNThhZGI3YjhiZDczMTcwOTM3OGIyYzc1ZDc2ZWZmYWQ0NTQxODliYmM4NzE5YWUwZmY5YTc2IiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,'Webkul\\Customer\\Models\\Customer',11,'2024-05-06 08:13:12','2024-05-06 08:13:12'),(103,'GET','[]','http://localhost:8000/storage/theme/5/RZNIbMXGziDUNke4S8yXIytESjFAF11h8WMtSW3M.webp','http://localhost:8000/','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6ImpUWkNHeTFOTlA4ZEtNS0s2TVZJUkE9PSIsInZhbHVlIjoiQTVIV1JKaDVDbnFLdGtoR0o3Tk8zRFF2SkthRkdoTFJwU000RHduUytTb1BnOFVDbGpJbTc1cVp6QjJ3Sms2TDFUU2djVzc2V05SdndMSVBYZHpMYkVJeUJpWk5BUzkxbWR1aVNySWkveXNweWxtbUVLdGxiTXU5TXRkekhSS2siLCJtYWMiOiJkMGUwOTFmMTg0YmRjMjA4Y2YzY2U3MWYyYzFiNTM2OWRmOWYxMzI5ZDZiZGIzN2FjZjgxZWM0OGEyN2JlZjdhIiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6Ikg3dzBuSUFTd1hUaEl3cTdCQjVqcFE9PSIsInZhbHVlIjoicTUvR0tlYklZaFZRMEN2aG5US0tSWmxYVmJLZWtHYlRhckdEbWlybEN6QzFPamVsbEdLL2FTcVZJaDBXZEhVWk12MExDRC9aczNCZUpmVHE2TkhmOGxjMzdIbVpIY2RjOXdzMUFadndaWTdieVlLWnhhbUNpSmdKcHI2ekxuWjAiLCJtYWMiOiI0MzQ1YWFjNDlhNjU2ZGE5MDNiZjVkYjVmZTdiYTQ1MzNmY2VjYTBiNTRmNmE4MWIyMTJlMGZhNzQ5NDkzZWRkIiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,'Webkul\\Customer\\Models\\Customer',11,'2024-05-06 08:13:14','2024-05-06 08:13:14'),(104,'GET','[]','http://localhost:8000/storage/theme/5/0aRrgG8U7GBOCIEHaQlxLtheCC9R15FL8RhvHxtg.webp','http://localhost:8000/','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6ImpUWkNHeTFOTlA4ZEtNS0s2TVZJUkE9PSIsInZhbHVlIjoiQTVIV1JKaDVDbnFLdGtoR0o3Tk8zRFF2SkthRkdoTFJwU000RHduUytTb1BnOFVDbGpJbTc1cVp6QjJ3Sms2TDFUU2djVzc2V05SdndMSVBYZHpMYkVJeUJpWk5BUzkxbWR1aVNySWkveXNweWxtbUVLdGxiTXU5TXRkekhSS2siLCJtYWMiOiJkMGUwOTFmMTg0YmRjMjA4Y2YzY2U3MWYyYzFiNTM2OWRmOWYxMzI5ZDZiZGIzN2FjZjgxZWM0OGEyN2JlZjdhIiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6Ikg3dzBuSUFTd1hUaEl3cTdCQjVqcFE9PSIsInZhbHVlIjoicTUvR0tlYklZaFZRMEN2aG5US0tSWmxYVmJLZWtHYlRhckdEbWlybEN6QzFPamVsbEdLL2FTcVZJaDBXZEhVWk12MExDRC9aczNCZUpmVHE2TkhmOGxjMzdIbVpIY2RjOXdzMUFadndaWTdieVlLWnhhbUNpSmdKcHI2ekxuWjAiLCJtYWMiOiI0MzQ1YWFjNDlhNjU2ZGE5MDNiZjVkYjVmZTdiYTQ1MzNmY2VjYTBiNTRmNmE4MWIyMTJlMGZhNzQ5NDkzZWRkIiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,'Webkul\\Customer\\Models\\Customer',11,'2024-05-06 08:13:14','2024-05-06 08:13:14'),(105,'GET','[]','http://localhost:8000/storage/theme/5/hBu6NnEJa7QZ227w1irYewM6pYf9vCmBu7tlF9eX.webp','http://localhost:8000/','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6ImpUWkNHeTFOTlA4ZEtNS0s2TVZJUkE9PSIsInZhbHVlIjoiQTVIV1JKaDVDbnFLdGtoR0o3Tk8zRFF2SkthRkdoTFJwU000RHduUytTb1BnOFVDbGpJbTc1cVp6QjJ3Sms2TDFUU2djVzc2V05SdndMSVBYZHpMYkVJeUJpWk5BUzkxbWR1aVNySWkveXNweWxtbUVLdGxiTXU5TXRkekhSS2siLCJtYWMiOiJkMGUwOTFmMTg0YmRjMjA4Y2YzY2U3MWYyYzFiNTM2OWRmOWYxMzI5ZDZiZGIzN2FjZjgxZWM0OGEyN2JlZjdhIiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6Ikg3dzBuSUFTd1hUaEl3cTdCQjVqcFE9PSIsInZhbHVlIjoicTUvR0tlYklZaFZRMEN2aG5US0tSWmxYVmJLZWtHYlRhckdEbWlybEN6QzFPamVsbEdLL2FTcVZJaDBXZEhVWk12MExDRC9aczNCZUpmVHE2TkhmOGxjMzdIbVpIY2RjOXdzMUFadndaWTdieVlLWnhhbUNpSmdKcHI2ekxuWjAiLCJtYWMiOiI0MzQ1YWFjNDlhNjU2ZGE5MDNiZjVkYjVmZTdiYTQ1MzNmY2VjYTBiNTRmNmE4MWIyMTJlMGZhNzQ5NDkzZWRkIiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,'Webkul\\Customer\\Models\\Customer',11,'2024-05-06 08:13:14','2024-05-06 08:13:14'),(106,'GET','[]','http://localhost:8000/storage/theme/6/rax3lR7qd6XiAiHo8Cha3CAJi5ntjVlsvNIItJJe.webp','http://localhost:8000/','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6ImpUWkNHeTFOTlA4ZEtNS0s2TVZJUkE9PSIsInZhbHVlIjoiQTVIV1JKaDVDbnFLdGtoR0o3Tk8zRFF2SkthRkdoTFJwU000RHduUytTb1BnOFVDbGpJbTc1cVp6QjJ3Sms2TDFUU2djVzc2V05SdndMSVBYZHpMYkVJeUJpWk5BUzkxbWR1aVNySWkveXNweWxtbUVLdGxiTXU5TXRkekhSS2siLCJtYWMiOiJkMGUwOTFmMTg0YmRjMjA4Y2YzY2U3MWYyYzFiNTM2OWRmOWYxMzI5ZDZiZGIzN2FjZjgxZWM0OGEyN2JlZjdhIiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6Ikg3dzBuSUFTd1hUaEl3cTdCQjVqcFE9PSIsInZhbHVlIjoicTUvR0tlYklZaFZRMEN2aG5US0tSWmxYVmJLZWtHYlRhckdEbWlybEN6QzFPamVsbEdLL2FTcVZJaDBXZEhVWk12MExDRC9aczNCZUpmVHE2TkhmOGxjMzdIbVpIY2RjOXdzMUFadndaWTdieVlLWnhhbUNpSmdKcHI2ekxuWjAiLCJtYWMiOiI0MzQ1YWFjNDlhNjU2ZGE5MDNiZjVkYjVmZTdiYTQ1MzNmY2VjYTBiNTRmNmE4MWIyMTJlMGZhNzQ5NDkzZWRkIiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,'Webkul\\Customer\\Models\\Customer',11,'2024-05-06 08:13:14','2024-05-06 08:13:14'),(107,'GET','[]','http://localhost:8000/amet-eum-atque-sapiente-quisquam-dolorum-corporis-sunt','http://localhost:8000/','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/localhost:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6IjdyMzZ4MFVUYk5VdzljMitpei9ERVE9PSIsInZhbHVlIjoiSjdGQjhuOHdIbTdjWUR1RlIvR21rSklXZ1ZDb29ZRnRVd3RBMDVBV24vVlp0Smc5SkFaVTFrRVlNVjlWTHAzYXIwOFJFZUZJWHRRbDRBQ3pqaEVBbVpyNnVzYnpTSG5FVG1zWm1yd0pMK3o2bjNOYmZTWlpLanFabjdMeHBHK1QiLCJtYWMiOiIyNDBiN2JlZTlmYjkyNGU1MmNlYTcyNWRjNDZlYWQyZDc1YjM1NDRiYzNjZTViNmVlYWQ4NzYxYWQ0OGVlZGM3IiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6InRHbDNUbG9URjVPb1h6UXQxMXBDbnc9PSIsInZhbHVlIjoiWFI3N0dhSjdmWFJFR1M2alQ5L2E1VkdwN2FxSzU0dDZZeXFabERkRE9QT29IVWhlQ2hyb1M2UHFJU050Y0tnT3BnSVIxNkV1QXNvSlVHbmhHNXhKQ0RuZlZnNVVSbzl0ZVlrTjFwZFhrMlFEaWNJSUZsam1mRVVlMWI4RkdxRlIiLCJtYWMiOiI4MzZjYTM1YTkwYmIyOTlmYzkzNDQ0NjM3MmUxZGRiNWVlNTc3MTc4ZTMwYzQ2YzY2MjlhZDM2ZDc4ZWYyNGY1IiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1','Webkul\\Product\\Models\\Product',96,'Webkul\\Customer\\Models\\Customer',11,'2024-05-06 08:13:15','2024-05-06 08:13:15'),(108,'GET','[]','http://localhost:8000/storage/locales/YuFazk3QsiQb7LqQGB9qpUAb9YTCaW9Cf2TnE2Kq.png','http://localhost:8000/amet-eum-atque-sapiente-quisquam-dolorum-corporis-sunt','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/amet-eum-atque-sapiente-quisquam-dolorum-corporis-sunt\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6Iitrb0RaUXRqUW1HbEZJeHFjelVjaUE9PSIsInZhbHVlIjoiRHpzYUZsL25nZ2VOSS9aa0x3eERVaUVnVFJDZEdLbE9CNnFzdnZnS0lmRkhtZFhyUDl1R05vcHVYeEh2bTdnOHVSSjl5SWtoMG1tMHlMclprZ1NpZk1NSlMxYVJHV2NxS0dRd0FxZzlmR1IwSHlBSEZRblNQQ2VGVXVGcGlsQ2wiLCJtYWMiOiJhZjNjMjVkZjVjMjIwMGQzNzhjMjVlNGQzMDUyNzdmZmIxYmUyZDcwYWVlOGNiOGExZjc3YWZkMDk2Y2FjMTZkIiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6ImR1TlBIOXhmMFhrSTZ0dUkrRFNNR0E9PSIsInZhbHVlIjoiZ3k1RHAxK0k1TVI1Qi96bmVSQ3JHWE5IbnZQZ216ZVBIRCs3MjBtbXBlbTBOVUxhV3AvdzdGaXpZTEN1cXpZQ09RWHNQeUcrQ1FQU2k5RnJYMFM5RXUxKzNKTDcxVWRhRms0eWFDNTVDTjduSGRnNEVzdkVpYTMrNnVGUWFlWnYiLCJtYWMiOiJiOTZjYjI2NGE5NGY3ZWExMWE3MWY1Yjg5MDZiZjFjZTM5MTg0YWE2NDgxOWIwZjZkMWNmODY2YTViOTliY2EzIiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,'Webkul\\Customer\\Models\\Customer',11,'2024-05-06 08:13:16','2024-05-06 08:13:16'),(109,'GET','[]','http://localhost:8000/storage/locales/YuFazk3QsiQb7LqQGB9qpUAb9YTCaW9Cf2TnE2Kq.png','http://localhost:8000/amet-eum-atque-sapiente-quisquam-dolorum-corporis-sunt','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/amet-eum-atque-sapiente-quisquam-dolorum-corporis-sunt\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6Ik11Zll6N1lmaStOdVIvaE1wOFRuYmc9PSIsInZhbHVlIjoiNjhSQnR6d0RIK1pQaVRmTXBjWW5HblBaVkRFTjJ6NjVNbXBxMkdMcXJOTFJ5S1BvSng4SHc3bU81dWVJZ1pIVmM4cmxUOWV0bnFHYnphN0pudU1na1hsSXNnTCtjdld2VWxKNnphYm4wNFU2SkhzWkcrcktIZmFLeVdxcEtQQ3EiLCJtYWMiOiIxZGIzMzQ1MGU5ZmNjODc2Y2RiZjJjNmM3ZWJiYjZiMmI4ODZkZWJlZGE3YWYyMzNjNTZlZTZkZTQ0ZDBlNDI1IiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6ImF5S2VrbzZvck5HYWlWTlNVaFdGdHc9PSIsInZhbHVlIjoiUmhDQmZZMDJUQThITU40a1dEVVNDZjVPSWZ4cndsWUlVZWVTYnUxUmhZVWVUU3NjUFRkK3pGUStXQy93czIrUEJmZk13dDEyUFk3bG5ZNW53VXVudUE2cjJsMnNmMWhQU1RHWDhDbmlHT3lvUnVBQkh0Kzd4ZXZoMmE3a0VycFgiLCJtYWMiOiJmMmEyNDhkNDU2ZDM4ODk4OWE5OTllMjZkZTU5ZjdlMjcxMjBlYzk2NWRiMjJkMjI4MjBkZWExYmYxZGIyOGQ2IiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,'Webkul\\Customer\\Models\\Customer',11,'2024-05-06 08:13:16','2024-05-06 08:13:16'),(110,'GET','[]','http://localhost:8000/amet-eum-atque-sapiente-quisquam-dolorum-corporis-sunt',NULL,'[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"cache-control\":[\"max-age=0\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"none\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6IktVS3AzQzQ2Q0RGTHJFV2YzdjRwMnc9PSIsInZhbHVlIjoiVkpYalBTaTlhSVdPY21TTDY4Q3FmRXh6OEVhUEtwUUE5RHhaOUwwWjRCcW5WZDBoYTdVTFFnanlHV3FldmJLbDE0NUFydTJSVDJNMHpyVVJoYkdaa3gxN1NVbUdVaWZNLzNIZUdaUWg4SzVaSk1iWjBXMFgwNGZQZ0JaR3RnYzgiLCJtYWMiOiJlNTgyYWU3NzIxNDEwM2VhYzhlOTMwMWQ1YjczY2VlZWJmN2ZlYTMyYzUzNzMwOGI4ZWNkZjUzMjkxZDlhZjMwIiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6Ijl0aGpkOXhOY282MG5SUE84U1ZXZXc9PSIsInZhbHVlIjoiT1FETGsycFFUOXZLTTliV2JuNWdqZm1JVHIvUGw4ZFZLSVJEQzEwOEszQlZZNEgvemJINmUrMWV4SXJ4bFZYYWM5c2lKRUNKdVRUWnl0R0ZyMFlnajU1V2VhelE1WjZySlUrYUM2RmV2Y0RNS0hFRUZwd2RpSGdtcFpkSlkzakMiLCJtYWMiOiI4OWRjOGQ1NzdjNmI0YjEyMDgyZTc0ODJjMzQ0Y2Q3YjE2MGQxZWQ2OTMzYTM3MmVhMmFmN2UzZDY2ODExZjhiIiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1','Webkul\\Product\\Models\\Product',96,'Webkul\\Customer\\Models\\Customer',11,'2024-05-06 08:13:18','2024-05-06 08:13:18'),(111,'GET','[]','http://localhost:8000/storage/locales/YuFazk3QsiQb7LqQGB9qpUAb9YTCaW9Cf2TnE2Kq.png','http://localhost:8000/amet-eum-atque-sapiente-quisquam-dolorum-corporis-sunt','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/amet-eum-atque-sapiente-quisquam-dolorum-corporis-sunt\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6IkE3dDVneU1yejZ3NmNQdmRPQ1B4SEE9PSIsInZhbHVlIjoiMW1MUDd0RC90cXc4YlhlUmNBSWF6VStTbXJzenR6amt2N254TTdUaGtLWVBKdTFwMURkOUF5cUVEeUZuUGowZ1pxV1g0eWpKeVp4cXFiZjRwYlNIK3BSM2QyeUkvQ0tSbHVqOFF2NTVzWkkvcHZxejVYdVhjRmFqR2ovZHRQNnEiLCJtYWMiOiJjOWQxMzQ4MzdjMTgwNGFlMWM0M2U4MGVjMzUwMzdhNjZkOWM2OGE1ZmQwM2UxZWI0MDVkODQxOThhOWRlNzdmIiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6Im5jNXpsZVZTV1F1MFYyTGlFMW5HTXc9PSIsInZhbHVlIjoicnhPTzU0ckpYTEt6NVcvMEdhUlNDMWxkRkhjK0RkanphSktSK1ZWMFBONVhYR1prUG9BTlBRWlVIVVlHRTZISlNvVTM4MjdocEJkWTJ2a2ZHYitBVkNOeDBOUEs1K2R4WVNTMmRSdXNmbjI0c29kL0M1VlB0UkJPNGVHak9uZVQiLCJtYWMiOiI5NWE1OWFiNWVmMmViNDRkNTMyZDdiZjNmOGVlYjgxOGRjYjVmYzkxYzJkZjNhYzhkYTUzMjNlNzBkM2JjNTk3IiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,'Webkul\\Customer\\Models\\Customer',11,'2024-05-06 08:13:18','2024-05-06 08:13:18'),(112,'GET','[]','http://localhost:8000/storage/locales/YuFazk3QsiQb7LqQGB9qpUAb9YTCaW9Cf2TnE2Kq.png','http://localhost:8000/amet-eum-atque-sapiente-quisquam-dolorum-corporis-sunt','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/amet-eum-atque-sapiente-quisquam-dolorum-corporis-sunt\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6IlJhQVFrZkN1MDdSMjBmT3RnWHhGdWc9PSIsInZhbHVlIjoiNnJ5bHlGV05JUmpGWE5FUE1yM3h1QkdDSG01WHQ0bCtSNXN2d2tISXY0K0pqRGhLbHF6dlN6dm9xWXBKbVF6RnE4REd2RnNhcFFvZ2FPbDkwTGE3QWo4Z0ovOFEyRnZPd2lKTnJJSVRnVkRjVEpXUGlWd0xXbHYra0JYV1ZCdzEiLCJtYWMiOiIzMTQ1NDg5MDU1NzY1MzkxMDEwMTJlNGFkYTZjMjg2NDdhMmY5YzFhZDdhNjFlMmI0YjI4MjQzODA2ZTcxMjllIiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6ImpKS1I5RTNiRHgvRTYyRW1VdTYyOUE9PSIsInZhbHVlIjoiRmJGYzZQeUVUUUYwMC9DY2hIYlhNZHB4ZEpWalRhWTlwbml1L2ZDWVR0Wnh5d0V6Z2REa3NkRnZDOW1qQ3RMNzNCQW9QYnhKNGhhUE5IZFRiS2swYjY0Q3V0Zi9UTUliNU1QeVNmSlhPRWZkS1RCQ2VjQUQyYzkxbjBLRVdYMUwiLCJtYWMiOiI4MDZiNzA0Yjk4MzNmYzAxOTZiMDVkNDRjODBjNzg1ZWVkNGFmODE4OTc4N2NlYTVlMjJhYWZlNGVlNTExZWQxIiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,'Webkul\\Customer\\Models\\Customer',11,'2024-05-06 08:13:19','2024-05-06 08:13:19'),(113,'GET','[]','http://localhost:8000/amet-eum-atque-sapiente-quisquam-dolorum-corporis-sunt',NULL,'[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"cache-control\":[\"max-age=0\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"none\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6InZyeTQ2WTJ6VWxjNFNNUXVtZWhySGc9PSIsInZhbHVlIjoiL2NwajlpaTdXbkhkTmFPWDlVQU5Bb2ZKU3hMazFWVXlDM3MvYVo3OEtUWUMxSjQxVEpnRldxeFNXTVFsbzhONUtRenAyRWYyS3ovbzQ1YTIzbmZPbGZwWmZCb1duV1lyMGR0aFJWUExBK3grVElPQ0I1RDJsSTdnSFlUNmRscWwiLCJtYWMiOiJhY2MwM2QzMzBiMDkyMmZlYmU5MDg5MzgwNDlmYjFkMmEwMTczZmM3Mjg3Yzg5ZjVmNjFhZDllZWJkZmYzZmE5IiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6IlRYcG84WWhhejIxVXRnYmovd2QzRkE9PSIsInZhbHVlIjoib0Z6K3lvYlZSNTgxSzVjVktqWGlBRFFLZmpMeXZQUEJpbWxEVFkvZUw2cTNzRmx2V0pQK3JzYVhTSGdCeElQYU9LNHVZZXljcWxYZWN4TGZSZWhwaUwxdlV4TGhDYTRTNEg1aGh6NGFFQnQxSERwRXZKSnhvczMwTGNGVjRnNUciLCJtYWMiOiJkZGNmNWJlYzZiOWYyNjUxYzY0ZGI4YWQ1MmNiYTVmYzUzNDg3OGIyYmI2MWY1OWFiZGVkMGU4MGMyMjBmYmE4IiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1','Webkul\\Product\\Models\\Product',96,'Webkul\\Customer\\Models\\Customer',11,'2024-05-06 08:13:27','2024-05-06 08:13:27'),(114,'GET','[]','http://localhost:8000/storage/locales/YuFazk3QsiQb7LqQGB9qpUAb9YTCaW9Cf2TnE2Kq.png','http://localhost:8000/amet-eum-atque-sapiente-quisquam-dolorum-corporis-sunt','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/amet-eum-atque-sapiente-quisquam-dolorum-corporis-sunt\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6Imh2SzVsc295ZHUwYWJSeVBadTIzNkE9PSIsInZhbHVlIjoiVm5DVHVOWFVIZVEzVEJqMWZHdThIS0VwT2lQbzRiZ1BNMlArRjVidlRUZHlFUmZOd25manYzUUVDMGhrRWFtdjVtTWhaL3VHeVVKTGorckFYYWJxR3hDeU1SWjc2L3F3TW5QYlZrcWlSakVVQVdBd3NVOXBScVMyNEl1WEg2Z2MiLCJtYWMiOiJhZGY4MGY5N2IyMjc2OTY5MWJlYjYyODUwMTVjYWUxOTI5ODAwN2VhZmZhNmE5NTk1NWQyMDA4NmZkY2MwN2M1IiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6ImExaVUyUUJUMzNPajkrcDg4U2VuOXc9PSIsInZhbHVlIjoib2RFUEV0bmJKd1VZOXhza3AyMkZ5ZG92NVNPTGZtZ2xxS1VWQ3ZnWlhyK0s2LzRSRU9lVDBuWWxaN2RBelhzc3JuK3NWbXdJWlBZRUJFL3lldHVNOWs0Wm9ZWjIwVmpKTWMyWFdZQlliUVZsczdtN2lYK2JRcG1CRFJ5RFlXNW4iLCJtYWMiOiI4NTgyNTQ1MjM5YWExYmIzYTNmMDY3NzQ5ZGY5MzBiOGE0YmQ5NTM2M2Y0YzJlYmZkMTI3ZmExZTA3ZWZhNmQyIiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,'Webkul\\Customer\\Models\\Customer',11,'2024-05-06 08:13:27','2024-05-06 08:13:27'),(115,'GET','[]','http://localhost:8000/storage/locales/YuFazk3QsiQb7LqQGB9qpUAb9YTCaW9Cf2TnE2Kq.png','http://localhost:8000/amet-eum-atque-sapiente-quisquam-dolorum-corporis-sunt','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/amet-eum-atque-sapiente-quisquam-dolorum-corporis-sunt\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6ImNZblMraHVaVnd6RHBINGlndFhaNmc9PSIsInZhbHVlIjoiQzV1Z0w0Tk1wL3FaekxWUUxYZzA3T3dBUHNiRkhRbVIwb2JJMHNXM21JR0ZTUWlWZUFBTGJlbG1yRHpwUzBMU0NjQ21QQityYUkvdDUyRDg1NGRhcGVrU21jWlp3TUNwdE5Kd25EUnJSVWpONDBYKzMwZTJiRHgxM2kxTDYwc24iLCJtYWMiOiI4NmI4NzY0NGIxZGFmNDcyYTE0ZmEzMThiODFkNzllZThhNzI1MWM2Yjg2YzIwYzZkOTk0ZmNmYzgwZTA5NGRkIiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6Im1yRnk1S21EeGZCeG1XM3djc2MzOFE9PSIsInZhbHVlIjoiQVJ4blI3SkVyYWkvT3BwQXovN2NRN3o2aU9zMFlaeTJSM0JZWExZMjhTc3c2bk1ySyt0emtiRGpHNXdnM0F1MDRCdEI0dnJZTXlEaTZEOW5pNVZuTWViVHhjalhKTCs5L0VCV1V5NGgvM2hqcE1iTUZKVTRqckxvWlpwNCtzRUEiLCJtYWMiOiJmNzJjZjRjM2ExMTRhMzM4Njc5YTE4OWU3MjZhMjI5OGQ3ZGFhNzQ3NTI1OWYxNGMwMDdkM2ZhYmNhYTNlZDBiIiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,'Webkul\\Customer\\Models\\Customer',11,'2024-05-06 08:13:27','2024-05-06 08:13:27'),(116,'GET','[]','http://localhost:8000/amet-eum-atque-sapiente-quisquam-dolorum-corporis-sunt',NULL,'[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"cache-control\":[\"max-age=0\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"none\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6IjRVdDY0NTRtaytyRmFXb3p0bTJPYnc9PSIsInZhbHVlIjoibk9FWEhCbXdHUEJVVU1uamRKVEh1eXMyREtURXFYSDRzWlZIbkNobjJwTEN1UGZjMmh0MnBwSllhWFRwTGRlZHdaSEIzTzJTNDltbTVwbWFOZHBiWlVWaG9uR1M5K3d5UDBjYlFWWUpDMEpiRjNIQlhmY2ZQai91TlpoVlBhQWMiLCJtYWMiOiJlOWVhNDkzNzU4YTM4ZTkyM2FkZmZiMzNmZDE4M2FmYTdkZGRkYTVkYTQyYzlhOWVlYTc3MjkwNjA5MzhlOTA4IiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6InY0dStCZzNIR055bjVNZy92cmFGRVE9PSIsInZhbHVlIjoibXc4aEpIa2tRU2x1MzJsejUzelJlWllTUzllT3JMaHoxVjA2cUFJUW5LVW5Qc1J3MVRrd1hiMm85Zk5uZURTY0RzRDRxbkc2UFdFOENINlBWZ0s0aUM4OEZHTml1SUtXS05MYmxNRWVWVXlienA2QXh3UGJPRXJkRTJEVUQrUEsiLCJtYWMiOiJjYTFkMjU2MDM5OTA5NDM4ZTVmYmQ3NWNhMDYyOTczZTg4ZTFiNTMyYWMwZDcxOTZlZDYxZDIzNTVkNDBhMzZmIiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1','Webkul\\Product\\Models\\Product',96,'Webkul\\Customer\\Models\\Customer',11,'2024-05-06 08:14:49','2024-05-06 08:14:49'),(117,'GET','[]','http://localhost:8000/storage/locales/YuFazk3QsiQb7LqQGB9qpUAb9YTCaW9Cf2TnE2Kq.png','http://localhost:8000/amet-eum-atque-sapiente-quisquam-dolorum-corporis-sunt','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/amet-eum-atque-sapiente-quisquam-dolorum-corporis-sunt\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6InAzd1hCL2dPQnJ2SGJ3bFVYRWFKbUE9PSIsInZhbHVlIjoicW14T0ZCYWJnVVJVVWlsejhlT2VzR3BVVkVxeHVmd2tVeWpDSkJ1V1diMVZmQWNTbUFScjNNN0kxWFFwV0Vyb1llU2ZkSHFpTFROVElVL2U0bE9YYkZMVVBhQmN0bVhyaXZhZERPY2JOMFR1dSs5Yk4vUU02VTdra1IzeS9FbisiLCJtYWMiOiIzYjk2NGQ0M2RiNTA4OTU3MzlmNGZiODhkNDA2NDQ3ZjE0ZGRjMGE3NjZiMTEwYjI0MzFmODFmNzQ4NGQ3ZjVkIiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6ImloOXp5UWk2QThzRzZiOWwvY3UrakE9PSIsInZhbHVlIjoidHFBbzl5VVkyUFZmeEFpU3kxTEI4RjZKenVlbjNKVDdSQk5UUUpYRkVockNwelBtTnhEaWpQZndBd2c0ZTdTWnp1aG81RE1UbkZlemVoYWttQW5Cb0ViV1o2VmZCNVBEaTZ3dVhzK1JVL2xjQ3c1T1FuUU1LV3RuUm4veVpaWTQiLCJtYWMiOiI1ODRkZGM1MmE1MTJjOWY0MjExNWEyZDJlNTZjZTVmYzA1M2EyZmE0MTEzOTQyNTA1YTU0YzE3NmU2YTZiMzhmIiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,'Webkul\\Customer\\Models\\Customer',11,'2024-05-06 08:14:49','2024-05-06 08:14:49'),(118,'GET','[]','http://localhost:8000/storage/locales/YuFazk3QsiQb7LqQGB9qpUAb9YTCaW9Cf2TnE2Kq.png','http://localhost:8000/amet-eum-atque-sapiente-quisquam-dolorum-corporis-sunt','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/amet-eum-atque-sapiente-quisquam-dolorum-corporis-sunt\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6IktJdG5IOGRrRzhCNlJmanQ4aHpxSnc9PSIsInZhbHVlIjoiQjlTUTdYY3dPQTdESE5hVDFFRUNlRG5HQ09kdHRQR20za0orbE4rOTVJZnJDcGVpZHd4dlFpSVYwQ2R2Nld2OE9PMUdrTUVDVG9ORXZVVGtWQjdyQ3JMOUpsOEF3U2hUR1YwUEV0NnVoeXEzTGtYcEhrOEs2ZFdJNjJUQXVrUnUiLCJtYWMiOiJjYjM1NjJkODljMGFjYmE5OWU0ZWRlMWNlMmJiM2NkYTViMWRjNWFhYWE5Mjk0ZjI4NTdkMjZhZmFkNWRjM2NhIiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6IkF0bjE4YTZ0R2k3VjZkaFQ2QkU0WFE9PSIsInZhbHVlIjoiTlE4RVBDR3dMWDRSd2tLaXhCRGtCRTVuU2pmTzZJbmc2ZWZUZ0FhanV4cldxa0NwU3VTZ2JGZE4vVnVIRm5qenV4aFhudjdaQ2V3UWE5QjlBY3FSTEhqVXRLOVh0dTl1NmFBS0MyVHQ5TEo4a3pIN0lFa0JTa2xjMGVKT09udHMiLCJtYWMiOiI1NjEzODk0ZjU1NzY3ZDA0MTE4NmZiYTM1YzVjYzIzMWJiM2ZkNTFhMjRhMjk5OGE3ZmFmZDMwNzc3OTUyNTA3IiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,'Webkul\\Customer\\Models\\Customer',11,'2024-05-06 08:14:50','2024-05-06 08:14:50'),(119,'GET','[]','http://localhost:8000/amet-eum-atque-sapiente-quisquam-dolorum-corporis-sunt',NULL,'[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"cache-control\":[\"max-age=0\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"none\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6IjV5RHl6Yk5TZGRNNndOQkxWall4aEE9PSIsInZhbHVlIjoiZFY0MUlZalM1a3ovSjc4bWM4NWVkMHlDZXFMVFpGWjVaeUZQUjRIdDVWQUpEQkxQQjA4THBhcWg2Y0ZneVVWMUhOQ3RTNGtHYk5yRVpaWlQ2VGNMcmtSMXNRbEpLKy9FWThGbVhFdlJBWFBudXdFMjYrdFg0aWx5SE9QT3d3eUciLCJtYWMiOiJmYWIyMTkxNWJiYmEyZTdjNGEyMjQ4MmI2YzlkYWM3ZTA0NDY4M2ZjZDJiNDE2NmE4YmUwOGNkZjViZmJhOTk5IiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6Im8zRGQ0R09jTkR0Y0E5Q2VHMjc2MGc9PSIsInZhbHVlIjoiemhiMmRqRERrMXZ5RWpXRERKU1hmRWZrUGd5Qm5LYXhKWWJ2b1l2UUNQMFdWZXNrU0xTSk9ZNCtxRUVmUGxNVDlRR0Nvb0toREVjdHpXKytXekVqOGNjVkZjL0hEbWVEVmlFZWVncS9BdFpDbkdsVFVSdGVEbXdBVnNXZmRwTGYiLCJtYWMiOiIwMTdiZTZhOGVkMzE0ZjRmODE3ODY3ODYxMTE3N2Q0NDEyNGNlNzQ5NmUwMzY5OGMxYzliYzVkZDA2ZjM0NjlmIiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1','Webkul\\Product\\Models\\Product',96,'Webkul\\Customer\\Models\\Customer',11,'2024-05-06 08:15:34','2024-05-06 08:15:34'),(120,'GET','[]','http://localhost:8000/storage/locales/YuFazk3QsiQb7LqQGB9qpUAb9YTCaW9Cf2TnE2Kq.png','http://localhost:8000/amet-eum-atque-sapiente-quisquam-dolorum-corporis-sunt','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/amet-eum-atque-sapiente-quisquam-dolorum-corporis-sunt\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6IktFWWpRQnhPSmgxaVlXN0NYQVZUWnc9PSIsInZhbHVlIjoiTnc2TVJ4TVFVRzZ2L3BLR2NxT045Uzk5VXhoZGxsM2FhZVRleXBkejJLSUEwMW12ZGVhamg2NGttMUkwTytpeGhjYWFuTVR5TWwwSlVURmk1ZnBUT3NaNDZZb3ZsZ0x4ZUJsR2V5b0dEKzlnVkxaVzlXSnVjODlNc3B1SU53M0YiLCJtYWMiOiI3NDMyNmNkZDM0OWI5OGY1NzU0YzQ2NGVmN2RmMjJjNWQ0NGRiZDcwMzFmOTY3OWE4ZTIyNmNiMTkwNjMzMWQ3IiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6ImxCczhsUjAzWUd2d2x0T3dzbWdmVlE9PSIsInZhbHVlIjoiL3lpYUExd0tUUnVxSi9UYkFIaVRFdGI0NkwrN3F0WUZvMS82VGp4YTNLaVQrbU9sUjdkY05zaUVqRWVHQXJCT21ncThERjF0T2RzMUs3SUhZQTNMNmc4aWNUZzQyUnBiWE8yVjNoaUFWV0hKZkpCQjN0K2ptMXhVUWJBTGFScVAiLCJtYWMiOiJmMjE3ODdkMTUxOGNkM2NmMzVlOWQwY2QzYTQ2OGQ4NDliMDg2NzBmOTk4Yjg5M2NmM2M3NGRiNWQxZTI1ZTZhIiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,'Webkul\\Customer\\Models\\Customer',11,'2024-05-06 08:15:34','2024-05-06 08:15:34'),(121,'GET','[]','http://localhost:8000/storage/locales/YuFazk3QsiQb7LqQGB9qpUAb9YTCaW9Cf2TnE2Kq.png','http://localhost:8000/amet-eum-atque-sapiente-quisquam-dolorum-corporis-sunt','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/amet-eum-atque-sapiente-quisquam-dolorum-corporis-sunt\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6ImxUYzBRa003UnE1QU1MYWlXUEY3U3c9PSIsInZhbHVlIjoiakhXMnBQU0dQNVFkTkdYWkFHOE5adHE1V2tUTlIyVGhBM004VlhuejdSMm1HSGdPVFR3N3pWbVlZeGhZVzFlQWtCb0N4RGdweHcrY3J6OGswVmJXZGRzZzhmYUxDTW1CTmFOZmtLUDE3QlJEUzhoL1Y2UGc3N3Z0QXVLOGhSakEiLCJtYWMiOiI2ZjQ0NzA4NjEwZGIwYWVhZjI3NmJhYzhiZGUzOWQ1ZGU4NWMxMTU5OGJkNjMzZjBmYmVlMDc5MzY2MmYwMzUxIiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6Ikg4ME5sN09PVk1qYVhSTWpWL0lNd2c9PSIsInZhbHVlIjoiOEgxWnI3OStvcG9JUGRwekVJM3dsMXFEQk5xKzkxL25IL3lyY1JBYjFiVld3QThLWFhtVlRSVkRTQ05heXRheVIrYW5Yd0loODVkc1dlK2EvY0hXT3JhK05CWWcyS290TEswcVNOVkdOTVFZeGtoby9sd3dlNG9LUThHUC8zZDMiLCJtYWMiOiIzMjU2NjVjNTRjNmUxYWQ4M2VjZDgyZmE0NDc3MjMyMjgzMzI0MjkxMWUyNTVjZjYxNzlkMjQyMThkYzM4NzcyIiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,'Webkul\\Customer\\Models\\Customer',11,'2024-05-06 08:15:35','2024-05-06 08:15:35'),(122,'GET','[]','http://localhost:8000/amet-eum-atque-sapiente-quisquam-dolorum-corporis-sunt',NULL,'[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"cache-control\":[\"max-age=0\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"none\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6IklLSVRuMTMwbE9aSVdUR0ZqWVBQU1E9PSIsInZhbHVlIjoicVFxblpvemFDK0xZcENwTFlUblpNZFF0YnRjTThlczFZYUl3dmtpZnlIK0JXM2FLbHBsbVZnN1Y5YjAzTVZ4YllCaWdiVDBpd1NqSytQQ1lhRmNpUkFCRHlhL05EOXBDTHc2WmZSaFpDc3pJc3d1K1B5NkVnRjl0dTZWSU5jai8iLCJtYWMiOiJmZjczYTUxNjM1NzkxMGQwYzFkNmIyZmQ5OGNmYzQ4ZWY5OTE1MDM4NDkyY2UzM2JmM2YzOTg2OGYzN2U3ZmFhIiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6Ikp0QW1rbVhucjNMS01XTVFpUndmZmc9PSIsInZhbHVlIjoiZlNWemMrYnRWbXFSZjY0dlNsQXhKVFJycHpMUTg0d1NFc1JzR1B5ZGNOUnovbEllbXpZNlF6QStJUy82aWo1ano3UVlPa3M3Z1NwdXBuMWN4NkE3UXpwcUQ1cU1KTURHZWxVVTFCRFY0OXNvd0lsajdnZDNHTzVTbGFZcGpMQ0kiLCJtYWMiOiIyMmNiMDM4YmUzN2FjZmY0ZmRiMjljM2QyY2VjNGNhODI3YjEwN2EwYWE2MTg2ZjQ1MzcyNzQzYjc4OGNhMDM1IiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1','Webkul\\Product\\Models\\Product',96,'Webkul\\Customer\\Models\\Customer',11,'2024-05-06 08:15:53','2024-05-06 08:15:53'),(123,'GET','[]','http://localhost:8000/storage/locales/YuFazk3QsiQb7LqQGB9qpUAb9YTCaW9Cf2TnE2Kq.png','http://localhost:8000/amet-eum-atque-sapiente-quisquam-dolorum-corporis-sunt','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/amet-eum-atque-sapiente-quisquam-dolorum-corporis-sunt\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6IldGZE5LR2NzbkllamxKenFoaGNJRUE9PSIsInZhbHVlIjoiNTRvYWZqT001NWV5QWh6ZlFMNlpyZ3BheGJlaWNoOWlncmRYd0RvSG9ncFZtRG5udEhqZDdvKzJPNjJMY1pLbmx0KzYveHJEQmtSVzh0ZlRCdFVWYkMzd093NUkvUThwbGdqTkhtRmdRSm9xeXdJQkpuMWRLRGoxclUzY2JRdVEiLCJtYWMiOiI5NjJlODZhMDZkOWE4NjZmYWNjNzExZDE4NzM1NGQzNzMxZDZlMGJmZWE1NGNmNzcwN2JmMTc0NjhmMDQ5NmExIiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6InlPaVNTaHUxbjN6VFJMNmkwd1NhM2c9PSIsInZhbHVlIjoiZ0F3eEFGeFloYVZTdWcvQ3pPcGJHQnMyKzNNRENhZWlIYUUzY0hqSmt0ZXFOQ1NVLzR4K2IrcHpZZWZ2dStKZ2N4Nml3SjlhRzNST1laaUNscEJ3eFAveldCUldJY2RwS0hoU050QmtXUXFHelpzNVoxSWJGQVFqRE8rZGkyQzQiLCJtYWMiOiI3ZjY1Y2NhMGYwMzc4NTliNGM3YzI5OTY0OTI5MDFmNDVmMGI3OWQ1ZmE1MTkwYjZmMzk1Njg4ZTM5ZWJlOTEyIiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,'Webkul\\Customer\\Models\\Customer',11,'2024-05-06 08:15:53','2024-05-06 08:15:53'),(124,'GET','[]','http://localhost:8000/storage/locales/YuFazk3QsiQb7LqQGB9qpUAb9YTCaW9Cf2TnE2Kq.png','http://localhost:8000/amet-eum-atque-sapiente-quisquam-dolorum-corporis-sunt','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/amet-eum-atque-sapiente-quisquam-dolorum-corporis-sunt\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6IkpqUUtUaVJVaVVKeGltZXd6WlJRYmc9PSIsInZhbHVlIjoiQ3FpT01nWVdZV0pnRGZQRnpWRHZUaFd5SlZlQ0VwODNYZVJXbG85QXFzZklsOUkzZ29zTU5NT1k0RmtvaHNOY2NlOG5wZ1VlS2trbTBrUmRQVldwM0pBYjZQK0p2dHpUbkptcHJDcU9DNlZWTjhweHdDaUluREh0Wm5nRWUwWjEiLCJtYWMiOiJlMGJlODllNmUwNTRiNGEwODRmMGY4YmNkZjUwZGVmYjA0ODUzMWQ0NWM2YmE0OWFkNDZkYjg5YTM2NjcxNTRmIiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6IlNNUWhtTzAxV3BibnVrY2JjQTlQd0E9PSIsInZhbHVlIjoiczI2cGRQU2JOaitBMHZGeStxTFdoc2ErNnZCU2ZYUEpTZDdLR3BVdDljMUxUOUtZMUJYUGhmUllGaUF1eHNkdU9ydWRqd0x1UEpxMFhCU0dFZTJnNjE0Zm9JWFowT3RNb3VRWTNQeXdNRVBOcDFvSEcrVXpHQ29WUmhuazJLbzkiLCJtYWMiOiJjMWI3MTZjYzgwYTUzYzFhZTA3NjIxMTVhODcyODk4YzA1MDk5MzQ0Y2RmYmFlOTMzNDRhNzllN2FlYjQ5NDQ2IiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,'Webkul\\Customer\\Models\\Customer',11,'2024-05-06 08:15:54','2024-05-06 08:15:54'),(125,'GET','[]','http://localhost:8000/amet-eum-atque-sapiente-quisquam-dolorum-corporis-sunt',NULL,'[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"cache-control\":[\"max-age=0\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"none\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6IkErNDRJblE5MXJ1QkZINVBYWTQ1R0E9PSIsInZhbHVlIjoiOTBaVk5zcFJZZml3cnhldEZCSnRXaHY0TGNWNEx5SWlqcXU5b1phWHVVQnBoTGtiZHdtT1pYcHRVNVNDZlZWUlV6S0dUeUFyMXBRUnF3UHJyQ3dKWDRzWnNNMHp5TXNTQUNKWkNBMHE5SCtEUE9JQWtUQ3VKTFN1T1c5aFhMeVEiLCJtYWMiOiI0YzJkYzE0ZTkwNzIyMWI0OGE4ZjQzN2MxNzRiNjdlMDI1YTAxYmFjNmFhMjYyMjUwOTBiNzFkMDcwMjJhMTlmIiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6IllaSGVDYllacENYRzE4d1NXRXArV1E9PSIsInZhbHVlIjoiNTNEaERZLzI0cVpndlZiZHVQdXdhRkRWWmM0UXo1ZjNDMGE1V3A2L1hvOFlaWnlZK0QwNm9FVG4rNGJLYkw5TVNDMjI0cjVlc0NDQ2F1SVlzOUhVUG5PcUpWRmNLU0xrNml4ZStwaUkrTGppeFdsNG5nVkUrQlE1Uyt6N3REYm8iLCJtYWMiOiI1NzI0YjQ5YTQxMmYwZmJlYTU5ZTYxNmMzMWY1NmIyMTg2OThhYjkyZTFkOGMzMTQ3OTlmMWMwODM2MWE5MDRkIiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1','Webkul\\Product\\Models\\Product',96,'Webkul\\Customer\\Models\\Customer',11,'2024-05-06 08:16:17','2024-05-06 08:16:17'),(126,'GET','[]','http://localhost:8000/storage/locales/YuFazk3QsiQb7LqQGB9qpUAb9YTCaW9Cf2TnE2Kq.png','http://localhost:8000/amet-eum-atque-sapiente-quisquam-dolorum-corporis-sunt','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/amet-eum-atque-sapiente-quisquam-dolorum-corporis-sunt\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6IjRvTm5SbW54Yjg0WjlaWEFzNjZabHc9PSIsInZhbHVlIjoiV25uTDhzeURPbWVOVkExTFVWYUpxbDQ3YlhDcGxYRUV5eU9VbHJEUmh2dmRxUGJrd0tteTVJNTRuNUFmb281ZFFDMlRIaXUyenZtZ0RmNG8xRlJ1c3BvS0l1OU1CNW9paWhMRldPVjhCVXJTd3BrNnVyR3k2b0crRlpnVkdSRHgiLCJtYWMiOiJhMjUxZTAzZjA1NTJkNTYxOTVjMmE4NzZlZThkYTc2N2VlNmNjYzAxODJkNjdlMTA2Y2UzYTY3MzI1ZmU2ZDczIiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6IllXQjhzejZJT2htK0ZSMmdnZFhDY3c9PSIsInZhbHVlIjoiemJyem5rTG1yWGo2eUZrK1JoZXlVK1JpMW5uZFpEUUJiVXpyc3g1U2dZVWY0RURjdGVoNFczemN5YmJlYWhCN1QvMmpFT0Rya0xGNDduVlplSm9iOXBuS3VRdDhLZkQwcmk5VUhrYzgzNXRyc25oTHR3b21tcHowS2MrRUVPRXMiLCJtYWMiOiI5OGRmNThhMzFkM2ExODVlZWNkNGZjZTFlNTVlNWM4MDU0YTQ4Njk3ZTY2ZGZlYTRkOWFhMGJjNzg0ODYwODM0IiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,'Webkul\\Customer\\Models\\Customer',11,'2024-05-06 08:16:17','2024-05-06 08:16:17'),(127,'GET','[]','http://localhost:8000/storage/locales/YuFazk3QsiQb7LqQGB9qpUAb9YTCaW9Cf2TnE2Kq.png','http://localhost:8000/amet-eum-atque-sapiente-quisquam-dolorum-corporis-sunt','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/amet-eum-atque-sapiente-quisquam-dolorum-corporis-sunt\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6ImhDTk5RTzdSNGFYUGJJbHJIaUFSSXc9PSIsInZhbHVlIjoiU2EwOE1kTzVpQUgxbEVRalduTU1aTGtoRmt5OCtyblZXWVdzaHYzUjdyVzM0OVBGdkpVZVRpTzcvR2MrVTRTZCthUlFwWnUveE9JS1NqOHJUc0V4aHBlUzVCaURUeHhuQjdJUTQ1RkovaW4yZW5JUWgxaHQyNy8vbDNrRkc3ODIiLCJtYWMiOiJiNGRiMjIwYzYwNWNmNmNlOTZmNTcwOTEwOGU1ZmVlZDEzZTA1NDc5MjZlOGZmMzkwZGJmMzJhN2FkMjNhMTI0IiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6InprT3prVlZJVkd4cGpXWk5neXFPcEE9PSIsInZhbHVlIjoiQnVzTU9GUkF1OFViNEh4d1VqUWcvZDJLUnVSdUxBRDdMelZzbjFWQi9zd0tqa0RWSnZEbjZ2bExUQTk3ODNLQ1Q3d25GVGE0UGhnRDFOTGRUdXdBdFBWTzduWWsxeVJrdS9USmdvTDFMb3FiaG1ZZlFjbU1UVmxadkZyaDVrUWMiLCJtYWMiOiI1ODUzMTlmYzJhZGFhMmU0YjBjMTYzNWZiNjg2ZmM0ZWU2NzMyZmJhZDE2Yjg2NjUyMjkwYmU3ZjlkZDUxNGMyIiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,'Webkul\\Customer\\Models\\Customer',11,'2024-05-06 08:16:18','2024-05-06 08:16:18'),(128,'GET','[]','http://localhost:8000/amet-eum-atque-sapiente-quisquam-dolorum-corporis-sunt',NULL,'[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"cache-control\":[\"max-age=0\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"none\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6IlRxZUpOM2lUQlMzbzR4WG8wakErMkE9PSIsInZhbHVlIjoiK1FrQ29tUnBZVkxzc0ExSkJXc0xXU1lVNFQrcElZNDdOQW9OKzlHY0hIYTVCM1VIZXErNHNBZlJMcnFTMEhmS1Q2TjUyMC9vVlprWWc0OWZxbG1yeVEvZ1QremY0bzJmRStReE53YjgrOTdnWW9RT1V5Nk03TTRPZldXMUZkSTgiLCJtYWMiOiJmM2Q5ZmY4MTMzOGQ0OWM5YmFlODYyZWZhMDE5OTA3ZjhhM2UyNTY3NDc2Y2FhMTczODdjNzlmZTQ2ZGQxMGZhIiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6ImQzYjJ2a3A0ajB2R2psdDBRZm9lK1E9PSIsInZhbHVlIjoiN1lFZDhndnFmbkZ6YlBoQUlBNEtXeDM5aVpkTUJRSGgwQXZwdURnbENTZE14ZlhPaTl4bFY5Qms1MHIrVGp0WHZwVjdxZlZXUjFFZmp5VmFkWEI1UVJ5Y2I5ZTdXcHZZWmZCb3JNbFdtdzJac2VFSVBuSzZQbTRRL1Zoa2krYUEiLCJtYWMiOiJlOWRiNTlkNzExNmQwOGNjOTQ5MDRlMWNmMGU2MWY0MzUwOTVmYTVhMDIyNGEzYzlmMGQ5MTNmYTFlMmIxZDAwIiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1','Webkul\\Product\\Models\\Product',96,'Webkul\\Customer\\Models\\Customer',11,'2024-05-06 08:16:32','2024-05-06 08:16:32'),(129,'GET','[]','http://localhost:8000/storage/locales/YuFazk3QsiQb7LqQGB9qpUAb9YTCaW9Cf2TnE2Kq.png','http://localhost:8000/amet-eum-atque-sapiente-quisquam-dolorum-corporis-sunt','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/amet-eum-atque-sapiente-quisquam-dolorum-corporis-sunt\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6Imt2M3V6Z24vZ1ZJK040Mmh1UnNBVkE9PSIsInZhbHVlIjoicmc2UzhaUmNoZHNyQkdjMTdpL1JndnhWcGZDM2lYbEFPT05yT090SExEekQyZzdrZlpCaWtmNG40a1BwMHVjdlFUd29WTXlrYTErOTFyK2JWNU10ZjZvbGV0MTJ0bGJCT2JiVHpRYS9MdmROOFBZaVRqbFJuVk10RU8xVFJrUTciLCJtYWMiOiJlODJlMGU3MDNkYmY2MTU2ZGE3MTBjZmY5Y2UxN2NjM2RmM2Q3NjBlODhmNWIwODAyMTJmYTIzNDYwNWIyYTE4IiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6ImJaelFxQU5aT1p3anFkM2lRNHBJOUE9PSIsInZhbHVlIjoiY2FuMW5hbDJUaTl5ZktTcElFcUR4VzA1SVpRNUgwTk5EazRLSmY5dUJOaXdCQzlDbXh2OGs5aGlITk0rRkJ1Y0RLTnJQNzM1RHp6TmZ3bE5aaXFCeU1EOGo4enZMUUdlVDhhL0lieDd1ZGYvRVQ4L25JUjU4TzE2RmRTeW4xa0ciLCJtYWMiOiI5YTAxZDllY2FkMmYwNDQ1M2NlNDA5NjVmNTZiNWU5YTY0NjlkZTdiNmVjNzIzMTQzMTlhYjJiMTA2YjYyNWI5IiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,'Webkul\\Customer\\Models\\Customer',11,'2024-05-06 08:16:32','2024-05-06 08:16:32'),(130,'GET','[]','http://localhost:8000/storage/locales/YuFazk3QsiQb7LqQGB9qpUAb9YTCaW9Cf2TnE2Kq.png','http://localhost:8000/amet-eum-atque-sapiente-quisquam-dolorum-corporis-sunt','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/amet-eum-atque-sapiente-quisquam-dolorum-corporis-sunt\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6IlRoNS8wb29FZEhtdnZ0U1lCaDZ0M2c9PSIsInZhbHVlIjoidkJrYURybEEvZzJFYUNyM0lpZnJteDNDeU90WHpIY1ZjN2d4eWN4Nk4xTTJHVDQwU3RZQlFnS1B0TVg3KzJhSmFQN1hQdlA2SThpclJoWG1RVGtEQnlTZzh2ZU1oUFlvcFJ4RFR2SC9teENSMldNeGpPSXlRbHJFdmtXNEdXa1YiLCJtYWMiOiJjZjcwNTM1ZGQ4ZjZjYjVmODUzNzFhYjIzM2I1YjMxZmE5YTk5OWE5ODAwNTc5ZGFkODA2Nzc5Mzk1ZTkyNzUwIiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6InZQWFV5ajdrSGpmTmV6NmR3a25jR1E9PSIsInZhbHVlIjoiR1UxU04rUzBPWG9GV1Fvd0dxNVpUSE9UNmdsQ2d4SXJ6ZmRMUWxycU04NkFJNEdNWmQwVXIrTEU5bWNJdFE2Q3h1amFvUXUrM3JUbVJ6YjJ1N1A3QTJmVVJSejBxbVQ4L09WL0V1VkhZNUNGUkU2U2NVSUJuSW9scXVCOWtBSm4iLCJtYWMiOiJhNDRmNzZiZDU2MTc4NjNhMjc2ZTNjZTE2MDIxMTkzMDE1NDZkMjc1YzQxN2Y3NDIzYjcxZjU2MjYxMzQ1NmYyIiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,'Webkul\\Customer\\Models\\Customer',11,'2024-05-06 08:16:33','2024-05-06 08:16:33'),(131,'GET','[]','http://localhost:8000/amet-eum-atque-sapiente-quisquam-dolorum-corporis-sunt',NULL,'[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"cache-control\":[\"max-age=0\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"none\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6Inl4MGJFQ0Fib1pUcmhVT1BsZnprRGc9PSIsInZhbHVlIjoiN0dOSVEwQzV0OXRVR0E2QlRrVkpJclI1clRiTzQyQmRFTUFtQWxXTW11UTFaQlFSbnJzNjRTZy8vcG9PZkUwVkNpckUzR1Z4czdNR3FQRnlVeHR6Z1A5Q0E1VnJqSEkzYndqeEQ4S2l0NU5Ra3dPZFF5Y3cvUjRFZGo4VlpoM3AiLCJtYWMiOiIyNDBiNWIxYmNkM2EwZWI4NzFiMTgxZTZjMzZmZDgyZWE4NTBjZDEwMTZhMmRmYmYyYzQwOWZmNjllZTQwZDQ1IiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6InA0UEZDM09MeFpDMitNMk56OXhzREE9PSIsInZhbHVlIjoibWE2eGhnRlpORzI5MWFnY29zS3Fic0tmY01mNDNVY3dSRTVmMGl3TEJWQVdTU0xZQk5kbUxuSTVaaldUbUJCNXJRYkhvakY5SjZrNG1XeUlSaWpmajYrbXJwOHdhVjlNVXd2TTNVOVlOSTd2NXdNd3F0bHhpNStHaUFGS0tlWEQiLCJtYWMiOiI3MWM1MzU4NjhhMjRmNGVmYWVhZjFhZTQ0NjYxNWJjYWE3MWQyZWQ0ZDIwZTBhYWU5Y2YyMjk1MzY1NjcxZDI2IiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1','Webkul\\Product\\Models\\Product',96,'Webkul\\Customer\\Models\\Customer',11,'2024-05-06 08:17:19','2024-05-06 08:17:19'),(132,'GET','[]','http://localhost:8000/storage/locales/YuFazk3QsiQb7LqQGB9qpUAb9YTCaW9Cf2TnE2Kq.png','http://localhost:8000/amet-eum-atque-sapiente-quisquam-dolorum-corporis-sunt','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/amet-eum-atque-sapiente-quisquam-dolorum-corporis-sunt\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6IjkwUytKVTkzM0lJa0M4eXhGREZOTFE9PSIsInZhbHVlIjoiTDMvdDZhT21ESVA4bjFlYjBDRVNSdDhhdXVqRWZBaWZkb0ZWdER3WXM1M3l1ZStheVBFUXdYN0NqZjVmeHE5bllaTXR2bkJTT2NWQVNjNTJsMncvN0thUEpXaUJ1WGZ2N2ZzNnY0d2hOYkpXaWVXT1BUbHd1WmpUaUNPY0ZwZ1YiLCJtYWMiOiJkNTA3Nzc3MmIzNzAyYjA1YjZiMDJmNzE1YTc2NTdkZjQ1NThhYzRmMDRhMDUyMDQ4ZDFjZTBjYzE2MzVkNmQxIiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6ImRCUFd1SngzbGJDNHR5Ujl4bnlDa1E9PSIsInZhbHVlIjoiT1Y0aHgwd3FJL0ZaSzVTOEdWY0g0a1poS2xsOXZraVJSR3U3b3NwTWljOVJKQnNWdGVMTmY5a0lES3NUanJKVTB5STdNWXlvT1RCWkcyNnhYd1Ixc2pKWUJQNDdNYXpuSnlRNW1xbS9mRHE1eTNVVkR2ZzBQMXI3TjBzOXJGdisiLCJtYWMiOiI3NDJlNGVlMGRmYzZjNDA4ZmNjZDkxYjQ0YTQ3ZjhjYThlZGU5MjE3ZmMwMjczY2EzOTk3NDcxNWY2ODBkNWY4IiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,'Webkul\\Customer\\Models\\Customer',11,'2024-05-06 08:17:19','2024-05-06 08:17:19'),(133,'GET','[]','http://localhost:8000/storage/locales/YuFazk3QsiQb7LqQGB9qpUAb9YTCaW9Cf2TnE2Kq.png','http://localhost:8000/amet-eum-atque-sapiente-quisquam-dolorum-corporis-sunt','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/amet-eum-atque-sapiente-quisquam-dolorum-corporis-sunt\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6InZiU2V0ZmtkajZRcFlmZ3ltTVc0T2c9PSIsInZhbHVlIjoiSnM0L1IzVTlLODcyeU9NYUdkUzcvU3pYOTVDVDNRai9RbDN0TU9mMVhwWkpsbnFpOElSdURFSnJFQnBaSHlBaE1SR2pJcmEwMjdpd2ZEdWcxQnNPeWxsUkcwcXA3Qm1pNWU1Q0lUQThTRHMzUzVMNEQ4UjR3MGJ4N0VuUTA0YVgiLCJtYWMiOiIyZjM0YmNlMGNkZmRmMzc1NjJjODY0OTVjMDI3ZDdjMmViYzE5MTIzYWI3MTliZTU3OTdhMDk5NmMwZmUyOTZmIiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6InpOd0tvZDcvUGNwbHgzQWNzaWFhQkE9PSIsInZhbHVlIjoieXhXc0x6ZnU5ZXdQWm1DK2p6UEJHTHBFdzhuU0FheXkxdnZaYm9Oc1NFbGY2SXUwOFBvcVBTUlRuek9ZQlhMaVJzS2NpdjhISGxvOGdUR1Rkck40aThpZTVHQlprZlhsOWpUS0t6SEZIMXVCQm5vVm9PS3c2QzNYc1FqbHFiQnMiLCJtYWMiOiIwMWFhZTAxMTM3NmRhNjBkYjAwNzRkYzFmZmNhMThiYWNiMmZiODgzOTc5Y2Y5NWYwYTExY2YwZTU4ZDIxNDRhIiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,'Webkul\\Customer\\Models\\Customer',11,'2024-05-06 08:17:20','2024-05-06 08:17:20'),(134,'GET','[]','http://localhost:8000/amet-eum-atque-sapiente-quisquam-dolorum-corporis-sunt',NULL,'[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"cache-control\":[\"max-age=0\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"none\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6IlVsY0IraWNYU25qNmV0azZUNmhoeGc9PSIsInZhbHVlIjoiU1pHcUxabGUzM0xaUEZZWHFQRXVlRjllaXBBLzV4Q0hQUWlIbmFpR25WWVVLWlZQcjF5dWVCK3FYVjFQUG9XakowNGQyU2RqMXBVYmgyOU1rU1dSSkk2S0dzbFpRRlZoSktWL0lWajZpZnF0SXJZcm8vb296WnRJTTZrWk1QeTUiLCJtYWMiOiI4MWY5Zjg2NDAxODIxMDU4NDBmODIzMjUxYjk1YThiYzc5YTRkMjg5ZmNhNDI4OGMyMzRhOTBmZTI5OTA2YTg5IiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6IkJ1MWJSK0FOdG83aFBnb0hmUndPd3c9PSIsInZhbHVlIjoiaU12WnF1akNEanBOSCtaMVRsNzNBQ0lOUzBHZ2J0N0FMQWs2WUZ0NUlpMjFEazM1blM5ejNCOERFWkZKQ2hVQllMQXowNm81TGNGUzlPZEJVVVA1d2lWQUw1OGdQc0pkWS9RbURLT2p6TjVzdHpxKzRLdXNKeEJENHdQOUhkb3AiLCJtYWMiOiI3ZTVlZWQwZjlkZDI0OTExNjE4Y2YwNDJlZGI3ODZhMmI5NWE4YWRjZjU1YzIxNjZiYmZmNWI3Yzc3YTEzOWQ3IiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1','Webkul\\Product\\Models\\Product',96,'Webkul\\Customer\\Models\\Customer',11,'2024-05-06 08:17:36','2024-05-06 08:17:36'),(135,'GET','[]','http://localhost:8000/storage/locales/YuFazk3QsiQb7LqQGB9qpUAb9YTCaW9Cf2TnE2Kq.png','http://localhost:8000/amet-eum-atque-sapiente-quisquam-dolorum-corporis-sunt','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/amet-eum-atque-sapiente-quisquam-dolorum-corporis-sunt\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6IkNOeDBOM2dBMmlGdHRkb3dhQUx4NWc9PSIsInZhbHVlIjoiaHprbkpaZC9nWjdhNzAxVlRaYkVMajRkblg5RDFNSFo1anZtVE44L2VqZENVWElxY2F2cXdKOCsvbDhDQm1tZ1F3SEd4U1ZzVDF4VVZZeklWSnErMEkyUVFrTnpnN0pCTmQ4d2FlMGVGNkxtUUhobXkxNytDYUFaSDJuRXlSOUUiLCJtYWMiOiIzZjkxNWZjZTBmMDRlMjA3YWZhYWI1ZTFkZjMzNWExZGU2YjBhNTJmZWEyOTdmNzc1OTZhYjkzY2YzYWNhMGYyIiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6IlhBZ05ZK1B2bndnS1U4UlJmY0FPUXc9PSIsInZhbHVlIjoiQVBhSFc4Vlg1VEtLUkVtNmFUeXpBZnNYaFNQc0MzMnZocHhHK001RUpsb2VuRU1JWUpROXZlNSt5MDVVT0dMUGpUVjRXdmNmR1RDSVVoQkp6RGZJL1BBOXBHWGNjMy9Ud0c0SnVFTy9kQTlhRldaRG5qSytOZ21icFJoZGMwdlEiLCJtYWMiOiJhZWYwNDM0M2M1YjdjODIyMDg0YTJlOThlNTlkMTIxN2MyOTE2Y2IyYTJkY2ZkNmZiY2Y1NGI2YTI1ZDRkZDViIiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,'Webkul\\Customer\\Models\\Customer',11,'2024-05-06 08:17:36','2024-05-06 08:17:36'),(136,'GET','[]','http://localhost:8000/storage/locales/YuFazk3QsiQb7LqQGB9qpUAb9YTCaW9Cf2TnE2Kq.png','http://localhost:8000/amet-eum-atque-sapiente-quisquam-dolorum-corporis-sunt','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/amet-eum-atque-sapiente-quisquam-dolorum-corporis-sunt\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6Ik4rc2hSdjkxR3I1OFAxc1pMMXczemc9PSIsInZhbHVlIjoiL0VHUXdabExWZDZPUVlHbkNlOWZoaXI3OUp5U3pOK1hnWHpTbVZGejVwSXJnOHNMcm5sM2xlcmMrcUV5YitlYkRjQUdxRzJtbFhJWkk5MGhGZmlMRTZsTmdPSitIaFRmQWd6cFJXMkFYZVo1WDNqc0FJa3cxdWM2VGtTTTlxYVUiLCJtYWMiOiIyZDQzYzZhMmY5ZmUzM2I3MDYwMWZmZTU5YTFiY2FkMzcwNWJmNTgzZWY2ZjlkMzQ3NDZiNjdjZTVjMDg0Y2ZmIiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6ImwrOTZqTmtXU20xMzIyZmoyY2lGeWc9PSIsInZhbHVlIjoib3BxSWp1UGpQakRQcjliWnZuRmtHd25lWFQyclNwVlVFVktiMHBkK3QzMHplYkJJT3NscUFOVDFqN0p4ZndCWFQ1blNmd0taWE1YUXVtRGFrdjZ3VldCYUg1dFVlcXA4YW90V2cxSHhqaDRwQm9VckZtbzdicVhUYmZkVkFJTUQiLCJtYWMiOiI5ZjVjMzI0MDhlNWE4NDM1ZDY3NDQ3YmUzMzg4ODM5Yjc1MTFiZTRmNWY4YWRmMDNjMDBmN2FlMTJkMjU0MDQwIiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,'Webkul\\Customer\\Models\\Customer',11,'2024-05-06 08:17:36','2024-05-06 08:17:36'),(137,'GET','[]','http://localhost:8000/amet-eum-atque-sapiente-quisquam-dolorum-corporis-sunt',NULL,'[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"cache-control\":[\"max-age=0\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"none\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6IlF4M2k1ZUpTSXhJUXZZcktLVmdCcmc9PSIsInZhbHVlIjoiTlFjZitPOWtvSXR4b3B5d1plNE5jL2l4YXY2ZGpCUm1Ed25aaFEvbm0vT3pCUEtaUmNNQXZRNGxQUnZkTjVvNUR5UGJRN0dYNzYwSnowa2VzRjh5NmZudWo4VFNzNUE3Z21GUFVVZWJ0QUpMUStQeHl6bVdUY3ZwSGw1Tzd3OXAiLCJtYWMiOiJlOGE3NDZkNTRiYTk5YjRlMTA0N2FlMDE0M2Q3ODE0MDliMzMwNmQ4YTg1ZmJjZGZiMThjZDk3NDY5Y2FiZWQxIiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6ImFMNEJjd0VxSTV6dUwxWkdmbU9waUE9PSIsInZhbHVlIjoiUzFGbENRYnU5Nk5rb1hJV2IvQXlvZHFHK1RSN1loQWFkRXRZWkxvaldBaXl2b3I3WXdwY21hTTJJNXcxV09iQzd5b1lVMnNEblgzclh2MGNoQm9NcU1ieXBwZjBPUllaZmc4T0QyTXRPQml0UEl3L3RRVTJPWjZLREIwUnNrS0QiLCJtYWMiOiJiNDY5M2QzZjJiMzlmYWFlNTg0NDI0ZDA4YzA5ZjQ0MTFmNDllZGIwYTQzOTU5YWRkMTUwODJhYTY4OTNmZDI4IiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1','Webkul\\Product\\Models\\Product',96,'Webkul\\Customer\\Models\\Customer',11,'2024-05-06 08:18:14','2024-05-06 08:18:14'),(138,'GET','[]','http://localhost:8000/storage/locales/YuFazk3QsiQb7LqQGB9qpUAb9YTCaW9Cf2TnE2Kq.png','http://localhost:8000/amet-eum-atque-sapiente-quisquam-dolorum-corporis-sunt','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/amet-eum-atque-sapiente-quisquam-dolorum-corporis-sunt\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6Imo2NGo4ODZFdmx4NnpDTzQ2eXJVZEE9PSIsInZhbHVlIjoiQUIyOGp2NkxHeUpvYzBSNjZ3UlNNN0hieVZsZmxrRnU0dkxZQ1o4d1hsZTM3dEoxdEhMREFEellwaEFEV3R3c2tOd3FmSks3MkZBYjdCcXBXdTBIK0cvK0dUbUNadDdNbUlLSzQzblI2UWp5YmNWNFovTGtkcHdDZVZsRHhOeGwiLCJtYWMiOiIzOWExNWNmYTU0Zjg5ZGY2MzQwMzdlMDQ3Mjg4ZjJkY2NhYWQxNzBlZmZlODJiYWYyNjA4MjU2NTVkZWMwMTM0IiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6IlV6K0ZpaHFFV3h5Z2ZvSmhIUHJ4WVE9PSIsInZhbHVlIjoiakdOZVpLaHdjRUN2alJWamRKOVNKcm0zRjJ1TUtGbHJGbGk3YkRhaUZPQm5TTkJHTnVKWjlnNFg2YU52REplU1JDTjRTd0RaN2pQaEtpOXdMRytSYnJFQ0wrN2xYMU9aMU9QZ050OURMeWFMSjZCdldKcnlXMkg0b01EWUVkWWEiLCJtYWMiOiI1ZmUxNzdiNzc1NDI1NDUyNGMwN2UyOTBlZDFmMmE5MjA0YjQ1YWNjODRjZTM1ZmNiYTc2NGE4MjMyNDJjN2M3IiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,'Webkul\\Customer\\Models\\Customer',11,'2024-05-06 08:18:14','2024-05-06 08:18:14'),(139,'GET','[]','http://localhost:8000/storage/locales/YuFazk3QsiQb7LqQGB9qpUAb9YTCaW9Cf2TnE2Kq.png','http://localhost:8000/amet-eum-atque-sapiente-quisquam-dolorum-corporis-sunt','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/amet-eum-atque-sapiente-quisquam-dolorum-corporis-sunt\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=ae33c59a5574c3638ff92405a63ada8ef79e0a524062d96854a210c92d705be9%7C950e1d38a66598fd64fc2fb0182604f40d182e6970d38cbf7f322b89f0f9099d; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:true%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ff8200%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..dGhfCKQl-FnKZhjh.Ffripso1I8Zao7gE2Qpy--M8N3MWTOR86UPul9B1r0D1VJpnVtwyNGIX6s5kY9GvCbO44hHZJxKCEnDJEHXwkRA6nwdNThUmPo_hcC5-fJzzlTSs6uDI6jeKsrjoLnmllW7gbKFEjPKwVEptblqPTOrgheZSAol3RtdUjea4TbQI-42d4xsN5prj6vNOFobrixsIBcqv4ZzAuPkPZiSF9wNdH9n7nJJRBJY.bOmjio411KmsP20AyLKJbg; XSRF-TOKEN=eyJpdiI6IjRyTVgzbG9QK01jSTJrWFRRVUVOSkE9PSIsInZhbHVlIjoiWFpOTWY1WXdSMkxYTnI1QUQvNEE5V01xTUJVekUyVmx3M3k4T1Y2cWhmZFRZRzhwbElySkFwdDNtWFdoZ1VCNTVhV2YyOGs3NzFFbmwzK3hUYmNneFRIZGxOVWp1WThhT1FhdVFlbGw3RDVidlBQNHdXMW5ZM1V6ck5rNzg0NVUiLCJtYWMiOiI5ZTU5NzYzNDFkN2ZkYTIxN2NmOWEyMTQ5MjMxNmM3N2E0MTQ0YjhhNzY4OWJlZGQyZTQ1OWU0MTAxZWM0ZmQxIiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6InYzRmJ3cXZJdTBjLzhtR3dyMThRUnc9PSIsInZhbHVlIjoibGxhRWRML0V1WE5XZWhDU2wzS1lFWnd1TWEvTmhvSEs5WXdRSTllSU9LcmFDRll4NmFObVhmOXRrUHNJUzIrTnJ4ZmI3dzVjZ2FNVEVCZEtrTi9ZS0ZzdU5jVGRURU53NE5IQnZ1eTlkMm9EalpIZVlDZmZKZlhwRy9HTVoyRUciLCJtYWMiOiIzZTQ1MDNhNDAxNWUwYjc3NDc3OWI1ZDVjMGYyOWVkYmVlODMxOGI2OWIzNmMxOGYxMDFmOTBmMzA4YmZiMDIzIiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,'Webkul\\Customer\\Models\\Customer',11,'2024-05-06 08:18:15','2024-05-06 08:18:15'),(140,'GET','[]','http://localhost:8000/amet-eum-atque-sapiente-quisquam-dolorum-corporis-sunt',NULL,'[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"cache-control\":[\"max-age=0\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"none\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"XSRF-TOKEN=eyJpdiI6ImY3aUYwbk9BWk5uKzZ4SW5JK1EzUHc9PSIsInZhbHVlIjoicFZNbktLOWFqKzM5OHV2YWpWWHpSWnkwZyt5OUZEKytFZXVuRGxuTG1uK21CMXpQZS8ydXhBd3BLdU9mTFRNYlAvQkRreDFkWkNia0FUTENVV3pQbFFwYklGN0pLYWwydy9sQU15dmE0ZE0yRmpMY1lnaXNjTngvUWFDWXg1d2kiLCJtYWMiOiI3ZmZiNWNkMjM1Njk5NmU0MmEwYjg4ZWYzNmE0NzQ3NWJhZjcxZDc5ZmI5ZWQ0OGVmZGYxOGNlZGNiNWY5MzFjIiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6IlFtWTNock9DbU5lTWtsdllaTEVXM0E9PSIsInZhbHVlIjoiTElDbis1eG1rUnlpV1IrYnlKemsrWWlSbmUrUWNxRS9qTnhUSWFKVTNZY2hjdUZhVHh0YTFaNHQ4ZzhHYS9KZjdNalRDeFM2RDhQVnRkdjNOSDQzd1BoUnliai81RzdkbUREVVJqc2x0NzNDTStJbStYQUtuZG91bjhSUGh1a2siLCJtYWMiOiJjZTkwZTJmMTYzYjU3MDVkYTZkZTliZjVhNWExYzU5YTFhNjE5NjJmMTQ2YTFjNzUwZDM0Mjc0OTEyNjk3YmU5IiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1','Webkul\\Product\\Models\\Product',96,'Webkul\\Customer\\Models\\Customer',11,'2024-05-06 08:18:25','2024-05-06 08:18:25'),(141,'GET','[]','http://localhost:8000/storage/locales/YuFazk3QsiQb7LqQGB9qpUAb9YTCaW9Cf2TnE2Kq.png','http://localhost:8000/amet-eum-atque-sapiente-quisquam-dolorum-corporis-sunt','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/amet-eum-atque-sapiente-quisquam-dolorum-corporis-sunt\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"XSRF-TOKEN=eyJpdiI6IkJ3Tzl0NkxYYmM5L0w4a1oxQ0x5Umc9PSIsInZhbHVlIjoiTVl5R1hxTnFGM2I4MWttL3VveTVHRTdCNWJNTzRXM0FtOUxTMDg5L3pORFFUR3hCQ1Y2Uzg5YUl1ZG5rQXNXYlM2cjdCWTF2OGNzdSthTmdUZ1RqaFR2ZXRPYlpKSUFNamNRTndubk12YVVkQ2tESnlQNCt2QkpyOHR6WExnWEUiLCJtYWMiOiJlOTVjMDQyMDZiZmIzMDNiY2QxOTg1YWEzOTU5MWYyMDJlNzc3MDFhNjc4Zjg4ZDA2YjJhMjEzZWE2OWEwNjRhIiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6IkVMNVgzVzMwOGZBaFhJZXBETVZ2bEE9PSIsInZhbHVlIjoiN3FqVXR5ZEE5eEFvZ3BISDF6RHFBUHRrLzJURHl5OWYwMGgvYjRpVkQzdnprQkhyZFJMOUljNVRkZXhPbDZwR3BrRmk4WllqK3JMd05MTG9zNnBOTjNib2pRbWdudTNlbVBYSkwvTVhONWlsb1BVakwwT09FWURNZjFtMm9mTTkiLCJtYWMiOiI4YWViMTVhNGZmNzIyZDdlZmE0MDgwNjEyNjU0ODg0MmUwOTcxMDI5ZDU1OWNlMzc0ODc2MjBhOWQ0YTEyZjBhIiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,'Webkul\\Customer\\Models\\Customer',11,'2024-05-06 08:18:25','2024-05-06 08:18:25'),(142,'GET','[]','http://localhost:8000/storage/locales/YuFazk3QsiQb7LqQGB9qpUAb9YTCaW9Cf2TnE2Kq.png','http://localhost:8000/amet-eum-atque-sapiente-quisquam-dolorum-corporis-sunt','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/amet-eum-atque-sapiente-quisquam-dolorum-corporis-sunt\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"XSRF-TOKEN=eyJpdiI6ImlEZ0JjenlvdHVtVlJOTUQvSWErREE9PSIsInZhbHVlIjoiTTVHTUpSVldxZHlqUyt1Y0syYkN3T2xxU213MnlucXNtaDF5ZHZhNVFNb2dFTDlSRzJ0TmQwb3Z3TlE0NWdiSmpYRVJrdkxPeWJ1Z0phZXo3TldkcWFmdWZaTHBGWDd6UEZhaHh3NUxKc3RQYmJGVzBJNkJKcHNaK1Y1RjgreFgiLCJtYWMiOiI4ZWI3ZDc1ZTNhYzAyYWIwNDcxOGM1NTc1MTQxNTI0ZTM2ODg3NjE2NTkxNjIwNTIyMjNiM2FkYjRkMzBlMDNhIiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6Im9aYmZ0a045b29zek5uTFZ1b0FJNXc9PSIsInZhbHVlIjoicVlTb2w1OHQwUzkyTnBoQ1JTYXVjYnVhN3pubjJDUzRhL2tsam9jYitRcjNlS25GN3dUQVQ0QWZsZVRzdW90bFh2MVRlTXNNcW1vK0JEN3Vza0RzYzFmMTFoRzdBMzIvZkRYKzFOc1lhVE9qK1o3YkEyOWdjZFNoTWRGOERhTUIiLCJtYWMiOiJkYzk2YTc2NDBkM2RhNDQzY2FkZDM3MTE2YmZhMzI3NTViNGQ5OGY2YzY2OGQzOWFlNjNhNzdhMDZjNDVhOGQ0IiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,'Webkul\\Customer\\Models\\Customer',11,'2024-05-06 08:18:26','2024-05-06 08:18:26'),(143,'GET','[]','http://localhost:8000/amet-eum-atque-sapiente-quisquam-dolorum-corporis-sunt',NULL,'[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"cache-control\":[\"max-age=0\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"none\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"XSRF-TOKEN=eyJpdiI6InJQOUFhK1BadjR1YzZEVWNGdWg4cmc9PSIsInZhbHVlIjoiblQzb1oxbmxSaUM5eGVxYVJMSFJKaEgySGY5bUdCejJ6a3Y5KytTTDhwKzNRY0tRNGFWZzFNcjhWUk1WQnJQTXh1TmUxOUVFYUcvNjhNczFCUGRSMmNReFpyUTFGT2FUdVhaWE9meGJ1dWxHQWVRQzVXdVVid3RuUFVBVExGMloiLCJtYWMiOiJjOTk3NWQyZTU0N2VjZWVjODQzMDNlZGI4ZDg5OWEwNWUwMGI2ZGJlMDNjNzNjNWE5MzY5M2Q0ODJlY2ZhMjU0IiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6InJLOCtMdWtDenc2c3BrWnl6UkZVNEE9PSIsInZhbHVlIjoiZExDT0JXSWRuOXg5aGg5bkZVdGIyOS9KMFgvRnd5dTRKY3drbStuSHVoajdvdktiRUVmSTlKTTFZUDQ1RWVSOWtqN081TXllZU1jdnJlVmEza2h0RXlKL1poUE9laGFSbThrSlJaMGFmdngvTDVPbGFYOVd0ZFo2bnh2RDI5VHMiLCJtYWMiOiI5NWQ1NGEwNjlmY2Q3YzhiMDA0YmUwNTMwNzNiMDEyNDNiZDg5NjU0NzdiYmY2ZjdjM2FhM2NlYTMxZWQyMDVmIiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1','Webkul\\Product\\Models\\Product',96,'Webkul\\Customer\\Models\\Customer',11,'2024-05-06 08:18:55','2024-05-06 08:18:55'),(144,'GET','[]','http://localhost:8000/storage/locales/YuFazk3QsiQb7LqQGB9qpUAb9YTCaW9Cf2TnE2Kq.png','http://localhost:8000/amet-eum-atque-sapiente-quisquam-dolorum-corporis-sunt','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/amet-eum-atque-sapiente-quisquam-dolorum-corporis-sunt\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"XSRF-TOKEN=eyJpdiI6IlJVbmVNWmRaQmcraGQ1UFRZNW9tc3c9PSIsInZhbHVlIjoiTDJuMjZSQlZIdjB1RjhObDZHeG5Qbk1tM2F2cW94Vnp0MmMyaVFoSEJWOVVPbE1YV3JpSTNPNlBTZ0gxUTFXTzlCYUZjV1BRL3Q0ckdTSm5vR0dudkhJUEdRU1MzaEFWS0I4VTdrbWVmZFFtMXVPdDdkQkl4VHV0Vmp3K0Z4bC8iLCJtYWMiOiJjZTg4MTFlYWY0ODcwMTZhN2MwOTExNDk5ODdmMzFlZjkwZTdiYzYwNzk1NTcyYjFlMTIyZDNhMGMwODcwYzFkIiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6ImdVNVNlWVd3QkFRQjF5cnpTRjk1ckE9PSIsInZhbHVlIjoiZUtIVlRDYUhsemhXaVRqaEtPZStWMThRYWRBS295MjQvVUdCSy9XR3FSQXZyWldXOUowbm5LdXVWWmxTeUI2NkRUWTdXMjlpL0cxdzZwU3lPRVJUa3piNzhFR25OT3pzaWJsb0RrQUhGLzJ1RnJScWVFbVdGck14YXVja0J2MGIiLCJtYWMiOiIxNzhkNTQwMDQwNDM4ZmIxMmZlZTI2OTdjZDYzNDcwZDljYTkwNmMwMDJlMmFhZDU0MzkzOGVhMWZkZTU2MmU5IiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,'Webkul\\Customer\\Models\\Customer',11,'2024-05-06 08:18:56','2024-05-06 08:18:56'),(145,'GET','[]','http://localhost:8000/storage/locales/YuFazk3QsiQb7LqQGB9qpUAb9YTCaW9Cf2TnE2Kq.png','http://localhost:8000/amet-eum-atque-sapiente-quisquam-dolorum-corporis-sunt','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/amet-eum-atque-sapiente-quisquam-dolorum-corporis-sunt\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"XSRF-TOKEN=eyJpdiI6InhDRDhPN3l0L2xxM0Fyd3FrVkdSNHc9PSIsInZhbHVlIjoiSXE5ZmtSWDVYQ3E2eXRYT3ZjN1g3S25KMmpqdCsrUUE1T3ZlRi9XSXdnNkw2Rm9uUjlmQ3FOTnh6VXpVc0pDK1gwYXVFK3lHamxEUldMRWhjRVFBVEpveEVhY3hEdkxwM2hZR1BIcGZmYnFUNWpwdXdicWZKY2c2TmZOS1dRVTIiLCJtYWMiOiI1ODU3MDg0MmRhYWRiNTlkMDQzNDNiOWM5MDIwOGQwMDA2MGMxMTNjOWYyM2I1MWY2YmY3ZDkyMzhiMDQ1NGRiIiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6ImVTbXY1MlovSWtDcmNOU3NjRkpyeWc9PSIsInZhbHVlIjoiN0NGQndqN09YblhmVzZXWlJmSHBxd2N0SlFzY0pjaFNVMytYVGhueWNxUGhYMytPS1hXckRpdk8vbGpSRXVwQ2kvVDhtenhSbEFKMnFNT2YzNVlKMmRUWUNYRVdYZnZETW1KUVdVN1hscE96MkMzaUdMMXdKL01MZ2dXVHUvS3giLCJtYWMiOiIwMWMxNjFjY2RjMDNmZTE1MTFjZWMzYWIxOWMwOTQyZjdkODUyOTkxYzBhMGQ2YTUxZTBmOWJhMWU0MWU0MmUxIiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,'Webkul\\Customer\\Models\\Customer',11,'2024-05-06 08:18:56','2024-05-06 08:18:56'),(146,'GET','[]','http://localhost:8000/amet-eum-atque-sapiente-quisquam-dolorum-corporis-sunt',NULL,'[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"pragma\":[\"no-cache\"],\"cache-control\":[\"no-cache\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"none\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"XSRF-TOKEN=eyJpdiI6Imlwa0NGQ2RqNG5ZNzRUYmlEd0VNbWc9PSIsInZhbHVlIjoiQVBBUGJySUVyRU1hK3BmRkNMakthVS8vNURJZktiaG8zMDFLNXpDZzFPUmk2K05YNW9YcFlMZGNBQWI4bWswOUpBYjNhVlp3RS9ublhhOGFvTUN5MVU0a2hNcW0zcDl6UlJhd21mUTYxall4QUNLemZpUWV1WGlRcGYwRTJKSEUiLCJtYWMiOiIxMTYzMTAyMGI1MjczMzExNzk0NDhiNzNhMjVmYzY1MzkyYzI4ZDQ3OTEwMzhhZGM5NGZlMDY0NmIzNDE3OTljIiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6IkRoMVVWZ01jWHZnOER4YmhMSmZVWkE9PSIsInZhbHVlIjoiMnpSbVdvK0dQVlBHdlJvRGl3U2lsSmlwNlNXc3FhVmw4Y0Jad0JVR2lUYVdGY2tzb01MSXJIQ0ZWMzdGdTJXek8wVWV2OTVCQWxTekNuL3lxTi9DVThKUW9qekRPS1pjTHA4dFlhMVVhd2VkdG1xSnJac0l3M0dBQnRsOUZmRlAiLCJtYWMiOiI4NzY5NTM3MTJhZWI3MDgwMDg3YmZmZjlhNjlhMDAyYTcyZTk1NTc4ZGIyOTRhOGRmMDdmMGUyMDdlODZkNWY0IiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1','Webkul\\Product\\Models\\Product',96,'Webkul\\Customer\\Models\\Customer',11,'2024-05-06 08:19:31','2024-05-06 08:19:31'),(147,'GET','[]','http://localhost:8000/storage/locales/YuFazk3QsiQb7LqQGB9qpUAb9YTCaW9Cf2TnE2Kq.png','http://localhost:8000/amet-eum-atque-sapiente-quisquam-dolorum-corporis-sunt','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"pragma\":[\"no-cache\"],\"cache-control\":[\"no-cache\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/amet-eum-atque-sapiente-quisquam-dolorum-corporis-sunt\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"XSRF-TOKEN=eyJpdiI6Imw5MGg1T3d1YUNERlNhRTh4THdkZHc9PSIsInZhbHVlIjoiaFJUYWE4UkEyOVFZSkFxUHBGRW15enZDWHArMHJQYlkwam9CRzZ0bWplUjFUQmFpUm5Gd1VBTE1VNTlCd1pSNkMvQ28xeW9idDhnMXk1ajZaVTg1WkRLb2pXUjRvR3pUUGprNjhwWVVFclRBSUU3bUR5T2dQY05UWjc0b1hnaC8iLCJtYWMiOiI5YmEyODk2NWU4OTc0MGQ0ZWRhZGJiMWExYmFkMzJmZGIxYzE0MjBiM2E2MWY5OTlkOTI0NjQyY2Q4YzIyM2Y3IiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6IlV0Zlp0Zjl0bERKNE1yV1FmQUJ6NWc9PSIsInZhbHVlIjoiN0g0Z3IvRklZaXdkMkN6UXVjdmFJRE1Seis0UDk5dmxJbzd0aUNCZkdjNGM3TktJSzltVlpwMUNMU2JTai9pcmtQb3loa3AvM2dUa0x2cWpnTnhRcDQxc0wrV0RIQTVVeExHMkozMGJaeWxKaFQzeEZvYXNuODFkOXpraXpyVloiLCJtYWMiOiIzOWRhZjE2ZjY4Njk3Y2RhNGRiZjQ0MmE3MWMxOGE4Njk3Mzc1ODBiZjE0MzkwODdiYzhkOWYwNDlmMzJlMjRkIiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,'Webkul\\Customer\\Models\\Customer',11,'2024-05-06 08:19:31','2024-05-06 08:19:31'),(148,'GET','[]','http://localhost:8000/storage/locales/YuFazk3QsiQb7LqQGB9qpUAb9YTCaW9Cf2TnE2Kq.png','http://localhost:8000/amet-eum-atque-sapiente-quisquam-dolorum-corporis-sunt','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"pragma\":[\"no-cache\"],\"cache-control\":[\"no-cache\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/amet-eum-atque-sapiente-quisquam-dolorum-corporis-sunt\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"XSRF-TOKEN=eyJpdiI6InpYaWR2Zm9uODhCYmFYeDNLdGxNeWc9PSIsInZhbHVlIjoiTDdmSC9RMXlieGNGaEU0UHVQbnAyaklWUGlPNFc2UGZTT1hta3M1L1UxbFdXaE5zNUFRWENqUmdXK1ljL0lvNmlmQStFU3d2WExxZjNNYkR3VDI4V1pMQVpVaUdmR0N2K3psZkVMbUVRM3R4WXdxeHIzYUVLMitTNnF1UjFZVG4iLCJtYWMiOiI4NTlhODE1ZTRiNmE2YTYyOGZmOGU3NTAzOWRkMDhkZWM3ZmU2ODg4NGEzMjgzOWUzZDU3NzYzNDE2MmE0NzcxIiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6IjNDWGZWSWE5YkdOa1JKMjkxS05RUEE9PSIsInZhbHVlIjoiV21DVUgwNm13dTVXbXhpV2RGbHR2Q3gxK2dRYitoZllzcWpxbnlScUQzNWF6SWozRXJRL1hHenhXaktjeWtLUTJyN2VkWU1HcWxEVkE3cm41WHpKcHFvV2RQOFVKRkE2eGh0dHdRbTdxa0szbXZzbncvbEJFbVhFSTdaRlZXZW0iLCJtYWMiOiJhZWNmNmMyNmVjMjUwZDk0ZmI2MWViNjU0NmM0MzY2ODZhMTc5NWUxNmFlNDVmNzJjMGQ2MzgzMzYyNzEzN2I2IiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,'Webkul\\Customer\\Models\\Customer',11,'2024-05-06 08:19:32','2024-05-06 08:19:32'),(149,'GET','[]','http://localhost:8000/amet-eum-atque-sapiente-quisquam-dolorum-corporis-sunt',NULL,'[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"cache-control\":[\"max-age=0\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"none\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"XSRF-TOKEN=eyJpdiI6ImdxeC8vWVZmeDZZTjdTaXhMYzJtL2c9PSIsInZhbHVlIjoialdxT294bXIyQUF4aVQySjNPVDcyUldLbXJsV1JiMldYaHh5WmhCc0p0ZjZCOG16ZGZ2RVBLbFNVOCtlUUpXQ3RxODN5QWJCcGtXNXovQ0pDTDhrQVRvTmRSV1RlbmNQRU00SlJnQWxuV0oxRlhrVEtCRE1FN0EzRWNpdzNCb2IiLCJtYWMiOiJmMGRlY2U2NWIyZWMwMGU0NzE5MTIzZGJlZTg5N2E5Yzc2MTg1NTFhMzgwYjNmMGRlNmE1Mzk1NDRjN2YwZjljIiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6InE1ZStHdmVvZkt3Ty9RYzdpZmE4VXc9PSIsInZhbHVlIjoiVnZnQ0dMaDBqUEtBQzhoSzRUVHkrRUROYmRzejFvR1hCdDRLSlRrS05Mb1R0SU9KYlhEWms4UGU2MFRDZzQwcWxHQi9Rc2Vyb3ZXVVU2R0tJbG1BN0pNZ1ZPM0VCWnlpdHhTbEkxSWs1aFhZYkk3WGxjdUJ6OGYwSlFMTGdBaGgiLCJtYWMiOiI3ZTg0OGMyZjVhN2JiOTQ5ZTU1NjQ1M2VlMDQyY2VjYmZlYjg3YTcyZTRlNjUxYTIyZjJlNDIwOGJiOTQ5NmRiIiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1','Webkul\\Product\\Models\\Product',96,'Webkul\\Customer\\Models\\Customer',11,'2024-05-06 08:19:36','2024-05-06 08:19:36'),(150,'GET','[]','http://localhost:8000/storage/locales/YuFazk3QsiQb7LqQGB9qpUAb9YTCaW9Cf2TnE2Kq.png','http://localhost:8000/amet-eum-atque-sapiente-quisquam-dolorum-corporis-sunt','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/amet-eum-atque-sapiente-quisquam-dolorum-corporis-sunt\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"XSRF-TOKEN=eyJpdiI6IkpxY2FwcllpTTFQQnRsTVZwTWVZN0E9PSIsInZhbHVlIjoibTJLaFRYTFljUFFFQlBscGVsTy9jMXBKVWF6ZEVvSEJKUHE2Ly83SDNuR01MSkV6Sm01UzJsYTd6TW42Z3BVQTBSZERrbU5wQW5yVkdzc0ZJdGdvcjZJbDhwU2MwVVBvZHZCMnZEOEQ1eitObGoxMXloRlExQ2pGSkEzVVpiU2siLCJtYWMiOiI3NjRlZTVkNmU5NGFkZDBmNGZjZjcxYTgxYmVmZDVkNzI0NWZlN2YzNWFjNzYzMDhjM2M3ZDg4OGY1ZGI3OTkyIiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6Ikw2dkMwaEFLcmZXV3hhc1V4K1dqSnc9PSIsInZhbHVlIjoicWQ1bmNaTU51anlQbzNzSjlLall2Wm5uM0tnM1BYWE9MZElKeFJNVk5VVk1OVXpTL0hxcy9rM1hGVXVxOUY3OFJuNVpBVHJoL0FSZXJpRSs5YnRhTWdxbjFKK3d3ZFdaejRhWFBxN2lwZi92U1B3REdXaXA5QytkSjZRY3JpRlgiLCJtYWMiOiIwYmQ0ZGU0NTIwOTIyZmFhMDFmYWYwZDQ4NzY0OGQxYWVmMzBiMzhlY2M2MWQxMjQ5ZTQ0NGY3NTJiMTVkN2I0IiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,'Webkul\\Customer\\Models\\Customer',11,'2024-05-06 08:19:36','2024-05-06 08:19:36'),(151,'GET','[]','http://localhost:8000/storage/locales/YuFazk3QsiQb7LqQGB9qpUAb9YTCaW9Cf2TnE2Kq.png','http://localhost:8000/amet-eum-atque-sapiente-quisquam-dolorum-corporis-sunt','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/amet-eum-atque-sapiente-quisquam-dolorum-corporis-sunt\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"XSRF-TOKEN=eyJpdiI6InN4YTUrOEZzZTdhYmhTeWR2MTdPa1E9PSIsInZhbHVlIjoiSlJndnhhNnVVOXNyMlBhdWhLSjFDZ2hXSU9WN01UTE5Ya3FreGF3ODJsVmlGVFEwV3R4RzE4aGtaVGIwWjFIZTF1RHIxUmMrdjc2VS9ReWNvdkppNmJXUEhVeGxNdldrbTVQbEtoeHRmUHBoUnV4clpMSmFpYkVocFJLUjJXc3UiLCJtYWMiOiI1NWJmNTdkN2VlNGE4ZjJhNTY3NGRhMzY3MWRkNzA1N2ZhM2U1M2EzMWI2NTE2NTM0YmQyM2Q1YzBiZDA2ZTdkIiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6Ill3Z0QzellhWmRwRyt6L1pyODFjTEE9PSIsInZhbHVlIjoiNm9JMUdNWkpRdDJxT0Yzc2tsckdTMEJFcm9XMjVVbklXTnJSNVl2d1ZIR0pNMTQralRrZGJYR2VrVWJFZm5WeHF4QThWQndtL1VmMGx6eFdQS3JTdnZmN2xTN1plRERwQ0U3MWlNSzJnQjJoUnl6ZlNTTWdsVW9LUVlXMko4bFgiLCJtYWMiOiIzYzhhYThjZGUzY2M0NTNjYTg2YzcwMzkzNjhlZWI4M2UzNDAyYzBiYjkxYmIzMTM5MGRiMjRmMDM0ZjA5OTg0IiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,'Webkul\\Customer\\Models\\Customer',11,'2024-05-06 08:19:37','2024-05-06 08:19:37'),(152,'GET','[]','http://localhost:8000/ratione-voluptatibus-aliquam-et-illum-qui-quaerat',NULL,'[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"cache-control\":[\"max-age=0\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"none\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=a646d3e47298db47f27252a019d996bc7baff34f1afac866312499b8a3d0b1e9%7C1c01d1037e592a0c4c8a72ec8b8b56f559c6c85f3aaa35c7ee85742e9d0aad68; colorPref=dark; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin%3FredirectTo%3D%252Fen%252Fpos; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..S2-kIh09FZmq4-xW.8fnHpvIRpHF954_8W1_41mRIy1TZw4iRxe7F-pzyOLlANarOvBQivIyudQdu2xJnF4P9IHdQHh94lzN78FVGrBzOrhQNZSrheHWDREO6ugTATloBPS7ThPvOVaFtfdwaRstyFmcshM6lPMhr17TQxgUxBlU7F2Pnx5JexngQj5oWY_uApFihIRMuDDViHuw1lqPAX7ZT2I0hijw2fi1K0Xipm7c_pNAPjIs.Q_Ccsf1f43JQx1FJ4PZCeA; XSRF-TOKEN=eyJpdiI6IkxtVW04TFQ2akZwVjdZQzZ1bkIxUEE9PSIsInZhbHVlIjoiMUpnZE9kaG1PSzl2aFk3d2ZkdFFUSW5yZjVuZTgzN3RBbVlkK0RjbU82Rm1MbDlDU0hxZDRuN1loWnk4ekV5NWEzaElUUmNuelJVQkRveXVTWHcvOXJDV0ZZbmNEN2d6Yk1kYitFR0lWd1Jqa0dLbkZIQStKOU1JVG9yaFZpWDEiLCJtYWMiOiI5MzY5MDJmYmUxOGM5MWEyMTBkNWJjNGFjYWY0ZWZjYTg1MWE2NTAzM2EzOTRlMjJmZWM3ZTkzOWM2ZGVjNmEwIiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6IlU0TFgzSGhUdlB0WkdGTGducllXdlE9PSIsInZhbHVlIjoiZ1c3NmRhS3VaSlpIZ2pINDkyNW5YTFhPVFBhNFEzVkJjVms1ejR5S2dXYUxLUVhNRGVyMk0rTGlWMDQwYW5yZDlidlRRT3BqeXM2M3NkZWFKaWVWYnc0SGxRRWVETjNtTlRpRDY0ZUlXTFlJT2lZVFNTZUM0eHdOY2tUZDEvd3IiLCJtYWMiOiIwZGY0YmI4NDBmODFjNWEyYzNhNTZjNGQ1ZmJkMzM2YWI4NGQwN2Y4NjVjMDZkYzM0ZDcwNDEzZTcxNzdiZTc3IiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1','Webkul\\Product\\Models\\Product',39,NULL,NULL,'2024-05-06 08:41:28','2024-05-06 08:41:28'),(153,'GET','[]','http://localhost:8000/storage/locales/YuFazk3QsiQb7LqQGB9qpUAb9YTCaW9Cf2TnE2Kq.png','http://localhost:8000/ratione-voluptatibus-aliquam-et-illum-qui-quaerat','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/ratione-voluptatibus-aliquam-et-illum-qui-quaerat\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=a646d3e47298db47f27252a019d996bc7baff34f1afac866312499b8a3d0b1e9%7C1c01d1037e592a0c4c8a72ec8b8b56f559c6c85f3aaa35c7ee85742e9d0aad68; colorPref=dark; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin%3FredirectTo%3D%252Fen%252Fpos; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..S2-kIh09FZmq4-xW.8fnHpvIRpHF954_8W1_41mRIy1TZw4iRxe7F-pzyOLlANarOvBQivIyudQdu2xJnF4P9IHdQHh94lzN78FVGrBzOrhQNZSrheHWDREO6ugTATloBPS7ThPvOVaFtfdwaRstyFmcshM6lPMhr17TQxgUxBlU7F2Pnx5JexngQj5oWY_uApFihIRMuDDViHuw1lqPAX7ZT2I0hijw2fi1K0Xipm7c_pNAPjIs.Q_Ccsf1f43JQx1FJ4PZCeA; XSRF-TOKEN=eyJpdiI6IncxbjdKcVhjVnp4cHNGTTl1UHlRTnc9PSIsInZhbHVlIjoiWk55dnY5SUt3YjNiVnlmRkdrNVJFNGtKNmdNRDhxcHh3RzdQOFV1RHhrQ0NMeVBnOXlaMGhEdlppTzA3c2tQU2RaTWpEQjNnTnJUQ1Fxd1EzZVl4QVJZT2FKQ2FWaU5mU2JiMllnM2x0OFdkWFRmUzdKeExKNisrYmVSZUxYaDMiLCJtYWMiOiIzMjZkOWY2NzZiYWZjYzY3NmI5YWY0MTQyN2Y5MTJmNmFiYzM4ZTExNzEwOWM2NDllNTNjMThhODY2YzQ5NmE5IiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6InBiY052QnYxcVpBVUxxRXBxM2J1aEE9PSIsInZhbHVlIjoiVW91UFdtcDFudDA2QWJ5cDdOK0F0WkhWRXZ6R1RaclBCVXE0VEM1YWRMcGRBeHhlSStTaGZLYzlFbUwyL0pkQ0NhSHRjVWViU1dhWmFjS3AweUxrR2RrMzFwYnhFbklkTFlVZzJDUTlsM0wzZXFpZVJJdlRxNmo0RW5yMyt0VlIiLCJtYWMiOiJiNTY3YWRlZDQzMWYxNWViMGFiNWJkOWI1YzE2NWUyMjM4OTkyNjU1MDdkMDRmN2NhNjRkOWU5ZmZkMTI5YzViIiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,NULL,NULL,'2024-05-06 08:41:28','2024-05-06 08:41:28'),(154,'GET','[]','http://localhost:8000/storage/locales/YuFazk3QsiQb7LqQGB9qpUAb9YTCaW9Cf2TnE2Kq.png','http://localhost:8000/ratione-voluptatibus-aliquam-et-illum-qui-quaerat','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/ratione-voluptatibus-aliquam-et-illum-qui-quaerat\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=a646d3e47298db47f27252a019d996bc7baff34f1afac866312499b8a3d0b1e9%7C1c01d1037e592a0c4c8a72ec8b8b56f559c6c85f3aaa35c7ee85742e9d0aad68; colorPref=dark; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin%3FredirectTo%3D%252Fen%252Fpos; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..S2-kIh09FZmq4-xW.8fnHpvIRpHF954_8W1_41mRIy1TZw4iRxe7F-pzyOLlANarOvBQivIyudQdu2xJnF4P9IHdQHh94lzN78FVGrBzOrhQNZSrheHWDREO6ugTATloBPS7ThPvOVaFtfdwaRstyFmcshM6lPMhr17TQxgUxBlU7F2Pnx5JexngQj5oWY_uApFihIRMuDDViHuw1lqPAX7ZT2I0hijw2fi1K0Xipm7c_pNAPjIs.Q_Ccsf1f43JQx1FJ4PZCeA; XSRF-TOKEN=eyJpdiI6IjhGLzIzSEJUMDBqOW9ubWhBM01aQ3c9PSIsInZhbHVlIjoibGZWMXd1MW1vaURFTkZzNllyWlNnTEMrcldXVHpVQVY0R0MrbnVTTnI5eHJ2Y1FiTWltN1V1bHJBQ2o0bnRBUW40VnNaMHZYWFNnOEpoSUp4S0xTaEttNk9yems5N2g4SnZuZFQ2aGRwbU1jWjhxbncwUE9ZNGIyOFgvQ2xtVXgiLCJtYWMiOiI1MDljNTBhNDVjNmFjYTA1MTJjMTgyYjgwZjk0MGFlNjAyNTczMTNiYWJhMjRkOTlmODYwOWUyM2UwYzYzMmYyIiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6IktLejlyWjlLdUdWbEcrdnBXa2VjVlE9PSIsInZhbHVlIjoicVdvMG5RNDI5eXZDQWZjYTFyQUVEek9iamtmaWlYWnBpaW1jVUFCZTlvTE1VL2hxOEFEV2djWURHczRRNlQzM3F1Zm5UVWJ2Y3FvOFg1MUQzcENRUWhIL1MwbVZoOVJqaGQ2VWFPYWhEWGk5NzhNVXc3cW5vaDRKWDUyQkFJSXEiLCJtYWMiOiI0YzU4ZGM3ZDk3N2UwNzRhMDM5ZTFiNzc4YWUwNDc1ODg5YzRiYmYxOGM2ODI5NDU0MGJmMjgyOGRmNmI1ODBiIiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,NULL,NULL,'2024-05-06 08:41:29','2024-05-06 08:41:29'),(155,'GET','[]','http://localhost:8000/ratione-voluptatibus-aliquam-et-illum-qui-quaerat',NULL,'[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"cache-control\":[\"max-age=0\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"none\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=a646d3e47298db47f27252a019d996bc7baff34f1afac866312499b8a3d0b1e9%7C1c01d1037e592a0c4c8a72ec8b8b56f559c6c85f3aaa35c7ee85742e9d0aad68; colorPref=dark; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin%3FredirectTo%3D%252Fen%252Fpos; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..S2-kIh09FZmq4-xW.8fnHpvIRpHF954_8W1_41mRIy1TZw4iRxe7F-pzyOLlANarOvBQivIyudQdu2xJnF4P9IHdQHh94lzN78FVGrBzOrhQNZSrheHWDREO6ugTATloBPS7ThPvOVaFtfdwaRstyFmcshM6lPMhr17TQxgUxBlU7F2Pnx5JexngQj5oWY_uApFihIRMuDDViHuw1lqPAX7ZT2I0hijw2fi1K0Xipm7c_pNAPjIs.Q_Ccsf1f43JQx1FJ4PZCeA; XSRF-TOKEN=eyJpdiI6IjdhYUxpWnp0OWxCSDRlSWFQWUtNWWc9PSIsInZhbHVlIjoiZlNJZmN6aTMycnZubGZMOWErVHNvMHZZQXI2UXBKNHp1c3UzTUJWekdocTlPTmw4VDBiZ3ptRmFBc1Qra21oTC9FS3piN0dydStOZlNXWnVic1pxNjJqdnI2NkRjUk92Zld5aUlHOWRqZWFXTTg3cXhHaHIyZ1ZyNUN4Sk1hanUiLCJtYWMiOiIyMDA0NjEyMDcxMDM5M2QxYTA4NTYyOGNkMzYzZjMxMGQzNjAyMDc5Y2IzOGUwODAzMTZlMGJlZGI1NGUwODIwIiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6InNMZmpLTzZnV3FIV3pKd3NqdlZ0TVE9PSIsInZhbHVlIjoiK1YxTklsaFRHbVBkUkdzSkc1WmZ4T3N0eE9zYldlYUZDcml3T0pmOUxRTzl0KzhHUDNFTU5rZ1B6N3JiWTV3eXZ6WDhRM1kwL0tvRVp6S3BUQkpORXFUSGliSkQxdUtxelpGYWRZSFFqcEFDM1krVlZUWjlXaXlZck93QW9mZzYiLCJtYWMiOiI5NjYxYjUwZmQzYjdiMzg1MWQwZWI2NTA1NmRmZWEyNjY2ZThjNmFlYjBmZGIxN2ViOTYyMTA2ZWZmYTEwYjU4IiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1','Webkul\\Product\\Models\\Product',39,NULL,NULL,'2024-05-06 08:41:44','2024-05-06 08:41:44'),(156,'GET','[]','http://localhost:8000/storage/locales/YuFazk3QsiQb7LqQGB9qpUAb9YTCaW9Cf2TnE2Kq.png','http://localhost:8000/ratione-voluptatibus-aliquam-et-illum-qui-quaerat','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/ratione-voluptatibus-aliquam-et-illum-qui-quaerat\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=a646d3e47298db47f27252a019d996bc7baff34f1afac866312499b8a3d0b1e9%7C1c01d1037e592a0c4c8a72ec8b8b56f559c6c85f3aaa35c7ee85742e9d0aad68; colorPref=dark; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin%3FredirectTo%3D%252Fen%252Fpos; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..S2-kIh09FZmq4-xW.8fnHpvIRpHF954_8W1_41mRIy1TZw4iRxe7F-pzyOLlANarOvBQivIyudQdu2xJnF4P9IHdQHh94lzN78FVGrBzOrhQNZSrheHWDREO6ugTATloBPS7ThPvOVaFtfdwaRstyFmcshM6lPMhr17TQxgUxBlU7F2Pnx5JexngQj5oWY_uApFihIRMuDDViHuw1lqPAX7ZT2I0hijw2fi1K0Xipm7c_pNAPjIs.Q_Ccsf1f43JQx1FJ4PZCeA; XSRF-TOKEN=eyJpdiI6IkU2VXVWc09memcrMjBMaW9PSjQ0MFE9PSIsInZhbHVlIjoiSjJSVnVXWG9LZzNCbkxXWFlWTVpYVVdNcXhlZEQ4cGNyV3RSRlUvNFJyMGVSZC9SUGFYWnlQRWFmL2ljSmtUYlRjdUplbGRkZmZKUGhCVi92RktiazJ2M21yNXhnc2k2SVpDeVdVQmxQK2xiTGNsdkVjRkRlb29MS3hSRnV3azYiLCJtYWMiOiJhY2RiZmRkYTFhNGEyYzA4NjJmNGJjYjRmNjlhY2Q3NThjNWU2NjQ3OWZjOWQyNzUyMzc5NDc5ZDNjYWIxZDI5IiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6IlIzQ25BSmZFMjVUSHNNYm5wNjdYWlE9PSIsInZhbHVlIjoic1VYcWlLUWtPVUU4N2Z0dWZrZjdmcFZkTTRnbFl5L2xqcjRmTldSbmtsTitQN1M3d0Z4QUpwaVdra3ZjeHJTTkNtZkhBaWlDOVhPOTJxSDd6N2c0YXpac2wvcXdUbUdTYWVsblJnYWJXUXpRMVZVYXZodWxOSVZXSGdaM1FUK1AiLCJtYWMiOiIxYTZiNDg0NjBmMGU3YjYyZGQwYTk2MTk0YzhmZmM2YTk5MzEzNGYzMzk1MDU1ZjBhNTk3NzljM2Y5NWFlMjBhIiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,NULL,NULL,'2024-05-06 08:41:44','2024-05-06 08:41:44'),(157,'GET','[]','http://localhost:8000/storage/locales/YuFazk3QsiQb7LqQGB9qpUAb9YTCaW9Cf2TnE2Kq.png','http://localhost:8000/ratione-voluptatibus-aliquam-et-illum-qui-quaerat','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/ratione-voluptatibus-aliquam-et-illum-qui-quaerat\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=a646d3e47298db47f27252a019d996bc7baff34f1afac866312499b8a3d0b1e9%7C1c01d1037e592a0c4c8a72ec8b8b56f559c6c85f3aaa35c7ee85742e9d0aad68; colorPref=dark; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin%3FredirectTo%3D%252Fen%252Fpos; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..S2-kIh09FZmq4-xW.8fnHpvIRpHF954_8W1_41mRIy1TZw4iRxe7F-pzyOLlANarOvBQivIyudQdu2xJnF4P9IHdQHh94lzN78FVGrBzOrhQNZSrheHWDREO6ugTATloBPS7ThPvOVaFtfdwaRstyFmcshM6lPMhr17TQxgUxBlU7F2Pnx5JexngQj5oWY_uApFihIRMuDDViHuw1lqPAX7ZT2I0hijw2fi1K0Xipm7c_pNAPjIs.Q_Ccsf1f43JQx1FJ4PZCeA; XSRF-TOKEN=eyJpdiI6ImhMa0FBdjNHUnBsUy9JN3Vsc3RITkE9PSIsInZhbHVlIjoiL0NFWjd1OVp6SS85MmhFYkxqZWFLZ3pEaWZSMnNwcTFzOGEveTlwNk5yOHFyU214SnlhaUs0ODZLa1FyT2NmTnhDTExJZjRwOERDREhlSHVHM2V2dm5BOHA3ZEtsUFZvWGsvZHUzSGlYODI1SHhMZ29MdXJ2QXplalpXOVZPQXgiLCJtYWMiOiJjOTJlOTJiOGMwMzAxMDQ0MWFlYTZjZjUyOWQzNjI5N2FmNGRiNjZhZjA4NDlhZTA3OWFiZjM0NWNiZjZmNjY1IiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6IlJabjE1ODB2bTJjZllibU9DZ216c1E9PSIsInZhbHVlIjoiMXVmMjNZT013N29HUU1qY2JnUkYrZHlZOXdqbWNkb0hlVVJWbXlrOHpmTkpXRmlZYnVBWFVROHowKzI5L0dsb3ZuQmJqKzFaaHhpZFRhaDhJTVQ5dzRwSnMwdWFWcDlVMVJZZDBYcnVrU0NiL05kRmJGeEJZRTJxU1BCd2ZDaEUiLCJtYWMiOiI5Nzk1MzgzODUxNTUyOGE2ZWM0YjM2NjQ4YmExYjk2OWUxNjFmYjkzYmQ1YzE1MmI0ZmI1YTM2NzAwMjRmOWVhIiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,NULL,NULL,'2024-05-06 08:41:45','2024-05-06 08:41:45'),(158,'GET','[]','http://localhost:8000/ratione-voluptatibus-aliquam-et-illum-qui-quaerat',NULL,'[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"cache-control\":[\"max-age=0\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"none\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=a646d3e47298db47f27252a019d996bc7baff34f1afac866312499b8a3d0b1e9%7C1c01d1037e592a0c4c8a72ec8b8b56f559c6c85f3aaa35c7ee85742e9d0aad68; colorPref=dark; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin%3FredirectTo%3D%252Fen%252Fpos; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..S2-kIh09FZmq4-xW.8fnHpvIRpHF954_8W1_41mRIy1TZw4iRxe7F-pzyOLlANarOvBQivIyudQdu2xJnF4P9IHdQHh94lzN78FVGrBzOrhQNZSrheHWDREO6ugTATloBPS7ThPvOVaFtfdwaRstyFmcshM6lPMhr17TQxgUxBlU7F2Pnx5JexngQj5oWY_uApFihIRMuDDViHuw1lqPAX7ZT2I0hijw2fi1K0Xipm7c_pNAPjIs.Q_Ccsf1f43JQx1FJ4PZCeA; XSRF-TOKEN=eyJpdiI6InErUXhMZTRLdXN4eVJabnhQUVhRRVE9PSIsInZhbHVlIjoiLytQcUxnZzdLd2x5UTE5NDlwYWFGVHA3bWVoTWFOY0NMUWtHSW92RmFzY3BTdlJSTW9GRjhDSGZacnZFQTR4TjY0VkZSdHBPYWYwNCt1OGhydFRPQ0hValR3SUdTTzAwTUp6VUJqcHBXTnBPY3Ixd01uZU9MdDB3Z3JabjN1Q3giLCJtYWMiOiIyYWIwOTcyZjIzOGY0NjIxYjMwZjA2YWRhNDg5NmJmMThkMmU5OWQyMjc5MDM2M2IxNTljMDAwMTI1OGI4ZDFiIiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6InhJWW9zb243dW91UmRxV3JqMlFwREE9PSIsInZhbHVlIjoibFBWSEJLYjRnZ3FMMUhUS0pqUVlHZVhFSWx4bjNSU3Y0bXRJWnhYR3dIUFV0c0d0dVRPV2hHeXQ0Z3VBNytlL3NHY1FhYllPMllxaUMyeFl1L0RwWExiazZJTUZLQWFNeXNYYmhjVVJqakJZNCtnbitwVUxDR1FZaFVOelFZbEsiLCJtYWMiOiJhMzkxMGRhYTE1MjgxMmVkN2YxNjljOGJiYzMyNjA2ODY1MDZkYTliZDEwNzExZWE1ZTMwY2QxOWQwMzIzMmVmIiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1','Webkul\\Product\\Models\\Product',39,NULL,NULL,'2024-05-06 08:42:11','2024-05-06 08:42:11'),(159,'GET','[]','http://localhost:8000/storage/locales/YuFazk3QsiQb7LqQGB9qpUAb9YTCaW9Cf2TnE2Kq.png','http://localhost:8000/ratione-voluptatibus-aliquam-et-illum-qui-quaerat','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/ratione-voluptatibus-aliquam-et-illum-qui-quaerat\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=a646d3e47298db47f27252a019d996bc7baff34f1afac866312499b8a3d0b1e9%7C1c01d1037e592a0c4c8a72ec8b8b56f559c6c85f3aaa35c7ee85742e9d0aad68; colorPref=dark; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin%3FredirectTo%3D%252Fen%252Fpos; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..S2-kIh09FZmq4-xW.8fnHpvIRpHF954_8W1_41mRIy1TZw4iRxe7F-pzyOLlANarOvBQivIyudQdu2xJnF4P9IHdQHh94lzN78FVGrBzOrhQNZSrheHWDREO6ugTATloBPS7ThPvOVaFtfdwaRstyFmcshM6lPMhr17TQxgUxBlU7F2Pnx5JexngQj5oWY_uApFihIRMuDDViHuw1lqPAX7ZT2I0hijw2fi1K0Xipm7c_pNAPjIs.Q_Ccsf1f43JQx1FJ4PZCeA; XSRF-TOKEN=eyJpdiI6Ilp3bVcxS2NCamFNc1JCRUtEbHArcnc9PSIsInZhbHVlIjoiMVluQ0hxWVloZ0lnUUpaclRydkgxeExmY3FXSExzMHI3ekJhZi9kK0dMbUg1YTlzMkwrL044MlB0T2V5WkdZRVR1dVpmTzNCZksxQ01iTlB0OWhkOSs3d3NtWTBMcHIzQWtHWG1sOHgvamU4S3hHYkVDOTBzRFJ3cTZqTFZaRkYiLCJtYWMiOiI1YzYxYzFiZTcwOGQxYjIxMDQ0ODZkMmY4ZDhjOGI5NmUzYmMwMjM3YzM4MTI2ZjIxZmZmY2RiNTMzZWUyMTI1IiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6InlKZUNwa1BVaHpvak56UXNqRnpUWEE9PSIsInZhbHVlIjoiWkY2Z0J4Ni9ONmhQc3l5Y3dzZjRzb0pTNTE3OGhwNHZoZWN5YmNYc0NDWG1ZRDh4N0phS2gzYThBUEc2MGhTeDMzTDQvVkxzV3N6eW15dEdlUVJ0Uy9NZkpDZXZ5aGFGNlhXbnVtTjBZWXZPcGJSL3J5cU5Xb2J1NWlWUlRPckMiLCJtYWMiOiI5MWU4ZTdhZGI2YmRlN2E2NjMwNDhlNTAwMTFkMzRkZThlMWY2MjZjZGU3NTJhZjU0M2I5OTBmNTU1NTEyOWM2IiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,NULL,NULL,'2024-05-06 08:42:12','2024-05-06 08:42:12'),(160,'GET','[]','http://localhost:8000/storage/locales/YuFazk3QsiQb7LqQGB9qpUAb9YTCaW9Cf2TnE2Kq.png','http://localhost:8000/ratione-voluptatibus-aliquam-et-illum-qui-quaerat','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/ratione-voluptatibus-aliquam-et-illum-qui-quaerat\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=a646d3e47298db47f27252a019d996bc7baff34f1afac866312499b8a3d0b1e9%7C1c01d1037e592a0c4c8a72ec8b8b56f559c6c85f3aaa35c7ee85742e9d0aad68; colorPref=dark; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin%3FredirectTo%3D%252Fen%252Fpos; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..S2-kIh09FZmq4-xW.8fnHpvIRpHF954_8W1_41mRIy1TZw4iRxe7F-pzyOLlANarOvBQivIyudQdu2xJnF4P9IHdQHh94lzN78FVGrBzOrhQNZSrheHWDREO6ugTATloBPS7ThPvOVaFtfdwaRstyFmcshM6lPMhr17TQxgUxBlU7F2Pnx5JexngQj5oWY_uApFihIRMuDDViHuw1lqPAX7ZT2I0hijw2fi1K0Xipm7c_pNAPjIs.Q_Ccsf1f43JQx1FJ4PZCeA; XSRF-TOKEN=eyJpdiI6Ink2ZnhxYkxBZklXTDR4OW5vM1BxY0E9PSIsInZhbHVlIjoiVUI0aXJHZnBTakN6U24rTUVROWh3N2RFT3hHb25LbkYwWEE4azVmNW1OVXMyRmNscy9WMWVDeHhyYWxrOGc4K0hXOUZqU1NWWmJDVmJ0M25mRDhDK2dXOW5vRlBlc0FYSTFmb2NsejJkeXJEY1pOUGFrVjRPWWI0UmxpSUNTN2kiLCJtYWMiOiIzZTgxOGEzODlkNWM4NDM5NjM3ZTRiNGZjMmQ4ZjQwMjJlNDc2NDBhODgyOGFmNzk5M2RjNmU1Mzg3ZWE1NTA2IiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6IitsY2tNOTNESG00ekpOcnJTWUR3OEE9PSIsInZhbHVlIjoiNTdxcVdhaXpNbFpGZVV4NVVkK0wzOTE4a01OcitLUkVHQitZbS9vMEY5ZW9LMFhnTlVxNmFFbllEL3lvcldEeXFtMWZNdXp1aWxJVHhXdjJUdmJBc1c0RUIwODYra1lJTjdvU1d0THp6WGtvMm4wUndmdUhMK0k3ejZrcE9Hb1UiLCJtYWMiOiI5NGQzZjI2ZDg5NmFkYTA0N2E3MThiNzExMjY3OTllYjRmNDcxZjFhNGRlNzdkNjAzZTY2MzlhNDU2MTMyZTc1IiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,NULL,NULL,'2024-05-06 08:42:12','2024-05-06 08:42:12'),(161,'GET','[]','http://localhost:8000/storage/product/120/4LJrRXlcq7O8SK03yIqwaJKYcBY5JPPIlJIn46po.webp','http://localhost:8000/admin/catalog/products','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/localhost:8000\\/admin\\/catalog\\/products\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=a646d3e47298db47f27252a019d996bc7baff34f1afac866312499b8a3d0b1e9%7C1c01d1037e592a0c4c8a72ec8b8b56f559c6c85f3aaa35c7ee85742e9d0aad68; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin%3FredirectTo%3D%252Fen%252Fpos; colorPref=dark; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:false%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ffa305%22}; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..3HMTXrBGWoREDhYl.o-sxFofLRKRXntuueEuEReGsKc1HT2bzXg9Q2GJIS3pTH-GJoFbva_10kTkbsGcYwIbAy2D69NTai9qzS9HEQ_OToPFZkrk-qseNAgZLR5AzOyz4to3_BxYTqIHtPF_nt_6OUH4InUp8B9LaogJ-cHy9b1q8gMlEK0SWJ7fw8APNXy1RXi1QBILorj7JXvyJpJfl0cgSzqLYq5StJqeAFmiIcpCk0KAUumE.c5ErTxCKnOjqNb_8Mjjtkw; XSRF-TOKEN=eyJpdiI6ImxSTEN6RkFBZVErOXNlR0JMejVEYVE9PSIsInZhbHVlIjoiZWo0V0tTRjhkNnBOTHdiblF2WDV2RlZiVTljZ1ZDSEdCanhQWXk2bU9yU1J0cmZVM011elRjWjNkNkdOSXdlbkRTOFVUZDVyS25iQ2JvOUFuUytIYVFJTU90Qm5hM0RDbHM5V2pzQ1Y0cWx4WDFUeEgzNlhDQlpFczM2ckd6cE0iLCJtYWMiOiJhYzM2ZWIxZmE4M2VkNTA0ZmMyMjE2M2E5N2FhMzE5NDYxZjE5NzZjMDU5OWNhMjFkNjEyMDg2Yjk4N2MxZDM3IiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6IlI0Tk9mbm5XYkg3dkdXQUkrakJxeFE9PSIsInZhbHVlIjoid2xWWHZmdTBVMnAzRklkK0xmcU1SRy9XZnVLSnBneWtQOHAyOWlhVU1SZWFsWnIybGN4azIrS0dnWHQrcU8xRXdidklJN1hyZzU2SHVlQ1dqLzd1OEIvV0pidzRWaWhaSXZjU3kwaDNxbzZ0NUxLYlR1R2ZEREVEWmN5S1BxS28iLCJtYWMiOiI0ZTAyMjAwMWZhNTU2NjFkZGYwYzAwMzg4NTNhZTVjZjg5OGU1ZGRiMWI0ZDU1MjRmNDNkODg2MWI3NDk5ODZiIiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,NULL,NULL,'2024-05-06 15:07:29','2024-05-06 15:07:29'),(162,'GET','[]','http://localhost:8000','http://localhost:8000/admin/settings/currencies','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/localhost:8000\\/admin\\/settings\\/currencies\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=a646d3e47298db47f27252a019d996bc7baff34f1afac866312499b8a3d0b1e9%7C1c01d1037e592a0c4c8a72ec8b8b56f559c6c85f3aaa35c7ee85742e9d0aad68; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin%3FredirectTo%3D%252Fen%252Fpos; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:false%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ffa305%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..cwaYcm3M129Jhr8i.RlP3mZyvFoNF-kWtpTJeLGbD55xrNHFbSZ1Q7J0aVEgEgFjD-dRFGspqecXhGYb-MHONxNbGilsTknbjDJd53LP4JwuQD20sqthAcRbdkdes4liKBUDYfiTf81upYdx2LYB-RTdHfXjgX1TO1amvHPtuf3d8zwHhRF950ktc0wYfW0zp0VcQJfoZxRUSsZqiWLZ6wzxUFQo9c0A2oHAJ1OXPAdLebtVbDWE.hmXNJ32QEIwHpdHaxZmxKA; XSRF-TOKEN=eyJpdiI6ImJwdWk1eFllc0l5MjlTTllpVkNZbWc9PSIsInZhbHVlIjoiNnNhbWg0UlAzLzE1bndWVk5iV3lTMlo0SXNnKzRrS2tpcjI5Y25FR3VtVU5SREdvSWNVWGNVdEw3NFNFZ1N3TFE3N0Nmdk5aem9tVUF4S2lieGpYZXJQVEpvT1NZSGhNUHVkeE1LdHlEZmJxdThoRm9rb3NnemhEZS83b3RrZUQiLCJtYWMiOiJkM2JkMWFiYWM3YzcxYTRhZWY2MWQwMjMyZmE3MzEyZDg0YmQzZjU3MDllNDNiOTY1MmFmNGU1MGE4ZThlMmJhIiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6Inp2SkJmWHpicDRta2lSdEZtdEIybFE9PSIsInZhbHVlIjoiL28vRkhpYkZlQjZ4eXE2SDBucXN3dEZNNDVEbk01di8rVzc1eG9kZ2dWSU05bzVNRGlONzFQYklmUUZNbTBiVTdZL21PeTNLN3JoZWVpcXBWc0tpOFgyR0ZmVThXT0lkU1ZCMkxhcWVoSmt5K3VhbGtFQzlPTmppZnZjVTROd0EiLCJtYWMiOiJmYmE2YTUwZDgxZDBmNWJiY2VmYTQwYWVlODFhMTE4MDRkMDMzNjJiNmEyOWZhZTAxYzljZjQxNTY0MWVlMmQ4IiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,NULL,NULL,'2024-05-06 15:38:01','2024-05-06 15:38:01'),(163,'GET','[]','http://localhost:8000','http://localhost:8000/admin/settings/exchange-rates','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/localhost:8000\\/admin\\/settings\\/exchange-rates\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"next-auth.csrf-token=a646d3e47298db47f27252a019d996bc7baff34f1afac866312499b8a3d0b1e9%7C1c01d1037e592a0c4c8a72ec8b8b56f559c6c85f3aaa35c7ee85742e9d0aad68; next-auth.callback-url=http%3A%2F%2Flocalhost%3A3000%2Fen%2Flogin%3FredirectTo%3D%252Fen%252Fpos; materio-mui-next-demo-1={%22mode%22:%22light%22%2C%22skin%22:%22bordered%22%2C%22semiDark%22:false%2C%22layout%22:%22vertical%22%2C%22navbarContentWidth%22:%22wide%22%2C%22contentWidth%22:%22wide%22%2C%22footerContentWidth%22:%22wide%22%2C%22primaryColor%22:%22#ffa305%22}; colorPref=dark; next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..cwaYcm3M129Jhr8i.RlP3mZyvFoNF-kWtpTJeLGbD55xrNHFbSZ1Q7J0aVEgEgFjD-dRFGspqecXhGYb-MHONxNbGilsTknbjDJd53LP4JwuQD20sqthAcRbdkdes4liKBUDYfiTf81upYdx2LYB-RTdHfXjgX1TO1amvHPtuf3d8zwHhRF950ktc0wYfW0zp0VcQJfoZxRUSsZqiWLZ6wzxUFQo9c0A2oHAJ1OXPAdLebtVbDWE.hmXNJ32QEIwHpdHaxZmxKA; XSRF-TOKEN=eyJpdiI6IlU5OE5ZckNNWVVqSHdIRGdCRUtMOFE9PSIsInZhbHVlIjoid3hLQWE1WVdmc0RSeGpoOUhIY3BiRnk0bDlDcFlNMklLZDJEaXFvSytac25WY1lFT09WakVVUHV5UDNEdzRKVmNNZ3doQnRJZTF6VHBTdGJHbUFUS3FtV3kzYmRneTNiVlZ3bHdMWnVETlVlazNUUHljTzBlNFBaL285MFNwQkEiLCJtYWMiOiJjMDg3NTdkMWI5MGMyN2IxY2QyOWI3M2ZkMWM2YTdiMjIxMDhmOWFlZDFmMmE0YzI4MjdmYzBjNTk2MTg3NmE2IiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6IkoxTXE2MUZyaDNOMUtsN25NL01QZ0E9PSIsInZhbHVlIjoiN2xLdGdZa09mNlNYdHVZT0VaZHB1cnAvek84ZCswdy9LWktkdGJFTlMxcVVXNTNtTXR4S0preUZHSmM3czN2SXp3VUdPd0ZQSHlacnJXOEh3RVk3TWxvRSt1cnNqeld0WjZmWW4wejNJVUp2WllhcndkMit0bVdLN0kzOHJmR1YiLCJtYWMiOiIzZTA4MjQ2YmI2MWI0OTJmNjQ5NGM5NTNhOTcwYWVhNWVlMTBlNjcxNTRmNTQ5NGQzY2RiZmU4OGJjZWU2NDE0IiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,NULL,NULL,'2024-05-06 15:38:46','2024-05-06 15:38:46'),(164,'GET','[]','http://127.0.0.1:8000',NULL,'[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"none\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"csrftoken=IYpyh6Vp5D2O342k9ObfhgDkHfFzEodB; sessionid=7pc1hpyomibtystau2l5qz8rgw9t8dof; pos_jewelers_session=eyJpdiI6IlVNSkpJYi9wcjhrTUJ5Rm5sc1hyRHc9PSIsInZhbHVlIjoiL3JCSTlPbnFBbFB6ZS8xY1ZIU2RxS0dwbUlCTEdWcDVFbDEyMVRyN2krTGNseUJQTWFOUlZwVTJzWkc5SUh2L21xNFNDaEtINUdDSnFDY0tuQWVyb3g2VWpLNVpRbG5nakxzWWoyZ2pWNHpvZFEycXhZdkJYYThjM3N4S0crU3AiLCJtYWMiOiJlNjQ5NzZlZTUwOWM4MGM0OTUwNGY1OTM1OGE3YTQxYjFiZjE3OTY2NzU0NjJkMTM0M2JkMmQ2MmY3YmVjNmFlIiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,NULL,NULL,'2024-05-07 12:31:50','2024-05-07 12:31:50'),(165,'GET','[]','http://127.0.0.1:8000/Users/piyushjain/production/JewelersPOS/packages/Webkul/RestApi/src/Http/Controllers/V1/Admin/Catalog/ProductController.php',NULL,'[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"none\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"csrftoken=IYpyh6Vp5D2O342k9ObfhgDkHfFzEodB; sessionid=7pc1hpyomibtystau2l5qz8rgw9t8dof; XSRF-TOKEN=eyJpdiI6InpERU1RWkdVbkRNQlNtclhMNkEwZkE9PSIsInZhbHVlIjoiWG5yNGJwd1l0SWpMVmxtWmlsR0NoVUYxaFJXa3oyT0FNZUhYZHlQaVMxcVZ1NHd6OENtcEp5ZnJZaWRYUnZONHJOTmpYb3Z4bGQ1VUJ3SWY2MWU4WWdSTmVQc0h0ZVJuNlFpaGxXRDFjbzJ5a2lnTlRXdE0xYWg3dUl1cVF3MDIiLCJtYWMiOiJkZjc2ZmU2Mjc1OTM4NWY3NDc0YTRjZGNkMGQzNTYyZDZlZDg5ZTQ1MjRmMzBkODIyYzc4OTMzMjNhZTk4NDBhIiwidGFnIjoiIn0%3D; pos_jewelers_session=eyJpdiI6IkpHRFNUdlVhb1VNRHZoTWg5ZnhDS0E9PSIsInZhbHVlIjoiUU9QWXBpanB2aTBqQkpmTnJZUnpiaXI2VmF1TU0zZHVxMmJGYTNHNk9ScW5xTzJORUlWaERyU210RkFCZ1pBTkhqTTNnQTE3RE1SV2pqU2p4UnBTcVJqbGs5TTF2QnNwSE4zWnlPemloa3lGQ3lua2FQRFkxVHN4NE5YYkNEY3oiLCJtYWMiOiJhYWNlY2FjODRjMjVhZTgyYmE1NTZlNzUxNTkzZjZmMzQ1NThmNWQ4ZGI5ODhiMjBhZjE4NWE0NGQzYWYzZDZlIiwidGFnIjoiIn0%3D\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,NULL,NULL,'2024-05-07 13:00:31','2024-05-07 13:00:31'),(166,'GET','[]','http://127.0.0.1:8000/Users/piyushjain/production/JewelersPOS/packages/Webkul/RestApi/src/Http/Controllers/V1/Admin/Catalog/storage/theme/1/XrX0w1NYgVf4LGozkAkbMPWMVLMmbz56COCJQSc0.webp','http://127.0.0.1:8000/Users/piyushjain/production/JewelersPOS/packages/Webkul/RestApi/src/Http/Controllers/V1/Admin/Catalog/ProductController.php','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/Users\\/piyushjain\\/production\\/JewelersPOS\\/packages\\/Webkul\\/RestApi\\/src\\/Http\\/Controllers\\/V1\\/Admin\\/Catalog\\/ProductController.php\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"csrftoken=IYpyh6Vp5D2O342k9ObfhgDkHfFzEodB; sessionid=7pc1hpyomibtystau2l5qz8rgw9t8dof; XSRF-TOKEN=eyJpdiI6IlUvQysrNndSTkVQeU5MYlp0SXVsa2c9PSIsInZhbHVlIjoiMmtRSUhQaGtFK3RHT1RyOU10d2pPZkZ6bVFBUiszbG9hWkQvaFBNbjNmbE5VaXVNSGFoU2lTbGpOOXE5ZXg3VldPYVN5Y3NSVEdxOUNCa3N6UjNVdzBFRDJYcVFnNklxdHlPdzcvVmxDbUI0ZEVOTytxOU0wazQwN1lvZjhXVDMiLCJtYWMiOiIwMzM3ZWUzNjI1ZDg5YzQwNDc0YmY2N2VlNzY1NzQzY2ExOGMwYTExZWQ2ODgwMDA5MmMxNTUxNGM4ODJiMDVjIiwidGFnIjoiIn0%3D; pos_jewelers_session=0e3tddSjcpDf0OklaDEX0Ug5BWkfRBt948C8KcFl\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,NULL,NULL,'2024-05-07 13:00:32','2024-05-07 13:00:32'),(167,'GET','[]','http://127.0.0.1:8000/Users/piyushjain/production/JewelersPOS/packages/Webkul/RestApi/src/Http/Controllers/V1/Admin/Catalog/storage/theme/1/6djeg88iqLD7u7gl62phIGd4IES7lbXeGZcgoXdW.webp','http://127.0.0.1:8000/Users/piyushjain/production/JewelersPOS/packages/Webkul/RestApi/src/Http/Controllers/V1/Admin/Catalog/ProductController.php','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/Users\\/piyushjain\\/production\\/JewelersPOS\\/packages\\/Webkul\\/RestApi\\/src\\/Http\\/Controllers\\/V1\\/Admin\\/Catalog\\/ProductController.php\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"csrftoken=IYpyh6Vp5D2O342k9ObfhgDkHfFzEodB; sessionid=7pc1hpyomibtystau2l5qz8rgw9t8dof; XSRF-TOKEN=eyJpdiI6IlUvQysrNndSTkVQeU5MYlp0SXVsa2c9PSIsInZhbHVlIjoiMmtRSUhQaGtFK3RHT1RyOU10d2pPZkZ6bVFBUiszbG9hWkQvaFBNbjNmbE5VaXVNSGFoU2lTbGpOOXE5ZXg3VldPYVN5Y3NSVEdxOUNCa3N6UjNVdzBFRDJYcVFnNklxdHlPdzcvVmxDbUI0ZEVOTytxOU0wazQwN1lvZjhXVDMiLCJtYWMiOiIwMzM3ZWUzNjI1ZDg5YzQwNDc0YmY2N2VlNzY1NzQzY2ExOGMwYTExZWQ2ODgwMDA5MmMxNTUxNGM4ODJiMDVjIiwidGFnIjoiIn0%3D; pos_jewelers_session=0e3tddSjcpDf0OklaDEX0Ug5BWkfRBt948C8KcFl\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,NULL,NULL,'2024-05-07 13:00:32','2024-05-07 13:00:32'),(168,'GET','[]','http://127.0.0.1:8000/Users/piyushjain/production/JewelersPOS/packages/Webkul/RestApi/src/Http/Controllers/V1/Admin/Catalog/storage/theme/1/L3ou2rnh0Y30qV6xmDoUvSBvTAldxa8YQB08CCEH.webp','http://127.0.0.1:8000/Users/piyushjain/production/JewelersPOS/packages/Webkul/RestApi/src/Http/Controllers/V1/Admin/Catalog/ProductController.php','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/Users\\/piyushjain\\/production\\/JewelersPOS\\/packages\\/Webkul\\/RestApi\\/src\\/Http\\/Controllers\\/V1\\/Admin\\/Catalog\\/ProductController.php\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"csrftoken=IYpyh6Vp5D2O342k9ObfhgDkHfFzEodB; sessionid=7pc1hpyomibtystau2l5qz8rgw9t8dof; XSRF-TOKEN=eyJpdiI6IlUvQysrNndSTkVQeU5MYlp0SXVsa2c9PSIsInZhbHVlIjoiMmtRSUhQaGtFK3RHT1RyOU10d2pPZkZ6bVFBUiszbG9hWkQvaFBNbjNmbE5VaXVNSGFoU2lTbGpOOXE5ZXg3VldPYVN5Y3NSVEdxOUNCa3N6UjNVdzBFRDJYcVFnNklxdHlPdzcvVmxDbUI0ZEVOTytxOU0wazQwN1lvZjhXVDMiLCJtYWMiOiIwMzM3ZWUzNjI1ZDg5YzQwNDc0YmY2N2VlNzY1NzQzY2ExOGMwYTExZWQ2ODgwMDA5MmMxNTUxNGM4ODJiMDVjIiwidGFnIjoiIn0%3D; pos_jewelers_session=0e3tddSjcpDf0OklaDEX0Ug5BWkfRBt948C8KcFl\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,NULL,NULL,'2024-05-07 13:00:32','2024-05-07 13:00:32'),(169,'GET','[]','http://127.0.0.1:8000/Users/piyushjain/production/JewelersPOS/packages/Webkul/RestApi/src/Http/Controllers/V1/Admin/Catalog/storage/theme/1/IAVGQ6NnGE2oAlagjM2AaCFrDndSh5JlKIhnfaEd.webp','http://127.0.0.1:8000/Users/piyushjain/production/JewelersPOS/packages/Webkul/RestApi/src/Http/Controllers/V1/Admin/Catalog/ProductController.php','[]','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"124\\\", \\\"Google Chrome\\\";v=\\\"124\\\", \\\"Not-A.Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/Users\\/piyushjain\\/production\\/JewelersPOS\\/packages\\/Webkul\\/RestApi\\/src\\/Http\\/Controllers\\/V1\\/Admin\\/Catalog\\/ProductController.php\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8\"],\"cookie\":[\"csrftoken=IYpyh6Vp5D2O342k9ObfhgDkHfFzEodB; sessionid=7pc1hpyomibtystau2l5qz8rgw9t8dof; XSRF-TOKEN=eyJpdiI6IlUvQysrNndSTkVQeU5MYlp0SXVsa2c9PSIsInZhbHVlIjoiMmtRSUhQaGtFK3RHT1RyOU10d2pPZkZ6bVFBUiszbG9hWkQvaFBNbjNmbE5VaXVNSGFoU2lTbGpOOXE5ZXg3VldPYVN5Y3NSVEdxOUNCa3N6UjNVdzBFRDJYcVFnNklxdHlPdzcvVmxDbUI0ZEVOTytxOU0wazQwN1lvZjhXVDMiLCJtYWMiOiIwMzM3ZWUzNjI1ZDg5YzQwNDc0YmY2N2VlNzY1NzQzY2ExOGMwYTExZWQ2ODgwMDA5MmMxNTUxNGM4ODJiMDVjIiwidGFnIjoiIn0%3D; pos_jewelers_session=0e3tddSjcpDf0OklaDEX0Ug5BWkfRBt948C8KcFl\"]}','Macintosh','OS X','Chrome','127.0.0.1',NULL,NULL,NULL,NULL,'2024-05-07 13:00:32','2024-05-07 13:00:32');
/*!40000 ALTER TABLE `visits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlist`
--

DROP TABLE IF EXISTS `wishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wishlist` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `channel_id` int unsigned NOT NULL,
  `product_id` int unsigned NOT NULL,
  `customer_id` int unsigned NOT NULL,
  `item_options` json DEFAULT NULL,
  `moved_to_cart` date DEFAULT NULL,
  `shared` tinyint(1) DEFAULT NULL,
  `time_of_moving` date DEFAULT NULL,
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wishlist_channel_id_foreign` (`channel_id`),
  KEY `wishlist_product_id_foreign` (`product_id`),
  KEY `wishlist_customer_id_foreign` (`customer_id`),
  CONSTRAINT `wishlist_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `wishlist_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `wishlist_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlist`
--

LOCK TABLES `wishlist` WRITE;
/*!40000 ALTER TABLE `wishlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `wishlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlist_items`
--

DROP TABLE IF EXISTS `wishlist_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wishlist_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `channel_id` int unsigned NOT NULL,
  `product_id` int unsigned NOT NULL,
  `customer_id` int unsigned NOT NULL,
  `additional` json DEFAULT NULL,
  `moved_to_cart` date DEFAULT NULL,
  `shared` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wishlist_items_channel_id_foreign` (`channel_id`),
  KEY `wishlist_items_product_id_foreign` (`product_id`),
  KEY `wishlist_items_customer_id_foreign` (`customer_id`),
  CONSTRAINT `wishlist_items_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `wishlist_items_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `wishlist_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlist_items`
--

LOCK TABLES `wishlist_items` WRITE;
/*!40000 ALTER TABLE `wishlist_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `wishlist_items` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-07 20:48:47
