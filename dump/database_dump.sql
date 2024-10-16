-- MariaDB dump 10.19  Distrib 10.11.6-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: database    Database: app
-- ------------------------------------------------------
-- Server version	11.5.2-MariaDB-ubu2404

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
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `updated_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`id`),
  KEY `IDX_23A0E66F675F31B` (`author_id`),
  CONSTRAINT `FK_23A0E66F675F31B` FOREIGN KEY (`author_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `author`
--

DROP TABLE IF EXISTS `author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `author` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author`
--

LOCK TABLES `author` WRITE;
/*!40000 ALTER TABLE `author` DISABLE KEYS */;
/*!40000 ALTER TABLE `author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `author_document`
--

DROP TABLE IF EXISTS `author_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `author_document` (
  `author_id` int(11) NOT NULL,
  `document_id` int(11) NOT NULL,
  PRIMARY KEY (`author_id`,`document_id`),
  KEY `IDX_37F9A0C3F675F31B` (`author_id`),
  KEY `IDX_37F9A0C3C33F7837` (`document_id`),
  CONSTRAINT `FK_37F9A0C3C33F7837` FOREIGN KEY (`document_id`) REFERENCES `document` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_37F9A0C3F675F31B` FOREIGN KEY (`author_id`) REFERENCES `author` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author_document`
--

LOCK TABLES `author_document` WRITE;
/*!40000 ALTER TABLE `author_document` DISABLE KEYS */;
/*!40000 ALTER TABLE `author_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `benefit`
--

DROP TABLE IF EXISTS `benefit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `benefit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `editor_id` int(11) NOT NULL,
  `dolibarr_reference` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `start` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `archived` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_5C8B001FA76ED395` (`user_id`),
  KEY `IDX_5C8B001F6995AC4C` (`editor_id`),
  CONSTRAINT `FK_5C8B001F6995AC4C` FOREIGN KEY (`editor_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_5C8B001FA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `benefit`
--

LOCK TABLES `benefit` WRITE;
/*!40000 ALTER TABLE `benefit` DISABLE KEYS */;
/*!40000 ALTER TABLE `benefit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_document`
--

DROP TABLE IF EXISTS `category_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category_document` (
  `category_id` int(11) NOT NULL,
  `document_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`document_id`),
  KEY `IDX_6F130E0D12469DE2` (`category_id`),
  KEY `IDX_6F130E0DC33F7837` (`document_id`),
  CONSTRAINT `FK_6F130E0D12469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_6F130E0DC33F7837` FOREIGN KEY (`document_id`) REFERENCES `document` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_document`
--

LOCK TABLES `category_document` WRITE;
/*!40000 ALTER TABLE `category_document` DISABLE KEYS */;
/*!40000 ALTER TABLE `category_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `document`
--

DROP TABLE IF EXISTS `document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `document` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `summary` longtext NOT NULL,
  `release_date` date DEFAULT NULL,
  `number_views` int(11) NOT NULL,
  `document_name` varchar(255) NOT NULL,
  `document_size` int(11) DEFAULT NULL,
  `document_mime_type` varchar(255) NOT NULL,
  `updated_at` datetime NOT NULL,
  `permission` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document`
--

LOCK TABLES `document` WRITE;
/*!40000 ALTER TABLE `document` DISABLE KEYS */;
/*!40000 ALTER TABLE `document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resource_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `dtstart` datetime NOT NULL,
  `dtend` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_3BAE0AA789329D25` (`resource_id`),
  KEY `IDX_3BAE0AA7A76ED395` (`user_id`),
  CONSTRAINT `FK_3BAE0AA789329D25` FOREIGN KEY (`resource_id`) REFERENCES `resource` (`id`),
  CONSTRAINT `FK_3BAE0AA7A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event`
--

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
/*!40000 ALTER TABLE `event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opening_hours`
--

DROP TABLE IF EXISTS `opening_hours`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opening_hours` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `day_of_week` int(11) NOT NULL,
  `hour` int(11) NOT NULL,
  `minute` int(11) NOT NULL,
  `open_close_command` tinyint(1) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `member` varchar(255) DEFAULT NULL,
  `reserve` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opening_hours`
--

LOCK TABLES `opening_hours` WRITE;
/*!40000 ALTER TABLE `opening_hours` DISABLE KEYS */;
/*!40000 ALTER TABLE `opening_hours` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource`
--

DROP TABLE IF EXISTS `resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `background_color` varchar(255) NOT NULL,
  `text_color` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource`
--

LOCK TABLES `resource` WRITE;
/*!40000 ALTER TABLE `resource` DISABLE KEYS */;
/*!40000 ALTER TABLE `resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `route`
--

DROP TABLE IF EXISTS `route`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `route` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `ip_address` varchar(255) NOT NULL,
  `route` varchar(255) NOT NULL,
  `controller` varchar(255) NOT NULL,
  `browser` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `route`
--

LOCK TABLES `route` WRITE;
/*!40000 ALTER TABLE `route` DISABLE KEYS */;
INSERT INTO `route` VALUES
(1,'2024-10-11 00:28:53','172.18.0.1','homepage','App\\Controller\\Home\\HomeController::homepage','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0'),
(2,'2024-10-11 00:29:04','172.18.0.1','app_login','App\\Controller\\Security\\SecurityController::login','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0'),
(3,'2024-10-11 00:29:23','172.18.0.1','user_profile','App\\Controller\\User\\UserController::profile','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0'),
(4,'2024-10-11 00:29:29','172.18.0.1','ldap_members_list','App\\Controller\\Ldap\\LdapController::members_list','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0'),
(5,'2024-10-11 00:29:34','172.18.0.1','ldap_member_edit','App\\Controller\\Ldap\\LdapController::member_edit','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0'),
(6,'2024-10-11 00:31:08','172.18.0.1','ldap_member_edit','App\\Controller\\Ldap\\LdapController::member_edit','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0'),
(7,'2024-10-11 00:35:56','172.18.0.1','ldap_member_edit','App\\Controller\\Ldap\\LdapController::member_edit','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0'),
(8,'2024-10-11 00:37:16','172.18.0.1','ldap_member_edit','App\\Controller\\Ldap\\LdapController::member_edit','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0'),
(9,'2024-10-11 00:43:30','172.18.0.1','ldap_members_list','App\\Controller\\Ldap\\LdapController::members_list','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0'),
(10,'2024-10-11 00:44:10','172.18.0.1','ldap_members_list','App\\Controller\\Ldap\\LdapController::members_list','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0'),
(11,'2024-10-11 00:45:01','172.18.0.1','ldap_members_list','App\\Controller\\Ldap\\LdapController::members_list','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0'),
(12,'2024-10-11 00:46:15','172.18.0.1','ldap_member_full','App\\Controller\\Ldap\\LdapController::memberFull','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0'),
(13,'2024-10-11 00:46:54','172.18.0.1','user_profile','App\\Controller\\User\\UserController::profile','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0'),
(14,'2024-10-11 00:47:09','172.18.0.1','homepage','App\\Controller\\Home\\HomeController::homepage','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0'),
(15,'2024-10-11 00:47:18','172.18.0.1','app_login','App\\Controller\\Security\\SecurityController::login','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0'),
(16,'2024-10-11 00:49:29','172.18.0.1','app_login','App\\Controller\\Security\\SecurityController::login','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0'),
(17,'2024-10-11 00:50:15','172.18.0.1','user_profile','App\\Controller\\User\\UserController::profile','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0'),
(18,'2024-10-11 00:50:23','172.18.0.1','ldap_members_list','App\\Controller\\Ldap\\LdapController::members_list','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0'),
(19,'2024-10-11 00:51:01','172.18.0.1','ldap_members_list','App\\Controller\\Ldap\\LdapController::members_list','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0'),
(20,'2024-10-11 00:51:47','172.18.0.1','ldap_members_list','App\\Controller\\Ldap\\LdapController::members_list','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0'),
(21,'2024-10-11 00:53:05','172.18.0.1','ldap_members_list','App\\Controller\\Ldap\\LdapController::members_list','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0'),
(22,'2024-10-11 00:53:43','172.18.0.1','ldap_member_edit','App\\Controller\\Ldap\\LdapController::member_edit','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0'),
(23,'2024-10-11 00:54:28','172.18.0.1','ldap_member_edit','App\\Controller\\Ldap\\LdapController::member_edit','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0'),
(24,'2024-10-11 00:54:32','172.18.0.1','ldap_members_list','App\\Controller\\Ldap\\LdapController::members_list','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0'),
(25,'2024-10-11 00:57:07','172.18.0.1','ldap_members_list','App\\Controller\\Ldap\\LdapController::members_list','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0'),
(26,'2024-10-11 00:57:40','172.18.0.1','user_profile','App\\Controller\\User\\UserController::profile','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0'),
(27,'2024-10-11 00:57:46','172.18.0.1','site_management_home','App\\Controller\\SiteManagement\\SiteManagementController::home','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0'),
(28,'2024-10-11 00:58:04','172.18.0.1','benefit_management_home','App\\Controller\\BenefitManagement\\BenefitController::index','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0'),
(29,'2024-10-11 00:58:09','172.18.0.1','benefit_management_edit','App\\Controller\\BenefitManagement\\BenefitController::edit','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0'),
(30,'2024-10-11 00:58:19','172.18.0.1','document_management_home','App\\Controller\\DocumentManagement\\DocumentManagementController::home','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0'),
(31,'2024-10-11 00:58:30','172.18.0.1','project_space_home','App\\Controller\\Project\\SpaceController::home','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0'),
(32,'2024-10-11 00:58:40','172.18.0.1','resource_reservation_home','App\\Controller\\SiteManagement\\ResourceReservationController::home','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0'),
(33,'2024-10-11 00:59:12','172.18.0.1','user_profile','App\\Controller\\User\\UserController::profile','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0'),
(34,'2024-10-11 00:59:24','172.18.0.1','ldap_members_list','App\\Controller\\Ldap\\LdapController::members_list','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0'),
(35,'2024-10-11 00:59:33','172.18.0.1','ldap_member_edit','App\\Controller\\Ldap\\LdapController::member_edit','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0'),
(36,'2024-10-11 00:59:42','172.18.0.1','ldap_member_edit','App\\Controller\\Ldap\\LdapController::member_edit','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0'),
(37,'2024-10-11 00:59:48','172.18.0.1','ldap_members_list','App\\Controller\\Ldap\\LdapController::members_list','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0'),
(38,'2024-10-12 09:58:53','172.18.0.1','homepage','App\\Controller\\Home\\HomeController::homepage','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0'),
(39,'2024-10-12 10:01:41','172.18.0.1','homepage','App\\Controller\\Home\\HomeController::homepage','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0'),
(40,'2024-10-12 10:40:43','172.18.0.1','homepage','App\\Controller\\Home\\HomeController::homepage','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0'),
(41,'2024-10-12 10:57:54','172.18.0.1','homepage','App\\Controller\\Home\\HomeController::homepage','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0'),
(42,'2024-10-12 11:16:25','172.18.0.1','blog_home','App\\Controller\\Blog\\BlogController::home','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0'),
(43,'2024-10-12 11:21:08','172.18.0.1','news','App\\Controller\\Home\\HomeController::news','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0'),
(44,'2024-10-12 11:21:08','172.18.0.1','homepage','App\\Controller\\Home\\HomeController::homepage','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0'),
(45,'2024-10-14 15:28:28','172.18.0.1','homepage','App\\Controller\\Home\\HomeController::homepage','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0'),
(46,'2024-10-14 15:30:26','172.18.0.1','homepage','App\\Controller\\Home\\HomeController::homepage','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0'),
(47,'2024-10-14 15:30:42','172.18.0.1','homepage','App\\Controller\\Home\\HomeController::homepage','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0'),
(48,'2024-10-14 15:30:57','172.18.0.1','homepage','App\\Controller\\Home\\HomeController::homepage','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0'),
(49,'2024-10-14 15:31:19','172.18.0.1','homepage','App\\Controller\\Home\\HomeController::homepage','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0'),
(50,'2024-10-14 15:42:13','172.18.0.1','homepage','App\\Controller\\Home\\HomeController::homepage','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0'),
(51,'2024-10-14 15:42:47','172.18.0.1','homepage','App\\Controller\\Home\\HomeController::homepage','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0'),
(52,'2024-10-14 15:43:01','172.18.0.1','homepage','App\\Controller\\Home\\HomeController::homepage','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0'),
(53,'2024-10-14 16:18:42','172.18.0.1','homepage','App\\Controller\\Home\\HomeController::homepage','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0'),
(54,'2024-10-14 16:20:53','172.18.0.1','homepage','App\\Controller\\Home\\HomeController::homepage','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0'),
(55,'2024-10-14 16:21:05','172.18.0.1','app_login','App\\Controller\\Security\\SecurityController::login','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0'),
(56,'2024-10-14 16:21:29','172.18.0.1','user_profile','App\\Controller\\User\\UserController::profile','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0'),
(57,'2024-10-14 16:22:05','172.18.0.1','site_management_home','App\\Controller\\SiteManagement\\SiteManagementController::home','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0'),
(58,'2024-10-14 16:22:24','172.18.0.1','training_management_home','App\\Controller\\TrainingManagement\\TrainingManagementController::home','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0'),
(59,'2024-10-14 16:22:32','172.18.0.1','training_management_edit','App\\Controller\\TrainingManagement\\TrainingManagementController::edit','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0'),
(60,'2024-10-14 16:24:34','172.18.0.1','training_management_edit','App\\Controller\\TrainingManagement\\TrainingManagementController::edit','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0'),
(61,'2024-10-14 16:26:01','172.18.0.1','training_management_edit','App\\Controller\\TrainingManagement\\TrainingManagementController::edit','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0'),
(62,'2024-10-14 16:28:30','172.18.0.1','training_management_edit','App\\Controller\\TrainingManagement\\TrainingManagementController::edit','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0'),
(63,'2024-10-14 16:28:44','172.18.0.1','training_management_warning','App\\Controller\\TrainingManagement\\TrainingManagementController::warning','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0'),
(64,'2024-10-14 16:28:57','172.18.0.1','homepage','App\\Controller\\Home\\HomeController::homepage','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0'),
(65,'2024-10-14 16:29:07','172.18.0.1','user_profile','App\\Controller\\User\\UserController::profile','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0'),
(66,'2024-10-14 16:29:12','172.18.0.1','training_management_home','App\\Controller\\TrainingManagement\\TrainingManagementController::home','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0'),
(67,'2024-10-14 16:31:17','172.18.0.1','training_management_home','App\\Controller\\TrainingManagement\\TrainingManagementController::home','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0'),
(68,'2024-10-14 16:40:55','172.18.0.1','homepage','App\\Controller\\Home\\HomeController::homepage','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0'),
(69,'2024-10-14 16:41:06','172.18.0.1','app_login','App\\Controller\\Security\\SecurityController::login','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0'),
(70,'2024-10-14 16:41:23','172.18.0.1','user_profile','App\\Controller\\User\\UserController::profile','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0'),
(71,'2024-10-14 16:42:33','172.18.0.1','user_profile','App\\Controller\\User\\UserController::profile','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0'),
(72,'2024-10-14 16:42:53','172.18.0.1','benefit_management_home','App\\Controller\\BenefitManagement\\BenefitController::index','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0'),
(73,'2024-10-14 16:42:59','172.18.0.1','benefit_management_edit','App\\Controller\\BenefitManagement\\BenefitController::edit','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0'),
(74,'2024-10-14 16:43:29','172.18.0.1','benefit_management_edit','App\\Controller\\BenefitManagement\\BenefitController::edit','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0'),
(75,'2024-10-14 16:44:02','172.18.0.1','benefit_management_edit','App\\Controller\\BenefitManagement\\BenefitController::edit','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0'),
(76,'2024-10-14 16:44:17','172.18.0.1','user_profile','App\\Controller\\User\\UserController::profile','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0'),
(77,'2024-10-14 16:44:28','172.18.0.1','resource_reservation_home','App\\Controller\\SiteManagement\\ResourceReservationController::home','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0'),
(78,'2024-10-14 17:22:03','172.18.0.1','homepage','App\\Controller\\Home\\HomeController::homepage','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0'),
(79,'2024-10-14 17:22:43','172.18.0.1','user_profile','App\\Controller\\User\\UserController::profile','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0'),
(80,'2024-10-14 17:23:00','172.18.0.1','resource_reservation_home','App\\Controller\\SiteManagement\\ResourceReservationController::home','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0'),
(81,'2024-10-14 17:23:20','172.18.0.1','user_profile','App\\Controller\\User\\UserController::profile','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0'),
(82,'2024-10-14 17:24:04','172.18.0.1','resource_reservation_home','App\\Controller\\SiteManagement\\ResourceReservationController::home','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0');
/*!40000 ALTER TABLE `route` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setting`
--

DROP TABLE IF EXISTS `setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `opening_status` tinyint(1) NOT NULL,
  `action_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_9F74B898A76ED395` (`user_id`),
  CONSTRAINT `FK_9F74B898A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setting`
--

LOCK TABLES `setting` WRITE;
/*!40000 ALTER TABLE `setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `training`
--

DROP TABLE IF EXISTS `training`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `training` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `place` varchar(255) NOT NULL,
  `date_start_time` datetime NOT NULL,
  `number_available` int(11) NOT NULL,
  `duration` time NOT NULL,
  `prerequisite` longtext DEFAULT NULL,
  `former` varchar(255) NOT NULL,
  `cost` double NOT NULL,
  `number_initial` int(11) NOT NULL,
  `category` varchar(255) NOT NULL,
  `free_entrance` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `training`
--

LOCK TABLES `training` WRITE;
/*!40000 ALTER TABLE `training` DISABLE KEYS */;
INSERT INTO `training` VALUES
(1,'Découverte de l\'Impression 3D','<p>Envie de plonger dans le monde fascinant de la fabrication num&eacute;rique ? Rejoignez-nous pour un atelier d&#39;initiation &agrave; l&#39;impression 3D au Fablab ! Que vous soyez d&eacute;butant ou passionn&eacute; par la technologie, cet atelier vous permettra de d&eacute;couvrir les bases de cette m&eacute;thode de fabrication innovante.</p>\r\n\r\n<h3>Au programme :</h3>\r\n\r\n<ul>\r\n	<li><strong>Introduction &agrave; l&#39;impression 3D</strong> : Qu&#39;est-ce que l&#39;impression 3D et comment fonctionne-t-elle ? Nous aborderons les diff&eacute;rents types d&#39;imprimantes 3D et leurs utilisations, des projets artistiques aux solutions industrielles.</li>\r\n	<li><strong>Cr&eacute;ation d&#39;un mod&egrave;le 3D</strong> : Apprenez &agrave; concevoir un objet en 3D gr&acirc;ce &agrave; des logiciels simples et accessibles. Nous vous guiderons &eacute;tape par &eacute;tape pour mod&eacute;liser votre premi&egrave;re pi&egrave;ce.</li>\r\n	<li><strong>Pr&eacute;paration et impression</strong> : D&eacute;couvrez comment pr&eacute;parer votre mod&egrave;le pour l&#39;impression, configurer les param&egrave;tres (temp&eacute;rature, vitesse, etc.), et lancer votre premi&egrave;re impression sur une imprimante 3D.</li>\r\n	<li><strong>D&eacute;couverte des mat&eacute;riaux</strong> : Explorez les diff&eacute;rents types de filaments disponibles (PLA, ABS, PETG, etc.), leurs propri&eacute;t&eacute;s et leurs applications.</li>\r\n</ul>\r\n\r\n<h3>Objectifs de l&#39;atelier :</h3>\r\n\r\n<ul>\r\n	<li>Comprendre le fonctionnement d&#39;une imprimante 3D.</li>\r\n	<li>Cr&eacute;er un mod&egrave;le 3D pr&ecirc;t &agrave; &ecirc;tre imprim&eacute;.</li>\r\n	<li>Apprendre &agrave; utiliser un logiciel de mod&eacute;lisation de mani&egrave;re simple et intuitive.</li>\r\n	<li>D&eacute;couvrir les possibilit&eacute;s offertes par l&#39;impression 3D pour vos projets personnels ou professionnels.</li>\r\n</ul>\r\n\r\n<p>Que vous souhaitiez cr&eacute;er des objets d&eacute;coratifs, des prototypes ou des pi&egrave;ces fonctionnelles, cet atelier est fait pour vous ! Repartez avec votre propre cr&eacute;ation imprim&eacute;e et des connaissances qui vous ouvriront les portes d&#39;innombrables projets.</p>','Atelier des Projets - Espace FabLab -','2024-11-24 17:00:00',5,'02:00:00','Aucun','Pierre Paul',0,5,'2',0);
/*!40000 ALTER TABLE `training` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `training_user`
--

DROP TABLE IF EXISTS `training_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `training_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `training_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `registration_date` datetime NOT NULL,
  `attendance` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_8209910ABEFD98D1` (`training_id`),
  KEY `IDX_8209910AA76ED395` (`user_id`),
  CONSTRAINT `FK_8209910AA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_8209910ABEFD98D1` FOREIGN KEY (`training_id`) REFERENCES `training` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `training_user`
--

LOCK TABLES `training_user` WRITE;
/*!40000 ALTER TABLE `training_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `training_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` binary(16) NOT NULL COMMENT '(DC2Type:uuid)',
  `last_login` datetime DEFAULT NULL,
  `login_count` int(11) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES
(1,'qK��(@2�N�2�L��',NULL,0,0),
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-15 10:57:59
