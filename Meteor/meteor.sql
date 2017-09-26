-- MySQL dump 10.13  Distrib 5.1.73, for redhat-linux-gnu (x86_64)
--
-- Host: localhost    Database: meteor
-- ------------------------------------------------------
-- Server version	5.1.73

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_group_id_b120cbf9` (`group_id`),
  KEY `auth_group_permissions_permission_id_84c5c92e` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  KEY `auth_permission_content_type_id_2f476e4b` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=88 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add permission',3,'add_permission'),(8,'Can change permission',3,'change_permission'),(9,'Can delete permission',3,'delete_permission'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add 服务',7,'add_services'),(20,'Can change 服务',7,'change_services'),(21,'Can delete 服务',7,'delete_services'),(22,'Can add 机房',8,'add_idcs'),(23,'Can change 机房',8,'change_idcs'),(24,'Can delete 机房',8,'delete_idcs'),(25,'Can add 项目',9,'add_projects'),(26,'Can change 项目',9,'change_projects'),(27,'Can delete 项目',9,'delete_projects'),(28,'Can add 服务器',10,'add_servers'),(29,'Can change 服务器',10,'change_servers'),(30,'Can delete 服务器',10,'delete_servers'),(31,'Can add roles',11,'add_roles'),(32,'Can change roles',11,'change_roles'),(33,'Can delete roles',11,'delete_roles'),(34,'Can add role permissions',12,'add_rolepermissions'),(35,'Can change role permissions',12,'change_rolepermissions'),(36,'Can delete role permissions',12,'delete_rolepermissions'),(37,'Can add groups',13,'add_groups'),(38,'Can change groups',13,'change_groups'),(39,'Can delete groups',13,'delete_groups'),(40,'Can add staff roles',14,'add_staffroles'),(41,'Can change staff roles',14,'change_staffroles'),(42,'Can delete staff roles',14,'delete_staffroles'),(43,'Can add staffs',15,'add_staffs'),(44,'Can change staffs',15,'change_staffs'),(45,'Can delete staffs',15,'delete_staffs'),(46,'Can add staff permissions',16,'add_staffpermissions'),(47,'Can change staff permissions',16,'change_staffpermissions'),(48,'Can delete staff permissions',16,'delete_staffpermissions'),(49,'Can add 值班文档交接',17,'add_dutysheets'),(50,'Can change 值班文档交接',17,'change_dutysheets'),(51,'Can delete 值班文档交接',17,'delete_dutysheets'),(52,'Can add 日志分析用户访问cdn统计',18,'add_loganalysis_cdn'),(53,'Can change 日志分析用户访问cdn统计',18,'change_loganalysis_cdn'),(54,'Can delete 日志分析用户访问cdn统计',18,'delete_loganalysis_cdn'),(55,'Can add 日志分析用户访问状态码统计',19,'add_loganalysis_status'),(56,'Can change 日志分析用户访问状态码统计',19,'change_loganalysis_status'),(57,'Can delete 日志分析用户访问状态码统计',19,'delete_loganalysis_status'),(58,'Can add 日志分析用户所在地区统计',20,'add_loganalysis_area'),(59,'Can change 日志分析用户所在地区统计',20,'change_loganalysis_area'),(60,'Can delete 日志分析用户所在地区统计',20,'delete_loganalysis_area'),(61,'Can add 日志分析用户设备统计',21,'add_loganalysis_agent'),(62,'Can change 日志分析用户设备统计',21,'change_loganalysis_agent'),(63,'Can delete 日志分析用户设备统计',21,'delete_loganalysis_agent'),(64,'Can add 日志分析用户访问域名统计',22,'add_loganalysis_http'),(65,'Can change 日志分析用户访问域名统计',22,'change_loganalysis_http'),(66,'Can delete 日志分析用户访问域名统计',22,'delete_loganalysis_http'),(67,'Can add 日志分析Nginx转发统计',23,'add_loganalysis_upstream'),(68,'Can change 日志分析Nginx转发统计',23,'change_loganalysis_upstream'),(69,'Can delete 日志分析Nginx转发统计',23,'delete_loganalysis_upstream'),(70,'Can add secondmenus',24,'add_secondmenus'),(71,'Can change secondmenus',24,'change_secondmenus'),(72,'Can delete secondmenus',24,'delete_secondmenus'),(73,'Can add firstmenus',25,'add_firstmenus'),(74,'Can change firstmenus',25,'change_firstmenus'),(75,'Can delete firstmenus',25,'delete_firstmenus'),(76,'Can add payhosts',26,'add_payhosts'),(77,'Can change payhosts',26,'change_payhosts'),(78,'Can delete payhosts',26,'delete_payhosts'),(79,'Can add paydnses',27,'add_paydnses'),(80,'Can change paydnses',27,'change_paydnses'),(81,'Can delete paydnses',27,'delete_paydnses'),(82,'Can add operaterecords',28,'add_operaterecords'),(83,'Can change operaterecords',28,'change_operaterecords'),(84,'Can delete operaterecords',28,'delete_operaterecords'),(85,'Can add 服务器巡检',29,'add_serverinspections'),(86,'Can change 服务器巡检',29,'change_serverinspections'),(87,'Can delete 服务器巡检',29,'delete_serverinspections');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_user_id_6a12ed8b` (`user_id`),
  KEY `auth_user_groups_group_id_97559544` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_user_id_a95ead1b` (`user_id`),
  KEY `auth_user_user_permissions_permission_id_1fbb5f2c` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(2,'auth','group'),(3,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(7,'serverManage','services'),(8,'serverManage','idcs'),(9,'serverManage','projects'),(10,'serverManage','servers'),(11,'userPermission','roles'),(12,'userPermission','rolepermissions'),(13,'userPermission','groups'),(14,'userPermission','staffroles'),(15,'userPermission','staffs'),(16,'userPermission','staffpermissions'),(17,'dailyManage','dutysheets'),(18,'logAnalysis','loganalysis_cdn'),(19,'logAnalysis','loganalysis_status'),(20,'logAnalysis','loganalysis_area'),(21,'logAnalysis','loganalysis_agent'),(22,'logAnalysis','loganalysis_http'),(23,'logAnalysis','loganalysis_upstream'),(24,'menuManage','secondmenus'),(25,'menuManage','firstmenus'),(26,'thirdManage','payhosts'),(27,'thirdManage','paydnses'),(28,'operateRecord','operaterecords'),(29,'inspectionManage','serverinspections');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2017-08-17 05:19:01'),(2,'auth','0001_initial','2017-08-17 05:19:01'),(3,'admin','0001_initial','2017-08-17 05:19:01'),(4,'admin','0002_logentry_remove_auto_add','2017-08-17 05:19:01'),(5,'contenttypes','0002_remove_content_type_name','2017-08-17 05:19:01'),(6,'auth','0002_alter_permission_name_max_length','2017-08-17 05:19:01'),(7,'auth','0003_alter_user_email_max_length','2017-08-17 05:19:01'),(8,'auth','0004_alter_user_username_opts','2017-08-17 05:19:01'),(9,'auth','0005_alter_user_last_login_null','2017-08-17 05:19:01'),(10,'auth','0006_require_contenttypes_0002','2017-08-17 05:19:01'),(11,'auth','0007_alter_validators_add_error_messages','2017-08-17 05:19:01'),(12,'auth','0008_alter_user_username_max_length','2017-08-17 05:19:01'),(13,'menuManage','0001_initial','2017-08-17 05:19:01'),(14,'userPermission','0001_initial','2017-08-17 05:19:01'),(15,'dailyManage','0001_initial','2017-08-17 05:19:01'),(16,'serverManage','0001_initial','2017-08-17 05:19:01'),(17,'logAnalysis','0001_initial','2017-08-17 05:19:02'),(18,'operateRecord','0001_initial','2017-08-17 05:19:02'),(19,'sessions','0001_initial','2017-08-17 05:19:02'),(20,'thirdManage','0001_initial','2017-08-17 05:19:02'),(21,'dailyManage','0002_auto_20170828_1024','2017-08-28 02:25:23'),(22,'serverManage','0002_auto_20170828_1024','2017-08-28 02:25:23'),(23,'inspectionManage','0001_initial','2017-08-28 02:25:23'),(24,'operateRecord','0002_auto_20170828_1024','2017-08-28 02:25:23'),(25,'userPermission','0002_auto_20170828_1024','2017-08-28 02:25:23'),(26,'dailyManage','0003_auto_20170828_1130','2017-08-28 03:30:26'),(27,'inspectionManage','0002_serverinspections_inspectdate','2017-08-28 03:30:26'),(28,'operateRecord','0003_auto_20170828_1130','2017-08-28 03:30:26'),(29,'serverManage','0003_auto_20170828_1130','2017-08-28 03:30:26');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('cvj2tit5b95s0qe3abo70itc4o9j5qs2','MDJkOWExYjI0NDIxZjhmZDM3MzQ4YzAxY2Y3MzQ0MmI3MmFlNjQyMDp7InVzZXJpZCI6MSwidXNlciI6Ilx1NmM5OVx1NzQ1ZVx1OTFkMSJ9','2017-08-31 09:33:50'),('aesu8g2jwsnkenm7mhrqge12zqlxy8dm','Y2ZlMTUzNDA4ZWU3YTI0MDcyMDljMzhmNmU4Nzc5YThkMzFmNzBkMzp7InVzZXJpZCI6MiwidXNlciI6Ilx1Njc0ZVx1OGZiZVx1NWViNyJ9','2017-09-05 09:48:36'),('66nsgxoc6dcyag5l8bz74b1o61xl07nr','Y2ZlMTUzNDA4ZWU3YTI0MDcyMDljMzhmNmU4Nzc5YThkMzFmNzBkMzp7InVzZXJpZCI6MiwidXNlciI6Ilx1Njc0ZVx1OGZiZVx1NWViNyJ9','2017-09-05 09:21:42'),('k47xix0av6apfhnk8s7w7eu9srco92o8','Y2ZlMTUzNDA4ZWU3YTI0MDcyMDljMzhmNmU4Nzc5YThkMzFmNzBkMzp7InVzZXJpZCI6MiwidXNlciI6Ilx1Njc0ZVx1OGZiZVx1NWViNyJ9','2017-09-06 00:50:54'),('n8dmvyeo8xi7nxnagi7r8cfxz73oh0fn','Y2ZlMTUzNDA4ZWU3YTI0MDcyMDljMzhmNmU4Nzc5YThkMzFmNzBkMzp7InVzZXJpZCI6MiwidXNlciI6Ilx1Njc0ZVx1OGZiZVx1NWViNyJ9','2017-09-11 02:13:47'),('v5r2j24cqdeqwxguy94uwflfyeg25etn','NjNjNjZmM2ZjZGE3NTE0OTYzYzQzNDk5OWNmZDIzZmZjMjYzODk4NDp7InVzZXJpZCI6NywidXNlciI6ImplZmYifQ==','2017-09-12 08:50:27'),('1d179neb652ho2i6whhm7f2q8girsdna','OGJiOWU3NWIxMWIwOWQ3ZGQzY2Q1MDZhMTIxZWZkZDk2Y2E2YjI1Mjp7InVzZXJpZCI6NSwidXNlciI6Ilx1OTY5NFx1NThjMVx1ODAwMVx1NzM4YiJ9','2017-09-25 05:11:14'),('vmtto1n8f0zyihtj5q0mrdjch1jgmrgb','MDJkOWExYjI0NDIxZjhmZDM3MzQ4YzAxY2Y3MzQ0MmI3MmFlNjQyMDp7InVzZXJpZCI6MSwidXNlciI6Ilx1NmM5OVx1NzQ1ZVx1OTFkMSJ9','2017-09-12 08:33:10'),('wg7p4cppryu3p3yegwwjalikmyftey0x','MDJkOWExYjI0NDIxZjhmZDM3MzQ4YzAxY2Y3MzQ0MmI3MmFlNjQyMDp7InVzZXJpZCI6MSwidXNlciI6Ilx1NmM5OVx1NzQ1ZVx1OTFkMSJ9','2017-09-12 08:34:19'),('7n8smpmwhwwnnmals89nnhehj1soy51g','Y2ZlMTUzNDA4ZWU3YTI0MDcyMDljMzhmNmU4Nzc5YThkMzFmNzBkMzp7InVzZXJpZCI6MiwidXNlciI6Ilx1Njc0ZVx1OGZiZVx1NWViNyJ9','2017-09-13 05:42:35'),('n2bpx3m9chnlulnlffo0264r93b7j2ux','Y2ZlMTUzNDA4ZWU3YTI0MDcyMDljMzhmNmU4Nzc5YThkMzFmNzBkMzp7InVzZXJpZCI6MiwidXNlciI6Ilx1Njc0ZVx1OGZiZVx1NWViNyJ9','2017-09-12 08:44:00'),('cnbwg8xfo0vwnmqrrbay3x322t870k22','Y2ZlMTUzNDA4ZWU3YTI0MDcyMDljMzhmNmU4Nzc5YThkMzFmNzBkMzp7InVzZXJpZCI6MiwidXNlciI6Ilx1Njc0ZVx1OGZiZVx1NWViNyJ9','2017-09-12 08:45:54'),('2mfixj9iejpcgfobxnbwam1e6akbl75s','YTA0OGIxNjQ2OGM4ZDUxNTczMTMyZTZjOWRmNTkzYTY1NjE0YWY1MTp7InVzZXJpZCI6NiwidXNlciI6Ilx1NjI2Ylx1NTczMFx1NTkyN1x1NGY2YyJ9','2017-09-12 08:45:58'),('3b5grce9541q2vwtf4p7dyunp9qxkgue','Y2ZlMTUzNDA4ZWU3YTI0MDcyMDljMzhmNmU4Nzc5YThkMzFmNzBkMzp7InVzZXJpZCI6MiwidXNlciI6Ilx1Njc0ZVx1OGZiZVx1NWViNyJ9','2017-09-13 06:14:48'),('7gu9krz0ebtz1npskb0nusoktu5yic6r','Y2ZlMTUzNDA4ZWU3YTI0MDcyMDljMzhmNmU4Nzc5YThkMzFmNzBkMzp7InVzZXJpZCI6MiwidXNlciI6Ilx1Njc0ZVx1OGZiZVx1NWViNyJ9','2017-09-13 07:19:53'),('hfp7rlnvhqj0zhvhq64km19zuh9zxo4c','Y2ZlMTUzNDA4ZWU3YTI0MDcyMDljMzhmNmU4Nzc5YThkMzFmNzBkMzp7InVzZXJpZCI6MiwidXNlciI6Ilx1Njc0ZVx1OGZiZVx1NWViNyJ9','2017-09-13 07:21:14'),('dlnr2nmq3qerwrkrsbwzdc470v3pzffk','Y2ZlMTUzNDA4ZWU3YTI0MDcyMDljMzhmNmU4Nzc5YThkMzFmNzBkMzp7InVzZXJpZCI6MiwidXNlciI6Ilx1Njc0ZVx1OGZiZVx1NWViNyJ9','2017-09-13 09:51:04'),('2c8oiwcd7gy4zlsexpb457pwmsfnn8lw','Y2ZlMTUzNDA4ZWU3YTI0MDcyMDljMzhmNmU4Nzc5YThkMzFmNzBkMzp7InVzZXJpZCI6MiwidXNlciI6Ilx1Njc0ZVx1OGZiZVx1NWViNyJ9','2017-09-14 06:48:19'),('2dpst4risbxygef5qhuh6hqbnfyh5xcp','Y2ZlMTUzNDA4ZWU3YTI0MDcyMDljMzhmNmU4Nzc5YThkMzFmNzBkMzp7InVzZXJpZCI6MiwidXNlciI6Ilx1Njc0ZVx1OGZiZVx1NWViNyJ9','2017-09-14 06:54:30'),('6byppaoqhyedpuwkuo8flq4zriutryvx','Y2ZlMTUzNDA4ZWU3YTI0MDcyMDljMzhmNmU4Nzc5YThkMzFmNzBkMzp7InVzZXJpZCI6MiwidXNlciI6Ilx1Njc0ZVx1OGZiZVx1NWViNyJ9','2017-10-02 06:52:49'),('4qes782q78hy9x0qex9bg9ssjwg5uan3','Y2ZlMTUzNDA4ZWU3YTI0MDcyMDljMzhmNmU4Nzc5YThkMzFmNzBkMzp7InVzZXJpZCI6MiwidXNlciI6Ilx1Njc0ZVx1OGZiZVx1NWViNyJ9','2017-09-14 08:26:23'),('2ut2b2yxi9ojhoxkdixc32pd8wxophey','MDJkOWExYjI0NDIxZjhmZDM3MzQ4YzAxY2Y3MzQ0MmI3MmFlNjQyMDp7InVzZXJpZCI6MSwidXNlciI6Ilx1NmM5OVx1NzQ1ZVx1OTFkMSJ9','2017-09-14 08:33:26'),('zg1pvxsbk7jysy52cs67ud7o8ks9hm0u','MDJkOWExYjI0NDIxZjhmZDM3MzQ4YzAxY2Y3MzQ0MmI3MmFlNjQyMDp7InVzZXJpZCI6MSwidXNlciI6Ilx1NmM5OVx1NzQ1ZVx1OTFkMSJ9','2017-09-14 08:35:18'),('f96058g99vslgxmxu25f4yuansslmqtq','Y2ZlMTUzNDA4ZWU3YTI0MDcyMDljMzhmNmU4Nzc5YThkMzFmNzBkMzp7InVzZXJpZCI6MiwidXNlciI6Ilx1Njc0ZVx1OGZiZVx1NWViNyJ9','2017-09-14 08:35:45'),('sow4vwquzxu1c2dppe1rry63hxz0lhni','MDJkOWExYjI0NDIxZjhmZDM3MzQ4YzAxY2Y3MzQ0MmI3MmFlNjQyMDp7InVzZXJpZCI6MSwidXNlciI6Ilx1NmM5OVx1NzQ1ZVx1OTFkMSJ9','2017-09-14 09:11:28'),('2o9cdrf5ipc9eanm0qxvlz52gechmvii','MDJkOWExYjI0NDIxZjhmZDM3MzQ4YzAxY2Y3MzQ0MmI3MmFlNjQyMDp7InVzZXJpZCI6MSwidXNlciI6Ilx1NmM5OVx1NzQ1ZVx1OTFkMSJ9','2017-09-14 09:16:10'),('tpmix2jclg60oqv6taytiafn8rb0eyf1','MDJkOWExYjI0NDIxZjhmZDM3MzQ4YzAxY2Y3MzQ0MmI3MmFlNjQyMDp7InVzZXJpZCI6MSwidXNlciI6Ilx1NmM5OVx1NzQ1ZVx1OTFkMSJ9','2017-09-16 05:31:52'),('9p4ztr58c3icttlmps4rj6b313arhmk4','MDJkOWExYjI0NDIxZjhmZDM3MzQ4YzAxY2Y3MzQ0MmI3MmFlNjQyMDp7InVzZXJpZCI6MSwidXNlciI6Ilx1NmM5OVx1NzQ1ZVx1OTFkMSJ9','2017-09-18 05:57:00'),('7sourza96q44mfhq17frw1iw6oe7qxk6','Y2ZlMTUzNDA4ZWU3YTI0MDcyMDljMzhmNmU4Nzc5YThkMzFmNzBkMzp7InVzZXJpZCI6MiwidXNlciI6Ilx1Njc0ZVx1OGZiZVx1NWViNyJ9','2017-09-23 01:38:18'),('nl8a1hn05qg2or0b1lgr4saocz9pyxvh','ZmM5NjllNDhmNjNmYTNjZjAzZTMzNjlkNWY5MGRmNTg4ZWRjNDY5Mjp7InVzZXJpZCI6OSwidXNlciI6Iml0aW1vciJ9','2017-09-20 07:35:38'),('19lswye7zpw3p4cv8dusu1zazp90i0q0','MDJkOWExYjI0NDIxZjhmZDM3MzQ4YzAxY2Y3MzQ0MmI3MmFlNjQyMDp7InVzZXJpZCI6MSwidXNlciI6Ilx1NmM5OVx1NzQ1ZVx1OTFkMSJ9','2017-09-19 02:32:07'),('vvxpsih1jvmr8utyy5xqre3fhkxe9ngv','Y2ZlMTUzNDA4ZWU3YTI0MDcyMDljMzhmNmU4Nzc5YThkMzFmNzBkMzp7InVzZXJpZCI6MiwidXNlciI6Ilx1Njc0ZVx1OGZiZVx1NWViNyJ9','2017-09-19 05:19:03'),('dnvqx26ie63cmpp9oeplnm5sg5r6djp9','MGU0Y2RiZDYxYTExOTYzOGJjZGRiODI2ZjJjYzc1MjlkMThkYjE3ZTp7InVzZXJpZCI6MiwidXNlciI6ImFkbWluIn0=','2017-10-09 08:59:07'),('4sgb54nzvetjzgzthrp0eitc4tbqzfwt','Y2ZlMTUzNDA4ZWU3YTI0MDcyMDljMzhmNmU4Nzc5YThkMzFmNzBkMzp7InVzZXJpZCI6MiwidXNlciI6Ilx1Njc0ZVx1OGZiZVx1NWViNyJ9','2017-09-28 07:56:03'),('y5et1pghbu49dgchq96vqlwporq1ixuk','ZmM5NjllNDhmNjNmYTNjZjAzZTMzNjlkNWY5MGRmNTg4ZWRjNDY5Mjp7InVzZXJpZCI6OSwidXNlciI6Iml0aW1vciJ9','2017-09-20 07:31:06'),('3grjgof5h8v91hkw2vyxwrle24f7veib','ZmM5NjllNDhmNjNmYTNjZjAzZTMzNjlkNWY5MGRmNTg4ZWRjNDY5Mjp7InVzZXJpZCI6OSwidXNlciI6Iml0aW1vciJ9','2017-09-20 07:31:48'),('nbgim54omlhwe44yuxope5xlxfacohin','ZmM5NjllNDhmNjNmYTNjZjAzZTMzNjlkNWY5MGRmNTg4ZWRjNDY5Mjp7InVzZXJpZCI6OSwidXNlciI6Iml0aW1vciJ9','2017-09-20 07:37:07'),('x4q3wmgvx166y740i2f3744d3ouwzwy0','ZmM5NjllNDhmNjNmYTNjZjAzZTMzNjlkNWY5MGRmNTg4ZWRjNDY5Mjp7InVzZXJpZCI6OSwidXNlciI6Iml0aW1vciJ9','2017-09-20 07:40:37'),('wd2g1rop2lxra5pfd25ulb7pqukyuix1','ZmM5NjllNDhmNjNmYTNjZjAzZTMzNjlkNWY5MGRmNTg4ZWRjNDY5Mjp7InVzZXJpZCI6OSwidXNlciI6Iml0aW1vciJ9','2017-09-20 07:41:19'),('9qh8eynx28pqozlwwbaoj7pr7elc3bff','ZmM5NjllNDhmNjNmYTNjZjAzZTMzNjlkNWY5MGRmNTg4ZWRjNDY5Mjp7InVzZXJpZCI6OSwidXNlciI6Iml0aW1vciJ9','2017-09-20 08:09:50'),('1t6hwbguii0a0g0i16eym5dfj8pxib68','ZmM5NjllNDhmNjNmYTNjZjAzZTMzNjlkNWY5MGRmNTg4ZWRjNDY5Mjp7InVzZXJpZCI6OSwidXNlciI6Iml0aW1vciJ9','2017-09-20 08:10:53'),('3c3hz36xzuemp1e78wm04kxaj5csgvk4','ZmM5NjllNDhmNjNmYTNjZjAzZTMzNjlkNWY5MGRmNTg4ZWRjNDY5Mjp7InVzZXJpZCI6OSwidXNlciI6Iml0aW1vciJ9','2017-09-20 08:11:30'),('wxgwwrrjwpo29cjfaewohxar7oz4ozti','ZmM5NjllNDhmNjNmYTNjZjAzZTMzNjlkNWY5MGRmNTg4ZWRjNDY5Mjp7InVzZXJpZCI6OSwidXNlciI6Iml0aW1vciJ9','2017-09-20 08:32:13'),('i8hgipuezkd3r8xwu4nw3grbtk1rpwlx','ZmM5NjllNDhmNjNmYTNjZjAzZTMzNjlkNWY5MGRmNTg4ZWRjNDY5Mjp7InVzZXJpZCI6OSwidXNlciI6Iml0aW1vciJ9','2017-09-20 08:43:12'),('vo1jzs4yerydqobf9en8zoktb1au3ea1','ZmM5NjllNDhmNjNmYTNjZjAzZTMzNjlkNWY5MGRmNTg4ZWRjNDY5Mjp7InVzZXJpZCI6OSwidXNlciI6Iml0aW1vciJ9','2017-09-20 08:44:50'),('znejg82371g0p22ywze6t5bfzyb9fpzx','ZmM5NjllNDhmNjNmYTNjZjAzZTMzNjlkNWY5MGRmNTg4ZWRjNDY5Mjp7InVzZXJpZCI6OSwidXNlciI6Iml0aW1vciJ9','2017-09-20 08:52:24'),('3ki7qe5p01err8paemelzuh5wcekb1pi','ZmM5NjllNDhmNjNmYTNjZjAzZTMzNjlkNWY5MGRmNTg4ZWRjNDY5Mjp7InVzZXJpZCI6OSwidXNlciI6Iml0aW1vciJ9','2017-09-20 08:53:17'),('1w90ac9nnhedcj99klzb52donce5xuyj','ZmM5NjllNDhmNjNmYTNjZjAzZTMzNjlkNWY5MGRmNTg4ZWRjNDY5Mjp7InVzZXJpZCI6OSwidXNlciI6Iml0aW1vciJ9','2017-09-20 08:55:15'),('ecwq5is17y776h6ghwke87206foa0q8u','ZmM5NjllNDhmNjNmYTNjZjAzZTMzNjlkNWY5MGRmNTg4ZWRjNDY5Mjp7InVzZXJpZCI6OSwidXNlciI6Iml0aW1vciJ9','2017-09-20 08:56:18'),('xx34o2pf7y22z223zz8916igc0jzqj5j','ZmM5NjllNDhmNjNmYTNjZjAzZTMzNjlkNWY5MGRmNTg4ZWRjNDY5Mjp7InVzZXJpZCI6OSwidXNlciI6Iml0aW1vciJ9','2017-09-20 08:56:58'),('3h4931wul3m1vdtdxgrixmjb63tvakzk','ZmM5NjllNDhmNjNmYTNjZjAzZTMzNjlkNWY5MGRmNTg4ZWRjNDY5Mjp7InVzZXJpZCI6OSwidXNlciI6Iml0aW1vciJ9','2017-09-20 08:57:25'),('l7bfmkaam4f23ciwqlkjdziph1hqbmnj','ZmM5NjllNDhmNjNmYTNjZjAzZTMzNjlkNWY5MGRmNTg4ZWRjNDY5Mjp7InVzZXJpZCI6OSwidXNlciI6Iml0aW1vciJ9','2017-09-20 08:58:04'),('d76nr1axeqbz1eypdyli94e8xvraie8n','ZmM5NjllNDhmNjNmYTNjZjAzZTMzNjlkNWY5MGRmNTg4ZWRjNDY5Mjp7InVzZXJpZCI6OSwidXNlciI6Iml0aW1vciJ9','2017-09-20 08:58:36'),('tcnqymrmv4kg8sjjzc7r0g16k9zr2mdl','ZmM5NjllNDhmNjNmYTNjZjAzZTMzNjlkNWY5MGRmNTg4ZWRjNDY5Mjp7InVzZXJpZCI6OSwidXNlciI6Iml0aW1vciJ9','2017-09-20 08:58:58'),('z8fz7ofw18ks7ni83pdz6pfp1qgmf40k','ZmM5NjllNDhmNjNmYTNjZjAzZTMzNjlkNWY5MGRmNTg4ZWRjNDY5Mjp7InVzZXJpZCI6OSwidXNlciI6Iml0aW1vciJ9','2017-09-20 08:59:48'),('48vzanxred64pruh0krecfgf5i6w90om','ZmM5NjllNDhmNjNmYTNjZjAzZTMzNjlkNWY5MGRmNTg4ZWRjNDY5Mjp7InVzZXJpZCI6OSwidXNlciI6Iml0aW1vciJ9','2017-09-20 09:01:53'),('ivje8o1ixm6jtfi6glccwvd4nll4kw13','ZmM5NjllNDhmNjNmYTNjZjAzZTMzNjlkNWY5MGRmNTg4ZWRjNDY5Mjp7InVzZXJpZCI6OSwidXNlciI6Iml0aW1vciJ9','2017-09-20 09:01:56'),('x8drtnwqz3gvtr4cljq5ncqh1y1nvmzu','ZmM5NjllNDhmNjNmYTNjZjAzZTMzNjlkNWY5MGRmNTg4ZWRjNDY5Mjp7InVzZXJpZCI6OSwidXNlciI6Iml0aW1vciJ9','2017-09-20 09:02:13'),('qw9w1069eh4yv8djbv39ns4cj70rdpok','ZmM5NjllNDhmNjNmYTNjZjAzZTMzNjlkNWY5MGRmNTg4ZWRjNDY5Mjp7InVzZXJpZCI6OSwidXNlciI6Iml0aW1vciJ9','2017-09-20 09:03:25'),('7kzi959sslyfz0sdi889qyi3ie4rpqzv','ZmM5NjllNDhmNjNmYTNjZjAzZTMzNjlkNWY5MGRmNTg4ZWRjNDY5Mjp7InVzZXJpZCI6OSwidXNlciI6Iml0aW1vciJ9','2017-09-20 09:04:07'),('hwbdmac2nk5bukbo6xgsn6bzifgu99qn','ZmM5NjllNDhmNjNmYTNjZjAzZTMzNjlkNWY5MGRmNTg4ZWRjNDY5Mjp7InVzZXJpZCI6OSwidXNlciI6Iml0aW1vciJ9','2017-09-20 09:04:31'),('4x3m4og21zcfw94f9bpojs54e51jr0bd','ZmM5NjllNDhmNjNmYTNjZjAzZTMzNjlkNWY5MGRmNTg4ZWRjNDY5Mjp7InVzZXJpZCI6OSwidXNlciI6Iml0aW1vciJ9','2017-09-20 09:05:19'),('1q4b2o563s7mstr7twz7xrus1fvyqbf6','ZmM5NjllNDhmNjNmYTNjZjAzZTMzNjlkNWY5MGRmNTg4ZWRjNDY5Mjp7InVzZXJpZCI6OSwidXNlciI6Iml0aW1vciJ9','2017-09-20 09:07:02'),('6kpqutgc7l4h18s9ueo3ydgbn3e5451y','ZmM5NjllNDhmNjNmYTNjZjAzZTMzNjlkNWY5MGRmNTg4ZWRjNDY5Mjp7InVzZXJpZCI6OSwidXNlciI6Iml0aW1vciJ9','2017-09-20 09:08:27'),('fohucnvas8b899ho1mulgw6xh1m2zy80','ZmM5NjllNDhmNjNmYTNjZjAzZTMzNjlkNWY5MGRmNTg4ZWRjNDY5Mjp7InVzZXJpZCI6OSwidXNlciI6Iml0aW1vciJ9','2017-09-20 09:08:47'),('qj4mb59wtk5sarq0nbr10c3wcvdle5f9','ZmM5NjllNDhmNjNmYTNjZjAzZTMzNjlkNWY5MGRmNTg4ZWRjNDY5Mjp7InVzZXJpZCI6OSwidXNlciI6Iml0aW1vciJ9','2017-09-20 09:12:09'),('3rpirz7gukhngr30tfyf9ccvg1wxw15q','ZmM5NjllNDhmNjNmYTNjZjAzZTMzNjlkNWY5MGRmNTg4ZWRjNDY5Mjp7InVzZXJpZCI6OSwidXNlciI6Iml0aW1vciJ9','2017-09-20 09:14:04'),('uky3khbct4i6m1itz8y4zqbgebjg25q4','ZmM5NjllNDhmNjNmYTNjZjAzZTMzNjlkNWY5MGRmNTg4ZWRjNDY5Mjp7InVzZXJpZCI6OSwidXNlciI6Iml0aW1vciJ9','2017-09-20 09:15:28'),('6c2ypczjo1lmu87jywydxrdhiiqt3o6k','ZmM5NjllNDhmNjNmYTNjZjAzZTMzNjlkNWY5MGRmNTg4ZWRjNDY5Mjp7InVzZXJpZCI6OSwidXNlciI6Iml0aW1vciJ9','2017-09-20 09:18:14'),('vhp414vavpjgsre8fshco1a0j54rx8u6','ZmM5NjllNDhmNjNmYTNjZjAzZTMzNjlkNWY5MGRmNTg4ZWRjNDY5Mjp7InVzZXJpZCI6OSwidXNlciI6Iml0aW1vciJ9','2017-09-20 09:21:45'),('vo2no73bidtcohhih8yq8sd78jh72djr','ZmM5NjllNDhmNjNmYTNjZjAzZTMzNjlkNWY5MGRmNTg4ZWRjNDY5Mjp7InVzZXJpZCI6OSwidXNlciI6Iml0aW1vciJ9','2017-09-20 09:22:54'),('4z1n2rltesz0eulubz5jusmvqba8zaip','ZmM5NjllNDhmNjNmYTNjZjAzZTMzNjlkNWY5MGRmNTg4ZWRjNDY5Mjp7InVzZXJpZCI6OSwidXNlciI6Iml0aW1vciJ9','2017-09-20 09:23:56'),('gexvta5jf4jlzq64uft9rwg6naizj66r','ZmM5NjllNDhmNjNmYTNjZjAzZTMzNjlkNWY5MGRmNTg4ZWRjNDY5Mjp7InVzZXJpZCI6OSwidXNlciI6Iml0aW1vciJ9','2017-09-20 09:24:26'),('a68gknqn05s08iibe1m4mdhvveej5m5o','ZmM5NjllNDhmNjNmYTNjZjAzZTMzNjlkNWY5MGRmNTg4ZWRjNDY5Mjp7InVzZXJpZCI6OSwidXNlciI6Iml0aW1vciJ9','2017-09-20 09:25:08'),('829na2nuaec6kjkfz5bzmxhb0qdjs1z5','Y2ZlMTUzNDA4ZWU3YTI0MDcyMDljMzhmNmU4Nzc5YThkMzFmNzBkMzp7InVzZXJpZCI6MiwidXNlciI6Ilx1Njc0ZVx1OGZiZVx1NWViNyJ9','2017-09-20 09:41:34'),('2u5bwcrx1ndf3x0rd1ordkmp1xg97a8e','ZmM5NjllNDhmNjNmYTNjZjAzZTMzNjlkNWY5MGRmNTg4ZWRjNDY5Mjp7InVzZXJpZCI6OSwidXNlciI6Iml0aW1vciJ9','2017-09-20 09:45:42'),('mxwomzzofzrgwjmmt3d8gzocqr5659am','ZmM5NjllNDhmNjNmYTNjZjAzZTMzNjlkNWY5MGRmNTg4ZWRjNDY5Mjp7InVzZXJpZCI6OSwidXNlciI6Iml0aW1vciJ9','2017-09-21 01:02:42'),('n33l260y7wjz6ijzkm416s9cnrmcqs81','Y2ZlMTUzNDA4ZWU3YTI0MDcyMDljMzhmNmU4Nzc5YThkMzFmNzBkMzp7InVzZXJpZCI6MiwidXNlciI6Ilx1Njc0ZVx1OGZiZVx1NWViNyJ9','2017-09-21 01:12:41'),('zftva2dm2u98tap5tpwab5rdbb97ofb0','Y2ZlMTUzNDA4ZWU3YTI0MDcyMDljMzhmNmU4Nzc5YThkMzFmNzBkMzp7InVzZXJpZCI6MiwidXNlciI6Ilx1Njc0ZVx1OGZiZVx1NWViNyJ9','2017-09-22 01:28:26'),('9ev6u7a8j65gph4xgfy10wrga27gmawt','ZmM5NjllNDhmNjNmYTNjZjAzZTMzNjlkNWY5MGRmNTg4ZWRjNDY5Mjp7InVzZXJpZCI6OSwidXNlciI6Iml0aW1vciJ9','2017-09-22 13:31:48'),('e95rtakbqycpdj6uctg6wkaddrcku3k5','Y2ZlMTUzNDA4ZWU3YTI0MDcyMDljMzhmNmU4Nzc5YThkMzFmNzBkMzp7InVzZXJpZCI6MiwidXNlciI6Ilx1Njc0ZVx1OGZiZVx1NWViNyJ9','2017-09-25 05:30:37'),('etq46460nyhg0n1hd5b9d5zwe1a8icdj','Y2ZlMTUzNDA4ZWU3YTI0MDcyMDljMzhmNmU4Nzc5YThkMzFmNzBkMzp7InVzZXJpZCI6MiwidXNlciI6Ilx1Njc0ZVx1OGZiZVx1NWViNyJ9','2017-10-02 06:45:18'),('juu1w417sye7gvc4zkn51vvl2i01agoo','Y2ZlMTUzNDA4ZWU3YTI0MDcyMDljMzhmNmU4Nzc5YThkMzFmNzBkMzp7InVzZXJpZCI6MiwidXNlciI6Ilx1Njc0ZVx1OGZiZVx1NWViNyJ9','2017-10-05 05:46:32');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meteor_dutysheets`
--

DROP TABLE IF EXISTS `meteor_dutysheets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meteor_dutysheets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantum` varchar(4) DEFAULT NULL,
  `content` longtext,
  `date` datetime,
  `photo` varchar(100) NOT NULL,
  `deleteTag` varchar(20) DEFAULT NULL,
  `deleteDate` datetime,
  `staff_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `meteor_dutysheets_staff_id_c8978dd7` (`staff_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meteor_dutysheets`
--

LOCK TABLES `meteor_dutysheets` WRITE;
/*!40000 ALTER TABLE `meteor_dutysheets` DISABLE KEYS */;
INSERT INTO `meteor_dutysheets` VALUES (1,'e','9月11日交接，无异常','2017-09-11 01:30:00','dutyImg/no-img.png',NULL,'2017-09-11 01:17:45',1),(2,'m','9月10日交接，异常已处理……','2017-09-10 01:30:00','dutyImg/no-img.png',NULL,'2017-09-11 01:17:45',3);
/*!40000 ALTER TABLE `meteor_dutysheets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meteor_firstmenus`
--

DROP TABLE IF EXISTS `meteor_firstmenus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meteor_firstmenus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  `iconclass` varchar(80) NOT NULL,
  `comment` varchar(160) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meteor_firstmenus`
--

LOCK TABLES `meteor_firstmenus` WRITE;
/*!40000 ALTER TABLE `meteor_firstmenus` DISABLE KEYS */;
INSERT INTO `meteor_firstmenus` VALUES (1,'日常管理','fa fa-cogs','包括值班交接文档管理和运维常见问题管理等'),(2,'日志分析','fa fa-sort','包括Nginx等应用的日志分析'),(3,'菜单管理','fa fa-tree','包括主菜单、子菜单的管理'),(4,'操作日志','fa fa-database','操作日志的查看'),(5,'服务器管理','fa fa-desktop','包括项目、IDC、服务器、服务等的管理'),(6,'第三方平台管理','fa fa-cloud','包括第三方api的调用'),(7,'用户权限管理','fa fa-user','包括用户、组、角色、权限的管理'),(8,'巡检管理','fa fa-fighter-jet','包括服务器巡检');
/*!40000 ALTER TABLE `meteor_firstmenus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meteor_groups`
--

DROP TABLE IF EXISTS `meteor_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meteor_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `comment` varchar(160) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meteor_groups`
--

LOCK TABLES `meteor_groups` WRITE;
/*!40000 ALTER TABLE `meteor_groups` DISABLE KEYS */;
INSERT INTO `meteor_groups` VALUES (1,'OM','运维组'),(2,'DEV','开发组');
/*!40000 ALTER TABLE `meteor_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meteor_idcs`
--

DROP TABLE IF EXISTS `meteor_idcs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meteor_idcs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `location` varchar(128) NOT NULL,
  `telephone` varchar(128) NOT NULL,
  `comment` longtext,
  `staff_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `meteor_idcs_staff_id_b15894ba` (`staff_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meteor_idcs`
--

LOCK TABLES `meteor_idcs` WRITE;
/*!40000 ALTER TABLE `meteor_idcs` DISABLE KEYS */;
INSERT INTO `meteor_idcs` VALUES (1,'阿里云','杭州','',NULL,1);
/*!40000 ALTER TABLE `meteor_idcs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meteor_loganalysis_agent`
--

DROP TABLE IF EXISTS `meteor_loganalysis_agent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meteor_loganalysis_agent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `logservice` varchar(64) DEFAULT NULL,
  `http_user_agent` longtext,
  `timestamp` longtext,
  `size` int(11) DEFAULT NULL,
  `service_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `meteor_loganalysis_agent_service_id_3a3ec6c1` (`service_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meteor_loganalysis_agent`
--

LOCK TABLES `meteor_loganalysis_agent` WRITE;
/*!40000 ALTER TABLE `meteor_loganalysis_agent` DISABLE KEYS */;
/*!40000 ALTER TABLE `meteor_loganalysis_agent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meteor_loganalysis_area`
--

DROP TABLE IF EXISTS `meteor_loganalysis_area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meteor_loganalysis_area` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `logservice` varchar(64) DEFAULT NULL,
  `clientip` longtext,
  `timestamp` longtext,
  `size` int(11) DEFAULT NULL,
  `service_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `meteor_loganalysis_area_service_id_4dd3c62a` (`service_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meteor_loganalysis_area`
--

LOCK TABLES `meteor_loganalysis_area` WRITE;
/*!40000 ALTER TABLE `meteor_loganalysis_area` DISABLE KEYS */;
/*!40000 ALTER TABLE `meteor_loganalysis_area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meteor_loganalysis_cdn`
--

DROP TABLE IF EXISTS `meteor_loganalysis_cdn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meteor_loganalysis_cdn` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `logservice` varchar(64) DEFAULT NULL,
  `cdnip` longtext,
  `timestamp` longtext,
  `size` int(11) DEFAULT NULL,
  `service_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `meteor_loganalysis_cdn_service_id_7d699755` (`service_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meteor_loganalysis_cdn`
--

LOCK TABLES `meteor_loganalysis_cdn` WRITE;
/*!40000 ALTER TABLE `meteor_loganalysis_cdn` DISABLE KEYS */;
/*!40000 ALTER TABLE `meteor_loganalysis_cdn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meteor_loganalysis_http`
--

DROP TABLE IF EXISTS `meteor_loganalysis_http`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meteor_loganalysis_http` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `logservice` varchar(64) DEFAULT NULL,
  `domain` longtext,
  `timestamp` longtext,
  `size` int(11) DEFAULT NULL,
  `service_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `meteor_loganalysis_http_service_id_10ce9440` (`service_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meteor_loganalysis_http`
--

LOCK TABLES `meteor_loganalysis_http` WRITE;
/*!40000 ALTER TABLE `meteor_loganalysis_http` DISABLE KEYS */;
/*!40000 ALTER TABLE `meteor_loganalysis_http` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meteor_loganalysis_status`
--

DROP TABLE IF EXISTS `meteor_loganalysis_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meteor_loganalysis_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `logservice` varchar(64) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `timestamp` longtext,
  `size` int(11) DEFAULT NULL,
  `service_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `meteor_loganalysis_status_service_id_9b4eb4af` (`service_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meteor_loganalysis_status`
--

LOCK TABLES `meteor_loganalysis_status` WRITE;
/*!40000 ALTER TABLE `meteor_loganalysis_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `meteor_loganalysis_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meteor_loganalysis_upstream`
--

DROP TABLE IF EXISTS `meteor_loganalysis_upstream`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meteor_loganalysis_upstream` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `logservice` varchar(64) DEFAULT NULL,
  `upstreamaddr` longtext,
  `timestamp` longtext,
  `size` int(11) DEFAULT NULL,
  `service_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `meteor_loganalysis_upstream_service_id_6634f19a` (`service_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meteor_loganalysis_upstream`
--

LOCK TABLES `meteor_loganalysis_upstream` WRITE;
/*!40000 ALTER TABLE `meteor_loganalysis_upstream` DISABLE KEYS */;
/*!40000 ALTER TABLE `meteor_loganalysis_upstream` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meteor_operaterecords`
--

DROP TABLE IF EXISTS `meteor_operaterecords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meteor_operaterecords` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userip` varchar(15) NOT NULL,
  `date` datetime NOT NULL,
  `operate` varchar(6) NOT NULL,
  `olddata` longtext NOT NULL,
  `newdata` longtext NOT NULL,
  `comment` varchar(160) DEFAULT NULL,
  `secondmenu_id` int(11) DEFAULT NULL,
  `staff_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `meteor_operaterecords_secondmenu_id_a558789f` (`secondmenu_id`),
  KEY `meteor_operaterecords_staff_id_51f710bf` (`staff_id`)
) ENGINE=MyISAM AUTO_INCREMENT=432 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meteor_operaterecords`
--

LOCK TABLES `meteor_operaterecords` WRITE;
/*!40000 ALTER TABLE `meteor_operaterecords` DISABLE KEYS */;
INSERT INTO `meteor_operaterecords` VALUES (1,'192.168.132.1','2017-08-17 05:56:38','add','\"\"','{\"id\": 2, \"name\": \"日志分析\", \"iconclass\": \"\", \"comment\": \"包括Nginx等应用的日志分析\"}','大哥，子菜单栏中没有对应的链接/menumanage/menus/，请喊管理员到子菜单栏中添加该链接，谢谢大哥！',NULL,NULL),(2,'192.168.132.1','2017-08-17 05:57:31','add','\"\"','{\"id\": 3, \"name\": \"菜单管理\", \"iconclass\": \"\", \"comment\": \"包括父菜单、子菜单的管理\"}','大哥，子菜单栏中没有对应的链接/menumanage/menus/，请喊管理员到子菜单栏中添加该链接，谢谢大哥！',NULL,NULL),(3,'192.168.132.1','2017-08-17 05:58:02','add','\"\"','{\"id\": 4, \"name\": \"操作日志\", \"iconclass\": \"\", \"comment\": \"操作日志的查看\"}','大哥，子菜单栏中没有对应的链接/menumanage/menus/，请喊管理员到子菜单栏中添加该链接，谢谢大哥！',NULL,NULL),(4,'192.168.132.1','2017-08-17 05:58:53','add','\"\"','{\"id\": 5, \"name\": \"服务器管理\", \"iconclass\": \"\", \"comment\": \"包括项目、IDC、服务器、服务等的管理\"}','大哥，子菜单栏中没有对应的链接/menumanage/menus/，请喊管理员到子菜单栏中添加该链接，谢谢大哥！',NULL,NULL),(5,'192.168.132.1','2017-08-17 05:59:27','add','\"\"','{\"id\": 6, \"name\": \"第三方平台管理\", \"iconclass\": \"\", \"comment\": \"包括第三方api的调用\"}','大哥，子菜单栏中没有对应的链接/menumanage/menus/，请喊管理员到子菜单栏中添加该链接，谢谢大哥！',NULL,NULL),(6,'192.168.132.1','2017-08-17 06:00:23','add','\"\"','{\"id\": 7, \"name\": \"用户权限管理\", \"iconclass\": \"\", \"comment\": \"包括用户、组、角色、权限的管理\"}','大哥，子菜单栏中没有对应的链接/menumanage/menus/，请喊管理员到子菜单栏中添加该链接，谢谢大哥！',NULL,NULL),(7,'192.168.132.1','2017-08-17 06:04:46','add','\"\"','{\"id\": 1, \"name\": \"用户组管理\", \"url\": \"/userpermission/groups/\", \"onshow\": true, \"comment\": null, \"firstmenu\": 7}','大哥，子菜单栏中没有对应的链接/menumanage/secondmenus/，请喊管理员到子菜单栏中添加该链接，谢谢大哥！',NULL,NULL),(8,'192.168.132.1','2017-08-17 06:05:18','add','\"\"','{\"id\": 2, \"name\": \"用户\", \"url\": \"/userpermission/staffs/\", \"onshow\": true, \"comment\": null, \"firstmenu\": 7}','大哥，子菜单栏中没有对应的链接/menumanage/secondmenus/，请喊管理员到子菜单栏中添加该链接，谢谢大哥！',NULL,NULL),(9,'192.168.132.1','2017-08-17 06:05:46','add','\"\"','{\"id\": 3, \"name\": \"角色管理\", \"url\": \"/userpermission/roles/\", \"onshow\": true, \"comment\": null, \"firstmenu\": 7}','大哥，子菜单栏中没有对应的链接/menumanage/secondmenus/，请喊管理员到子菜单栏中添加该链接，谢谢大哥！',NULL,NULL),(10,'192.168.132.1','2017-08-17 06:06:35','add','\"\"','{\"id\": 4, \"name\": \"角色权限管理\", \"url\": \"/userpermission/rolepermissions/\", \"onshow\": true, \"comment\": null, \"firstmenu\": 7}','大哥，子菜单栏中没有对应的链接/menumanage/secondmenus/，请喊管理员到子菜单栏中添加该链接，谢谢大哥！',NULL,NULL),(11,'192.168.132.1','2017-08-17 06:09:58','add','\"\"','{\"id\": 5, \"name\": \"用户角色管理\", \"url\": \"/userpermission/staffroles/\", \"onshow\": true, \"comment\": null, \"firstmenu\": 7}','大哥，子菜单栏中没有对应的链接/menumanage/secondmenus/，请喊管理员到子菜单栏中添加该链接，谢谢大哥！',NULL,NULL),(12,'192.168.132.1','2017-08-17 06:11:52','add','\"\"','{\"id\": 6, \"name\": \"用户权限管理\", \"url\": \"/userpermission/staffpermissions/\", \"onshow\": true, \"comment\": null, \"firstmenu\": 7}','大哥，子菜单栏中没有对应的链接/menumanage/secondmenus/，请喊管理员到子菜单栏中添加该链接，谢谢大哥！',NULL,NULL),(13,'192.168.132.1','2017-08-17 06:14:40','add','\"\"','{\"id\": 7, \"name\": \"父菜单管理\", \"url\": \"/menumanage/menus/\", \"onshow\": true, \"comment\": null, \"firstmenu\": 3}','大哥，子菜单栏中没有对应的链接/menumanage/secondmenus/，请喊管理员到子菜单栏中添加该链接，谢谢大哥！',NULL,NULL),(14,'192.168.132.1','2017-08-17 06:15:07','add','\"\"','{\"id\": 8, \"name\": \"子单管理\", \"url\": \"/menumanage/secondmenus/\", \"onshow\": true, \"comment\": null, \"firstmenu\": 3}','',8,NULL),(15,'192.168.132.1','2017-08-17 06:17:36','add','\"\"','{\"id\": 1, \"name\": \"OM\", \"comment\": \"运维组\"}','',1,NULL),(16,'192.168.132.1','2017-08-17 06:17:58','add','\"\"','{\"id\": 2, \"name\": \"DEV\", \"comment\": \"开发组\"}','',1,NULL),(17,'192.168.132.1','2017-08-17 06:18:56','add','\"\"','{\"id\": 1, \"name\": \"沙瑞金\", \"password\": \"e10adc3949ba59abbe56e057f20f883e\", \"sex\": \"男\", \"position\": null, \"telno\": \"15802612754\", \"comment\": \"staff\", \"group\": 1}','',2,NULL),(18,'192.168.132.1','2017-08-17 06:19:18','add','\"\"','{\"id\": 2, \"name\": \"李达康\", \"password\": \"e10adc3949ba59abbe56e057f20f883e\", \"sex\": \"男\", \"position\": null, \"telno\": \"15802612754\", \"comment\": \"staff\", \"group\": 1}','',2,NULL),(19,'192.168.132.1','2017-08-17 06:20:10','add','\"\"','{\"id\": 3, \"name\": \"孙连成\", \"password\": \"e10adc3949ba59abbe56e057f20f883e\", \"sex\": \"男\", \"position\": null, \"telno\": \"15802612754\", \"comment\": \"staff\", \"group\": 1}','',2,NULL),(20,'192.168.132.1','2017-08-17 06:20:43','add','\"\"','{\"id\": 4, \"name\": \"特朗普\", \"password\": \"e10adc3949ba59abbe56e057f20f883e\", \"sex\": \"男\", \"position\": null, \"telno\": \"15802612754\", \"comment\": \"staff\", \"group\": 2}','',2,NULL),(21,'192.168.132.1','2017-08-17 06:22:25','add','\"\"','{\"id\": 1, \"name\": \"超级管理员\", \"comment\": \"拥有所有权限\"}','',3,NULL),(22,'192.168.132.1','2017-08-17 06:22:51','add','\"\"','{\"id\": 2, \"name\": \"运维\", \"comment\": \"运维角色\"}','',3,NULL),(23,'192.168.132.1','2017-08-17 06:27:15','add','\"\"','{\"id\": 1, \"staff\": 1, \"secondmenu\": 6, \"permission\": \"1111\", \"comment\": \"沙瑞金拥有用户权限模块的读、写、修改、删除权限\"}','',6,NULL),(24,'192.168.132.1','2017-08-17 06:32:20','login','\"\"','\"\"','用户登入',NULL,1),(25,'192.168.132.1','2017-08-17 07:10:21','add','\"\"','{\"id\": 1, \"role\": 2, \"secondmenu\": 3, \"permission\": \"1000\", \"comment\": \"运维角色查看\"}','',4,1),(26,'192.168.132.1','2017-08-17 07:13:37','add','\"\"','{\"id\": 1, \"staff\": 1, \"role\": 2, \"comment\": \"沙瑞金运维角色\"}','',5,1),(27,'192.168.132.1','2017-08-17 07:37:18','add','\"\"','{\"id\": 2, \"role\": 2, \"secondmenu\": 3, \"permission\": \"1010\", \"comment\": \"运维角色查看、修改权限\"}','',4,1),(28,'192.168.132.1','2017-08-17 07:37:45','delete','{\"id\": 2, \"role\": 2, \"secondmenu\": 3, \"permission\": \"1010\", \"comment\": \"运维角色查看、修改权限\"}','\"\"','大哥，子菜单栏中没有对应的链接/userpermission/rolepermissionmodify/，请喊管理员到子菜单栏中添加该链接，谢谢大哥！',NULL,1),(29,'192.168.132.1','2017-08-17 07:37:53','modify','{\"id\": 1, \"role\": 2, \"secondmenu\": 3, \"permission\": \"1000\", \"comment\": \"运维角色查看\"}','{\"id\": 1, \"role\": 2, \"secondmenu\": 3, \"permission\": \"1010\", \"comment\": \"运维角色查看、修改权限\"}','大哥，子菜单栏中没有对应的链接/userpermission/rolepermissionmodify/，请喊管理员到子菜单栏中添加该链接，谢谢大哥！',NULL,1),(30,'192.168.132.1','2017-08-17 08:59:04','modify','{\"id\": 1, \"role\": 2, \"secondmenu\": 3, \"permission\": \"1010\", \"comment\": \"运维角色查看、修改权限\"}','{\"id\": 1, \"role\": 2, \"secondmenu\": 3, \"permission\": \"1010\", \"comment\": \"运维角色查看、修改角色管理权限\"}','大哥，子菜单栏中没有对应的链接/userpermission/rolepermissionmodify/，请喊管理员到子菜单栏中添加该链接，谢谢大哥！',NULL,1),(31,'192.168.132.1','2017-08-17 08:59:31','modify','{\"id\": 2, \"name\": \"运维\", \"comment\": \"运维角色\"}','{\"id\": 2, \"name\": \"运维\", \"comment\": \"运维角色test\"}','大哥，子菜单栏中没有对应的链接/userpermission/rolemodify/，请喊管理员到子菜单栏中添加该链接，谢谢大哥！',NULL,1),(32,'192.168.132.1','2017-08-17 08:59:36','modify','{\"id\": 2, \"name\": \"运维\", \"comment\": \"运维角色test\"}','{\"id\": 2, \"name\": \"运维\", \"comment\": \"运维角色\"}','大哥，子菜单栏中没有对应的链接/userpermission/rolemodify/，请喊管理员到子菜单栏中添加该链接，谢谢大哥！',NULL,1),(33,'192.168.132.1','2017-08-17 09:06:59','add','\"\"','{\"id\": 2, \"staff\": 2, \"role\": 1, \"comment\": \"李达康的超级管理员权限\"}','',5,1),(34,'192.168.132.1','2017-08-17 09:17:52','login','\"\"','\"\"','用户登入',NULL,2),(35,'192.168.132.1','2017-08-17 09:33:50','login','\"\"','\"\"','用户登入',NULL,1),(36,'192.168.132.1','2017-08-17 09:39:46','add','\"\"','{\"id\": 9, \"name\": \"操作日志查看\", \"url\": \"/operaterecord/operaterecords/\", \"onshow\": true, \"comment\": null, \"firstmenu\": 4}','',8,2),(37,'192.168.132.1','2017-08-18 00:48:13','login','\"\"','\"\"','用户登入',NULL,2),(38,'192.168.132.1','2017-08-18 02:10:31','modify','{\"id\": 2, \"name\": \"用户\", \"url\": \"/userpermission/staffs/\", \"onshow\": true, \"comment\": null, \"firstmenu\": 7}','{\"id\": 2, \"name\": \"用户管理\", \"url\": \"/userpermission/staffs/\", \"onshow\": true, \"comment\": null, \"firstmenu\": 7}','大哥，子菜单栏中没有对应的链接/menumanage/secondmenumodify/，请喊管理员到子菜单栏中添加该链接，谢谢大哥！',NULL,2),(39,'192.168.132.1','2017-08-18 02:17:16','add','\"\"','{\"id\": 10, \"name\": \"值班交接文档管理\", \"url\": \"/dailymanage/dutysheets/\", \"onshow\": false, \"comment\": null, \"firstmenu\": 1}','',8,2),(40,'192.168.132.1','2017-08-18 02:19:37','add','\"\"','{\"id\": 11, \"name\": \"支付主机管理\", \"url\": \"/thirdmanage/payhosts/\", \"onshow\": false, \"comment\": null, \"firstmenu\": 6}','',8,2),(41,'192.168.132.1','2017-08-18 02:20:01','add','\"\"','{\"id\": 12, \"name\": \"支付域名管理\", \"url\": \"/thirdmanage/paydnses/\", \"onshow\": false, \"comment\": null, \"firstmenu\": 6}','',8,2),(42,'192.168.132.1','2017-08-18 02:21:08','add','\"\"','{\"id\": 13, \"name\": \"项目管理\", \"url\": \"/servermanage/projects/\", \"onshow\": false, \"comment\": null, \"firstmenu\": 5}','',8,2),(43,'192.168.132.1','2017-08-18 02:21:26','add','\"\"','{\"id\": 14, \"name\": \"IDC管理\", \"url\": \"/servermanage/idcs/\", \"onshow\": false, \"comment\": null, \"firstmenu\": 5}','',8,2),(44,'192.168.132.1','2017-08-18 02:21:42','add','\"\"','{\"id\": 15, \"name\": \"服务器管理\", \"url\": \"/servermanage/servers/\", \"onshow\": false, \"comment\": null, \"firstmenu\": 5}','',8,2),(45,'192.168.132.1','2017-08-18 02:22:01','add','\"\"','{\"id\": 16, \"name\": \"服务管理\", \"url\": \"/servermanage/services/\", \"onshow\": false, \"comment\": null, \"firstmenu\": 5}','',8,2),(46,'192.168.132.1','2017-08-18 02:25:36','add','\"\"','{\"id\": 17, \"name\": \"用户设备分析\", \"url\": \"/loganalysis/agents/\", \"onshow\": false, \"comment\": null, \"firstmenu\": 2}','',8,2),(47,'192.168.132.1','2017-08-18 02:25:55','add','\"\"','{\"id\": 18, \"name\": \"用户地区分析\", \"url\": \"/loganalysis/areas/\", \"onshow\": false, \"comment\": null, \"firstmenu\": 2}','',8,2),(48,'192.168.132.1','2017-08-18 02:26:46','add','\"\"','{\"id\": 19, \"name\": \"CDN响应节点分析\", \"url\": \"/loganalysis/cdns/\", \"onshow\": false, \"comment\": null, \"firstmenu\": 2}','',8,2),(49,'192.168.132.1','2017-08-18 02:27:11','add','\"\"','{\"id\": 20, \"name\": \"用户访问域名分析\", \"url\": \"/loganalysis/domainnames/\", \"onshow\": false, \"comment\": null, \"firstmenu\": 2}','',8,2),(50,'192.168.132.1','2017-08-18 02:27:32','add','\"\"','{\"id\": 21, \"name\": \"用户访问状态分析\", \"url\": \"/loganalysis/statuses/\", \"onshow\": false, \"comment\": null, \"firstmenu\": 2}','',8,2),(51,'192.168.132.1','2017-08-18 02:27:55','add','\"\"','{\"id\": 22, \"name\": \"Nginx后端转发分析\", \"url\": \"/loganalysis/upstreams/\", \"onshow\": false, \"comment\": null, \"firstmenu\": 2}','',8,2),(52,'192.168.132.1','2017-08-21 01:09:05','modify','{\"id\": 4, \"name\": \"特朗普\", \"password\": \"e10adc3949ba59abbe56e057f20f883e\", \"sex\": \"男\", \"position\": null, \"telno\": \"15802612754\", \"comment\": \"staff\", \"group\": 2}','{\"id\": 4, \"name\": \"特朗普\", \"password\": \"db685e92faa720131f74e1bb9a21bfae\", \"sex\": \"男\", \"position\": null, \"telno\": \"15802612754\", \"comment\": \"staff\", \"group\": 2}','操作链接为：/userpermission/staffmodify/',NULL,2),(53,'192.168.132.1','2017-08-21 01:15:26','modify','{\"id\": 4, \"name\": \"特朗普\", \"password\": \"db685e92faa720131f74e1bb9a21bfae\", \"sex\": \"男\", \"position\": null, \"telno\": \"15802612754\", \"comment\": \"staff\", \"group\": 2}','{\"id\": 4, \"name\": \"特朗普\", \"password\": \"e10adc3949ba59abbe56e057f20f883e\", \"sex\": \"男\", \"position\": null, \"telno\": \"15802612754\", \"comment\": \"staff\", \"group\": 2}','操作链接为：/userpermission/staffmodify/',NULL,2),(54,'192.168.132.1','2017-08-21 01:16:06','modify','{\"id\": 4, \"name\": \"特朗普\", \"password\": \"e10adc3949ba59abbe56e057f20f883e\", \"sex\": \"男\", \"position\": null, \"telno\": \"15802612754\", \"comment\": \"staff\", \"group\": 2}','{\"id\": 4, \"name\": \"特朗普\", \"password\": \"ce7ffaae4ca3fd7c1415c25250f130c3\", \"sex\": \"男\", \"position\": null, \"telno\": \"15802612754\", \"comment\": \"staff\", \"group\": 2}','操作链接为：/userpermission/staffmodify/',NULL,2),(55,'192.168.132.1','2017-08-21 01:57:07','modify','{\"id\": 4, \"name\": \"特朗普\", \"password\": \"ce7ffaae4ca3fd7c1415c25250f130c3\", \"sex\": \"男\", \"position\": null, \"telno\": \"15802612754\", \"comment\": \"staff\", \"group\": 2}','{\"id\": 4, \"name\": \"特朗普\", \"password\": \"e10adc3949ba59abbe56e057f20f883e\", \"sex\": \"男\", \"position\": null, \"telno\": \"15802612754\", \"comment\": \"staff\", \"group\": 2}','操作链接为：/userpermission/staffmodify/',NULL,2),(56,'192.168.132.1','2017-08-22 09:15:34','login','\"\"','\"\"','用户登入',NULL,2),(57,'192.168.132.1','2017-08-22 09:21:42','login','\"\"','\"\"','用户登入',NULL,2),(58,'192.168.132.1','2017-08-22 09:45:33','login','\"\"','\"\"','用户登入',NULL,2),(59,'192.168.132.1','2017-08-22 09:45:56','login','\"\"','\"\"','用户登入',NULL,2),(60,'192.168.132.1','2017-08-22 09:46:59','login','\"\"','\"\"','用户登入',NULL,2),(61,'192.168.132.1','2017-08-22 09:48:36','login','\"\"','\"\"','用户登入',NULL,2),(62,'192.168.132.130','2017-08-22 09:54:43','login','\"\"','\"\"','用户登入',NULL,2),(63,'192.168.132.130','2017-08-22 09:57:02','login','\"\"','\"\"','用户登入',NULL,2),(64,'192.168.132.130','2017-08-23 00:50:54','login','\"\"','\"\"','用户登入',NULL,2),(65,'192.168.132.1','2017-08-28 02:13:47','login','\"\"','\"\"','用户登入',NULL,2),(66,'192.168.132.1','2017-08-28 02:17:14','add','\"\"','{\"id\": 8, \"name\": \"巡检管理\", \"iconclass\": \"\", \"comment\": \"包括服务器巡检\"}','',7,2),(67,'192.168.132.1','2017-08-28 02:18:59','add','\"\"','{\"id\": 23, \"name\": \"服务器巡检\", \"url\": \"/inspectionmanage/serverinspections/\", \"onshow\": true, \"comment\": null, \"firstmenu\": 8}','',8,2),(68,'192.168.132.1','2017-08-28 02:36:52','add','\"\"','{\"id\": 1, \"name\": \"阿里云\", \"location\": \"杭州\", \"telephone\": \"\", \"comment\": null, \"staff\": 1}','',14,2),(69,'192.168.132.1','2017-08-28 02:36:58','add','\"\"','{\"id\": 1, \"name\": \"Meteor server\", \"sn\": null, \"cpu\": \"2.4\", \"mem\": null, \"disktype\": null, \"diskcapacity\": null, \"nic\": null, \"expiredate\": \"2017-08-28 10:36:47\", \"privateip\": \"192.168.33.29\", \"publicip\": null, \"comment\": null, \"idc\": 1, \"staff\": 1}','',15,2),(70,'192.168.132.1','2017-08-28 02:37:32','add','\"\"','{\"id\": 1, \"cpu\": \"2.4\", \"mem\": \"\", \"diskroot\": \"\", \"diskhome\": \"\", \"port\": \"80\", \"comment\": \"\", \"server\": 1}','',23,2),(71,'192.168.132.1','2017-08-29 08:30:14','login','\"\"','\"\"','用户登入',NULL,2),(72,'192.168.132.1','2017-08-29 08:33:00','login','\"\"','\"\"','用户登入',NULL,2),(73,'192.168.132.1','2017-08-29 08:33:08','login','\"\"','\"\"','用户登入',NULL,1),(74,'192.168.132.1','2017-08-29 08:33:10','login','\"\"','\"\"','用户登入',NULL,1),(75,'192.168.132.1','2017-08-29 08:34:19','login','\"\"','\"\"','用户登入',NULL,1),(76,'192.168.132.1','2017-08-29 08:39:04','add','\"\"','{\"id\": 5, \"name\": \"隔壁老王\", \"password\": \"e10adc3949ba59abbe56e057f20f883e\", \"sex\": \"男\", \"position\": null, \"telno\": null, \"comment\": null, \"group\": 1}','',2,2),(77,'192.168.132.1','2017-08-29 08:39:45','add','\"\"','{\"id\": 6, \"name\": \"扫地大佬\", \"password\": \"e10adc3949ba59abbe56e057f20f883e\", \"sex\": \"男\", \"position\": null, \"telno\": null, \"comment\": null, \"group\": 1}','',2,2),(78,'192.168.132.1','2017-08-29 08:40:50','add','\"\"','{\"id\": 3, \"staff\": 5, \"role\": 1, \"comment\": null}','',5,2),(79,'192.168.132.1','2017-08-29 08:40:57','add','\"\"','{\"id\": 4, \"staff\": 6, \"role\": 1, \"comment\": null}','',5,2),(80,'192.168.132.1','2017-08-29 08:41:27','login','\"\"','\"\"','用户登入',NULL,5),(81,'192.168.132.1','2017-08-29 08:41:42','login','\"\"','\"\"','用户登入',NULL,6),(82,'192.168.132.1','2017-08-29 08:43:59','login','\"\"','\"\"','用户登入',NULL,2),(83,'192.168.132.1','2017-08-29 08:45:54','login','\"\"','\"\"','用户登入',NULL,2),(84,'192.168.132.1','2017-08-29 08:45:57','login','\"\"','\"\"','用户登入',NULL,6),(85,'192.168.132.1','2017-08-29 08:49:16','add','\"\"','{\"id\": 7, \"name\": \"jeff\", \"password\": \"e10adc3949ba59abbe56e057f20f883e\", \"sex\": \"男\", \"position\": null, \"telno\": null, \"comment\": null, \"group\": 1}','',2,6),(86,'192.168.132.1','2017-08-29 08:50:13','add','\"\"','{\"id\": 5, \"staff\": 7, \"role\": 1, \"comment\": null}','',5,6),(87,'192.168.132.1','2017-08-29 08:50:27','login','\"\"','\"\"','用户登入',NULL,7),(88,'192.168.132.1','2017-08-30 05:42:35','login','\"\"','\"\"','用户登入',NULL,2),(89,'192.168.132.1','2017-08-30 06:14:48','login','\"\"','\"\"','用户登入',NULL,2),(90,'192.168.132.1','2017-08-30 07:19:53','login','\"\"','\"\"','用户登入',NULL,2),(91,'192.168.132.1','2017-08-30 07:21:14','login','\"\"','\"\"','用户登入',NULL,2),(92,'192.168.132.1','2017-08-30 09:51:04','login','\"\"','\"\"','用户登入',NULL,2),(93,'192.168.132.1','2017-08-31 06:48:19','login','\"\"','\"\"','用户登入',NULL,2),(94,'192.168.132.1','2017-08-31 06:54:30','login','\"\"','\"\"','用户登入',NULL,2),(95,'192.168.132.1','2017-08-31 08:01:43','login','\"\"','\"\"','用户登入',NULL,2),(96,'192.168.132.1','2017-08-31 08:26:23','login','\"\"','\"\"','用户登入',NULL,2),(97,'192.168.132.1','2017-08-31 08:33:26','login','\"\"','\"\"','用户登入',NULL,1),(98,'192.168.132.1','2017-08-31 08:35:18','login','\"\"','\"\"','用户登入',NULL,1),(99,'192.168.132.1','2017-08-31 08:35:45','login','\"\"','\"\"','用户登入',NULL,2),(100,'192.168.132.1','2017-08-31 09:11:28','login','\"\"','\"\"','用户登入',NULL,1),(101,'192.168.132.1','2017-08-31 09:16:10','login','\"\"','\"\"','用户登入',NULL,1),(102,'192.168.132.1','2017-08-31 09:53:42','login','\"\"','\"\"','用户登入',NULL,2),(103,'192.168.132.1','2017-08-31 09:57:59','login','\"\"','\"\"','用户登入',NULL,1),(104,'192.168.132.1','2017-08-31 09:59:30','login','\"\"','\"\"','用户登入',NULL,1),(105,'192.168.132.1','2017-09-01 01:01:16','login','\"\"','\"\"','用户登入',NULL,2),(106,'192.168.132.1','2017-09-01 01:02:47','login','\"\"','\"\"','用户登入',NULL,2),(107,'192.168.132.1','2017-09-01 02:33:49','login','\"\"','\"\"','用户登入',NULL,1),(108,'192.168.132.1','2017-09-01 02:35:45','login','\"\"','\"\"','用户登入',NULL,1),(109,'192.168.132.1','2017-09-01 02:39:06','login','\"\"','\"\"','用户登入',NULL,1),(110,'192.168.132.1','2017-09-01 02:39:21','login','\"\"','\"\"','用户登入',NULL,1),(111,'192.168.132.1','2017-09-01 02:44:17','login','\"\"','\"\"','用户登入',NULL,1),(112,'192.168.132.1','2017-09-01 03:28:06','login','\"\"','\"\"','用户登入',NULL,1),(113,'192.168.132.1','2017-09-01 03:30:56','login','\"\"','\"\"','用户登入',NULL,2),(114,'192.168.132.1','2017-09-02 01:39:26','login','\"\"','\"\"','用户登入',NULL,1),(115,'192.168.132.1','2017-09-02 01:42:42','login','\"\"','\"\"','用户登入',NULL,1),(116,'192.168.132.1','2017-09-02 01:43:16','login','\"\"','\"\"','用户登入',NULL,1),(117,'192.168.132.1','2017-09-02 01:47:51','login','\"\"','\"\"','用户登入',NULL,1),(118,'192.168.132.1','2017-09-02 01:49:30','login','\"\"','\"\"','用户登入',NULL,1),(119,'192.168.132.1','2017-09-02 01:49:54','login','\"\"','\"\"','用户登入',NULL,1),(120,'192.168.132.1','2017-09-02 01:51:33','login','\"\"','\"\"','用户登入',NULL,1),(121,'192.168.132.1','2017-09-02 01:52:05','login','\"\"','\"\"','用户登入',NULL,1),(122,'192.168.132.1','2017-09-02 01:52:33','login','\"\"','\"\"','用户登入',NULL,1),(123,'192.168.132.1','2017-09-02 01:52:54','login','\"\"','\"\"','用户登入',NULL,1),(124,'192.168.132.1','2017-09-02 01:55:02','login','\"\"','\"\"','用户登入',NULL,1),(125,'192.168.132.1','2017-09-02 01:56:07','login','\"\"','\"\"','用户登入',NULL,2),(126,'192.168.132.1','2017-09-02 01:57:04','login','\"\"','\"\"','用户登入',NULL,1),(127,'192.168.132.1','2017-09-02 01:59:05','login','\"\"','\"\"','用户登入',NULL,2),(128,'192.168.132.1','2017-09-02 02:01:02','login','\"\"','\"\"','用户登入',NULL,1),(129,'192.168.132.1','2017-09-02 02:02:36','login','\"\"','\"\"','用户登入',NULL,2),(130,'192.168.132.1','2017-09-02 02:29:43','login','\"\"','\"\"','用户登入',NULL,1),(131,'192.168.132.1','2017-09-02 05:31:52','login','\"\"','\"\"','用户登入',NULL,1),(132,'192.168.132.1','2017-09-02 06:04:39','login','\"\"','\"\"','用户登入',NULL,1),(133,'192.168.132.1','2017-09-02 06:05:20','login','\"\"','\"\"','用户登入',NULL,2),(134,'192.168.132.1','2017-09-02 06:28:11','login','\"\"','\"\"','用户登入',NULL,1),(135,'192.168.132.1','2017-09-04 02:34:09','login','\"\"','\"\"','用户登入',NULL,2),(136,'192.168.132.1','2017-09-04 02:34:26','login','\"\"','\"\"','用户登入',NULL,1),(137,'192.168.132.1','2017-09-04 03:02:15','login','\"\"','\"\"','用户登入',NULL,2),(138,'192.168.132.1','2017-09-04 03:08:33','login','\"\"','\"\"','用户登入',NULL,2),(139,'192.168.132.1','2017-09-04 05:48:20','login','\"\"','\"\"','用户登入',NULL,2),(140,'192.168.132.1','2017-09-04 05:57:00','login','\"\"','\"\"','用户登入',NULL,1),(141,'192.168.132.1','2017-09-04 05:58:56','login','\"\"','\"\"','用户登入',NULL,2),(142,'192.168.132.1','2017-09-04 07:34:13','login','\"\"','\"\"','用户登入',NULL,2),(143,'192.168.132.1','2017-09-05 02:32:07','login','\"\"','\"\"','用户登入',NULL,1),(144,'192.168.132.1','2017-09-05 05:18:27','login','\"\"','\"\"','用户登入',NULL,1),(145,'192.168.132.1','2017-09-05 05:19:03','login','\"\"','\"\"','用户登入',NULL,2),(146,'192.168.132.1','2017-09-06 02:47:53','login','\"\"','\"\"','用户登入',NULL,2),(147,'192.168.132.1','2017-09-06 03:46:26','add','\"\"','{\"id\": 8, \"name\": \"fszzz\", \"password\": \"e10adc3949ba59abbe56e057f20f883e\", \"sex\": \"男\", \"position\": null, \"telno\": null, \"comment\": null, \"group\": 1}','',2,2),(148,'192.168.132.1','2017-09-06 03:50:30','add','\"\"','{\"id\": 9, \"name\": \"itimor\", \"password\": \"e10adc3949ba59abbe56e057f20f883e\", \"sex\": \"男\", \"position\": null, \"telno\": null, \"comment\": null, \"group\": 1}','',2,2),(149,'192.168.132.1','2017-09-06 06:32:17','login','\"\"','\"\"','用户登入',NULL,1),(150,'192.168.132.1','2017-09-06 07:29:18','login','\"\"','\"\"','用户登入',NULL,9),(151,'192.168.132.1','2017-09-06 07:29:32','login','\"\"','\"\"','用户登入',NULL,9),(152,'192.168.132.1','2017-09-06 07:31:06','login','\"\"','\"\"','用户登入',NULL,9),(153,'192.168.132.1','2017-09-06 07:31:48','login','\"\"','\"\"','用户登入',NULL,9),(154,'192.168.132.1','2017-09-06 07:34:52','login','\"\"','\"\"','用户登入',NULL,2),(155,'192.168.132.1','2017-09-06 07:35:38','login','\"\"','\"\"','用户登入',NULL,9),(156,'192.168.132.1','2017-09-06 07:37:07','login','\"\"','\"\"','用户登入',NULL,9),(157,'192.168.132.1','2017-09-06 07:40:37','login','\"\"','\"\"','用户登入',NULL,9),(158,'192.168.132.1','2017-09-06 07:41:19','login','\"\"','\"\"','用户登入',NULL,9),(159,'192.168.132.1','2017-09-06 08:09:50','login','\"\"','\"\"','用户登入',NULL,9),(160,'192.168.132.1','2017-09-06 08:10:53','login','\"\"','\"\"','用户登入',NULL,9),(161,'192.168.132.1','2017-09-06 08:11:30','login','\"\"','\"\"','用户登入',NULL,9),(162,'192.168.132.1','2017-09-06 08:32:13','login','\"\"','\"\"','用户登入',NULL,9),(163,'192.168.132.1','2017-09-06 08:43:12','login','\"\"','\"\"','用户登入',NULL,9),(164,'192.168.132.1','2017-09-06 08:44:50','login','\"\"','\"\"','用户登入',NULL,9),(165,'192.168.132.1','2017-09-06 08:52:24','login','\"\"','\"\"','用户登入',NULL,9),(166,'192.168.132.1','2017-09-06 08:53:17','login','\"\"','\"\"','用户登入',NULL,9),(167,'192.168.132.1','2017-09-06 08:55:15','login','\"\"','\"\"','用户登入',NULL,9),(168,'192.168.132.1','2017-09-06 08:56:18','login','\"\"','\"\"','用户登入',NULL,9),(169,'192.168.132.1','2017-09-06 08:56:58','login','\"\"','\"\"','用户登入',NULL,9),(170,'192.168.132.1','2017-09-06 08:57:25','login','\"\"','\"\"','用户登入',NULL,9),(171,'192.168.132.1','2017-09-06 08:58:04','login','\"\"','\"\"','用户登入',NULL,9),(172,'192.168.132.1','2017-09-06 08:58:36','login','\"\"','\"\"','用户登入',NULL,9),(173,'192.168.132.1','2017-09-06 08:58:58','login','\"\"','\"\"','用户登入',NULL,9),(174,'192.168.132.1','2017-09-06 08:59:48','login','\"\"','\"\"','用户登入',NULL,9),(175,'192.168.132.1','2017-09-06 09:01:53','login','\"\"','\"\"','用户登入',NULL,9),(176,'192.168.132.1','2017-09-06 09:01:56','login','\"\"','\"\"','用户登入',NULL,9),(177,'192.168.132.1','2017-09-06 09:02:13','login','\"\"','\"\"','用户登入',NULL,9),(178,'192.168.132.1','2017-09-06 09:03:25','login','\"\"','\"\"','用户登入',NULL,9),(179,'192.168.132.1','2017-09-06 09:04:07','login','\"\"','\"\"','用户登入',NULL,9),(180,'192.168.132.1','2017-09-06 09:04:31','login','\"\"','\"\"','用户登入',NULL,9),(181,'192.168.132.1','2017-09-06 09:05:19','login','\"\"','\"\"','用户登入',NULL,9),(182,'192.168.132.1','2017-09-06 09:07:02','login','\"\"','\"\"','用户登入',NULL,9),(183,'192.168.132.1','2017-09-06 09:08:27','login','\"\"','\"\"','用户登入',NULL,9),(184,'192.168.132.1','2017-09-06 09:08:47','login','\"\"','\"\"','用户登入',NULL,9),(185,'192.168.132.1','2017-09-06 09:12:09','login','\"\"','\"\"','用户登入',NULL,9),(186,'192.168.132.1','2017-09-06 09:14:04','login','\"\"','\"\"','用户登入',NULL,9),(187,'192.168.132.1','2017-09-06 09:15:28','login','\"\"','\"\"','用户登入',NULL,9),(188,'192.168.132.1','2017-09-06 09:18:14','login','\"\"','\"\"','用户登入',NULL,9),(189,'192.168.132.1','2017-09-06 09:21:45','login','\"\"','\"\"','用户登入',NULL,9),(190,'192.168.132.1','2017-09-06 09:22:54','login','\"\"','\"\"','用户登入',NULL,9),(191,'192.168.132.1','2017-09-06 09:23:56','login','\"\"','\"\"','用户登入',NULL,9),(192,'192.168.132.1','2017-09-06 09:24:26','login','\"\"','\"\"','用户登入',NULL,9),(193,'192.168.132.1','2017-09-06 09:25:08','login','\"\"','\"\"','用户登入',NULL,9),(194,'192.168.132.1','2017-09-06 09:41:34','login','\"\"','\"\"','用户登入',NULL,2),(195,'192.168.132.1','2017-09-06 09:45:42','login','\"\"','\"\"','用户登入',NULL,9),(196,'192.168.132.1','2017-09-07 01:02:42','login','\"\"','\"\"','用户登入',NULL,9),(197,'192.168.132.1','2017-09-07 01:04:25','login','\"\"','\"\"','用户登入',NULL,9),(198,'192.168.132.1','2017-09-07 01:07:09','login','\"\"','\"\"','用户登入',NULL,9),(199,'192.168.132.1','2017-09-07 01:07:44','login','\"\"','\"\"','用户登入',NULL,9),(200,'192.168.132.1','2017-09-07 01:08:45','login','\"\"','\"\"','用户登入',NULL,9),(201,'192.168.132.1','2017-09-07 01:12:15','login','\"\"','\"\"','用户登入',NULL,9),(202,'192.168.132.1','2017-09-07 01:12:41','login','\"\"','\"\"','用户登入',NULL,2),(203,'192.168.132.1','2017-09-07 01:24:17','login','\"\"','\"\"','用户登入',NULL,1),(204,'192.168.132.1','2017-09-07 01:25:38','login','\"\"','\"\"','用户登入',NULL,2),(205,'192.168.132.1','2017-09-07 01:47:17','login','\"\"','\"\"','用户登入',NULL,9),(206,'192.168.132.1','2017-09-07 01:47:37','login','\"\"','\"\"','用户登入',NULL,2),(207,'192.168.132.1','2017-09-07 05:09:06','login','\"\"','\"\"','用户登入',NULL,1),(208,'192.168.132.1','2017-09-07 05:22:51','login','\"\"','\"\"','用户登入',NULL,1),(209,'192.168.132.1','2017-09-07 05:22:56','login','\"\"','\"\"','用户登入',NULL,1),(210,'192.168.132.1','2017-09-07 05:33:53','login','\"\"','\"\"','用户登入',NULL,1),(211,'192.168.132.1','2017-09-07 05:34:25','login','\"\"','\"\"','用户登入',NULL,1),(212,'192.168.132.1','2017-09-07 05:34:26','login','\"\"','\"\"','用户登入',NULL,1),(213,'192.168.132.1','2017-09-07 05:34:26','login','\"\"','\"\"','用户登入',NULL,1),(214,'192.168.132.1','2017-09-07 05:34:27','login','\"\"','\"\"','用户登入',NULL,1),(215,'192.168.132.1','2017-09-07 05:34:27','login','\"\"','\"\"','用户登入',NULL,1),(216,'192.168.132.1','2017-09-07 05:34:27','login','\"\"','\"\"','用户登入',NULL,1),(217,'192.168.132.1','2017-09-07 05:34:28','login','\"\"','\"\"','用户登入',NULL,1),(218,'192.168.132.1','2017-09-07 05:34:29','login','\"\"','\"\"','用户登入',NULL,1),(219,'192.168.132.1','2017-09-07 05:34:30','login','\"\"','\"\"','用户登入',NULL,1),(220,'192.168.132.1','2017-09-07 05:40:33','login','\"\"','\"\"','用户登入',NULL,1),(221,'192.168.132.1','2017-09-07 05:43:04','login','\"\"','\"\"','用户登入',NULL,1),(222,'192.168.132.1','2017-09-07 05:43:25','login','\"\"','\"\"','用户登入',NULL,2),(223,'192.168.132.1','2017-09-07 05:44:04','login','\"\"','\"\"','用户登入',NULL,2),(224,'192.168.132.1','2017-09-07 06:02:17','login','\"\"','\"\"','用户登入',NULL,1),(225,'192.168.132.1','2017-09-07 06:02:41','login','\"\"','\"\"','用户登入',NULL,2),(226,'192.168.132.1','2017-09-08 01:28:26','login','\"\"','\"\"','用户登入',NULL,2),(227,'192.168.132.1','2017-09-08 03:11:51','login','\"\"','\"\"','用户登入',NULL,2),(228,'192.168.132.1','2017-09-08 03:40:48','login','\"\"','\"\"','用户登入',NULL,2),(229,'192.168.132.1','2017-09-08 03:46:15','login','\"\"','\"\"','用户登入',NULL,9),(230,'192.168.132.1','2017-09-08 03:51:10','login','\"\"','\"\"','用户登入',NULL,9),(231,'192.168.132.1','2017-09-08 03:51:55','login','\"\"','\"\"','用户登入',NULL,2),(232,'192.168.132.1','2017-09-08 05:48:47','login','\"\"','\"\"','用户登入',NULL,2),(233,'192.168.132.1','2017-09-08 06:17:49','login','\"\"','\"\"','用户登入',NULL,2),(234,'192.168.132.1','2017-09-08 06:28:22','login','\"\"','\"\"','用户登入',NULL,9),(235,'192.168.132.1','2017-09-08 06:29:23','login','\"\"','\"\"','用户登入',NULL,2),(236,'192.168.132.1','2017-09-08 06:40:32','login','\"\"','\"\"','用户登入',NULL,2),(237,'192.168.132.1','2017-09-08 07:53:12','login','\"\"','\"\"','用户登入',NULL,2),(238,'192.168.132.1','2017-09-08 08:33:31','login','\"\"','\"\"','用户登入',NULL,9),(239,'192.168.132.1','2017-09-08 08:38:25','login','\"\"','\"\"','用户登入',NULL,2),(240,'192.168.132.1','2017-09-08 13:31:48','login','\"\"','\"\"','用户登入',NULL,9),(241,'192.168.132.1','2017-09-09 01:38:18','login','\"\"','\"\"','用户登入',NULL,2),(242,'192.168.132.1','2017-09-11 01:22:21','add','\"\"','{\"id\": 1, \"quantum\": \"e\", \"content\": \"9月11日交接，无异常\", \"date\": \"2017-09-11T09:30:00+08:00\", \"photo\": \"files/dutyImg/no-img.png\", \"deleteTag\": null, \"deleteDate\": \"2017-09-11 09:17:45\", \"staff\": 1}','',10,2),(243,'192.168.132.1','2017-09-11 01:24:11','add','\"\"','{\"id\": 2, \"quantum\": \"m\", \"content\": \"9月10日交接，异常已处理……\", \"date\": \"2017-09-10T09:30:00+08:00\", \"photo\": \"files/dutyImg/no-img.png\", \"deleteTag\": null, \"deleteDate\": \"2017-09-11 09:17:45\", \"staff\": 3}','',10,2),(244,'192.168.132.1','2017-09-11 05:10:14','login','\"\"','\"\"','用户登入',NULL,9),(245,'192.168.132.1','2017-09-11 05:11:14','login','\"\"','\"\"','用户登入',NULL,5),(246,'192.168.132.1','2017-09-11 05:12:38','add','\"\"','{\"id\": 3, \"name\": \"哒哒哒\", \"comment\": \"试试\"}','',1,5),(247,'192.168.132.1','2017-09-11 05:14:04','login','\"\"','\"\"','用户登入',NULL,2),(248,'192.168.132.1','2017-09-11 05:29:44','add','\"\"','{\"id\": 1, \"name\": \"新闻\", \"comment\": null, \"staff\": 1}','',13,2),(249,'192.168.132.1','2017-09-11 05:29:54','add','\"\"','{\"id\": 2, \"name\": \"游戏\", \"comment\": null, \"staff\": 2}','',13,2),(250,'192.168.132.1','2017-09-11 05:30:11','add','\"\"','{\"id\": 3, \"name\": \"微博\", \"comment\": null, \"staff\": 1}','',13,2),(251,'192.168.132.1','2017-09-11 05:30:37','login','\"\"','\"\"','用户登入',NULL,2),(252,'192.168.132.1','2017-09-11 05:56:59','add','\"\"','{\"id\": 1, \"name\": \"nginx\", \"tags\": null, \"comment\": null, \"project\": 1}','',16,2),(253,'192.168.132.1','2017-09-11 05:57:11','add','\"\"','{\"id\": 2, \"name\": \"tomcat\", \"tags\": null, \"comment\": null, \"project\": 2}','',16,2),(254,'192.168.132.1','2017-09-11 05:57:19','add','\"\"','{\"id\": 3, \"name\": \"nginx\", \"tags\": null, \"comment\": null, \"project\": 2}','',16,2),(255,'192.168.132.1','2017-09-11 06:06:15','add','\"\"','{\"id\": 1, \"domainname\": \"news.bbc.com\", \"ip\": \"Null\", \"comment\": \"\", \"project\": 1}','',12,2),(256,'192.168.132.1','2017-09-11 06:07:19','add','\"\"','{\"id\": 2, \"domainname\": \"joy.google.com\", \"ip\": \"Null\", \"comment\": \"\", \"project\": 2}','',12,2),(257,'192.168.132.1','2017-09-11 06:07:38','add','\"\"','{\"id\": 3, \"domainname\": \"weibo.google.com\", \"ip\": \"Null\", \"comment\": \"\", \"project\": 2}','',12,2),(258,'192.168.132.1','2017-09-11 06:38:44','login','\"\"','\"\"','用户登入',NULL,2),(259,'192.168.132.1','2017-09-11 06:41:57','delete','{\"id\": 3, \"name\": \"哒哒哒\", \"comment\": \"试试\"}','\"\"','操作链接为：/userpermission/groupmodify/',NULL,2),(260,'192.168.132.1','2017-09-11 06:44:53','add','\"\"','{\"id\": 3, \"name\": \"开发\", \"comment\": \"开发角色\"}','',3,2),(261,'192.168.132.1','2017-09-11 09:03:23','login','\"\"','\"\"','用户登入',NULL,2),(262,'192.168.132.1','2017-09-11 09:36:39','delete','{\"id\": 1, \"staff\": 1, \"secondmenu\": 6, \"permission\": \"1111\", \"comment\": \"沙瑞金拥有用户权限模块的读、写、修改、删除权限\"}','\"\"','操作链接为：/userpermission/staffpermissionmodify/',NULL,2),(263,'192.168.132.1','2017-09-12 00:29:26','login','\"\"','\"\"','用户登入',NULL,1),(264,'192.168.132.1','2017-09-12 00:30:24','login','\"\"','\"\"','用户登入',NULL,2),(265,'192.168.132.1','2017-09-12 02:12:23','login','\"\"','\"\"','用户登入',NULL,2),(266,'192.168.132.1','2017-09-12 08:01:58','delete','{\"id\": 8, \"name\": \"fszzz\", \"password\": \"e10adc3949ba59abbe56e057f20f883e\", \"sex\": \"男\", \"position\": null, \"telno\": null, \"comment\": null, \"group\": 1}','\"\"','操作链接为：/userpermission/staffmodify/',NULL,2),(267,'192.168.132.1','2017-09-12 08:12:26','add','\"\"','{\"id\": 10, \"name\": \"rose\", \"password\": \"\", \"sex\": \"男\", \"position\": \"dsad\", \"telno\": \"313514141231\", \"comment\": \"\", \"group\": 1}','',2,2),(268,'192.168.132.1','2017-09-12 08:20:59','modify','{\"id\": 10, \"name\": \"rose\", \"password\": \"\", \"sex\": \"男\", \"position\": \"dsad\", \"telno\": \"313514141231\", \"comment\": \"\", \"group\": 1}','{\"id\": 10, \"name\": \"rose\", \"password\": \"\", \"sex\": \"男\", \"position\": \"dsad\", \"telno\": \"313514141231\", \"comment\": \"\", \"group\": 2}','操作链接为：/userpermission/staffmodify/',NULL,2),(269,'192.168.132.1','2017-09-12 09:04:09','modify','{\"id\": 1, \"name\": \"日常管理\", \"iconclass\": \"\", \"comment\": \"包括值班交接文档管理和运维常见问题管理等\"}','{\"id\": 1, \"name\": \"日常管理\", \"iconclass\": \"fa fa-suitcase\", \"comment\": \"包括值班交接文档管理和运维常见问题管理等\"}','操作链接为：/menumanage/menumodify/',NULL,2),(270,'192.168.132.1','2017-09-12 09:05:02','modify','{\"id\": 2, \"name\": \"日志分析\", \"iconclass\": \"\", \"comment\": \"包括Nginx等应用的日志分析\"}','{\"id\": 2, \"name\": \"日志分析\", \"iconclass\": \"fa fa-sort\", \"comment\": \"包括Nginx等应用的日志分析\"}','操作链接为：/menumanage/menumodify/',NULL,2),(271,'192.168.132.1','2017-09-12 09:06:55','modify','{\"id\": 3, \"name\": \"菜单管理\", \"iconclass\": \"\", \"comment\": \"包括父菜单、子菜单的管理\"}','{\"id\": 3, \"name\": \"菜单管理\", \"iconclass\": \"fa fa-mobile-phone\", \"comment\": \"包括父菜单、子菜单的管理\"}','操作链接为：/menumanage/menumodify/',NULL,2),(272,'192.168.132.1','2017-09-12 09:07:41','modify','{\"id\": 4, \"name\": \"操作日志\", \"iconclass\": \"\", \"comment\": \"操作日志的查看\"}','{\"id\": 4, \"name\": \"操作日志\", \"iconclass\": \"fa fa-google-plus\", \"comment\": \"操作日志的查看\"}','操作链接为：/menumanage/menumodify/',NULL,2),(273,'192.168.132.1','2017-09-13 01:01:10','login','\"\"','\"\"','用户登入',NULL,2),(274,'192.168.132.1','2017-09-13 02:08:27','modify','{\"id\": 3, \"name\": \"菜单管理\", \"iconclass\": \"fa fa-mobile-phone\", \"comment\": \"包括父菜单、子菜单的管理\"}','{\"id\": 3, \"name\": \"菜单管理\", \"iconclass\": \"fa fa-tree\", \"comment\": \"包括父菜单、子菜单的管理\"}','操作链接为：/menumanage/menumodify/',NULL,2),(275,'192.168.132.1','2017-09-13 02:09:27','modify','{\"id\": 1, \"name\": \"日常管理\", \"iconclass\": \"fa fa-suitcase\", \"comment\": \"包括值班交接文档管理和运维常见问题管理等\"}','{\"id\": 1, \"name\": \"日常管理\", \"iconclass\": \"fa fa-book\", \"comment\": \"包括值班交接文档管理和运维常见问题管理等\"}','操作链接为：/menumanage/menumodify/',NULL,2),(276,'192.168.132.1','2017-09-13 02:11:33','modify','{\"id\": 5, \"name\": \"服务器管理\", \"iconclass\": \"\", \"comment\": \"包括项目、IDC、服务器、服务等的管理\"}','{\"id\": 5, \"name\": \"服务器管理\", \"iconclass\": \"fa fa-desktop\", \"comment\": \"包括项目、IDC、服务器、服务等的管理\"}','操作链接为：/menumanage/menumodify/',NULL,2),(277,'192.168.132.1','2017-09-13 02:12:39','modify','{\"id\": 7, \"name\": \"用户权限管理\", \"iconclass\": \"\", \"comment\": \"包括用户、组、角色、权限的管理\"}','{\"id\": 7, \"name\": \"用户权限管理\", \"iconclass\": \"fa fa-folder-open\", \"comment\": \"包括用户、组、角色、权限的管理\"}','操作链接为：/menumanage/menumodify/',NULL,2),(278,'192.168.132.1','2017-09-13 02:13:25','modify','{\"id\": 7, \"name\": \"用户权限管理\", \"iconclass\": \"fa fa-folder-open\", \"comment\": \"包括用户、组、角色、权限的管理\"}','{\"id\": 7, \"name\": \"用户权限管理\", \"iconclass\": \"fa fa-cogs\", \"comment\": \"包括用户、组、角色、权限的管理\"}','操作链接为：/menumanage/menumodify/',NULL,2),(279,'192.168.132.1','2017-09-13 02:13:49','modify','{\"id\": 7, \"name\": \"用户权限管理\", \"iconclass\": \"fa fa-cogs\", \"comment\": \"包括用户、组、角色、权限的管理\"}','{\"id\": 7, \"name\": \"用户权限管理\", \"iconclass\": \"fa fighter-jet\", \"comment\": \"包括用户、组、角色、权限的管理\"}','操作链接为：/menumanage/menumodify/',NULL,2),(280,'192.168.132.1','2017-09-13 02:14:06','modify','{\"id\": 7, \"name\": \"用户权限管理\", \"iconclass\": \"fa fighter-jet\", \"comment\": \"包括用户、组、角色、权限的管理\"}','{\"id\": 7, \"name\": \"用户权限管理\", \"iconclass\": \"fa fa-fighter-jet\", \"comment\": \"包括用户、组、角色、权限的管理\"}','操作链接为：/menumanage/menumodify/',NULL,2),(281,'192.168.132.1','2017-09-13 02:14:46','modify','{\"id\": 7, \"name\": \"用户权限管理\", \"iconclass\": \"fa fa-fighter-jet\", \"comment\": \"包括用户、组、角色、权限的管理\"}','{\"id\": 7, \"name\": \"用户权限管理\", \"iconclass\": \"fa fa-user\", \"comment\": \"包括用户、组、角色、权限的管理\"}','操作链接为：/menumanage/menumodify/',NULL,2),(282,'192.168.132.1','2017-09-13 02:15:36','modify','{\"id\": 8, \"name\": \"巡检管理\", \"iconclass\": \"\", \"comment\": \"包括服务器巡检\"}','{\"id\": 8, \"name\": \"巡检管理\", \"iconclass\": \"fa fa-fighter-jet\", \"comment\": \"包括服务器巡检\"}','操作链接为：/menumanage/menumodify/',NULL,2),(283,'192.168.132.1','2017-09-13 02:16:28','modify','{\"id\": 1, \"name\": \"日常管理\", \"iconclass\": \"fa fa-book\", \"comment\": \"包括值班交接文档管理和运维常见问题管理等\"}','{\"id\": 1, \"name\": \"日常管理\", \"iconclass\": \"fa fa-cogs\", \"comment\": \"包括值班交接文档管理和运维常见问题管理等\"}','操作链接为：/menumanage/menumodify/',NULL,2),(284,'192.168.132.1','2017-09-13 02:17:25','modify','{\"id\": 4, \"name\": \"操作日志\", \"iconclass\": \"fa fa-google-plus\", \"comment\": \"操作日志的查看\"}','{\"id\": 4, \"name\": \"操作日志\", \"iconclass\": \"fa fa-sitemap\", \"comment\": \"操作日志的查看\"}','操作链接为：/menumanage/menumodify/',NULL,2),(285,'192.168.132.1','2017-09-13 02:18:16','modify','{\"id\": 4, \"name\": \"操作日志\", \"iconclass\": \"fa fa-sitemap\", \"comment\": \"操作日志的查看\"}','{\"id\": 4, \"name\": \"操作日志\", \"iconclass\": \"fa fa-database\", \"comment\": \"操作日志的查看\"}','操作链接为：/menumanage/menumodify/',NULL,2),(286,'192.168.132.1','2017-09-13 08:44:14','modify','{\"id\": 3, \"name\": \"菜单管理\", \"iconclass\": \"fa fa-tree\", \"comment\": \"包括父菜单、子菜单的管理\"}','{\"id\": 3, \"name\": \"菜单管理\", \"iconclass\": \"fa fa-tree\", \"comment\": \"包括主菜单、子菜单的管理\"}','操作链接为：/menumanage/menumodify/',NULL,2),(287,'192.168.132.1','2017-09-13 08:45:33','modify','{\"id\": 7, \"name\": \"父菜单管理\", \"url\": \"/menumanage/menus/\", \"onshow\": true, \"comment\": null, \"firstmenu\": 3}','{\"id\": 7, \"name\": \"主菜单管理\", \"url\": \"/menumanage/menus/\", \"onshow\": true, \"comment\": null, \"firstmenu\": 3}','操作链接为：/menumanage/secondmenumodify/',NULL,2),(288,'192.168.132.1','2017-09-13 08:46:31','modify','{\"id\": 8, \"name\": \"子单管理\", \"url\": \"/menumanage/secondmenus/\", \"onshow\": true, \"comment\": null, \"firstmenu\": 3}','{\"id\": 8, \"name\": \"子菜单管理\", \"url\": \"/menumanage/secondmenus/\", \"onshow\": true, \"comment\": null, \"firstmenu\": 3}','操作链接为：/menumanage/secondmenumodify/',NULL,2),(289,'192.168.132.1','2017-09-14 06:17:16','login','\"\"','\"\"','用户登入',NULL,2),(290,'192.168.132.1','2017-09-14 06:20:16','login','\"\"','\"\"','用户登入',NULL,2),(291,'192.168.132.1','2017-09-14 06:42:09','login','\"\"','\"\"','用户登入',NULL,2),(292,'192.168.132.1','2017-09-14 07:45:17','login','\"\"','\"\"','用户登入',NULL,2),(293,'192.168.132.1','2017-09-14 07:56:03','login','\"\"','\"\"','用户登入',NULL,2),(294,'192.168.132.1','2017-09-15 05:21:00','login','\"\"','\"\"','用户登入',NULL,2),(295,'192.168.132.1','2017-09-15 05:22:16','login','\"\"','\"\"','用户登入',NULL,2),(296,'192.168.132.1','2017-09-15 05:24:38','login','\"\"','\"\"','用户登入',NULL,2),(297,'192.168.132.1','2017-09-15 05:25:53','login','\"\"','\"\"','用户登入',NULL,2),(298,'192.168.132.1','2017-09-15 05:30:40','login','\"\"','\"\"','用户登入',NULL,2),(299,'192.168.132.1','2017-09-15 05:33:36','login','\"\"','\"\"','用户登入',NULL,2),(300,'192.168.132.1','2017-09-15 05:35:49','login','\"\"','\"\"','用户登入',NULL,2),(301,'192.168.132.1','2017-09-15 05:36:55','login','\"\"','\"\"','用户登入',NULL,2),(302,'192.168.132.1','2017-09-15 05:37:01','login','\"\"','\"\"','用户登入',NULL,2),(303,'192.168.132.1','2017-09-15 05:37:43','login','\"\"','\"\"','用户登入',NULL,2),(304,'192.168.132.1','2017-09-15 05:38:09','login','\"\"','\"\"','用户登入',NULL,2),(305,'192.168.132.1','2017-09-15 05:38:58','login','\"\"','\"\"','用户登入',NULL,2),(306,'192.168.132.1','2017-09-15 05:45:16','login','\"\"','\"\"','用户登入',NULL,2),(307,'192.168.132.1','2017-09-15 05:47:03','login','\"\"','\"\"','用户登入',NULL,2),(308,'192.168.132.1','2017-09-15 05:56:40','login','\"\"','\"\"','用户登入',NULL,2),(309,'192.168.132.1','2017-09-15 05:56:42','login','\"\"','\"\"','用户登入',NULL,2),(310,'192.168.132.1','2017-09-15 05:57:11','login','\"\"','\"\"','用户登入',NULL,2),(311,'192.168.132.1','2017-09-15 05:58:26','login','\"\"','\"\"','用户登入',NULL,2),(312,'192.168.132.1','2017-09-15 05:58:42','login','\"\"','\"\"','用户登入',NULL,2),(313,'192.168.132.1','2017-09-15 07:05:15','login','\"\"','\"\"','用户登入',NULL,1),(314,'192.168.132.1','2017-09-15 07:09:31','login','\"\"','\"\"','用户登入',NULL,2),(315,'192.168.132.1','2017-09-15 07:09:56','login','\"\"','\"\"','用户登入',NULL,2),(316,'192.168.132.1','2017-09-15 07:19:48','login','\"\"','\"\"','用户登入',NULL,2),(317,'192.168.132.1','2017-09-15 07:24:00','login','\"\"','\"\"','用户登入',NULL,2),(318,'192.168.132.1','2017-09-15 07:36:48','login','\"\"','\"\"','用户登入',NULL,2),(319,'192.168.132.1','2017-09-15 08:09:43','login','\"\"','\"\"','用户登入',NULL,2),(320,'192.168.132.1','2017-09-15 08:10:06','login','\"\"','\"\"','用户登入',NULL,2),(321,'192.168.132.1','2017-09-15 08:17:28','login','\"\"','\"\"','用户登入',NULL,2),(322,'192.168.132.1','2017-09-18 01:10:11','login','\"\"','\"\"','用户登入',NULL,2),(323,'192.168.132.1','2017-09-18 06:44:51','login','\"\"','\"\"','用户登入',NULL,2),(324,'192.168.132.1','2017-09-18 06:45:18','login','\"\"','\"\"','用户登入',NULL,2),(325,'192.168.132.1','2017-09-18 06:47:24','login','\"\"','\"\"','用户登入',NULL,2),(326,'192.168.132.1','2017-09-18 06:47:58','login','\"\"','\"\"','用户登入',NULL,2),(327,'192.168.132.1','2017-09-18 06:52:49','login','\"\"','\"\"','用户登入',NULL,2),(328,'192.168.132.1','2017-09-19 06:29:56','add','\"\"','{\"id\": 1, \"ip\": \"1.1.1.1\", \"location\": \"Null\", \"comment\": \"\"}','',11,2),(329,'192.168.132.1','2017-09-19 06:36:49','add','\"\"','{\"id\": 2, \"ip\": \"2.2.2.2\", \"location\": \"Null\", \"comment\": \"\"}','',11,2),(330,'192.168.132.1','2017-09-19 06:37:30','add','\"\"','{\"id\": 3, \"ip\": \"3.3.3.3\", \"location\": \"Null\", \"comment\": \"\"}','',11,2),(331,'192.168.132.1','2017-09-19 07:25:37','modify','{\"id\": 1, \"ip\": \"1.1.1.1\", \"location\": \"Null\", \"comment\": \"\"}','{\"id\": 1, \"ip\": \"1.1.1.2\", \"location\": \"Null\", \"comment\": \"\"}','操作链接为：/thirdmanage/payhostmodify/',NULL,2),(332,'192.168.132.1','2017-09-20 03:25:45','add','\"\"','{\"id\": 4, \"domainname\": \"www.baidu.com\", \"ip\": \"Null\", \"comment\": \"\", \"project\": 1}','',12,2),(333,'192.168.132.1','2017-09-20 03:25:48','add','\"\"','{\"id\": 5, \"domainname\": \"www.baidu.com\", \"ip\": \"Null\", \"comment\": \"\", \"project\": 1}','',12,2),(334,'192.168.132.1','2017-09-20 03:25:49','add','\"\"','{\"id\": 6, \"domainname\": \"www.baidu.com\", \"ip\": \"Null\", \"comment\": \"\", \"project\": 1}','',12,2),(335,'192.168.132.1','2017-09-20 03:28:45','add','\"\"','{\"id\": 7, \"domainname\": \"dsad\", \"ip\": \"Null\", \"comment\": \"\", \"project\": 1}','',12,2),(336,'192.168.132.1','2017-09-20 03:30:07','add','\"\"','{\"id\": 8, \"domainname\": \"sasas\", \"ip\": \"Null\", \"comment\": \"\", \"project\": 2}','',12,2),(337,'192.168.132.1','2017-09-20 03:30:08','add','\"\"','{\"id\": 4, \"ip\": \"4.4.4.4\", \"location\": \"Null\", \"comment\": \"\"}','',11,2),(338,'192.168.132.1','2017-09-20 03:31:16','add','\"\"','{\"id\": 9, \"domainname\": \"www.ggg.com\", \"ip\": \"Null\", \"comment\": \"\", \"project\": 3}','',12,2),(339,'192.168.132.1','2017-09-20 05:13:14','add','\"\"','{\"id\": 4, \"name\": \"dad\", \"comment\": \"\", \"staff\": 2}','',13,2),(340,'192.168.132.1','2017-09-20 05:41:24','delete','{\"id\": 4, \"name\": \"dad\", \"comment\": \"\", \"staff\": 2}','\"\"','操作链接为：/servermanage/projectmodify/',NULL,2),(341,'192.168.132.1','2017-09-20 07:20:31','login','\"\"','\"\"','用户登入',NULL,2),(342,'192.168.132.1','2017-09-20 08:52:30','add','\"\"','{\"id\": 9, \"name\": \"test\", \"iconclass\": \"fa fa-desktop\", \"comment\": \"xxxxx\"}','',7,2),(343,'192.168.132.1','2017-09-20 08:54:15','add','\"\"','{\"id\": 10, \"name\": \"ttt\", \"iconclass\": \"fa fa-desktop\", \"comment\": \"xxxxx\"}','',7,2),(344,'192.168.132.1','2017-09-20 08:55:47','add','\"\"','{\"id\": 11, \"name\": \"test333\", \"iconclass\": \"fa fa-desktop\", \"comment\": \"xxxxx\"}','',7,2),(345,'192.168.132.1','2017-09-20 08:57:08','add','\"\"','{\"id\": 12, \"name\": \"ttt333\", \"iconclass\": \"fa fa-desktop\", \"comment\": \"xxxxx\"}','',7,2),(346,'192.168.132.1','2017-09-20 09:05:19','add','\"\"','{\"id\": 13, \"name\": \"xxxxx\", \"iconclass\": \"fa fa-desktop\", \"comment\": \"xxxxx\"}','',7,2),(347,'192.168.132.1','2017-09-20 09:06:15','add','\"\"','{\"id\": 14, \"name\": \"ssssss\", \"iconclass\": \"fa fa-desktop\", \"comment\": \"xxxxx\"}','',7,2),(348,'192.168.132.1','2017-09-20 09:06:55','add','\"\"','{\"id\": 15, \"name\": \"bbbbb\", \"iconclass\": \"fa fa-desktop\", \"comment\": \"xxxxx\"}','',7,2),(349,'192.168.132.1','2017-09-20 09:08:56','add','\"\"','{\"id\": 16, \"name\": \"ccccc\", \"iconclass\": \"fa fa-desktop\", \"comment\": \"xxxxx\"}','',7,2),(350,'192.168.132.1','2017-09-20 09:09:32','add','\"\"','{\"id\": 17, \"name\": \"ddddd\", \"iconclass\": \"fa fa-desktop\", \"comment\": \"xxxxx\"}','',7,2),(351,'192.168.132.1','2017-09-20 09:09:56','add','\"\"','{\"id\": 18, \"name\": \"eeeee\", \"iconclass\": \"fa fa-desktop\", \"comment\": \"xxxxx\"}','',7,2),(352,'192.168.132.1','2017-09-20 09:11:07','add','\"\"','{\"id\": 19, \"name\": \"t\", \"iconclass\": \"fa fa-desktop\", \"comment\": \"xxxxx\"}','',7,2),(353,'192.168.132.1','2017-09-20 09:11:42','add','\"\"','{\"id\": 20, \"name\": \"x\", \"iconclass\": \"fa fa-desktop\", \"comment\": \"xxxxx\"}','',7,2),(354,'192.168.132.1','2017-09-20 09:42:38','delete','{\"id\": 20, \"name\": \"x\", \"iconclass\": \"fa fa-desktop\", \"comment\": \"xxxxx\"}','\"\"','操作链接为：/menumanage/menumodify/',NULL,2),(355,'192.168.132.1','2017-09-20 09:45:46','add','\"\"','{\"id\": 21, \"name\": \"c\", \"iconclass\": \"fa fa-desktop\", \"comment\": \"xxxxx\"}','',7,2),(356,'192.168.132.1','2017-09-21 05:46:32','login','\"\"','\"\"','用户登入',NULL,2),(357,'192.168.132.1','2017-09-25 00:57:08','delete','{\"id\": 21, \"name\": \"c\", \"iconclass\": \"fa fa-desktop\", \"comment\": \"xxxxx\"}','\"\"','操作链接为：/menumanage/menumodify/',NULL,2),(358,'192.168.132.1','2017-09-25 00:57:25','delete','{\"id\": 19, \"name\": \"t\", \"iconclass\": \"fa fa-desktop\", \"comment\": \"xxxxx\"}','\"\"','操作链接为：/menumanage/menumodify/',NULL,2),(359,'192.168.132.1','2017-09-25 01:18:28','delete','{\"id\": 18, \"name\": \"eeeee\", \"iconclass\": \"fa fa-desktop\", \"comment\": \"xxxxx\"}','\"\"','操作链接为：/menumanage/menumodify/',NULL,2),(360,'192.168.132.1','2017-09-25 01:18:50','delete','{\"id\": 17, \"name\": \"ddddd\", \"iconclass\": \"fa fa-desktop\", \"comment\": \"xxxxx\"}','\"\"','操作链接为：/menumanage/menumodify/',NULL,2),(361,'192.168.132.1','2017-09-25 01:18:54','delete','{\"id\": 14, \"name\": \"ssssss\", \"iconclass\": \"fa fa-desktop\", \"comment\": \"xxxxx\"}','\"\"','操作链接为：/menumanage/menumodify/',NULL,2),(362,'192.168.132.1','2017-09-25 01:23:48','delete','{\"id\": 15, \"name\": \"bbbbb\", \"iconclass\": \"fa fa-desktop\", \"comment\": \"xxxxx\"}','\"\"','操作链接为：/menumanage/menumodify/',NULL,2),(363,'192.168.132.1','2017-09-25 01:35:26','delete','{\"id\": 12, \"name\": \"ttt333\", \"iconclass\": \"fa fa-desktop\", \"comment\": \"xxxxx\"}','\"\"','操作链接为：/menumanage/menumodify/',NULL,2),(364,'192.168.132.1','2017-09-25 01:36:08','delete','{\"id\": 11, \"name\": \"test333\", \"iconclass\": \"fa fa-desktop\", \"comment\": \"xxxxx\"}','\"\"','操作链接为：/menumanage/menumodify/',NULL,2),(365,'192.168.132.1','2017-09-25 01:37:07','delete','{\"id\": 10, \"name\": \"ttt\", \"iconclass\": \"fa fa-desktop\", \"comment\": \"xxxxx\"}','\"\"','操作链接为：/menumanage/menumodify/',NULL,2),(366,'192.168.132.1','2017-09-25 01:39:44','delete','{\"id\": 9, \"name\": \"test\", \"iconclass\": \"fa fa-desktop\", \"comment\": \"xxxxx\"}','\"\"','操作链接为：/menumanage/menumodify/',NULL,2),(367,'192.168.132.1','2017-09-25 01:40:29','delete','{\"id\": 13, \"name\": \"xxxxx\", \"iconclass\": \"fa fa-desktop\", \"comment\": \"xxxxx\"}','\"\"','操作链接为：/menumanage/menumodify/',NULL,2),(368,'192.168.132.1','2017-09-25 01:43:20','add','\"\"','{\"id\": 22, \"name\": \"xx\", \"iconclass\": \"fa fa-desktop\", \"comment\": \"\"}','',7,2),(369,'192.168.132.1','2017-09-25 01:44:10','add','\"\"','{\"id\": 23, \"name\": \"ce\", \"iconclass\": \"\", \"comment\": \"\"}','',7,2),(370,'192.168.132.1','2017-09-25 01:46:20','delete','{\"id\": 22, \"name\": \"xx\", \"iconclass\": \"fa fa-desktop\", \"comment\": \"\"}','\"\"','操作链接为：/menumanage/menumodify/',NULL,2),(371,'192.168.132.1','2017-09-25 02:02:06','add','\"\"','{\"id\": 24, \"name\": \"test\", \"iconclass\": \"\", \"comment\": \"\"}','',7,2),(372,'192.168.132.1','2017-09-25 02:02:26','delete','{\"id\": 24, \"name\": \"test\", \"iconclass\": \"\", \"comment\": \"\"}','\"\"','操作链接为：/menumanage/menumodify/',NULL,2),(373,'192.168.132.1','2017-09-25 02:02:51','delete','{\"id\": 16, \"name\": \"ccccc\", \"iconclass\": \"fa fa-desktop\", \"comment\": \"xxxxx\"}','\"\"','操作链接为：/menumanage/menumodify/',NULL,2),(374,'192.168.132.1','2017-09-25 02:02:59','add','\"\"','{\"id\": 25, \"name\": \"test\", \"iconclass\": \"\", \"comment\": \"\"}','',7,2),(375,'192.168.132.1','2017-09-25 02:03:07','add','\"\"','{\"id\": 26, \"name\": \"xxxxx\", \"iconclass\": \"\", \"comment\": \"\"}','',7,2),(376,'192.168.132.1','2017-09-25 02:03:17','add','\"\"','{\"id\": 27, \"name\": \"bbbbb\", \"iconclass\": \"\", \"comment\": \"\"}','',7,2),(377,'192.168.132.1','2017-09-25 02:03:26','delete','{\"id\": 25, \"name\": \"test\", \"iconclass\": \"\", \"comment\": \"\"}','\"\"','操作链接为：/menumanage/menumodify/',NULL,2),(378,'192.168.132.1','2017-09-25 02:03:49','delete','{\"id\": 26, \"name\": \"xxxxx\", \"iconclass\": \"\", \"comment\": \"\"}','\"\"','操作链接为：/menumanage/menumodify/',NULL,2),(379,'192.168.132.1','2017-09-25 02:04:00','delete','{\"id\": 27, \"name\": \"bbbbb\", \"iconclass\": \"\", \"comment\": \"\"}','\"\"','操作链接为：/menumanage/menumodify/',NULL,2),(380,'192.168.132.1','2017-09-25 02:04:03','delete','{\"id\": 23, \"name\": \"ce\", \"iconclass\": \"\", \"comment\": \"\"}','\"\"','操作链接为：/menumanage/menumodify/',NULL,2),(381,'192.168.132.1','2017-09-25 02:30:51','add','\"\"','{\"id\": 28, \"name\": \"test\", \"iconclass\": \"fa fa-desktop\", \"comment\": \"xxxxx\"}','',7,2),(382,'192.168.132.1','2017-09-25 02:33:24','add','\"\"','{\"id\": 29, \"name\": \"bbbbb\", \"iconclass\": \"fa fa-desktop\", \"comment\": \"xxxxx\"}','',7,2),(383,'192.168.132.1','2017-09-25 02:34:31','add','\"\"','{\"id\": 30, \"name\": \"xxxxx\", \"iconclass\": \"fa fa-desktop\", \"comment\": \"xxxxx\"}','',7,2),(384,'192.168.132.1','2017-09-25 02:35:09','add','\"\"','{\"id\": 31, \"name\": \"t\", \"iconclass\": \"\", \"comment\": \"\"}','',7,2),(385,'192.168.132.1','2017-09-25 02:35:23','delete','{\"id\": 29, \"name\": \"bbbbb\", \"iconclass\": \"fa fa-desktop\", \"comment\": \"xxxxx\"}','\"\"','操作链接为：/menumanage/menumodify/',NULL,2),(386,'192.168.132.1','2017-09-25 02:35:30','delete','{\"id\": 30, \"name\": \"xxxxx\", \"iconclass\": \"fa fa-desktop\", \"comment\": \"xxxxx\"}','\"\"','操作链接为：/menumanage/menumodify/',NULL,2),(387,'192.168.132.1','2017-09-25 02:35:33','delete','{\"id\": 28, \"name\": \"test\", \"iconclass\": \"fa fa-desktop\", \"comment\": \"xxxxx\"}','\"\"','操作链接为：/menumanage/menumodify/',NULL,2),(388,'192.168.132.1','2017-09-25 02:35:36','delete','{\"id\": 31, \"name\": \"t\", \"iconclass\": \"\", \"comment\": \"\"}','\"\"','操作链接为：/menumanage/menumodify/',NULL,2),(389,'192.168.132.1','2017-09-25 03:28:19','modify','{\"id\": 6, \"name\": \"第三方平台管理\", \"iconclass\": \"\", \"comment\": \"包括第三方api的调用\"}','{\"id\": 6, \"name\": \"第三方平台管理\", \"iconclass\": \"\", \"comment\": \"包括第三方api的调用\"}','操作链接为：/menumanage/menumodify/',NULL,2),(390,'192.168.132.1','2017-09-25 03:28:28','modify','{\"id\": 6, \"name\": \"第三方平台管理\", \"iconclass\": \"\", \"comment\": \"包括第三方api的调用\"}','{\"id\": 6, \"name\": \"第三方平台管理\", \"iconclass\": \"222\", \"comment\": \"包括第三方api的调用\"}','操作链接为：/menumanage/menumodify/',NULL,2),(391,'192.168.132.1','2017-09-25 04:53:42','modify','{\"id\": 6, \"name\": \"第三方平台管理\", \"iconclass\": \"222\", \"comment\": \"包括第三方api的调用\"}','{\"id\": 6, \"name\": \"第三方平台管理\", \"iconclass\": \"\", \"comment\": \"包括第三方api的调用\"}','操作链接为：/menumanage/menumodify/',NULL,2),(392,'192.168.132.1','2017-09-25 04:55:27','modify','{\"id\": 6, \"name\": \"第三方平台管理\", \"iconclass\": \"\", \"comment\": \"包括第三方api的调用\"}','{\"id\": 6, \"name\": \"第三方平台管理\", \"iconclass\": \"eeeee\", \"comment\": \"包括第三方api的调用\"}','操作链接为：/menumanage/menumodify/',NULL,2),(393,'192.168.132.1','2017-09-25 04:59:42','modify','{\"id\": 6, \"name\": \"第三方平台管理\", \"iconclass\": \"eeeee\", \"comment\": \"包括第三方api的调用\"}','{\"id\": 6, \"name\": \"第三方平台管理\", \"iconclass\": \"\", \"comment\": \"包括第三方api的调用\"}','操作链接为：/menumanage/menumodify/',NULL,2),(394,'192.168.132.1','2017-09-25 05:00:15','modify','{\"id\": 6, \"name\": \"第三方平台管理\", \"iconclass\": \"\", \"comment\": \"包括第三方api的调用\"}','{\"id\": 6, \"name\": \"第三方平台管理\", \"iconclass\": \"ddd\", \"comment\": \"包括第三方api的调用\"}','操作链接为：/menumanage/menumodify/',NULL,2),(395,'192.168.132.1','2017-09-25 05:07:08','modify','{\"id\": 6, \"name\": \"第三方平台管理\", \"iconclass\": \"ddd\", \"comment\": \"包括第三方api的调用\"}','{\"id\": 6, \"name\": \"第三方平台管理\", \"iconclass\": \"\", \"comment\": \"包括第三方api的调用\"}','操作链接为：/menumanage/menumodify/',NULL,2),(396,'192.168.132.1','2017-09-25 05:08:00','modify','{\"id\": 6, \"name\": \"第三方平台管理\", \"iconclass\": \"\", \"comment\": \"包括第三方api的调用\"}','{\"id\": 6, \"name\": \"第三方平台管理\", \"iconclass\": \"iii\", \"comment\": \"包括第三方api的调用\"}','操作链接为：/menumanage/menumodify/',NULL,2),(397,'192.168.132.1','2017-09-25 05:08:54','modify','{\"id\": 6, \"name\": \"第三方平台管理\", \"iconclass\": \"iii\", \"comment\": \"包括第三方api的调用\"}','{\"id\": 6, \"name\": \"第三方平台管理\", \"iconclass\": \"\", \"comment\": \"包括第三方api的调用\"}','操作链接为：/menumanage/menumodify/',NULL,2),(398,'192.168.132.1','2017-09-25 05:09:20','modify','{\"id\": 6, \"name\": \"第三方平台管理\", \"iconclass\": \"\", \"comment\": \"包括第三方api的调用\"}','{\"id\": 6, \"name\": \"第三方平台管理\", \"iconclass\": \"222\", \"comment\": \"包括第三方api的调用\"}','操作链接为：/menumanage/menumodify/',NULL,2),(399,'192.168.132.1','2017-09-25 05:09:38','modify','{\"id\": 6, \"name\": \"第三方平台管理\", \"iconclass\": \"222\", \"comment\": \"包括第三方api的调用\"}','{\"id\": 6, \"name\": \"第三方平台管理\", \"iconclass\": \"\", \"comment\": \"包括第三方api的调用\"}','操作链接为：/menumanage/menumodify/',NULL,2),(400,'192.168.132.1','2017-09-25 05:11:05','add','\"\"','{\"id\": 32, \"name\": \"bbbbb\", \"iconclass\": \"eeeee\", \"comment\": \"xxxxx\"}','',7,2),(401,'192.168.132.1','2017-09-25 05:11:12','delete','{\"id\": 32, \"name\": \"bbbbb\", \"iconclass\": \"eeeee\", \"comment\": \"xxxxx\"}','\"\"','操作链接为：/menumanage/menumodify/',NULL,2),(402,'192.168.132.1','2017-09-25 05:13:07','modify','{\"id\": 6, \"name\": \"第三方平台管理\", \"iconclass\": \"\", \"comment\": \"包括第三方api的调用\"}','{\"id\": 6, \"name\": \"第三方平台管理\", \"iconclass\": \"fa fa-cloud\", \"comment\": \"包括第三方api的调用\"}','操作链接为：/menumanage/menumodify/',NULL,2),(403,'192.168.132.1','2017-09-25 06:12:33','login','\"\"','\"\"','用户登入',NULL,1),(404,'192.168.132.1','2017-09-25 06:12:41','login','\"\"','\"\"','用户登入',NULL,2),(405,'192.168.132.1','2017-09-25 06:41:10','login','\"\"','\"\"','用户登入',NULL,2),(406,'192.168.132.1','2017-09-25 08:58:46','modify','{\"id\": 2, \"name\": \"李达康\", \"password\": \"e10adc3949ba59abbe56e057f20f883e\", \"sex\": \"男\", \"position\": null, \"telno\": \"15802612754\", \"comment\": \"staff\", \"group\": 1}','{\"id\": 2, \"name\": \"admin\", \"password\": \"e10adc3949ba59abbe56e057f20f883e\", \"sex\": \"男\", \"position\": null, \"telno\": \"15802612754\", \"comment\": \"staff\", \"group\": 1}','操作链接为：/userpermission/staffmodify/',NULL,NULL),(407,'192.168.132.1','2017-09-25 08:59:07','login','\"\"','\"\"','用户登入',NULL,2),(408,'192.168.132.1','2017-09-25 09:01:22','modify','{\"id\": 2, \"name\": \"admin\", \"password\": \"e10adc3949ba59abbe56e057f20f883e\", \"sex\": \"男\", \"position\": null, \"telno\": \"15802612754\", \"comment\": \"staff\", \"group\": 1}','{\"id\": 2, \"name\": \"admin\", \"password\": \"e10adc3949ba59abbe56e057f20f883e\", \"sex\": \"男\", \"position\": null, \"telno\": \"158026127\", \"comment\": \"staff\", \"group\": 1}','操作链接为：/userpermission/staffmodify/',NULL,2),(409,'192.168.132.1','2017-09-25 09:05:49','modify','{\"id\": 2, \"name\": \"admin\", \"password\": \"e10adc3949ba59abbe56e057f20f883e\", \"sex\": \"男\", \"position\": null, \"telno\": \"158026127\", \"comment\": \"staff\", \"group\": 1}','{\"id\": 2, \"name\": \"admin\", \"password\": \"e10adc3949ba59abbe56e057f20f883e\", \"sex\": \"男\", \"position\": null, \"telno\": \"1580261273\", \"comment\": \"staff\", \"group\": 1}','操作链接为：/userpermission/staffmodify/',NULL,2),(410,'192.168.132.1','2017-09-25 09:06:50','modify','{\"id\": 2, \"name\": \"admin\", \"password\": \"e10adc3949ba59abbe56e057f20f883e\", \"sex\": \"男\", \"position\": null, \"telno\": \"1580261273\", \"comment\": \"staff\", \"group\": 1}','{\"id\": 2, \"name\": \"admin\", \"password\": \"e10adc3949ba59abbe56e057f20f883e\", \"sex\": \"男\", \"position\": null, \"telno\": \"1580261273dd\", \"comment\": \"staff\", \"group\": 1}','操作链接为：/userpermission/staffmodify/',NULL,2),(411,'192.168.132.1','2017-09-25 09:07:02','modify','{\"id\": 2, \"name\": \"admin\", \"password\": \"e10adc3949ba59abbe56e057f20f883e\", \"sex\": \"男\", \"position\": null, \"telno\": \"1580261273dd\", \"comment\": \"staff\", \"group\": 1}','{\"id\": 2, \"name\": \"admin\", \"password\": \"e10adc3949ba59abbe56e057f20f883e\", \"sex\": \"男\", \"position\": null, \"telno\": \"1580261273\", \"comment\": \"staff\", \"group\": 1}','操作链接为：/userpermission/staffmodify/',NULL,2),(412,'192.168.132.1','2017-09-25 09:15:19','add','\"\"','{\"id\": 11, \"name\": \"test\", \"password\": null, \"sex\": \"女\", \"position\": null, \"telno\": \"\", \"comment\": \"\", \"group\": 1}','',2,2),(413,'192.168.132.1','2017-09-25 09:15:29','delete','{\"id\": 11, \"name\": \"test\", \"password\": null, \"sex\": \"女\", \"position\": null, \"telno\": \"\", \"comment\": \"\", \"group\": 1}','\"\"','操作链接为：/userpermission/staffmodify/',NULL,2),(414,'192.168.132.1','2017-09-26 02:42:24','modify','{\"id\": 1, \"name\": \"沙瑞金\", \"password\": \"e10adc3949ba59abbe56e057f20f883e\", \"sex\": \"男\", \"position\": null, \"telno\": \"15802612754\", \"comment\": \"staff\", \"group\": 1}','{\"id\": 1, \"name\": \"沙瑞金\", \"password\": \"e10adc3949ba59abbe56e057f20f883e\", \"sex\": \"男\", \"position\": null, \"telno\": \"15802612754\", \"comment\": \"staff\", \"group\": 2}','操作链接为：/userpermission/staffmodify/',NULL,2),(415,'192.168.132.1','2017-09-26 02:42:45','add','\"\"','{\"id\": 12, \"name\": \"test\", \"password\": null, \"sex\": \"男\", \"position\": null, \"telno\": \"xxx\", \"comment\": \"操作日志的查看1\", \"group\": 2}','',2,2),(416,'192.168.132.1','2017-09-26 02:43:23','modify','{\"id\": 12, \"name\": \"test\", \"password\": null, \"sex\": \"男\", \"position\": null, \"telno\": \"xxx\", \"comment\": \"操作日志的查看1\", \"group\": 2}','{\"id\": 12, \"name\": \"tests\", \"password\": null, \"sex\": \"女\", \"position\": null, \"telno\": \"=\", \"comment\": \"\", \"group\": 2}','操作链接为：/userpermission/staffmodify/',NULL,2),(417,'192.168.132.1','2017-09-26 02:43:30','modify','{\"id\": 12, \"name\": \"tests\", \"password\": null, \"sex\": \"女\", \"position\": null, \"telno\": \"=\", \"comment\": \"\", \"group\": 2}','{\"id\": 12, \"name\": \"test\", \"password\": null, \"sex\": \"男\", \"position\": null, \"telno\": \"xxx\", \"comment\": \"操作日志的查看1\", \"group\": 1}','操作链接为：/userpermission/staffmodify/',NULL,2),(418,'192.168.132.1','2017-09-26 02:45:31','modify','{\"id\": 12, \"name\": \"test\", \"password\": null, \"sex\": \"男\", \"position\": null, \"telno\": \"xxx\", \"comment\": \"操作日志的查看1\", \"group\": 1}','{\"id\": 12, \"name\": \"test\", \"password\": null, \"sex\": \"男\", \"position\": null, \"telno\": \"\", \"comment\": \"=\", \"group\": 1}','操作链接为：/userpermission/staffmodify/',NULL,2),(419,'192.168.132.1','2017-09-26 02:45:47','modify','{\"id\": 10, \"name\": \"rose\", \"password\": \"\", \"sex\": \"男\", \"position\": \"dsad\", \"telno\": \"313514141231\", \"comment\": \"\", \"group\": 2}','{\"id\": 10, \"name\": \"rose\", \"password\": \"\", \"sex\": \"男\", \"position\": \"dsad\", \"telno\": \"\", \"comment\": \"\", \"group\": 2}','操作链接为：/userpermission/staffmodify/',NULL,2),(420,'192.168.132.1','2017-09-26 02:46:16','modify','{\"id\": 10, \"name\": \"rose\", \"password\": \"\", \"sex\": \"男\", \"position\": \"dsad\", \"telno\": \"\", \"comment\": \"\", \"group\": 2}','{\"id\": 10, \"name\": \"sss\", \"password\": \"\", \"sex\": \"\", \"position\": \"dsad\", \"telno\": \"\", \"comment\": \"\", \"group\": 1}','操作链接为：/userpermission/staffmodify/',NULL,2),(421,'192.168.132.1','2017-09-26 02:46:46','modify','{\"id\": 10, \"name\": \"sss\", \"password\": \"\", \"sex\": \"\", \"position\": \"dsad\", \"telno\": \"\", \"comment\": \"\", \"group\": 1}','{\"id\": 10, \"name\": \"rose\", \"password\": \"\", \"sex\": \"\", \"position\": \"dsad\", \"telno\": \"\", \"comment\": \"\", \"group\": 2}','操作链接为：/userpermission/staffmodify/',NULL,2),(422,'192.168.132.1','2017-09-26 02:47:14','modify','{\"id\": 10, \"name\": \"rose\", \"password\": \"\", \"sex\": \"\", \"position\": \"dsad\", \"telno\": \"\", \"comment\": \"\", \"group\": 2}','{\"id\": 10, \"name\": \"rose\", \"password\": \"\", \"sex\": \"男\", \"position\": \"dsad\", \"telno\": \"\", \"comment\": \"\", \"group\": 2}','操作链接为：/userpermission/staffmodify/',NULL,2),(423,'192.168.132.1','2017-09-26 02:47:21','delete','{\"id\": 12, \"name\": \"test\", \"password\": null, \"sex\": \"男\", \"position\": null, \"telno\": \"\", \"comment\": \"=\", \"group\": 1}','\"\"','操作链接为：/userpermission/staffmodify/',NULL,2),(424,'192.168.132.1','2017-09-26 02:47:37','add','\"\"','{\"id\": 13, \"name\": \"test\", \"password\": null, \"sex\": \"女\", \"position\": null, \"telno\": \"\", \"comment\": \"\", \"group\": 1}','',2,2),(425,'192.168.132.1','2017-09-26 02:47:50','modify','{\"id\": 13, \"name\": \"test\", \"password\": null, \"sex\": \"女\", \"position\": null, \"telno\": \"\", \"comment\": \"\", \"group\": 1}','{\"id\": 13, \"name\": \"test2\", \"password\": null, \"sex\": \"女\", \"position\": null, \"telno\": \"\", \"comment\": \"\", \"group\": 1}','操作链接为：/userpermission/staffmodify/',NULL,2),(426,'192.168.132.1','2017-09-26 02:49:30','add','\"\"','{\"id\": 14, \"name\": \"test\", \"password\": null, \"sex\": \"男\", \"position\": null, \"telno\": \"\", \"comment\": \"\", \"group\": 1}','',2,2),(427,'192.168.132.1','2017-09-26 02:50:22','delete','{\"id\": 13, \"name\": \"test2\", \"password\": null, \"sex\": \"女\", \"position\": null, \"telno\": \"\", \"comment\": \"\", \"group\": 1}','\"\"','操作链接为：/userpermission/staffmodify/',NULL,2),(428,'192.168.132.1','2017-09-26 02:50:31','modify','{\"id\": 14, \"name\": \"test\", \"password\": null, \"sex\": \"男\", \"position\": null, \"telno\": \"\", \"comment\": \"\", \"group\": 1}','{\"id\": 14, \"name\": \"test555\", \"password\": null, \"sex\": \"男\", \"position\": null, \"telno\": \"\", \"comment\": \"\", \"group\": 1}','操作链接为：/userpermission/staffmodify/',NULL,2),(429,'192.168.132.1','2017-09-26 02:50:57','add','\"\"','{\"id\": 15, \"name\": \"test56\", \"password\": null, \"sex\": \"男\", \"position\": null, \"telno\": \"\", \"comment\": \"\", \"group\": 2}','',2,2),(430,'192.168.132.1','2017-09-26 02:51:38','delete','{\"id\": 15, \"name\": \"test56\", \"password\": null, \"sex\": \"男\", \"position\": null, \"telno\": \"\", \"comment\": \"\", \"group\": 2}','\"\"','操作链接为：/userpermission/staffmodify/',NULL,2),(431,'192.168.132.1','2017-09-26 02:51:41','delete','{\"id\": 14, \"name\": \"test555\", \"password\": null, \"sex\": \"男\", \"position\": null, \"telno\": \"\", \"comment\": \"\", \"group\": 1}','\"\"','操作链接为：/userpermission/staffmodify/',NULL,2);
/*!40000 ALTER TABLE `meteor_operaterecords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meteor_paydnses`
--

DROP TABLE IF EXISTS `meteor_paydnses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meteor_paydnses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domainname` varchar(100) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `comment` varchar(100) NOT NULL,
  `project_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `meteor_paydnses_project_id_daaf52e7` (`project_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meteor_paydnses`
--

LOCK TABLES `meteor_paydnses` WRITE;
/*!40000 ALTER TABLE `meteor_paydnses` DISABLE KEYS */;
INSERT INTO `meteor_paydnses` VALUES (1,'news.bbc.com','Null','',1),(2,'joy.google.com','Null','',2),(3,'weibo.google.com','Null','',2),(4,'www.baidu.com','Null','',1),(5,'www.baidu.com','Null','',1),(6,'www.baidu.com','Null','',1),(7,'dsad','Null','',1),(8,'sasas','Null','',2),(9,'www.ggg.com','Null','',3);
/*!40000 ALTER TABLE `meteor_paydnses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meteor_payhosts`
--

DROP TABLE IF EXISTS `meteor_payhosts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meteor_payhosts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(100) NOT NULL,
  `location` varchar(100) NOT NULL,
  `comment` longtext,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meteor_payhosts`
--

LOCK TABLES `meteor_payhosts` WRITE;
/*!40000 ALTER TABLE `meteor_payhosts` DISABLE KEYS */;
INSERT INTO `meteor_payhosts` VALUES (1,'1.1.1.2','Null',''),(2,'2.2.2.2','Null',''),(3,'3.3.3.3','Null',''),(4,'4.4.4.4','Null','');
/*!40000 ALTER TABLE `meteor_payhosts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meteor_projects`
--

DROP TABLE IF EXISTS `meteor_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meteor_projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `comment` longtext,
  `staff_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `meteor_projects_staff_id_8b2b842a` (`staff_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meteor_projects`
--

LOCK TABLES `meteor_projects` WRITE;
/*!40000 ALTER TABLE `meteor_projects` DISABLE KEYS */;
INSERT INTO `meteor_projects` VALUES (1,'新闻',NULL,1),(2,'游戏',NULL,2),(3,'微博',NULL,1);
/*!40000 ALTER TABLE `meteor_projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meteor_rolepermissions`
--

DROP TABLE IF EXISTS `meteor_rolepermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meteor_rolepermissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permission` varchar(4) NOT NULL,
  `comment` varchar(160) DEFAULT NULL,
  `role_id` int(11) NOT NULL,
  `secondmenu_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `meteor_rolepermissions_role_id_0959ebbe` (`role_id`),
  KEY `meteor_rolepermissions_secondmenu_id_632e2a89` (`secondmenu_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meteor_rolepermissions`
--

LOCK TABLES `meteor_rolepermissions` WRITE;
/*!40000 ALTER TABLE `meteor_rolepermissions` DISABLE KEYS */;
INSERT INTO `meteor_rolepermissions` VALUES (1,'1010','运维角色查看、修改角色管理权限',2,3);
/*!40000 ALTER TABLE `meteor_rolepermissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meteor_roles`
--

DROP TABLE IF EXISTS `meteor_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meteor_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `comment` varchar(160) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meteor_roles`
--

LOCK TABLES `meteor_roles` WRITE;
/*!40000 ALTER TABLE `meteor_roles` DISABLE KEYS */;
INSERT INTO `meteor_roles` VALUES (1,'超级管理员','拥有所有权限'),(2,'运维','运维角色'),(3,'开发','开发角色');
/*!40000 ALTER TABLE `meteor_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meteor_secondmenus`
--

DROP TABLE IF EXISTS `meteor_secondmenus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meteor_secondmenus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  `url` varchar(200) NOT NULL,
  `onshow` tinyint(1) NOT NULL,
  `comment` varchar(160) DEFAULT NULL,
  `firstmenu_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `meteor_secondmenus_firstmenu_id_1ba05514` (`firstmenu_id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meteor_secondmenus`
--

LOCK TABLES `meteor_secondmenus` WRITE;
/*!40000 ALTER TABLE `meteor_secondmenus` DISABLE KEYS */;
INSERT INTO `meteor_secondmenus` VALUES (1,'用户组管理','/userpermission/groups/',1,NULL,7),(2,'用户管理','/userpermission/staffs/',1,NULL,7),(3,'角色管理','/userpermission/roles/',1,NULL,7),(4,'角色权限管理','/userpermission/rolepermissions/',1,NULL,7),(5,'用户角色管理','/userpermission/staffroles/',1,NULL,7),(6,'用户权限管理','/userpermission/staffpermissions/',1,NULL,7),(7,'主菜单管理','/menumanage/menus/',1,NULL,3),(8,'子菜单管理','/menumanage/secondmenus/',1,NULL,3),(9,'操作日志查看','/operaterecord/operaterecords/',1,NULL,4),(10,'值班交接文档管理','/dailymanage/dutysheets/',1,NULL,1),(11,'支付主机管理','/thirdmanage/payhosts/',1,NULL,6),(12,'支付域名管理','/thirdmanage/paydnses/',1,NULL,6),(13,'项目管理','/servermanage/projects/',1,NULL,5),(14,'IDC管理','/servermanage/idcs/',1,NULL,5),(15,'服务器管理','/servermanage/servers/',1,NULL,5),(16,'服务管理','/servermanage/services/',1,NULL,5),(17,'用户设备分析','/loganalysis/agents/',1,NULL,2),(18,'用户地区分析','/loganalysis/areas/',1,NULL,2),(19,'CDN响应节点分析','/loganalysis/cdns/',1,NULL,2),(20,'用户访问域名分析','/loganalysis/domainnames/',1,NULL,2),(21,'用户访问状态分析','/loganalysis/statuses/',1,NULL,2),(22,'Nginx后端转发分析','/loganalysis/upstreams/',1,NULL,2),(23,'服务器巡检','/inspectionmanage/serverinspections/',1,NULL,8);
/*!40000 ALTER TABLE `meteor_secondmenus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meteor_serverinspections`
--

DROP TABLE IF EXISTS `meteor_serverinspections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meteor_serverinspections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cpu` varchar(64) NOT NULL,
  `mem` varchar(64) NOT NULL,
  `diskroot` varchar(64) NOT NULL,
  `diskhome` varchar(64) NOT NULL,
  `port` varchar(64) NOT NULL,
  `comment` longtext NOT NULL,
  `server_id` int(11) NOT NULL,
  `inspectdate` datetime,
  PRIMARY KEY (`id`),
  KEY `meteor_serverinspections_server_id_56f494e8` (`server_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meteor_serverinspections`
--

LOCK TABLES `meteor_serverinspections` WRITE;
/*!40000 ALTER TABLE `meteor_serverinspections` DISABLE KEYS */;
INSERT INTO `meteor_serverinspections` VALUES (1,'2.4','','','','80','',1,'2017-08-28 03:30:22');
/*!40000 ALTER TABLE `meteor_serverinspections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meteor_servers`
--

DROP TABLE IF EXISTS `meteor_servers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meteor_servers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `sn` varchar(32) DEFAULT NULL,
  `cpu` varchar(64) DEFAULT NULL,
  `mem` int(11) DEFAULT NULL,
  `disktype` varchar(64) DEFAULT NULL,
  `diskcapacity` int(11) DEFAULT NULL,
  `nic` varchar(64) DEFAULT NULL,
  `expiredate` datetime,
  `privateip` varchar(64) DEFAULT NULL,
  `publicip` varchar(64) DEFAULT NULL,
  `comment` longtext,
  `idc_id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `meteor_servers_idc_id_d1feb076` (`idc_id`),
  KEY `meteor_servers_staff_id_af6c58d4` (`staff_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meteor_servers`
--

LOCK TABLES `meteor_servers` WRITE;
/*!40000 ALTER TABLE `meteor_servers` DISABLE KEYS */;
INSERT INTO `meteor_servers` VALUES (1,'Meteor server',NULL,'2.4',NULL,NULL,NULL,NULL,'2017-08-28 02:36:47','192.168.33.29',NULL,NULL,1,1);
/*!40000 ALTER TABLE `meteor_servers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meteor_services`
--

DROP TABLE IF EXISTS `meteor_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meteor_services` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `tags` varchar(64) DEFAULT NULL,
  `comment` longtext,
  `project_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `meteor_services_project_id_1472aa3f` (`project_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meteor_services`
--

LOCK TABLES `meteor_services` WRITE;
/*!40000 ALTER TABLE `meteor_services` DISABLE KEYS */;
INSERT INTO `meteor_services` VALUES (1,'nginx',NULL,NULL,1),(2,'tomcat',NULL,NULL,2),(3,'nginx',NULL,NULL,2);
/*!40000 ALTER TABLE `meteor_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meteor_staffpermissions`
--

DROP TABLE IF EXISTS `meteor_staffpermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meteor_staffpermissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permission` varchar(4) NOT NULL,
  `comment` varchar(160) DEFAULT NULL,
  `secondmenu_id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `meteor_staffpermissions_secondmenu_id_492e711a` (`secondmenu_id`),
  KEY `meteor_staffpermissions_staff_id_5f6406fb` (`staff_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meteor_staffpermissions`
--

LOCK TABLES `meteor_staffpermissions` WRITE;
/*!40000 ALTER TABLE `meteor_staffpermissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `meteor_staffpermissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meteor_staffroles`
--

DROP TABLE IF EXISTS `meteor_staffroles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meteor_staffroles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment` varchar(160) DEFAULT NULL,
  `role_id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `meteor_staffroles_role_id_a45c1004` (`role_id`),
  KEY `meteor_staffroles_staff_id_fcbf1cfa` (`staff_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meteor_staffroles`
--

LOCK TABLES `meteor_staffroles` WRITE;
/*!40000 ALTER TABLE `meteor_staffroles` DISABLE KEYS */;
INSERT INTO `meteor_staffroles` VALUES (1,'沙瑞金运维角色',2,1),(2,'李达康的超级管理员权限',1,2),(3,NULL,1,5),(4,NULL,1,6),(5,NULL,1,7);
/*!40000 ALTER TABLE `meteor_staffroles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meteor_staffs`
--

DROP TABLE IF EXISTS `meteor_staffs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meteor_staffs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `password` varchar(128) DEFAULT NULL,
  `sex` varchar(2) DEFAULT NULL,
  `position` varchar(50) DEFAULT NULL,
  `telno` varchar(50) DEFAULT NULL,
  `comment` varchar(160) DEFAULT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `meteor_staffs_group_id_5a4e82fd` (`group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meteor_staffs`
--

LOCK TABLES `meteor_staffs` WRITE;
/*!40000 ALTER TABLE `meteor_staffs` DISABLE KEYS */;
INSERT INTO `meteor_staffs` VALUES (1,'沙瑞金','e10adc3949ba59abbe56e057f20f883e','男',NULL,'15802612754','staff',2),(2,'admin','e10adc3949ba59abbe56e057f20f883e','男',NULL,'1580261273','staff',1),(3,'孙连成','e10adc3949ba59abbe56e057f20f883e','男',NULL,'15802612754','staff',1),(4,'特朗普','e10adc3949ba59abbe56e057f20f883e','男',NULL,'15802612754','staff',2),(5,'隔壁老王','e10adc3949ba59abbe56e057f20f883e','男',NULL,NULL,NULL,1),(6,'扫地大佬','e10adc3949ba59abbe56e057f20f883e','男',NULL,NULL,NULL,1),(7,'jeff','e10adc3949ba59abbe56e057f20f883e','男',NULL,NULL,NULL,1),(10,'rose','','男','dsad','','',2),(9,'itimor','e10adc3949ba59abbe56e057f20f883e','男',NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `meteor_staffs` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-09-26 11:05:45
