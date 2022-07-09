
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
-- Table structure for table `accessnumber`
--

DROP TABLE IF EXISTS `accessnumber`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accessnumber` (
  `id` int NOT NULL AUTO_INCREMENT,
  `access_number` varchar(25) DEFAULT NULL,
  `country_id` int NOT NULL DEFAULT '0',
  `description` varchar(1000) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 for active and 1 for inactive',
  `creation_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accessnumber`
--

LOCK TABLES `accessnumber` WRITE;
/*!40000 ALTER TABLE `accessnumber` DISABLE KEYS */;
/*!40000 ALTER TABLE `accessnumber` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_unverified`
--

DROP TABLE IF EXISTS `account_unverified`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_unverified` (
  `id` int NOT NULL AUTO_INCREMENT,
  `reseller_id` int NOT NULL,
  `number` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `telephone` varchar(20) NOT NULL,
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `first_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `company_name` varchar(50) NOT NULL,
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `country_id` int NOT NULL,
  `currency_id` int NOT NULL,
  `timezone_id` int NOT NULL,
  `otp` int NOT NULL,
  `retries` int NOT NULL,
  `client_ip` varchar(50) NOT NULL,
  `creation_date` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `otp_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0->OTP not used,1->OTP has been used',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_unverified`
--

LOCK TABLES `account_unverified` WRITE;
/*!40000 ALTER TABLE `account_unverified` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_unverified` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `number` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `reseller_id` int DEFAULT NULL COMMENT 'Resellers account id',
  `pricelist_id` int NOT NULL COMMENT 'pricelist table id',
  `cli_pool` int NOT NULL DEFAULT '0',
  `paypal_permission` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:enable,1:disable',
  `reference` varchar(100) NOT NULL,
  `non_cli_pricelist_id` int NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:active,1:inactive',
  `sweep_id` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Sweep list table id',
  `creation` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `credit_limit` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `posttoexternal` tinyint(1) NOT NULL DEFAULT '0',
  `balance` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `password` varchar(100) NOT NULL DEFAULT '',
  `first_name` varchar(40) NOT NULL DEFAULT '',
  `last_name` varchar(40) NOT NULL DEFAULT '',
  `company_name` varchar(40) NOT NULL DEFAULT '',
  `address_1` varchar(80) NOT NULL DEFAULT '',
  `address_2` varchar(80) NOT NULL DEFAULT '',
  `postal_code` varchar(12) NOT NULL DEFAULT '',
  `province` varchar(20) NOT NULL DEFAULT '',
  `city` varchar(20) NOT NULL DEFAULT '',
  `country_id` int NOT NULL DEFAULT '0' COMMENT 'Country table id',
  `telephone_1` varchar(20) NOT NULL DEFAULT '',
  `telephone_2` varchar(20) NOT NULL DEFAULT '',
  `email` varchar(80) NOT NULL DEFAULT '',
  `notification_email` varchar(80) NOT NULL DEFAULT '',
  `language_id` int NOT NULL DEFAULT '0' COMMENT 'language table id',
  `currency_id` int NOT NULL DEFAULT '0' COMMENT 'Currency table id',
  `maxchannels` int NOT NULL DEFAULT '1',
  `cps` int NOT NULL DEFAULT '0',
  `dialed_modify` mediumtext NOT NULL,
  `type` tinyint(1) DEFAULT '0',
  `timezone_id` int NOT NULL DEFAULT '0' COMMENT 'timezone table id',
  `inuse` int NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1=deleted',
  `notify_credit_limit` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `notify_flag` tinyint(1) NOT NULL,
  `notify_email` varchar(80) NOT NULL,
  `commission_rate` int NOT NULL DEFAULT '0',
  `invoice_day` int NOT NULL DEFAULT '0',
  `invoice_interval` int NOT NULL,
  `invoice_note` text NOT NULL,
  `last_bill_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `pin` varchar(20) NOT NULL,
  `first_used` datetime NOT NULL,
  `expiry` datetime NOT NULL,
  `validfordays` int NOT NULL DEFAULT '3652',
  `local_call_cost` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `pass_link_status` tinyint(1) NOT NULL DEFAULT '0',
  `local_call` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1:enable,0:disable',
  `charge_per_min` varchar(100) NOT NULL,
  `is_recording` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 for On,1 for Off',
  `loss_less_routing` tinyint(1) NOT NULL DEFAULT '0',
  `allow_ip_management` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1:enable,0:disable',
  `permission_id` int NOT NULL DEFAULT '0',
  `deleted_date` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `localization_id` int DEFAULT '0',
  `notifications` tinyint NOT NULL DEFAULT '0' COMMENT '0:enable,1:disable',
  `is_distributor` tinyint NOT NULL DEFAULT '1' COMMENT '0 for yes and 1 for No ',
  `generate_invoice` tinyint NOT NULL DEFAULT '0' COMMENT '0:enable,1:disable',
  `std_cid_translation` varchar(100) NOT NULL,
  `did_cid_translation` varchar(100) NOT NULL,
  `tax_number` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `number` (`number`),
  KEY `pricelist` (`pricelist_id`),
  KEY `reseller` (`reseller_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES (1,'admin',0,0,0,0,'',0,0,2,'2016-07-25 00:00:01',0.00000,0,1.00000,'8xbJv9wZmjA','Administrator','Admin','Your Company','ADDRESS','','','','',88,'','','your@email.com','',1,139,1,0,'',-1,194,0,0,0.00000,0,'0',0,0,0,'','0000-00-00 00:00:00','','2016-07-26 11:26:24','2046-07-25 11:26:24',60000,0.00000,0,0,'1',0,0,0,0,'1000-01-01 00:00:00',0,0,1,0,'','',NULL),(2,'4727985745',0,1,0,0,'',1,0,2,'2016-07-25 11:26:24',0.00000,0,0.00000,'dOxAtqeO7E6A-wGlILTl-RLbYiySAwss','default','customer','ASTPP','adress','','','','',88,'','','yourcustomer@test.com','',0,59,1,0,'',0,49,0,0,0.00000,1,'',0,1,0,'','0000-00-00 00:00:00','4727985745','2016-07-26 11:26:24','2046-07-25 11:26:24',3652,0.00000,0,0,'1',0,0,0,4,'1000-01-01 00:00:00',0,0,1,0,'','',''),(3,'3673942894',0,1,0,0,'',1,0,2,'2016-07-26 15:15:20',0.00000,0,0.00000,'lzq1UjaoM44Ed2D07iQY8RLbYiySAwss','default','provider','ASTPP','adress','','','','',88,'','','yourprovider@test.com','',0,59,0,0,'',3,49,0,0,0.00000,0,'',0,1,0,'','0000-00-00 00:00:00','320736','0000-00-00 00:00:00','2026-07-26 15:12:18',0,0.00000,0,0,'',0,0,0,0,'1000-01-01 00:00:00',0,0,1,0,'','','');
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_callerid`
--

DROP TABLE IF EXISTS `accounts_callerid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_callerid` (
  `id` int NOT NULL AUTO_INCREMENT,
  `accountid` int NOT NULL DEFAULT '0',
  `callerid_name` varchar(30) NOT NULL DEFAULT '',
  `callerid_number` varchar(20) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 active 1 inactive',
  PRIMARY KEY (`id`),
  KEY `accountid` (`accountid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_callerid`
--

LOCK TABLES `accounts_callerid` WRITE;
/*!40000 ALTER TABLE `accounts_callerid` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_callerid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_cdr_summary`
--

DROP TABLE IF EXISTS `accounts_cdr_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_cdr_summary` (
  `date_hour` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `country_id` int NOT NULL,
  `account_entity_id` int NOT NULL,
  `account_id` int NOT NULL,
  `reseller_id` int NOT NULL,
  `total_calls` int NOT NULL,
  `answered_calls` smallint NOT NULL,
  `minutes` smallint NOT NULL,
  `debit` decimal(20,5) NOT NULL,
  `cost` decimal(20,5) NOT NULL,
  `acd` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`date_hour`,`country_id`,`account_id`,`reseller_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_cdr_summary`
--

LOCK TABLES `accounts_cdr_summary` WRITE;
/*!40000 ALTER TABLE `accounts_cdr_summary` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_cdr_summary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activity_reports`
--

DROP TABLE IF EXISTS `activity_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity_reports` (
  `id` int NOT NULL AUTO_INCREMENT,
  `accountid` int NOT NULL,
  `reseller_id` int NOT NULL DEFAULT '1',
  `last_did_call_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_outbound_call_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `balance` varchar(40) NOT NULL,
  `credit_limit` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accountid` (`accountid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_reports`
--

LOCK TABLES `activity_reports` WRITE;
/*!40000 ALTER TABLE `activity_reports` DISABLE KEYS */;
/*!40000 ALTER TABLE `activity_reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons`
--

DROP TABLE IF EXISTS `addons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addons` (
  `id` int NOT NULL AUTO_INCREMENT,
  `package_name` varchar(30) NOT NULL,
  `version` varchar(10) NOT NULL,
  `installed_date` timestamp NULL DEFAULT NULL,
  `last_updated_date` timestamp NULL DEFAULT NULL,
  `files` blob NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons`
--

LOCK TABLES `addons` WRITE;
/*!40000 ALTER TABLE `addons` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ani_map`
--

DROP TABLE IF EXISTS `ani_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ani_map` (
  `id` int NOT NULL AUTO_INCREMENT,
  `number` varchar(20) NOT NULL DEFAULT '',
  `accountid` int NOT NULL DEFAULT '0',
  `reseller_id` int NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-Active,1-inactive',
  `context` varchar(20) NOT NULL DEFAULT '',
  `creation_date` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `last_modified_date` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `number` (`number`),
  KEY `account` (`accountid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ani_map`
--

LOCK TABLES `ani_map` WRITE;
/*!40000 ALTER TABLE `ani_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `ani_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `backup_database`
--

DROP TABLE IF EXISTS `backup_database`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `backup_database` (
  `id` int NOT NULL AUTO_INCREMENT,
  `backup_name` varchar(100) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `path` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backup_database`
--

LOCK TABLES `backup_database` WRITE;
/*!40000 ALTER TABLE `backup_database` DISABLE KEYS */;
/*!40000 ALTER TABLE `backup_database` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `block_patterns`
--

DROP TABLE IF EXISTS `block_patterns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `block_patterns` (
  `id` int NOT NULL AUTO_INCREMENT,
  `accountid` int NOT NULL DEFAULT '0',
  `blocked_patterns` varchar(15) NOT NULL DEFAULT '',
  `destination` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `accountid` (`accountid`),
  KEY `blocked_patterns` (`blocked_patterns`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `block_patterns`
--

LOCK TABLES `block_patterns` WRITE;
/*!40000 ALTER TABLE `block_patterns` DISABLE KEYS */;
/*!40000 ALTER TABLE `block_patterns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `call_barring`
--

DROP TABLE IF EXISTS `call_barring`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `call_barring` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `number` varchar(100) NOT NULL,
  `number_type` tinyint(1) DEFAULT '0',
  `type` tinyint(1) DEFAULT '0' COMMENT '0 Black List 1 White List',
  `destination` tinyint(1) DEFAULT '0',
  `action_type` tinyint(1) DEFAULT '0' COMMENT '0 Allow 1 Reject',
  `status` tinyint(1) DEFAULT '0' COMMENT '0 active 1 inactive',
  `creation_date` datetime DEFAULT '1000-01-01 00:00:00',
  `modified_date` datetime DEFAULT '1000-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `call_barring`
--

LOCK TABLES `call_barring` WRITE;
/*!40000 ALTER TABLE `call_barring` DISABLE KEYS */;
/*!40000 ALTER TABLE `call_barring` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calltype`
--

DROP TABLE IF EXISTS `calltype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `calltype` (
  `id` int NOT NULL AUTO_INCREMENT,
  `call_type` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 for active,1 for inactive,2 for delete',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calltype`
--

LOCK TABLES `calltype` WRITE;
/*!40000 ALTER TABLE `calltype` DISABLE KEYS */;
/*!40000 ALTER TABLE `calltype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `card_details`
--

DROP TABLE IF EXISTS `card_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `card_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `accountid` int NOT NULL,
  `reseller_id` int NOT NULL DEFAULT '0',
  `product_id` int NOT NULL DEFAULT '0',
  `cust_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `src_id` varchar(100) NOT NULL,
  `username` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `card_num` int NOT NULL,
  `card_brand` varchar(50) NOT NULL,
  `card_exp_month` int NOT NULL,
  `card_exp_year` int NOT NULL,
  `item_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `item_description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `item_price` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `item_price_currency` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `paid_amount` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `paid_amount_currency` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `txn_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `payment_status` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `payment_gateway` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `card_details`
--

LOCK TABLES `card_details` WRITE;
/*!40000 ALTER TABLE `card_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `card_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `code` varchar(50) NOT NULL,
  `description` varchar(200) NOT NULL,
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '0 active 1 inactive',
  `creation_date` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Package','PACKAGE','Package',0,'0000-00-00 00:00:00'),(2,'Subscription','SUBSCRIPTION','Subscription',0,'0000-00-00 00:00:00'),(3,'Refill','REFILL','Rfill',0,'0000-00-00 00:00:00'),(4,'DID','DID','DIDs',0,'0000-00-00 00:00:00');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdrs`
--

DROP TABLE IF EXISTS `cdrs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cdrs` (
  `uniqueid` varchar(60) NOT NULL DEFAULT '',
  `accountid` int DEFAULT '0',
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `sip_user` varchar(20) NOT NULL DEFAULT '',
  `callerid` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `callednum` varchar(30) NOT NULL DEFAULT '',
  `translated_dst` varchar(30) NOT NULL,
  `ct` int NOT NULL DEFAULT '0',
  `billseconds` smallint NOT NULL DEFAULT '0',
  `trunk_id` smallint NOT NULL DEFAULT '0',
  `trunkip` varchar(15) NOT NULL DEFAULT '',
  `callerip` varchar(15) NOT NULL DEFAULT '',
  `disposition` varchar(45) NOT NULL DEFAULT '',
  `callstart` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `debit` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `cost` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `provider_id` int NOT NULL DEFAULT '0',
  `pricelist_id` smallint NOT NULL DEFAULT '0',
  `package_id` int NOT NULL DEFAULT '0',
  `pattern` varchar(20) NOT NULL,
  `notes` varchar(80) NOT NULL,
  `invoiceid` int NOT NULL DEFAULT '0',
  `rate_cost` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `reseller_id` int NOT NULL DEFAULT '0',
  `reseller_code` varchar(20) NOT NULL,
  `reseller_code_destination` varchar(80) DEFAULT NULL,
  `reseller_cost` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `provider_code` varchar(20) NOT NULL,
  `provider_code_destination` varchar(80) NOT NULL,
  `provider_cost` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `provider_call_cost` decimal(20,6) NOT NULL,
  `call_direction` enum('outbound','inbound') NOT NULL,
  `calltype` enum('STANDARD','DID','FREE','CALLINGCARD','FAX','LOCAL') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'STANDARD',
  `billmsec` int NOT NULL DEFAULT '0',
  `answermsec` int NOT NULL DEFAULT '0',
  `waitmsec` int NOT NULL DEFAULT '0',
  `progress_mediamsec` int NOT NULL DEFAULT '0',
  `flow_billmsec` int NOT NULL DEFAULT '0',
  `is_recording` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 for On,1 for Off',
  `call_request` tinyint NOT NULL DEFAULT '0',
  `country_id` int NOT NULL DEFAULT '0',
  `end_stamp` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  KEY `cdr_index` (`callstart`,`reseller_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='cdrs';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdrs`
--

LOCK TABLES `cdrs` WRITE;
/*!40000 ALTER TABLE `cdrs` DISABLE KEYS */;
/*!40000 ALTER TABLE `cdrs` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`astppuser`@`localhost`*/ /*!50003 TRIGGER `cdr_records` AFTER INSERT ON `cdrs` FOR EACH ROW BEGIN
   INSERT INTO `cdrs_staging` (`uniqueid`, `accountid`, `type`, `sip_user`, `callerid`, `callednum`, `translated_dst`, `ct`, `billseconds`, `trunk_id`, `trunkip`, `callerip`, `disposition`, `callstart`, `debit`, `cost`, `provider_id`, `pricelist_id`, `package_id`, `pattern`, `notes`, `invoiceid`, `rate_cost`, `reseller_id`, `reseller_code`, `reseller_code_destination`, `reseller_cost`, `provider_code`, `provider_code_destination`, `provider_cost`, `provider_call_cost`, `call_direction`, `calltype`, `billmsec`, `answermsec`, `waitmsec`, `progress_mediamsec`, `flow_billmsec`, `is_recording`, `call_request`, `country_id`,`end_stamp`) VALUES (NEW.uniqueid, NEW.accountid, NEW.type, NEW.sip_user, NEW.callerid, NEW.callednum, NEW.translated_dst, NEW.ct, NEW.billseconds, NEW.trunk_id, NEW.trunkip, NEW.callerip, NEW.disposition, NEW.callstart, NEW.debit, NEW.cost, NEW.provider_id, NEW.pricelist_id, NEW.package_id, NEW.pattern, NEW.notes, NEW.invoiceid, NEW.rate_cost, NEW.reseller_id, NEW.reseller_code, NEW.reseller_code_destination, NEW.reseller_cost, NEW.provider_code, NEW.provider_code_destination, NEW.provider_cost, NEW.provider_call_cost, NEW.call_direction, NEW.calltype, NEW.billmsec, NEW.answermsec, NEW.waitmsec, NEW.progress_mediamsec, NEW.flow_billmsec, NEW.is_recording, NEW.call_request, NEW.country_id,NEW.end_stamp);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`astppuser`@`localhost`*/ /*!50003 TRIGGER `activity_reports` AFTER INSERT ON `cdrs` FOR EACH ROW BEGIN
IF (NEW.calltype = 'DID' AND NEW.call_direction = 'outbound') THEN
	INSERT INTO `activity_reports` (accountid,reseller_id,last_did_call_time,balance,credit_limit) VALUES (NEW.accountid, NEW.reseller_id, NEW.callstart,(SELECT balance from accounts where id=NEW.accountid),(SELECT credit_limit from accounts where id=NEW.accountid)) ON DUPLICATE KEY UPDATE `last_did_call_time`=NEW.callstart,`balance`=VALUES(balance),`credit_limit`=VALUES(credit_limit);
ELSEIF (NEW.calltype = 'STANDARD') THEN
    INSERT INTO `activity_reports` (accountid, reseller_id,last_outbound_call_time,balance,credit_limit) VALUES (NEW.accountid, NEW.reseller_id, NEW.callstart,(SELECT balance from accounts where id=NEW.accountid),(SELECT credit_limit from accounts where id=NEW.accountid)) ON DUPLICATE KEY UPDATE `last_outbound_call_time`=NEW.callstart,`balance`=VALUES(balance),`credit_limit`=VALUES(credit_limit);
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `cdrs_day_by_summary`
--

DROP TABLE IF EXISTS `cdrs_day_by_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cdrs_day_by_summary` (
  `id` int NOT NULL AUTO_INCREMENT,
  `account_id` int NOT NULL,
  `reseller_id` int NOT NULL,
  `type` tinyint NOT NULL,
  `country_id` int NOT NULL,
  `billseconds` int NOT NULL,
  `mcd` int NOT NULL,
  `total_calls` int NOT NULL,
  `debit` decimal(10,5) NOT NULL,
  `cost` decimal(10,5) NOT NULL,
  `total_answered_call` int NOT NULL,
  `total_fail_call` int NOT NULL,
  `unique_date` varchar(50) NOT NULL DEFAULT '00000000',
  `calldate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_index` (`account_id`,`reseller_id`,`country_id`,`unique_date`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdrs_day_by_summary`
--

LOCK TABLES `cdrs_day_by_summary` WRITE;
/*!40000 ALTER TABLE `cdrs_day_by_summary` DISABLE KEYS */;
/*!40000 ALTER TABLE `cdrs_day_by_summary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdrs_staging`
--

DROP TABLE IF EXISTS `cdrs_staging`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cdrs_staging` (
  `uniqueid` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `accountid` int DEFAULT '0',
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `sip_user` varchar(20) NOT NULL DEFAULT '',
  `callerid` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `callednum` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `translated_dst` varchar(30) NOT NULL,
  `ct` int NOT NULL DEFAULT '0',
  `billseconds` smallint NOT NULL DEFAULT '0',
  `trunk_id` smallint NOT NULL DEFAULT '0',
  `trunkip` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `callerip` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `disposition` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `callstart` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `debit` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `cost` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `provider_id` int NOT NULL DEFAULT '0',
  `pricelist_id` smallint NOT NULL DEFAULT '0',
  `package_id` int NOT NULL DEFAULT '0',
  `pattern` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `notes` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `invoiceid` int NOT NULL DEFAULT '0',
  `rate_cost` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `reseller_id` int NOT NULL DEFAULT '0',
  `reseller_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `reseller_code_destination` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `reseller_cost` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `provider_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `provider_code_destination` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `provider_cost` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `provider_call_cost` decimal(20,6) NOT NULL,
  `call_direction` enum('outbound','inbound') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `calltype` enum('STANDARD','DID','FREE','CALLINGCARD','FAX') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'STANDARD',
  `billmsec` int NOT NULL DEFAULT '0',
  `answermsec` int NOT NULL DEFAULT '0',
  `waitmsec` int NOT NULL DEFAULT '0',
  `progress_mediamsec` int NOT NULL DEFAULT '0',
  `flow_billmsec` int NOT NULL DEFAULT '0',
  `is_recording` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 for On,1 for Off',
  `call_request` tinyint NOT NULL DEFAULT '0',
  `country_id` int NOT NULL DEFAULT '0',
  `end_stamp` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdrs_staging`
--

LOCK TABLES `cdrs_staging` WRITE;
/*!40000 ALTER TABLE `cdrs_staging` DISABLE KEYS */;
/*!40000 ALTER TABLE `cdrs_staging` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ci_sessions`
--

DROP TABLE IF EXISTS `ci_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ci_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(16) NOT NULL DEFAULT '0',
  `user_agent` varchar(150) NOT NULL,
  `last_activity` int unsigned NOT NULL DEFAULT '0',
  `user_data` text NOT NULL,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ci_sessions`
--

LOCK TABLES `ci_sessions` WRITE;
/*!40000 ALTER TABLE `ci_sessions` DISABLE KEYS */;
INSERT INTO `ci_sessions` VALUES ('635f90d9f25b18cc463a3f99702b272d','::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36',1620805555,'a:19:{s:9:\"user_data\";s:0:\"\";s:13:\"user_language\";s:5:\"en_En\";s:9:\"user_logo\";s:8:\"logo.png\";s:11:\"user_header\";s:31:\"iNextrix Technologies Pvt. Ltd.\";s:11:\"user_footer\";s:31:\"iNextrix Technologies Pvt. Ltd.\";s:12:\"user_favicon\";s:11:\"favicon.ico\";s:10:\"user_login\";b:1;s:9:\"user_name\";s:5:\"admin\";s:9:\"logintype\";i:2;s:19:\"userlevel_logintype\";s:2:\"-1\";s:8:\"username\";s:5:\"admin\";s:11:\"accountinfo\";a:65:{s:2:\"id\";s:1:\"1\";s:6:\"number\";s:5:\"admin\";s:11:\"reseller_id\";s:1:\"0\";s:12:\"pricelist_id\";s:1:\"0\";s:8:\"cli_pool\";s:1:\"0\";s:17:\"paypal_permission\";s:1:\"0\";s:9:\"reference\";s:0:\"\";s:20:\"non_cli_pricelist_id\";s:1:\"0\";s:6:\"status\";s:1:\"0\";s:8:\"sweep_id\";s:1:\"2\";s:8:\"creation\";s:19:\"2016-07-25 00:00:01\";s:12:\"credit_limit\";s:7:\"0.00000\";s:14:\"posttoexternal\";s:1:\"0\";s:7:\"balance\";s:7:\"1.00000\";s:8:\"password\";s:11:\"8xbJv9wZmjA\";s:10:\"first_name\";s:13:\"Administrator\";s:9:\"last_name\";s:5:\"Admin\";s:12:\"company_name\";s:12:\"Your Company\";s:9:\"address_1\";s:7:\"ADDRESS\";s:9:\"address_2\";s:0:\"\";s:11:\"postal_code\";s:0:\"\";s:8:\"province\";s:0:\"\";s:4:\"city\";s:0:\"\";s:10:\"country_id\";s:2:\"85\";s:11:\"telephone_1\";s:0:\"\";s:11:\"telephone_2\";s:0:\"\";s:5:\"email\";s:14:\"your@email.com\";s:18:\"notification_email\";s:0:\"\";s:11:\"language_id\";s:1:\"1\";s:11:\"currency_id\";s:3:\"139\";s:11:\"maxchannels\";s:1:\"1\";s:3:\"cps\";s:1:\"0\";s:13:\"dialed_modify\";s:0:\"\";s:4:\"type\";s:2:\"-1\";s:11:\"timezone_id\";s:2:\"27\";s:5:\"inuse\";s:1:\"0\";s:7:\"deleted\";s:1:\"0\";s:19:\"notify_credit_limit\";s:7:\"0.00000\";s:11:\"notify_flag\";s:1:\"0\";s:12:\"notify_email\";s:1:\"0\";s:15:\"commission_rate\";s:1:\"0\";s:11:\"invoice_day\";s:1:\"0\";s:16:\"invoice_interval\";s:1:\"0\";s:12:\"invoice_note\";s:0:\"\";s:14:\"last_bill_date\";s:19:\"0000-00-00 00:00:00\";s:3:\"pin\";s:0:\"\";s:10:\"first_used\";s:19:\"2016-07-26 11:26:24\";s:6:\"expiry\";s:19:\"2046-07-25 11:26:24\";s:12:\"validfordays\";s:5:\"60000\";s:15:\"local_call_cost\";s:7:\"0.00000\";s:16:\"pass_link_status\";s:1:\"0\";s:10:\"local_call\";s:1:\"0\";s:14:\"charge_per_min\";s:1:\"1\";s:12:\"is_recording\";s:1:\"0\";s:17:\"loss_less_routing\";s:1:\"0\";s:19:\"allow_ip_management\";s:1:\"0\";s:13:\"permission_id\";s:1:\"0\";s:12:\"deleted_date\";s:19:\"1000-01-01 00:00:00\";s:15:\"localization_id\";s:1:\"0\";s:13:\"notifications\";s:1:\"0\";s:14:\"is_distributor\";s:1:\"1\";s:16:\"generate_invoice\";s:1:\"0\";s:19:\"std_cid_translation\";s:0:\"\";s:19:\"did_cid_translation\";s:0:\"\";s:10:\"tax_number\";N;}s:14:\"permissioninfo\";a:1:{s:10:\"login_type\";s:2:\"-1\";}s:5:\"token\";a:66:{s:2:\"id\";s:1:\"1\";s:6:\"number\";s:5:\"admin\";s:11:\"reseller_id\";s:1:\"0\";s:12:\"pricelist_id\";s:1:\"0\";s:8:\"cli_pool\";s:1:\"0\";s:17:\"paypal_permission\";s:1:\"0\";s:9:\"reference\";s:0:\"\";s:20:\"non_cli_pricelist_id\";s:1:\"0\";s:6:\"status\";s:1:\"0\";s:8:\"sweep_id\";s:1:\"2\";s:8:\"creation\";s:19:\"2016-07-25 00:00:01\";s:12:\"credit_limit\";s:7:\"0.00000\";s:14:\"posttoexternal\";s:1:\"0\";s:7:\"balance\";s:7:\"1.00000\";s:8:\"password\";s:11:\"8xbJv9wZmjA\";s:10:\"first_name\";s:13:\"Administrator\";s:9:\"last_name\";s:5:\"Admin\";s:12:\"company_name\";s:12:\"Your Company\";s:9:\"address_1\";s:7:\"ADDRESS\";s:9:\"address_2\";s:0:\"\";s:11:\"postal_code\";s:0:\"\";s:8:\"province\";s:0:\"\";s:4:\"city\";s:0:\"\";s:10:\"country_id\";s:2:\"85\";s:11:\"telephone_1\";s:0:\"\";s:11:\"telephone_2\";s:0:\"\";s:5:\"email\";s:14:\"your@email.com\";s:18:\"notification_email\";s:0:\"\";s:11:\"language_id\";s:1:\"1\";s:11:\"currency_id\";s:3:\"139\";s:11:\"maxchannels\";s:1:\"1\";s:3:\"cps\";s:1:\"0\";s:13:\"dialed_modify\";s:0:\"\";s:4:\"type\";s:2:\"-1\";s:11:\"timezone_id\";s:2:\"27\";s:5:\"inuse\";s:1:\"0\";s:7:\"deleted\";s:1:\"0\";s:19:\"notify_credit_limit\";s:7:\"0.00000\";s:11:\"notify_flag\";s:1:\"0\";s:12:\"notify_email\";s:1:\"0\";s:15:\"commission_rate\";s:1:\"0\";s:11:\"invoice_day\";s:1:\"0\";s:16:\"invoice_interval\";s:1:\"0\";s:12:\"invoice_note\";s:0:\"\";s:14:\"last_bill_date\";s:19:\"0000-00-00 00:00:00\";s:3:\"pin\";s:0:\"\";s:10:\"first_used\";s:19:\"2016-07-26 11:26:24\";s:6:\"expiry\";s:19:\"2046-07-25 11:26:24\";s:12:\"validfordays\";s:5:\"60000\";s:15:\"local_call_cost\";s:7:\"0.00000\";s:16:\"pass_link_status\";s:1:\"0\";s:10:\"local_call\";s:1:\"0\";s:14:\"charge_per_min\";s:1:\"1\";s:12:\"is_recording\";s:1:\"0\";s:17:\"loss_less_routing\";s:1:\"0\";s:19:\"allow_ip_management\";s:1:\"0\";s:13:\"permission_id\";s:1:\"0\";s:12:\"deleted_date\";s:19:\"1000-01-01 00:00:00\";s:15:\"localization_id\";s:1:\"0\";s:13:\"notifications\";s:1:\"0\";s:14:\"is_distributor\";s:1:\"1\";s:16:\"generate_invoice\";s:1:\"0\";s:19:\"std_cid_translation\";s:0:\"\";s:19:\"did_cid_translation\";s:0:\"\";s:10:\"tax_number\";N;s:5:\"token\";s:32:\"VnFsYVUrS0xaYTdaSzJ0bG94UXozdz09\";}s:16:\"ipsettings_token\";s:128:\"M1RtT2d4a21XMkU5V1dDZkRXN1F1blhSTEdXVnRzQU5LVWNLVjNTZjdMRk93eDQ4V0VuWDVCdjM0NGk5aEFraXFSYmd6ejBEeVAwQzRpU2NXOFVoRWE1SU5VczJGUWRQ\";s:16:\"permited_modules\";s:1171:\"a:56:{i:0;s:8:\"customer\";i:1;s:12:\"fssipdevices\";i:2;s:5:\"ipmap\";i:3;s:8:\"reseller\";i:4;s:6:\"animap\";i:5;s:5:\"admin\";i:6;s:11:\"permissions\";i:7;s:7:\"invoice\";i:8;s:12:\"refillreport\";i:9;s:7:\"charges\";i:10;s:3:\"did\";i:11;s:12:\"accessnumber\";i:12;s:3:\"did\";i:13;s:5:\"price\";i:14;s:11:\"origination\";i:15;s:8:\"ratedeck\";i:16;s:9:\"fsgateway\";i:17;s:5:\"trunk\";i:18;s:11:\"termination\";i:19;s:8:\"calltype\";i:20;s:8:\"products\";i:21;s:6:\"orders\";i:22;s:6:\"refill\";i:23;s:5:\"email\";i:24;s:12:\"fssipprofile\";i:25;s:8:\"fsserver\";i:26;s:12:\"localization\";i:27;s:11:\"callbarring\";i:28;s:6:\"addons\";i:29;s:14:\"customerReport\";i:30;s:14:\"resellerReport\";i:31;s:14:\"providerReport\";i:32;s:8:\"customer\";i:33;s:8:\"reseller\";i:34;s:8:\"provider\";i:35;s:14:\"activityReport\";i:36;s:12:\"notification\";i:37;s:5:\"audit\";i:38;s:7:\"product\";i:39;s:10:\"commission\";i:40;s:8:\"livecall\";i:41;s:3:\"low\";i:42;s:13:\"configuration\";i:43;s:7:\"invoice\";i:44;s:8:\"opensips\";i:45;s:5:\"taxes\";i:46;s:10:\"dispatcher\";i:47;s:8:\"template\";i:48;s:7:\"country\";i:49;s:8:\"currency\";i:50;s:8:\"database\";i:51;s:8:\"timezone\";i:52;s:12:\"cronsettings\";i:53;s:13:\"configuration\";i:54;s:9:\"languages\";i:55;s:11:\"translation\";}\";s:8:\"menuinfo\";s:9398:\"a:10:{s:8:\"Accounts\";a:2:{s:9:\"Customers\";a:4:{i:0;a:4:{s:10:\"menu_label\";s:9:\"Customers\";s:10:\"module_url\";s:23:\"accounts/customer_list/\";s:6:\"module\";s:8:\"accounts\";s:10:\"menu_image\";s:16:\"ListAccounts.png\";}i:1;a:4:{s:10:\"menu_label\";s:11:\"SIP Devices\";s:10:\"module_url\";s:24:\"freeswitch/fssipdevices/\";s:6:\"module\";s:12:\"fssipdevices\";s:10:\"menu_image\";s:11:\"Devices.png\";}i:2;a:4:{s:10:\"menu_label\";s:11:\"IP Settings\";s:10:\"module_url\";s:19:\"ipmap/ipmap_detail/\";s:6:\"module\";s:5:\"ipmap\";s:10:\"menu_image\";s:11:\"Gateway.png\";}i:3;a:4:{s:10:\"menu_label\";s:10:\"Caller IDs\";s:10:\"module_url\";s:21:\"animap/animap_detail/\";s:6:\"module\";s:6:\"animap\";s:10:\"menu_image\";s:11:\"Gateway.png\";}}i:0;a:3:{i:0;a:4:{s:10:\"menu_label\";s:9:\"Resellers\";s:10:\"module_url\";s:23:\"accounts/reseller_list/\";s:6:\"module\";s:8:\"reseller\";s:10:\"menu_image\";s:12:\"reseller.png\";}i:1;a:4:{s:10:\"menu_label\";s:6:\"Admins\";s:10:\"module_url\";s:20:\"accounts/admin_list/\";s:6:\"module\";s:5:\"admin\";s:10:\"menu_image\";s:16:\"ListAccounts.png\";}i:2;a:4:{s:10:\"menu_label\";s:18:\"Roles & Permission\";s:10:\"module_url\";s:29:\"permissions/permissions_list/\";s:6:\"module\";s:11:\"permissions\";s:10:\"menu_image\";s:8:\"Home.png\";}}}s:7:\"Billing\";a:1:{i:0;a:4:{i:0;a:4:{s:10:\"menu_label\";s:8:\"Invoices\";s:10:\"module_url\";s:22:\"invoices/invoice_list/\";s:6:\"module\";s:7:\"invoice\";s:10:\"menu_image\";s:15:\"InvoiceList.png\";}i:1;a:4:{s:10:\"menu_label\";s:13:\"Refill Report\";s:10:\"module_url\";s:21:\"reports/refillreport/\";s:6:\"module\";s:12:\"refillreport\";s:10:\"menu_image\";s:17:\"PaymentReport.png\";}i:2;a:4:{s:10:\"menu_label\";s:15:\"Charges History\";s:10:\"module_url\";s:24:\"reports/charges_history/\";s:6:\"module\";s:7:\"charges\";s:10:\"menu_image\";s:17:\"PaymentReport.png\";}i:3;a:4:{s:10:\"menu_label\";s:17:\"Commission Report\";s:10:\"module_url\";s:31:\"reports/commission_report_list/\";s:6:\"module\";s:10:\"commission\";s:10:\"menu_image\";s:1:\"0\";}}}s:7:\"Inbound\";a:1:{i:0;a:3:{i:0;a:4:{s:10:\"menu_label\";s:4:\"DIDs\";s:10:\"module_url\";s:13:\"did/did_list/\";s:6:\"module\";s:3:\"did\";s:10:\"menu_image\";s:14:\"ManageDIDs.png\";}i:1;a:4:{s:10:\"menu_label\";s:14:\"Access Numbers\";s:10:\"module_url\";s:31:\"accessnumber/accessnumber_list/\";s:6:\"module\";s:12:\"accessnumber\";s:10:\"menu_image\";s:8:\"Home.png\";}i:2;a:4:{s:10:\"menu_label\";s:15:\"Bulk DID Assign\";s:10:\"module_url\";s:31:\"did_purchase/did_purchase_list/\";s:6:\"module\";s:12:\"did_purchase\";s:10:\"menu_image\";s:8:\"Home.png\";}}}s:6:\"Tariff\";a:1:{i:0;a:4:{i:0;a:4:{s:10:\"menu_label\";s:11:\"Rate Groups\";s:10:\"module_url\";s:19:\"pricing/price_list/\";s:6:\"module\";s:5:\"price\";s:10:\"menu_image\";s:13:\"pricelist.png\";}i:1;a:4:{s:10:\"menu_label\";s:17:\"Origination Rates\";s:10:\"module_url\";s:29:\"rates/origination_rates_list/\";s:6:\"module\";s:11:\"origination\";s:10:\"menu_image\";s:10:\"Routes.png\";}i:2;a:4:{s:10:\"menu_label\";s:8:\"Ratedeck\";s:10:\"module_url\";s:23:\"ratedeck/ratedeck_list/\";s:6:\"module\";s:8:\"ratedeck\";s:10:\"menu_image\";s:10:\"Routes.png\";}i:3;a:4:{s:10:\"menu_label\";s:10:\"Call Types\";s:10:\"module_url\";s:23:\"calltype/calltype_list/\";s:6:\"module\";s:8:\"calltype\";s:10:\"menu_image\";s:12:\"packages.png\";}}}s:8:\"Carriers\";a:1:{i:0;a:3:{i:0;a:4:{s:10:\"menu_label\";s:8:\"Gateways\";s:10:\"module_url\";s:21:\"freeswitch/fsgateway/\";s:6:\"module\";s:9:\"fsgateway\";s:10:\"menu_image\";s:11:\"Gateway.png\";}i:1;a:4:{s:10:\"menu_label\";s:6:\"Trunks\";s:10:\"module_url\";s:17:\"trunk/trunk_list/\";s:6:\"module\";s:5:\"trunk\";s:10:\"menu_image\";s:10:\"Trunks.png\";}i:2;a:4:{s:10:\"menu_label\";s:17:\"Termination Rates\";s:10:\"module_url\";s:29:\"rates/termination_rates_list/\";s:6:\"module\";s:11:\"termination\";s:10:\"menu_image\";s:18:\"OutboundRoutes.png\";}}}s:8:\"Services\";a:1:{i:0;a:4:{i:0;a:4:{s:10:\"menu_label\";s:8:\"Products\";s:10:\"module_url\";s:23:\"products/products_list/\";s:6:\"module\";s:8:\"products\";s:10:\"menu_image\";s:10:\"Routes.png\";}i:1;a:4:{s:10:\"menu_label\";s:6:\"Orders\";s:10:\"module_url\";s:19:\"orders/orders_list/\";s:6:\"module\";s:6:\"orders\";s:10:\"menu_image\";s:10:\"Routes.png\";}i:2;a:4:{s:10:\"menu_label\";s:14:\"Refill Coupons\";s:10:\"module_url\";s:33:\"refill_coupon/refill_coupon_list/\";s:6:\"module\";s:6:\"refill\";s:10:\"menu_image\";s:7:\"cdr.png\";}i:3;a:4:{s:10:\"menu_label\";s:10:\"Mass Email\";s:10:\"module_url\";s:17:\"email/email_mass/\";s:6:\"module\";s:5:\"email\";s:10:\"menu_image\";s:9:\"email.jpg\";}}}s:6:\"Switch\";a:1:{i:0;a:6:{i:0;a:4:{s:10:\"menu_label\";s:12:\"SIP Profiles\";s:10:\"module_url\";s:24:\"freeswitch/fssipprofile/\";s:6:\"module\";s:12:\"fssipprofile\";s:10:\"menu_image\";s:15:\"SipProfiles.png\";}i:1;a:4:{s:10:\"menu_label\";s:18:\"FreeSwitch Servers\";s:10:\"module_url\";s:25:\"freeswitch/fsserver_list/\";s:6:\"module\";s:8:\"fsserver\";s:10:\"menu_image\";s:14:\"freeswitch.png\";}i:2;a:4:{s:10:\"menu_label\";s:13:\"Localizations\";s:10:\"module_url\";s:31:\"localization/localization_list/\";s:6:\"module\";s:12:\"localization\";s:10:\"menu_image\";s:8:\"Home.png\";}i:3;a:4:{s:10:\"menu_label\";s:12:\"Call Barring\";s:10:\"module_url\";s:29:\"callbarring/callbarring_list/\";s:6:\"module\";s:11:\"callbarring\";s:10:\"menu_image\";s:8:\"Home.png\";}i:4;a:4:{s:10:\"menu_label\";s:16:\"Opensips devices\";s:10:\"module_url\";s:23:\"opensips/opensips_list/\";s:6:\"module\";s:8:\"opensips\";s:10:\"menu_image\";s:18:\"OpensipDevices.png\";}i:5;a:4:{s:10:\"menu_label\";s:15:\"Dispatcher list\";s:10:\"module_url\";s:25:\"opensips/dispatcher_list/\";s:6:\"module\";s:10:\"dispatcher\";s:10:\"menu_image\";s:14:\"Dispatcher.png\";}}}s:0:\"\";a:1:{i:0;a:1:{i:0;a:4:{s:10:\"menu_label\";s:0:\"\";s:10:\"module_url\";s:19:\"addons/addons_list/\";s:6:\"module\";s:6:\"addons\";s:10:\"menu_image\";s:8:\"Home.png\";}}}s:7:\"Reports\";a:3:{s:19:\"Call Detail Reports\";a:3:{i:0;a:4:{s:10:\"menu_label\";s:8:\"Customer\";s:10:\"module_url\";s:23:\"reports/customerReport/\";s:6:\"module\";s:14:\"customerReport\";s:10:\"menu_image\";s:7:\"cdr.png\";}i:1;a:4:{s:10:\"menu_label\";s:8:\"Reseller\";s:10:\"module_url\";s:23:\"reports/resellerReport/\";s:6:\"module\";s:14:\"resellerReport\";s:10:\"menu_image\";s:7:\"cdr.png\";}i:2;a:4:{s:10:\"menu_label\";s:17:\"Provider Outbound\";s:10:\"module_url\";s:23:\"reports/providerReport/\";s:6:\"module\";s:14:\"providerReport\";s:10:\"menu_image\";s:7:\"cdr.png\";}}s:20:\"Call Summary Reports\";a:3:{i:0;a:4:{s:10:\"menu_label\";s:16:\"Customer Summary\";s:10:\"module_url\";s:17:\"summary/customer/\";s:6:\"module\";s:8:\"customer\";s:10:\"menu_image\";s:7:\"cdr.png\";}i:1;a:4:{s:10:\"menu_label\";s:16:\"Reseller Summary\";s:10:\"module_url\";s:17:\"summary/reseller/\";s:6:\"module\";s:8:\"reseller\";s:10:\"menu_image\";s:7:\"cdr.png\";}i:2;a:4:{s:10:\"menu_label\";s:16:\"Provider Summary\";s:10:\"module_url\";s:17:\"summary/provider/\";s:6:\"module\";s:8:\"provider\";s:10:\"menu_image\";s:7:\"cdr.png\";}}i:0;a:6:{i:0;a:4:{s:10:\"menu_label\";s:15:\"Activity Report\";s:10:\"module_url\";s:31:\"activity_report/activityReport/\";s:6:\"module\";s:15:\"activity_report\";s:10:\"menu_image\";s:8:\"Home.png\";}i:1;a:4:{s:10:\"menu_label\";s:13:\"Notifications\";s:10:\"module_url\";s:31:\"notification/notification_list/\";s:6:\"module\";s:12:\"notification\";s:10:\"menu_image\";s:16:\"ListAccounts.png\";}i:2;a:4:{s:10:\"menu_label\";s:9:\"Audit Log\";s:10:\"module_url\";s:17:\"audit/audit_list/\";s:6:\"module\";s:5:\"audit\";s:10:\"menu_image\";s:8:\"Home.png\";}i:3;a:4:{s:10:\"menu_label\";s:23:\"Product Summary Reports\";s:10:\"module_url\";s:16:\"summary/product/\";s:6:\"module\";s:7:\"product\";s:10:\"menu_image\";s:16:\"ListAccounts.png\";}i:4;a:4:{s:10:\"menu_label\";s:10:\"Live Calls\";s:10:\"module_url\";s:27:\"freeswitch/livecall_report/\";s:6:\"module\";s:8:\"livecall\";s:10:\"menu_image\";s:7:\"cdr.png\";}i:5;a:4:{s:10:\"menu_label\";s:11:\"Low Balance\";s:10:\"module_url\";s:29:\"low_balance/low_balance_list/\";s:6:\"module\";s:11:\"low_balance\";s:10:\"menu_image\";s:8:\"Home.png\";}}}s:13:\"Configuration\";a:2:{i:0;a:9:{i:0;a:4:{s:10:\"menu_label\";s:16:\"Company Profiles\";s:10:\"module_url\";s:27:\"invoices/invoice_conf_list/\";s:6:\"module\";s:7:\"invoice\";s:10:\"menu_image\";s:15:\"InvoiceConf.png\";}i:1;a:4:{s:10:\"menu_label\";s:5:\"Taxes\";s:10:\"module_url\";s:17:\"taxes/taxes_list/\";s:6:\"module\";s:5:\"taxes\";s:10:\"menu_image\";s:16:\"AccountTaxes.png\";}i:2;a:4:{s:10:\"menu_label\";s:9:\"Templates\";s:10:\"module_url\";s:17:\"systems/template/\";s:6:\"module\";s:8:\"template\";s:10:\"menu_image\";s:22:\"TemplateManagement.png\";}i:3;a:4:{s:10:\"menu_label\";s:9:\"Countries\";s:10:\"module_url\";s:21:\"systems/country_list/\";s:6:\"module\";s:7:\"country\";s:10:\"menu_image\";s:14:\"ManageDIDs.png\";}i:4;a:4:{s:10:\"menu_label\";s:10:\"Currencies\";s:10:\"module_url\";s:22:\"systems/currency_list/\";s:6:\"module\";s:8:\"currency\";s:10:\"menu_image\";s:14:\"ManageDIDs.png\";}i:5;a:4:{s:10:\"menu_label\";s:15:\"Database Backup\";s:10:\"module_url\";s:25:\"systems/database_restore/\";s:6:\"module\";s:8:\"database\";s:10:\"menu_image\";s:18:\"Configurations.png\";}i:6;a:4:{s:10:\"menu_label\";s:8:\"Timezone\";s:10:\"module_url\";s:22:\"systems/timezone_list/\";s:6:\"module\";s:7:\"systems\";s:10:\"menu_image\";s:8:\"Home.png\";}i:7;a:4:{s:10:\"menu_label\";s:5:\"Crons\";s:10:\"module_url\";s:31:\"cronsettings/cronsettings_list/\";s:6:\"module\";s:12:\"cronsettings\";s:10:\"menu_image\";s:18:\"Configurations.png\";}i:8;a:4:{s:10:\"menu_label\";s:8:\"Settings\";s:10:\"module_url\";s:28:\"systems/configuration/global\";s:6:\"module\";s:13:\"configuration\";s:10:\"menu_image\";s:18:\"Configurations.png\";}}s:9:\"Languages\";a:2:{i:0;a:4:{s:10:\"menu_label\";s:9:\"Languages\";s:10:\"module_url\";s:23:\"systems/languages_list/\";s:6:\"module\";s:9:\"languages\";s:10:\"menu_image\";s:18:\"Configurations.png\";}i:1;a:4:{s:10:\"menu_label\";s:12:\"Translations\";s:10:\"module_url\";s:25:\"systems/translation_list/\";s:6:\"module\";s:11:\"translation\";s:10:\"menu_image\";s:18:\"Configurations.png\";}}}}\";s:8:\"mode_cur\";s:5:\"admin\";s:14:\"advance_search\";i:0;}');
/*!40000 ALTER TABLE `ci_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cli_group`
--

DROP TABLE IF EXISTS `cli_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cli_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` char(20) NOT NULL DEFAULT '0',
  `description` varchar(100) NOT NULL,
  `reseller_id` int DEFAULT '0' COMMENT 'Accoun',
  `mapping_expired_by` char(5) NOT NULL,
  `mapping_expired_after` char(5) NOT NULL,
  `assignment_method` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `creation_date` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `last_access_date` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  PRIMARY KEY (`id`),
  KEY `reseller` (`reseller_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cli_group`
--

LOCK TABLES `cli_group` WRITE;
/*!40000 ALTER TABLE `cli_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `cli_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commission`
--

DROP TABLE IF EXISTS `commission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL DEFAULT '0',
  `order_id` int NOT NULL DEFAULT '0',
  `accountid` int NOT NULL,
  `reseller_id` int NOT NULL DEFAULT '0',
  `payment_id` int NOT NULL DEFAULT '0',
  `amount` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `commission` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `commission_rate` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `commission_status` varchar(10) NOT NULL,
  `notes` varchar(255) NOT NULL,
  `creation_date` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commission`
--

LOCK TABLES `commission` WRITE;
/*!40000 ALTER TABLE `commission` DISABLE KEYS */;
/*!40000 ALTER TABLE `commission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `counters`
--

DROP TABLE IF EXISTS `counters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `counters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL DEFAULT '0',
  `package_id` int NOT NULL DEFAULT '0',
  `accountid` int NOT NULL DEFAULT '0',
  `used_seconds` int NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `package_id` (`product_id`),
  KEY `accountid` (`accountid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `counters`
--

LOCK TABLES `counters` WRITE;
/*!40000 ALTER TABLE `counters` DISABLE KEYS */;
/*!40000 ALTER TABLE `counters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countrycode`
--

DROP TABLE IF EXISTS `countrycode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countrycode` (
  `id` int NOT NULL AUTO_INCREMENT,
  `currency_id` int NOT NULL,
  `iso` char(2) NOT NULL,
  `country` varchar(80) NOT NULL,
  `nicename` varchar(80) NOT NULL,
  `iso3` char(3) DEFAULT NULL,
  `countrycode` int NOT NULL,
  `vat` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `latitude` varchar(20) NOT NULL,
  `longitude` varchar(20) NOT NULL,
  `capital` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_key` (`iso`)
) ENGINE=InnoDB AUTO_INCREMENT=223 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countrycode`
--

LOCK TABLES `countrycode` WRITE;
/*!40000 ALTER TABLE `countrycode` DISABLE KEYS */;
INSERT INTO `countrycode` VALUES (1,9,'AF','AFGHANISTAN','Afghanistan','AFG',93,0.00000,'33.9391','67.7100','Kabul'),(2,9,'AL','ALBANIA','Albania','ALB',355,0.00000,'41.153332','  20.168331','Tirana'),(3,2,'DZ','ALGERIA','Algeria','DZA',213,0.00000,'28.0339','1.6596','Algiers'),(4,139,'AS','AMERICAN SAMOA','American Samoa','ASM',1684,0.00000,'-14.270972','-170.132217','Pago Pago'),(5,46,'AD','ANDORRA','Andorra','AND',376,0.00000,'  42.546245','1.601554','Andorra la Vella'),(6,13,'AO','ANGOLA','Angola','AGO',244,0.00000,'-11.202692','  17.873887','Luanda'),(7,39,'AI','ANGUILLA','Anguilla','AIA',1264,0.00000,'18.220554','  -63.068615','Valley'),(8,39,'AG','ANTIGUA & BARBUDA','Antigua_&_Barbuda','ATG',1268,0.00000,'17.060816','  -61.796428','Saint John\'s'),(9,4,'AR','ARGENTINA','Argentina','ARG',54,0.00000,'-38.416097','-63.616672','Buenos Aires'),(10,161,'AM','ARMENIA','Armenia','ARM',374,0.00000,'  40.069099','45.038189','Yerevan'),(11,5,'AW','ARUBA','Aruba','ABW',297,0.00000,'12.52111','  -69.968338','Oranjestad'),(12,6,'AU','AUSTRALIA','Australia','AUS',61,0.00000,'-25.274398','   133.775136','Canberra'),(13,46,'AT','AUSTRIA','Austria','AUT',43,20.00000,'47.516231','  14.550072','Vienna'),(14,163,'AZ','AZERBAIJAN','Azerbaijan','AZE',994,0.00000,'40.143105','47.576927','Baku'),(15,7,'BS','BAHAMAS','Bahamas','BHS',1242,0.00000,'25.03343','77.3963','Nassau'),(16,8,'BH','BAHRAIN','Bahrain','BHR',973,0.00000,'25.930414','50.637772','Manama'),(17,9,'BD','BANGLADESH','Bangladesh','BGD',880,0.00000,'23.684994','90.356331','Dhaka'),(18,164,'BB','BARBADOS','Barbados','BRB',1246,0.00000,'13.193887','-59.543198','Bridgetown'),(19,11,'BY','BELARUS','Belarus','BLR',375,0.00000,'53.709807','27.953389','Minsk'),(20,46,'BE','BELGIUM','Belgium','BEL',32,21.00000,'50.503887','4.469936','Brussels'),(21,12,'BZ','BELIZE','Belize','BLZ',501,0.00000,'17.189877','-88.49765','Belmopan'),(22,24,'BJ','BENIN','Benin','BEN',229,0.00000,'9.30769','2.315834','Porto-Novo'),(23,13,'BM','BERMUDA','Bermuda','BMU',1441,0.00000,'32.3078','64.7505','Hamilton'),(24,14,'BT','BHUTAN','Bhutan','BTN',975,0.00000,'27.514162','90.433601','Thimphu'),(25,15,'BO','BOLIVIA','Bolivia','BOL',591,0.00000,'-16.290154','-63.588653','La Paz'),(26,166,'BA','BOSNIA AND HERZEGOVINA','Bosnia_and_Herzegovina','BIH',387,0.00000,'43.915886','17.679076','Sarajevo'),(27,167,'BW','BOTSWANA','Botswana','BWA',267,0.00000,'-22.328474','24.684866','Gaborone'),(28,16,'BR','BRAZIL','Brazil','BRA',55,0.00000,'-14.235004','-51.92528','Brasilia'),(29,139,'VG','BRITISH VIRGIN ISLANDS','British Virgin Islands','VGB',1284,0.00000,'18.4207','64.6400','Road Town'),(30,18,'BN','BRUNEI','Brunei','BRN',673,0.00000,'4.535277','114.727669','Bandar Seri Begawan'),(31,19,'BG','BULGARIA','Bulgaria','BGR',359,20.00000,'42.733883','25.48583','Sofia'),(32,24,'BF','BURKINA FASO','Burkina_Faso','BFA',226,0.00000,'12.238333','-1.561593','Ouagadougou'),(33,20,'BI','BURUNDI','Burundi','BDI',257,0.00000,'-3.373056','29.918886','Bujumbura'),(34,21,'KH','CAMBODIA','Cambodia','KHM',855,0.00000,'12.5657','104.9910','Phnom Penh'),(35,25,'CM','CAMEROON','Cameroon','CMR',237,0.00000,'7.369722','12.354722','Yaounde'),(36,22,'CA','CANADA','Canada','CAN',1,0.00000,'56.130366','-106.346771','Ottawa'),(37,168,'CV','CAPE VERDE','Cape Verde','CPV',238,0.00000,'16.002082','-24.013197','Praia'),(38,23,'KY','CAYMAN ISLANDS','Cayman Islands','CYM',1345,0.00000,'19.513469','-80.566956','George Town'),(39,25,'CF','CENTRAL AFRICAN REPUBLIC','Central African Republic','CAF',236,0.00000,'6.611111','20.939444','Bangui'),(40,25,'TD','CHAD','Chad','TCD',235,0.00000,'15.4542',' 18.7322','N\'Djamena'),(41,26,'CL','CHILE','Chile','CHL',56,0.00000,'-35.675147','-71.542969','Santiago'),(42,27,'CN','CHINA','China','CHN',86,0.00000,'35.86166','104.195397','Beijing'),(43,28,'CO','COLOMBIA','Colombia','COL',57,0.00000,'4.570868','-74.297333','Bogota'),(44,29,'KM','COMOROS','Comoros','COM',269,0.00000,'-11.875001','43.872219','Moroni'),(45,169,'CG','CONGO','Congo','COG',242,0.00000,'-0.228021','15.827659','Kinshasa'),(46,31,'CR','COSTA RICA','Costa Rica','CRI',506,0.00000,'9.748917','-83.753428','San Jose'),(47,32,'HR','CROATIA','Croatia','HRV',385,25.00000,'45.1','15.2','Zagreb'),(48,33,'CU','CUBA','Cuba','CUB',53,0.00000,'21.521757','-77.781167','Havana'),(49,46,'CY','CYPRUS','Cyprus','CYP',357,19.00000,'35.126413','33.429859','Nicosia'),(50,35,'CZ','CZECH REPUBLIC','Czech Republic','CZE',420,21.00000,'49.817492','15.472962','Prague'),(51,10,'CD','DEMOCRATIC REPUBLIC','Democratic Republic','COD',243,0.00000,'4.0383','21.7587','Test'),(52,36,'DK','DENMARK','Denmark','DNK',45,25.00000,'56.26392','9.501785','Copenhagen'),(53,37,'DJ','DJIBOUTI','Djibouti','DJI',253,0.00000,'11.825138','42.590275','Djibouti'),(54,39,'DM','DOMINICA','Dominica','DMA',1767,0.00000,'15.414999','-61.370976','Roseau'),(55,38,'DO','DOMINICAN REPUBLIC','Dominican republic','DOM',1809,0.00000,'18.735693','-70.162651','Santo Domingo'),(56,139,'EC','ECUADOR','Ecuador','ECU',593,0.00000,'-1.831239','-78.183406','Quito'),(57,41,'EG','EGYPT','Egypt','EGY',20,0.00000,'26.820553','30.802498','Cairo'),(58,139,'SV','EL SALVADOR','El Salvador','SLV',503,0.00000,'13.794185','-88.89653','San Salvador'),(59,25,'GQ','EQUATORIAL GUINEA','Equatorial Guinea','GNQ',240,0.00000,'1.650801','10.267895','Malabo'),(60,43,'ER','ERITREA','Eritrea','ERI',291,0.00000,'15.179384','39.782334','Asmara'),(61,43,'EE','ESTONIA','Estonia','EST',372,20.00000,'58.595272','25.013607','Tallinn'),(62,45,'ET','ETHIOPIA','Ethiopia','ETH',251,0.00000,'9.145','40.489673','Addis Ababa'),(63,36,'FO','FAEROE ISLANDS','Faeroe Islands','FRO',298,0.00000,'61.892635','-6.911806','Tórshavn'),(64,170,'FJ','FIJI ISLANDS','Fiji Islands','FJI',67970,0.00000,'-16.578193','179.414413','Suva'),(65,46,'FI','FINLAND','Finland','FIN',358,24.00000,'61.92411','25.748151','Helsinki'),(66,46,'FR','FRANCE','France','FRA',33,20.00000,'46.227638','2.213749','Paris'),(67,46,'GF','FRENCH GUIANA','French Guiana','GUF',594,0.00000,'3.933889','-53.125782','Cayenne'),(68,171,'PF','FRENCH POLYNESIA','French Polynesia','PYF',689,0.00000,'-17.679742','-149.406843','Papeete'),(69,25,'GA','GABON','Gabon','GAB',241,0.00000,'-0.803689','11.609444','Libreville'),(70,48,'GM','GAMBIA','Gambia','GMB',220,0.00000,'13.443182','-15.310139','Banjul'),(71,172,'GE','GEORGIA','Georgia','GEO',995,0.00000,'42.315407','43.356892','Tbilisi'),(72,46,'DE','GERMANY','Germany','DEU',49,19.00000,'51.165691','10.451526','Berlin'),(73,49,'GH','GHANA','Ghana','GHA',233,0.00000,'7.946527','7.946527','Accra'),(74,50,'GI','GIBRALTAR','Gibraltar','GIB',350,0.00000,'36.137741','-5.345374','Gibraltar'),(75,46,'GR','GREECE','Greece','GRC',30,23.00000,'39.074208','21.824312','Athens'),(76,39,'GD','GRENADA','Grenada','GRD',1473,0.00000,'12.262776','-61.604171','Saint George\'s'),(77,46,'GP','GUADELOUPE','Guadeloupe','GLP',590,0.00000,'16.995971','-62.067641','Basse-Terre'),(78,139,'GU','GUAM','Guam','GUM',1671,0.00000,'13.444304','144.793731','Hagåtña'),(79,52,'GT','GUATEMALA','Guatemala','GTM',502,0.00000,'15.783471','-90.230759','Guatemala City'),(80,53,'GN','GUINEA','Guinea','GIN',224,0.00000,'9.945587','-9.696645','Conakry'),(81,24,'GW','GUINEA BISSAU','Guinea Bissau','GNB',245,0.00000,'11.803749','-15.180413','Bissau'),(82,150,'GY','GUYANA','Guyana','GUY',592,0.00000,'4.860416','-58.93018','Georgetown'),(83,54,'HT','HAITI','Haiti','HTI',509,0.00000,'18.971187','-72.285215','Port-au-Prince'),(84,55,'HN','HONDURAS','Honduras','HND',504,0.00000,'15.199999','-86.241905','Tegucigalpa'),(85,56,'HK','HONG KONG','Hong Kong','HKG',852,0.00000,'22.396428','114.109497','Central'),(86,57,'HU','HUNGARY','Hungary','HUN',36,27.00000,'47.162494','19.503304','Budapest'),(87,58,'IS','ICELAND','Iceland','ISL',354,0.00000,'64.963051','-19.020835','Reykjavik'),(88,59,'IN','INDIA','India','IND',91,0.00000,'20.5937','78.9629','New Delhi'),(89,60,'ID','INDONESIA','Indonesia','IDN',62,0.00000,'-0.789275','113.921327','Jakarta'),(90,61,'IR','IRAN','Iran','IRN',98,0.00000,'32.427908','53.688046','Tehran'),(91,173,'IQ','IRAQ','Iraq','IRQ',964,0.00000,'33.223191','43.679291','Baghdad'),(92,46,'IE','IRELAND','Ireland','IRL',353,23.00000,'53.41291','-8.24389','Dublin'),(93,62,'IL','ISRAEL','Israel','ISR',972,0.00000,'31.046051','34.851612','Jerusalem'),(94,46,'IT','ITALY','Italy','ITA',39,22.00000,'41.87194','12.56738','Rome'),(95,24,'CI','IVORY COAST','Ivory Coast','CIV',225,0.00000,'7.5400','5.5471','Yamoussoukro'),(96,63,'JM','JAMAICA','Jamaica','JAM',1876,0.00000,'18.109581','-77.297508','Kingston'),(97,64,'JP','JAPAN','Japan','JPN',81,0.00000,'36.204824','138.252924','Tokyo'),(98,65,'JO','JORDAN','Jordan','JOR',962,0.00000,'30.585164','36.238414','Amman'),(99,66,'KZ','KAZAKHSTAN','Kazakhstan','KAZ',7,0.00000,'48.019573','66.923684','Astana'),(100,67,'KE','KENYA','Kenya','KEN',254,0.00000,'-0.023559','37.906193','Nairobi'),(101,46,'KS','KOSOVO','Kosovo','KSV',38128,0.00000,'42.602636','20.902977','Pristina'),(102,69,'KW','KUWAIT','Kuwait','KWT',965,0.00000,'29.31166','47.481766','Kuwait City'),(103,174,'KG','KYRGYZSTAN','Kyrgyzstan','KGZ',996,0.00000,'41.20438','74.766098','Bishkek'),(104,70,'LA','LAOS','Laos','LAO',856,0.00000,'19.85627','102.495496','Vientiane'),(105,46,'LV','LATVIA','Latvia','LVA',371,21.00000,'56.879635','24.603189','Riga'),(106,72,'LB','LEBANON','Lebanon','LBN',961,0.00000,'33.854721','33.854721','Beirut'),(107,73,'LS','LESOTHO','Lesotho','LSO',266,0.00000,'-29.609988','28.233608','Maseru'),(108,175,'LR','LIBERIA','Liberia','LBR',231,0.00000,'6.428055','-9.429499','Monrovia'),(109,74,'LY','LIBYA','Libya','LBY',218,0.00000,'26.3351','17.228331','Tripoli'),(110,131,'LI','LIECHTENSTEIN','Liechtenstein','LIE',423,0.00000,'47.166','9.555373','Vaduz'),(111,75,'LT','LITHUANIA','Lithuania','LTU',370,21.00000,'55.169438','23.881275','Vilnius'),(112,46,'LU','LUXEMBOURG','Luxembourg','LUX',352,17.00000,'49.815273','6.129583','Luxembourg'),(113,76,'MO','MACAU','Macau','MAC',853,0.00000,'22.198745','113.543873','Beijing'),(114,77,'MK','MACEDONIA','Macedonia','MKD',389,0.00000,'41.608635','21.745275','Skopje'),(115,176,'MG','MADAGASCAR','Madagascar','MDG',261,0.00000,'-18.766947','46.869107','Antananarivo'),(116,79,'MW','MALAWI','Malawi','MWI',265,0.00000,'-13.254308','34.301525','Lilongwe'),(117,80,'MY','MALAYSIA','Malaysia','MYS',60,0.00000,'4.210484','101.975766','Kuala Lumpur'),(118,24,'ML','MALI','Mali','MLI',223,0.00000,'17.570692','-3.996166','Bamako'),(119,46,'MT','MALTA','Malta','MLT',356,18.00000,'35.937496','14.375416','Valletta'),(120,139,'MH','MARSHALL ISLANDS','Marshall Islands','MHL',692,0.00000,'7.131474','171.184478','Majuro'),(121,46,'MQ','MARTINIQUE','Martinique','MTQ',596,0.00000,'14.641528','-61.024174','Fort-de-France'),(122,83,'MR','MAURITANIA','Mauritania','MRT',222,0.00000,'21.00789','-10.940835','Nouakchott'),(123,84,'MU','MAURITIUS','Mauritius','MUS',230,0.00000,'-20.348404','57.552152','Port Louis'),(124,85,'MX','MEXICO','Mexico','MEX',52,0.00000,'23.634501','-102.552784','Mexico City'),(125,139,'FM','MICRONESIA','Micronesia','FSM',691,0.00000,'7.4256','150.5508','Palikir'),(126,86,'MD','MOLDOVA','Moldova','MDA',373,0.00000,'47.411631','28.369885','Chisinau'),(127,46,'MC','MONACO','Monaco','MCO',377,0.00000,'43.750298','7.412841','Monaco'),(128,87,'MN','MONGOLIA','Mongolia','MNG',976,0.00000,'46.862496','103.846656','Ulaanbaatar'),(129,46,'ME','MONTENEGRO','Montenegro','MNE',382,0.00000,'42.708678','19.37439','Podgorica'),(130,39,'MS','MONTSERRAT','Montserrat','MSR',1664,0.00000,'16.742498','-62.187366','Brades'),(131,88,'MA','MOROCCO','Morocco','MAR',212,0.00000,'31.791702','-7.09262','Rabat'),(132,89,'MZ','MOZAMBIQUE','Mozambique','MOZ',258,0.00000,'-18.665695','35.529562','Maputo'),(133,177,'MM','MYANMAR','Myanmar','MMR',95,0.00000,'21.913965','95.956223','Rangoon'),(134,90,'NA','NAMIBIA','Namibia','NAM',264,0.00000,'-22.95764','18.49041','Windhoek'),(135,91,'NP','NEPAL','Nepal','NPL',977,0.00000,'28.394857','84.124008','Kathmandu'),(136,46,'NL','NETHERLANDS','Netherlands','NLD',31,21.00000,'52.132633','5.291266','Amsterdam'),(137,171,'NC','NEW CALEDONIA','New Caledonia','NCL',687,0.00000,'-20.904305','165.618042','Nouméa'),(138,94,'NZ','NEW ZEALAND','New Zealand','NZL',64,0.00000,'-40.900557','174.885971','Wellington'),(139,95,'NI','NICARAGUA','Nicaragua','NIC',505,0.00000,'12.865416','-85.207229','Managua'),(140,24,'NE','NIGER','Niger','NER',227,0.00000,'17.607789','8.081666','Niamey'),(141,96,'NG','NIGERIA','Nigeria','NGA',234,0.00000,'9.081999','8.675277','Abuja'),(142,139,'MP','NO. MARIANA ISLANDS','No. Mariana Islands','MNP',1670,0.00000,'17.33083','145.38469','Saipan'),(143,178,'KP','NORTH KOREA','North Korea','PRK',850,0.00000,'40.339852','127.510093','Pyongyang'),(144,97,'NO','NORWAY','Norway','NOR',47,0.00000,'60.472024','8.468946','Oslo'),(145,98,'OM','OMAN','Oman','OMN',968,0.00000,'21.512583','55.923255','Muscat'),(146,100,'PK','PAKISTAN','Pakistan','PAK',92,0.00000,'30.375321','69.345116','Islamabad'),(147,139,'PW','PALAU','Palau','PLW',680,0.00000,'7.51498','134.58252','Melekeok'),(149,102,'PA','PANAMA','Panama','PAN',507,0.00000,'8.537981','-80.782127','Panama City'),(150,104,'PY','PARAGUAY','Paraguay','PRY',595,0.00000,'-23.442503','-58.443832','Asuncion'),(151,179,'PE','PERU','Peru','PER',51,0.00000,'-9.189967','-75.015152','Lima'),(152,106,'PH','PHILIPPINES','Philippines','PHL',63,0.00000,'12.879721','121.774017','Manila'),(153,108,'PL','POLAND','Poland','POL',48,23.00000,'51.919438','19.145136','Warsaw'),(154,46,'PT','PORTUGAL','Portugal','PRT',351,23.00000,'39.399872','-8.224454','Lisbon'),(155,139,'PR','PUERTO RICO','Puerto Rico','PRI',1787,0.00000,'18.220833','-66.590149','San Juan'),(156,109,'QA','QATAR','Qatar','QAT',974,0.00000,'25.354826','51.183884','Doha'),(157,46,'RE','REUNION ISLAND','Reunion Island','REU',262,0.00000,'-21.115141','55.536384','Saint-Denis'),(158,110,'RO','ROMANIA','Romania','ROM',40,20.00000,'45.943161','24.96676','Bucharest'),(159,112,'RU','RUSSIAN FEDERATION','Russian Federation','RUS',70,0.00000,'61.52401','105.318756','Moscow'),(160,113,'RW','RWANDA','Rwanda','RWA',250,0.00000,'-1.940278','29.873888','Kigali'),(161,46,'SM','SAN MARINO','San Marino','SMR',378,0.00000,'43.94236','12.457777','San Marino'),(162,116,'SA','SAUDI ARABIA','Saudi Arabia','SAU',966,0.00000,'23.885942','45.079162','Riyadh'),(163,24,'SN','SENEGAL','Senegal','SEN',221,0.00000,'14.497401','-14.452362','Dakar'),(164,180,'RS','SERBIA','Serbia','SRB',381,0.00000,'44.016521','21.005859','Belgrade'),(165,117,'SC','SEYCHELLES ISLANDS','Seychelles Islands','SYC',248,0.00000,'-4.679574','55.491977','Victoria'),(166,118,'SL','SIERRA LEONE','Sierra Leone','SLE',232,0.00000,'8.460555','-11.779889','Freetown'),(167,120,'SG','SINGAPORE','Singapore','SGP',65,0.00000,'1.352083','103.819836','Singapore'),(168,46,'SK','SLOVAKIA','Slovakia','SVK',421,20.00000,'48.669026','19.699024','Bratislava'),(169,46,'SI','SLOVENIA','Slovenia','SVN',386,22.00000,'46.151241','14.995463','Ljubljana'),(170,123,'SO','SOMALIA','Somalia','SOM',252,0.00000,'5.152149','46.199616','Mogadishu'),(171,124,'ZA','SOUTH AFRICA','South Africa','ZAF',27,0.00000,'-30.559482','22.937506','Cape Town'),(172,181,'KR','SOUTH KOREA','South Korea','KOR',82,0.00000,'35.907757','127.766922','Seoul'),(173,182,'SS','SOUTH SUDAN','South Sudan','SSD',211,0.00000,'6.8770','31.3070','Juba'),(174,46,'ES','SPAIN','Spain','ESP',34,21.00000,'40.463667','-3.74922','Madrid'),(175,125,'LK','SRI LANKA','Sri Lanka','LKA',94,0.00000,'7.873054','80.771797','Colombo'),(176,39,'KN','ST. KITTS','St. Kitts','KNA',1869,0.00000,'17.3578','62.7830','Basseterre'),(177,39,'LC','ST. LUCIA','St. Lucia','LCA',1758,0.00000,'13.9094','60.9789','Castries'),(178,46,'MF','ST. MARTIN','St. Martin','MAF',1721,0.00000,'18.0708','63.0501','Marigot'),(179,46,'PM','ST. PIERRE & MIQUELON','St. Pierre & Miquelon','SPM',508,0.00000,'46.8852','56.3159','Saint-Pierre'),(180,39,'VC','ST. VINCENT','St. Vincent','VCT',1784,0.00000,'12.9843','61.2872','Kingstown'),(181,183,'SD','SUDAN','Sudan','SDN',249,0.00000,'12.862807','30.217636','Khartoum'),(182,184,'SR','SURINAME','Suriname','SUR',597,0.00000,'3.919305','-56.027783','Paramaribo'),(183,129,'SZ','SWAZILAND','Swaziland','SWZ',268,0.00000,'-26.522503','31.465866','Mbabane'),(184,130,'SE','SWEDEN','Sweden','SWE',46,25.00000,'60.128161','18.643501','Stockholm'),(185,131,'CH','SWITZERLAND','Switzerland','CHE',41,0.00000,'46.818188','8.227512','Bern'),(186,132,'SY','SYRIA','Syria','SYR',963,0.00000,'34.802075','38.996815','Damascus'),(187,133,'TW','TAIWAN','Taiwan','TWN',886,0.00000,'23.69781','120.960515','Taipei'),(188,185,'TJ','TAJIKISTAN','Tajikistan','TJK',992,0.00000,'38.861034','71.276093','Dushanbe'),(189,134,'TZ','TANZANIA','Tanzania','TZA',255,0.00000,'-6.369028','34.888822','Dar es Salaam'),(190,135,'TH','THAILAND','Thailand','THA',66,0.00000,'15.870032','100.992541','Bangkok'),(192,137,'TT','TRINIDAD & TOBAGO','Trinidad & Tobago','TTO',1868,0.00000,'10.691803','-61.222503','Port-of-Spain'),(193,138,'TN','TUNISIA','Tunisia','TUN',216,0.00000,'33.886917','9.537499','Tunis'),(194,186,'TR','TURKEY','Turkey','TUR',90,0.00000,'38.963745','35.243322','Ankara'),(195,187,'TM','TURKMENISTAN','Turkmenistan','TKM',7370,0.00000,'38.969719','59.556278','Ashgabat'),(196,139,'TC','TURKS & CAICOS ISLANDS','Turks & Caicos Islands','TCA',1649,0.00000,'21.694025','-71.797928','Cockburn Town'),(197,141,'UG','UGANDA','Uganda','UGA',256,0.00000,'1.373333','32.290275','Kampala'),(198,142,'UA','UKRAINE','Ukraine','UKR',380,0.00000,'48.379433','31.16558','Kyiv'),(199,140,'AE','UNITED ARAB EMIRATES','United Arab Emirates','ARE',971,0.00000,'23.424076','53.847818','Abu Dhabi'),(200,188,'GB','UNITED KINGDOM','United Kingdom','GBR',44,20.00000,'55.378051','-3.435973','London'),(201,143,'UY','URUGUAY','Uruguay','URY',598,0.00000,'-32.522779','-55.765835','Montevideo'),(202,139,'VI','US VIRGIN ISLANDS','Us Virgin Islands','VIR',1340,0.00000,'18.335765','-64.896335','Charlotte Amalie'),(203,139,'US','United States','United States','USA',1,0.00000,'37.09024','-95.712891','Washington, D.C.'),(204,189,'UZ','UZBEKISTAN','Uzbekistan','UZB',998,0.00000,'41.377491','64.585262','Tashkent'),(205,145,'VE','VENEZUELA','Venezuela','VEN',58,0.00000,'6.42375','-66.58973','Caracas'),(206,146,'VN','VIETNAM','Vietnam','VNM',84,0.00000,'14.058324','108.277199','Hanoi'),(207,147,'YE','YEMEN','Yemen','YEM',967,0.00000,'15.552727','48.516388','Sanaa'),(208,148,'ZM','ZAMBIA','Zambia','ZMB',260,0.00000,'-13.133897','27.849332','Lusaka'),(209,149,'ZW','ZIMBABWE','Zimbabwe','ZWE',263,0.00000,'-19.015438','29.154857','Harare'),(211,190,'A','ASCENSION','Ascension','ASC',247,0.00000,'','','Georgetown'),(212,94,'CK','COOK ISLANDS','Cook Islands','COK',682,0.00000,'','','Avarua'),(213,139,'TL','EAST TIMOR','EastTimor','TLS',670,0.00000,'','','Dili'),(214,47,'FK','FALKLAND ISLANDS','FalklandIslands','FLK',500,0.00000,'','','Stanley'),(215,36,'GL','GREENLAND','GreenLand','GRL',299,0.00000,'','','Nuuk'),(216,6,'KI','KIRIBATI','Kiribati','KIR',686,0.00000,'','','South Tarawa'),(217,81,'MV','MALDIVES','Maldives','MDV',960,0.00000,'','','Malé'),(218,6,'NR','NAURU','Nauru','NRU',674,0.00000,'','','Yaren');
/*!40000 ALTER TABLE `countrycode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cron_settings`
--

DROP TABLE IF EXISTS `cron_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cron_settings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `command` varchar(50) NOT NULL,
  `exec_interval` int NOT NULL DEFAULT '1',
  `creation_date` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `last_modified_date` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `last_execution_date` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `next_execution_date` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `file_path` varchar(200) NOT NULL,
  `default_interval_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cron_settings`
--

LOCK TABLES `cron_settings` WRITE;
/*!40000 ALTER TABLE `cron_settings` DISABLE KEYS */;
INSERT INTO `cron_settings` VALUES (1,'CDRs Archive','days',1,'2021-05-12 05:58:22','2021-05-12 05:58:22','0000-00-00 00:00:00','2021-05-13 01:00:00',0,'wget --no-check-certificate -O - -q {BASE_URL}CDRsArchive/ProcessCDRsArchive',NULL),(2,'Purge Data','days',1,'2021-05-12 05:58:23','2021-05-12 05:58:23','0000-00-00 00:00:00','2021-05-13 00:00:00',0,'wget --no-check-certificate -O - -q {BASE_URL}purge/ProcessPurge/',NULL),(3,'Low Balance Alert','days',1,'2021-05-12 05:58:23','2021-05-12 05:58:23','0000-00-00 00:00:00','2021-05-12 06:00:00',0,'wget --no-check-certificate -O - -q {BASE_URL}lowbalance/low_balance/',NULL),(4,'Email Broadcast','minutes',1,'2021-05-12 05:58:23','2021-05-12 05:58:23','0000-00-00 00:00:00','0000-00-00 00:00:00',0,'wget --no-check-certificate -O - -q {BASE_URL}broadcastemail/broadcast_email/',NULL),(5,'Generate Invoice','days',1,'2021-05-12 05:58:23','2021-05-12 05:58:23','0000-00-00 00:00:00','2021-05-12 02:00:00',0,'wget --no-check-certificate -O - -q {BASE_URL}ProcessInvoice/GenerateInvoice/','days'),(6,'Manage Services','minutes',30,'2021-05-12 05:58:23','2021-05-12 05:58:23','0000-00-00 00:00:00','2021-05-11 22:00:00',0,'wget --no-check-certificate -O - -q {BASE_URL}ProcessInvoice/ManageServices/',NULL),(7,'Update Pending Order Status','minutes',30,'2021-05-12 05:58:23','2021-05-12 05:58:23','0000-00-00 00:00:00','0000-00-00 00:00:00',0,'wget --no-check-certificate -O - -q {BASE_URL}PaymentStatus/PaymentStatus/',NULL),(9,'Rates Update','days',1,'2021-05-12 06:01:27','2021-05-12 06:01:27','0000-00-00 00:00:00','0000-00-00 00:00:00',0,'wget --no-check-certificate -q -O- {BASE_URL}Rates_update/index',NULL),(10,'Sms Broadcast','minutes',1,'2021-05-12 06:01:32','2021-05-12 06:01:32','0000-00-00 00:00:00','0000-00-00 00:00:00',0,'wget --no-check-certificate -O - -q {BASE_URL}broadcastemail/broadcast_sms/',NULL),(11,'Push Broadcast','minutes',1,'2021-05-12 06:01:33','2021-05-12 06:01:33','0000-00-00 00:00:00','0000-00-00 00:00:00',0,'wget --no-check-certificate -O - -q {BASE_URL}broadcastemail/broadcast_pushnotification/',NULL),(12,'DID on hold to active','minutes',1,'2021-05-12 06:01:40','2021-05-12 06:01:40','0000-00-00 00:00:00','0000-00-00 00:00:00',0,'wget --no-check-certificate -O - -q {BASE_URL}didhold/dids_onhold/',NULL),(13,'Timezone Update','hours',1,'2021-05-12 06:01:46','2021-05-12 06:01:46','0000-00-00 00:00:00','0000-00-00 00:00:00',0,'wget --no-check-certificate -O - -q {BASE_URL}timezone_change/timezone_update/',NULL),(14,'Product Renewal Reminder','days',1,'2021-05-12 06:02:30','2021-05-12 06:02:30','0000-00-00 00:00:00','0000-00-00 00:00:00',0,'wget --no-check-certificate -O - -q {BASE_URL}ProcessInvoice/product_renewal_reminder/','days'),(15,'Currency Update','days',1,'2021-05-12 06:02:32','2021-05-12 06:02:32','0000-00-00 00:00:00','0000-00-00 00:00:00',0,'wget --no-check-certificate -q -O- {BASE_URL}currencyupdate/update_currency','days');
/*!40000 ALTER TABLE `cron_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currency`
--

DROP TABLE IF EXISTS `currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `currency` (
  `id` int NOT NULL AUTO_INCREMENT,
  `currency` varchar(3) NOT NULL DEFAULT '',
  `currencyname` varchar(40) NOT NULL DEFAULT '',
  `currencyrate` decimal(10,3) NOT NULL,
  `last_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `currency` (`currency`),
  KEY `currencyrate` (`currencyrate`)
) ENGINE=InnoDB AUTO_INCREMENT=192 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currency`
--

LOCK TABLES `currency` WRITE;
/*!40000 ALTER TABLE `currency` DISABLE KEYS */;
INSERT INTO `currency` VALUES (1,'ALL','Albanian Lek',111.604,'2021-05-12 05:57:15'),(2,'DZD','Algerian Dinar',119.355,'2021-05-12 05:57:15'),(4,'ARS','Argentine Peso',43.895,'2021-05-12 05:57:15'),(5,'AWG','Aruba Florin',1.800,'2021-05-12 05:57:15'),(6,'AUD','Australian Dollar',1.407,'2021-05-12 05:57:15'),(7,'BSD','Bahamian Dollar',1.002,'2021-05-12 05:57:15'),(8,'BHD','Bahraini Dinar',0.377,'2021-05-12 05:57:15'),(9,'BDT','Bangladesh Taka',84.460,'2021-05-12 05:57:15'),(10,'BBD','Barbados Dollar',1.991,'2021-05-12 05:57:15'),(11,'BYR','Belarus Ruble',19600.000,'2021-05-12 05:57:15'),(12,'BZD','Belize Dollar',2.016,'2021-05-12 05:57:15'),(13,'BMD','Bermuda Dollar',1.000,'2021-05-12 05:57:15'),(14,'BTN','Bhutan Ngultrum',69.208,'2021-05-12 05:57:15'),(15,'BOB','Bolivian Boliviano',6.955,'2021-05-12 05:57:15'),(16,'BRL','Brazilian Real',3.875,'2021-05-12 05:57:15'),(17,'GBP','British Pound',0.767,'2021-05-12 05:57:15'),(18,'BND','Brunei Dollar',1.351,'2021-05-12 05:57:15'),(19,'BGN','Bulgarian Lev',1.744,'2021-05-12 05:57:15'),(20,'BIF','Burundi Franc',1835.500,'2021-05-12 05:57:15'),(21,'KHR','Cambodia Riel',4026.000,'2021-05-12 05:57:15'),(22,'CAD','Canadian Dollar',1.339,'2021-05-12 05:57:15'),(23,'KYD','Cayman Islands Dollar',0.833,'2021-05-12 05:57:15'),(24,'XOF','CFA Franc (BCEAO)',590.000,'2021-05-12 05:57:15'),(25,'XAF','CFA Franc (BEAC)',584.250,'2021-05-12 05:57:15'),(26,'CLP','Chilean Peso',665.304,'2021-05-12 05:57:15'),(27,'CNY','Chinese Yuan',6.718,'2021-05-12 05:57:15'),(28,'COP','Colombian Peso',3124.500,'2021-05-12 05:57:15'),(29,'KMF','Comoros Franc',439.104,'2021-05-12 05:57:15'),(31,'CRC','Costa Rica Colon',606.035,'2021-05-12 05:57:15'),(32,'HRK','Croatian Kuna',6.628,'2021-05-12 05:57:15'),(33,'CUP','Cuban Peso',26.500,'2021-05-12 05:57:15'),(34,'CYP','Cyprus Pound',0.008,'2021-05-12 05:57:15'),(35,'CZK','Czech Koruna',22.859,'2021-05-12 05:57:15'),(36,'DKK','Danish Krone',6.656,'2021-05-12 05:57:15'),(37,'DJF','Dijibouti Franc',177.720,'2021-05-12 05:57:15'),(38,'DOP','Dominican Peso',50.645,'2021-05-12 05:57:15'),(39,'XCD','East Caribbean Dollar',2.703,'2021-05-12 05:57:15'),(40,'ECS','Ecuador Sucre',371.471,'2021-05-12 05:57:15'),(41,'EGP','Egyptian Pound',17.305,'2021-05-12 05:57:15'),(42,'SVC','El Salvador Colon',8.749,'2021-05-12 05:57:15'),(43,'ERN','Eritrea Nakfa',15.000,'2021-05-12 05:57:15'),(44,'EEK','Estonian Kroon',0.000,'2021-05-12 05:57:15'),(45,'ETB','Ethiopian Birr',28.904,'2021-05-12 05:57:15'),(46,'EUR','Euro',0.890,'2021-05-12 05:57:15'),(47,'FKP','Falkland Islands Pound',0.765,'2021-05-12 05:57:15'),(48,'GMD','Gambian Dalasi',49.625,'2021-05-12 05:57:15'),(49,'GHC','Ghanian Cedi',897.330,'2021-05-12 05:57:15'),(50,'GIP','Gibraltar Pound',0.765,'2021-05-12 05:57:15'),(52,'GTQ','Guatemala Quetzal',7.672,'2021-05-12 05:57:15'),(53,'GNF','Guinea Franc',9225.000,'2021-05-12 05:57:15'),(54,'HTG','Haiti Gourde',84.101,'2021-05-12 05:57:15'),(55,'HNL','Honduras Lempira',24.520,'2021-05-12 05:57:15'),(56,'HKD','Hong Kong Dollar',7.851,'2021-05-12 05:57:15'),(57,'HUF','Hungarian ForINT',286.320,'2021-05-12 05:57:15'),(58,'ISK','Iceland Krona',118.980,'2021-05-12 05:57:15'),(59,'INR','Indian Rupee',1.000,'2021-05-12 05:57:15'),(60,'IDR','Indonesian Rupiah',14117.000,'2021-05-12 05:57:15'),(61,'IRR','Iran Rial',42105.000,'2021-05-12 05:57:15'),(62,'ILS','Israeli Shekel',3.577,'2021-05-12 05:57:15'),(63,'JMD','Jamaican Dollar',127.510,'2021-05-12 05:57:15'),(64,'JPY','Japanese Yen',111.725,'2021-05-12 05:57:15'),(65,'JOD','Jordanian Dinar',0.709,'2021-05-12 05:57:15'),(66,'KZT','Kazakhstan Tenge',379.240,'2021-05-12 05:57:15'),(67,'KES','Kenyan Shilling',100.690,'2021-05-12 05:57:15'),(68,'KRW','Korean Won',1137.690,'2021-05-12 05:57:15'),(69,'KWD','Kuwaiti Dinar',0.305,'2021-05-12 05:57:15'),(70,'LAK','Lao Kip',8602.504,'2021-05-12 05:57:15'),(71,'LVL','Latvian Lat',0.605,'2021-05-12 05:57:15'),(72,'LBP','Lebanese Pound',1511.150,'2021-05-12 05:57:15'),(73,'LSL','Lesotho Loti',14.090,'2021-05-12 05:57:15'),(74,'LYD','Libyan Dinar',1.395,'2021-05-12 05:57:15'),(75,'LTL','Lithuanian Lita',2.953,'2021-05-12 05:57:15'),(76,'MOP','Macau Pataca',8.086,'2021-05-12 05:57:15'),(77,'MKD','Macedonian Denar',54.802,'2021-05-12 05:57:15'),(78,'MGF','Malagasy Franc',5.830,'2021-05-12 05:57:15'),(79,'MWK','Malawi Kwacha',725.115,'2021-05-12 05:57:15'),(80,'MYR','Malaysian Ringgit',4.090,'2021-05-12 05:57:15'),(81,'MVR','Maldives Rufiyaa',15.450,'2021-05-12 05:57:15'),(82,'MTL','Maltese Lira',0.840,'2021-05-12 05:57:15'),(83,'MRO','Mauritania Ougulya',357.000,'2021-05-12 05:57:15'),(84,'MUR','Mauritius Rupee',34.895,'2021-05-12 05:57:15'),(85,'MXN','Mexican Peso',19.073,'2021-05-12 05:57:15'),(86,'MDL','Moldovan Leu',17.413,'2021-05-12 05:57:15'),(87,'MNT','Mongolian Tugrik',2616.500,'2021-05-12 05:57:15'),(88,'MAD','Moroccan Dirham',9.658,'2021-05-12 05:57:15'),(89,'MZM','Mozambique Metical',0.000,'2021-05-12 05:57:15'),(90,'NAD','Namibian Dollar',14.120,'2021-05-12 05:57:15'),(91,'NPR','Nepalese Rupee',110.925,'2021-05-12 05:57:15'),(92,'ANG','Neth Antilles Guilder',1.855,'2021-05-12 05:57:15'),(93,'TRY','New Turkish Lira',5.626,'2021-05-12 05:57:15'),(94,'NZD','New Zealand Dollar',1.485,'2021-05-12 05:57:15'),(95,'NIO','Nicaragua Cordoba',32.830,'2021-05-12 05:57:15'),(96,'NGN','Nigerian Naira',360.504,'2021-05-12 05:57:15'),(97,'NOK','Norwegian Krone',8.614,'2021-05-12 05:57:15'),(98,'OMR','Omani Rial',0.385,'2021-05-12 05:57:15'),(99,'XPF','Pacific Franc',106.780,'2021-05-12 05:57:15'),(100,'PKR','Pakistani Rupee',141.440,'2021-05-12 05:57:15'),(102,'PAB','Panama Balboa',1.005,'2021-05-12 05:57:15'),(103,'PGK','Papua New Guinea Kina',3.380,'2021-05-12 05:57:15'),(104,'PYG','Paraguayan Guarani',6198.850,'2021-05-12 05:57:15'),(105,'PEN','Peruvian Nuevo Sol',3.298,'2021-05-12 05:57:15'),(106,'PHP','Philippine Peso',52.090,'2021-05-12 05:57:15'),(108,'PLN','Polish Zloty',3.826,'2021-05-12 05:57:15'),(109,'QAR','Qatar Rial',3.641,'2021-05-12 05:57:15'),(110,'ROL','Romanian Leu',33.340,'2021-05-12 05:57:15'),(111,'RON','Romanian New Leu',4.236,'2021-05-12 05:57:15'),(112,'RUB','Russian Rouble',65.231,'2021-05-12 05:57:15'),(113,'RWF','Rwanda Franc',900.000,'2021-05-12 05:57:15'),(114,'WST','Samoa Tala',2.608,'2021-05-12 05:57:15'),(115,'STD','Sao Tome Dobra',21050.600,'2021-05-12 05:57:15'),(116,'SAR','Saudi Arabian Riyal',3.754,'2021-05-12 05:57:15'),(117,'SCR','Seychelles Rupee',13.667,'2021-05-12 05:57:15'),(118,'SLL','Sierra Leone Leone',8850.000,'2021-05-12 05:57:15'),(120,'SGD','Singapore Dollar',1.355,'2021-05-12 05:57:15'),(121,'SKK','Slovak Koruna',33.554,'2021-05-12 05:57:15'),(122,'SIT','Slovenian Tolar',3.217,'2021-05-12 05:57:15'),(123,'SOS','Somali Shilling',580.000,'2021-05-12 05:57:15'),(124,'ZAR','South African Rand',14.096,'2021-05-12 05:57:15'),(125,'LKR','Sri Lanka Rupee',174.790,'2021-05-12 05:57:15'),(126,'SHP','St Helena Pound',1.321,'2021-05-12 05:57:15'),(127,'SDD','Sudanese Dinar',40.366,'2021-05-12 05:57:15'),(128,'SRG','Surinam Guilder',0.000,'2021-05-12 05:57:15'),(129,'SZL','Swaziland Lilageni',14.090,'2021-05-12 05:57:15'),(130,'SEK','Swedish Krona',9.302,'2021-05-12 05:57:15'),(131,'CHF','Swiss Franc',1.000,'2021-05-12 05:57:15'),(132,'SYP','Syrian Pound',515.000,'2021-05-12 05:57:15'),(133,'TWD','Taiwan Dollar',30.804,'2021-05-12 05:57:15'),(134,'TZS','Tanzanian Shilling',2315.404,'2021-05-12 05:57:15'),(135,'THB','Thai Baht',31.896,'2021-05-12 05:57:15'),(136,'TOP','Tonga Paanga',2.266,'2021-05-12 05:57:15'),(137,'TTD','Trinidad&Tobago Dollar',6.813,'2021-05-12 05:57:15'),(138,'TND','Tunisian Dinar',3.018,'2021-05-12 05:57:15'),(139,'USD','U.S. Dollar',1.000,'2021-05-12 05:57:15'),(140,'AED','UAE Dirham',3.673,'2021-05-12 05:57:15'),(141,'UGX','Ugandan Shilling',3741.550,'2021-05-12 05:57:15'),(142,'UAH','Ukraine Hryvnia',27.041,'2021-05-12 05:57:15'),(143,'UYU','Uruguayan New Peso',33.720,'2021-05-12 05:57:15'),(144,'VUV','Vanuatu Vatu',112.000,'2021-05-12 05:57:15'),(145,'VEB','Venezuelan Bolivar',0.000,'2021-05-12 05:57:15'),(146,'VND','Vietnam Dong',23199.500,'2021-05-12 05:57:15'),(147,'YER','Yemen Riyal',250.304,'2021-05-12 05:57:15'),(148,'ZMK','Zambian Kwacha',9001.204,'2021-05-12 05:57:15'),(149,'ZWD','Zimbabwe Dollar',0.000,'2021-05-12 05:57:15'),(150,'GYD','Guyana Dollar',209.435,'2021-05-12 05:57:15'),(160,'AWG','Aruban florin',1.800,'2021-05-12 05:57:15'),(161,'AMD','Armenian dram',487.420,'2021-05-12 05:57:15'),(163,'AZN','Azerbaijani manat',1.705,'2021-05-12 05:57:15'),(164,'BBD','Barbadian dollar',1.991,'2021-05-12 05:57:15'),(166,'BAM','Bosnian Convertible Marka',1.742,'2021-05-12 05:57:15'),(167,'BWP','Botswana pula',10.664,'2021-05-12 05:57:15'),(168,'CVE','Cape Verdean escudo',98.590,'2021-05-12 05:57:15'),(169,'CDF','Congolese franc',1635.000,'2021-05-12 05:57:15'),(170,'FJD','Fijian Dollar',2.133,'2021-05-12 05:57:15'),(171,'XPF','CFP franc',106.780,'2021-05-12 05:57:15'),(172,'GEL','Georgian lari',2.685,'2021-05-12 05:57:15'),(173,'IQD','Iraqi dinar',1190.000,'2021-05-12 05:57:15'),(174,'KGS','Kyrgyzstani som',69.850,'2021-05-12 05:57:15'),(175,'LRD','Liberian dollar',163.850,'2021-05-12 05:57:15'),(176,'MGA','Malagasy ariary',3605.000,'2021-05-12 05:57:15'),(177,'MMK','Burmese Kyat',1505.604,'2021-05-12 05:57:15'),(178,'KPW','North Korean won',899.987,'2021-05-12 05:57:15'),(179,'PEN','nuevo sol',3.298,'2021-05-12 05:57:15'),(180,'RSD','Serbian dinar',105.030,'2021-05-12 05:57:15'),(181,'KRW','South Korean won',1137.690,'2021-05-12 05:57:15'),(182,'SSP','South Sudanese pound',0.008,'2021-05-12 05:57:15'),(183,'SDG','Sudanese pound',47.607,'2021-05-12 05:57:15'),(184,'SRD','Surinamese dollar',7.458,'2021-05-12 05:57:15'),(185,'TJS','Tajikistani samani',9.434,'2021-05-12 05:57:15'),(186,'TRY','Turkish lira',5.626,'2021-05-12 05:57:15'),(187,'TMT','Turkmenistan manat',3.500,'2021-05-12 05:57:15'),(188,'GBP','Pound sterling',0.767,'2021-05-12 05:57:15'),(189,'UZS','Uzbekistani soʻm',8413.504,'2021-05-12 05:57:15'),(190,'SHP','Saint Helena pound',1.321,'2021-05-12 05:57:15');
/*!40000 ALTER TABLE `currency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_templates`
--

DROP TABLE IF EXISTS `default_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `default_templates` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL DEFAULT '',
  `subject` varchar(500) NOT NULL,
  `description` varchar(512) NOT NULL,
  `sms_template` varchar(500) NOT NULL,
  `alert_template` varchar(500) NOT NULL,
  `template` mediumtext NOT NULL,
  `last_modified_date` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `reseller_id` int NOT NULL DEFAULT '0',
  `is_email_enable` tinyint(1) NOT NULL DEFAULT '0',
  `is_sms_enable` tinyint(1) NOT NULL,
  `is_alert_enable` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_templates`
--

LOCK TABLES `default_templates` WRITE;
/*!40000 ALTER TABLE `default_templates` DISABLE KEYS */;
INSERT INTO `default_templates` VALUES (1,'account_refilled','Your account recharged with #REFILLBALANCE#','Account recharge notification template','Dear #FIRST_NAME#, Your account has been recharged with #REFILLBALANCE#. Your new balance is #BALANCE#. Thanks, #COMPANY_NAME#','<p>Your account has been recharged with #REFILLBALANCE#. Your new balance is #BALANCE#.</p>\n','<p>Dear #NAME#,</p>\n\n<p>Your account has been recharged with #REFILLBALANCE#.</p>\n\n<p>Your account new balance is #BALANCE#.</p>\n\n<p>For more info, please visit on our website #COMPANY_WEBSITE# or contact to our support department at #COMPANY_EMAIL#.</p>\n\n<p>Thanks,<br />\n#COMPANY_NAME#</p>\n','2019-01-26 10:53:45',0,0,0,0,0),(3,'create_account','Welcome to #COMPANY_NAME#','New customer welcome notification template','Dear #FIRST_NAME#, Your new account has been created. Your account number is #NUMBER# and Password is #PASSWORD#. Thanks, #COMPANY_NAME#','','<p>Welcome #NAME#,</p>\r\n\r\n<p>Your new account has been created. You can log in into customer portal using below login credential,</p>\r\n\r\n<p>Account Number: #NUMBER#<br />\r\nPassword: #PASSWORD#<p/>\r\n\r\n<p>For more info, Please visit on our website #COMPANY_WEBSITE# or contact to our support at #COMPANY_EMAIL#.</p>\r\n\r\n<p>Thanks,<br />\r\n#COMPANY_NAME#</p>\r\n','2019-01-26 10:02:18',0,0,1,0,0),(4,'create_sip_device','New SIP device added to your account','New SIP Device notification template','Dear #FIRST_NAME#, New SIP Device has been added to your account. Username is #USERNAME# and Password is #PASSWORD#. Thanks, #COMPANY_NAME#','','<p>Dear #NAME#,</p>\n\n<p>New SIP device has been added to your account.</p>\n\n<p><strong>Here is your SIP device information,</strong></p>\n\n<p>Username: #USERNAME#<br />\nPassword: #PASSWORD#</p>\n\n<p>&nbsp;</p>\n\n<p>For more info, Please visit on our website #COMPANY_WEBSITE# or contact to our support at #COMPANY_EMAIL#.</p>\n\n<p>Thanks,<br />\n#COMPANY_NAME#</p>\n','2019-01-26 10:02:05',0,0,0,0,0),(10,'new_invoice','Invoice created #INVOICE_NUMBER#','New invoice notification template','Dear #FIRST_NAME#, A new invoice #INVOICE_NUMBER# has been generated into your account of #AMOUNT#. You can log in into customer portal and pay the invoice. Thanks, #COMPANY_NAME#','<p>A new invoice #INVOICE_NUMBER# has been generated into your account of #AMOUNT#.&nbsp;You can log in into customer portal and pay the invoice.</p>\n','<p>Dear #NAME#,</p>\n\n<p>A new invoice has been generated into your account of #AMOUNT#.</p>\n\n<p><strong>Invoice Information: </strong></p>\n\n<p>Invoice Date: #INVOICE_DATE#<br />\nInvoice Number: #INVOICE_NUMBER#<br />\nDue Amount: #AMOUNT#<br />\nDue Date : #DUE_DATE#</p>\n\n<p>You can log in into customer portal and pay the invoice.</p>\n\n<p>For more info, Please visit on our website #COMPANY_WEBSITE# or contact to our support at #COMPANY_EMAIL#.</p>\n\n<p>Thanks,<br />\n#COMPANY_NAME#</p>\n','2019-01-26 10:52:54',0,0,0,0,0),(11,'low_balance','Low Balance notification #NUMBER#','Low balance notification template','Dear #FIRST_NAME#, You currently have #BALANCE# left in your account. Please make a deposit to avoid service interruptions. You can refill your account using our website. Thanks, #COMPANY_NAME#','Your current balance is at #BALANCE# which is below your set threshold. Please refill your account to ensure your services remain consistent.','<p>Dear #NAME#,</p>\n\n<p>Here is a quick reminder that your current balance is at #BALANCE# which is below your set threshold.</p>\n\n<p>You can refill your account from our website to ensure your services will remain consistent.</p>\n\n<p>For more info, please visit on our website #COMPANY_WEBSITE# or contact to our support at #COMPANY_EMAIL#.</p>\n\n<p>Thanks,<br />\n#COMPANY_NAME#</p>\n','2019-01-26 10:51:10',0,0,0,0,0),(12,'signup_confirmation','Confirmation to activate account','Account activation email after signup process','Dear #FIRST_NAME#, Thanks for sign-up with us, Please use otp #OTP# to complete registration.This is usable once & valid for #TIME# min from the request.\r\nThanks,\r\n#COMPANY_NAME#\r\nThanks,\r\n#COMPANY_NAME#','','Dear #NAME#,\r\n\r\nThanks for sign-up with us\r\n\r\nPlease use one time password #OTP# to activate your account and complete registration.This is usable once valid for #TIME# min from the request.\r\n\r\nFor more info Please visit on our website #COMPANY_WEBSITE# or contact to our support at #COMPANY_EMAIL#.\r\n\r\nThanks,\r\n\r\n#COMPANY_NAME#\r\n','2019-01-26 10:04:02',0,0,0,0,0),(13,'new_password','Your account password changed','Change password notification template','Dear #FIRST_NAME#, Your account password has been changed. Thanks, #COMPANY_NAME# ','','<p>Dear #NAME#,</p>\r\n\r\n<p>Your account password has been changed.</p>\r\n\r\n<p>Henceforth, Please use the latest password.</p>\r\n\r\n<p>For more info, Please visit on our website #COMPANY_WEBSITE# or contact to our support at #COMPANY_EMAIL#.</p>\r\n\r\n<p>Thanks,<br />\r\n#COMPANY_NAME#</p>\r\n','2019-01-26 10:04:18',0,0,0,0,0),(14,'forgot_password_confirmation','Reset your password','Account confirmation notification template for forgot password','Dear #FIRST_NAME#, Please use otp #OTP# to reset your password.This is usable once & valid for #TIME# min from the request.\r\n\r\n Thanks, #COMPANY_NAME#','','<p>Hi #NAME#,</p>\r\n\r\n<p>Please use one time password #OTP#  to reset your password.</p>\r\n\r\n\r\n<p>This is usable once valid for #TIME# min from the request.</p>\r\n\r\n<p>If you have not raised a request to reset password then please contact us immediately.</p>\r\n\r\n<p>For more info, Please visit on our website #COMPANY_WEBSITE# or contact to our support at #COMPANY_EMAIL#.</p>\r\n\r\n<p>Thanks,</p>\r\n\r\n<p>#COMPANY_NAME#</p>\r\n','2019-01-26 10:05:29',0,0,1,0,0),(20,'invoice_due_reminder','Invoice due reminder #INVOICE_NUMBER#','Invoice due reminder notification template','Dear #FIRST_NAME#, This is a reminder that your invoice #INVOICE_NUMBER# which was generated on #INVOICE_DATE# is due on #DUE_DATE# for #AMOUNT# amount.  You can log in into the customer portal and pay an invoice. Thanks, #COMPANY_NAME#','<p>Your invoice #INVOICE_NUMBER# which was generated on #INVOICE_DATE# is due on #DUE_DATE# for #AMOUNT# amount.&nbsp;You can log in into the customer portal and pay&nbsp;an invoice.</p>\n','<p>Dear #NAME#,</p>\n\n<p>This is a reminder that your invoice number #INVOICE_NUMBER# which was generated on #INVOICE_DATE# is due on #DUE_DATE#.</p>\n\n<p><strong>Invoice </strong><strong>Information:</strong></p>\n\n<p>Invoice Date: #INVOICE_DATE#<br />\nInvoice Number: #INVOICE_NUMBER#<br />\nDue Amount: #AMOUNT#</p>\n\n<p>You can log in into the customer portal and pay&nbsp;an invoice.</p>\n\n<p>For more info, Please visit on our website #COMPANY_WEBSITE# or contact to our support at #COMPANY_EMAIL#</p>\n\n<p>Thanks,<br />\n#COMPANY_NAME#</p>\n','2019-01-26 10:46:49',0,0,0,0,0),(21,'new_archive_table','New CDR archive table created #TABLE_NAME#','New CDR archive table creation notification template','Dear Admin, New CDR archive table has been created successfully to move old records. The table name is #TABLE_NAME#. Thanks, #COMPANY_NAME#','','<p>Dear Admin,</p>\n\n<p>New CDR archive table has been created successfully to move old records.</p>\n\n<p>The table name is #TABLE_NAME#.</p>\n\n<p>Thanks,<br />\n#COMPANY_NAME#</p>\n','2019-01-26 10:45:29',0,1,1,1,0),(24,'balance_transfer','You have transferred #AMOUNT# to #RECEIVER_ACCOUNT_NUMBER# account','Balance transfer notification template','Dear #FIRST_NAME#, You have transferred #AMOUNT# from your account to #RECEIVER_ACCOUNT_NUMBER#. Thanks, #COMPANY_NAME#','<p>You have transferred #AMOUNT# from your account to #RECEIVER_ACCOUNT_NUMBER#</p>\n','<p>Dear #NAME#,</p>\n\n<p>You have transferred #AMOUNT# from your account to #RECEIVER_ACCOUNT_NUMBER#.</p>\n\n<p>If you have not raised a request then please contact us immediately.</p>\n\n<p>Thanks,<br />\n#COMPANY_NAME#</p>\n','2019-01-26 10:44:35',0,1,0,0,0),(29,'product_purchase','#NAME#, New #PRODUCT_NAME# added to your account','New product allocation to account notification template','Dear #FIRST_NAME#, New #PRODUCT_NAME# added to your account. Thanks, #COMPANY_NAME#','<p>New #PRODUCT_NAME# added to your account</p>\n','<p>Dear #NAME#,</p>\n\n<p>The product #PRODUCT_NAME# has now been added to your account.</p>\n\n<p><strong>Product Information: </strong></p>\n\n<p>Product Name: #PRODUCT_NAME#<br />\nProduct Category: #PRODUCT_CATEGORY#<br />\nPayment Method: #PAYMENT_METHOD#<br />\nProduct Amount: #PRODUCT_AMOUNT#<br />\nNext Bill Date: #NEXT_BILL_DATE#<br />\nQuantity:#QUANTITY#<br />\nTotal Amount:#TOTAL_PRICE#</p>\n\n<p>You can always let us know if you have any question at #COMPANY_EMAIL#. We will be happy to help!</p>\n\n<p>Thanks,<br />\n#COMPANY_NAME#</p>','2019-01-26 10:44:20',0,0,0,0,0),(30,'product_release','#PRODUCT_NAME# released from your account #NUMBER#','Product release notification template','Dear #FIRST_NAME#, #PRODUCT_NAME# released from your account. Thanks, #COMPANY_NAME#','<p>#PRODUCT_NAME# released from your account</p>\n','<p>Dear #NAME#,</p>\r\n\r\n<p>The product #PRODUCT_NAME# is released from #RECEIVER_ACCOUNT_NUMBER#.</p>\r\n\r\n<p><strong>Product Information:</strong><br />\r\nTermination Date: #NEXT_BILL_DATE#</p>\r\n\r\n<p><br />\r\nYou can always let us know if you have any question at #COMPANY_EMAIL#. We will be happy to help!</p>\r\n\r\n<p>Thanks,<br />\r\n#COMPANY_NAME#</p>\r\n','2019-01-26 10:43:56',0,0,0,0,0),(31,'product_renewal_notice','Renewal Notice for #PRODUCT_NAME#, #NUMBER#','Product renewal notice notification template','Dear #FIRST_NAME#, Your product #PRODUCT_NAME# is up for renewal on date #NEXT_BILL_DATE#. Please maintain your balance to ensure your services will remain consistent. Thanks, #COMPANY_NAME#','Your product #PRODUCT_NAME# is up for renewal on date #NEXT_BILL_DATE#.Please maintain your balance to ensure your services will remain consistent.','<p>Dear #NAME#,</p>\n\n<p>Your product #PRODUCT_NAME# is up for renewal, and it will automatically renew on the #NEXT_BILL_DATE#. Please maintain your balance to ensure your services will remain consistent.</p>\n\n<p><strong>Product Information: </strong></p>\n\n<p>Product Name: #PRODUCT_NAME#<br />\nAmount: #PRODUCT_AMOUNT#<br />\nNext Bill Date: #NEXT_BILL_DATE#</p>\n\n<p>You can always let us know if you have any question at #COMPANY_EMAIL#. We will be happy to help!</p>\n\n<p>Thanks,<br />\n#COMPANY_NAME#</p>\n','2019-01-26 10:43:39',0,0,0,0,0),(32,'product_renewed','#PRODUCT_NAME# renewed for your account #NUMBER#','Product renewed notification template','Dear #FIRST_NAME#, Your product #PRODUCT_NAME# has been successfully renewed until #NEXT_BILL_DATE#. Thanks, #COMPANY_NAME#','Your product #PRODUCT_NAME# is up for renewal on date #NEXT_BILL_DATE#. Please maintain your balance to ensure your services will remain consistent.','<p>Dear #NAME#,</p>\n\n<p>Your product #PRODUCT_NAME# has been successfully renewed until #NEXT_BILL_DATE#.</p>\n\n<p><strong>Product Information: </strong></p>\n\n<p>Product Name: #PRODUCT_NAME#<br />\nAmount: #PRODUCT_AMOUNT#<br />\nNext Bill Date: #NEXT_BILL_DATE#<br/>\nQuantity: #QUANTITY#<br/>\nTotal Price: #TOTAL_PRICE# </p>\n\n<p>Remember, You can always let us know if you have any question at #COMPANY_EMAIL#. We will be happy to help!</p>\n\n<p>Thanks,<br />\n#COMPANY_NAME#</p>','2019-01-26 10:43:13',0,0,0,1,0),(33,'product_commission','Congratulations, Your have received #AMOUNT# for Product #PRODUCT_NAME# commission','Product commission notification template for re-seller','Dear #FIRST_NAME#, Congratulations, Your have received #AMOUNT# for Product #PRODUCT_NAME# commission. Thanks, #COMPANY_NAME#','','<p>Dear #NAME#,</p>\n\n<p>Your have received #AMOUNT# for Product #PRODUCT_NAME# commission. Your updated balance is #BALANCE#.</p>\n\n<p>You can always let us know if you have any question at #COMPANY_EMAIL#. We will be happy to help!</p>\n\n<p>Thanks,<br />\n#COMPANY_NAME#</p>\n','2019-02-15 09:42:58',0,0,0,0,0),(34,'cdrs_archive_table_create_success','Create New table #TABLE_NAME# for CDRs Archive.','Send successful mail after creating successfully cdrs arvhive table.','','','<p>Dear Admin,</p>\r\n\r\n<p>Success fully created table and table name is #TABLE_NAME#</p>\r\n','1000-01-01 00:00:00',0,0,1,1,0),(35,'cdrs_archive_table_create_fail','Create New table #TABLE_NAME# for CDRs Archive fail.','Send successful mail after creating or fail cdrs arvhive table.','','','<p>Dear Admin,</p>\r\n\r\n<p>Due to some reason table is not created successfully name is #TABLE_NAME#</p>\r\n','1000-01-01 00:00:00',0,0,1,1,0),(36,'reset_password','Your account password has beed reset.','Reset password notification template','Dear #FIRST_NAME#, Your account password has been changed. Your new password is #PASSWORD#. Thanks, #COMPANY_NAME# ','','<p>Dear #NAME#,</p>\r\n\r\n<p>Your account password has been changed.</p>\r\n\r\n<p>Please see your new password mentioned below: #PASSWORD#</p>\r\n\r\n<p>Henceforth, Please use the latest password.</p>\r\n\r\n<p>For more info, Please visit on our website #COMPANY_WEBSITE# or contact to our support at #COMPANY_EMAIL#.</p>\r\n\r\n<p>Thanks,<br />\r\n#COMPANY_NAME#</p>\r\n','2019-06-14 00:00:00',0,0,0,0,0),(37,'international_low_balance','International Low Balance notification #NUMBER#','International Low balance notification template','Dear #FIRST_NAME#, You currently have #BALANCE# left in your account. Please make a deposit to avoid service interruptions. You can refill your account using our website. Thanks, #COMPANY_NAME#','Your current balance is at #BALANCE# which is below your set threshold. Please refill your account to ensure your services remain consistent.','<p>Dear #NAME#,</p>\r\n\r\n<p>Here is a quick reminder that your current balance is at #BALANCE# which is below your set threshold.</p>\r\n\r\n<p>You can refill your account from our website to ensure your services will remain consistent.</p>\r\n\r\n<p>For more info, please visit on our website #COMPANY_WEBSITE# or contact to our support at #COMPANY_EMAIL#.</p>\r\n\r\n<p>Thanks,<br />\r\nCOMPANY_NAME#</p>','2019-01-26 10:51:10',0,0,0,0,0),(38,'account_postcharge','Your account postcharge with #REFILLBALANCE#','Account postcharge notification template','Dear #FIRST_NAME#, Your account has been postcharge with #REFILLBALANCE#. Your new balance is #BALANCE#. Thanks, #COMPANY_NAME#','<p>Your account has been postcharge with #REFILLBALANCE#. Your new balance is #BALANCE#.</p>\n','<p>Dear #NAME#,</p>\n\n<p>Your account has been postcharge with #REFILLBALANCE#.</p>\n\n<p>Your account new balance is #BALANCE#.</p>\n\n<p>For more info, please visit on our website #COMPANY_WEBSITE# or contact to our support department at #COMPANY_EMAIL#.</p>\n\n<p>Thanks,<br />\n#COMPANY_NAME#</p>\n','2019-01-26 10:53:45',0,0,0,0,0),(39,'pro_rate_refund','Your account refund with #REFUNDBALANCE#','Pro Rate refund notification template','Dear #FIRST_NAME#, Your account has been refund with #REFUNDBALANCE#. Your new balance is #BALANCE#. Thanks, #COMPANY_NAME#','<p>Your account has been refund with #REFUNDBALANCE#. Your new balance is #BALANCE#.</p>','<p>Dear #NAME#,</p>\r\n\r\n<p>Your account has been refund with #REFUNDBALANCE# on #ORDERNUMBER#.</p>\r\n\r\n<p>Your account new balance is #BALANCE#.</p>\r\n\r\n<p>For more info, please visit on our website #COMPANY_WEBSITE# or contact to our support department at #COMPANY_EMAIL#.</p>\r\n\r\n<p>Thanks,<br />\r\n#COMPANY_NAME#</p>\r\n','2019-01-26 10:53:45',0,0,0,0,0),(40,'pro_rate_postcharge','Your account postcharge with #POSTCHARGEBALANCE#','Pro Rate postcharge notification template','Dear #FIRST_NAME#, Your account has been postcharge with #POSTCHARGEBALANCE#. Your new balance is #BALANCE#. Thanks, #COMPANY_NAME#','<p>Your account has been postcharge with #POSTCHARGEBALANCE#. Your new balance is #BALANCE#.</p>','<p>Dear #NAME#,</p>\r\n\r\n<p>Your account has been postcharge with #POSTCHARGEBALANCE# on #ORDERNUMBER#.</p>\r\n\r\n<p>Your account new balance is #BALANCE#.</p>\r\n\r\n<p>For more info, please visit on our website #COMPANY_WEBSITE# or contact to our support department at #COMPANY_EMAIL#.</p>\r\n\r\n<p>Thanks,<br />\r\n#COMPANY_NAME#</p>\r\n','2019-01-26 10:53:45',0,0,0,0,0);
/*!40000 ALTER TABLE `default_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `did_call_types`
--

DROP TABLE IF EXISTS `did_call_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `did_call_types` (
  `id` int NOT NULL AUTO_INCREMENT,
  `call_type_code` varchar(55) NOT NULL,
  `call_type` varchar(55) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `did_call_types`
--

LOCK TABLES `did_call_types` WRITE;
/*!40000 ALTER TABLE `did_call_types` DISABLE KEYS */;
INSERT INTO `did_call_types` VALUES (1,'0','DID-Local'),(2,'1','DID@IP/URL'),(3,'2','Direct-IP'),(4,'3','Other'),(5,'4','PSTN'),(6,'5','SIP-DID');
/*!40000 ALTER TABLE `did_call_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dids`
--

DROP TABLE IF EXISTS `dids`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dids` (
  `id` int NOT NULL AUTO_INCREMENT,
  `number` varchar(40) NOT NULL DEFAULT '',
  `accountid` int NOT NULL DEFAULT '0' COMMENT 'Accounts table id',
  `parent_id` int NOT NULL DEFAULT '0',
  `connectcost` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `includedseconds` int NOT NULL DEFAULT '0',
  `monthlycost` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `cost` double(20,5) NOT NULL DEFAULT '0.00000',
  `init_inc` int NOT NULL DEFAULT '0',
  `inc` int NOT NULL,
  `extensions` varchar(180) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 for active 1 for inactive',
  `provider_id` int NOT NULL DEFAULT '0',
  `country_id` int NOT NULL DEFAULT '0',
  `province` varchar(20) NOT NULL DEFAULT '',
  `city` varchar(20) NOT NULL DEFAULT '',
  `setup` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `maxchannels` int NOT NULL DEFAULT '0',
  `call_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'call type',
  `leg_timeout` int NOT NULL DEFAULT '30',
  `product_id` int NOT NULL,
  `always` int NOT NULL,
  `always_destination` varchar(50) NOT NULL,
  `user_busy` int NOT NULL,
  `user_busy_destination` varchar(50) NOT NULL,
  `user_not_registered` int NOT NULL,
  `user_not_registered_destination` varchar(50) NOT NULL,
  `no_answer` int NOT NULL,
  `no_answer_destination` varchar(50) NOT NULL,
  `failover_extensions` varchar(180) NOT NULL,
  `failover_call_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 enable 1 for disable',
  `always_vm_flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 enable 1 for disable',
  `user_busy_vm_flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 enable 1 for disable',
  `user_not_registered_vm_flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 enable 1 for disable',
  `no_answer_vm_flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 enable 1 for disable',
  `call_type_vm_flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 enable 1 for disable',
  `last_modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `description` varchar(500) NOT NULL,
  `release_date` datetime DEFAULT '0000-00-00 00:00:00',
  `onhold_date` datetime DEFAULT '0000-00-00 00:00:00',
  `is_package` tinyint NOT NULL DEFAULT '0',
  `order_id` int NOT NULL,
  `pro_rate` int NOT NULL DEFAULT '0' COMMENT '0 for full price, 1 for max days, 2 from max minute, 3 for 1 or 2 both of one max',
  PRIMARY KEY (`id`),
  UNIQUE KEY `number` (`number`) USING BTREE,
  KEY `account` (`accountid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dids`
--

LOCK TABLES `dids` WRITE;
/*!40000 ALTER TABLE `dids` DISABLE KEYS */;
/*!40000 ALTER TABLE `dids` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `freeswich_servers`
--

DROP TABLE IF EXISTS `freeswich_servers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `freeswich_servers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `freeswitch_host` varchar(100) NOT NULL,
  `freeswitch_password` varchar(50) NOT NULL,
  `freeswitch_port` varchar(10) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=Active , 1= inactive',
  `creation_date` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `last_modified_date` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `freeswitch_pubip` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `freeswich_servers`
--

LOCK TABLES `freeswich_servers` WRITE;
/*!40000 ALTER TABLE `freeswich_servers` DISABLE KEYS */;
INSERT INTO `freeswich_servers` VALUES (1,'127.0.0.1','ClueCon','8021',0,'2016-07-26 15:25:07','2016-07-26 15:25:07',NULL);
/*!40000 ALTER TABLE `freeswich_servers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gateways`
--

DROP TABLE IF EXISTS `gateways`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gateways` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sip_profile_id` int NOT NULL DEFAULT '0',
  `name` varchar(20) NOT NULL DEFAULT '',
  `gateway_data` text NOT NULL,
  `created_date` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `accountid` int NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 for Active 1 for Inactive',
  `dialplan_variable` varchar(500) NOT NULL,
  `last_modified_date` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gateways`
--

LOCK TABLES `gateways` WRITE;
/*!40000 ALTER TABLE `gateways` DISABLE KEYS */;
INSERT INTO `gateways` VALUES (1,1,'YourProvider','{\"username\":\"USERNAME\",\"password\":\"PASSWORD\",\"proxy\":\"sip.provider.com\",\"register\":\"false\",\"caller-id-in-from\":\"true\"}','2016-07-25 10:59:26',0,0,'','2016-07-26 15:21:09');
/*!40000 ALTER TABLE `gateways` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice_conf`
--

DROP TABLE IF EXISTS `invoice_conf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoice_conf` (
  `id` int NOT NULL AUTO_INCREMENT,
  `accountid` int NOT NULL,
  `company_name` varchar(100) NOT NULL,
  `address` varchar(300) NOT NULL,
  `city` varchar(20) NOT NULL,
  `province` varchar(20) NOT NULL,
  `country` varchar(20) NOT NULL,
  `zipcode` varchar(10) NOT NULL,
  `telephone` varchar(20) NOT NULL,
  `fax` varchar(20) NOT NULL,
  `emailaddress` varchar(100) NOT NULL,
  `website` varchar(100) NOT NULL,
  `invoice_prefix` varchar(11) NOT NULL DEFAULT 'INV_',
  `invoice_start_from` int NOT NULL DEFAULT '1',
  `logo` varchar(100) NOT NULL,
  `favicon` varchar(100) NOT NULL,
  `invoice_note` text NOT NULL,
  `invoice_due_notification` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:enable,1:disable',
  `invoice_notification` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:enable,1:disable',
  `no_usage_invoice` tinyint NOT NULL DEFAULT '0',
  `interval` varchar(11) NOT NULL,
  `notify_before_day` int NOT NULL DEFAULT '1',
  `invoice_taxes_number` varchar(100) NOT NULL DEFAULT 'ABN 12 345 678 901',
  `domain` varchar(100) NOT NULL,
  `website_title` varchar(100) NOT NULL,
  `website_footer` varchar(100) NOT NULL,
  `reseller_id` int NOT NULL DEFAULT '0',
  `smtp_port` int NOT NULL,
  `smtp_host` varchar(255) NOT NULL,
  `smtp_user` varchar(255) NOT NULL,
  `smtp_pass` varchar(255) NOT NULL,
  `smtp_status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_conf`
--

LOCK TABLES `invoice_conf` WRITE;
/*!40000 ALTER TABLE `invoice_conf` DISABLE KEYS */;
INSERT INTO `invoice_conf` VALUES (1,1,'iNextrix Technologies Pvt. Ltd.','Lilamani Corporate Heights, Nava Vadaj','Ahmedabad','Gujarat','88','380014','+1-855-580-1802','','sales@inextrix.com','www.inextrix.com','INV_',1,'','','',1,1,0,'7',1,'ABC 435 1XX 8XX 3XX','www.inextrix.com','iNextrix Technologies Pvt. Ltd.','iNextrix Technologies Pvt. Ltd.',0,0,'','','',0);
/*!40000 ALTER TABLE `invoice_conf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice_details`
--

DROP TABLE IF EXISTS `invoice_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoice_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `accountid` int NOT NULL,
  `reseller_id` int NOT NULL DEFAULT '0',
  `invoiceid` int NOT NULL DEFAULT '0',
  `order_item_id` int NOT NULL DEFAULT '0',
  `charge_type` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `payment_id` int NOT NULL DEFAULT '0',
  `product_category` int NOT NULL DEFAULT '0',
  `is_tax` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 FOR NO AND 1 FOR YES',
  `base_currency` varchar(5) NOT NULL,
  `exchange_rate` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `account_currency` varchar(5) NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `debit` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `credit` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `created_date` datetime NOT NULL,
  `generate_type` int NOT NULL DEFAULT '0' COMMENT '0:Auto 1:manually',
  `before_balance` varchar(100) NOT NULL DEFAULT '0',
  `after_balance` varchar(100) NOT NULL DEFAULT '0',
  `quantity` int NOT NULL DEFAULT '1' COMMENT 'Default will be 1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_details`
--

LOCK TABLES `invoice_details` WRITE;
/*!40000 ALTER TABLE `invoice_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoice_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoices`
--

DROP TABLE IF EXISTS `invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoices` (
  `id` int NOT NULL AUTO_INCREMENT,
  `prefix` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `number` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `accountid` int NOT NULL DEFAULT '0',
  `reseller_id` int NOT NULL DEFAULT '0',
  `payment_id` int NOT NULL DEFAULT '0',
  `from_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `to_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `due_date` datetime NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:paid,1:unpaid,2:partial_payment',
  `generate_date` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `type` enum('I','R') NOT NULL DEFAULT 'I' COMMENT 'I => Invoice R=> Receipt',
  `generate_type` int NOT NULL DEFAULT '0' COMMENT '0:Auto 1:manually',
  `confirm` int DEFAULT '0' COMMENT '0:not conform 1:conform',
  `notes` longtext NOT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:Not delete 1:delete',
  PRIMARY KEY (`id`),
  KEY `accountid` (`accountid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoices`
--

LOCK TABLES `invoices` WRITE;
/*!40000 ALTER TABLE `invoices` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ip_map`
--

DROP TABLE IF EXISTS `ip_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ip_map` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL DEFAULT '',
  `ip` varchar(30) NOT NULL DEFAULT '',
  `accountid` int NOT NULL DEFAULT '0' COMMENT 'Accounts table id',
  `reseller_id` int NOT NULL DEFAULT '0',
  `pricelist_id` int NOT NULL DEFAULT '0',
  `prefix` varchar(20) NOT NULL DEFAULT '',
  `context` varchar(20) NOT NULL DEFAULT 'default',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-Active,1-inactive',
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modified_date` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  PRIMARY KEY (`id`),
  KEY `account` (`accountid`),
  KEY `ip` (`ip`),
  KEY `prefix` (`prefix`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ip_map`
--

LOCK TABLES `ip_map` WRITE;
/*!40000 ALTER TABLE `ip_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `ip_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `language`
--

DROP TABLE IF EXISTS `language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `language` (
  `id` int NOT NULL AUTO_INCREMENT,
  `language` varchar(5) NOT NULL,
  `languagename` varchar(40) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language`
--

LOCK TABLES `language` WRITE;
/*!40000 ALTER TABLE `language` DISABLE KEYS */;
/*!40000 ALTER TABLE `language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `languages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(5) NOT NULL,
  `name` varchar(50) NOT NULL,
  `locale` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `locale` (`locale`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` VALUES (1,'eng','English','en_En');
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `license`
--

DROP TABLE IF EXISTS `license`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `license` (
  `id` int NOT NULL AUTO_INCREMENT,
  `license_key` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `localkey` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_updated_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `license`
--

LOCK TABLES `license` WRITE;
/*!40000 ALTER TABLE `license` DISABLE KEYS */;
/*!40000 ALTER TABLE `license` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `localization`
--

DROP TABLE IF EXISTS `localization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `localization` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `account_id` int NOT NULL,
  `reseller_id` int NOT NULL DEFAULT '0',
  `country_id` int NOT NULL,
  `in_caller_id_originate` varchar(200) NOT NULL,
  `out_caller_id_originate` varchar(200) NOT NULL,
  `number_originate` varchar(200) NOT NULL,
  `in_caller_id_terminate` varchar(200) NOT NULL,
  `out_caller_id_terminate` varchar(200) NOT NULL,
  `number_terminate` varchar(200) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `creation_date` datetime DEFAULT '1000-01-01 00:00:00',
  `modified_date` datetime DEFAULT '1000-01-01 00:00:00',
  `dst_base_cid` varchar(200) NOT NULL,
  `custom_rule` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `localization`
--

LOCK TABLES `localization` WRITE;
/*!40000 ALTER TABLE `localization` DISABLE KEYS */;
/*!40000 ALTER TABLE `localization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_activity_report`
--

DROP TABLE IF EXISTS `login_activity_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login_activity_report` (
  `id` int NOT NULL AUTO_INCREMENT,
  `account_id` int NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `country_name` varchar(200) NOT NULL,
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `timestamp` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ip` (`ip`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_activity_report`
--

LOCK TABLES `login_activity_report` WRITE;
/*!40000 ALTER TABLE `login_activity_report` DISABLE KEYS */;
INSERT INTO `login_activity_report` VALUES (1,1,'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36','','::1','2021-05-12 07:46:07');
/*!40000 ALTER TABLE `login_activity_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mail_details`
--

DROP TABLE IF EXISTS `mail_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mail_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `accountid` int NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `subject` varchar(100) NOT NULL,
  `body` mediumtext NOT NULL,
  `from` varchar(100) NOT NULL,
  `to` varchar(100) NOT NULL,
  `attachment` varchar(100) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 : Send 1: Not send',
  `emailstatus` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 : Send 1: Not send',
  `smsstatus` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 : Send 1: Not send',
  `alertstatus` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 : Send 1: Not send',
  `template` varchar(100) NOT NULL,
  `reseller_id` int NOT NULL DEFAULT '0',
  `to_number` varchar(20) NOT NULL,
  `sms_body` varchar(500) NOT NULL,
  `sip_user_name` varchar(255) NOT NULL,
  `push_message_body` varchar(555) NOT NULL,
  `callkit_token` varchar(512) NOT NULL,
  `status_code` int NOT NULL,
  `cc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mail_details`
--

LOCK TABLES `mail_details` WRITE;
/*!40000 ALTER TABLE `mail_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `mail_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_modules`
--

DROP TABLE IF EXISTS `menu_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_modules` (
  `id` int NOT NULL AUTO_INCREMENT,
  `menu_label` varchar(25) NOT NULL,
  `module_name` varchar(25) NOT NULL,
  `module_url` varchar(100) NOT NULL,
  `menu_title` varchar(20) NOT NULL,
  `menu_image` varchar(25) NOT NULL,
  `menu_subtitle` varchar(20) NOT NULL,
  `priority` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=805 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_modules`
--

LOCK TABLES `menu_modules` WRITE;
/*!40000 ALTER TABLE `menu_modules` DISABLE KEYS */;
INSERT INTO `menu_modules` VALUES (8,'Invoices','invoice','invoices/invoice_list/','Billing','InvoiceList.png','0',20.1),(9,'Company Profiles','invoice','invoices/invoice_conf_list/','Configuration','InvoiceConf.png','0',90.1),(10,'Calling Cards','callingcards','callingcards/callingcards_list/','Calling Cards','ListCards.png','0',30.1),(11,'Card Brands','brands','callingcards/brands/','Calling Cards','CCBand.png','0',30.2),(12,'Call Report','callingcards','callingcards/callingcards_cdrs/','Calling Cards','CallingCardCDR\'s.png','0',30.3),(13,'DIDs','did','did/did_list/','Inbound','ManageDIDs.png','0',30.1),(14,'Trunks','trunk','trunk/trunk_list/','Carriers','Trunks.png','0',50.2),(15,'Termination Rates','termination','rates/termination_rates_list/','Carriers','OutboundRoutes.png','0',50.3),(16,'Rate Groups','price','pricing/price_list/','Tariff','pricelist.png','0',40.1),(17,'Origination Rates','origination','rates/origination_rates_list/','Tariff','Routes.png','0',40.2),(20,'Live Calls','livecall','freeswitch/livecall_report/','Reports','cdr.png','0',89.2),(26,'Configuration','configuration','systems/configuration/','System Configuration','Configurations.png','System',90.1),(27,'Taxes','taxes','taxes/taxes_list/','Configuration','AccountTaxes.png','0',90.2),(28,'Templates','template','systems/template/','Configuration','TemplateManagement.png','0',90.3),(29,'Opensips devices','opensips','opensips/opensips_list/','Switch','OpensipDevices.png','0',90.2),(30,'Dispatcher list','dispatcher','opensips/dispatcher_list/','Switch','Dispatcher.png','0',90.3),(31,'Invoices','user','user/user_invoices_list/','Billing','ListAccounts.png','0',1.1),(32,'DIDs','user','user/user_didlist/','Inbound','ManageDIDs.png','0',2.1),(33,'Pinless CLI','user','user/user_animap_list/','Calling Card','Providers.png','0',4.2),(34,'CDRs','user','user/user_cdrs_report/','Reports','cdr.png','0',5.1),(35,'Refill Report','user','user/user_refill_report/','Billing','PaymentReport.png','0',1.3),(36,'SIP Devices','user','user/user_sipdevices/','My Account','freeswitch.png','0',7.2),(37,'Rates','user','user/user_rates_list/','Rates','Routes.png','0',6.1),(40,'Refill Report','refillreport','reports/refillreport/','Billing','PaymentReport.png','0',20.2),(41,'Gateways','fsgateway','freeswitch/fsgateway/','Carriers','Gateway.png','0',50.1),(42,'SIP Profiles','fssipprofile','freeswitch/fssipprofile/','Switch','SipProfiles.png','0',70.1),(43,'FreeSwitch Servers','fsserver','freeswitch/fsserver_list/','Switch','freeswitch.png','0',70.2),(48,'Countries','country','systems/country_list/','Configuration','ManageDIDs.png','0',90.4),(49,'Currencies ','currency','systems/currency_list/','Configuration','ManageDIDs.png','0',90.5),(52,'My Rates','resellersrates','rates/resellersrates_list/','Tariff','OutboundRoutes.png','0',52.1),(56,'Mass Email','email','email/email_mass/','Services','email.jpg','0',60.4),(58,'Opensips','Configuration','systems/configuration/opensips','Configuration','','Settings',80.8),(59,'Callingcard','Configuration','systems/configuration/callingcard','Configuration','','Settings',80.9),(60,'Freeswitch','Configuration','systems/configuration/freeswitch','Configuration','','Settings',80.1),(61,'Paypal','configuration','systems/configuration/paypal','Configuration','','Settings',80.11),(62,'Mass Email1','Configuration','systems/configuration/email','Configuration','','Settings',80.12),(63,'Send Credit','customer','user/user_fund_transfer/','Services','ListAccounts.png','0',3.3),(65,'Signup','Configuration','systems/configuration/signup/','Configuration','','Settings',81),(66,'Refill Coupons','refill','refill_coupon/refill_coupon_list/','Services','cdr.png','0',60.3),(68,'Charges History','charges','reports/charges_history/','Billing','PaymentReport.png','0',20.3),(70,'Charges History','user','user/user_charges_history/','Billing','PaymentReport.png','0',1.2),(72,'IP Settings','user','user/user_ipmap/','My Account','PaymentReport.png','0',7.3),(73,'Alert Threshold','user','user/user_alert_threshold/','My Account','PaymentReport.png','0',7.5),(74,'Speed Dial','user','user/user_speeddial/','My Account','freeswitch.png','0',7.4),(75,'Provider Outbound','user','user/user_provider_cdrs_report/','Reports','cdr.png','0',4.3),(76,'Opensips','user','user/user_opensips/','Configuration','OpensipDevices.png','0',90.2),(77,'','addons','addons/addons_list/','','','0',74),(79,'Ratedeck','ratedeck','ratedeck/ratedeck_list/','Tariff','Routes.png','0',40.3),(88,'Call Types','calltype','calltype/calltype_list/','Tariff','packages.png','0',55),(89,'Access Numbers','accessnumber','accessnumber/accessnumber_list/','Inbound','','0',30.3),(91,'Products','products','products/products_list/','Services','Routes.png','0',60.1),(92,'Orders','orders','orders/orders_list/','Services','Routes.png','0',60.2),(100,'Customers','accounts','accounts/customer_list/','Accounts','ListAccounts.png','Customers',10.1),(121,'Localizations','localization','localization/localization_list/','Switch','','0',70.4),(139,'Call Barring','callbarring','callbarring/callbarring_list/','Switch','','0',70.5),(149,'SIP Devices','fssipdevices','freeswitch/fssipdevices/','Accounts','Devices.png','Customers',10.2),(150,'IP Settings','ipmap','ipmap/ipmap_detail/','Accounts','Gateway.png','Customers',10.3),(151,'Caller IDs','animap','animap/animap_detail/','Accounts','Gateway.png','Customers',10.4),(152,'Resellers','reseller','accounts/reseller_list/','Accounts','reseller.png','0',10.4),(153,'Admins','admin','accounts/admin_list/','Accounts','ListAccounts.png','0',10.5),(154,'Roles & Permission','permissions','permissions/permissions_list/','Accounts','','0',10.6),(165,'Customer','customerReport','reports/customerReport/','Reports','cdr.png','Call Detail Reports',80.1),(166,'Reseller','resellerReport','reports/resellerReport/','Reports','cdr.png','Call Detail Reports',80.2),(167,'Provider Outbound','providerReport','reports/providerReport/','Reports','cdr.png','Call Detail Reports',80.3),(168,'Customer Summary','customer','summary/customer/','Reports','cdr.png','Call Summary Reports',81.1),(169,'Reseller Summary','reseller','summary/reseller/','Reports','cdr.png','Call Summary Reports',81.2),(170,'Provider Summary','provider','summary/provider/','Reports','cdr.png','Call Summary Reports',81.3),(171,'Notifications','notification','notification/notification_list/','Reports','ListAccounts.png','0',82.1),(172,'Audit Log','audit','audit/audit_list/','Reports','','0',82.2),(177,'Database Backup','database','systems/database_restore/','Configuration','Configurations.png','0',90.6),(179,'Crons','cronsettings','cronsettings/cronsettings_list/','Configuration','Configurations.png','0',90.8),(180,'Settings','configuration','systems/configuration/global','Configuration','Configurations.png','0',90.9),(182,'My Order','user','user/user_products_list/','Services','ListAccounts.png','0',3.1),(183,'Settings','configuration','systems/configuration/payment_methods','Configuration','Configurations.png','0',90.12),(396,'Order New','user','user/user_available_products/','Services','Routes.png','0',3.2),(398,'Access Numbers','accessnumber','accessnumber/accessnumber_list/','Calling Card','','0',4.1),(399,'Profile','user','user/user_myprofile/','My Account','0','0',7.1),(400,'Dashboard','user','user/user/','Home','','0',0),(401,'Change Password','user','user/user_change_password','My Account','0','0',7.6),(548,'TopUp','products','products/products_topuplist/','Services','Routes.png','0',60.4),(550,'Refill Coupon','refill','user/user_refill_coupon_list/','Services','ListAccounts.png','0',3.4),(555,'Pin','user','user/user_pin_add/','Calling Card','','0',4.3),(556,'Product Summary Reports','product','summary/product/','Reports','ListAccounts.png','0',82.4),(557,'Languages','languages','systems/languages_list/','Configuration','Configurations.png','Languages',91.1),(558,'Translations','translation','systems/translation_list/','Configuration','Configurations.png','Languages',91.2),(559,'Bulk DID Purchase','did_purchase','did_purchase/did_purchase_list/','Inbound','','0',31.2),(560,'Commission Report','commission','reports/commission_report_list/','Billing','0','0',83.1),(561,'Bulk DID Assign','did_purchase','did_purchase/did_purchase_list/','Inbound','','0',31.22),(800,'Notifications','user','user/user_notification_list/','Reports','','0',82.1),(801,'Timezone','systems','systems/timezone_list/','Configuration','','0',90.7),(802,'Activity Report','activity_report','activity_report/activityReport/','Reports','','0',82.1),(803,'Low Balance','low_balance','low_balance/low_balance_list/','Reports','','0',89.3),(804,'Live Calls','user','user/user_livecall_report/','Reports','','0',89.5);
/*!40000 ALTER TABLE `menu_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `product_category` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL DEFAULT '1',
  `price` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `setup_fee` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `billing_type` int NOT NULL,
  `billing_days` int NOT NULL DEFAULT '0',
  `free_minutes` int NOT NULL DEFAULT '0',
  `accountid` int NOT NULL,
  `reseller_id` int NOT NULL,
  `billing_date` datetime NOT NULL,
  `next_billing_date` datetime NOT NULL,
  `is_terminated` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 FOR NO AND 1 FOR YES',
  `termination_date` datetime NOT NULL,
  `termination_note` varchar(255) NOT NULL,
  `from_currency` varchar(3) NOT NULL,
  `exchange_rate` decimal(10,5) NOT NULL DEFAULT '1.00000',
  `to_currency` varchar(3) NOT NULL,
  `pro_rate` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` varchar(50) NOT NULL,
  `parent_order_id` int NOT NULL,
  `order_date` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `order_generated_by` int NOT NULL,
  `payment_gateway` varchar(50) NOT NULL,
  `payment_status` varchar(20) NOT NULL,
  `accountid` int NOT NULL,
  `reseller_id` int NOT NULL,
  `ip` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `outbound_routes`
--

DROP TABLE IF EXISTS `outbound_routes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `outbound_routes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pattern` varchar(15) DEFAULT NULL,
  `comment` varchar(80) DEFAULT '',
  `connectcost` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `includedseconds` int NOT NULL DEFAULT '0',
  `cost` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `trunk_id` int NOT NULL DEFAULT '0',
  `inc` int NOT NULL,
  `strip` varchar(40) NOT NULL DEFAULT '',
  `prepend` varchar(40) NOT NULL DEFAULT '',
  `precedence` int NOT NULL DEFAULT '0',
  `reseller_id` int NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 for active 1 for inactive',
  `init_inc` int NOT NULL DEFAULT '0',
  `creation_date` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `last_modified_date` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `effective_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pattern2` (`pattern`,`trunk_id`,`effective_date`) USING BTREE,
  KEY `trunk` (`trunk_id`),
  KEY `pattern` (`pattern`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `outbound_routes`
--

LOCK TABLES `outbound_routes` WRITE;
/*!40000 ALTER TABLE `outbound_routes` DISABLE KEYS */;
INSERT INTO `outbound_routes` VALUES (1,'^1.*','USA',0.00000,0,0.10000,1,60,'','',0,0,0,30,'2016-07-26 20:12:02','2016-07-26 20:12:49','2021-05-12 11:32:26');
/*!40000 ALTER TABLE `outbound_routes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `package_patterns`
--

DROP TABLE IF EXISTS `package_patterns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `package_patterns` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `country_id` int NOT NULL DEFAULT '0',
  `patterns` varchar(50) NOT NULL,
  `destination` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_id` (`product_id`,`country_id`,`patterns`),
  KEY `package_id` (`product_id`),
  KEY `patterns` (`patterns`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `package_patterns`
--

LOCK TABLES `package_patterns` WRITE;
/*!40000 ALTER TABLE `package_patterns` DISABLE KEYS */;
/*!40000 ALTER TABLE `package_patterns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `packages_view`
--

DROP TABLE IF EXISTS `packages_view`;
/*!50001 DROP VIEW IF EXISTS `packages_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `packages_view` AS SELECT 
 1 AS `id`,
 1 AS `product_id`,
 1 AS `package_name`,
 1 AS `free_minutes`,
 1 AS `applicable_for`,
 1 AS `accountid`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `payment_transaction`
--

DROP TABLE IF EXISTS `payment_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_transaction` (
  `id` int NOT NULL AUTO_INCREMENT,
  `accountid` int NOT NULL,
  `amount` decimal(20,5) NOT NULL,
  `tax` varchar(10) NOT NULL,
  `payment_method` varchar(20) NOT NULL,
  `actual_amount` decimal(20,5) NOT NULL,
  `payment_fee` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `reseller_id` int NOT NULL DEFAULT '0',
  `transaction_id` varchar(50) NOT NULL,
  `customer_ip` varchar(100) NOT NULL,
  `user_currency` varchar(50) NOT NULL,
  `currency_rate` decimal(10,5) NOT NULL COMMENT 'user currency rate against base currency rate',
  `transaction_details` mediumtext NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `notes` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_transaction`
--

LOCK TABLES `payment_transaction` WRITE;
/*!40000 ALTER TABLE `payment_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `reseller_id` int NOT NULL DEFAULT '0',
  `description` mediumtext NOT NULL,
  `login_type` tinyint(1) NOT NULL DEFAULT '0',
  `permissions` mediumtext NOT NULL,
  `edit_permissions` longtext NOT NULL,
  `creation_date` datetime NOT NULL,
  `modification_date` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (2,'Reseller',0,'reseller',1,'{\"accounts\":{\"customer_list\":{\"main\":\"0\",\"list\":\"0\",\"create\":\"0\",\"mass_create\":\"0\",\"export\":\"0\",\"delete\":\"0\",\"edit\":\"0\",\"callerid\":\"0\",\"payment\":\"0\",\"search\":\"0\",\"batch_update\":\"0\"},\"reseller_list\":{\"main\":\"0\",\"list\":\"0\",\"create\":\"0\",\"export\":\"0\",\"delete\":\"0\",\"edit\":\"0\",\"callerid\":\"0\",\"payment\":\"0\",\"search\":\"0\",\"batch_update\":\"0\"}},\"freeswitch\":{\"fssipdevices\":{\"main\":\"0\",\"list\":\"0\",\"create\":\"0\",\"delete\":\"0\",\"edit\":\"0\",\"search\":\"0\"},\"livecall_report\":{\"main\":\"0\",\"list\":\"0\"}},\"ipmap\":{\"ipmap_detail\":{\"main\":\"0\",\"list\":\"0\",\"create\":\"0\",\"delete\":\"0\",\"edit\":\"0\",\"search\":\"0\"}},\"animap\":{\"animap_detail\":{\"main\":\"0\",\"list\":\"0\",\"create\":\"0\",\"delete\":\"0\",\"edit\":\"0\",\"search\":\"0\"}},\"permissions\":{\"permissions_list\":{\"main\":\"0\",\"list\":\"0\",\"create\":\"0\",\"delete\":\"0\",\"edit\":\"0\",\"search\":\"0\"}},\"invoices\":{\"invoice_list\":{\"main\":\"0\",\"list\":\"0\",\"download\":\"0\",\"edit\":\"0\",\"generate\":\"0\",\"search\":\"0\",\"delete\":\"0\",\"payment\":\"0\"},\"invoice_conf_list\":{\"main\":\"0\",\"list\":\"0\",\"edit\":\"0\"}},\"reports\":{\"refillreport\":{\"main\":\"0\",\"list\":\"0\",\"export\":\"0\",\"search\":\"0\"},\"charges_history\":{\"main\":\"0\",\"list\":\"0\",\"search\":\"0\"},\"commission_report_list\":{\"main\":\"0\",\"list\":\"0\",\"export\":\"0\",\"search\":\"0\",\"edit\":\"0\"},\"customerReport\":{\"main\":\"0\",\"list\":\"0\",\"export\":\"0\",\"search\":\"0\"},\"resellerReport\":{\"main\":\"0\",\"list\":\"0\",\"export\":\"0\",\"search\":\"0\"}},\"did\":{\"did_list\":{\"main\":\"0\",\"list\":\"0\",\"delete\":\"0\",\"edit\":\"0\",\"forward\":\"0\",\"search\":\"0\",\"purchase\":\"0\",\"buy_did\":\"0\",\"available_did\":\"0\",\"batch_update\":\"0\"},\"did_available_list\":{\"main\":\"0\",\"list\":\"0\",\"search\":\"0\"}},\"accessnumber\":{\"accessnumber_list\":{\"main\":\"0\",\"list\":\"0\",\"search\":\"0\"}},\"did_purchase\":{\"did_purchase_list\":{\"main\":\"0\",\"list\":\"0\",\"assign\":\"0\",\"assign_to_reseller\":\"0\"}},\"pricing\":{\"price_list\":{\"main\":\"0\",\"list\":\"0\",\"create\":\"0\",\"delete\":\"0\",\"edit\":\"0\",\"search\":\"0\",\"duplicate\":\"0\"}},\"rates\":{\"origination_rates_list\":{\"main\":\"0\",\"list\":\"0\",\"create\":\"0\",\"export\":\"0\",\"import\":\"0\",\"delete\":\"0\",\"edit\":\"0\",\"search\":\"0\",\"batch_update\":\"0\"},\"resellersrates_list\":{\"main\":\"0\",\"list\":\"0\",\"search\":\"0\",\"export\":\"0\"}},\"products\":{\"products_list\":{\"main\":\"0\",\"list\":\"0\",\"create\":\"0\",\"delete\":\"0\",\"edit\":\"0\",\"search\":\"0\"},\"products_listing\":{\"main\":\"0\",\"list\":\"0\",\"search\":\"0\"},\"products_topuplist\":{\"main\":\"0\",\"list\":\"0\",\"create\":\"0\",\"delete\":\"0\",\"edit\":\"0\",\"search\":\"0\",\"payment\":\"0\"}},\"orders\":{\"orders_list\":{\"main\":\"0\",\"list\":\"0\",\"new\":\"0\",\"edit\":\"0\",\"search\":\"0\"}},\"refill_coupon\":{\"refill_coupon_list\":{\"main\":\"0\",\"list\":\"0\",\"search\":\"0\",\"create\":\"0\",\"export\":\"0\",\"import\":\"0\",\"delete\":\"0\"}},\"summary\":{\"customer\":{\"main\":\"0\",\"list\":\"0\",\"export\":\"0\",\"search\":\"0\"},\"reseller\":{\"main\":\"0\",\"list\":\"0\",\"export\":\"0\",\"search\":\"0\"},\"product\":{\"main\":\"0\",\"list\":\"0\",\"search\":\"0\",\"export\":\"0\"}},\"notification\":{\"notification_list\":{\"main\":\"0\",\"list\":\"0\",\"search\":\"0\"}},\"systems\":{\"template\":{\"main\":\"0\",\"list\":\"0\",\"edit\":\"0\",\"search\":\"0\"}}}','','2019-06-04 11:58:46','2021-05-12 07:48:00'),(3,'Admin_permission',0,'Permissions',0,'{\"accounts\":{\"customer_list\":{\"main\":\"0\",\"list\":\"0\",\"create\":\"0\",\"mass_create\":\"0\",\"create_provider\":\"0\",\"export\":\"0\",\"import\":\"0\",\"delete\":\"0\",\"edit\":\"0\",\"callerid\":\"0\",\"payment\":\"0\",\"search\":\"0\",\"batch_update\":\"0\"},\"reseller_list\":{\"main\":\"0\",\"list\":\"0\",\"create\":\"0\",\"export\":\"0\",\"delete\":\"0\",\"edit\":\"0\",\"search\":\"0\",\"payment\":\"0\"},\"admin_list\":{\"main\":\"0\",\"list\":\"0\",\"create_admin\":\"0\",\"delete\":\"0\",\"edit\":\"0\",\"search\":\"0\"}},\"freeswitch\":{\"fssipdevices\":{\"main\":\"0\",\"list\":\"0\",\"create\":\"0\",\"delete\":\"0\",\"edit\":\"0\",\"search\":\"0\"},\"fsgateway\":{\"main\":\"0\",\"list\":\"0\",\"create\":\"0\",\"edit\":\"0\",\"delete\":\"0\",\"search\":\"0\"},\"fssipprofile\":{\"main\":\"0\",\"list\":\"0\",\"create\":\"0\",\"delete\":\"0\",\"edit\":\"0\",\"search\":\"0\"},\"fsserver_list\":{\"main\":\"0\",\"list\":\"0\",\"create\":\"0\",\"delete\":\"0\",\"edit\":\"0\",\"search\":\"0\"},\"livecall_report\":{\"main\":\"0\",\"list\":\"0\"}},\"ipmap\":{\"ipmap_detail\":{\"main\":\"0\",\"list\":\"0\",\"create\":\"0\",\"delete\":\"0\",\"edit\":\"0\",\"search\":\"0\"}},\"animap\":{\"animap_detail\":{\"main\":\"0\",\"list\":\"0\",\"create\":\"0\",\"delete\":\"0\",\"edit\":\"0\",\"search\":\"0\"}},\"permissions\":{\"permissions_list\":{\"main\":\"0\",\"list\":\"0\",\"create\":\"0\",\"delete\":\"0\",\"edit\":\"0\",\"search\":\"0\"}},\"invoices\":{\"invoice_list\":{\"main\":\"0\",\"list\":\"0\",\"download\":\"0\",\"edit\":\"0\",\"generate\":\"0\",\"search\":\"0\",\"delete\":\"0\"},\"invoice_conf_list\":{\"main\":\"0\",\"list\":\"0\"}},\"reports\":{\"refillreport\":{\"main\":\"0\",\"list\":\"0\",\"export\":\"0\",\"search\":\"0\"},\"charges_history\":{\"main\":\"0\",\"list\":\"0\",\"search\":\"0\"},\"commission_report_list\":{\"main\":\"0\",\"list\":\"0\",\"export\":\"0\",\"search\":\"0\"},\"customerReport\":{\"main\":\"0\",\"list\":\"0\",\"export\":\"0\",\"search\":\"0\"},\"resellerReport\":{\"main\":\"0\",\"list\":\"0\",\"export\":\"0\",\"search\":\"0\"},\"providerReport\":{\"main\":\"0\",\"list\":\"0\",\"export\":\"0\",\"search\":\"0\"}},\"did\":{\"did_list\":{\"main\":\"0\",\"list\":\"0\",\"create\":\"0\",\"export\":\"0\",\"import\":\"0\",\"delete\":\"0\",\"edit\":\"0\",\"forward\":\"0\",\"search\":\"0\",\"purchase\":\"0\"}},\"accessnumber\":{\"accessnumber_list\":{\"main\":\"0\",\"list\":\"0\",\"export\":\"0\",\"import\":\"0\",\"delete\":\"0\",\"edit\":\"0\",\"search\":\"0\"}},\"did_purchase\":{\"did_purchase_list\":{\"main\":\"0\",\"list\":\"0\",\"assign\":\"0\",\"assign_to_reseller\":\"0\"}},\"pricing\":{\"price_list\":{\"main\":\"0\",\"list\":\"0\",\"create\":\"0\",\"delete\":\"0\",\"edit\":\"0\",\"search\":\"0\",\"duplicate\":\"0\"}},\"rates\":{\"origination_rates_list\":{\"main\":\"0\",\"list\":\"0\",\"create\":\"0\",\"export\":\"0\",\"import\":\"0\",\"delete\":\"0\",\"edit\":\"0\",\"search\":\"0\",\"batch_update\":\"0\"},\"termination_rates_list\":{\"main\":\"0\",\"list\":\"0\",\"create\":\"0\",\"export\":\"0\",\"import\":\"0\",\"import_with_field_map\":\"0\",\"delete\":\"0\",\"edit\":\"0\",\"search\":\"0\",\"batch_update\":\"0\"}},\"ratedeck\":{\"ratedeck_list\":{\"main\":\"0\",\"list\":\"0\",\"create\":\"0\",\"export\":\"0\",\"import\":\"0\",\"delete\":\"0\",\"edit\":\"0\",\"search\":\"0\"}},\"calltype\":{\"calltype_list\":{\"main\":\"0\",\"list\":\"0\",\"create\":\"0\",\"delete\":\"0\",\"edit\":\"0\",\"search\":\"0\"}},\"trunk\":{\"trunk_list\":{\"main\":\"0\",\"list\":\"0\",\"create\":\"0\",\"edit\":\"0\",\"delete\":\"0\",\"search\":\"0\"}},\"products\":{\"products_list\":{\"main\":\"0\",\"list\":\"0\",\"create\":\"0\",\"assign\":\"0\",\"delete\":\"0\",\"edit\":\"0\",\"search\":\"0\"}},\"orders\":{\"orders_list\":{\"main\":\"0\",\"list\":\"0\",\"new\":\"0\",\"edit\":\"0\",\"search\":\"0\"}},\"refill_coupon\":{\"refill_coupon_list\":{\"main\":\"0\",\"list\":\"0\",\"create\":\"0\",\"delete\":\"0\",\"export\":\"0\",\"search\":\"0\"}},\"email\":{\"email_mass\":{\"main\":\"0\",\"list\":\"0\"}},\"opensips\":{\"dispatcher_list\":{\"main\":\"0\",\"list\":\"0\",\"create\":\"0\",\"delete\":\"0\",\"edit\":\"0\",\"search\":\"0\"}},\"localization\":{\"localization_list\":{\"main\":\"0\",\"list\":\"0\",\"create\":\"0\",\"delete\":\"0\",\"edit\":\"0\",\"search\":\"0\"}},\"callbarring\":{\"callbarring_list\":{\"main\":\"0\",\"list\":\"0\",\"create\":\"0\",\"delete\":\"0\",\"edit\":\"0\",\"search\":\"0\"}},\"summary\":{\"customer\":{\"main\":\"0\",\"list\":\"0\",\"export\":\"0\",\"search\":\"0\"},\"reseller\":{\"main\":\"0\",\"list\":\"0\",\"export\":\"0\",\"search\":\"0\"},\"provider\":{\"main\":\"0\",\"list\":\"0\",\"export\":\"0\",\"search\":\"0\"},\"product\":{\"main\":\"0\",\"list\":\"0\",\"search\":\"0\",\"export\":\"0\"}},\"notification\":{\"notification_list\":{\"main\":\"0\",\"list\":\"0\",\"search\":\"0\"}},\"low_balance\":{\"low_balance_list\":{\"main\":\"0\",\"list\":\"0\",\"search\":\"0\"}},\"audit\":{\"audit_list\":{\"main\":\"0\",\"list\":\"0\",\"search\":\"0\"}},\"activity_report\":{\"activityReport\":{\"main\":\"0\",\"list\":\"0\",\"search\":\"0\",\"export\":\"0\"}},\"taxes\":{\"taxes_list\":{\"main\":\"0\",\"list\":\"0\",\"create\":\"0\",\"delete\":\"0\",\"edit\":\"0\",\"search\":\"0\"}},\"systems\":{\"template\":{\"main\":\"0\",\"list\":\"0\",\"edit\":\"0\",\"search\":\"0\"},\"country_list\":{\"main\":\"0\",\"list\":\"0\",\"create\":\"0\",\"edit\":\"0\",\"search\":\"0\",\"delete\":\"0\"},\"currency_list\":{\"main\":\"0\",\"list\":\"0\",\"create\":\"0\",\"delete\":\"0\",\"edit\":\"0\",\"search\":\"0\",\"currencies_update\":\"0\"},\"database_restore\":{\"main\":\"0\",\"list\":\"0\",\"create\":\"0\",\"import\":\"0\",\"delete\":\"0\"},\"languages_list\":{\"main\":\"0\",\"list\":\"0\",\"export\":\"0\",\"search\":\"0\",\"delete\":\"0\",\"default_language\":\"0\"},\"translation_list\":{\"main\":\"0\",\"list\":\"0\",\"create\":\"0\",\"edit\":\"0\",\"delete\":\"0\"},\"global\":{\"main\":\"0\",\"list\":\"0\"}},\"cronsettings\":{\"cronsettings_list\":{\"main\":\"0\",\"list\":\"0\",\"create\":\"0\",\"edit\":\"0\",\"search\":\"0\",\"delete\":\"0\"}}}','null','2019-01-26 07:41:03','2021-05-12 07:47:17'),(4,'Customer_permission',0,'Customer Permissions',2,'{\"user\":{\"user_invoices_list\":{\"main\":\"0\",\"list\":\"0\",\"search\":\"0\"},\"user_charges_history\":{\"main\":\"0\",\"list\":\"0\",\"search\":\"0\"},\"user_refill_report\":{\"main\":\"0\",\"list\":\"0\",\"search\":\"0\"},\"user_didlist\":{\"main\":\"0\",\"list\":\"0\",\"search\":\"0\",\"batch_update\":\"0\",\"purchase\":\"0\"},\"user_products_list\":{\"main\":\"0\",\"list\":\"0\",\"search\":\"0\"},\"user_available_products\":{\"main\":\"0\",\"list\":\"0\"},\"user_fund_transfer\":{\"main\":\"0\",\"list\":\"0\"},\"user_refill_coupon_list\":{\"main\":\"0\",\"list\":\"0\"},\"user_animap_list\":{\"main\":\"0\",\"list\":\"0\",\"create\":\"0\",\"delete\":\"0\"},\"user_pin_add\":{\"main\":\"0\",\"list\":\"0\"},\"user_cdrs_report\":{\"main\":\"0\",\"list\":\"0\",\"search\":\"0\",\"export\":\"0\"},\"user_notification_list\":{\"main\":\"0\",\"list\":\"0\",\"search\":\"0\"},\"user_livecall_report\":{\"main\":\"0\",\"list\":\"0\"},\"user_rates_list\":{\"main\":\"0\",\"list\":\"0\",\"search\":\"0\",\"export\":\"0\"},\"user_myprofile\":{\"main\":\"0\",\"list\":\"0\"},\"user_sipdevices\":{\"main\":\"0\",\"list\":\"0\",\"create\":\"0\",\"edit\":\"0\",\"delete\":\"0\",\"search\":\"0\"},\"user_speeddial\":{\"main\":\"0\",\"list\":\"0\",\"edit\":\"0\",\"delete\":\"0\"},\"user_alert_threshold\":{\"main\":\"0\",\"list\":\"0\"},\"user_change_password\":{\"main\":\"0\",\"list\":\"0\"}},\"did_purchase\":{\"did_purchase_list\":{\"main\":\"0\",\"list\":\"0\"}},\"products\":{\"products_topuplist\":{\"main\":\"0\",\"list\":\"0\"}},\"accessnumber\":{\"accessnumber_list\":{\"main\":\"0\",\"list\":\"0\",\"search\":\"0\",\"export\":\"0\"}}}','','2020-12-23 04:37:24','2021-05-12 07:47:38');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pricelists`
--

DROP TABLE IF EXISTS `pricelists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pricelists` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '',
  `markup` varchar(50) NOT NULL DEFAULT '0',
  `routing_type` tinyint(1) NOT NULL DEFAULT '0',
  `initially_increment` int NOT NULL,
  `inc` int NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 for active,1 for inactive,2 for delete',
  `reseller_id` int NOT NULL DEFAULT '0' COMMENT 'Accounts table id',
  `pricelist_id_admin` int NOT NULL DEFAULT '0',
  `routing_prefix` varchar(100) NOT NULL,
  `call_count` int NOT NULL DEFAULT '0',
  `creation_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `reseller_id` (`reseller_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pricelists`
--

LOCK TABLES `pricelists` WRITE;
/*!40000 ALTER TABLE `pricelists` DISABLE KEYS */;
INSERT INTO `pricelists` VALUES (1,'default','0',0,0,60,0,0,0,'',0,'2016-07-25 00:00:00','2016-07-26 00:00:00');
/*!40000 ALTER TABLE `pricelists` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `updateRates` AFTER UPDATE ON `pricelists` FOR EACH ROW BEGIN
   if new.status = '2'
   then
       Delete from routes where pricelist_id = new.id;
   end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `country_id` int NOT NULL,
  `description` varchar(500) NOT NULL,
  `product_category` int NOT NULL,
  `buy_cost` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `price` decimal(20,5) DEFAULT '0.00000',
  `setup_fee` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `can_resell` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 for no,0 for yes',
  `commission` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `billing_type` tinyint(1) NOT NULL,
  `billing_days` int NOT NULL DEFAULT '0',
  `free_minutes` int NOT NULL DEFAULT '0',
  `applicable_for` int NOT NULL,
  `apply_on_existing_account` tinyint(1) NOT NULL,
  `apply_on_rategroups` varchar(50) NOT NULL,
  `destination_rategroups` varchar(50) NOT NULL,
  `destination_countries` varchar(256) NOT NULL,
  `destination_calltypes` varchar(50) NOT NULL,
  `release_no_balance` tinyint(1) NOT NULL,
  `can_purchase` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 for yes, 1 for no',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 for active,1 for inactive',
  `is_deleted` tinyint NOT NULL DEFAULT '0' COMMENT '0 for no,1 for yes',
  `created_by` int NOT NULL,
  `reseller_id` int NOT NULL,
  `creation_date` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `last_modified_date` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `pro_rate` int NOT NULL DEFAULT '0' COMMENT '0 for full price, 1 for max days, 2 from max minute, 3 for 1 or 2 both of one max',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provider_cdr_summary`
--

DROP TABLE IF EXISTS `provider_cdr_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provider_cdr_summary` (
  `date_hour` varchar(25) NOT NULL,
  `country_id` int NOT NULL,
  `provider_id` int NOT NULL,
  `trunk_id` int NOT NULL,
  `total_calls` int NOT NULL,
  `answered_calls` int NOT NULL,
  `minutes` varchar(50) NOT NULL,
  `cost` decimal(15,3) NOT NULL,
  PRIMARY KEY (`date_hour`,`country_id`,`provider_id`,`trunk_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provider_cdr_summary`
--

LOCK TABLES `provider_cdr_summary` WRITE;
/*!40000 ALTER TABLE `provider_cdr_summary` DISABLE KEYS */;
/*!40000 ALTER TABLE `provider_cdr_summary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `q850code`
--

DROP TABLE IF EXISTS `q850code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `q850code` (
  `cause` varchar(70) NOT NULL,
  `code` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `q850code`
--

LOCK TABLES `q850code` WRITE;
/*!40000 ALTER TABLE `q850code` DISABLE KEYS */;
INSERT INTO `q850code` VALUES ('UNSPECIFIED',0),('UNALLOCATED_NUMBER',1),('NO_ROUTE_TRANSIT_NET',2),('NO_ROUTE_DESTINATION',3),('CHANNEL_UNACCEPTABLE',6),('CALL_AWARDED_DELIVERED',7),('NORMAL_CLEARING',16),('USER_BUSY',17),('NO_USER_RESPONSE',18),('NO_ANSWER',19),('SUBSCRIBER_ABSENT',20),('CALL_REJECTED',21),('NUMBER_CHANGED',22),('REDIRECTION_TO_NEW_DESTINATION',23),('EXCHANGE_ROUTING_ERROR',25),('DESTINATION_OUT_OF_ORDER',27),('INVALID_NUMBER_FORMAT',28),('FACILITY_REJECTED',29),('RESPONSE_TO_STATUS_ENQUIRY',30),('NORMAL_UNSPECIFIED',31),('NORMAL_CIRCUIT_CONGESTION',34),('NETWORK_OUT_OF_ORDER',38),('NORMAL_TEMPORARY_FAILURE',41),('SWITCH_CONGESTION',42),('ACCESS_INFO_DISCARDED',43),('REQUESTED_CHAN_UNAVAIL',44),('PRE_EMPTED',45),('FACILITY_NOT_SUBSCRIBED',50),('OUTGOING_CALL_BARRED',52),('INCOMING_CALL_BARRED',54),('BEARERCAPABILITY_NOTAUTH',57),('BEARERCAPABILITY_NOTAVAIL',58),('SERVICE_UNAVAILABLE',63),('BEARERCAPABILITY_NOTIMPL',65),('CHAN_NOT_IMPLEMENTED',66),('FACILITY_NOT_IMPLEMENTED',69),('SERVICE_NOT_IMPLEMENTED',79),('INVALID_CALL_REFERENCE',81),('INCOMPATIBLE_DESTINATION',88),('INVALID_MSG_UNSPECIFIED',95),('MANDATORY_IE_MISSING',96),('MESSAGE_TYPE_NONEXIST',97),('WRONG_MESSAGE',98),('IE_NONEXIST',99),('INVALID_IE_CONTENTS',100),('WRONG_CALL_STATE',101),('RECOVERY_ON_TIMER_EXPIRE',102),('MANDATORY_IE_LENGTH_ERROR',103),('PROTOCOL_ERROR',111),('INTERWORKING',127),('ORIGINATOR_CANCEL',487),('CRASH',500),('SYSTEM_SHUTDOWN',501),('LOSE_RACE',502),('MANAGER_REQUEST',503),('BLIND_TRANSFER',600),('ATTENDED_TRANSFER',601),('ALLOTTED_TIMEOUT',602),('USER_CHALLENGE',603),('MEDIA_TIMEOUT',604),('PICKED_OFF',605),('USER_NOT_REGISTERED',606),('PROGRESS_TIMEOUT',607),('GATEWAY_DOWN',609);
/*!40000 ALTER TABLE `q850code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ratedeck`
--

DROP TABLE IF EXISTS `ratedeck`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ratedeck` (
  `id` int NOT NULL AUTO_INCREMENT,
  `destination` varchar(80) NOT NULL,
  `country_id` int NOT NULL,
  `pattern` varchar(40) NOT NULL,
  `call_type` varchar(50) NOT NULL,
  `status` tinyint(1) NOT NULL COMMENT '1 = Disabled / Inactive / False / No , 0 = Enable / Active / True / Yes,2->Deleted',
  `reseller_id` int NOT NULL DEFAULT '0',
  `creation_date` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `last_modified_date` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  PRIMARY KEY (`id`),
  KEY `pattern` (`pattern`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ratedeck`
--

LOCK TABLES `ratedeck` WRITE;
/*!40000 ALTER TABLE `ratedeck` DISABLE KEYS */;
/*!40000 ALTER TABLE `ratedeck` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refill_coupon`
--

DROP TABLE IF EXISTS `refill_coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `refill_coupon` (
  `id` int NOT NULL AUTO_INCREMENT,
  `number` varchar(30) NOT NULL,
  `amount` decimal(20,5) NOT NULL,
  `description` varchar(55) NOT NULL,
  `status` tinyint(1) NOT NULL COMMENT '0=Active,1=Inactive,2-Inuse',
  `firstused` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `account_id` int NOT NULL,
  `reseller_id` int NOT NULL,
  `currency_id` int NOT NULL,
  `creation_date` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refill_coupon`
--

LOCK TABLES `refill_coupon` WRITE;
/*!40000 ALTER TABLE `refill_coupon` DISABLE KEYS */;
/*!40000 ALTER TABLE `refill_coupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reports_process_list`
--

DROP TABLE IF EXISTS `reports_process_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reports_process_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `last_execution_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reports_process_list`
--

LOCK TABLES `reports_process_list` WRITE;
/*!40000 ALTER TABLE `reports_process_list` DISABLE KEYS */;
INSERT INTO `reports_process_list` VALUES (1,'2021-05-12 06:03:01','get_cdr_records');
/*!40000 ALTER TABLE `reports_process_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reseller_cdrs`
--

DROP TABLE IF EXISTS `reseller_cdrs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reseller_cdrs` (
  `uniqueid` varchar(60) NOT NULL DEFAULT '',
  `accountid` int DEFAULT '0',
  `callerid` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `callednum` varchar(30) NOT NULL DEFAULT '',
  `translated_dst` varchar(30) NOT NULL,
  `billseconds` smallint NOT NULL DEFAULT '0',
  `disposition` varchar(45) NOT NULL DEFAULT '',
  `callstart` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `debit` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `cost` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `pricelist_id` smallint NOT NULL DEFAULT '0',
  `package_id` smallint NOT NULL DEFAULT '0',
  `pattern` varchar(20) NOT NULL,
  `notes` varchar(80) NOT NULL,
  `calltype` enum('STANDARD','DID','FREE','CALLINGCARD','FAX','LOCAL') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'STANDARD',
  `reseller_id` int NOT NULL DEFAULT '0',
  `rate_cost` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `reseller_code` varchar(20) NOT NULL DEFAULT '',
  `reseller_code_destination` varchar(80) NOT NULL DEFAULT '',
  `reseller_cost` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `call_direction` enum('outbound','inbound') NOT NULL,
  `call_request` tinyint NOT NULL DEFAULT '0',
  `country_id` int NOT NULL,
  `end_stamp` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `trunk_id` int NOT NULL,
  KEY `rs_cdr_index` (`callstart`,`reseller_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='cdrs';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reseller_cdrs`
--

LOCK TABLES `reseller_cdrs` WRITE;
/*!40000 ALTER TABLE `reseller_cdrs` DISABLE KEYS */;
/*!40000 ALTER TABLE `reseller_cdrs` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`astppuser`@`localhost`*/ /*!50003 TRIGGER `reseller_cdrs_records` AFTER INSERT ON `reseller_cdrs` FOR EACH ROW BEGIN
   INSERT INTO `cdrs_staging` (`uniqueid`, `accountid`, `callerid`, `callednum`, `billseconds`, `disposition`, `callstart`, `debit`, `cost`, `pricelist_id`, `package_id`, `pattern`, `notes`, `calltype`, `reseller_id`, `rate_cost`, `reseller_code`, `reseller_code_destination`, `reseller_cost`, `call_direction`, `call_request`, `country_id`,`end_stamp`) VALUES ( NEW.uniqueid, NEW.accountid, NEW.callerid, NEW.callednum, NEW.billseconds, NEW.disposition, NEW.callstart, NEW.debit, NEW.cost, NEW.pricelist_id, NEW.package_id, NEW.pattern, NEW.notes, NEW.calltype, NEW.reseller_id, NEW.rate_cost, NEW.reseller_code, NEW.reseller_code_destination, NEW.reseller_cost, NEW.call_direction, NEW.call_request, NEW.country_id,NEW.end_stamp);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `reseller_products`
--

DROP TABLE IF EXISTS `reseller_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reseller_products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `account_id` int NOT NULL,
  `reseller_id` int NOT NULL,
  `country_id` int NOT NULL,
  `status` tinyint NOT NULL,
  `buy_cost` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `price` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `free_minutes` int NOT NULL DEFAULT '0',
  `commission` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `setup_fee` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `billing_days` int NOT NULL,
  `billing_type` tinyint NOT NULL COMMENT '0 for onetime,1 for recurring',
  `is_owner` tinyint NOT NULL COMMENT '0 for yes, 1 for no',
  `is_optin` tinyint NOT NULL DEFAULT '1' COMMENT '0 for yes, 1 for no',
  `optin_date` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `modified_date` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_id` (`product_id`,`account_id`,`reseller_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reseller_products`
--

LOCK TABLES `reseller_products` WRITE;
/*!40000 ALTER TABLE `reseller_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `reseller_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles_and_permission`
--

DROP TABLE IF EXISTS `roles_and_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles_and_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `login_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:Admin,1:Reseller',
  `permission_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:Main,1:Edit',
  `menu_name` varchar(50) NOT NULL,
  `module_name` varchar(50) NOT NULL,
  `sub_module_name` varchar(50) NOT NULL,
  `module_url` varchar(50) NOT NULL,
  `display_name` varchar(100) NOT NULL,
  `permissions` mediumtext NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:Active,1:Inactive',
  `creation_date` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `priority` decimal(10,5) NOT NULL DEFAULT '0.00000',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=226 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles_and_permission`
--

LOCK TABLES `roles_and_permission` WRITE;
/*!40000 ALTER TABLE `roles_and_permission` DISABLE KEYS */;
INSERT INTO `roles_and_permission` VALUES (1,0,0,'accounts','accounts','customers','customer_list','Customers','[\"main\",\"list\",\"create\",\"mass_create\",\"create_provider\",\"export\",\"import\",\"delete\",\"edit\",\"callerid\",\"payment\",\"search\",\"batch_update\"]',0,'2019-01-25 09:01:03',1.10000),(2,0,0,'accounts','freeswitch','customers','fssipdevices','SIP Devices','[\"main\",\"list\",\"create\",\"delete\",\"edit\",\"search\"]',0,'2019-01-25 09:01:05',1.20000),(3,0,0,'accounts','ipmap','customers','ipmap_detail','IP Settings','[\"main\",\"list\",\"create\",\"delete\",\"edit\",\"search\"]',0,'2019-01-25 09:01:05',1.30000),(4,0,0,'accounts','animap','customers','animap_detail','Caller IDs','[\"main\",\"list\",\"create\",\"delete\",\"edit\",\"search\"]',0,'2019-01-25 09:01:05',1.40000),(5,0,0,'accounts','accounts','','reseller_list','Resellers','[\"main\",\"list\",\"create\",\"export\",\"delete\",\"edit\",\"search\",\"payment\"]',0,'2019-01-25 09:01:03',1.50000),(6,0,0,'accounts','accounts','','admin_list','Admins','[\"main\",\"list\",\"create_admin\",\"delete\",\"edit\",\"search\"]',0,'2019-01-25 09:01:03',1.60000),(7,0,0,'accounts','permissions','','permissions_list','Roles & Permission','[\"main\",\"list\",\"create\",\"delete\",\"edit\",\"search\"]',0,'2019-01-25 09:01:03',1.70000),(8,0,0,'billing','invoices','','invoice_list','Invoices','[\"main\",\"list\",\"download\",\"edit\",\"generate\",\"search\",\"delete\"]',0,'2019-01-25 09:01:03',2.10000),(9,0,0,'billing','reports','','refillreport','Refill Report','[\"main\",\"list\",\"export\",\"search\"]',0,'2019-01-25 09:01:03',2.20000),(12,0,0,'inbound','did','','did_list','DIDs','[\"main\",\"list\",\"create\",\"export\",\"import\",\"delete\",\"edit\",\"forward\",\"search\",\"purchase\"]',0,'2019-01-25 09:01:05',3.10000),(13,0,0,'inbound','accessnumber','','accessnumber_list','Access Numbers','[\"main\",\"list\",\"export\",\"import\",\"delete\",\"edit\",\"search\"]',0,'2019-01-25 09:01:05',3.20000),(14,0,0,'tariff','pricing','','price_list','Rate Groups','[\"main\",\"list\",\"create\",\"delete\",\"edit\",\"search\",\"duplicate\"]',0,'2019-01-25 09:01:05',4.10000),(15,0,0,'tariff','rates','','origination_rates_list','Origination Rates','[\"main\",\"list\",\"create\",\"export\",\"import\",\"delete\",\"edit\",\"search\",\"batch_update\"]',0,'2019-01-25 09:01:05',4.20000),(18,0,0,'services','products','','products_list','Products','[\"main\",\"list\",\"create\",\"assign\",\"delete\",\"edit\",\"search\"]',0,'2019-01-25 09:01:05',5.10000),(19,0,0,'services','orders','','orders_list','Orders','[\"main\",\"list\",\"new\",\"edit\",\"search\"]',0,'2019-01-25 09:01:05',5.20000),(21,0,0,'services','email','','email_mass','Mass Email','[\"main\",\"list\"]',0,'2019-01-25 09:01:05',5.40000),(23,0,0,'reports','freeswitch','','livecall_report','Live Calls','[\"main\",\"list\"]',0,'2019-01-25 09:01:05',7.70000),(26,0,0,'reports','reports','call_detail_reports','customerReport','Customer','[\"main\",\"list\",\"export\",\"search\"]',0,'2019-01-25 09:01:06',7.10000),(27,0,0,'reports','reports','call_detail_reports','resellerReport','Reseller','[\"main\",\"list\",\"export\",\"search\"]',0,'2019-01-25 09:01:06',7.20000),(28,0,0,'reports','reports','call_detail_reports','providerReport','Provider Outbound','[\"main\",\"list\",\"export\",\"search\"]',0,'2019-01-25 09:01:06',7.30000),(34,0,0,'reports','summary','product','product','Product Summary Report','[\"main\",\"list\",\"search\",\"export\"]',0,'2019-01-25 09:01:03',7.90000),(35,0,0,'configuration','invoices','','invoice_conf_list','Company Profile','[\"main\",\"list\",\"edit\"]',0,'2019-01-25 09:01:06',8.10000),(36,0,0,'configuration','taxes','','taxes_list','Taxes','[\"main\",\"list\",\"create\",\"delete\",\"edit\",\"search\"]',0,'2019-01-25 09:01:06',8.20000),(37,0,0,'configuration','systems','','template','Templates','[\"main\",\"list\",\"edit\",\"search\"]',0,'2019-01-25 09:01:06',8.30000),(39,1,0,'accounts','accounts','customers','customer_list','Customers','[\"main\",\"list\",\"create\",\"mass_create\",\"export\",\"delete\",\"edit\",\"callerid\",\"payment\",\"search\",\"batch_update\"]',0,'2019-01-25 09:01:03',1.10000),(40,1,0,'accounts','freeswitch','customers','fssipdevices','SIP Devices','[\"main\",\"list\",\"create\",\"delete\",\"edit\",\"search\"]',0,'2019-01-25 09:01:05',1.20000),(41,1,0,'accounts','ipmap','customers','ipmap_detail','IP Settings','[\"main\",\"list\",\"create\",\"delete\",\"edit\",\"search\"]',0,'2019-01-25 09:01:05',1.30000),(42,1,0,'accounts','animap','customers','animap_detail','Caller IDs','[\"main\",\"list\",\"create\",\"delete\",\"edit\",\"search\"]',0,'2019-01-25 09:01:05',1.40000),(43,1,0,'accounts','accounts','','reseller_list','Resellers','[\"main\",\"list\",\"create\",\"export\",\"delete\",\"edit\",\"callerid\",\"payment\",\"search\",\"batch_update\"]',0,'2019-01-25 09:01:03',1.50000),(44,1,0,'billing','invoices','','invoice_list','Invoices','[\"main\",\"list\",\"download\",\"edit\",\"generate\",\"search\",\"delete\",\"payment\"]',0,'2019-01-25 09:01:03',2.10000),(45,1,0,'billing','reports','','refillreport','Refill Report','[\"main\",\"list\",\"export\",\"search\"]',0,'2019-01-25 09:01:03',2.20000),(46,1,0,'billing','reports','','charges_history','Charges History','[\"main\",\"list\",\"search\"]',0,'2019-01-25 09:01:03',2.30000),(47,1,0,'billing','reports','commission_report','commission_report_list','Commission Reports','[\"main\",\"list\",\"export\",\"search\",\"edit\"]',0,'2019-01-25 09:01:06',2.40000),(49,1,0,'inbound','accessnumber','','accessnumber_list','Access Numbers','[\"main\",\"list\",\"search\"]',0,'2019-01-25 09:01:05',3.20000),(50,1,0,'tariff','pricing','','price_list','Rate Groups','[\"main\",\"list\",\"create\",\"delete\",\"edit\",\"search\",\"duplicate\"]',0,'2019-01-25 09:01:05',4.10000),(51,1,0,'tariff','rates','','origination_rates_list','Origination Rates','[\"main\",\"list\",\"create\",\"export\",\"import\",\"delete\",\"edit\",\"search\",\"batch_update\"]',0,'2019-01-25 09:01:05',4.20000),(52,1,0,'tariff','rates','resellersrates','resellersrates_list','My Rates','[\"main\",\"list\",\"search\",\"export\"]',0,'2019-01-25 09:01:03',4.30000),(53,1,0,'services','products','','products_list','Products','[\"main\",\"list\",\"create\",\"delete\",\"edit\",\"search\"]',0,'2019-01-25 09:01:05',5.10000),(54,1,0,'services','orders','','orders_list','Orders','[\"main\",\"list\",\"new\",\"edit\",\"search\"]',0,'2019-01-25 09:01:05',5.20000),(55,1,0,'services','products','','products_topuplist','TopUp','[\"main\",\"list\",\"create\",\"delete\",\"edit\",\"search\",\"payment\"]',0,'2019-02-04 11:49:27',5.30000),(56,1,0,'reports','reports','call_detail_reports','customerReport','Customer','[\"main\",\"list\",\"export\",\"search\"]',0,'2019-01-25 09:01:06',6.10000),(57,1,0,'reports','reports','call_detail_reports','resellerReport','Reseller','[\"main\",\"list\",\"export\",\"search\"]',0,'2019-01-25 09:01:06',6.20000),(58,1,0,'reports','summary','call_summary_reports','customer','Customer Summary','[\"main\",\"list\",\"export\",\"search\"]',0,'2019-01-25 09:01:06',6.30000),(59,1,0,'reports','summary','call_summary_reports','reseller','Reseller Summary','[\"main\",\"list\",\"export\",\"search\"]',0,'2019-01-25 09:01:06',6.40000),(60,1,0,'configuration','invoices','','invoice_conf_list','Company Profile','[\"main\",\"list\",\"edit\"]',0,'2019-01-25 09:01:06',7.10000),(61,1,0,'configuration','systems','','template','Templates','[\"main\",\"list\",\"edit\",\"search\"]',0,'2019-01-25 09:01:06',7.20000),(112,1,0,'services','refill_coupon','','refill_coupon_list','Refill Coupon','[\"main\",\"list\",\"search\",\"create\",\"export\",\"import\",\"delete\"]',0,'1000-01-01 00:00:00',5.30000),(113,1,0,'services','products','','products_listing','Parent Products','[\"main\",\"list\",\"search\"]',0,'1000-01-01 00:00:00',5.20000),(153,0,0,'switch','opensips','','dispatcher_list','Opensips Dispatcher','[\"main\",\"list\",\"create\",\"delete\",\"edit\",\"search\"]',0,'2019-01-25 09:01:05',6.10000),(168,1,0,'inbound','did','','did_available_list','Available DIDs','[\"main\",\"list\",\"search\"]',0,'2019-01-25 09:01:05',3.30000),(169,1,0,'inbound','did_purchase','','did_purchase_list','Bulk DID Purchase','[\"main\",\"list\",\"assign\",\"assign_to_reseller\"]',0,'2019-01-25 09:01:05',3.40000),(170,1,0,'reports','summary','product','product','Product Summary Report','[\"main\",\"list\",\"search\",\"export\"]',0,'2019-01-25 09:01:03',7.90000),(171,0,0,'inbound','did_purchase','','did_purchase_list','Bulk DID Assign	','[\"main\",\"list\",\"assign\",\"assign_to_reseller\"]',0,'1000-01-01 00:00:00',3.40000),(172,1,1,'inbound','did_purchase','','did_purchase_list','Bulk DID Purchase','[\"main\",\"list\",\"assign\"]',0,'1000-01-01 00:00:00',3.40000),(173,0,0,'services','refill_coupon','','refill_coupon_list','Refill Coupons','[\"main\",\"list\",\"create\",\"delete\",\"export\",\"search\"]',0,'2019-07-24 09:01:05',5.30000),(174,0,0,'carriers','freeswitch','','fsgateway','Gateways','[\"main\",\"list\",\"create\",\"edit\",\"delete\",\"search\"]',0,'2019-07-25 09:01:05',4.90000),(175,0,0,'carriers','trunk','','trunk_list','Trunks','[\"main\",\"list\",\"create\",\"edit\",\"delete\",\"search\"]',0,'2019-07-25 09:01:05',4.91000),(176,0,0,'carriers','rates','','termination_rates_list','Termination Rates','[\"main\",\"list\",\"create\",\"export\",\"import\",\"import_with_field_map\",\"delete\",\"edit\",\"search\",\"batch_update\"]',0,'2019-07-25 09:01:06',4.92000),(177,0,0,'billing','reports','','charges_history','Charges History','[\"main\",\"list\",\"search\"]',0,'2019-07-24 09:01:03',2.30000),(178,0,0,'billing','reports','','commission_report_list','Commission Report','[\"main\",\"list\",\"export\",\"search\"]',0,'2019-07-24 09:01:03',2.40000),(179,0,0,'tariff','ratedeck','','ratedeck_list','Ratedeck','[\"main\",\"list\",\"create\",\"export\",\"import\",\"delete\",\"edit\",\"search\"]',0,'2019-01-25 09:01:05',4.30000),(180,0,0,'tariff','calltype','','calltype_list','Call Types','[\"main\",\"list\",\"create\",\"delete\",\"edit\",\"search\"]',0,'2019-01-25 09:01:05',4.40000),(181,0,0,'switch','freeswitch','','fssipprofile','SIP Profiles','[\"main\",\"list\",\"create\",\"delete\",\"edit\",\"search\"]',0,'2019-01-25 09:01:05',6.11000),(182,0,0,'switch','freeswitch','','fsserver_list','FreeSwitch Servers','[\"main\",\"list\",\"create\",\"delete\",\"edit\",\"search\"]',0,'2019-01-25 09:01:05',6.12000),(183,0,0,'switch','localization','','localization_list','Localizations','[\"main\",\"list\",\"create\",\"delete\",\"edit\",\"search\"]',0,'2019-01-25 09:01:05',6.25000),(184,0,0,'switch','callbarring','','callbarring_list','Call Barring','[\"main\",\"list\",\"create\",\"delete\",\"edit\",\"search\"]',0,'2019-01-25 09:01:05',6.28000),(185,0,0,'reports','summary','call_summary_reports','customer','Customer Summary','[\"main\",\"list\",\"export\",\"search\"]',0,'2019-01-25 09:01:06',7.40000),(186,0,0,'reports','summary','call_summary_reports','reseller','Reseller Summary Report','[\"main\",\"list\",\"export\",\"search\"]',0,'2019-01-25 09:01:06',7.50000),(187,0,0,'reports','summary','call_summary_reports','provider','Provider','[\"main\",\"list\",\"export\",\"search\"]',0,'2019-01-25 09:01:06',7.60000),(188,0,0,'reports','notification','','notification_list','Notifications','[\"main\",\"list\",\"search\"]',0,'2019-01-25 09:01:03',7.70000),(189,0,0,'reports','audit','','audit_list','Audit Log','[\"main\",\"list\",\"search\"]',0,'2019-01-25 09:01:03',7.80000),(190,0,0,'configuration','systems','','country_list','Countries','[\"main\",\"list\",\"create\",\"edit\",\"search\",\"delete\"]',0,'2019-01-25 09:01:06',8.40000),(191,0,0,'configuration','systems','','database_restore','Database Backup','[\"main\",\"list\",\"create\",\"import\",\"delete\"]',0,'2019-01-25 09:01:06',8.60000),(192,0,0,'configuration','cronsettings','','cronsettings_list','Crons','[\"main\",\"list\",\"create\",\"edit\",\"search\",\"delete\"]',0,'2019-01-25 09:01:06',8.70000),(193,0,0,'configuration','systems','languages','languages_list','Languages','[\"main\",\"list\",\"export\",\"search\",\"delete\",\"default_language\"]',0,'2019-01-25 09:01:06',8.80000),(194,0,0,'configuration','systems','translations','translation_list','Translations','[\"main\",\"list\",\"create\",\"edit\",\"delete\"]',0,'2019-01-25 09:01:06',8.90000),(195,0,0,'configuration','systems','','currency_list','Currencies','[\"main\",\"list\",\"create\",\"delete\",\"edit\",\"search\",\"currencies_update\"]',0,'2019-01-25 09:01:06',8.45000),(196,1,0,'inbound','did','','did_list','DIDs','[\"main\",\"list\",\"delete\",\"edit\",\"forward\",\"search\",\"purchase\",\"buy_did\",\"available_did\",\"batch_update\"]',0,'2019-01-25 09:01:05',3.10000),(197,1,0,'reports','freeswitch','','livecall_report','Live Calls','[\"main\",\"list\"]',0,'2019-01-25 09:01:05',7.71000),(198,1,0,'reports','notification','','notification_list','Notifications','[\"main\",\"list\",\"search\"]',0,'2019-01-25 09:01:03',7.70001),(199,2,0,'billing','user',' ','user_invoices_list','Invoices','[\"main\",\"list\",\"search\"]',0,'2019-01-25 09:01:03',1.00000),(200,2,0,'billing','user',' ','user_charges_history','Charges History','[\"main\",\"list\",\"search\"]',0,'2019-01-25 09:01:03',1.10000),(201,2,0,'billing','user',' ','user_refill_report','Refill Report','[\"main\",\"list\",\"search\"]',0,'2019-01-25 09:01:03',1.20000),(202,2,0,'inbound','user',' ','user_didlist','DIDs','[\"main\",\"list\",\"search\",\"batch_update\",\"purchase\"]',0,'2019-01-25 09:01:03',2.00000),(203,2,0,'inbound','did_purchase',' ','did_purchase_list','Bulk DID Purchase','[\"main\",\"list\",\"purchase\"]',0,'2019-01-25 09:01:03',2.10000),(204,2,0,'services','user',' ','user_products_list','Products','[\"main\",\"list\",\"edit\",\"search\"]',0,'2019-01-25 09:01:03',3.00000),(205,2,0,'services','user',' ','user_available_products','Order New','[\"main\",\"list\"]',0,'2019-01-25 09:01:03',3.10000),(206,2,0,'services','user',' ','user_fund_transfer','Send Credit','[\"main\",\"list\"]',0,'2019-01-25 09:01:03',3.20000),(207,2,0,'services','user',' ','user_refill_coupon_list',' Refill Coupon','[\"main\",\"list\"]',0,'2019-01-25 09:01:03',3.30000),(208,2,0,'services','products',' ','products_topuplist',' TopUp','[\"main\",\"list\"]',0,'2019-01-25 09:01:03',3.40000),(209,2,0,'calling_card','accessnumber',' ','accessnumber_list',' Access Numbers','[\"main\",\"list\",\"search\",\"export\"]',0,'2019-01-25 09:01:03',4.00000),(210,2,0,'calling_card','user',' ','user_animap_list','  Pinless CLI','[\"main\",\"list\",\"create\",\"delete\"]',0,'2019-01-25 09:01:03',4.10000),(211,2,0,'calling_card','user',' ','user_pin_add','  Pin','[\"main\",\"list\"]',0,'2019-01-25 09:01:03',4.20000),(212,2,0,'reports','user',' ','user_cdrs_report','  CDRs','[\"main\",\"list\",\"search\",\"export\"]',0,'2019-01-25 09:01:03',5.00000),(213,2,0,'reports','user','','user_notification_list','Notifications','[\"main\",\"list\",\"search\"]',0,'2019-01-25 09:01:03',5.10000),(214,2,0,'rates','user',' ','user_rates_list','  Rates','[\"main\",\"list\",\"search\",\"export\"]',0,'2019-01-25 09:01:03',6.00000),(215,2,0,'my_account','user',' ','user_myprofile','  Profile','[\"main\",\"list\"]',0,'2019-01-25 09:01:03',7.00000),(216,2,0,'my_account','user',' ','user_sipdevices','  SIP Devices','[\"main\",\"list\",\"create\",\"edit\",\"delete\",\"search\"]',0,'2019-01-25 09:01:03',7.10000),(217,2,0,'my_account','user',' ','user_ipmap','IP Settings','[\"main\",\"list\",\"search\",\"create\",\"delete\"]',0,'2019-01-25 09:01:03',7.20000),(218,2,0,'my_account','user',' ','user_speeddial','Speed Dial','[\"main\",\"list\",\"edit\",\"delete\"]',0,'2019-01-25 09:01:03',7.30000),(219,2,0,'my_account','user',' ','user_alert_threshold','Alert Threshold','[\"main\",\"list\"]',0,'2019-01-25 09:01:03',7.40000),(220,2,0,'my_account','user',' ','user_change_password','Change Password','[\"main\",\"list\"]',0,'2019-01-25 09:01:03',7.50000),(221,1,0,'accounts','permissions',' ','permissions_list','Roles & Permission','[\"main\",\"list\",\"create\",\"delete\",\"edit\",\"search\"]',0,'2019-01-25 09:01:03',1.60000),(222,0,0,'reports','activity_report','0','activityReport','Call Activity Report','[\"main\",\"list\",\"search\",\"export\"]',0,'2019-01-25 09:01:03',9.96000),(223,0,0,'reports','low_balance',' ','low_balance_list','Low Balance','[\"main\",\"list\",\"search\"]',0,'2019-01-25 09:01:03',7.80000),(224,2,0,'reports','user',' ','user_livecall_report','Live Calls','[\"main\",\"list\"]',0,'2019-01-25 09:01:03',9.10000),(225,0,0,'configuration','systems',' ','global','Settings','[\"main\",\"list\"]',0,'2019-01-25 09:01:03',8.91000);
/*!40000 ALTER TABLE `roles_and_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `routes`
--

DROP TABLE IF EXISTS `routes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `routes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pattern` varchar(40) DEFAULT '',
  `comment` varchar(80) DEFAULT '',
  `connectcost` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `includedseconds` int NOT NULL,
  `cost` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `pricelist_id` int DEFAULT '0',
  `inc` int DEFAULT NULL,
  `country_id` int NOT NULL DEFAULT '0',
  `call_type` varchar(20) NOT NULL,
  `routing_type` varchar(50) NOT NULL,
  `percentage` varchar(50) NOT NULL,
  `call_count` int NOT NULL,
  `accountid` int DEFAULT '0',
  `reseller_id` int DEFAULT '0',
  `precedence` int NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 for active 1 for inactive',
  `trunk_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'Trunk id for force routing',
  `init_inc` int NOT NULL DEFAULT '0',
  `creation_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `effective_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_rg_accid_key` (`pattern`,`pricelist_id`,`accountid`,`effective_date`) USING BTREE,
  KEY `pattern` (`pattern`),
  KEY `pricelist` (`pricelist_id`),
  KEY `reseller` (`reseller_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `routes`
--

LOCK TABLES `routes` WRITE;
/*!40000 ALTER TABLE `routes` DISABLE KEYS */;
INSERT INTO `routes` VALUES (1,'^1.*','USA',0.00000,0,0.20000,1,60,0,'','','',0,0,0,0,0,'0',30,'2016-07-26 15:11:50','0000-00-00 00:00:00','2021-05-12 11:32:26');
/*!40000 ALTER TABLE `routes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `routing`
--

DROP TABLE IF EXISTS `routing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `routing` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pricelist_id` int NOT NULL,
  `trunk_id` int NOT NULL,
  `routes_id` int NOT NULL DEFAULT '0',
  `percentage` varchar(20) NOT NULL,
  `call_count` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `routing`
--

LOCK TABLES `routing` WRITE;
/*!40000 ALTER TABLE `routing` DISABLE KEYS */;
INSERT INTO `routing` VALUES (1,1,1,0,'',0);
/*!40000 ALTER TABLE `routing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sip_devices`
--

DROP TABLE IF EXISTS `sip_devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sip_devices` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(40) NOT NULL DEFAULT '',
  `sip_profile_id` int NOT NULL DEFAULT '0',
  `reseller_id` int NOT NULL DEFAULT '0',
  `accountid` int NOT NULL DEFAULT '0',
  `dir_params` longtext NOT NULL,
  `dir_vars` longtext NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:active,1:inactive',
  `creation_date` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `last_modified_date` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `call_waiting` int NOT NULL DEFAULT '0' COMMENT '0:Enable 1:Disable',
  `opensips_md5` varchar(255) DEFAULT NULL,
  `is_pbx` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sip_devices`
--

LOCK TABLES `sip_devices` WRITE;
/*!40000 ALTER TABLE `sip_devices` DISABLE KEYS */;
INSERT INTO `sip_devices` VALUES (1,'4727985745',1,0,2,'{\"password\":\"mfpV9CY|.2gX\",\"vm-enabled\":\"false\",\"vm-password\":\"9563\",\"vm-mailto\":\"\",\"vm-attach-file\":\"false\",\"vm-keep-local-after-email\":\"false\",\"vm-email-all-messages\":\"false\"}','{\"effective_caller_id_name\":\"ASTPP\",\"effective_caller_id_number\":\"4810338297\"}',0,'2016-07-26 15:19:43','2019-03-05 08:53:21',0,NULL,1);
/*!40000 ALTER TABLE `sip_devices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sip_profiles`
--

DROP TABLE IF EXISTS `sip_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sip_profiles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL DEFAULT '',
  `sip_ip` varchar(39) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `sip_port` varchar(6) NOT NULL DEFAULT '',
  `profile_data` text NOT NULL,
  `created_date` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `last_modified_date` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `accountid` int NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 for active 1 for inactive',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sip_profiles`
--

LOCK TABLES `sip_profiles` WRITE;
/*!40000 ALTER TABLE `sip_profiles` DISABLE KEYS */;
INSERT INTO `sip_profiles` VALUES (1,'default','$${local_ip_v4}','5060','{\"rtp-ip\":\"$${local_ip_v4}\",\"dialplan\":\"XML\",\"user-agent-string\":\"ASTPP\",\"debug\":\"0\",\"sip-trace\":\"no\",\"tls\":\"false\",\"inbound-reg-force-matching-username\":\"true\",\"disable-transcoding\":\"true\",\"all-reg-options-ping\":\"false\",\"unregister-on-options-fail\":\"true\",\"log-auth-failures\":\"true\",\"status\":\"0\",\"inbound-bypass-media\":\"false\",\"inbound-proxy-media\":\"false\",\"disable-transfer\":\"false\",\"enable-100rel\":\"false\",\"rtp-timeout-sec\":\"300\",\"dtmf-duration\":\"2000\",\"manual-redirect\":\"true\",\"aggressive-nat-detection\":\"true\",\"enable-timer\":\"false\",\"minimum-session-expires\":\"120\",\"session-timeout-pt\":\"1800\",\"auth-calls\":\"true\",\"apply-inbound-acl\":\"default\",\"inbound-codec-prefs\":\"PCMA,PCMU\",\"outbound-codec-prefs\":\"PCMA,PCMU\",\"inbound-late-negotiation\":\"false\",\"sip-capture\":\"no\",\"forward-unsolicited-mwi-notify\":\"false\",\"context\":\"default\",\"rfc2833-pt\":\"101\",\"rtp-timer-name\":\"soft\",\"hold-music\":\"$${hold_music}\",\"manage-presence\":\"true\",\"presence-hosts\":\"$${domain},$${local_ip_v4}\",\"presence-privacy\":\"$${presence_privacy}\",\"inbound-codec-negotiation\":\"generous\",\"auth-all-packets\":\"false\",\"ext-rtp-ip\":\"$${local_ip_v4}\",\"ext-sip-ip\":\"$${local_ip_v4}\",\"rtp-hold-timeout-sec\":\"1800\",\"challenge-realm\":\"auto_from\",\"nonce-ttl\":\"60\",\"pass-callee-id\":\"false\", \"dtmf_type\":\"rfc2833\"}','2015-01-21 17:25:01','2019-03-05 08:25:47',0,0);
/*!40000 ALTER TABLE `sip_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `speed_dial`
--

DROP TABLE IF EXISTS `speed_dial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `speed_dial` (
  `id` int NOT NULL AUTO_INCREMENT,
  `speed_num` varchar(20) DEFAULT NULL,
  `number` varchar(15) NOT NULL,
  `accountid` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `speed_dial`
--

LOCK TABLES `speed_dial` WRITE;
/*!40000 ALTER TABLE `speed_dial` DISABLE KEYS */;
/*!40000 ALTER TABLE `speed_dial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sweeplist`
--

DROP TABLE IF EXISTS `sweeplist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sweeplist` (
  `id` int unsigned NOT NULL DEFAULT '0',
  `sweep` varchar(15) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sweeplist`
--

LOCK TABLES `sweeplist` WRITE;
/*!40000 ALTER TABLE `sweeplist` DISABLE KEYS */;
INSERT INTO `sweeplist` VALUES (0,'Daily'),(2,'Monthly');
/*!40000 ALTER TABLE `sweeplist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system`
--

DROP TABLE IF EXISTS `system`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(48) DEFAULT NULL,
  `display_name` varchar(255) NOT NULL,
  `value` varchar(1111) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `field_type` varchar(250) NOT NULL DEFAULT 'default_system_input',
  `comment` text,
  `timestamp` datetime NOT NULL DEFAULT '2019-04-01 00:00:00',
  `reseller_id` int NOT NULL,
  `is_display` tinyint(1) NOT NULL DEFAULT '0',
  `group_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sub_group` varchar(100) NOT NULL,
  `field_rules` varchar(80) NOT NULL DEFAULT '' COMMENT 'CI Rules for validation',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `reseller` (`reseller_id`)
) ENGINE=InnoDB AUTO_INCREMENT=617 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system`
--

LOCK TABLES `system` WRITE;
/*!40000 ALTER TABLE `system` DISABLE KEYS */;
INSERT INTO `system` VALUES (11,'opensips_dbengine','Opensips DB Engine','MySQL','default_system_input','For now this must be MySQL','2021-05-12 11:26:31',0,0,'opensips','',''),(12,'opensips','Opensips','1','enable_disable_option','Set enable to add opensips support','2021-05-12 11:26:31',0,0,'opensips','',''),(13,'opensips_dbname','Opensips DB Name','opensips','default_system_input','Set opensips database name','2021-05-12 11:26:31',0,0,'opensips','',''),(14,'opensips_dbuser','Opensips DB User','DB_USER','default_system_input','Set opensips database user','2021-05-12 11:26:31',0,0,'opensips','',''),(15,'opensips_dbhost','Opensips DB Host','DB_HOST','default_system_input','Set opensips database host','2021-05-12 11:26:31',0,0,'opensips','',''),(16,'opensips_dbpass','Opensips DB Pass','DB_PASSWORD','default_system_input','Set opensips database password','2021-05-12 11:26:31',0,0,'opensips','',''),(17,'opensips_domain','Opensips Domain','127.0.0.1','default_system_input','Set opensips domain','2021-05-12 11:26:31',0,0,'opensips','',''),(22,'email','Email Notifications','0','enable_disable_option','Set enable to send email notifications','2021-05-12 11:26:31',0,0,'notifications','Email',''),(26,'starting_digit','Starting Digit','0','default_system_input','Set the digits that all calling cards must start with. 0=disabled. Example : 1234','2021-05-12 11:26:31',0,0,'signup','',''),(35,'card_length','Card Length','10','default_system_input','Set number of digits for calling cards','2021-05-12 11:26:31',0,0,'signup','',''),(42,'pin_length','Pin Length','6','default_system_input','Set number of digits for pin numbers','2021-05-12 11:26:31',0,0,'signup','',''),(44,'decimal_points','Decimal Points','4','default_system_input','Set decimal points to use through out system (Max 5)','2021-05-12 11:26:31',0,0,'global','General',''),(54,'pin_retries','Pin retries','3','default_system_input','Set number of retries to validate pin number','2021-05-12 11:26:31',0,0,'calls','Calling Card',''),(135,'calling_cards_rate_announce','Rate Announcement','1','enable_disable_option','Enable it to announce rate of the call','2021-05-12 11:26:31',0,0,'calls','Calling Card',''),(141,'calling_cards_number_input_timeout','Card Input Timeout','15000','default_system_input','How long do we wait when entering the calling card number?  Specified in MS','2021-05-12 11:26:31',0,0,'calls','Calling Card',''),(142,'calling_cards_dial_input_timeout','Dial Input Timeout','15000','default_system_input','How long do we wait when entering the destination number in calling cards? Specified in MS','2021-05-12 11:26:31',0,0,'calls','Calling Card',''),(143,'calling_cards_general_input_timeout','General Input Timeout','15000','default_system_input','How long do we wait for input in general menus?  Specified in MS','2021-05-12 11:26:31',0,0,'calls','Calling Card',''),(144,'calling_cards_welcome_file','Welcome File','astpp-welcome.wav','default_system_input','Set your calling card welcome file','2021-05-12 11:26:31',0,0,'calls','Calling Card',''),(174,'base_currency','Base Currency','USD','base_currency','Set base currency of system.','2021-05-12 11:26:31',0,0,'global','General',''),(179,'default_timezone','Timezone','194','default_timezone','Set default timezone for accounts','2013-05-06 19:34:39',0,0,'signup','',''),(181,'country','Country','88','country','Set default country for accounts','2021-05-12 11:26:31',0,0,'signup','',''),(191,'version','Version','5.0','default_system_input','Current version of ASTPP','2021-05-12 11:26:31',0,1,'global','',''),(192,'ivr_count','IVR Count','3','default_system_input','Number of time IVR should play in call','2021-05-12 11:26:31',0,0,'calls','Calling Card',''),(193,'calling_cards_balance_announce','Balance Announcement','0','enable_disable_option','To enable balance playback in call','2021-05-12 11:26:31',0,0,'calls','Calling Card',''),(196,'smtp','SMTP','1','enable_disable_option','Set yes to use SMTP connection to send email and no to use sendmail connection to send email','2021-05-12 11:26:31',0,0,'notifications','Email',''),(204,'default_signup_rategroup','Rate Group','','default_signup_rategroup','Set default rategroup for singup customers','2021-05-12 11:26:31',0,0,'signup','',''),(205,'enable_signup','Enable Signup','0','enable_disable_option','Set enable to add signup module','2021-05-12 11:26:31',0,0,'signup','',''),(206,'create_sipdevice','Create SIP Device','0','enable_disable_option','Set yes to create sip device when customer will do singup in system','2021-05-12 11:26:31',0,0,'signup','',''),(207,'balance','Initial Balance','0','default_system_input','Set balance for newly created customer','2021-05-12 11:26:31',0,0,'signup','',''),(208,'refill_coupon_length','Refill Coupon Length','8','default_system_input','Set refill coupon generation length','2021-05-12 11:26:31',0,0,'global','General',''),(209,'minimum_fund_transfer','Minimum Fund Transfer','1','default_system_input','Set minimum amount for fund transfer','2021-05-12 11:26:31',0,0,'global','General',''),(215,'enterprise','Enterprise','0','enable_disable_option','0:Enable 1:Disable','2021-05-12 11:26:31',0,1,'global','',''),(216,'automatic_invoice','Default Invoice Mode','0','automatic_invoice','Draft will give possibility to admin and reseller to modify invoice after generation whereas Confirmed invoices will be readonly.','2021-05-12 11:26:31',0,0,'global','General',''),(217,'log_path','Log Path','/var/log/astpp/','default_system_input','ASTPP log files path','2021-05-12 11:26:31',0,0,'global','General',''),(220,'homer_capture_server','Capture Server','','default_system_input','Set enable to capture logs in homer. Format : udp:192.168.1.200:9060','2021-05-12 11:26:31',0,0,'homer','',''),(221,'did_global_translation','DID Localization','0','set_localization_verification','If you wish to translate DID number with some defined number then use this feature. This will be applicable to all DIDs.','2021-05-12 11:26:31',0,0,'calls','General',''),(222,'tax_type','Default Tax','','tax_type','Set Default taxes for tax_description','2021-05-12 11:26:31',0,0,'signup','',''),(223,'notifications','Account Notification','0','enable_disable_option','Set enable to account notification','2021-05-12 11:26:31',0,0,'signup','',''),(224,'paypal_permission','Payment Gateway Permission','0','enable_disable_option','Set paypal permission','2021-05-12 11:26:31',0,0,'signup','',''),(225,'generate_pin','Generate Pin','0','set_prorate','Allow to Generate Pin','2021-05-12 11:26:31',0,0,'signup','',''),(226,'cps','CPS','0','default_system_input','Allow to CPS','2021-05-12 11:26:31',0,0,'signup','',''),(227,'maxchannels','Concurrent Calls','0','default_system_input','Allow to Concurrent Calls','2021-05-12 11:26:31',0,0,'signup','',''),(228,'password_type','Password Strength','0','default_password_input','Set Password Security Type For New Password Creation','2021-05-12 11:26:31',0,0,'global','General',''),(229,'charge_per_min','LC Charge / Min','0','default_system_input','Allow to LC Charge / Min','2021-05-12 11:26:31',0,0,'signup','',''),(230,'loss_less_routing','Allow Loss Less Routing','1','set_prorate','Allow Loss Less Routing','2021-05-12 11:26:31',0,0,'signup','',''),(231,'is_recording','Allow Recording','1','set_prorate','Allow to Recording','2021-05-12 11:26:31',0,0,'signup','',''),(232,'allow_ip_management','Allow IP Management','1','set_prorate','Allow to IP Management','2021-05-12 11:26:31',0,0,'signup','',''),(233,'local_call','Allow Local Calls','0','set_prorate','Allow to Local Calls','2021-05-12 11:26:31',0,0,'signup','',''),(234,'notify_flag','Email Alerts ?','0','set_prorate','Allow to Email Alerts','2021-05-12 11:26:31',0,0,'signup','',''),(235,'validfordays','Account Valid Days','3650','default_system_input','Allow to Valid Days','2021-05-12 11:26:31',0,0,'signup','',''),(236,'localization_id','Localization','','set_localization_verification','Allow Localization','2021-05-12 11:26:31',0,0,'signup','',''),(238,'trunk_count','Trunk Count','3','default_system_input','Priority trunk count','2021-05-12 11:26:31',0,0,'global','Assorted',''),(239,'notify_credit_limit','Balance Below','5','default_system_input','Balance Below','2021-05-12 11:26:31',0,0,'signup','',''),(249,'ewallet_payment','Ewallet Payment Gateway','paypal','ewallet_payment_gateway','Set your ewallet payment gateway','2021-05-12 11:26:31',0,0,'global','Assorted',''),(261,'playback_audio_notification','Play Audio Notifications','1','enable_disable_option','Set enable to play audio notification in call','2021-05-12 11:26:31',0,0,'calls','General',''),(264,'voicemail_number','Voicemail Number','7777','default_system_input','Voicemail listen number','2021-05-12 11:26:31',0,0,'calls','General',''),(282,'allow_retires','Allow Max Retries','10','0','Set max retries of signup with same number or email. If exceed then block account and inform user to contact adminstrator','2021-05-12 11:26:31',0,0,'signup','',''),(283,'enable_database','Archive','1','enable_disable_option','Set enable to activate CDR archive feature','2021-05-12 11:26:31',0,0,'database','',''),(284,'default_database_type','Interval','1','default_system_type','Select Interval of archive cdrs. Example: If Half Year selected then older than 6 Months records will be archived automatically.','2021-05-12 11:26:31',0,0,'database','',''),(285,'purge_recordings','Recording Files Older Than Days','-1','default_system_input','Remove recordings from directory older than defined days','2021-05-12 11:26:31',0,0,'purge','',''),(286,'purge_audio_log','Audit Logs Older Than Days','-1','default_system_input','Remove audit log from table older than defined days','2021-05-12 11:26:31',0,0,'purge','',''),(287,'purge_cdrs','CDRs Older Than Days','-1','default_system_input','Remove CDRs from table older than defined days','2021-05-12 11:26:31',0,0,'purge','',''),(288,'purge_emails','Emails Older Than Days','-1','default_system_input','Remove emails from table older than defined days','2021-05-12 11:26:31',0,0,'purge','',''),(289,'purge_invoices','Invoices Older Than Days','-1','default_system_input','Remove invoices from table older than defined days','2021-05-12 11:26:31',0,0,'purge','',''),(290,'purge_accounts_expired','Expired Accounts After Days','-1','default_system_input','Removed expired accounts from table after defined days','2021-05-12 11:26:31',0,0,'purge','',''),(298,'mail_log','Mail Log','/var/log/astpp/','default_system_input','2021-05-12 11:26:31','2021-05-12 11:26:31',0,0,'notifications','Email',''),(299,'sms_notications','SMS Notifications','1','enable_disable_option','Set Enable To Use SMS Notification ','2021-05-12 11:26:31',0,0,'notifications','SMS',''),(300,'sms_api_key','Nexmo API Key','EnterAPIKey','default_system_input','Set your API Key for SMS','2021-05-12 11:26:31',0,0,'notifications','SMS',''),(301,'sms_secret_key','Nexmo Secret Key','EnterSecretKey','default_system_input','Set your API Secret Key ','2021-05-12 11:26:31',0,0,'notifications','SMS',''),(302,'alert_notications','Push Notifications','1','enable_disable_option','Set enable to send notifications to accounts','2021-05-12 11:26:31',0,0,'notifications','Push Notifications',''),(320,'paypal_url','Live Url','https://www.paypal.com/cgi-bin/webscr','default_system_input','Set enable to add paypal as payment gateway option','2021-05-12 11:26:31',0,0,'payment_methods','Paypal',''),(321,'paypal_sandbox_url','Sandbox Url','https://www.sandbox.paypal.com/cgi-bin/webscr','default_system_input','Set paypal sandbox url for testing','2021-05-12 11:26:31',0,0,'payment_methods','Paypal',''),(322,'paypal_id','Live Id','your@paypal.com','default_system_input','Set paypal live account id','2021-05-12 11:26:31',0,0,'payment_methods','Paypal',''),(323,'paypal_sandbox_id','Sandbox Id','your@paypal.com','default_system_input','Set paypal sandbox account id for testing','2021-05-12 11:26:31',0,0,'payment_methods','Paypal',''),(324,'paypal_mode','Environment','1','paypal_mode','Set paypal mode. Sandbox for testing','2021-05-12 11:26:31',0,0,'payment_methods','Paypal',''),(325,'paypal_fee','Fee','1','enable_disable_option','Set who should pay paypal fee','2021-05-12 11:26:31',0,0,'payment_methods','Paypal',''),(326,'free_inbound','Rate check for DID','1','set_prorate','','2021-05-12 11:26:31',0,0,'calls','General',''),(366,'telephone_as_account','Telephone as account number','1','set_prorate','Set Yes to use Telephone number as account number','2021-05-12 11:26:31',0,0,'signup','',''),(372,'currency_conv_loss_pct','Currency Conversion Loss Percentage','0','default_system_input','What percentage to allow for currency conversion losses','2021-05-12 11:26:31',0,0,'global','General',''),(386,'purge_accounts_deleted','Deleted Accounts After Days','-1','default_system_input','Remove deleted accounts from table after defined days','2021-05-12 11:26:31',0,0,'purge','',''),(390,'balance_announce','Balance Announcement','1','enable_disable_option','To enable balance playback in call','2021-05-12 11:26:31',0,0,'calls','General',''),(391,'debug','Debug','1','enable_disable_option','To enable call debug, set it to Enable. Logs will appear at /var/log/astpp/astpp.log','2021-05-12 11:26:31',0,0,'calls','General',''),(392,'call_max_length','Call Max Length','100','default_system_input','Set maximum length (in minute) for call.','2021-05-12 11:26:31',0,0,'calls','General',''),(396,'max_free_length','Max Free Length','100','default_system_input','Set maximum length (In minutes) for calls that are at no charge','2021-05-12 11:26:31',0,0,'calls','General',''),(397,'minutes_announce','Minutes Announcement','1','enable_disable_option','To enable minutes playback in call','2021-05-12 11:26:31',0,0,'calls','General',''),(398,'leg_timeout','Local Call Timeout (Sec.)','60','default_system_input','Define Local SIP2SIP Call Leg Timeout. Default 30 seconds','2021-05-12 11:26:31',0,0,'calls','General',''),(399,'card_retries','Card Retries','3','default_system_input','Set number of retries to validate card number','2021-05-12 11:26:31',0,0,'calls','Calling Card',''),(401,'calling_cards_pin_input_timeout','Pin Input Timeout','15000','default_system_input','How long do we wait when entering the pin number? Specified in MS','2021-05-12 11:26:31',0,0,'calls','Calling Card',''),(402,'cc_ani_auth','Pinless Authentication','0','enable_disable_option','Set enable to use ANI Authentication','2021-05-12 11:26:31',0,0,'calls','Calling Card',''),(403,'calling_cards_timelimit_announce','Timelimit Announcement','0','enable_disable_option','Enable it to announce the time-limit on call','2021-05-12 11:26:31',0,0,'calls','Calling Card',''),(404,'outbound_fax','Outbound Fax','0','enable_disable_option','Set yes to allow outbound fax in call','2021-05-12 11:26:31',0,0,'calls','Fax',''),(405,'inbound_fax','Inbound Fax','0','enable_disable_option','Set enable to allow inbound fax in call','2021-05-12 11:26:31',0,0,'calls','Fax',''),(406,'paypal_tax','Tax','0','default_system_input','Set paypal tax rate (in percentage) apply to recharge amount','2021-05-12 11:26:31',0,0,'payment_methods','Paypal',''),(408,'verification_by','Account Verification By','2','set_prorate_verification','Set verification mode','2021-05-12 11:26:31',0,0,'signup','',''),(548,'generate_invoice','Generate Invoice','0','set_prorate','Allow to Generate Invoice','2021-05-12 11:26:31',0,0,'signup','',''),(577,'otp_expire','OTP Expire Time(min)','10','default_system_input','Set OTP expire time for signup','2019-04-08 10:31:11',0,0,'signup','',''),(579,'number_of_default_rows','Number Of Default Rows','10','default_pagination_size','Set your pagination size','2019-04-01 00:00:00',0,0,'global','General',''),(580,'account_number_editable','Account Number Editable','0','set_prorate','Create new entity account number set editable','2019-04-01 10:32:33',0,0,'global','General',''),(581,'mobile_dialer','Mobile Dialer','0','enable_disable_option','Set Mobile dialer for update password of account same as sip device','2019-04-01 10:32:33',0,0,'global','General',''),(590,'paypal_status','Paypal','0','enable_disable_option','Set your paypal status here.','2019-04-01 00:00:00',0,0,'payment_methods','Paypal',''),(592,'hybrid_routing','Hybrid Routing','0','hybrid_routing','Rates selection has two stages;1) One from particular vendor 2) One from all selected vendors;Default rate selection is based on same routing strategy for both stages;This option will enable you to use stretegy LCR for 1st stage and Cost for 2nd and vice-versa based on the strategy selected in rate group','2020-03-21 17:21:24',0,0,'calls','General',''),(593,'folder_path','Folder Path','/var/www/html/astpp/','default_system_input','Set default ASTPP folder path','2019-04-01 00:00:00',0,0,'global','Assorted',''),(594,'status','Status','1','set_status','Set enable to activate CDR archive feature','2019-11-08 19:07:34',0,0,'term_and_condition','',''),(595,'url','Url','','default_system_input','Set enable to activate CDR archive feature','2019-11-08 19:07:34',0,0,'term_and_condition','',''),(596,'text','Text','','textarea','Set enable to activate CDR archive feature','2019-11-08 19:07:34',0,0,'term_and_condition','',''),(597,'reservation_days','DID Reservation Days','10','default_system_input','Set your default did reservation days','2020-12-16 07:28:32',0,0,'Products','DID',''),(598,'did_reserve','DID Reservation','1','enable_disable_option','Set DID Reservation for enable/disable','2019-04-01 00:00:00',0,0,'Products','DID',''),(599,'rate_type_subscription','Charge Type','0','rate_type_subscription','This rate type is applicable only on Subscription category of product ','2020-12-16 07:28:32',0,0,'Products','Subscription',''),(601,'product_debug_flag','Invoice Debug','1','enable_disable_option','enable:-print the log of product\r\ndisable:-not print the log of product','2019-04-01 00:00:00',0,0,'global','General',''),(602,'opensips_public_host','Opensips Public Host','','default_system_input','For opensip public IP','2020-03-21 17:21:24',0,0,'opensips','',''),(603,'audit_log','Audit Log','0','enable_disable_option','You can enable/disable audit logs','2019-04-01 00:00:00',0,0,'global','General',''),(604,'sms_logs','SMS Logs','0','enable_disable_option','Set Enable For Logs','2021-03-02 10:47:50',0,0,'notifications','SMS',''),(605,'realtime_billing','Status','1','enable_disable_option','Set enable or disable Realtime Billing','0000-00-00 00:00:00',0,0,'realtime_billing','General',''),(606,'realtime_billing_heartbeat','Heartbeat','30','default_system_input','Set Heartbeat in seconds','0000-00-00 00:00:00',0,0,'realtime_billing','General',''),(607,'realtime_low_balance_amount','Amount','5','default_system_input','Set low balance amount alert','0000-00-00 00:00:00',0,0,'realtime_billing','Low Balance Threshold',''),(608,'realtime_low_balance_alert','Alert Type','0','warning_hangup_option','Set Warning or Hangup alert for Realtime Billing','0000-00-00 00:00:00',0,0,'realtime_billing','Low Balance Threshold',''),(609,'realtime_no_balance_amount','Amount','0','default_system_input','Set No balance amount alert','0000-00-00 00:00:00',0,0,'realtime_billing','No Balance Threshold',''),(610,'realtime_no_balance_alert','Alert Type','1','warning_hangup_option','Set Warning or Hangup alert for Realtime Billing','0000-00-00 00:00:00',0,0,'realtime_billing','No Balance Threshold',''),(611,'realtime_percall_max_amt','Amount','10','default_system_input','Set Max amount per call','0000-00-00 00:00:00',0,0,'realtime_billing','Max amount per call',''),(612,'realtime_percall_action','Alert Type','1','warning_hangup_option','Set Warning or Hangup alert for reached max amount','0000-00-00 00:00:00',0,0,'realtime_billing','Max amount per call',''),(613,'realtime_custom_sql_lookup','Alert Type','SELECT if(posttoexternal=1,credit_limit+(balance*-1),balance) AS nibble_balance FROM accounts WHERE id=\'${nibble_account}\'','default_system_input','Set Warning or Hangup alert for reached max amount','0000-00-00 00:00:00',0,1,'realtime_billing','',''),(614,'realtime_custom_sql_save','Alert Type','Update accounts SET balance=IF(posttoexternal=1,balance+${nibble_bill},balance-${nibble_bill}) WHERE id=\'${nibble_account}\'','default_system_input','Set Warning or Hangup alert for reached max amount','0000-00-00 00:00:00',0,1,'realtime_billing','',''),(615,'email_logs','Email Logs','0','enable_disable_option','Set Enable For Logs','2021-03-02 10:47:50',0,0,'notifications','Email',''),(616,'customer_default_permission','Customer Role','4','set_customer_permission','Set customer permission','2021-05-12 11:32:33',0,0,'signup','','');
/*!40000 ALTER TABLE `system` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxes`
--

DROP TABLE IF EXISTS `taxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taxes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `taxes_priority` int DEFAULT '1',
  `taxes_amount` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `tax_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:Default,1:Other',
  `taxes_rate` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `taxes_description` varchar(255) NOT NULL,
  `reseller_id` int NOT NULL DEFAULT '0',
  `last_modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `creation_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 for active 1 for inactive',
  PRIMARY KEY (`id`),
  KEY `taxes_priority` (`taxes_priority`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxes`
--

LOCK TABLES `taxes` WRITE;
/*!40000 ALTER TABLE `taxes` DISABLE KEYS */;
/*!40000 ALTER TABLE `taxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxes_to_accounts`
--

DROP TABLE IF EXISTS `taxes_to_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taxes_to_accounts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `accountid` int NOT NULL DEFAULT '0',
  `taxes_id` int NOT NULL DEFAULT '0',
  `taxes_priority` tinyint NOT NULL DEFAULT '0',
  `assign_date` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  PRIMARY KEY (`id`),
  KEY `accountid` (`accountid`),
  KEY `taxes_id` (`taxes_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxes_to_accounts`
--

LOCK TABLES `taxes_to_accounts` WRITE;
/*!40000 ALTER TABLE `taxes_to_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `taxes_to_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timezone`
--

DROP TABLE IF EXISTS `timezone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `timezone` (
  `id` int NOT NULL AUTO_INCREMENT,
  `gmttime` varchar(255) DEFAULT NULL,
  `gmtoffset` bigint NOT NULL DEFAULT '0',
  `timezone_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `timezone_digit` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=426 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timezone`
--

LOCK TABLES `timezone` WRITE;
/*!40000 ALTER TABLE `timezone` DISABLE KEYS */;
INSERT INTO `timezone` VALUES (1,'GMT+01:00',3600,'Europe/Andorra','1'),(2,'GMT+04:00',14400,'Asia/Dubai','4'),(3,'GMT+04:30',16200,'Asia/Kabul','4'),(4,'GMT-04:00',-14400,'America/Antigua','-4'),(5,'GMT-04:00',-14400,'America/Anguilla','-4'),(6,'GMT+01:00',3600,'Europe/Tirane','1'),(7,'GMT+04:00',14400,'Asia/Yerevan','4'),(8,'GMT+01:00',3600,'Africa/Luanda','1'),(9,'GMT+11:00',39600,'Antarctica/Casey','11'),(10,'GMT+07:00',25200,'Antarctica/Davis','7'),(11,'GMT+10:00',36000,'Antarctica/DumontDUrville','10'),(12,'GMT+05:00',18000,'Antarctica/Mawson','5'),(13,'GMT+13:00',46800,'Antarctica/McMurdo','13'),(14,'GMT-03:00',-10800,'Antarctica/Palmer','-3'),(15,'GMT-03:00',-10800,'Antarctica/Rothera','-3'),(16,'GMT+03:00',10800,'Antarctica/Syowa','3'),(17,'GMT+00:00',0,'Antarctica/Troll','0'),(18,'GMT+06:00',21600,'Antarctica/Vostok','6'),(19,'GMT-03:00',-10800,'America/Argentina/Buenos_Aires','-3'),(20,'GMT-03:00',-10800,'America/Argentina/Catamarca','-3'),(21,'GMT-03:00',-10800,'America/Argentina/Cordoba','-3'),(22,'GMT-03:00',-10800,'America/Argentina/Jujuy','-3'),(23,'GMT-03:00',-10800,'America/Argentina/La_Rioja','-3'),(24,'GMT-03:00',-10800,'America/Argentina/Mendoza','-3'),(25,'GMT-03:00',-10800,'America/Argentina/Rio_Gallegos','-3'),(26,'GMT-03:00',-10800,'America/Argentina/Salta','-3'),(27,'GMT-03:00',-10800,'America/Argentina/San_Juan','-3'),(28,'GMT-03:00',-10800,'America/Argentina/San_Luis','-3'),(29,'GMT-03:00',-10800,'America/Argentina/Tucuman','-3'),(30,'GMT-03:00',-10800,'America/Argentina/Ushuaia','-3'),(31,'GMT-11:00',-39600,'Pacific/Pago_Pago','-11'),(32,'GMT+01:00',3600,'Europe/Vienna','1'),(33,'GMT+11:00',39600,'Antarctica/Macquarie','11'),(34,'GMT+10:30',37800,'Australia/Adelaide','10'),(35,'GMT+10:00',36000,'Australia/Brisbane','10'),(36,'GMT+10:30',37800,'Australia/Broken_Hill','10'),(37,'GMT+11:00',39600,'Australia/Currie','11'),(38,'GMT+09:30',34200,'Australia/Darwin','9'),(39,'GMT+08:45',31500,'Australia/Eucla','8'),(40,'GMT+11:00',39600,'Australia/Hobart','11'),(41,'GMT+10:00',36000,'Australia/Lindeman','10'),(42,'GMT+11:00',39600,'Australia/Lord_Howe','11'),(43,'GMT+11:00',39600,'Australia/Melbourne','11'),(44,'GMT+08:00',28800,'Australia/Perth','8'),(45,'GMT+11:00',39600,'Australia/Sydney','11'),(46,'GMT-04:00',-14400,'America/Aruba','-4'),(47,'GMT+02:00',7200,'Europe/Mariehamn','2'),(48,'GMT+04:00',14400,'Asia/Baku','4'),(49,'GMT+01:00',3600,'Europe/Sarajevo','1'),(50,'GMT-04:00',-14400,'America/Barbados','-4'),(51,'GMT+06:00',21600,'Asia/Dhaka','6'),(52,'GMT+01:00',3600,'Europe/Brussels','1'),(53,'GMT+00:00',0,'Africa/Ouagadougou','0'),(54,'GMT+02:00',7200,'Europe/Sofia','2'),(55,'GMT+03:00',10800,'Asia/Bahrain','3'),(56,'GMT+02:00',7200,'Africa/Bujumbura','2'),(57,'GMT+01:00',3600,'Africa/Porto-Novo','1'),(58,'GMT-04:00',-14400,'America/St_Barthelemy','-4'),(59,'GMT-04:00',-14400,'Atlantic/Bermuda','-4'),(60,'GMT+08:00',28800,'Asia/Brunei','8'),(61,'GMT-04:00',-14400,'America/La_Paz','-4'),(62,'GMT-04:00',-14400,'America/Kralendijk','-4'),(63,'GMT-03:00',-10800,'America/Araguaina','-3'),(64,'GMT-03:00',-10800,'America/Bahia','-3'),(65,'GMT-03:00',-10800,'America/Belem','-3'),(66,'GMT-04:00',-14400,'America/Boa_Vista','-4'),(67,'GMT-04:00',-14400,'America/Campo_Grande','-4'),(68,'GMT-04:00',-14400,'America/Cuiaba','-4'),(69,'GMT-05:00',-18000,'America/Eirunepe','-5'),(70,'GMT-03:00',-10800,'America/Fortaleza','-3'),(71,'GMT-03:00',-10800,'America/Maceio','-3'),(72,'GMT-04:00',-14400,'America/Manaus','-4'),(73,'GMT-02:00',-7200,'America/Noronha','-2'),(74,'GMT-04:00',-14400,'America/Porto_Velho','-4'),(75,'GMT-03:00',-10800,'America/Recife','-3'),(76,'GMT-05:00',-18000,'America/Rio_Branco','-5'),(77,'GMT-03:00',-10800,'America/Santarem','-3'),(78,'GMT-03:00',-10800,'America/Sao_Paulo','-3'),(79,'GMT-05:00',-18000,'America/Nassau','-5'),(80,'GMT+06:00',21600,'Asia/Thimphu','6'),(81,'GMT+02:00',7200,'Africa/Gaborone','2'),(82,'GMT+03:00',10800,'Europe/Minsk','3'),(83,'GMT-06:00',-21600,'America/Belize','-6'),(84,'GMT-05:00',-18000,'America/Atikokan','-5'),(85,'GMT-04:00',-14400,'America/Blanc-Sablon','-4'),(86,'GMT-07:00',-25200,'America/Cambridge_Bay','-7'),(87,'GMT-07:00',-25200,'America/Creston','-7'),(88,'GMT-07:00',-25200,'America/Dawson','-7'),(89,'GMT-07:00',-25200,'America/Dawson_Creek','-7'),(90,'GMT-07:00',-25200,'America/Edmonton','-7'),(91,'GMT-07:00',-25200,'America/Fort_Nelson','-7'),(92,'GMT-04:00',-14400,'America/Glace_Bay','-4'),(93,'GMT-04:00',-14400,'America/Goose_Bay','-4'),(94,'GMT-04:00',-14400,'America/Halifax','-4'),(95,'GMT-07:00',-25200,'America/Inuvik','-7'),(96,'GMT-05:00',-18000,'America/Iqaluit','-5'),(97,'GMT-04:00',-14400,'America/Moncton','-4'),(98,'GMT-05:00',-18000,'America/Nipigon','-5'),(99,'GMT-05:00',-18000,'America/Pangnirtung','-5'),(100,'GMT-06:00',-21600,'America/Rainy_River','-6'),(101,'GMT-06:00',-21600,'America/Rankin_Inlet','-6'),(102,'GMT-06:00',-21600,'America/Regina','-6'),(103,'GMT-06:00',-21600,'America/Resolute','-6'),(104,'GMT-03:30',-12600,'America/St_Johns','-4'),(105,'GMT-06:00',-21600,'America/Swift_Current','-6'),(106,'GMT-05:00',-18000,'America/Thunder_Bay','-5'),(107,'GMT-05:00',-18000,'America/Toronto','-5'),(108,'GMT-08:00',-28800,'America/Vancouver','-8'),(109,'GMT-07:00',-25200,'America/Whitehorse','-7'),(110,'GMT-06:00',-21600,'America/Winnipeg','-6'),(111,'GMT-07:00',-25200,'America/Yellowknife','-7'),(112,'GMT+06:30',23400,'Indian/Cocos','6'),(113,'GMT+01:00',3600,'Africa/Kinshasa','1'),(114,'GMT+02:00',7200,'Africa/Lubumbashi','2'),(115,'GMT+01:00',3600,'Africa/Bangui','1'),(116,'GMT+01:00',3600,'Africa/Brazzaville','1'),(117,'GMT+01:00',3600,'Europe/Zurich','1'),(118,'GMT+00:00',0,'Africa/Abidjan','0'),(119,'GMT-10:00',-36000,'Pacific/Rarotonga','-10'),(120,'GMT-03:00',-10800,'America/Punta_Arenas','-3'),(121,'GMT-03:00',-10800,'America/Santiago','-3'),(122,'GMT-05:00',-18000,'Pacific/Easter','-5'),(123,'GMT+01:00',3600,'Africa/Douala','1'),(124,'GMT+08:00',28800,'Asia/Shanghai','8'),(125,'GMT+06:00',21600,'Asia/Urumqi','6'),(126,'GMT-05:00',-18000,'America/Bogota','-5'),(127,'GMT-06:00',-21600,'America/Costa_Rica','-6'),(128,'GMT-05:00',-18000,'America/Havana','-5'),(129,'GMT-01:00',-3600,'Atlantic/Cape_Verde','-1'),(130,'GMT-04:00',-14400,'America/Curacao','-4'),(131,'GMT+07:00',25200,'Indian/Christmas','7'),(132,'GMT+02:00',7200,'Asia/Famagusta','2'),(133,'GMT+02:00',7200,'Asia/Nicosia','2'),(134,'GMT+01:00',3600,'Europe/Prague','1'),(135,'GMT+01:00',3600,'Europe/Berlin','1'),(136,'GMT+01:00',3600,'Europe/Busingen','1'),(137,'GMT+03:00',10800,'Africa/Djibouti','3'),(138,'GMT+01:00',3600,'Europe/Copenhagen','1'),(139,'GMT-04:00',-14400,'America/Dominica','-4'),(140,'GMT-04:00',-14400,'America/Santo_Domingo','-4'),(141,'GMT+01:00',3600,'Africa/Algiers','1'),(142,'GMT-05:00',-18000,'America/Guayaquil','-5'),(143,'GMT-06:00',-21600,'Pacific/Galapagos','-6'),(144,'GMT+02:00',7200,'Europe/Tallinn','2'),(145,'GMT+02:00',7200,'Africa/Cairo','2'),(146,'GMT+01:00',3600,'Africa/El_Aaiun','1'),(147,'GMT+03:00',10800,'Africa/Asmara','3'),(148,'GMT+01:00',3600,'Africa/Ceuta','1'),(149,'GMT+00:00',0,'Atlantic/Canary','0'),(150,'GMT+01:00',3600,'Europe/Madrid','1'),(151,'GMT+03:00',10800,'Africa/Addis_Ababa','3'),(152,'GMT+02:00',7200,'Europe/Helsinki','2'),(153,'GMT+13:00',46800,'Pacific/Fiji','13'),(154,'GMT-03:00',-10800,'Atlantic/Stanley','-3'),(155,'GMT+10:00',36000,'Pacific/Chuuk','10'),(156,'GMT+11:00',39600,'Pacific/Kosrae','11'),(157,'GMT+11:00',39600,'Pacific/Pohnpei','11'),(158,'GMT+00:00',0,'Atlantic/Faroe','0'),(159,'GMT+01:00',3600,'Europe/Paris','1'),(160,'GMT+01:00',3600,'Africa/Libreville','1'),(161,'GMT+00:00',0,'Europe/London','0'),(162,'GMT-04:00',-14400,'America/Grenada','-4'),(163,'GMT+04:00',14400,'Asia/Tbilisi','4'),(164,'GMT-03:00',-10800,'America/Cayenne','-3'),(165,'GMT+00:00',0,'Europe/Guernsey','0'),(166,'GMT+00:00',0,'Africa/Accra','0'),(167,'GMT+01:00',3600,'Europe/Gibraltar','1'),(168,'GMT+00:00',0,'America/Danmarkshavn','0'),(169,'GMT-03:00',-10800,'America/Nuuk','-3'),(170,'GMT-01:00',-3600,'America/Scoresbysund','-1'),(171,'GMT-04:00',-14400,'America/Thule','-4'),(172,'GMT+00:00',0,'Africa/Banjul','0'),(173,'GMT+00:00',0,'Africa/Conakry','0'),(174,'GMT-04:00',-14400,'America/Guadeloupe','-4'),(175,'GMT+01:00',3600,'Africa/Malabo','1'),(176,'GMT+02:00',7200,'Europe/Athens','2'),(177,'GMT-02:00',-7200,'Atlantic/South_Georgia','-2'),(178,'GMT-06:00',-21600,'America/Guatemala','-6'),(179,'GMT+10:00',36000,'Pacific/Guam','10'),(180,'GMT+00:00',0,'Africa/Bissau','0'),(181,'GMT-04:00',-14400,'America/Guyana','-4'),(182,'GMT+08:00',28800,'Asia/Hong_Kong','8'),(183,'GMT-06:00',-21600,'America/Tegucigalpa','-6'),(184,'GMT+01:00',3600,'Europe/Zagreb','1'),(185,'GMT-05:00',-18000,'America/Port-au-Prince','-5'),(186,'GMT+01:00',3600,'Europe/Budapest','1'),(187,'GMT+07:00',25200,'Asia/Jakarta','7'),(188,'GMT+09:00',32400,'Asia/Jayapura','9'),(189,'GMT+08:00',28800,'Asia/Makassar','8'),(190,'GMT+07:00',25200,'Asia/Pontianak','7'),(191,'GMT+00:00',0,'Europe/Dublin','0'),(192,'GMT+02:00',7200,'Asia/Jerusalem','2'),(193,'GMT+00:00',0,'Europe/Isle_of_Man','0'),(194,'GMT+05:30',19800,'Asia/Kolkata','5'),(195,'GMT+06:00',21600,'Indian/Chagos','6'),(196,'GMT+03:00',10800,'Asia/Baghdad','3'),(197,'GMT+03:30',12600,'Asia/Tehran','3'),(198,'GMT+00:00',0,'Atlantic/Reykjavik','0'),(199,'GMT+01:00',3600,'Europe/Rome','1'),(200,'GMT+00:00',0,'Europe/Jersey','0'),(201,'GMT-05:00',-18000,'America/Jamaica','-5'),(202,'GMT+02:00',7200,'Asia/Amman','2'),(203,'GMT+09:00',32400,'Asia/Tokyo','9'),(204,'GMT+03:00',10800,'Africa/Nairobi','3'),(205,'GMT+06:00',21600,'Asia/Bishkek','6'),(206,'GMT+07:00',25200,'Asia/Phnom_Penh','7'),(207,'GMT+13:00',46800,'Pacific/Enderbury','13'),(208,'GMT+14:00',50400,'Pacific/Kiritimati','14'),(209,'GMT+12:00',43200,'Pacific/Tarawa','12'),(210,'GMT+03:00',10800,'Indian/Comoro','3'),(211,'GMT-04:00',-14400,'America/St_Kitts','-4'),(212,'GMT+09:00',32400,'Asia/Pyongyang','9'),(213,'GMT+09:00',32400,'Asia/Seoul','9'),(214,'GMT+03:00',10800,'Asia/Kuwait','3'),(215,'GMT-05:00',-18000,'America/Cayman','-5'),(216,'GMT+06:00',21600,'Asia/Almaty','6'),(217,'GMT+05:00',18000,'Asia/Aqtau','5'),(218,'GMT+05:00',18000,'Asia/Aqtobe','5'),(219,'GMT+05:00',18000,'Asia/Atyrau','5'),(220,'GMT+05:00',18000,'Asia/Oral','5'),(221,'GMT+06:00',21600,'Asia/Qostanay','6'),(222,'GMT+05:00',18000,'Asia/Qyzylorda','5'),(223,'GMT+07:00',25200,'Asia/Vientiane','7'),(224,'GMT+02:00',7200,'Asia/Beirut','2'),(225,'GMT-04:00',-14400,'America/St_Lucia','-4'),(226,'GMT+01:00',3600,'Europe/Vaduz','1'),(227,'GMT+05:30',19800,'Asia/Colombo','5'),(228,'GMT+00:00',0,'Africa/Monrovia','0'),(229,'GMT+02:00',7200,'Africa/Maseru','2'),(230,'GMT+02:00',7200,'Europe/Vilnius','2'),(231,'GMT+01:00',3600,'Europe/Luxembourg','1'),(232,'GMT+02:00',7200,'Europe/Riga','2'),(233,'GMT+02:00',7200,'Africa/Tripoli','2'),(234,'GMT+01:00',3600,'Africa/Casablanca','1'),(235,'GMT+01:00',3600,'Europe/Monaco','1'),(236,'GMT+02:00',7200,'Europe/Chisinau','2'),(237,'GMT+01:00',3600,'Europe/Podgorica','1'),(238,'GMT-04:00',-14400,'America/Marigot','-4'),(239,'GMT+03:00',10800,'Indian/Antananarivo','3'),(240,'GMT+12:00',43200,'Pacific/Kwajalein','12'),(241,'GMT+12:00',43200,'Pacific/Majuro','12'),(242,'GMT+01:00',3600,'Europe/Skopje','1'),(243,'GMT+00:00',0,'Africa/Bamako','0'),(244,'GMT+06:30',23400,'Asia/Yangon','6'),(245,'GMT+08:00',28800,'Asia/Choibalsan','8'),(246,'GMT+07:00',25200,'Asia/Hovd','7'),(247,'GMT+08:00',28800,'Asia/Ulaanbaatar','8'),(248,'GMT+08:00',28800,'Asia/Macau','8'),(249,'GMT+10:00',36000,'Pacific/Saipan','10'),(250,'GMT-04:00',-14400,'America/Martinique','-4'),(251,'GMT+00:00',0,'Africa/Nouakchott','0'),(252,'GMT-04:00',-14400,'America/Montserrat','-4'),(253,'GMT+01:00',3600,'Europe/Malta','1'),(254,'GMT+04:00',14400,'Indian/Mauritius','4'),(255,'GMT+05:00',18000,'Indian/Maldives','5'),(256,'GMT+02:00',7200,'Africa/Blantyre','2'),(257,'GMT-06:00',-21600,'America/Bahia_Banderas','-6'),(258,'GMT-05:00',-18000,'America/Cancun','-5'),(259,'GMT-07:00',-25200,'America/Chihuahua','-7'),(260,'GMT-07:00',-25200,'America/Hermosillo','-7'),(261,'GMT-06:00',-21600,'America/Matamoros','-6'),(262,'GMT-07:00',-25200,'America/Mazatlan','-7'),(263,'GMT-06:00',-21600,'America/Merida','-6'),(264,'GMT-06:00',-21600,'America/Mexico_City','-6'),(265,'GMT-06:00',-21600,'America/Monterrey','-6'),(266,'GMT-07:00',-25200,'America/Ojinaga','-7'),(267,'GMT-08:00',-28800,'America/Tijuana','-8'),(268,'GMT+08:00',28800,'Asia/Kuala_Lumpur','8'),(269,'GMT+08:00',28800,'Asia/Kuching','8'),(270,'GMT+02:00',7200,'Africa/Maputo','2'),(271,'GMT+02:00',7200,'Africa/Windhoek','2'),(272,'GMT+11:00',39600,'Pacific/Noumea','11'),(273,'GMT+01:00',3600,'Africa/Niamey','1'),(274,'GMT+12:00',43200,'Pacific/Norfolk','12'),(275,'GMT+01:00',3600,'Africa/Lagos','1'),(276,'GMT-06:00',-21600,'America/Managua','-6'),(277,'GMT+01:00',3600,'Europe/Amsterdam','1'),(278,'GMT+01:00',3600,'Europe/Oslo','1'),(279,'GMT+05:45',20700,'Asia/Kathmandu','5'),(280,'GMT+12:00',43200,'Pacific/Nauru','12'),(281,'GMT-11:00',-39600,'Pacific/Niue','-11'),(282,'GMT+13:00',46800,'Pacific/Auckland','13'),(283,'GMT+13:45',49500,'Pacific/Chatham','13'),(284,'GMT+04:00',14400,'Asia/Muscat','4'),(285,'GMT-05:00',-18000,'America/Panama','-5'),(286,'GMT-05:00',-18000,'America/Lima','-5'),(287,'GMT-09:00',-32400,'Pacific/Gambier','-9'),(288,'GMT-09:30',-34200,'Pacific/Marquesas','-10'),(289,'GMT-10:00',-36000,'Pacific/Tahiti','-10'),(290,'GMT+11:00',39600,'Pacific/Bougainville','11'),(291,'GMT+10:00',36000,'Pacific/Port_Moresby','10'),(292,'GMT+08:00',28800,'Asia/Manila','8'),(293,'GMT+05:00',18000,'Asia/Karachi','5'),(294,'GMT+01:00',3600,'Europe/Warsaw','1'),(295,'GMT-03:00',-10800,'America/Miquelon','-3'),(296,'GMT-08:00',-28800,'Pacific/Pitcairn','-8'),(297,'GMT-04:00',-14400,'America/Puerto_Rico','-4'),(298,'GMT+02:00',7200,'Asia/Gaza','2'),(299,'GMT+02:00',7200,'Asia/Hebron','2'),(300,'GMT-01:00',-3600,'Atlantic/Azores','-1'),(301,'GMT+00:00',0,'Atlantic/Madeira','0'),(302,'GMT+00:00',0,'Europe/Lisbon','0'),(303,'GMT+09:00',32400,'Pacific/Palau','9'),(304,'GMT-03:00',-10800,'America/Asuncion','-3'),(305,'GMT+03:00',10800,'Asia/Qatar','3'),(306,'GMT+04:00',14400,'Indian/Reunion','4'),(307,'GMT+02:00',7200,'Europe/Bucharest','2'),(308,'GMT+01:00',3600,'Europe/Belgrade','1'),(309,'GMT+12:00',43200,'Asia/Anadyr','12'),(310,'GMT+07:00',25200,'Asia/Barnaul','7'),(311,'GMT+09:00',32400,'Asia/Chita','9'),(312,'GMT+08:00',28800,'Asia/Irkutsk','8'),(313,'GMT+12:00',43200,'Asia/Kamchatka','12'),(314,'GMT+09:00',32400,'Asia/Khandyga','9'),(315,'GMT+07:00',25200,'Asia/Krasnoyarsk','7'),(316,'GMT+11:00',39600,'Asia/Magadan','11'),(317,'GMT+07:00',25200,'Asia/Novokuznetsk','7'),(318,'GMT+07:00',25200,'Asia/Novosibirsk','7'),(319,'GMT+06:00',21600,'Asia/Omsk','6'),(320,'GMT+11:00',39600,'Asia/Sakhalin','11'),(321,'GMT+11:00',39600,'Asia/Srednekolymsk','11'),(322,'GMT+07:00',25200,'Asia/Tomsk','7'),(323,'GMT+10:00',36000,'Asia/Ust-Nera','10'),(324,'GMT+10:00',36000,'Asia/Vladivostok','10'),(325,'GMT+09:00',32400,'Asia/Yakutsk','9'),(326,'GMT+05:00',18000,'Asia/Yekaterinburg','5'),(327,'GMT+04:00',14400,'Europe/Astrakhan','4'),(328,'GMT+02:00',7200,'Europe/Kaliningrad','2'),(329,'GMT+03:00',10800,'Europe/Kirov','3'),(330,'GMT+03:00',10800,'Europe/Moscow','3'),(331,'GMT+04:00',14400,'Europe/Samara','4'),(332,'GMT+04:00',14400,'Europe/Saratov','4'),(333,'GMT+04:00',14400,'Europe/Ulyanovsk','4'),(334,'GMT+03:00',10800,'Europe/Volgograd','3'),(335,'GMT+02:00',7200,'Africa/Kigali','2'),(336,'GMT+03:00',10800,'Asia/Riyadh','3'),(337,'GMT+11:00',39600,'Pacific/Guadalcanal','11'),(338,'GMT+04:00',14400,'Indian/Mahe','4'),(339,'GMT+02:00',7200,'Africa/Khartoum','2'),(340,'GMT+01:00',3600,'Europe/Stockholm','1'),(341,'GMT+08:00',28800,'Asia/Singapore','8'),(342,'GMT+00:00',0,'Atlantic/St_Helena','0'),(343,'GMT+01:00',3600,'Europe/Ljubljana','1'),(344,'GMT+01:00',3600,'Arctic/Longyearbyen','1'),(345,'GMT+01:00',3600,'Europe/Bratislava','1'),(346,'GMT+00:00',0,'Africa/Freetown','0'),(347,'GMT+01:00',3600,'Europe/San_Marino','1'),(348,'GMT+00:00',0,'Africa/Dakar','0'),(349,'GMT+03:00',10800,'Africa/Mogadishu','3'),(350,'GMT-03:00',-10800,'America/Paramaribo','-3'),(351,'GMT+03:00',10800,'Africa/Juba','3'),(352,'GMT+00:00',0,'Africa/Sao_Tome','0'),(353,'GMT-06:00',-21600,'America/El_Salvador','-6'),(354,'GMT-04:00',-14400,'America/Lower_Princes','-4'),(355,'GMT+02:00',7200,'Asia/Damascus','2'),(356,'GMT+02:00',7200,'Africa/Mbabane','2'),(357,'GMT-05:00',-18000,'America/Grand_Turk','-5'),(358,'GMT+01:00',3600,'Africa/Ndjamena','1'),(359,'GMT+05:00',18000,'Indian/Kerguelen','5'),(360,'GMT+00:00',0,'Africa/Lome','0'),(361,'GMT+07:00',25200,'Asia/Bangkok','7'),(362,'GMT+05:00',18000,'Asia/Dushanbe','5'),(363,'GMT+13:00',46800,'Pacific/Fakaofo','13'),(364,'GMT+09:00',32400,'Asia/Dili','9'),(365,'GMT+05:00',18000,'Asia/Ashgabat','5'),(366,'GMT+01:00',3600,'Africa/Tunis','1'),(367,'GMT+13:00',46800,'Pacific/Tongatapu','13'),(368,'GMT+03:00',10800,'Europe/Istanbul','3'),(369,'GMT-04:00',-14400,'America/Port_of_Spain','-4'),(370,'GMT+12:00',43200,'Pacific/Funafuti','12'),(371,'GMT+08:00',28800,'Asia/Taipei','8'),(372,'GMT+03:00',10800,'Africa/Dar_es_Salaam','3'),(373,'GMT+02:00',7200,'Europe/Kiev','2'),(374,'GMT+03:00',10800,'Europe/Simferopol','3'),(375,'GMT+02:00',7200,'Europe/Uzhgorod','2'),(376,'GMT+02:00',7200,'Europe/Zaporozhye','2'),(377,'GMT+03:00',10800,'Africa/Kampala','3'),(378,'GMT-11:00',-39600,'Pacific/Midway','-11'),(379,'GMT+12:00',43200,'Pacific/Wake','12'),(380,'GMT-10:00',-36000,'America/Adak','-10'),(381,'GMT-09:00',-32400,'America/Anchorage','-9'),(382,'GMT-07:00',-25200,'America/Boise','-7'),(383,'GMT-06:00',-21600,'America/Chicago','-6'),(384,'GMT-07:00',-25200,'America/Denver','-7'),(385,'GMT-05:00',-18000,'America/Detroit','-5'),(386,'GMT-05:00',-18000,'America/Indiana/Indianapolis','-5'),(387,'GMT-06:00',-21600,'America/Indiana/Knox','-6'),(388,'GMT-05:00',-18000,'America/Indiana/Marengo','-5'),(389,'GMT-05:00',-18000,'America/Indiana/Petersburg','-5'),(390,'GMT-06:00',-21600,'America/Indiana/Tell_City','-6'),(391,'GMT-05:00',-18000,'America/Indiana/Vevay','-5'),(392,'GMT-05:00',-18000,'America/Indiana/Vincennes','-5'),(393,'GMT-05:00',-18000,'America/Indiana/Winamac','-5'),(394,'GMT-09:00',-32400,'America/Juneau','-9'),(395,'GMT-05:00',-18000,'America/Kentucky/Louisville','-5'),(396,'GMT-05:00',-18000,'America/Kentucky/Monticello','-5'),(397,'GMT-08:00',-28800,'America/Los_Angeles','-8'),(398,'GMT-06:00',-21600,'America/Menominee','-6'),(399,'GMT-09:00',-32400,'America/Metlakatla','-9'),(400,'GMT-05:00',-18000,'America/New_York','-5'),(401,'GMT-09:00',-32400,'America/Nome','-9'),(402,'GMT-06:00',-21600,'America/North_Dakota/Beulah','-6'),(403,'GMT-06:00',-21600,'America/North_Dakota/Center','-6'),(404,'GMT-06:00',-21600,'America/North_Dakota/New_Salem','-6'),(405,'GMT-07:00',-25200,'America/Phoenix','-7'),(406,'GMT-09:00',-32400,'America/Sitka','-9'),(407,'GMT-09:00',-32400,'America/Yakutat','-9'),(408,'GMT-10:00',-36000,'Pacific/Honolulu','-10'),(409,'GMT-03:00',-10800,'America/Montevideo','-3'),(410,'GMT+05:00',18000,'Asia/Samarkand','5'),(411,'GMT+05:00',18000,'Asia/Tashkent','5'),(412,'GMT+01:00',3600,'Europe/Vatican','1'),(413,'GMT-04:00',-14400,'America/St_Vincent','-4'),(414,'GMT-04:00',-14400,'America/Caracas','-4'),(415,'GMT-04:00',-14400,'America/Tortola','-4'),(416,'GMT-04:00',-14400,'America/St_Thomas','-4'),(417,'GMT+07:00',25200,'Asia/Ho_Chi_Minh','7'),(418,'GMT+11:00',39600,'Pacific/Efate','11'),(419,'GMT+12:00',43200,'Pacific/Wallis','12'),(420,'GMT+14:00',50400,'Pacific/Apia','14'),(421,'GMT+03:00',10800,'Asia/Aden','3'),(422,'GMT+03:00',10800,'Indian/Mayotte','3'),(423,'GMT+02:00',7200,'Africa/Johannesburg','2'),(424,'GMT+02:00',7200,'Africa/Lusaka','2'),(425,'GMT+02:00',7200,'Africa/Harare','2');
/*!40000 ALTER TABLE `timezone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translations`
--

DROP TABLE IF EXISTS `translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `translations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `module_name` varchar(255) NOT NULL,
  `en_En` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `en_En` (`en_En`)
) ENGINE=InnoDB AUTO_INCREMENT=2582 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translations`
--

LOCK TABLES `translations` WRITE;
/*!40000 ALTER TABLE `translations` DISABLE KEYS */;
INSERT INTO `translations` VALUES (1,'Access Number','Access Number'),(2,'Access Numbers','Access Numbers'),(3,'Account','Account'),(4,'Account Type','Account Type'),(5,'Account Valid Days','Account Valid Days'),(6,'Account Verification By','Account Verification By'),(7,'Accounts','Accounts'),(8,'Accounts Report','Accounts Report'),(9,'ACD','ACD'),(10,'Action','Action'),(11,'Action Type','Action Type'),(12,'Add','Add'),(13,'Add Country','Add Country'),(14,'Add Currency','Add Currency'),(15,'Add Destination','Add Destination'),(16,'Add Ratedeck','Add Ratedeck'),(17,'Address1','Address1'),(18,'Administrator','Administrator'),(19,'Administrator Admin','Administrator Admin'),(20,'Admins','Admins'),(21,'After Balance','After Balance'),(22,'Alarm','Alarm'),(23,'Alert Status','Alert Status'),(24,'Allow integration with Fraud detection','Allow integration with Fraud detection'),(25,'Allow IP Management','Allow IP Management'),(26,'Allow Local Call','Allow Local Call'),(27,'Allow Local Calls','Allow Local Calls'),(28,'Allow Loss Less Routing','Allow Loss Less Routing'),(29,'Allow Max Retries','Allow Max Retries'),(30,'Allow Recording','Allow Recording'),(31,'Amount','Amount'),(32,'Amount INR','Amount INR'),(33,'Answered Calls','Answered Calls'),(34,'Applicable For','Applicable For'),(35,'Apply on existing accounts','Apply on existing accounts'),(36,'Archive','Archive'),(37,'ASR','ASR'),(38,'Attachement','Attachement'),(39,'Attempted Calls','Attempted Calls'),(40,'Audit','Audit'),(41,'Audit Log','Audit Log'),(42,'Audit Logs Older Than Days','Audit Logs Older Than Days'),(43,'Authorize.net','Authorize.net'),(44,'Automatically','Automatically'),(45,'Balance','Balance'),(46,'Balance Announcement','Balance Announcement'),(47,'Balance Below','Balance Below'),(48,'Base Currency','Base Currency'),(49,'Basic','Basic'),(50,'Basic Information','Basic Information'),(51,'Batch Update','Batch Update'),(52,'Before Balance INR','Before Balance INR'),(53,'Begins With','Begins With'),(54,'Beta','Beta'),(55,'Billable','Billable'),(56,'Billing','Billing'),(57,'Billing Cycle','Billing Cycle'),(58,'Billing Days','Billing Days'),(59,'Billing Information','Billing Information'),(60,'Billing Type','Billing Type'),(61,'Body','Body'),(62,'Buy Cost','Buy Cost'),(63,'Call Barring','Call Barring'),(64,'Call Date','Call Date'),(65,'Call Detail Reports','Call Detail Reports'),(66,'Call Max Length','Call Max Length'),(67,'Call State','Call State'),(68,'Call Summary Reports','Call Summary Reports'),(69,'Call Timeout','Call Timeout'),(70,'Call Type','Call Type'),(71,'Call Types','Call Types'),(72,'Called Number','Called Number'),(73,'Caller ID','Caller ID'),(74,'Caller IDs','Caller IDs'),(75,'Caller IP','Caller IP'),(76,'Caller Name','Caller Name'),(77,'Caller Number','Caller Number'),(78,'Caller-Id-In-Form','Caller-Id-In-Form'),(79,'Calling Card','Calling Card'),(80,'Calls','Calls'),(81,'Calls Breakdown','Calls Breakdown'),(82,'Calltype Information','Calltype Information'),(83,'Can be purchased?','Can be purchased?'),(84,'Capital','Capital'),(85,'Capture Server','Capture Server'),(86,'Card Input Timeout','Card Input Timeout'),(87,'Card Length','Card Length'),(88,'Card Retries','Card Retries'),(89,'Carriers','Carriers'),(90,'Category','Category'),(91,'CC','CC'),(92,'CDRs Older Than Days','CDRs Older Than Days'),(93,'Charge Type','Charge Type'),(94,'Charges Breakdown','Charges Breakdown'),(95,'Charges History','Charges History'),(96,'CID','CID'),(97,'City','City'),(98,'Clear','Clear'),(99,'Client IP','Client IP'),(100,'Client User Agent','Client User Agent'),(101,'Code','Code'),(102,'Codecs','Codecs'),(103,'Commission','Commission'),(104,'Commission Rate','Commission Rate'),(105,'Commission Reports','Commission Reports'),(106,'Company','Company'),(107,'Company Profiles','Company Profiles'),(108,'Company Tax number','Company Tax number'),(109,'Completed Calls','Completed Calls'),(110,'Concurrent Calls','Concurrent Calls'),(111,'Configuration','Configuration'),(112,'Confirmed','Confirmed'),(113,'Connection Cost','Connection Cost'),(114,'Contains','Contains'),(115,'Cost','Cost'),(116,'Cost/Min','Cost/Min'),(117,'Countries','Countries'),(118,'Country','Country'),(119,'Country Code','Country Code'),(120,'Country List','Country List'),(121,'Country Reports','Country Reports'),(122,'Coupon Information','Coupon Information'),(123,'Coupon Number','Coupon Number'),(124,'CPS','CPS'),(125,'Create','Create'),(126,'Create Admin','Create Admin'),(127,'Create calltype','Create calltype'),(128,'Create Company Profile','Create Company Profile'),(129,'Create Customer','Create Customer'),(130,'Create Origination Rate','Create Origination Rate'),(131,'Create Product','Create Product'),(132,'Create Provider','Create Provider'),(133,'Create Rate Group','Create Rate Group'),(134,'Create Refill Coupon','Create Refill Coupon'),(135,'Create SIP Device','Create SIP Device'),(136,'Create Tax','Create Tax'),(137,'Created Date','Created Date'),(138,'Creation Date','Creation Date'),(139,'Credit','Credit'),(140,'Credit Limit','Credit Limit'),(141,'Crons','Crons'),(142,'Currency','Currency'),(143,'Currency Conversion Loss Percentage','Currency Conversion Loss Percentage'),(144,'Currency List','Currency List'),(145,'Customer','Customer'),(146,'Customer CDRs Report','Customer CDRs Report'),(147,'Customer Summary','Customer Summary'),(148,'Customer Summary Report','Customer Summary Report'),(149,'Customers','Customers'),(150,'Dashboard','Dashboard'),(151,'Database','Database'),(152,'Date','Date'),(153,'Debit','Debit'),(154,'Debug','Debug'),(155,'Decimal Points','Decimal Points'),(156,'Default Increment','Default Increment'),(157,'Default Invoice Mode','Default Invoice Mode'),(158,'Default Tax','Default Tax'),(159,'Delete','Delete'),(160,'Deleted Accounts After Days','Deleted Accounts After Days'),(161,'Description','Description'),(162,'Destination','Destination'),(163,'Dial Input Timeout','Dial Input Timeout'),(164,'DID','DID'),(165,'DIDs','DIDs'),(166,'Direction','Direction'),(167,'Disable','Disable'),(168,'Display records in','Display records in'),(169,'Disposition','Disposition'),(170,'Documentation','Documentation'),(171,'Doesnt Contain','Doesnt Contain'),(172,'Domain','Domain'),(173,'Draft','Draft'),(174,'Due Date','Due Date'),(175,'Duplicate','Duplicate'),(176,'Duration','Duration'),(177,'Email','Email'),(178,'Email Alerts ?','Email Alerts ?'),(179,'Email History','Email History'),(180,'Email History List','Email History List'),(181,'Email Notification','Email Notification'),(182,'Email Notifications','Email Notifications'),(183,'Email Status','Email Status'),(184,'Email Template','Email Template'),(185,'Emails Older Than Days','Emails Older Than Days'),(186,'En','En'),(187,'Enable','Enable'),(188,'Enable Signup','Enable Signup'),(189,'Ends With','Ends With'),(190,'Enterprise','Enterprise'),(191,'Entity Type','Entity Type'),(192,'Environment','Environment'),(193,'Ewallet Payment Gateway','Ewallet Payment Gateway'),(194,'Expired Accounts After Days','Expired Accounts After Days'),(195,'Expiry Date','Expiry Date'),(196,'Export','Export'),(197,'Failover  GW Name #1','Failover  GW Name #1'),(198,'Failover GW Name #2','Failover GW Name #2'),(199,'Favicon','Favicon'),(200,'Fax','Fax'),(201,'Fee','Fee'),(202,'File Path','File Path'),(203,'Filter','Filter'),(204,'First Name','First Name'),(205,'First Used','First Used'),(206,'Fixer Key','Fixer Key'),(207,'FMAddon','FMAddon'),(208,'Footer','Footer'),(209,'Fraud Detection','Fraud Detection'),(210,'Free Minutes','Free Minutes'),(211,'FreeSwitch Servers','FreeSwitch Servers'),(212,'From','From'),(213,'From Date','From Date'),(214,'From Timestamp','From Timestamp'),(215,'Gateway Name','Gateway Name'),(216,'Gateways','Gateways'),(217,'General','General'),(218,'General Input Timeout','General Input Timeout'),(219,'Generate Invoice','Generate Invoice'),(220,'Generate Pin','Generate Pin'),(221,'Generates Alarm From System','Generates Alarm From System'),(222,'Generates Local Number system','Generates Local Number system'),(223,'Generates ticket of issues from system','Generates ticket of issues from system'),(224,'Generates Various Alarms From System','Generates Various Alarms From System'),(225,'Generates Various Country Reports From System','Generates Various Country Reports From System'),(226,'Generates various reports from system','Generates various reports from system'),(227,'Get Addons','Get Addons'),(228,'Get App','Get App'),(229,'Global','Global'),(230,'Grace Time','Grace Time'),(231,'Grand Total','Grand Total'),(232,'Group By','Group By'),(233,'Group By #1','Group By #1'),(234,'Group By #2','Group By #2'),(235,'Group By #3','Group By #3'),(236,'Group By #Time','Group By #Time'),(237,'Header','Header'),(238,'Homer','Homer'),(239,'Host','Host'),(240,'Import','Import'),(241,'Import Customers','Import Customers'),(242,'Import with field map','Import with field map'),(243,'Inbound','Inbound'),(244,'Inbound Fax','Inbound Fax'),(245,'Included Seconds','Included Seconds'),(246,'Increment','Increment'),(247,'Initial Balance','Initial Balance'),(248,'Initial Increment','Initial Increment'),(249,'Invoices Older Than Days','Invoices Older Than Days'),(250,'Install','Install'),(251,'Installed','Installed'),(252,'Interval','Interval'),(253,'Interval Type','Interval Type'),(254,'Invoice Configuration','Invoice Configuration'),(255,'Invoice Date','Invoice Date'),(256,'Invoice Due Days','Invoice Due Days'),(257,'Invoice Due Notification','Invoice Due Notification'),(258,'Invoice Notification','Invoice Notification'),(259,'Invoice Number','Invoice Number'),(260,'Invoice Prefix','Invoice Prefix'),(261,'Invoice Start Form','Invoice Start Form'),(262,'Invoices','Invoices'),(263,'IP','IP'),(264,'IP Settings','IP Settings'),(265,'Is Equal To','Is Equal To'),(266,'Is Not Equal To','Is Not Equal To'),(267,'Is Purchased?','Is Purchased?'),(268,'Iso','Iso'),(269,'Iso3','Iso3'),(270,'IVR Count','IVR Count'),(271,'Languages','Languages'),(272,'Last Execution Date','Last Execution Date'),(273,'Last Modified Date','Last Modified Date'),(274,'Last Name','Last Name'),(275,'Last Paid Date','Last Paid Date'),(276,'Latest Orders','Latest Orders'),(277,'LC Charge / Min','LC Charge / Min'),(278,'LC Charge/Min','LC Charge/Min'),(279,'Live','Live'),(280,'Live Call Report','Live Call Report'),(281,'Live Id','Live Id'),(282,'Live Key','Live Key'),(283,'Live Url','Live Url'),(284,'Local Call Timeout','Local Call Timeout'),(285,'Local Number','Local Number'),(286,'Local Numbers','Local Numbers'),(287,'Locale code','Locale code'),(288,'Localization','Localization'),(289,'Localization Type','Localization Type'),(290,'Localizations','Localizations'),(291,'Log out','Log out'),(292,'Log Path','Log Path'),(293,'Logo','Logo'),(294,'Low balance Alert?','Low balance Alert?'),(295,'Mail Log','Mail Log'),(296,'Manually','Manually'),(297,'Markup','Markup'),(298,'Mass Create','Mass Create'),(299,'Mass Email','Mass Email'),(300,'Max Free Length','Max Free Length'),(301,'MCD','MCD'),(302,'Minimum Fund Transfer','Minimum Fund Transfer'),(303,'Minutes','Minutes'),(304,'Minutes Announcement','Minutes Announcement'),(305,'Minutes Breakdown','Minutes Breakdown'),(306,'Moderate','Moderate'),(307,'Modified Date','Modified Date'),(308,'Module','Module'),(309,'Name','Name'),(310,'New Accounts','New Accounts'),(311,'Nexmo API Key','Nexmo API Key'),(312,'Nexmo Secret Key','Nexmo Secret Key'),(313,'Next Execution Date','Next Execution Date'),(314,'Nickname','Nickname'),(315,'No','No'),(316,'No Records Found','No Records Found'),(317,'Notes','Notes'),(318,'Notifications','Notifications'),(319,'Notify before due days','Notify before due days'),(320,'Number','Number'),(321,'Number Type','Number Type'),(322,' of ',' of '),(323,'Opensips','Opensips'),(324,'Opensips DB Engine','Opensips DB Engine'),(325,'Opensips DB Host','Opensips DB Host'),(326,'Opensips DB Name','Opensips DB Name'),(327,'Opensips DB Pass','Opensips DB Pass'),(328,'Opensips DB User','Opensips DB User'),(329,'Opensips Domain','Opensips Domain'),(330,'Opensource','Opensource'),(331,'Order','Order'),(332,'Order Amount','Order Amount'),(333,'Order Date','Order Date'),(334,'Order ID','Order ID'),(335,'Order Now','Order Now'),(336,'Orders','Orders'),(337,'Org. Cost','Org. Cost'),(338,'Org. Destination','Org. Destination'),(339,'Org. Pefix','Org. Pefix'),(340,'Origination Rates','Origination Rates'),(341,'Outbound Fax','Outbound Fax'),(342,'Outstanding Amount INR','Outstanding Amount INR'),(343,' Page ','Page '),(344,'Password','Password'),(345,'Password Strength','Password Strength'),(346,'Payment Method','Payment Method'),(347,'Payment Methods','Payment Methods'),(348,'Payment Status','Payment Status'),(349,'Paypal','Paypal'),(350,'Per Minute Cost','Per Minute Cost'),(351,'Phone','Phone'),(352,'Pin Input Timeout','Pin Input Timeout'),(353,'Pin Length','Pin Length'),(354,'Pin retries','Pin retries'),(355,'Pinless Authentication','Pinless Authentication'),(356,'Place Order','Place Order'),(357,'Playback Audio Notifications','Playback Audio Notifications'),(358,'Port','Port'),(359,'Portal personalization','Portal personalization'),(360,'Powered by ASTPP','Powered by ASTPP'),(361,'Prefix','Prefix'),(362,'Prepend','Prepend'),(363,'Preserve','Preserve'),(364,'Price','Price'),(365,'Priority','Priority'),(366,'Product Category','Product Category'),(367,'Product Details','Product Details'),(368,'Product Name','Product Name'),(369,'Products','Products'),(370,'Profile Action','Profile Action'),(371,'Profit','Profit'),(372,'Provider','Provider'),(373,'Provider CDRs Report','Provider CDRs Report'),(374,'Provider Outbound','Provider Outbound'),(375,'Provider Outbound Report','Provider Outbound Report'),(376,'Provider Summary Report','Provider Summary Report'),(377,'Province','Province'),(378,'Province/State','Province/State'),(379,'Proxy','Proxy'),(380,'Purge','Purge'),(381,'Push Notifications','Push Notifications'),(382,'Quantity','Quantity'),(383,'Rate','Rate'),(384,'Rate Announcement','Rate Announcement'),(385,'Rate Count','Rate Count'),(386,'Rate Group','Rate Group'),(387,'Rate Groups','Rate Groups'),(388,'Rate Information','Rate Information'),(389,'Ratedeck','Ratedeck'),(390,'Ratedeck Information','Ratedeck Information'),(391,'Rates Count','Rates Count'),(392,'Realtime Billing','Realtime Billing'),(393,'Receiver Email','Receiver Email'),(394,'Recording Files Older Than Days','Recording Files Older Than Days'),(395,' Records',' Records'),(396,'Referer Page','Referer Page'),(397,'Refill By','Refill By'),(398,'Refill Coupon Length','Refill Coupon Length'),(399,'Refill Coupons','Refill Coupons'),(400,'Refill Report','Refill Report'),(401,'Refills','Refills'),(402,'Register','Register'),(403,'Release if no balance','Release if no balance'),(404,'Report a Bug','Report a Bug'),(405,'Reports','Reports'),(406,'Request URI','Request URI'),(407,'Reseller','Reseller'),(408,'Reseller can resell','Reseller can resell'),(409,'Reseller Summary','Reseller Summary'),(410,'Reseller Summary Report','Reseller Summary Report'),(411,'Resellers','Resellers'),(412,'Resellers CDRs Report','Resellers CDRs Report'),(413,'Resend Mail','Resend Mail'),(414,'Role','Role'),(415,'Roles & Permission','Roles & Permission'),(416,'Roles & Permissions','Roles & Permissions'),(417,'Routing Prefix','Routing Prefix'),(418,'Routing Type','Routing Type'),(419,'Sandbox','Sandbox'),(420,'Sandbox Id','Sandbox Id'),(421,'Sandbox Key','Sandbox Key'),(422,'Sandbox Name','Sandbox Name'),(423,'Sandbox Url','Sandbox Url'),(424,'Save','Save'),(425,'Schedule Reports','Schedule Reports'),(426,'Search','Search'),(427,'Select File','Select File'),(428,'Select Year','Select Year'),(429,'Services','Services'),(430,'Set Maximum Add card limit','Set Maximum Add card limit'),(431,'Settings','Settings'),(432,'Setup Fee','Setup Fee'),(433,'Signup','Signup'),(434,'SIP Devices','SIP Devices'),(435,'SIP IP','SIP IP'),(436,'SIP Port','SIP Port'),(437,'SIP Profile','SIP Profile'),(438,'SIP Profiles','SIP Profiles'),(439,'SMS','SMS'),(440,'SMS Body','SMS Body'),(441,'SMS Notifications','SMS Notifications'),(442,'SMS Status','SMS Status'),(443,'SMTP','SMTP'),(444,'SMTP Host','SMTP Host'),(445,'SMTP Pass','SMTP Pass'),(446,'SMTP Port','SMTP Port'),(447,'SMTP User','SMTP User'),(448,'Start prefix','Start prefix'),(449,'Starting Digit','Starting Digit'),(450,'Status','Status'),(451,'Strip','Strip'),(452,'Strong','Strong'),(453,'Subject','Subject'),(454,'Subscription','Subscription'),(455,'Supportticket','Supportticket'),(456,'Switch','Switch'),(457,'Tariff','Tariff'),(458,'Tax','Tax'),(459,'Tax Information','Tax Information'),(460,'Telephone','Telephone'),(461,'Telephone as account number','Telephone as account number'),(462,'Templates','Templates'),(463,'Term. Cost','Term. Cost'),(464,'Term. Destination','Term. Destination'),(465,'Term. Prefix','Term. Prefix'),(466,'Term. Trunk','Term. Trunk'),(467,'Termination Rates','Termination Rates'),(468,'Third Party','Third Party'),(469,'This Month','This Month'),(470,'This Week','This Week'),(471,'Timelimit Announcement','Timelimit Announcement'),(472,'Timestamp','Timestamp'),(473,'Timezone','Timezone'),(474,'To','To'),(475,'To Number','To Number'),(476,'To Timestamp','To Timestamp'),(477,'Today','Today'),(478,'Top 10 Accounts','Top 10 Accounts'),(479,'Top 10 Destinations','Top 10 Destinations'),(480,'Total Calls','Total Calls'),(481,'Total Charges','Total Charges'),(482,'Total Minutes','Total Minutes'),(483,'Transaction ID','Transaction ID'),(484,'Translations','Translations'),(485,'Translations Language','Translations Language'),(486,'Trunk','Trunk'),(487,'Trunks','Trunks'),(488,'Type','Type'),(489,'Unpaid','Unpaid'),(490,'Update','Update'),(491,'Used','Used'),(492,'Used Date','Used Date'),(493,'Username','Username'),(494,'Version','Version'),(495,'Version 4.0 Beta','Version 4.0 Beta'),(496,'View All','View All'),(498,'Voicemail','Voicemail'),(500,'Panel Access','Panel Access'),(501,'Profile','Profile'),(502,'Billing Settings','Billing Settings'),(503,'Pin','Pin'),(504,'Account Settings','Account Settings'),(505,'Notification Email','Notification Email'),(506,'Address','Address'),(507,'NON-CLI Rate Group','NON-CLI Rate Group'),(508,'Billing Schedule','Billing Schedule'),(509,'Billing Day','Billing Day'),(510,'Tax Number','Tax Number'),(511,'Invoice Note','Invoice Note'),(512,'Reference','Reference'),(513,'Cancel','Cancel'),(514,'Device Information','Device Information'),(515,'Voicemail Options','Voicemail Options'),(516,'Mail To','Mail To'),(517,'Attach File','Attach File'),(518,'Local After Email','Local After Email'),(519,'Send all Message','Send all Message'),(520,'Close','Close'),(521,'IP map','IP map'),(522,'Identificador de llamadas','Identificador de llamadas'),(523,'Add Caller ID','Add Caller ID'),(524,'Create Reseller','Create Reseller'),(525,'Role Name','Role Name'),(526,'Outstanding Amount','Outstanding Amount'),(527,'To Date','To Date'),(528,'Before Balance','Before Balance'),(529,'Commission Report','Commission Report'),(530,'MonthlyFee','MonthlyFee'),(531,'Grace Time (Sec.)','Grace Time (Sec.)'),(532,'Import DIDs','Import DIDs'),(533,'File must be in the following format','File must be in the following format'),(534,'DID Import Process','DID Import Process'),(535,'Get Sample file','Get Sample file'),(536,'Check Header','Check Header'),(537,'Select the file','Select the file'),(538,'Account Count','Account Count'),(539,'Acc. Number Length','Acc. Number Length'),(540,'Valid Days','Valid Days'),(541,'Create Access Number','Create Access Number'),(542,'Information','Information'),(543,'Import Access Numbers','Import Access Numbers'),(544,'Access Numbers Import Process','Access Numbers Import Process'),(545,'DIDs Bulk Assign','DIDs Bulk Assign'),(546,'Bulk DID Purchase','Bulk DID Purchase'),(547,'Provience','Provience'),(548,'Assign Number','Assign Number'),(549,'DID Destination','DID Destination'),(550,'DID Forward','DID Forward'),(551,'Always','Always'),(552,'If Busy','If Busy'),(553,'If SIP Not Registered','If SIP Not Registered'),(554,'If No Answer','If No Answer'),(555,'New Rate Group Name','New Rate Group Name'),(556,'Duplicate Rate Group Information','Duplicate Rate Group Information'),(557,'Import Origination Rates','Import Origination Rates'),(558,'Force Trunk','Force Trunk'),(559,'Please select atleast one record to dele','Please select atleast one record to dele'),(560,'Import Ratedeck','Import Ratedeck'),(561,'Optional Information','Optional Information'),(562,'From- Domain','From- Domain'),(563,'From User','From User'),(564,'Extension','Extension'),(565,'Extension-In-Contact','Extension-In-Contact'),(566,'Ping','Ping'),(567,'Contact Params','Contact Params'),(568,'Retry-Seconds','Retry-Seconds'),(569,'Register-Proxy','Register-Proxy'),(570,'Channel','Channel'),(571,'Failover GW Name','Failover GW Name'),(572,'Create Trunk','Create Trunk'),(573,'Import Termination Rates','Import Termination Rates'),(574,'Call Timeout (Sec.)','Call Timeout (Sec.)'),(575,'Trunk List','Trunk List'),(576,'Reset','Reset'),(577,'Create SIP Profile','Create SIP Profile'),(578,'Create Freeswitch Server','Create Freeswitch Server'),(579,'Live Calls','Live Calls'),(580,'Term Cost','Term Cost'),(581,'Term Destination','Term Destination'),(582,'Term Prefix','Term Prefix'),(583,'Localizaciones','Localizaciones'),(584,'Create Localization','Create Localization'),(585,'Origination','Origination'),(586,'Termination','Termination'),(587,'Inbound Callerid Translation','Inbound Callerid Translation'),(588,'Destination Number Translation','Destination Number Translation'),(589,'Outbound Callerid Translation','Outbound Callerid Translation'),(590,'Create Call Barring','Create Call Barring'),(591,'Callbarring Settings','Callbarring Settings'),(592,'Product Summary Report','Product Summary Report'),(593,'SIP User','SIP User'),(594,'Product','Product'),(595,'Taxes','Taxes'),(596,'Update Currencies','Update Currencies'),(597,'File Name','File Name'),(598,'Database Information','Database Information'),(599,'Database Backup','Database Backup'),(600,'Command','Command'),(601,'Cron Settings','Cron Settings'),(602,'Create Cron Settings','Create Cron Settings'),(603,'Stripe','Stripe'),(604,'Live Secret key','Live Secret key'),(605,'Live Publishable key','Live Publishable key'),(606,'Set Percentage Charges','Set Percentage Charges'),(607,'Set Fix Charges','Set Fix Charges'),(608,'Stripe Mode','Stripe Mode'),(609,'Sandbox secret key','Sandbox secret key'),(610,'Sandbox publishable key','Sandbox publishable key'),(611,'Version 4.0 Enterprise','Version 4.0 Enterprise'),(612,'Powered by','Powered by'),(613,'Import Customer Using Field Mapper','Import Customer Using Field Mapper'),(614,'You must either select a field from your','You must either select a field from your'),(615,'Records with duplicate account number an','Records with duplicate account number an'),(616,'Account Import Error','Account Import Error'),(617,'Back to Customer List','Back to Customer List'),(618,'Duplicate accounts with account number /','Duplicate accounts with account number /'),(619,'Records imported successfully','Records imported successfully'),(620,'Records not imported','Records not imported'),(621,'Error In CSV File','Error In CSV File'),(622,'Invoice Summary','Invoice Summary'),(623,'Customer Details','Customer Details'),(624,'Invoice Details','Invoice Details'),(625,'Account Number','Account Number'),(626,'Invoice Amount','Invoice Amount'),(627,'Invoice Item','Invoice Item'),(628,'Sub Total','Sub Total'),(629,'Total Due','Total Due'),(630,'Once you confirm the invoice, you will n','Once you confirm the invoice, you will n'),(631,'Note','Note'),(632,'Add Setting','Add Setting'),(633,'Edit SIP Profile','Edit SIP Profile'),(634,'New','New'),(635,'Used?','Used?'),(636,'View Email','View Email'),(637,'Active','Active'),(638,'Inactive','Inactive'),(639,'Black List','Black List'),(640,'White List','White List'),(641,'Freeswitch Server Information','Freeswitch Server Information'),(642,'Currencies','Currencies'),(643,'Edit Currency','Edit Currency'),(644,'Is Distributor','Is Distributor'),(645,'Package created successfully!','Package created successfully!'),(646,'DID Removed Successfully.','DID Removed Successfully.'),(647,'DID not found.','DID not found.'),(648,'Password changed Sucessfully....!!!','Password changed Sucessfully....!!!'),(649,'New Password & Conformpassword not match','New Password & Conformpassword not match'),(650,'Invalid old passwword.','Invalid old passwword.'),(651,'Permission Denied!','Permission Denied!'),(652,'Refill Coupon amount is added successful','Refill Coupon amount is added successful'),(653,'PLease upload maximum file','PLease upload maximum file'),(654,'files added successfully!','files added successfully!'),(655,'File Uploading Fail Please Try Again','File Uploading Fail Please Try Again'),(656,'Please upload only image!','Please upload only image!'),(657,'Invoice config updated successfully!','Invoice config updated successfully!'),(658,'Your Profile Updated Successfully!','Your Profile Updated Successfully!'),(659,'Something wrong.Please contact to admini','Something wrong.Please contact to admini'),(660,'DID Released Successfully!','DID Released Successfully!'),(661,'IP already exist in system.','IP already exist in system.'),(662,'IP Added Sucessfully.','IP Added Sucessfully.'),(663,'IP Removed Sucessfully.','IP Removed Sucessfully.'),(664,'SIP Device Updated Successfully!','SIP Device Updated Successfully!'),(665,'SIP Device Added Successfully!','SIP Device Added Successfully!'),(666,'SIP Device Removed Sucessfully!','SIP Device Removed Sucessfully!'),(667,'Caller ID Added Sucessfully!','Caller ID Added Sucessfully!'),(668,'Please Enter Caller ID value.','Please Enter Caller ID value.'),(669,'Caller ID already Exists.','Caller ID already Exists.'),(670,'Caller ID removed sucessfully!','Caller ID removed sucessfully!'),(671,'Alert Threshold Updated Successfully!','Alert Threshold Updated Successfully!'),(672,'Can not trnasfer fund to postpaid custom','Can not trnasfer fund to postpaid custom'),(673,'Access Denied! unable transfer fund to t','Access Denied! unable transfer fund to t'),(674,'You can not transfer fund in same accoun','You can not transfer fund in same account'),(675,'You can only transfer fund in same level','You can only transfer fund in same level'),(676,'Please enter To account number.','Please enter To account number.'),(677,'Please enter valid amount.','Please enter valid amount.'),(678,'You have insufficient balance.','You have insufficient balance.'),(679,'Please enter valid account number.','Please enter valid account number.'),(680,'Please enter amount greater then 0.','Please enter amount greater then 0.'),(681,'You need to enter minimum for fund trans','You need to enter minimum for fund trans'),(682,'Please enter valid account number!','Please enter valid account number!'),(683,'Insuffiecient amount !','Insuffiecient amount !'),(684,'Transfer successfully!','Transfer successfully!'),(685,'Account number not found.','Account number not found.'),(686,'OpenSips updated successfully!','OpenSips updated successfully!'),(687,'Duplicate Username Found.Username Must b','Duplicate Username Found.Username Must b'),(688,'User name is required field.','User name is required field.'),(689,'Opensips Device Removed Successfully!.','Opensips Device Removed Successfully!.'),(690,'Speed-dial Number Added Successfully!','Speed-dial Number Added Successfully!'),(691,'Can not delete blank speeddial number','Can not delete blank speeddial number'),(692,'Speed-dial Number Removed Successfully!','Speed-dial Number Removed Successfully!'),(693,'Pin Updated Successfully!','Pin Updated Successfully!'),(694,'DID Updated Successfully!','DID Updated Successfully!'),(695,'for fund transfer.','for fund transfer.'),(696,'You need to enter minimum','You need to enter minimum'),(697,'please enter recharge value','please enter recharge value'),(698,'New Password','New Password'),(699,'Old Password','Old Password'),(700,'Conform Password','Conform Password'),(701,'Letters only please','Letters only please'),(702,'IP Mapping','IP Mapping'),(703,'The Coupon Number field must contain onl','The Coupon Number field must contain onl'),(704,'The Coupon Number field have inactive re','The Coupon Number field have inactive re'),(705,'This Coupon Number is already in use.','This Coupon Number is already in use.'),(706,'This Coupon Number is not found.','This Coupon Number is not found.'),(707,'The Coupon Number field is required.','The Coupon Number field is required.'),(708,'REFILL COUPON RECHARGE','REFILL COUPON RECHARGE'),(709,'You just recharged','You just recharged'),(710,'account with The new balance will be','account with The new balance will be'),(711,'My Profile','My Profile'),(712,'My Account','My Account'),(713,'Alert Threshold','Alert Threshold'),(714,'The Caller ID field is required.','The Caller ID field is required.'),(715,'Change Password','Change Password'),(716,'Bill Type','Bill Type'),(717,'Bill Days','Bill Days'),(718,'New Products','New Products'),(719,'Active Products','Active Products'),(720,'Outstanding','Outstanding'),(721,'Today\'s Calls','Today\'s Calls'),(722,'Recent Calls','Recent Calls'),(723,'The Available DIDs field is required.','The Available DIDs field is required.'),(724,'Please enter your password','Please enter your password'),(725,'Please enter your first name','Please enter your first name'),(726,'Please enter your email','Please enter your email'),(727,'Please enter valid email','Please enter valid email'),(728,'This field is required.','This field is required.'),(729,'Email Setting','Email Setting'),(730,'SMTP Password','SMTP Password'),(731,'Are you sure want to remove logo?','Are you sure want to remove logo?'),(732,'The IP field must contain a unique value','The IP field must contain a unique value'),(733,'The IP field have not valid IP.','The IP field have not valid IP.'),(734,'The IP field is required.','The IP field is required.'),(735,'The Name field is required.','The Name field is required.'),(736,'Please enter only alpha-numeric value','Please enter only alpha-numeric value'),(737,'Are you sure want to delete speed dial r','Are you sure want to delete speed dial r'),(738,'Generated Date','Generated Date'),(739,'My Products','My Products'),(740,'Pinless CLI','Pinless CLI'),(741,'Refill Coupon','Refill Coupon'),(742,'TopUp','TopUp'),(743,'Pay with Paypal','Pay with Paypal'),(744,'Pay with Card','Pay with Card'),(745,'Assign','Assign'),(746,'Send Credit','Send Credit'),(747,'To Account','To Account'),(748,'From Account','From Account'),(749,'Transfer','Transfer'),(750,'Telephone 1','Telephone 1'),(751,'Telephone 2','Telephone 2'),(752,'Address 2','Address 2'),(753,'Zip/Postal Code','Zip/Postal Code'),(754,'User Profile','User Profile'),(755,'Low Balance Alert Level','Low Balance Alert Level'),(756,'Enable Email Alerts ?','Enable Email Alerts ?'),(757,'Low Balance Alert Email','Low Balance Alert Email'),(758,'User name','User name'),(759,'Something went to wrong !','Something went to wrong !'),(760,'Product Purchased successfully !','Product Purchased successfully !'),(761,'Insufficent Balance to purchase product','Insufficent Balance to purchase product'),(762,'Product assigned successfully!','Product assigned successfully!'),(763,'Something went wrong !','Something went wrong !'),(764,'Product Not Found','Product Not Found'),(765,'Transaction has been failed','Transaction has been failed'),(766,'not inserted. Transaction has been faile','not inserted. Transaction has been faile'),(767,'Select Customer.','Select Customer.'),(768,'Product Information','Product Information'),(769,'Price+SetUp Fee','Price+SetUp Fee'),(770,'Use Voucher','Use Voucher'),(771,'Amount Without Tax','Amount Without Tax'),(772,'Total Tax','Total Tax'),(773,'Amount With Tax','Amount With Tax'),(774,'Parent Products','Parent Products'),(775,'Edit Product','Edit Product'),(776,'Product updated successfully!','Product updated successfully!'),(777,'Product added successfully!','Product added successfully!'),(778,'Product removed successfully!','Product removed successfully!'),(779,'Product optin successfully!','Product optin successfully!'),(780,'Edit Info','Edit Info'),(781,'Product assign successfully','Product assign successfully'),(782,'Insufficient balance to assign product!','Insufficient balance to assign product!'),(783,'Terminated Updated Successfully!','Terminated Updated Successfully!'),(784,'Terminated','Terminated'),(785,'Setup Cost','Setup Cost'),(786,'Order New','Order New'),(787,'Caller ID updated successfully!','Caller ID updated successfully!'),(788,'Caller ID added successfully!','Caller ID added successfully!'),(789,'Caller ID removed successfully!','Caller ID removed successfully!'),(790,'Name is not contain any space','Name is not contain any space'),(791,'Name already exist in system.','Name already exist in system.'),(792,'Callbarring Settings Updated Successfull','Callbarring Settings Updated Successfull'),(793,'allbarring Settings Added Successfully!','allbarring Settings Added Successfully!'),(794,'Call Barring Removed Successfully!','Call Barring Removed Successfully!'),(795,'Calltype already exist in system.','Calltype already exist in system.'),(796,'Calltype Updated Successfully!','Calltype Updated Successfully!'),(797,'Calltype Added Successfully!','Calltype Added Successfully!'),(798,'calltype removed successfully!','calltype removed successfully!'),(799,'File must be in the following format(.cs','File must be in the following format(.cs'),(800,'Import Package Codes:','Import Package Codes:'),(801,'Code, Destination.','Code, Destination.'),(802,'Records Imported Successfully:','Records Imported Successfully:'),(803,'Records Not Imported :','Records Not Imported :'),(804,'Download Errors','Download Errors'),(805,'Back to Package Patterns List','Back to Package Patterns List'),(806,'Add To List','Add To List'),(807,'Routing Prefix already exist in system.','Routing Prefix already exist in system.'),(808,'Rate Group Updated Successfully!','Rate Group Updated Successfully!'),(809,'Rate Group Added Successfully!','Rate Group Added Successfully!'),(810,'Duplicate Rate Group Added Successfully!','Duplicate Rate Group Added Successfully!'),(811,'Routing Prefix (Enterprise)','Routing Prefix (Enterprise)'),(812,'Priority (Enterprise)','Priority (Enterprise)'),(813,'Percentage (WIP) (Enterprise)','Percentage (WIP) (Enterprise)'),(814,'LCR','LCR'),(815,'Percentage','Percentage'),(816,'Tax removed successfully!','Tax removed successfully!'),(817,'Tax added successfully!','Tax added successfully!'),(818,'Tax updated successfully!','Tax updated successfully!'),(819,'Charges List','Charges List'),(820,'Trunk Updated Successfully!','Trunk Updated Successfully!'),(821,'Trunk Added Successfully!','Trunk Added Successfully!'),(822,'Trunk removed successfully!','Trunk removed successfully!'),(823,'setting updated successfully!','setting updated successfully!'),(824,'Template Updated Successfully!','Template Updated Successfully!'),(825,'Template Added Successfully!','Template Added Successfully!'),(826,'Country Updated successfully!','Country Updated successfully!'),(827,'Country Added successfully!','Country Added successfully!'),(828,'Country removed successfully!','Country removed successfully!'),(829,'Currency Updated Successfully!','Currency Updated Successfully!'),(830,'My Rates','My Rates'),(831,'Cost / Min','Cost / Min'),(832,'Purchase','Purchase'),(833,'Available DIDs','Available DIDs'),(834,'New IP','New IP'),(835,'Digits','Digits'),(836,'Email Address','Email Address'),(837,'Call Forward','Call Forward'),(838,'If Busy:','If Busy:'),(839,'If SIP Not Registered:','If SIP Not Registered:'),(840,'If No Answer:','If No Answer:'),(841,'Pay Now','Pay Now'),(842,'Pay with Account','Pay with Account'),(843,'Please wait, your order is being processed and you will be redirected to the paypal website.','Please wait, your order is being processed and you will be redirected to the paypal website.'),(844,'Coupon Number:','Coupon Number:'),(845,'Add Voucher','Add Voucher'),(846,'Selected Plan','Selected Plan'),(847,'My Product','My Product'),(848,'Parent Product','Parent Product'),(849,'Edit Email Template','Edit Email Template'),(850,'Details','Details'),(851,'KEY','KEY'),(852,'VALUE','VALUE'),(853,'Records with duplicate account number and email will be ignored.','Records with duplicate account number and email will be ignored.'),(854,'Account Details','Account Details'),(855,'Mass Customer','Mass Customer'),(856,'Daily','Daily'),(857,'Monthly','Monthly'),(858,'Prepaid','Prepaid'),(859,'Postpaid','Postpaid'),(860,'Force Caller ID','Force Caller ID'),(861,'Customer Profile','Customer Profile'),(862,'Caller Id Name','Caller Id Name'),(863,'Caller Id Number','Caller Id Number'),(864,'Blocked Codes','Blocked Codes'),(865,'Page will display only receipts and confirmed invoices.','Page will display only receipts and confirmed invoices.'),(866,'Accessnumber Updated Successfully!','Accessnumber Updated Successfully!'),(867,'Accessnumber Removed Successfully!','Accessnumber Removed Successfully!'),(868,'Invalid file format : Only CSV file allows to import records(Can\'t import empty file)','Invalid file format : Only CSV file allows to import records(Can\'t import empty file)'),(869,'Access Number,Country','Access Number,Country'),(870,'Please Select File.','Please Select File.'),(871,'are required','are required'),(872,'is Required','is Required'),(873,'is not Valid','is not Valid'),(874,'Duplicate accessnumber found from database','Duplicate accessnumber found from database'),(875,'Duplicate accessnumber found from import file.','Duplicate accessnumber found from import file.'),(876,'Total','Total'),(877,'AccessNumber Imported Successfully!','AccessNumber Imported Successfully!'),(878,'Records Not Imported:','Records Not Imported:'),(879,'Back to AccessNumber List','Back to AccessNumber List'),(880,'Speed Dial Number Updated Successfully','Speed Dial Number Updated Successfully'),(881,'Please insert only numeric value!','Please insert only numeric value!'),(882,'Speed Dial Number Removed Successfully','Speed Dial Number Removed Successfully'),(883,'Speed Dial Number is Empty','Speed Dial Number is Empty'),(884,'Sip Device removed successfully!','Sip Device removed successfully!'),(885,'Sip updated successfully!','Sip updated successfully!'),(886,'Block Code Removed Sucessfully!','Block Code Removed Sucessfully!'),(887,'Your Account Limit has been reached.Please Change Your Prefix.','Your Account Limit has been reached.Please Change Your Prefix.'),(888,'Please Enter Proper Account Length.','Please Enter Proper Account Length.'),(889,'Bulk customer generate successfully!','Bulk customer generate successfully!'),(890,'Recharge successfully!','Recharge successfully!'),(891,'Post charge applied successfully.','Post charge applied successfully.'),(892,'Account callerID updated successfully!','Account callerID updated successfully!'),(893,'Account callerID added successfully!','Account callerID added successfully!'),(894,'Reseller updated successfully!','Reseller updated successfully!'),(895,'Reseller added successfully!','Reseller added successfully!'),(896,'Updated successfully!','Updated successfully!'),(897,'Added Successfully!','Added Successfully!'),(898,'Customer batch updated successfully!','Customer batch updated successfully!'),(899,'Reseller batch updated successfully!','Reseller batch updated successfully!'),(900,'Customer Removed Successfully!','Customer Removed Successfully!'),(901,'Reseller Removed Successfully!','Reseller Removed Successfully!'),(902,'Provider Removed Successfully!','Provider Removed Successfully!'),(903,'Admin Removed Successfully!','Admin Removed Successfully!'),(904,'Sub Admin Removed Successfully!','Sub Admin Removed Successfully!'),(905,'DID Added Successfully.','DID Added Successfully.'),(906,'DID Already Removed Before.','DID Already Removed Before.'),(907,'Account Tax Added Successfully!','Account Tax Added Successfully!'),(908,'Account Tax Removed Successfully!','Account Tax Removed Successfully!'),(909,'Product Removed Sucessfully.','Product Removed Sucessfully.'),(910,'Email Resend Successfully!','Email Resend Successfully!'),(911,'Email List Updated Successfully!','Email List Updated Successfully!'),(912,'Email List Added Successfully!','Email List Added Successfully!'),(913,'Email Removed Successfully!','Email Removed Successfully!'),(914,'Please Try Again!','Please Try Again!'),(915,'Email BroadCast Successfully!','Email BroadCast Successfully!'),(916,'No Record Found!','No Record Found!'),(917,'Email Address Not Found!','Email Address Not Found!'),(918,'Edit Freeswitch SIP Devices','Edit Freeswitch SIP Devices'),(919,'Create Freeswitch SIP Devices','Create Freeswitch SIP Devices'),(920,'Gateway Updated Successfully!','Gateway Updated Successfully!'),(921,'Gateways already exist in system.','Gateways already exist in system.'),(922,'Gateway name must not have any space.','Gateway name must not have any space.'),(923,'Gateway Added Successfully!','Gateway Added Successfully!'),(924,'Gateway Removed Successfully!','Gateway Removed Successfully!'),(925,'Please enter All profile value!','Please enter All profile value!'),(926,'SIP Profile name must not have any space!','SIP Profile name must not have any space!'),(927,'Duplicate SIP IP OR Port found it must be unique!','Duplicate SIP IP OR Port found it must be unique!'),(928,'SIP Profile Added Successfully!','SIP Profile Added Successfully!'),(929,'Name must be unique!','Name must be unique!'),(930,'SIP Profile Updated Successfully!','SIP Profile Updated Successfully!'),(931,'SIP Setting Added Successfully!','SIP Setting Added Successfully!'),(932,'SIP Setting Updated Successfully!','SIP Setting Updated Successfully!'),(933,'SIP Setting Removed Successfully!','SIP Setting Removed Successfully!'),(934,'SIP Profile Removed Successfully!','SIP Profile Removed Successfully!'),(935,'Host Already Exist in System.','Host Already Exist in System.'),(936,'Freeswitch Server Updated Successfully!','Freeswitch Server Updated Successfully!'),(937,'Freeswitch Server Added Successfully!','Freeswitch Server Added Successfully!'),(938,'Freeswitch Server Removed Successfully!','Freeswitch Server Removed Successfully!'),(939,'Invoice updated successfully!','Invoice updated successfully!'),(940,'Invoice payment done successfully!','Invoice payment done successfully!'),(941,'Account Not Found.','Account Not Found.'),(942,'Invoice payment amount should be higher then the invoice amount.','Invoice payment amount should be higher then the invoice amount.'),(943,'The Favicon file size shoud not exceed 1MB!','The Favicon file size shoud not exceed 1MB!'),(944,'Please upload 250 * 60 size file','Please upload 250 * 60 size file'),(945,'Logo only allows file types of JPG and JPEG.','Logo only allows file types of JPG and JPEG.'),(946,'Favicon only allows file types of ICO, PNG, JPG and JPEG.','Favicon only allows file types of ICO, PNG, JPG and JPEG.'),(947,'Please upload 16 * 16 size of favicon.','Please upload 16 * 16 size of favicon.'),(948,'Company profile updated sucessfully!','Company profile updated sucessfully!'),(949,'Company profile added sucessfully!','Company profile added sucessfully!'),(950,'Permission Denied.','Permission Denied.'),(951,'is Deleted Sucessfully!','is Deleted Sucessfully!'),(952,'To date should not be greater than current date.','To date should not be greater than current date.'),(953,'Invoice generation completed.','Invoice generation completed.'),(954,'No data found','No data found'),(955,'Invoices removed successfully','Invoices removed successfully'),(956,'The Prefix field must contain a unique value.','The Prefix field must contain a unique value.'),(957,'The IP field must contain a unique value.','The IP field must contain a unique value.'),(958,'IP Map added successfully!','IP Map added successfully!'),(959,'IP Map removed successfully!','IP Map removed successfully!'),(960,'Localization Added Successfully!','Localization Added Successfully!'),(961,'Localization Updated Successfully!','Localization Updated Successfully!'),(962,'Localization Removed Successfully!','Localization Removed Successfully!'),(963,'Globalization is already exist in this system','Globalization is already exist in this system'),(964,'Dispatcher Updated Successfully!','Dispatcher Updated Successfully!'),(965,'Dispatcher Added Successfully!','Dispatcher Added Successfully!'),(966,'Dispatcher Removed Successfully!','Dispatcher Removed Successfully!'),(967,'Code is already in system','Code is already in system'),(968,'Country is already in system','Country is already in system'),(969,'Ratedeck updated successfully!','Ratedeck updated successfully!'),(970,'Ratedeck added successfully!','Ratedeck added successfully!'),(971,'Ratedeck removed successfully!','Ratedeck removed successfully!'),(972,'Code,Destination,Province/State,City,Status','Code,Destination,Province/State,City,Status'),(973,'Duplicate Ratedeck Number found from import file.','Duplicate Ratedeck Number found from import file.'),(974,'Ratedeck Imported Successfully!','Ratedeck Imported Successfully!'),(975,'Ratedeck Import Error','Ratedeck Import Error'),(976,'Back to Ratedeck List','Back to Ratedeck List'),(977,'Origination Rate Imported Successfully!','Origination Rate Imported Successfully!'),(978,'Origination Rate Updated Successfully!','Origination Rate Updated Successfully!'),(979,'Origination Rate Added Successfully!','Origination Rate Added Successfully!'),(980,'Termination Rates Batch Updated Successfully!','Termination Rates Batch Updated Successfully!'),(981,'Map CSV to Termination Rates','Map CSV to Termination Rates'),(982,'Data Example','Data Example'),(983,'Map to Field','Map to Field'),(984,'PREFIX/DEFAULT VALUE','PREFIX/DEFAULT VALUE'),(985,'ASTPP Field','ASTPP Field'),(986,'Created','Created'),(987,'Modified','Modified'),(988,'You can not create','You can not create'),(989,'Refill coupon with','Refill coupon with'),(990,'You can create maximum','You can create maximum'),(991,'Refill coupon created successfully!','Refill coupon created successfully!'),(992,'Currency Added Successfully!','Currency Added Successfully!'),(993,'Currency Removed Successfully!','Currency Removed Successfully!'),(994,'Backup Exported Successfully!','Backup Exported Successfully!'),(995,'An error occur when the system tried to backup of the database. Please check yours system settings for the backup section','An error occur when the system tried to backup of the database. Please check yours system settings for the backup section'),(996,'Database Restore successfully.','Database Restore successfully.'),(997,'File not exists!','File not exists!'),(998,'There is a some issue or invalid file format.','There is a some issue or invalid file format.'),(999,'Database backup deleted successfully.','Database backup deleted successfully.'),(1000,'Languages updated successfully!','Languages updated successfully!'),(1001,'Languages removed successfully!','Languages removed successfully!'),(1002,'Languages added successfully!','Languages added successfully!'),(1003,'Translation updated successfully!','Translation updated successfully!'),(1004,'Translation added successfully!','Translation added successfully!'),(1005,'Update Languages','Update Languages'),(1006,'Speed Dial','Speed Dial'),(1007,'Payment','Payment'),(1008,'Method','Method'),(1009,'Once you confirm the invoice, you will no longer able to update it again.','Once you confirm the invoice, you will no longer able to update it again.'),(1010,'Payment Gateway Permission','Payment Gateway Permission'),(1011,'Zip Code','Zip Code'),(1012,'Yes','Yes'),(1013,'Back','Back'),(1014,'Edit Reseller','Edit Reseller'),(1015,'Asignar DID a granel','Asignar DID a granel'),(1016,'DIDs Search','DIDs Search'),(1017,'By Month','By Month'),(1018,'Create Gateway','Create Gateway'),(1019,'Calling Card Language','Calling Card Language'),(1020,'Last','Last'),(1021,'Pay Date','Pay Date'),(1022,'Purchase DID','Purchase DID'),(1023,'Caller-ID-A-Form','Caller-ID-A-Form'),(1024,'Expire Seconds','Expire Seconds'),(1025,'Termination Date','Termination Date'),(1026,'Registration Date','Registration Date'),(1027,'Payment By','Payment By'),(1028,'Product Status','Product Status'),(1029,'Minute','Minute'),(1030,'Hour','Hour'),(1031,'Day','Day'),(1032,'Month','Month'),(1033,'Year','Year'),(1034,'List','List'),(1035,'Edit','Edit'),(1036,'Not Avaialable any Subscription.','Not Avaialable any Subscription.'),(1037,'Not Avaialable any Package for this Country.','Not Avaialable any Package for this Country.'),(1038,'You can only transfer fund in same level account.','You can only transfer fund in same level account.'),(1039,'You can not transfer fund in same account.','You can not transfer fund in same account.'),(1040,'Monthly Fee','Monthly Fee'),(1041,'Bulk DID Assign','Bulk DID Assign'),(1042,'Invoice Start From','Invoice Start From'),(1043,'Edit Gateway','Edit Gateway'),(1044,'Number Of Default Rows','Number Of Default Rows'),(1045,'Mobile Dialer','Mobile Dialer'),(1046,'Trunk Count','Trunk Count'),(1047,'Welcome File','Welcome File'),(1048,'Local Call Timeout (Sec.)','Local Call Timeout (Sec.)'),(1049,'Rate check for DID','Rate check for DID'),(1050,'DID Localization','DID Localization'),(1051,'Voicemail Number','Voicemail Number'),(1052,'OTP Expire Time(min)','OTP Expire Time(min)'),(1053,'Edit Provider','Edit Provider'),(1054,'Product Summary Reports','Product Summary Reports'),(1055,'Edit Origination Rate','Edit Origination Rate'),(1056,'Dialplan Variable','Dialplan Variable'),(1057,'Uninstall','Uninstall'),(1058,'Call Stat','Call Stat'),(1059,'Failed Calls','Failed Calls'),(1060,'Top 10 Countries','Top 10 Countries'),(1061,'By Minutes','By Minutes'),(1062,'By Calls','By Calls'),(1063,'Profit per day','Profit per day'),(1064,'January','January'),(1065,'February','February'),(1066,'March','March'),(1067,'April','April'),(1068,'May','May'),(1069,'June','June'),(1070,'July','July'),(1071,'August','August'),(1072,'September','September'),(1073,'October','October'),(1074,'November','November'),(1075,'December','December'),(1076,'Doesn\'t Contain','Doesn\'t Contain'),(1077,'Greater Than','Greater Than'),(1078,'Less Than','Less Than'),(1079,'Greater Or Equal Than','Greater Or Equal Than'),(1080,'Less Or Equal Than','Less Or Equal Than'),(1081,'Set To','Set To'),(1082,'Increase By','Increase By'),(1083,'Decrease By','Decrease By'),(1084,'Community','Community'),(1085,'You must either select a field from your file OR provide a default value for the following fields:','You must either select a field from your file OR provide a default value for the following fields:'),(1087,'Note : Records with duplicate account number and email will be ignored.','Note : Records with duplicate account number and email will be ignored.'),(1088,'Map CSV to Customers','Map CSV to Customers'),(1089,'Account Information','Account Information'),(1090,'Select Account','Select Account'),(1091,'DEFAULT VALUE','DEFAULT VALUE'),(1092,'SIP Username','SIP Username'),(1093,'sip_username','sip_username'),(1094,'SIP Password','SIP Password'),(1095,'Same as Password','Same as Password'),(1096,'Same as Account Number','Same as Account Number'),(1097,'Random','Random'),(1098,'Import File Data.','Import File Data.'),(1099,'Process Records','Process Records'),(1100,'Note : Duplicate accounts with account number / email are ignored.','Note : Duplicate accounts with account number / email are ignored.'),(1101,'Remove','Remove'),(1102,'Number of Account','Number of Account'),(1103,'Account Number Length','Account Number Length'),(1104,'DID (CLI Match, If not matched then use random allocated DID)','DID (CLI Match, If not matched then use random allocated DID)'),(1105,'Caller Id (CLI Match, If not matched then use random allocated Caller Id)','Caller Id (CLI Match, If not matched then use random allocated Caller Id)'),(1106,'Use NON-CLI Rate Group (If CLI not match with DID)','Use NON-CLI Rate Group (If CLI not match with DID)'),(1107,'Use NON-CLI Rate Group (If CLI not match with Caller ID)','Use NON-CLI Rate Group (If CLI not match with Caller ID)'),(1108,'Use NON-CLI Rate Group (If CLI not match with DID & Caller id)','Use NON-CLI Rate Group (If CLI not match with DID & Caller id)'),(1109,'Reject Call (If CLI not match with DID)','Reject Call (If CLI not match with DID)'),(1110,'Reject Call (If CLI not match with Caller ID)','Reject Call (If CLI not match with Caller ID)'),(1111,'Reject Call (If CLI not match with DID & Caller id)','Reject Call (If CLI not match with DID & Caller id)'),(1112,'--Select--','--Select--'),(1113,'Test Mail','Test Mail'),(1114,'Reset Password','Reset Password'),(1115,'country','AFGHANISTAN'),(1116,'country','ALBANIA'),(1117,'country','ALGERIA'),(1118,'country','AMERICAN SAMOA'),(1119,'country','ANDORRA'),(1120,'country','ANGOLA'),(1121,'country','ANGUILLA'),(1122,'country','ANTIGUA & BARBUDA'),(1123,'country','ARGENTINA'),(1124,'country','ARMENIA'),(1125,'country','ARUBA'),(1126,'country','AUSTRALIA'),(1127,'country','AUSTRIA'),(1128,'country','AZERBAIJAN'),(1129,'country','BAHAMAS'),(1130,'country','BAHRAIN'),(1131,'country','BANGLADESH'),(1132,'country','BARBADOS'),(1133,'country','BELARUS'),(1134,'country','BELGIUM'),(1135,'country','BELIZE'),(1136,'country','BENIN'),(1137,'country','BERMUDA'),(1138,'country','BHUTAN'),(1139,'country','BOLIVIA'),(1140,'country','BOSNIA AND HERZEGOVINA'),(1141,'country','BOTSWANA'),(1142,'country','BRAZIL'),(1143,'country','BRITISH VIRGIN ISLANDS'),(1144,'country','BRUNEI'),(1145,'country','BULGARIA'),(1146,'country','BURKINA FASO'),(1147,'country','BURUNDI'),(1148,'country','CAMBODIA'),(1149,'country','CAMEROON'),(1150,'country','CANADA'),(1151,'country','CAPE VERDE'),(1152,'country','CAYMAN ISLANDS'),(1153,'country','CENTRAL AFRICAN REPUBLIC'),(1154,'country','CHAD'),(1155,'country','CHILE'),(1156,'country','CHINA'),(1157,'country','COLOMBIA'),(1158,'country','COMOROS'),(1159,'country','CONGO'),(1160,'country','COSTA RICA'),(1161,'country','CROATIA'),(1162,'country','CUBA'),(1163,'country','CYPRUS'),(1164,'country','CZECH REPUBLIC'),(1165,'country','DEMOCRATIC REPUBLIC'),(1166,'country','DENMARK'),(1167,'country','DJIBOUTI'),(1168,'country','DOMINICA'),(1169,'country','DOMINICAN REPUBLIC'),(1170,'country','ECUADOR'),(1171,'country','EGYPT'),(1172,'country','EL SALVADOR'),(1173,'country','EQUATORIAL GUINEA'),(1174,'country','ERITREA'),(1175,'country','ETHIOPIA'),(1176,'country','FAEROE ISLANDS'),(1177,'country','FIJI ISLANDS'),(1178,'country','FINLAND'),(1179,'country','FRANCE'),(1180,'country','FRENCH GUIANA'),(1181,'country','FRENCH POLYNESIA'),(1182,'country','GABON'),(1183,'country','GAMBIA'),(1184,'country','GEORGIA'),(1185,'country','GERMANY'),(1186,'country','GHANA'),(1187,'country','GIBRALTAR'),(1188,'country','GREECE'),(1189,'country','GRENADA'),(1190,'country','GUADELOUPE'),(1191,'country','GUAM'),(1192,'country','GUATEMALA'),(1193,'country','GUINEA'),(1194,'country','GUINEA BISSAU'),(1195,'country','GUYANA'),(1196,'country','HAITI'),(1197,'country','HONDURAS'),(1198,'country','HONG KONG'),(1199,'country','HUNGARY'),(1200,'country','ICELAND'),(1201,'country','INDIA'),(1202,'country','INDONESIA'),(1203,'country','IRAN'),(1204,'country','IRAQ'),(1205,'country','IRELAND'),(1206,'country','ISRAEL'),(1207,'country','ITALY'),(1208,'country','IVORY COAST'),(1209,'country','JAMAICA'),(1210,'country','JAPAN'),(1211,'country','JORDAN'),(1212,'country','KAZAKHSTAN'),(1213,'country','KENYA'),(1214,'country','KOSOVO'),(1215,'country','KUWAIT'),(1216,'country','KYRGYZSTAN'),(1217,'country','LAOS'),(1218,'country','LATVIA'),(1219,'country','LEBANON'),(1220,'country','LESOTHO'),(1221,'country','LIBERIA'),(1222,'country','LIBYA'),(1223,'country','LIECHTENSTEIN'),(1224,'country','LITHUANIA'),(1225,'country','LUXEMBOURG'),(1226,'country','MACAU'),(1227,'country','MACEDONIA'),(1228,'country','MADAGASCAR'),(1229,'country','MALAWI'),(1230,'country','MALAYSIA'),(1231,'country','MALI'),(1232,'country','MALTA'),(1233,'country','MARSHALL ISLANDS'),(1234,'country','MARTINIQUE'),(1235,'country','MAURITANIA'),(1236,'country','MAURITIUS'),(1237,'country','MEXICO'),(1238,'country','MICRONESIA'),(1239,'country','MOLDOVA'),(1240,'country','MONACO'),(1241,'country','MONGOLIA'),(1242,'country','MONTENEGRO'),(1243,'country','MONTSERRAT'),(1244,'country','MOROCCO'),(1245,'country','MOZAMBIQUE'),(1246,'country','MYANMAR'),(1247,'country','NAMIBIA'),(1248,'country','NEPAL'),(1249,'country','NETHERLANDS'),(1250,'country','NEW CALEDONIA'),(1251,'country','NEW ZEALAND'),(1252,'country','NICARAGUA'),(1253,'country','NIGER'),(1254,'country','NIGERIA'),(1255,'country','NO. MARIANA ISLANDS'),(1256,'country','NORTH KOREA'),(1257,'country','NORWAY'),(1258,'country','OMAN'),(1259,'country','PAKISTAN'),(1260,'country','PALAU'),(1261,'country','PANAMA'),(1262,'country','PARAGUAY'),(1263,'country','PERU'),(1264,'country','PHILIPPINES'),(1265,'country','POLAND'),(1266,'country','PORTUGAL'),(1267,'country','PUERTO RICO'),(1268,'country','QATAR'),(1269,'country','REUNION ISLAND'),(1270,'country','ROMANIA'),(1271,'country','RUSSIAN FEDERATION'),(1272,'country','RWANDA'),(1273,'country','SAN MARINO'),(1274,'country','SAUDI ARABIA'),(1275,'country','SENEGAL'),(1276,'country','SERBIA'),(1277,'country','SEYCHELLES ISLANDS'),(1278,'country','SIERRA LEONE'),(1279,'country','SINGAPORE'),(1280,'country','SLOVAKIA'),(1281,'country','SLOVENIA'),(1282,'country','SOMALIA'),(1283,'country','SOUTH AFRICA'),(1284,'country','SOUTH KOREA'),(1285,'country','SOUTH SUDAN'),(1286,'country','SPAIN'),(1287,'country','SRI LANKA'),(1288,'country','ST. KITTS'),(1289,'country','ST. LUCIA'),(1290,'country','ST. MARTIN'),(1291,'country','ST. PIERRE & MIQUELON'),(1292,'country','ST. VINCENT'),(1293,'country','SUDAN'),(1294,'country','SURINAME'),(1295,'country','SWAZILAND'),(1296,'country','SWEDEN'),(1297,'country','SWITZERLAND'),(1298,'country','SYRIA'),(1299,'country','TAIWAN'),(1300,'country','TAJIKISTAN'),(1301,'country','TANZANIA'),(1302,'country','THAILAND'),(1303,'country','TRINIDAD & TOBAGO'),(1304,'country','TUNISIA'),(1305,'country','TURKEY'),(1306,'country','TURKMENISTAN'),(1307,'country','TURKS & CAICOS ISLANDS'),(1308,'country','UGANDA'),(1309,'country','UKRAINE'),(1310,'country','UNITED ARAB EMIRATES'),(1311,'country','UNITED KINGDOM'),(1312,'country','URUGUAY'),(1313,'country','US VIRGIN ISLANDS'),(1314,'country','United States'),(1315,'country','UZBEKISTAN'),(1316,'country','VENEZUELA'),(1317,'country','VIETNAM'),(1318,'country','YEMEN'),(1319,'country','ZAMBIA'),(1320,'country','ZIMBABWE'),(1321,'ASCENSION','ASCENSION'),(1322,'COOK ISLANDS','COOK ISLANDS'),(1323,'EAST TIMOR','EAST TIMOR'),(1324,'FALKLAND ISLANDS','FALKLAND ISLANDS'),(1325,'GREENLAND','GREENLAND'),(1326,'KIRIBATI','KIRIBATI'),(1327,'MALDIVES','MALDIVES'),(1328,'NAURU','NAURU'),(1329,'Albanian Lek','Albanian Lek'),(1330,'Algerian Dinar','Algerian Dinar'),(1331,'Aluminium Ounces','Aluminium Ounces'),(1332,'Argentine Peso','Argentine Peso'),(1333,'Aruba Florin','Aruba Florin'),(1334,'Australian Dollar','Australian Dollar'),(1335,'Bahamian Dollar','Bahamian Dollar'),(1336,'Bahraini Dinar','Bahraini Dinar'),(1337,'Bangladesh Taka','Bangladesh Taka'),(1338,'Barbados Dollar','Barbados Dollar'),(1339,'Belarus Ruble','Belarus Ruble'),(1340,'Belize Dollar','Belize Dollar'),(1341,'Bermuda Dollar','Bermuda Dollar'),(1342,'Bhutan Ngultrum','Bhutan Ngultrum'),(1343,'Bolivian Boliviano','Bolivian Boliviano'),(1344,'Brazilian Real','Brazilian Real'),(1345,'British Pound','British Pound'),(1346,'Brunei Dollar','Brunei Dollar'),(1347,'Bulgarian Lev','Bulgarian Lev'),(1348,'Burundi Franc','Burundi Franc'),(1349,'Cambodia Riel','Cambodia Riel'),(1350,'Canadian Dollar','Canadian Dollar'),(1351,'Cayman Islands Dollar','Cayman Islands Dollar'),(1352,'CFA Franc (BCEAO)','CFA Franc (BCEAO)'),(1353,'CFA Franc (BEAC)','CFA Franc (BEAC)'),(1354,'Chilean Peso','Chilean Peso'),(1355,'Chinese Yuan','Chinese Yuan'),(1356,'Colombian Peso','Colombian Peso'),(1357,'Comoros Franc','Comoros Franc'),(1358,'Copper Ounces','Copper Ounces'),(1359,'Costa Rica Colon','Costa Rica Colon'),(1360,'Croatian Kuna','Croatian Kuna'),(1361,'Cuban Peso','Cuban Peso'),(1362,'Cyprus Pound','Cyprus Pound'),(1363,'Czech Koruna','Czech Koruna'),(1364,'Danish Krone','Danish Krone'),(1365,'Dijibouti Franc','Dijibouti Franc'),(1366,'Dominican Peso','Dominican Peso'),(1367,'East Caribbean Dollar','East Caribbean Dollar'),(1368,'Ecuador Sucre','Ecuador Sucre'),(1369,'Egyptian Pound','Egyptian Pound'),(1370,'El Salvador Colon','El Salvador Colon'),(1371,'Eritrea Nakfa','Eritrea Nakfa'),(1372,'Estonian Kroon','Estonian Kroon'),(1373,'Ethiopian Birr','Ethiopian Birr'),(1374,'Euro','Euro'),(1375,'Falkland Islands Pound','Falkland Islands Pound'),(1376,'Gambian Dalasi','Gambian Dalasi'),(1377,'Ghanian Cedi','Ghanian Cedi'),(1378,'Gibraltar Pound','Gibraltar Pound'),(1379,'Gold Ounces','Gold Ounces'),(1380,'Guatemala Quetzal','Guatemala Quetzal'),(1381,'Guinea Franc','Guinea Franc'),(1382,'Haiti Gourde','Haiti Gourde'),(1383,'Honduras Lempira','Honduras Lempira'),(1384,'Hong Kong Dollar','Hong Kong Dollar'),(1385,'Hungarian ForINT','Hungarian ForINT'),(1386,'Iceland Krona','Iceland Krona'),(1387,'Indian Rupee','Indian Rupee'),(1388,'Indonesian Rupiah','Indonesian Rupiah'),(1389,'Iran Rial','Iran Rial'),(1390,'Israeli Shekel','Israeli Shekel'),(1391,'Jamaican Dollar','Jamaican Dollar'),(1392,'Japanese Yen','Japanese Yen'),(1393,'Jordanian Dinar','Jordanian Dinar'),(1394,'Kazakhstan Tenge','Kazakhstan Tenge'),(1395,'Kenyan Shilling','Kenyan Shilling'),(1396,'Korean Won','Korean Won'),(1397,'Kuwaiti Dinar','Kuwaiti Dinar'),(1398,'Lao Kip','Lao Kip'),(1399,'Latvian Lat','Latvian Lat'),(1400,'Lebanese Pound','Lebanese Pound'),(1401,'Lesotho Loti','Lesotho Loti'),(1402,'Libyan Dinar','Libyan Dinar'),(1403,'Lithuanian Lita','Lithuanian Lita'),(1404,'Macau Pataca','Macau Pataca'),(1405,'Macedonian Denar','Macedonian Denar'),(1406,'Malagasy Franc','Malagasy Franc'),(1407,'Malawi Kwacha','Malawi Kwacha'),(1408,'Malaysian Ringgit','Malaysian Ringgit'),(1409,'Maldives Rufiyaa','Maldives Rufiyaa'),(1410,'Maltese Lira','Maltese Lira'),(1411,'Mauritania Ougulya','Mauritania Ougulya'),(1412,'Mauritius Rupee','Mauritius Rupee'),(1413,'Mexican Peso','Mexican Peso'),(1414,'Moldovan Leu','Moldovan Leu'),(1415,'Mongolian Tugrik','Mongolian Tugrik'),(1416,'Moroccan Dirham','Moroccan Dirham'),(1417,'Mozambique Metical','Mozambique Metical'),(1418,'Namibian Dollar','Namibian Dollar'),(1419,'Nepalese Rupee','Nepalese Rupee'),(1420,'Neth Antilles Guilder','Neth Antilles Guilder'),(1421,'New Turkish Lira','New Turkish Lira'),(1422,'New Zealand Dollar','New Zealand Dollar'),(1423,'Nicaragua Cordoba','Nicaragua Cordoba'),(1424,'Nigerian Naira','Nigerian Naira'),(1425,'Norwegian Krone','Norwegian Krone'),(1426,'Omani Rial','Omani Rial'),(1427,'Pacific Franc','Pacific Franc'),(1428,'Pakistani Rupee','Pakistani Rupee'),(1429,'Palladium Ounces','Palladium Ounces'),(1430,'Panama Balboa','Panama Balboa'),(1431,'Papua New Guinea Kina','Papua New Guinea Kina'),(1432,'Paraguayan Guarani','Paraguayan Guarani'),(1433,'Peruvian Nuevo Sol','Peruvian Nuevo Sol'),(1434,'Philippine Peso','Philippine Peso'),(1435,'Platinum Ounces','Platinum Ounces'),(1436,'Polish Zloty','Polish Zloty'),(1437,'Qatar Rial','Qatar Rial'),(1438,'Romanian Leu','Romanian Leu'),(1439,'Romanian New Leu','Romanian New Leu'),(1440,'Russian Rouble','Russian Rouble'),(1441,'Rwanda Franc','Rwanda Franc'),(1442,'Samoa Tala','Samoa Tala'),(1443,'Sao Tome Dobra','Sao Tome Dobra'),(1444,'Saudi Arabian Riyal','Saudi Arabian Riyal'),(1445,'Seychelles Rupee','Seychelles Rupee'),(1446,'Sierra Leone Leone','Sierra Leone Leone'),(1447,'Silver Ounces','Silver Ounces'),(1448,'Singapore Dollar','Singapore Dollar'),(1449,'Slovak Koruna','Slovak Koruna'),(1450,'Slovenian Tolar','Slovenian Tolar'),(1451,'Somali Shilling','Somali Shilling'),(1452,'South African Rand','South African Rand'),(1453,'Sri Lanka Rupee','Sri Lanka Rupee'),(1454,'St Helena Pound','St Helena Pound'),(1455,'Sudanese Dinar','Sudanese Dinar'),(1456,'Surinam Guilder','Surinam Guilder'),(1457,'Swaziland Lilageni','Swaziland Lilageni'),(1458,'Swedish Krona','Swedish Krona'),(1459,'Swiss Franc','Swiss Franc'),(1460,'Syrian Pound','Syrian Pound'),(1461,'Taiwan Dollar','Taiwan Dollar'),(1462,'Tanzanian Shilling','Tanzanian Shilling'),(1463,'Thai Baht','Thai Baht'),(1464,'Tonga Paanga','Tonga Paanga'),(1465,'Trinidad&Tobago Dollar','Trinidad&Tobago Dollar'),(1466,'Tunisian Dinar','Tunisian Dinar'),(1467,'U.S. Dollar','U.S. Dollar'),(1468,'UAE Dirham','UAE Dirham'),(1469,'Ugandan Shilling','Ugandan Shilling'),(1470,'Ukraine Hryvnia','Ukraine Hryvnia'),(1471,'Uruguayan New Peso','Uruguayan New Peso'),(1472,'Vanuatu Vatu','Vanuatu Vatu'),(1473,'Venezuelan Bolivar','Venezuelan Bolivar'),(1474,'Vietnam Dong','Vietnam Dong'),(1475,'Yemen Riyal','Yemen Riyal'),(1476,'Zambian Kwacha','Zambian Kwacha'),(1477,'Zimbabwe Dollar','Zimbabwe Dollar'),(1478,'Guyana Dollar','Guyana Dollar'),(1479,'Aruban florin','Aruban florin'),(1480,'Armenian dram','Armenian dram'),(1481,'Azerbaijani manat','Azerbaijani manat'),(1482,'Barbadian dollar','Barbadian dollar'),(1483,'Bosnian Convertible Marka','Bosnian Convertible Marka'),(1484,'Botswana pula','Botswana pula'),(1485,'Cape Verdean escudo','Cape Verdean escudo'),(1486,'Congolese franc','Congolese franc'),(1487,'Fijian Dollar','Fijian Dollar'),(1488,'CFP franc','CFP franc'),(1489,'Georgian lari','Georgian lari'),(1490,'Iraqi dinar','Iraqi dinar'),(1491,'Kyrgyzstani som','Kyrgyzstani som'),(1492,'Liberian dollar','Liberian dollar'),(1493,'Malagasy ariary','Malagasy ariary'),(1494,'Burmese Kyat','Burmese Kyat'),(1495,'North Korean won','North Korean won'),(1496,'nuevo sol','nuevo sol'),(1497,'Serbian dinar','Serbian dinar'),(1498,'South Korean won','South Korean won'),(1499,'South Sudanese pound','South Sudanese pound'),(1500,'Sudanese pound','Sudanese pound'),(1501,'Surinamese dollar','Surinamese dollar'),(1502,'Tajikistani samani','Tajikistani samani'),(1503,'Turkish lira','Turkish lira'),(1504,'Turkmenistan manat','Turkmenistan manat'),(1505,'Pound sterling','Pound sterling'),(1506,'Uzbekistani soʻm','Uzbekistani soʻm'),(1507,'Saint Helena pound','Saint Helena pound'),(1508,'Indian Rupees','Indian Rupees'),(1509,'login and signup','Telephone number is only numeric'),(1510,'login and signup','Please enter valid Captcha code'),(1511,'login and signup','Please contact to administrator'),(1512,'login and signup','Requested email is already exist'),(1513,'login and signup','Requested number is already exist'),(1514,'login and signup','Please enter correct words!'),(1515,'login and signup','THIS IS REQUIRED!'),(1516,'login and signup','Your account has been deleted. Please contact administrator for more information.'),(1517,'login and signup','Your account is inactive. Please contact administrator for more information.'),(1518,'login and signup','Please enter proper Email.'),(1519,'login and signup','Please enter proper Username.'),(1520,'login and signup','This Username or Email is not valid.'),(1521,'login and signup','ASTPP - A Smart TelePhony Platform'),(1522,'login and signup','Forgot Password'),(1523,'login and signup','ASTPP work best with JavaScript enabled'),(1524,'login and signup','Enter Your Password'),(1525,'login and signup','Confirm Password'),(1526,'login and signup','The Email field is Required'),(1527,'login and signup','The Account Number field is Required'),(1528,'login and signup','Set Default Language'),(1529,'login and signup','Please Re-login to get Impact of selected language.'),(1530,'login and signup','Default Language'),(1531,'login and signup','Signup now!'),(1532,'login and signup','Forgot Password?'),(1533,'login and signup','Sign in'),(1534,'login and signup','Username OR Email'),(1535,'login and signup','Username is Required'),(1536,'login and signup','Password is Required'),(1537,'login and signup','Please Check Your account is deleted or inactive from admin side, please contact to your administrator'),(1538,'login and signup','Please do not use default or less secure password for your account!! You must change password from'),(1539,'login and signup','HERE'),(1540,'login and signup','Login unsuccessful. Please make sure you entered the correct username and password, and that your account is active'),(1541,'login and signup','Please enter Username/email and Password.'),(1542,'login and signup','Payment transaction invalid. Please contact Administrator.'),(1543,'login and signup','Log In'),(1544,'login and signup','Please Enter Password'),(1545,'login and signup','Password must be at least 8 characters and must contain at least one lower case letter, one upper case letter and one digit'),(1546,'login and signup','Please Enter Confirm Password'),(1547,'login and signup','Confirm Password is not match'),(1548,'login and signup','We sent update password link.'),(1549,'login and signup','Please check your Email!'),(1550,'login and signup','Login'),(1551,'login and signup','OTP Verification'),(1552,'login and signup','OTP Number is Required'),(1553,'login and signup','Your account created successfully and account details sent to your registered email address'),(1554,'login and signup','Your password change successfully and new password sent to your registered email address'),(1555,'login and signup','OTP Number is Wrong Please try again Or OTP expire Please Resend'),(1556,'login and signup','OTP has been sent on your email or Telephone number'),(1557,'login and signup','OTP'),(1558,'login and signup','Resend OTP'),(1559,'login and signup','OTP Sent time Out'),(1560,'login and signup','Not Get OTP ?'),(1561,'login and signup','Note:'),(1562,'login and signup','Please make sure do not refresh the page or don\'t go back'),(1563,'login and signup','Login unsuccessful. Please make sure you entered the correct username and password, and that your account is active.'),(1564,'login and signup','Your account has been created successfully!'),(1565,'login and signup','Here is your login information'),(1566,'login and signup','Link is Expire Please Try Again'),(1567,'login and signup','Sorry, we cannot process for singup at this time.'),(1568,'login and signup','Please contact administrator for more information'),(1569,'login and signup','Successful!'),(1570,'login and signup','Captcha is required'),(1571,'login and signup','First Name is Required'),(1572,'login and signup','Telephone is Required'),(1573,'login and signup','Email is Required'),(1574,'login and signup','Please enter a valid email address'),(1575,'login and signup','Please make sure you entered the correct username and password, and that your account is active.'),(1576,'login and signup','Company Name'),(1577,'login and signup','Enter above Captcha'),(1578,'login and signup','Sign up'),(1579,'login and signup','Already Registered !'),(1580,'CLI Pool','CLI Pool'),(1581,'Download','Download'),(1582,'True','True'),(1583,'False','False'),(1584,'--Select Type--','--Select Type--'),(1585,'One Time','One Time'),(1586,'Recurring','Recurring'),(1587,'Recurring Monthly','Recurring Monthly'),(1588,'Outbound','Outbound'),(1589,'Default','Default'),(1590,'Speed Dial Number Added Successfully','Speed Dial Number Added Successfully'),(1591,'Are you sure want to confirm this invoice ? once you confirm it, can not able to edit invoice again.','Are you sure want to confirm this invoice ? once you confirm it, can not able to edit invoice again.'),(1592,'DIDs already purchased by someone.','DIDs already purchased by someone.'),(1593,'DIDs Assigned sucessfully!','DIDs Assigned sucessfully!'),(1594,'Something wrong.Please contact to administrator.','Something wrong.Please contact to administrator.'),(1595,'Duplicate DID found from database','Duplicate DID found from database'),(1596,'Account have not sufficient amount to purchase this DID.','Account have not sufficient amount to purchase this DID.'),(1597,'Account not found or assign to invalid account','Account not found or assign to invalid account'),(1598,'Duplicate DID found from import file.','Duplicate DID found from import file.'),(1599,'DIDs Imported Successfully!','DIDs Imported Successfully!'),(1600,'Insuffiecient fund to purchase this DID.','Insuffiecient fund to purchase this DID.'),(1601,'Balance Below Notification','Balance Below Notification'),(1602,'Edit SIP Device','Edit SIP Device'),(1603,'Note : Page will display only receipts and confirmed invoices.','Note : Page will display only receipts and confirmed invoices.'),(1604,'Termination Rate Updated Successfully!','Termination Rate Updated Successfully!'),(1605,'Import Termination Rates Using Field Mapper','Import Termination Rates Using Field Mapper'),(1606,'Edit Roles & Permissions','Edit Roles & Permissions'),(1607,'Create Roles & Permissions','Create Roles & Permissions'),(1608,'Edit Admin','Edit Admin'),(1609,'Pin Updated Successfully!.','Pin Updated Successfully!.'),(1610,'Create Termination Rate','Create Termination Rate'),(1611,'Edit Company Profile','Edit Company Profile'),(1612,'Website','Website'),(1613,'Generate Invoice for no usage','Generate Invoice for no usage'),(1614,'Commission Repots','Commission Repots'),(1615,'Top Up','Top Up'),(1616,'Purchase DIDs','Purchase DIDs'),(1617,'Package','Package'),(1618,'Setup','Setup'),(1619,'DID Purchased Successfully.','DID Purchased Successfully.'),(1620,'release','release'),(1621,'DID Batch Updated Successfully!','DID Batch Updated Successfully!'),(1622,'DID forwading set sucessfully!','DID forwading set sucessfully!'),(1623,'Are you sure want to release DID?','Are you sure want to release DID?'),(1624,'Please select atleast one record','Please select atleast one record'),(1625,'Account Balance','Account Balance'),(1626,'Next Bill Date','Next Bill Date'),(1627,'TOTAL AMOUNT','TOTAL AMOUNT'),(1628,'Invoice','Invoice'),(1629,'IP Address','IP Address'),(1630,'Terminate','Terminate'),(1631,'Seconds','Seconds'),(1632,'Recording','Recording'),(1633,'Rates','Rates'),(1634,'Paid','Paid'),(1635,'No Records','No Records'),(1636,'Please select from date','Please select from date'),(1637,'Please select to date','Please select to date'),(1638,'Please select to date bigger than from date','Please select to date bigger than from date'),(1639,'Confirm','Confirm'),(1640,'Edit Country','Edit Country'),(1641,'Skip Header','Skip Header'),(1642,'Origination_rate_error','Origination_rate_error'),(1643,'Termination_rate_error','Termination_rate_error'),(1644,'Termination_Rates','Termination_Rates'),(1645,'Origination_Rates','Origination_Rates'),(1646,'refill_coupon','refill_coupon'),(1647,'Edit Calltype','Edit Calltype'),(1648,'Invoice generation completed .','Invoice generation completed .'),(1649,'No data found.','No data found.'),(1650,'DID added successfully!','DID added successfully!'),(1651,'File must be in the following format(.csv):','File must be in the following format(.csv):'),(1652,'Process','Process'),(1653,'DID Import Error','DID Import Error'),(1654,'Back to DID List','Back to DID List'),(1655,'Accessnumber Added Successfully!','Accessnumber Added Successfully!'),(1656,'Accessnumber Import Error','Accessnumber Import Error'),(1657,'Origination Rates Preview','Origination Rates Preview'),(1658,'Origination Rates Import Error','Origination Rates Import Error'),(1659,'Back to Origination Rates List','Back to Origination Rates List'),(1660,'Origination Rates Batch Updated Successfully!','Origination Rates Batch Updated Successfully!'),(1661,'Import Ratedeck Preview','Import Ratedeck Preview'),(1662,'CALLTYPE','CALLTYPE'),(1663,'Outbound-Proxy','Outbound-Proxy'),(1664,'Edit Trunk','Edit Trunk'),(1665,'Termination Rate Added Successfully!','Termination Rate Added Successfully!'),(1666,'Edit Termination Rate','Edit Termination Rate'),(1667,'Termination Rates Import Error','Termination Rates Import Error'),(1668,'Termination Rates Imported Successfully!','Termination Rates Imported Successfully!'),(1669,'Select','Select'),(1670,'pattern','pattern'),(1671,'comment','comment'),(1672,'connectcost','connectcost'),(1673,'includedseconds','includedseconds'),(1674,'init_inc','init_inc'),(1675,'inc','inc'),(1676,'Country Name','Country Name'),(1677,'PENDING','PENDING'),(1678,'FAIL','FAIL'),(1679,'Terminate Order','Terminate Order'),(1680,'Compose Email','Compose Email'),(1681,'Message','Message'),(1682,'Send','Send'),(1683,'Start','Start'),(1684,'SIP Port is Required.','SIP Port is Required.'),(1685,'SIP IP is Required.','SIP IP is Required.'),(1686,'Name is Required.','Name is Required.'),(1687,'The SIP Port field is Required.','The SIP Port field is Required.'),(1688,'The SIP Port field must contain only numbers.','The SIP Port field must contain only numbers.'),(1689,'The SIP Port field can not exceed 5 characters in length.','The SIP Port field can not exceed 5 characters in length.'),(1690,'Value is Required.','Value is Required.'),(1691,'Update Setting','Update Setting'),(1692,'Edit Freeswitch Server','Edit Freeswitch Server'),(1693,'CUT','CUT'),(1694,'Edit Localization','Edit Localization'),(1695,'Callbarring Settings Added Successfully!','Callbarring Settings Added Successfully!'),(1696,'Edit Call Barring','Edit Call Barring'),(1697,'Callbarring Settings Updated Successfully!','Callbarring Settings Updated Successfully!'),(1698,'Database import allows only gzfile types of file.','Database import allows only gzfile types of file.'),(1699,'File must be in (.gz) format :','File must be in (.gz) format :'),(1700,'The Coupon Number field must contain only numbers.','The Coupon Number field must contain only numbers.'),(1701,'The Coupon Number field have inactive refill coupon.','The Coupon Number field have inactive refill coupon.'),(1702,'Please enter proper email','Please enter proper email'),(1703,'This field is require','This field is require'),(1704,'Please Enter Valid Account Number','Please Enter Valid Account Number'),(1705,'Main','Main'),(1706,'--Select Disposition--','--Select Disposition--'),(1707,'Active User','Active User'),(1708,'Used Minutes','Used Minutes'),(1709,'Available Minutes','Available Minutes'),(1710,'Total Price','Total Price'),(1711,'Total User','Total User'),(1712,'Restore','Restore'),(1713,'View Details','View Details'),(1714,'Other','Other'),(1715,'Edit Tax','Edit Tax'),(1716,'Download Database','Download Database'),(1717,'Import Database','Import Database'),(1718,'File must be in (.gz) format','File must be in (.gz) format'),(1719,'Please enter name and select file.','Please enter name and select file.'),(1720,'Edit Cron Settings','Edit Cron Settings'),(1721,'Global Settings updated sucessfully!','Global Settings updated sucessfully!'),(1722,'Alert Notifications','Alert Notifications'),(1723,'Fraud Configuration','Fraud Configuration'),(1724,'Configuration add','Configuration add'),(1725,'Alarm Configuration','Alarm Configuration'),(1726,'Please select atleast one pattern.','Please select atleast one pattern.'),(1727,'Problem In Add Patterns to account.','Problem In Add Patterns to account.'),(1728,'Please Enter Switch command','Please Enter Switch command'),(1729,'are you sure to delete?','are you sure to delete?'),(1730,'Are you sure want to confirm this invoice ? once you confirm it','Are you sure want to confirm this invoice ? once you confirm it'),(1731,'can not able to edit invoice again.','can not able to edit invoice again.'),(1732,'Maximum Logo upload size is 1MB','Maximum Logo upload size is 1MB'),(1733,'Please enter number','Please enter number'),(1734,'Import Customer','Import Customer'),(1735,'Processing','Processing'),(1736,'please wait','please wait'),(1737,'U.S. Dollar (USD)','U.S. Dollar (USD)'),(1738,'Account Number,Password,First Name,Last Name,Company,Phone,Mobile,Email,Address,city,Province/State,Zip/Postal Code,Number Translation,Out Callerid Translation,In Callerid Translation,Concurrent Calls,CPS,Balance,Credit Limit,SIP Username,SIP Password','Account Number,Password,First Name,Last Name,Company,Phone,Mobile,Email,Address,city,Province/State,Zip/Postal Code,Number Translation,Out Callerid Translation,In Callerid Translation,Concurrent Calls,CPS,Balance,Credit Limit,SIP Username,SIP Password'),(1739,'Selected records has been deleted.','Selected records has been deleted.'),(1740,'Processing, please wait ...','Processing, please wait ...'),(1741,'Invoice Due Date','Invoice Due Date'),(1742,'This month credits','This month credits'),(1743,'Product & Services','Product & Services'),(1744,'Total Calls Amount','Total Calls Amount'),(1745,'Total Amount (Inc. tax)','Total Amount (Inc. tax)'),(1746,'Bill To','Bill To'),(1747,'Subtotal','Subtotal'),(1748,'Emails','Emails'),(1749,'Add IP Settings','Add IP Settings'),(1750,'Edit IP Settings','Edit IP Settings'),(1751,'Edit Caller ID','Edit Caller ID'),(1752,'Reseller Type','Reseller Type'),(1753,'Distributor','Distributor'),(1754,'Commission Based','Commission Based'),(1755,'Invoice Date Interval','Invoice Date Interval'),(1756,'Please select atleast one record to delete.','Please select atleast one record to delete.'),(1757,'Are you sure you want to delete? This action will delete all other data which belongs to this account(s).','Are you sure you want to delete? This action will delete all other data which belongs to this account(s).'),(1758,'Days to Unhold','Days to Unhold'),(1759,'DID,Country,Account,Cost / Min(USD),Initial Increment,Increment,Setup Fee(USD),Monthly Fee(USD),Call Type,Destination','DID,Country,Account,Cost / Min(USD),Initial Increment,Increment,Setup Fee(USD),Monthly Fee(USD),Call Type,Destination'),(1760,'Access Numbers,Country','Access Numbers,Country'),(1761,'Create Duplicate Rate Group','Create Duplicate Rate Group'),(1762,'Connection','Connection'),(1763,'Effective Date','Effective Date'),(1764,'Effective Date Time','Effective Date Time'),(1765,'Effective From Date','Effective From Date'),(1766,'Effective To Date','Effective To Date'),(1767,'Edit Ratedeck','Edit Ratedeck'),(1768,'Routing','Routing'),(1769,'Initial','Initial'),(1770,'Edit Rate Group','Edit Rate Group'),(1771,'Effective','Effective'),(1772,'Begin zone','Begin zone'),(1773,'Nothing selected','Nothing selected'),(1774,'Are you sure you want to delete this selected records?','Are you sure you want to delete this selected records?'),(1775,'Please check your customers calls are running or not if running then may be customer balance goes in nagative!','Please check your customers calls are running or not if running then may be customer balance goes in nagative!'),(1776,'Stop','Stop'),(1777,'Reload','Reload'),(1778,'Rescan','Rescan'),(1779,'Template(regexp)','Template(regexp)'),(1780,'Destination Based CallerId','Destination Based CallerId'),(1781,'Provider Summary','Provider Summary'),(1782,'Notification History','Notification History'),(1783,'Are you sure you want to delete?','Are you sure you want to delete?'),(1784,' (250 * 60)',' (250 * 60)'),(1785,' (Allowed Extensions JPG, PNG, JPEG)',' (Allowed Extensions JPG, PNG, JPEG)'),(1786,' (16 * 16)',' (16 * 16)'),(1787,' (Allowed Extensions ICO, PNG, JPG, JPEG)',' (Allowed Extensions ICO, PNG, JPG, JPEG)'),(1788,'SMTP Email Test','SMTP Email Test'),(1789,'Email Body','Email Body'),(1790,'Alert Body','Alert Body'),(1791,'Are you sure want to restore this database?','Are you sure want to restore this database?'),(1792,'Forwarding','Forwarding'),(1793,'DID-Local','DID-Local'),(1794,'DID@IP/URL','DID@IP/URL'),(1795,'Direct-IP','Direct-IP'),(1796,'PSTN','PSTN'),(1797,'SIP-DID','SIP-DID'),(1798,'Edit Access number','Edit Access number'),(1799,'Realm','Realm'),(1800,'Reg-Transport','Reg-Transport'),(1801,'Gateway','Gateway'),(1802,'Failover','Failover'),(1803,'GW Name #1','GW Name #1'),(1804,'GW Name #2','GW Name #2'),(1805,'Count','Count'),(1806,'Rate Type','Rate Type'),(1807,'Refill','Refill'),(1808,'Full Price','Full Price'),(1809,'Max. Days','Max. Days'),(1810,'Max. Minute','Max. Minute'),(1811,'Both of one Maximum','Both of one Maximum'),(1812,'Both','Both'),(1813,'Please check your customers calls are running or not. if running then may be customer balance goes in nagative!','Please check your customers calls are running or not. if running then may be customer balance goes in nagative!'),(1814,'ESTONIA','ESTONIA'),(1815,'CLI','CLI'),(1816,'STANDARD','STANDARD'),(1817,'CALLINGCARD','CALLINGCARD'),(1818,'FREE','FREE'),(1819,'LOCAL','LOCAL'),(1820,'Resand Email','Resand Email'),(1821,'Sent','Sent'),(1822,'Failed','Failed'),(1823,'Resent Email','Resent Email'),(1824,'Org.','Org.'),(1825,'Pefix','Pefix'),(1826,'Term.','Term.'),(1827,'GMT Offset','GMT Offset'),(1828,'Add Timezone','Add Timezone'),(1829,'Timezone List','Timezone List'),(1830,'Edit Timezone','Edit Timezone'),(1831,'Folder Path','Folder Path'),(1832,'Custom Rule','Custom Rule'),(1833,'Account Number Editable','Account Number Editable'),(1834,'Packages','Packages'),(1835,'Terms & Condition','Terms & Condition'),(1836,'Play Audio Notifications','Play Audio Notifications'),(1837,'Sort cost based routing','Sort cost based routing'),(1838,'Half Year','Half Year'),(1839,'Open a Ticket','Open a Ticket'),(1840,'Licence','Licence'),(1841,'DID Reservation Days','DID Reservation Days'),(1842,'DID Reservation','DID Reservation'),(1843,'Term_and_condition','Term_and_condition'),(1844,'Text','Text'),(1845,'Url','Url'),(1846,'Generated','Generated'),(1847,'Customer_permission','Customer_permission'),(1848,'Resend Email','Resend Email'),(1849,'Create Translation Languages','Create Translation Languages'),(1850,'Edit Translation Language','Edit Translation Language'),(1851,'Module Name','Module Name'),(1852,'English','English'),(1853,'French','French'),(1854,'Chinese','Chinese'),(1855,'German','German'),(1856,'Greek','Greek'),(1857,'Italian','Italian'),(1858,'Japanese','Japanese'),(1859,'Portuguese','Portuguese'),(1860,'Romanian','Romanian'),(1861,'Russian','Russian'),(1862,'Spanish','Spanish'),(1863,'Both (Email & SMS)','Both (Email & SMS)'),(1864,'Account Notification','Account Notification'),(1865,'Use Same Credential For Invoice Config','Use Same Credential For Invoice Config'),(1866,'Registration URL','Registration URL'),(1867,'Admin_permission','Admin_permission'),(1868,'My Order','My Order'),(1869,'please select any recharge amount','please select any recharge amount'),(1870,'Are you sure want to delete speed dial record?','Are you sure want to delete speed dial record?'),(1871,'Buy DIDs','Buy DIDs'),(1872,'Purchased DID','Purchased DID'),(1873,'DID Information','DID Information'),(1874,'Sell Cost','Sell Cost'),(1875,'Admin Rate Group','Admin Rate Group'),(1876,'Copy From Rate Group','Copy From Rate Group'),(1877,'Search My Rates','Search My Rates'),(1878,'Read/Write','Read/Write'),(1879,'Edit SIP Devices','Edit SIP Devices'),(1880,'Inextrix Technologies Pvt. Ltd All Rights Reserved.','Inextrix Technologies Pvt. Ltd All Rights Reserved.'),(1881,'iNextrix Technologies Pvt. Ltd.','iNextrix Technologies Pvt. Ltd.'),(1882,'Todays Calls','Todays Calls'),(1883,'Bal','Bal'),(1884,'Admin','Admin'),(1885,'Asia/Dubai','Asia/Dubai'),(1886,'Europe/Andorra','Europe/Andorra'),(1887,'Asia/Kabul','Asia/Kabul'),(1888,'America/Antigua','America/Antigua'),(1889,'America/Anguilla','America/Anguilla'),(1890,'Europe/Tirane','Europe/Tirane'),(1891,'Asia/Yerevan','Asia/Yerevan'),(1892,'Africa/Luanda','Africa/Luanda'),(1893,'Antarctica/Casey','Antarctica/Casey'),(1894,'Antarctica/Davis','Antarctica/Davis'),(1895,'Antarctica/DumontDUrville','Antarctica/DumontDUrville'),(1896,'Antarctica/Mawson','Antarctica/Mawson'),(1897,'Antarctica/McMurdo','Antarctica/McMurdo'),(1898,'Antarctica/Palmer','Antarctica/Palmer'),(1899,'Antarctica/Rothera','Antarctica/Rothera'),(1900,'Antarctica/Syowa','Antarctica/Syowa'),(1901,'Antarctica/Troll','Antarctica/Troll'),(1902,'Antarctica/Vostok','Antarctica/Vostok'),(1903,'America/Argentina/Buenos_Aires','America/Argentina/Buenos_Aires'),(1904,'America/Argentina/Catamarca','America/Argentina/Catamarca'),(1905,'America/Argentina/Cordoba','America/Argentina/Cordoba'),(1906,'America/Argentina/Jujuy','America/Argentina/Jujuy'),(1907,'America/Argentina/La_Rioja','America/Argentina/La_Rioja'),(1908,'America/Argentina/Mendoza','America/Argentina/Mendoza'),(1909,'America/Argentina/Rio_Gallegos','America/Argentina/Rio_Gallegos'),(1910,'America/Argentina/Salta','America/Argentina/Salta'),(1911,'America/Argentina/San_Juan','America/Argentina/San_Juan'),(1912,'America/Argentina/San_Luis','America/Argentina/San_Luis'),(1913,'America/Argentina/Tucuman','America/Argentina/Tucuman'),(1914,'America/Argentina/Ushuaia','America/Argentina/Ushuaia'),(1915,'Pacific/Pago_Pago','Pacific/Pago_Pago'),(1916,'Europe/Vienna','Europe/Vienna'),(1917,'Antarctica/Macquarie','Antarctica/Macquarie'),(1918,'Australia/Adelaide','Australia/Adelaide'),(1919,'Australia/Brisbane','Australia/Brisbane'),(1920,'Australia/Broken_Hill','Australia/Broken_Hill'),(1921,'Australia/Currie','Australia/Currie'),(1922,'Australia/Darwin','Australia/Darwin'),(1923,'Australia/Eucla','Australia/Eucla'),(1924,'Australia/Hobart','Australia/Hobart'),(1925,'Australia/Lindeman','Australia/Lindeman'),(1926,'Australia/Lord_Howe','Australia/Lord_Howe'),(1927,'Australia/Melbourne','Australia/Melbourne'),(1928,'Australia/Perth','Australia/Perth'),(1929,'Australia/Sydney','Australia/Sydney'),(1930,'America/Aruba','America/Aruba'),(1931,'Europe/Mariehamn','Europe/Mariehamn'),(1932,'Asia/Baku','Asia/Baku'),(1933,'Europe/Sarajevo','Europe/Sarajevo'),(1934,'America/Barbados','America/Barbados'),(1935,'Asia/Dhaka','Asia/Dhaka'),(1936,'Europe/Brussels','Europe/Brussels'),(1937,'Africa/Ouagadougou','Africa/Ouagadougou'),(1938,'Europe/Sofia','Europe/Sofia'),(1939,'Asia/Bahrain','Asia/Bahrain'),(1940,'Africa/Bujumbura','Africa/Bujumbura'),(1941,'Africa/Porto-Novo','Africa/Porto-Novo'),(1942,'America/St_Barthelemy','America/St_Barthelemy'),(1943,'Atlantic/Bermuda','Atlantic/Bermuda'),(1944,'Asia/Brunei','Asia/Brunei'),(1945,'America/La_Paz','America/La_Paz'),(1946,'America/Kralendijk','America/Kralendijk'),(1947,'America/Araguaina','America/Araguaina'),(1948,'America/Bahia','America/Bahia'),(1949,'America/Belem','America/Belem'),(1950,'America/Boa_Vista','America/Boa_Vista'),(1951,'America/Campo_Grande','America/Campo_Grande'),(1952,'America/Cuiaba','America/Cuiaba'),(1953,'America/Eirunepe','America/Eirunepe'),(1954,'America/Fortaleza','America/Fortaleza'),(1955,'America/Maceio','America/Maceio'),(1956,'America/Manaus','America/Manaus'),(1957,'America/Noronha','America/Noronha'),(1958,'America/Porto_Velho','America/Porto_Velho'),(1959,'America/Recife','America/Recife'),(1960,'America/Rio_Branco','America/Rio_Branco'),(1961,'America/Santarem','America/Santarem'),(1962,'America/Sao_Paulo','America/Sao_Paulo'),(1963,'America/Nassau','America/Nassau'),(1964,'Asia/Thimphu','Asia/Thimphu'),(1965,'Africa/Gaborone','Africa/Gaborone'),(1966,'Europe/Minsk','Europe/Minsk'),(1967,'America/Belize','America/Belize'),(1968,'America/Atikokan','America/Atikokan'),(1969,'America/Blanc-Sablon','America/Blanc-Sablon'),(1970,'America/Cambridge_Bay','America/Cambridge_Bay'),(1971,'America/Creston','America/Creston'),(1972,'America/Dawson','America/Dawson'),(1973,'America/Dawson_Creek','America/Dawson_Creek'),(1974,'America/Edmonton','America/Edmonton'),(1975,'America/Fort_Nelson','America/Fort_Nelson'),(1976,'America/Glace_Bay','America/Glace_Bay'),(1977,'America/Goose_Bay','America/Goose_Bay'),(1978,'America/Halifax','America/Halifax'),(1979,'America/Inuvik','America/Inuvik'),(1980,'America/Iqaluit','America/Iqaluit'),(1981,'America/Moncton','America/Moncton'),(1982,'America/Nipigon','America/Nipigon'),(1983,'America/Pangnirtung','America/Pangnirtung'),(1984,'America/Rainy_River','America/Rainy_River'),(1985,'America/Rankin_Inlet','America/Rankin_Inlet'),(1986,'America/Regina','America/Regina'),(1987,'America/Resolute','America/Resolute'),(1988,'America/St_Johns','America/St_Johns'),(1989,'America/Swift_Current','America/Swift_Current'),(1990,'America/Thunder_Bay','America/Thunder_Bay'),(1991,'America/Toronto','America/Toronto'),(1992,'America/Vancouver','America/Vancouver'),(1993,'America/Whitehorse','America/Whitehorse'),(1994,'America/Winnipeg','America/Winnipeg'),(1995,'America/Yellowknife','America/Yellowknife'),(1996,'Indian/Cocos','Indian/Cocos'),(1997,'Africa/Kinshasa','Africa/Kinshasa'),(1998,'Africa/Lubumbashi','Africa/Lubumbashi'),(1999,'Africa/Bangui','Africa/Bangui'),(2000,'Africa/Brazzaville','Africa/Brazzaville'),(2001,'Europe/Zurich','Europe/Zurich'),(2002,'Africa/Abidjan','Africa/Abidjan'),(2003,'Pacific/Rarotonga','Pacific/Rarotonga'),(2004,'America/Punta_Arenas','America/Punta_Arenas'),(2005,'America/Santiago','America/Santiago'),(2006,'Pacific/Easter','Pacific/Easter'),(2007,'Africa/Douala','Africa/Douala'),(2008,'Asia/Shanghai','Asia/Shanghai'),(2009,'Asia/Urumqi','Asia/Urumqi'),(2010,'America/Bogota','America/Bogota'),(2011,'America/Costa_Rica','America/Costa_Rica'),(2012,'America/Havana','America/Havana'),(2013,'Atlantic/Cape_Verde','Atlantic/Cape_Verde'),(2014,'America/Curacao','America/Curacao'),(2015,'Indian/Christmas','Indian/Christmas'),(2016,'Asia/Famagusta','Asia/Famagusta'),(2017,'Asia/Nicosia','Asia/Nicosia'),(2018,'Europe/Prague','Europe/Prague'),(2019,'Europe/Berlin','Europe/Berlin'),(2020,'Europe/Busingen','Europe/Busingen'),(2021,'Africa/Djibouti','Africa/Djibouti'),(2022,'Europe/Copenhagen','Europe/Copenhagen'),(2023,'America/Dominica','America/Dominica'),(2024,'America/Santo_Domingo','America/Santo_Domingo'),(2025,'Africa/Algiers','Africa/Algiers'),(2026,'America/Guayaquil','America/Guayaquil'),(2027,'Pacific/Galapagos','Pacific/Galapagos'),(2028,'Europe/Tallinn','Europe/Tallinn'),(2029,'Africa/Cairo','Africa/Cairo'),(2030,'Africa/El_Aaiun','Africa/El_Aaiun'),(2031,'Africa/Asmara','Africa/Asmara'),(2032,'Africa/Ceuta','Africa/Ceuta'),(2033,'Atlantic/Canary','Atlantic/Canary'),(2034,'Europe/Madrid','Europe/Madrid'),(2035,'Africa/Addis_Ababa','Africa/Addis_Ababa'),(2036,'Europe/Helsinki','Europe/Helsinki'),(2037,'Pacific/Fiji','Pacific/Fiji'),(2038,'Atlantic/Stanley','Atlantic/Stanley'),(2039,'Pacific/Chuuk','Pacific/Chuuk'),(2040,'Pacific/Kosrae','Pacific/Kosrae'),(2041,'Pacific/Pohnpei','Pacific/Pohnpei'),(2042,'Atlantic/Faroe','Atlantic/Faroe'),(2043,'Europe/Paris','Europe/Paris'),(2044,'Africa/Libreville','Africa/Libreville'),(2045,'Europe/London','Europe/London'),(2046,'America/Grenada','America/Grenada'),(2047,'Asia/Tbilisi','Asia/Tbilisi'),(2048,'America/Cayenne','America/Cayenne'),(2049,'Europe/Guernsey','Europe/Guernsey'),(2050,'Africa/Accra','Africa/Accra'),(2051,'Europe/Gibraltar','Europe/Gibraltar'),(2052,'America/Danmarkshavn','America/Danmarkshavn'),(2053,'America/Nuuk','America/Nuuk'),(2054,'America/Scoresbysund','America/Scoresbysund'),(2055,'America/Thule','America/Thule'),(2056,'Africa/Banjul','Africa/Banjul'),(2057,'Africa/Conakry','Africa/Conakry'),(2058,'America/Guadeloupe','America/Guadeloupe'),(2059,'Africa/Malabo','Africa/Malabo'),(2060,'Europe/Athens','Europe/Athens'),(2061,'Atlantic/South_Georgia','Atlantic/South_Georgia'),(2062,'America/Guatemala','America/Guatemala'),(2063,'Pacific/Guam','Pacific/Guam'),(2064,'Africa/Bissau','Africa/Bissau'),(2065,'America/Guyana','America/Guyana'),(2066,'Asia/Hong_Kong','Asia/Hong_Kong'),(2067,'America/Tegucigalpa','America/Tegucigalpa'),(2068,'Europe/Zagreb','Europe/Zagreb'),(2069,'America/Port-au-Prince','America/Port-au-Prince'),(2070,'Europe/Budapest','Europe/Budapest'),(2071,'Asia/Jakarta','Asia/Jakarta'),(2072,'Asia/Jayapura','Asia/Jayapura'),(2073,'Asia/Makassar','Asia/Makassar'),(2074,'Asia/Pontianak','Asia/Pontianak'),(2075,'Europe/Dublin','Europe/Dublin'),(2076,'Asia/Jerusalem','Asia/Jerusalem'),(2077,'Europe/Isle_of_Man','Europe/Isle_of_Man'),(2078,'Asia/Kolkata','Asia/Kolkata'),(2079,'Indian/Chagos','Indian/Chagos'),(2080,'Asia/Baghdad','Asia/Baghdad'),(2081,'Asia/Tehran','Asia/Tehran'),(2082,'Atlantic/Reykjavik','Atlantic/Reykjavik'),(2083,'Europe/Rome','Europe/Rome'),(2084,'Europe/Jersey','Europe/Jersey'),(2085,'America/Jamaica','America/Jamaica'),(2086,'Asia/Amman','Asia/Amman'),(2087,'Asia/Tokyo','Asia/Tokyo'),(2088,'Africa/Nairobi','Africa/Nairobi'),(2089,'Asia/Bishkek','Asia/Bishkek'),(2090,'Asia/Phnom_Penh','Asia/Phnom_Penh'),(2091,'Pacific/Enderbury','Pacific/Enderbury'),(2092,'Pacific/Kiritimati','Pacific/Kiritimati'),(2093,'Pacific/Tarawa','Pacific/Tarawa'),(2094,'Indian/Comoro','Indian/Comoro'),(2095,'America/St_Kitts','America/St_Kitts'),(2096,'Asia/Pyongyang','Asia/Pyongyang'),(2097,'Asia/Seoul','Asia/Seoul'),(2098,'Asia/Kuwait','Asia/Kuwait'),(2099,'America/Cayman','America/Cayman'),(2100,'Asia/Almaty','Asia/Almaty'),(2101,'Asia/Aqtau','Asia/Aqtau'),(2102,'Asia/Aqtobe','Asia/Aqtobe'),(2103,'Asia/Atyrau','Asia/Atyrau'),(2104,'Asia/Oral','Asia/Oral'),(2105,'Asia/Qostanay','Asia/Qostanay'),(2106,'Asia/Qyzylorda','Asia/Qyzylorda'),(2107,'Asia/Vientiane','Asia/Vientiane'),(2108,'Asia/Beirut','Asia/Beirut'),(2109,'America/St_Lucia','America/St_Lucia'),(2110,'Europe/Vaduz','Europe/Vaduz'),(2111,'Asia/Colombo','Asia/Colombo'),(2112,'Africa/Monrovia','Africa/Monrovia'),(2113,'Africa/Maseru','Africa/Maseru'),(2114,'Europe/Vilnius','Europe/Vilnius'),(2115,'Europe/Luxembourg','Europe/Luxembourg'),(2116,'Europe/Riga','Europe/Riga'),(2117,'Africa/Tripoli','Africa/Tripoli'),(2118,'Africa/Casablanca','Africa/Casablanca'),(2119,'Europe/Monaco','Europe/Monaco'),(2120,'Europe/Chisinau','Europe/Chisinau'),(2121,'Europe/Podgorica','Europe/Podgorica'),(2122,'America/Marigot','America/Marigot'),(2123,'Indian/Antananarivo','Indian/Antananarivo'),(2124,'Pacific/Kwajalein','Pacific/Kwajalein'),(2125,'Pacific/Majuro','Pacific/Majuro'),(2126,'Europe/Skopje','Europe/Skopje'),(2127,'Africa/Bamako','Africa/Bamako'),(2128,'Asia/Yangon','Asia/Yangon'),(2129,'Asia/Choibalsan','Asia/Choibalsan'),(2130,'Asia/Hovd','Asia/Hovd'),(2131,'Asia/Ulaanbaatar','Asia/Ulaanbaatar'),(2132,'Asia/Macau','Asia/Macau'),(2133,'Pacific/Saipan','Pacific/Saipan'),(2134,'America/Martinique','America/Martinique'),(2135,'Africa/Nouakchott','Africa/Nouakchott'),(2136,'America/Montserrat','America/Montserrat'),(2137,'Europe/Malta','Europe/Malta'),(2138,'Indian/Mauritius','Indian/Mauritius'),(2139,'Indian/Maldives','Indian/Maldives'),(2140,'Africa/Blantyre','Africa/Blantyre'),(2141,'America/Bahia_Banderas','America/Bahia_Banderas'),(2142,'America/Cancun','America/Cancun'),(2143,'America/Chihuahua','America/Chihuahua'),(2144,'America/Hermosillo','America/Hermosillo'),(2145,'America/Matamoros','America/Matamoros'),(2146,'America/Mazatlan','America/Mazatlan'),(2147,'America/Merida','America/Merida'),(2148,'America/Mexico_City','America/Mexico_City'),(2149,'America/Monterrey','America/Monterrey'),(2150,'America/Ojinaga','America/Ojinaga'),(2151,'America/Tijuana','America/Tijuana'),(2152,'Asia/Kuala_Lumpur','Asia/Kuala_Lumpur'),(2153,'Asia/Kuching','Asia/Kuching'),(2154,'Africa/Maputo','Africa/Maputo'),(2155,'Africa/Windhoek','Africa/Windhoek'),(2156,'Pacific/Noumea','Pacific/Noumea'),(2157,'Africa/Niamey','Africa/Niamey'),(2158,'Pacific/Norfolk','Pacific/Norfolk'),(2159,'Africa/Lagos','Africa/Lagos'),(2160,'America/Managua','America/Managua'),(2161,'Europe/Amsterdam','Europe/Amsterdam'),(2162,'Europe/Oslo','Europe/Oslo'),(2163,'Asia/Kathmandu','Asia/Kathmandu'),(2164,'Pacific/Nauru','Pacific/Nauru'),(2165,'Pacific/Niue','Pacific/Niue'),(2166,'Pacific/Auckland','Pacific/Auckland'),(2167,'Pacific/Chatham','Pacific/Chatham'),(2168,'Asia/Muscat','Asia/Muscat'),(2169,'America/Panama','America/Panama'),(2170,'America/Lima','America/Lima'),(2171,'Pacific/Gambier','Pacific/Gambier'),(2172,'Pacific/Marquesas','Pacific/Marquesas'),(2173,'Pacific/Tahiti','Pacific/Tahiti'),(2174,'Pacific/Bougainville','Pacific/Bougainville'),(2175,'Pacific/Port_Moresby','Pacific/Port_Moresby'),(2176,'Asia/Manila','Asia/Manila'),(2177,'Asia/Karachi','Asia/Karachi'),(2178,'Europe/Warsaw','Europe/Warsaw'),(2179,'America/Miquelon','America/Miquelon'),(2180,'Pacific/Pitcairn','Pacific/Pitcairn'),(2181,'America/Puerto_Rico','America/Puerto_Rico'),(2182,'Asia/Gaza','Asia/Gaza'),(2183,'Asia/Hebron','Asia/Hebron'),(2184,'Atlantic/Azores','Atlantic/Azores'),(2185,'Atlantic/Madeira','Atlantic/Madeira'),(2186,'Europe/Lisbon','Europe/Lisbon'),(2187,'Pacific/Palau','Pacific/Palau'),(2188,'America/Asuncion','America/Asuncion'),(2189,'Asia/Qatar','Asia/Qatar'),(2190,'Indian/Reunion','Indian/Reunion'),(2191,'Europe/Bucharest','Europe/Bucharest'),(2192,'Europe/Belgrade','Europe/Belgrade'),(2193,'Asia/Anadyr','Asia/Anadyr'),(2194,'Asia/Barnaul','Asia/Barnaul'),(2195,'Asia/Chita','Asia/Chita'),(2196,'Asia/Irkutsk','Asia/Irkutsk'),(2197,'Asia/Kamchatka','Asia/Kamchatka'),(2198,'Asia/Khandyga','Asia/Khandyga'),(2199,'Asia/Krasnoyarsk','Asia/Krasnoyarsk'),(2200,'Asia/Magadan','Asia/Magadan'),(2201,'Asia/Novokuznetsk','Asia/Novokuznetsk'),(2202,'Asia/Novosibirsk','Asia/Novosibirsk'),(2203,'Asia/Omsk','Asia/Omsk'),(2204,'Asia/Sakhalin','Asia/Sakhalin'),(2205,'Asia/Srednekolymsk','Asia/Srednekolymsk'),(2206,'Asia/Tomsk','Asia/Tomsk'),(2207,'Asia/Ust-Nera','Asia/Ust-Nera'),(2208,'Asia/Vladivostok','Asia/Vladivostok'),(2209,'Asia/Yakutsk','Asia/Yakutsk'),(2210,'Asia/Yekaterinburg','Asia/Yekaterinburg'),(2211,'Europe/Astrakhan','Europe/Astrakhan'),(2212,'Europe/Kaliningrad','Europe/Kaliningrad'),(2213,'Europe/Kirov','Europe/Kirov'),(2214,'Europe/Moscow','Europe/Moscow'),(2215,'Europe/Samara','Europe/Samara'),(2216,'Europe/Saratov','Europe/Saratov'),(2217,'Europe/Ulyanovsk','Europe/Ulyanovsk'),(2218,'Europe/Volgograd','Europe/Volgograd'),(2219,'Africa/Kigali','Africa/Kigali'),(2220,'Asia/Riyadh','Asia/Riyadh'),(2221,'Pacific/Guadalcanal','Pacific/Guadalcanal'),(2222,'Indian/Mahe','Indian/Mahe'),(2223,'Africa/Khartoum','Africa/Khartoum'),(2224,'Europe/Stockholm','Europe/Stockholm'),(2225,'Asia/Singapore','Asia/Singapore'),(2226,'Atlantic/St_Helena','Atlantic/St_Helena'),(2227,'Europe/Ljubljana','Europe/Ljubljana'),(2228,'Arctic/Longyearbyen','Arctic/Longyearbyen'),(2229,'Europe/Bratislava','Europe/Bratislava'),(2230,'Africa/Freetown','Africa/Freetown'),(2231,'Europe/San_Marino','Europe/San_Marino'),(2232,'Africa/Dakar','Africa/Dakar'),(2233,'Africa/Mogadishu','Africa/Mogadishu'),(2234,'America/Paramaribo','America/Paramaribo'),(2235,'Africa/Juba','Africa/Juba'),(2236,'Africa/Sao_Tome','Africa/Sao_Tome'),(2237,'America/El_Salvador','America/El_Salvador'),(2238,'America/Lower_Princes','America/Lower_Princes'),(2239,'Asia/Damascus','Asia/Damascus'),(2240,'Africa/Mbabane','Africa/Mbabane'),(2241,'America/Grand_Turk','America/Grand_Turk'),(2242,'Africa/Ndjamena','Africa/Ndjamena'),(2243,'Indian/Kerguelen','Indian/Kerguelen'),(2244,'Africa/Lome','Africa/Lome'),(2245,'Asia/Bangkok','Asia/Bangkok'),(2246,'Asia/Dushanbe','Asia/Dushanbe'),(2247,'Pacific/Fakaofo','Pacific/Fakaofo'),(2248,'Asia/Dili','Asia/Dili'),(2249,'Asia/Ashgabat','Asia/Ashgabat'),(2250,'Africa/Tunis','Africa/Tunis'),(2251,'Pacific/Tongatapu','Pacific/Tongatapu'),(2252,'Europe/Istanbul','Europe/Istanbul'),(2253,'America/Port_of_Spain','America/Port_of_Spain'),(2254,'Pacific/Funafuti','Pacific/Funafuti'),(2255,'Asia/Taipei','Asia/Taipei'),(2256,'Africa/Dar_es_Salaam','Africa/Dar_es_Salaam'),(2257,'Europe/Kiev','Europe/Kiev'),(2258,'Europe/Simferopol','Europe/Simferopol'),(2259,'Europe/Uzhgorod','Europe/Uzhgorod'),(2260,'Europe/Zaporozhye','Europe/Zaporozhye'),(2261,'Africa/Kampala','Africa/Kampala'),(2262,'Pacific/Midway','Pacific/Midway'),(2263,'Pacific/Wake','Pacific/Wake'),(2264,'America/Adak','America/Adak'),(2265,'America/Anchorage','America/Anchorage'),(2266,'America/Boise','America/Boise'),(2267,'America/Chicago','America/Chicago'),(2268,'America/Denver','America/Denver'),(2269,'America/Detroit','America/Detroit'),(2270,'America/Indiana/Indianapolis','America/Indiana/Indianapolis'),(2271,'America/Indiana/Knox','America/Indiana/Knox'),(2272,'America/Indiana/Marengo','America/Indiana/Marengo'),(2273,'America/Indiana/Petersburg','America/Indiana/Petersburg'),(2274,'America/Indiana/Tell_City','America/Indiana/Tell_City'),(2275,'America/Indiana/Vevay','America/Indiana/Vevay'),(2276,'America/Indiana/Vincennes','America/Indiana/Vincennes'),(2277,'America/Indiana/Winamac','America/Indiana/Winamac'),(2278,'America/Juneau','America/Juneau'),(2279,'America/Kentucky/Louisville','America/Kentucky/Louisville'),(2280,'America/Kentucky/Monticello','America/Kentucky/Monticello'),(2281,'America/Los_Angeles','America/Los_Angeles'),(2282,'America/Menominee','America/Menominee'),(2283,'America/Metlakatla','America/Metlakatla'),(2284,'America/New_York','America/New_York'),(2285,'America/Nome','America/Nome'),(2286,'America/North_Dakota/Beulah','America/North_Dakota/Beulah'),(2287,'America/North_Dakota/Center','America/North_Dakota/Center'),(2288,'America/North_Dakota/New_Salem','America/North_Dakota/New_Salem'),(2289,'America/Phoenix','America/Phoenix'),(2290,'America/Sitka','America/Sitka'),(2291,'America/Yakutat','America/Yakutat'),(2292,'Pacific/Honolulu','Pacific/Honolulu'),(2293,'America/Montevideo','America/Montevideo'),(2294,'Asia/Samarkand','Asia/Samarkand'),(2295,'Asia/Tashkent','Asia/Tashkent'),(2296,'Europe/Vatican','Europe/Vatican'),(2297,'America/St_Vincent','America/St_Vincent'),(2298,'America/Caracas','America/Caracas'),(2299,'America/Tortola','America/Tortola'),(2300,'America/St_Thomas','America/St_Thomas'),(2301,'Asia/Ho_Chi_Minh','Asia/Ho_Chi_Minh'),(2302,'Pacific/Efate','Pacific/Efate'),(2303,'Pacific/Wallis','Pacific/Wallis'),(2304,'Pacific/Apia','Pacific/Apia'),(2305,'Asia/Aden','Asia/Aden'),(2306,'Indian/Mayotte','Indian/Mayotte'),(2307,'Africa/Johannesburg','Africa/Johannesburg'),(2308,'Africa/Lusaka','Africa/Lusaka'),(2309,'Africa/Harare','Africa/Harare'),(2310,'Opensips Dispatcher','Opensips Dispatcher'),(2311,'Company Profile','Company Profile'),(2312,'account_refilled','account_refilled'),(2313,'create_account','create_account'),(2314,'create_sip_device','create_sip_device'),(2315,'new_invoice','new_invoice'),(2316,'low_balance','low_balance'),(2317,'signup_confirmation','signup_confirmation'),(2318,'new_password','new_password'),(2319,'forgot_password_confirmation','forgot_password_confirmation'),(2320,'invoice_due_reminder','invoice_due_reminder'),(2321,'new_archive_table','new_archive_table'),(2322,'balance_tranfer','balance_tranfer'),(2323,'product_purchase','product_purchase'),(2324,'product_release','product_release'),(2325,'product_renewal_notice','product_renewal_notice'),(2326,'product_renewed','product_renewed'),(2327,'product_commission','product_commission'),(2328,'cdrs_archive_table_create_success','cdrs_archive_table_create_success'),(2329,'cdrs_archive_table_create_fail','cdrs_archive_table_create_fail'),(2330,'reset_password','reset_password'),(2331,'international_low_balance','international_low_balance'),(2332,'account_postcharge','account_postcharge'),(2333,'Caller Id (CLI Match - If not matched then use random allocated Caller Id)','Caller Id (CLI Match - If not matched then use random allocated Caller Id)'),(2334,'DID (CLI Match - If not matched then use random allocated DID)','DID (CLI Match - If not matched then use random allocated DID)'),(2335,'ERROR:No Reords found.','ERROR:No Reords found.'),(2336,'Sub Admin','Sub Admin'),(2337,'ACCOUNT_INACTIVE_DELETED','ACCOUNT_INACTIVE_DELETED'),(2338,'ACCOUNT_EXPIRE','ACCOUNT_EXPIRE'),(2339,'ALLOTTED_TIMEOUT','ALLOTTED_TIMEOUT'),(2340,'AUTHENTICATION_FAIL','AUTHENTICATION_FAIL'),(2341,'BEARERCAPABILITY_NOTAUTH','BEARERCAPABILITY_NOTAUTH'),(2342,'BEARERCAPABILITY_NOTAVAIL','BEARERCAPABILITY_NOTAVAIL'),(2343,'BEARERCAPABILITY_NOTIMPL','BEARERCAPABILITY_NOTIMPL'),(2344,'CALL_REJECTED','CALL_REJECTED'),(2345,'CHAN_NOT_IMPLEMENTED','CHAN_NOT_IMPLEMENTED'),(2346,'CHANNEL_UNACCEPTABLE','CHANNEL_UNACCEPTABLE'),(2347,'DESTINATION_OUT_OF_ORDER','DESTINATION_OUT_OF_ORDER'),(2348,'DESTINATION_BLOCKED','DESTINATION_BLOCKED'),(2349,'DID_DESTINATION_NOT_FOUND','DID_DESTINATION_NOT_FOUND'),(2350,'FACILITY_REJECTED','FACILITY_REJECTED'),(2351,'FACILITY_NOT_SUBSCRIBED','FACILITY_NOT_SUBSCRIBED'),(2352,'FACILITY_NOT_IMPLEMENTED','FACILITY_NOT_IMPLEMENTED'),(2353,'FRAUD_CALL_PER_ACCOUNT','FRAUD_CALL_PER_ACCOUNT'),(2354,'FRAUD_CALL_PER_DESTINATION','FRAUD_CALL_PER_DESTINATION'),(2355,'FRAUD_COST_PER_ACCOUNT','FRAUD_COST_PER_ACCOUNT'),(2356,'FRAUD_COST_PER_DESTINATION','FRAUD_COST_PER_DESTINATION'),(2357,'INVALID_NUMBER_FORMAT','INVALID_NUMBER_FORMAT'),(2358,'INCOMPATIBLE_DESTINATION','INCOMPATIBLE_DESTINATION'),(2359,'MANAGER_REQUEST','MANAGER_REQUEST'),(2360,'MEDIA_TIMEOUT','MEDIA_TIMEOUT'),(2361,'NO_ROUTE_DESTINATION','NO_ROUTE_DESTINATION'),(2362,'NORMAL_CLEARING','NORMAL_CLEARING'),(2363,'NETWORK_OUT_OF_ORDER','NETWORK_OUT_OF_ORDER'),(2364,'NORMAL_UNSPECIFIED','NORMAL_UNSPECIFIED'),(2365,'NORMAL_CIRCUIT_CONGESTION','NORMAL_CIRCUIT_CONGESTION'),(2366,'NORMAL_TEMPORARY_FAILURE','NORMAL_TEMPORARY_FAILURE'),(2367,'NO_SUFFICIENT_FUND','NO_SUFFICIENT_FUND'),(2368,'NO_USER_RESPONSE','NO_USER_RESPONSE'),(2369,'NO_ANSWER','NO_ANSWER'),(2370,'NUMBER_CHANGED','NUMBER_CHANGED'),(2371,'ORIGINATOR_CANCEL','ORIGINATOR_CANCEL'),(2372,'ORIGNATION_RATE_NOT_FOUND','ORIGNATION_RATE_NOT_FOUND'),(2373,'OUTGOING_CALL_BARRED','OUTGOING_CALL_BARRED'),(2374,'PROGRESS_TIMEOUT','PROGRESS_TIMEOUT'),(2375,'RECOVERY_ON_TIMER_EXPIRE','RECOVERY_ON_TIMER_EXPIRE'),(2376,'RESELLER_COST_CHEAP','RESELLER_COST_CHEAP'),(2377,'SERVICE_NOT_IMPLEMENTED','SERVICE_NOT_IMPLEMENTED'),(2378,'SERVICE_UNAVAILABLE','SERVICE_UNAVAILABLE'),(2379,'SUCCESS','SUCCESS'),(2380,'SWITCH_CONGESTION','SWITCH_CONGESTION'),(2381,'TERMINATION_RATE_NOT_FOUND','TERMINATION_RATE_NOT_FOUND'),(2382,'UNSPECIFIED','UNSPECIFIED'),(2383,'UNALLOCATED_NUMBER','UNALLOCATED_NUMBER'),(2384,'USER_BUSY','USER_BUSY'),(2385,'USER_NOT_REGISTERED','USER_NOT_REGISTERED'),(2386,'REQUESTED_CHAN_UNAVAIL','REQUESTED_CHAN_UNAVAIL'),(2387,'SUBSCRIBER_ABSENT','SUBSCRIBER_ABSENT'),(2388,'Create Account Range For Customer','Create Account Range For Customer'),(2389,'Minimum Account Number','Minimum Account Number'),(2390,'Maximum Account Number','Maximum Account Number'),(2391,'Create Account Range For Reseller','Create Account Range For Reseller'),(2392,'Create Account Range For Provider','Create Account Range For Provider'),(2393,'International Credits','International Credits'),(2394,'Recharge','Recharge'),(2395,'Basic Details','Basic Details'),(2396,'International Balance','International Balance'),(2397,'InternationalPrefixes','InternationalPrefixes'),(2398,'International Prefixes','International Prefixes'),(2399,'International Credit Limit','International Credit Limit'),(2400,'Create Local Number','Create Local Number'),(2401,'Local Number Import Process','Local Number Import Process'),(2402,'Import Local Number','Import Local Number'),(2403,'Edit Local Number','Edit Local Number'),(2404,'Mailchimp','Mailchimp'),(2405,'Mailchimp API Key','Mailchimp API Key'),(2406,'Mailchimp Audience Id','Mailchimp Audience Id'),(2407,'Support Tickets','Support Tickets'),(2408,'Support Ticket','Support Ticket'),(2409,'Create Support Ticket','Create Support Ticket'),(2410,'Open New Ticket','Open New Ticket'),(2411,'Department','Department'),(2412,'Attach more files','Attach more files'),(2413,'Reply','Reply'),(2414,'Submit','Submit'),(2415,'High','High'),(2416,'Normal','Normal'),(2417,'Low','Low'),(2418,'Open','Open'),(2419,'Answered','Answered'),(2420,'Customer-Reply','Customer-Reply'),(2421,'On-hold','On-hold'),(2422,'Progress','Progress'),(2423,'Ticket Number','Ticket Number'),(2424,'Close Support Ticket','Close Support Ticket'),(2425,'Last Reply','Last Reply'),(2426,'Ticket No','Ticket No'),(2427,'--All--','--All--'),(2428,'Add Department','Add Department'),(2429,'Department List','Department List'),(2430,'SMTP Details','SMTP Details'),(2431,'Department Additional Email Address','Department Additional Email Address'),(2432,'Department User','Department User'),(2433,'Charge Full Amount','Charge Full Amount'),(2434,'Based On Utilized Days','Based On Utilized Days'),(2435,'XML Updated Successfully!','XML Updated Successfully!'),(2436,'ACL Reload Successfully!','ACL Reload Successfully!'),(2437,'ACL Management','ACL Management'),(2438,'XML','XML'),(2439,'XML is Required!','XML is Required!'),(2440,'Reload ACL','Reload ACL'),(2441,'Low Balance','Low Balance'),(2442,'Current Balance','Current Balance'),(2443,'Trunk Statistics','Trunk Statistics'),(2444,'MCD : Maximum Call Duration','MCD : Maximum Call Duration'),(2445,'ACD : Average Call Duration','ACD : Average Call Duration'),(2446,'ASR : Answer Seizure Ratio','ASR : Answer Seizure Ratio'),(2447,'Based On Utilized Free Minutes','Based On Utilized Free Minutes'),(2448,'Based On Utilized Highest Days/Free Minutes','Based On Utilized Highest Days/Free Minutes'),(2449,'Currencies Update','Currencies Update'),(2450,'Call Activity Report','Call Activity Report'),(2451,'Fraud Report','Fraud Report'),(2452,'Switch CLI','Switch CLI'),(2453,'Request A Number Port','Request A Number Port'),(2454,'Porting','Porting'),(2455,'Generate','Generate'),(2456,'Callerid','Callerid'),(2457,'International Recharge','International Recharge'),(2458,'Profile Name','Profile Name'),(2459,'Feature code updated successfully!','Feature code updated successfully!'),(2460,'Number Porting','Number Porting'),(2461,'Number Porting Requests','Number Porting Requests'),(2462,'Number / Number Range','Number / Number Range'),(2463,'Date Submitted','Date Submitted'),(2464,'Requested Date','Requested Date'),(2465,'Requested Time','Requested Time'),(2466,'Actioned by','Actioned by'),(2467,'Note for Customer','Note for Customer'),(2468,'Accepted','Accepted'),(2469,'Rejected','Rejected'),(2470,'In Progress','In Progress'),(2471,'Completed','Completed'),(2472,'Cancelled','Cancelled'),(2473,'Create Porting Request Number','Create Porting Request Number'),(2474,'Porting Request Number','Porting Request Number'),(2475,'Company Address','Company Address'),(2476,'Individual Number','Individual Number'),(2477,'Start Number','Start Number'),(2478,'Number Range','Number Range'),(2479,'End Number','End Number'),(2480,'New Provider Name','New Provider Name'),(2481,'Existing Provider Name','Existing Provider Name'),(2482,'Requested Port Date','Requested Port Date'),(2483,'Requested Port Time','Requested Port Time'),(2484,'Upload most recent phone bill','Upload most recent phone bill'),(2485,'Edit Porting Request','Edit Porting Request'),(2486,'Telephone Number','Telephone Number'),(2487,'File Download','File Download'),(2488,'Accept','Accept'),(2489,'Reject','Reject'),(2490,'Edit Porting Request Number','Edit Porting Request Number'),(2491,'Edit Support Ticket','Edit Support Ticket'),(2492,'Edit Department','Edit Department'),(2493,'Retired','Retired'),(2494,'alarm_report','alarm_report'),(2495,'two_factor_authentication','two_factor_authentication'),(2496,'schedule_report','schedule_report'),(2497,'ported_number','ported_number'),(2498,'ported_number_ftp_connect','ported_number_ftp_connect'),(2499,'ported_number_no_file','ported_number_no_file'),(2500,'porting_request','porting_request'),(2501,'fraud_report','fraud_report'),(2502,'outbound_fax_mail','outbound_fax_mail'),(2503,'fax_receive_mail','fax_receive_mail'),(2504,'auto_reply_mail_support','auto_reply_mail_support'),(2505,'email_sent_support_ticket','email_sent_support_ticket'),(2506,'Public IP','Public IP'),(2507,'Activity Report','Activity Report'),(2508,'Push Status','Push Status'),(2509,'Last DID Call Date','Last DID Call Date'),(2510,'Last Outbound Call Date','Last Outbound Call Date'),(2511,'Login Activity','Login Activity'),(2512,'Last DID Call From Date','Last DID Call From Date'),(2513,'Last DID Call To Date','Last DID Call To Date'),(2514,'Last Outbound Call From Date','Last Outbound Call From Date'),(2515,'Last Outbound Call To Date','Last Outbound Call To Date'),(2516,'Login Activity Report','Login Activity Report'),(2517,'Assorted','Assorted'),(2518,'Auto Refresh Page','Auto Refresh Page'),(2519,'Ticket Digits','Ticket Digits'),(2520,'Recording Number','Recording Number'),(2521,'Hybrid Routing','Hybrid Routing'),(2522,'Opensips Public Host','Opensips Public Host'),(2523,'SMS Logs','SMS Logs'),(2524,'Ported Number','Ported Number'),(2525,'FTP Details','FTP Details'),(2526,'Admin Notification Email','Admin Notification Email'),(2527,'Term and Condition URL','Term and Condition URL'),(2528,'Invoice Debug','Invoice Debug'),(2529,'Sec.','Sec.'),(2530,'Min.','Min.'),(2531,'--Select All--','--Select All--'),(2532,'Filter by','Filter by'),(2533,'Time Period','Time Period'),(2534,' (In Minutes)','(In Minutes)'),(2535,'Warning Threshold','Warning Threshold'),(2536,'Warning Action','Warning Action'),(2537,'Block Threshold','Block Threshold'),(2538,'Block Action','Block Action'),(2539,'Create Fraud Detection','Create Fraud Detection'),(2540,'Per Dst. Prefix','Per Dst. Prefix'),(2541,'Group By Dst. Prefix','Group By Dst. Prefix'),(2542,'Per Country','Per Country'),(2543,'Group by Country','Group by Country'),(2544,'Edit Fraud Detection','Edit Fraud Detection'),(2545,'None','None'),(2546,'Fraud Trigger','Fraud Trigger'),(2547,'Alarm Value','Alarm Value'),(2548,'warning','warning'),(2549,'block','block'),(2550,'Freeswitch','Freeswitch'),(2551,'--Select Account Type--','--Select Account Type--'),(2552,'Weekly','Weekly'),(2553,'Quarterly','Quarterly'),(2554,'Yearly','Yearly'),(2555,'Format','Format'),(2556,'Fax Method','Fax Method'),(2557,'File','File'),(2558,'Web2fax','Web2fax'),(2559,'Email2fax','Email2fax'),(2560,'Fax2Mail','Fax2Mail'),(2561,'Fax send Retries','Fax send Retries'),(2562,'Fax Email Id','Fax Email Id'),(2563,'Fax Email Password','Fax Email Password'),(2564,'Fax Email Host','Fax Email Host'),(2565,'Fax Server','Fax Server'),(2566,'Fax Server SIP Port','Fax Server SIP Port'),(2567,'Two-factor Authentication','Two-factor Authentication'),(2568,'Wrong Attempts/Customer/Days','Wrong Attempts/Customer/Days'),(2569,'Ban Time(min)','Ban Time(min)'),(2570,'Find Time(min)','Find Time(min)'),(2571,'Whmcs Secret Key','Whmcs Secret Key'),(2572,'Whmcs IV Key','Whmcs IV Key'),(2573,'(Fixed tax)','(Fixed tax)'),(2574,'Security','Security'),(2575,'Low Balance Threshold','Low Balance Threshold'),(2576,'No Balance Threshold','No Balance Threshold'),(2577,'Max amount per call','Max amount per call'),(2578,'Alert Type','Alert Type'),(2579,'Heartbeat','Heartbeat'),(2580,'Hangup','Hangup'),(2581,'Available Credit limit','Available Credit limit');
/*!40000 ALTER TABLE `translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trunks`
--

DROP TABLE IF EXISTS `trunks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trunks` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '',
  `tech` varchar(10) NOT NULL DEFAULT '',
  `gateway_id` int NOT NULL DEFAULT '0',
  `failover_gateway_id` int NOT NULL DEFAULT '0' COMMENT 'Fail over Gateway id',
  `failover_gateway_id1` int NOT NULL DEFAULT '0',
  `provider_id` int DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `dialed_modify` mediumtext NOT NULL,
  `resellers_id` varchar(11) NOT NULL DEFAULT '0',
  `precedence` int NOT NULL DEFAULT '0',
  `maxchannels` int NOT NULL DEFAULT '0',
  `cps` int NOT NULL DEFAULT '0',
  `codec` varchar(100) NOT NULL,
  `leg_timeout` int NOT NULL DEFAULT '30',
  `creation_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `cid_translation` varchar(100) NOT NULL,
  `localization_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `provider` (`provider_id`),
  KEY `resellers_id` (`resellers_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trunks`
--

LOCK TABLES `trunks` WRITE;
/*!40000 ALTER TABLE `trunks` DISABLE KEYS */;
INSERT INTO `trunks` VALUES (1,'YourTrunk','',1,0,0,3,0,'','0',0,0,0,'PCMA,G729,PCMA',30,'0000-00-00 00:00:00','2016-07-26 15:16:00','',0);
/*!40000 ALTER TABLE `trunks` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `updateTerminationRates` AFTER UPDATE ON `trunks` FOR EACH ROW BEGIN
   if new.status = '2'
   then
        Delete from outbound_routes where trunk_id = new.id;
   end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `userlevels`
--

DROP TABLE IF EXISTS `userlevels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userlevels` (
  `userlevelid` int NOT NULL,
  `userlevelname` varchar(15) NOT NULL,
  `module_permissions` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`userlevelid`),
  KEY `userlevelname` (`userlevelname`),
  KEY `module_permissions` (`module_permissions`(1024))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userlevels`
--

LOCK TABLES `userlevels` WRITE;
/*!40000 ALTER TABLE `userlevels` DISABLE KEYS */;
INSERT INTO `userlevels` VALUES (-1,'Administrator','1,2,4,5,3,8,9,13,14,15,16,17,18,19,20,21,22,25,26,27,28,7,29,30,45,38,39,40,41,42,43,44,48,49,51,53,54,55,56,66,68,69,77,78,79,80,81,83,85,87,88,89,90,91,92,94,95,96,97,98,99,100,101,102,103,104,105,106,108,109,110,111,112,113,115,116,117,118,119,120,121,123,124,125,126,127,128,129,130,132,133,134,135,136,137,139,140,141,142,143,144,145,146,147,149,150,151,152,153,154,157,158,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,177,178,179,180,149,184,185,190,191,192,193,194,195,196,197,198,199,200,201,202,203,204,205,206,207,208,209,210,211,212,221,226,227,228,229,230,231,232,233,234,235,236,237,238,243,244,245,246,247,248,249,250,251,252,253,254,255,256,269,270,275,276,277,278,279,280,281,282,283,284,285,286,287,288,289,290,291,292,293,294,295,296,297,298,299,300,301,302,303,304,305,306,307,308,309,310,311,312,313,314,315,316,317,318,319,320,321,322,323,324,325,326,327,328,329,330,331,332,333,334,335,336,337,338,339,340,341,342,551,552,553,554,556,557,558,415,560,561,801,802,803'),(0,'Customer','31,32,37,36,34,35,33,63,64,67,70,71,73,74,72,82,181,182,396,398,399,401,414,419,421,423,425,427,429,431,433,486,487,489,508,510,511,513,514,516,550,552,612,614,616,618,619,621,622,624,625,636,637,639,640,642,643,645,646,648,649,651,652,654,655,657,658,660,661,668,670,550,555,548,548,555,559,800,804'),(1,'Reseller','1,2,7,8,13,16,17,18,19,21,25,28,38,40,44,45,46,52,9,29,53,54,66,55,68,79,81,94,95,96,97,100,101,102,103,104,108,109,110,111,115,116,117,118,123,124,126,127,132,133,134,135,140,141,143,144,149,150,151,152,157,158,160,161,165,166,168,169,91,149,92,183,277,281,285,289,293,297,302,355,357,359,361,363,365,369,371,372,374,378,392,89,403,406,410,413,415,418,420,422,424,426,428,430,432,418,420,422,424,426,428,430,432,435,437,439,441,443,445,447,463,471,476,478,480,483,486,487,488,493,502,508,509,511,512,514,515,517,524,548,549,551,570,574,584,586,588,594,598,602,606,611,613,615,617,619,620,622,623,625,635,637,638,640,641,643,644,646,647,649,650,652,653,655,656,658,659,661,668,669,679,556,558,561,564,566,568,570,577,579,581,585,589,593,600,604,608,612,616,620,624,628,632,636,640,644,648,652,656,660,664,665,666,667,26,672,673,675,677,678,679,680,681,682,683,684,685,686,687,688,689,690,691,692,66,560,561,556,20,171,154'),(2,'Admin','1,2,4,5,3,8,9,13,14,15,16,17,18,19,20,21,22,25,26,27,28,7,29,30,45,38,39,40,41,42,43,44,48,49,51,53,54,55,56,66,68,69,77,78,79,80,81,83,85,87,88,89,90,91,92,94,95,96,97,98,99,100,101,102,103,104,105,106,108,109,110,111,112,113,115,116,117,118,119,120,121,123,124,125,126,127,128,129,130,132,133,134,135,136,137,139,140,141,142,143,144,145,146,147,149,150,151,152,153,154,157,158,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,177,178,179,180,149,184,185,190,191,192,193,194,195,196,197,198,199,200,201,202,203,204,205,206,207,208,209,210,211,212,221,226,227,228,229,230,231,232,233,234,235,236,237,238,243,244,245,246,247,248,249,250,251,252,253,254,255,256,269,270,275,276,277,278,279,280,281,282,283,284,285,286,287,288,289,290,291,292,293,294,295,296,297,298,299,300,301,302,303,304,305,306,307,308,309,310,311,312,313,314,315,316,317,318,319,320,321,322,323,324,325,326,327,328,329,330,331,332,333,334,335,336,337,338,339,340,341,342,551,552,553,554,556,557,558,415,560,561,801,802,803,180'),(3,'Provider','31,32,37,36,34,35,33,63,64,67,70,71,73,74,75,356,358,360,362,364,366,370,373,375,398,33,399,401,82,411,419,421,423,425,427,429,431,433,436,438,440,442,444,446,448,464,477,479,481,484,486,487,489,508,510,511,513,514,516,585,587,589,668,670,680,182,396,550,676,548,555,555');
/*!40000 ALTER TABLE `userlevels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usertracking`
--

DROP TABLE IF EXISTS `usertracking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usertracking` (
  `id` int NOT NULL AUTO_INCREMENT,
  `session_id` varchar(100) NOT NULL,
  `user_identifier` varchar(255) NOT NULL,
  `request_uri` mediumtext NOT NULL,
  `timestamp` datetime NOT NULL,
  `client_ip` varchar(50) NOT NULL,
  `client_user_agent` mediumtext NOT NULL,
  `referer_page` mediumtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usertracking`
--

LOCK TABLES `usertracking` WRITE;
/*!40000 ALTER TABLE `usertracking` DISABLE KEYS */;
INSERT INTO `usertracking` VALUES (1,'2424be1c7c069374565b8625bb6760c9','0','broadcastemail/broadcast_email','2019-03-05 09:00:01','0','..DESCRIBE `usertracking`',''),(2,'58e3de39b3fd6b9024f8afef3218a7f8','0','broadcastemail/broadcast_email','2019-03-05 10:15:02','0','..DESCRIBE `usertracking`',''),(3,'8f5595883295567622018c7e8fc49111','1','/accounts/customer_list/','2019-03-05 10:15:37','192.168.1.20','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36..DESCRIBE `usertracking`','http://192.168.1.125:8496/'),(4,'8f5595883295567622018c7e8fc49111','1','/login/customer_permission_list/','2019-03-05 10:15:38','192.168.1.20','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36..DESCRIBE `usertracking`','http://192.168.1.125:8496/accounts/customer_list/'),(5,'8f5595883295567622018c7e8fc49111','1','/login/customer_permission_list/','2019-03-05 10:15:39','192.168.1.20','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36..DESCRIBE `usertracking`','http://192.168.1.125:8496/accounts/customer_list/'),(6,'8f5595883295567622018c7e8fc49111','1','/login/customer_permission_list/','2019-03-05 10:15:39','192.168.1.20','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36..DESCRIBE `usertracking`','http://192.168.1.125:8496/accounts/customer_list/'),(7,'8f5595883295567622018c7e8fc49111','1','/login/customer_permission_list/','2019-03-05 10:15:39','192.168.1.20','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36..DESCRIBE `usertracking`','http://192.168.1.125:8496/accounts/customer_list/'),(8,'8f5595883295567622018c7e8fc49111','1','/login/customer_permission_list/','2019-03-05 10:15:39','192.168.1.20','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36..DESCRIBE `usertracking`','http://192.168.1.125:8496/accounts/customer_list/'),(9,'8f5595883295567622018c7e8fc49111','1','/login/customer_permission_list/','2019-03-05 10:15:39','192.168.1.20','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36..DESCRIBE `usertracking`','http://192.168.1.125:8496/accounts/customer_list/'),(10,'8f5595883295567622018c7e8fc49111','1','/accounts/customer_list_json?page=1&rp=10&sortname=id&sortorder=desc&query=&qtype=','2019-03-05 10:15:39','192.168.1.20','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36..DESCRIBE `usertracking`','http://192.168.1.125:8496/accounts/customer_list/'),(11,'8f5595883295567622018c7e8fc49111','1','/dashboard/','2019-03-05 10:15:40','192.168.1.20','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36..DESCRIBE `usertracking`','http://192.168.1.125:8496/accounts/customer_list/'),(12,'8f5595883295567622018c7e8fc49111','1','/systems/configuration/global','2019-03-05 10:15:49','192.168.1.20','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36..DESCRIBE `usertracking`','http://192.168.1.125:8496/accounts/customer_list/'),(13,'8f5595883295567622018c7e8fc49111','1','/dashboard/','2019-03-05 10:15:49','192.168.1.20','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36..DESCRIBE `usertracking`','http://192.168.1.125:8496/systems/configuration/global'),(14,'68e093da639c0edccb5641d9ca10dc9c','0','broadcastemail/broadcast_email','2019-03-05 10:16:01','0','..DESCRIBE `usertracking`',''),(15,'8f5595883295567622018c7e8fc49111','1','/systems/configuration/signup','2019-03-05 10:16:05','192.168.1.20','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36..DESCRIBE `usertracking`','http://192.168.1.125:8496/systems/configuration/global'),(16,'8f5595883295567622018c7e8fc49111','1','/dashboard/','2019-03-05 10:16:05','192.168.1.20','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36..DESCRIBE `usertracking`','http://192.168.1.125:8496/systems/configuration/signup'),(17,'8f5595883295567622018c7e8fc49111','1','/systems/configuration/signup','2019-03-05 10:16:19','192.168.1.20','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36..DESCRIBE `usertracking`','http://192.168.1.125:8496/systems/configuration/signup'),(18,'8f5595883295567622018c7e8fc49111','1','/dashboard/','2019-03-05 10:16:20','192.168.1.20','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36..DESCRIBE `usertracking`','http://192.168.1.125:8496/systems/configuration/signup'),(19,'c9eed67986671fa8aefb035ad9df1311','0','broadcastemail/broadcast_email','2019-03-05 10:17:02','0','..DESCRIBE `usertracking`',''),(20,'8f5595883295567622018c7e8fc49111','1','/systems/configuration/signup','2019-03-05 10:17:05','192.168.1.20','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36..DESCRIBE `usertracking`','http://192.168.1.125:8496/systems/configuration/signup'),(21,'8f5595883295567622018c7e8fc49111','1','/dashboard/','2019-03-05 10:17:06','192.168.1.20','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36..DESCRIBE `usertracking`','http://192.168.1.125:8496/systems/configuration/signup');
/*!40000 ALTER TABLE `usertracking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `view_dids`
--

DROP TABLE IF EXISTS `view_dids`;
/*!50001 DROP VIEW IF EXISTS `view_dids`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_dids` AS SELECT 
 1 AS `id`,
 1 AS `number`,
 1 AS `reseller_product_id`,
 1 AS `account_id`,
 1 AS `reseller_id`,
 1 AS `buyer_accountid`,
 1 AS `country_id`,
 1 AS `cost`,
 1 AS `call_type`,
 1 AS `city`,
 1 AS `province`,
 1 AS `leg_timeout`,
 1 AS `maxchannels`,
 1 AS `extensions`,
 1 AS `buy_cost`,
 1 AS `setup_fee`,
 1 AS `price`,
 1 AS `billing_type`,
 1 AS `billing_days`,
 1 AS `product_id`,
 1 AS `modified_date`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_invoices`
--

DROP TABLE IF EXISTS `view_invoices`;
/*!50001 DROP VIEW IF EXISTS `view_invoices`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_invoices` AS SELECT 
 1 AS `id`,
 1 AS `number`,
 1 AS `accountid`,
 1 AS `reseller_id`,
 1 AS `from_date`,
 1 AS `to_date`,
 1 AS `due_date`,
 1 AS `status`,
 1 AS `is_paid`,
 1 AS `generate_date`,
 1 AS `type`,
 1 AS `payment_id`,
 1 AS `generate_type`,
 1 AS `confirm`,
 1 AS `notes`,
 1 AS `is_deleted`,
 1 AS `debit`,
 1 AS `debit_exchange_rate`,
 1 AS `credit`,
 1 AS `credit_exchange_rate`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `packages_view`
--

/*!50001 DROP VIEW IF EXISTS `packages_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`astppuser`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `packages_view` AS select `O`.`order_id` AS `id`,`P`.`id` AS `product_id`,`P`.`name` AS `package_name`,`O`.`free_minutes` AS `free_minutes`,`P`.`applicable_for` AS `applicable_for`,`O`.`accountid` AS `accountid` from (`products` `P` join `order_items` `O`) where ((`P`.`id` = `O`.`product_id`) and (`P`.`product_category` = 1) and (`P`.`status` = 0) and ((`O`.`termination_date` >= utc_timestamp()) or (`O`.`termination_date` = '0000-00-00 00:00:00'))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_dids`
--

/*!50001 DROP VIEW IF EXISTS `view_dids`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_dids` AS select `dids`.`id` AS `id`,`dids`.`number` AS `number`,`reseller_products`.`id` AS `reseller_product_id`,`reseller_products`.`account_id` AS `account_id`,`reseller_products`.`reseller_id` AS `reseller_id`,if((`dids`.`parent_id` <> `reseller_products`.`account_id`),(select `subrpro`.`account_id` from `reseller_products` `subrpro` where (`subrpro`.`id` > `reseller_products`.`id`) order by `subrpro`.`id` limit 1),`dids`.`accountid`) AS `buyer_accountid`,`dids`.`country_id` AS `country_id`,`dids`.`cost` AS `cost`,`dids`.`call_type` AS `call_type`,`dids`.`city` AS `city`,`dids`.`province` AS `province`,`dids`.`leg_timeout` AS `leg_timeout`,`dids`.`maxchannels` AS `maxchannels`,`dids`.`extensions` AS `extensions`,`reseller_products`.`buy_cost` AS `buy_cost`,`reseller_products`.`setup_fee` AS `setup_fee`,`reseller_products`.`price` AS `price`,`reseller_products`.`billing_type` AS `billing_type`,`reseller_products`.`billing_days` AS `billing_days`,`reseller_products`.`product_id` AS `product_id`,`reseller_products`.`modified_date` AS `modified_date` from (`reseller_products` join `dids` on((`dids`.`product_id` = `reseller_products`.`product_id`))) where (`reseller_products`.`is_optin` = 0) order by `reseller_products`.`account_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_invoices`
--

/*!50001 DROP VIEW IF EXISTS `view_invoices`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_invoices` AS select `invoices`.`id` AS `id`,concat(`invoices`.`prefix`,`invoices`.`number`) AS `number`,`invoices`.`accountid` AS `accountid`,`invoices`.`reseller_id` AS `reseller_id`,`invoices`.`from_date` AS `from_date`,`invoices`.`to_date` AS `to_date`,`invoices`.`due_date` AS `due_date`,`invoices`.`status` AS `status`,if(((select `accounts`.`posttoexternal` from `accounts` where (`accounts`.`id` = `invoices`.`accountid`)) = 0),0,if(((sum(`invoice_details`.`debit`) - sum(`invoice_details`.`credit`)) = 0),0,1)) AS `is_paid`,`invoices`.`generate_date` AS `generate_date`,`invoices`.`type` AS `type`,`invoices`.`payment_id` AS `payment_id`,`invoices`.`generate_type` AS `generate_type`,`invoices`.`confirm` AS `confirm`,`invoices`.`notes` AS `notes`,`invoices`.`is_deleted` AS `is_deleted`,sum(`invoice_details`.`debit`) AS `debit`,sum((`invoice_details`.`debit` * `invoice_details`.`exchange_rate`)) AS `debit_exchange_rate`,sum(`invoice_details`.`credit`) AS `credit`,sum((`invoice_details`.`credit` * `invoice_details`.`exchange_rate`)) AS `credit_exchange_rate` from (`invoices` join `invoice_details` on((`invoices`.`id` = `invoice_details`.`invoiceid`))) group by `invoice_details`.`invoiceid` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-12 13:19:41
