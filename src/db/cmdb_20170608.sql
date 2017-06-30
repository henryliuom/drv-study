-- MySQL dump 10.13  Distrib 5.1.73, for redhat-linux-gnu (x86_64)
--
-- Host: localhost    Database: cmdb
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
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add permission',3,'add_permission'),(8,'Can change permission',3,'change_permission'),(9,'Can delete permission',3,'delete_permission'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add idcs',7,'add_idcs'),(20,'Can change idcs',7,'change_idcs'),(21,'Can delete idcs',7,'delete_idcs'),(22,'Can add servers',8,'add_servers'),(23,'Can change servers',8,'change_servers'),(24,'Can delete servers',8,'delete_servers'),(25,'Can add services',9,'add_services'),(26,'Can change services',9,'change_services'),(27,'Can delete services',9,'delete_services'),(28,'Can add iptables',10,'add_iptables'),(29,'Can change iptables',10,'change_iptables'),(30,'Can delete iptables',10,'delete_iptables'),(31,'Can add projects',11,'add_projects'),(32,'Can change projects',11,'change_projects'),(33,'Can delete projects',11,'delete_projects'),(34,'Can add staffs',12,'add_staffs'),(35,'Can change staffs',12,'change_staffs'),(36,'Can delete staffs',12,'delete_staffs'),(37,'Can add departments',13,'add_departments'),(38,'Can change departments',13,'change_departments'),(39,'Can delete departments',13,'delete_departments');
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
-- Table structure for table `cmdb_departments`
--

DROP TABLE IF EXISTS `cmdb_departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmdb_departments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `comment` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmdb_departments`
--

LOCK TABLES `cmdb_departments` WRITE;
/*!40000 ALTER TABLE `cmdb_departments` DISABLE KEYS */;
INSERT INTO `cmdb_departments` VALUES (1,'OM','dsgf'),(2,'技术部','sdf'),(3,'财务','');
/*!40000 ALTER TABLE `cmdb_departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmdb_firstmenu`
--

DROP TABLE IF EXISTS `cmdb_firstmenu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmdb_firstmenu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) DEFAULT NULL,
  `iconclass` varchar(80) DEFAULT NULL,
  `comment` varchar(160) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmdb_firstmenu`
--

LOCK TABLES `cmdb_firstmenu` WRITE;
/*!40000 ALTER TABLE `cmdb_firstmenu` DISABLE KEYS */;
INSERT INTO `cmdb_firstmenu` VALUES (1,'权限管理','fa-tree','包括菜单'),(3,'资产管理','fa-desktop','服务器等资源的管理'),(27,'服务管理','fa-wheelchair','服务器各服务的增、删、改、查'),(28,'员工管理','fa-user','部门、员工信息管理');
/*!40000 ALTER TABLE `cmdb_firstmenu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmdb_idcs`
--

DROP TABLE IF EXISTS `cmdb_idcs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmdb_idcs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `comment` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmdb_idcs`
--

LOCK TABLES `cmdb_idcs` WRITE;
/*!40000 ALTER TABLE `cmdb_idcs` DISABLE KEYS */;
INSERT INTO `cmdb_idcs` VALUES (1,'私有云','marvin plaza',''),(2,'阿里云','杭州市西湖区',''),(3,'腾讯云','深圳市罗湖区',''),(4,'亚马逊','American','');
/*!40000 ALTER TABLE `cmdb_idcs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmdb_iptables`
--

DROP TABLE IF EXISTS `cmdb_iptables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmdb_iptables` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iptable` text,
  `comment` varchar(160) DEFAULT NULL,
  `server_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `server_id` (`server_id`),
  CONSTRAINT `cmdb_iptables_ibfk_1` FOREIGN KEY (`server_id`) REFERENCES `cmdb_servers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmdb_iptables`
--

LOCK TABLES `cmdb_iptables` WRITE;
/*!40000 ALTER TABLE `cmdb_iptables` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmdb_iptables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmdb_projects`
--

DROP TABLE IF EXISTS `cmdb_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmdb_projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) DEFAULT NULL,
  `comment` text,
  `staff_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `staff_id` (`staff_id`),
  CONSTRAINT `cmdb_projects_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `cmdb_staffs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmdb_projects`
--

LOCK TABLES `cmdb_projects` WRITE;
/*!40000 ALTER TABLE `cmdb_projects` DISABLE KEYS */;
INSERT INTO `cmdb_projects` VALUES (1,'testproject','',1),(2,'xxxxproject','',1),(4,'testp','',1);
/*!40000 ALTER TABLE `cmdb_projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmdb_secondmenu`
--

DROP TABLE IF EXISTS `cmdb_secondmenu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmdb_secondmenu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `onshow` tinyint(4) DEFAULT NULL,
  `comment` varchar(160) DEFAULT NULL,
  `firstmenu_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `firstmenu_id` (`firstmenu_id`),
  CONSTRAINT `cmdb_secondmenu_ibfk_1` FOREIGN KEY (`firstmenu_id`) REFERENCES `cmdb_firstmenu` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmdb_secondmenu`
--

LOCK TABLES `cmdb_secondmenu` WRITE;
/*!40000 ALTER TABLE `cmdb_secondmenu` DISABLE KEYS */;
INSERT INTO `cmdb_secondmenu` VALUES (1,'父菜单管理','permission/menuadd/',1,'',1),(2,'子菜单管理','permission/submenuadd/',1,'',1),(3,'iptables管理','service/iptables/',1,'服务器iptables展示、修改',27),(16,'服务器管理','assets/serveradd/',1,'增、删、改、查服务器硬件信息',3),(18,'IDC管理','assets/idcadd/',1,'IDC机房信息增、删、改、查',3),(19,'部门管理','staff/departments/',1,'',28),(20,'员工管理','staff/staffs/',1,'',28),(21,'项目管理','service/projects/',1,'项目及责任人的管理',27),(22,'服务管理','service/services/',1,'',27);
/*!40000 ALTER TABLE `cmdb_secondmenu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmdb_servers`
--

DROP TABLE IF EXISTS `cmdb_servers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmdb_servers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) DEFAULT NULL,
  `ip` varchar(15) DEFAULT NULL,
  `cpu` varchar(15) DEFAULT NULL,
  `disktype` varchar(15) DEFAULT NULL,
  `disksize` varchar(15) DEFAULT NULL,
  `uuid` varchar(50) DEFAULT NULL,
  `comment` text,
  `idc_id` int(11) DEFAULT NULL,
  `mem` varchar(15) DEFAULT NULL,
  `nic` varchar(50) DEFAULT NULL,
  `manufactory` varchar(100) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `apply_date` date DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idc_id` (`idc_id`),
  CONSTRAINT `cmdb_servers_ibfk_1` FOREIGN KEY (`idc_id`) REFERENCES `cmdb_idcs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmdb_servers`
--

LOCK TABLES `cmdb_servers` WRITE;
/*!40000 ALTER TABLE `cmdb_servers` DISABLE KEYS */;
INSERT INTO `cmdb_servers` VALUES (1,'虚拟机','192.168.132.130','2c4g','ssd','1024','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `cmdb_servers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmdb_services`
--

DROP TABLE IF EXISTS `cmdb_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmdb_services` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `port` varchar(10) DEFAULT NULL,
  `tags` varchar(200) DEFAULT NULL,
  `comment` text,
  `project_id` int(11) DEFAULT NULL,
  `server_id` int(11) DEFAULT NULL,
  `staff_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `project_id` (`project_id`),
  KEY `server_id` (`server_id`),
  KEY `staff_id` (`staff_id`),
  CONSTRAINT `cmdb_services_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `cmdb_projects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cmdb_services_ibfk_2` FOREIGN KEY (`server_id`) REFERENCES `cmdb_servers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cmdb_services_ibfk_3` FOREIGN KEY (`staff_id`) REFERENCES `cmdb_staffs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmdb_services`
--

LOCK TABLES `cmdb_services` WRITE;
/*!40000 ALTER TABLE `cmdb_services` DISABLE KEYS */;
INSERT INTO `cmdb_services` VALUES (2,'nginx','web','8000','test','',1,1,2);
/*!40000 ALTER TABLE `cmdb_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmdb_staffs`
--

DROP TABLE IF EXISTS `cmdb_staffs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmdb_staffs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `sex` varchar(1) DEFAULT NULL,
  `position` varchar(50) DEFAULT NULL,
  `comment` text,
  `department_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `department_id` (`department_id`),
  CONSTRAINT `cmdb_staffs_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `cmdb_departments` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmdb_staffs`
--

LOCK TABLES `cmdb_staffs` WRITE;
/*!40000 ALTER TABLE `cmdb_staffs` DISABLE KEYS */;
INSERT INTO `cmdb_staffs` VALUES (1,'xxxxxxsdf','m','运维','',2),(2,'mmm','f','developer','',2),(4,'jack','f','test','',1),(6,'xxx','m','','sf',1),(11,'xxxxxxx','','','',1),(12,'222222','f','','',1);
/*!40000 ALTER TABLE `cmdb_staffs` ENABLE KEYS */;
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
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(2,'auth','group'),(3,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(7,'assets','idcs'),(8,'assets','servers'),(9,'service','services'),(10,'service','iptables'),(11,'service','projects'),(12,'staff','staffs'),(13,'staff','departments');
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
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2017-05-02 01:06:34'),(2,'auth','0001_initial','2017-05-02 01:06:34'),(3,'admin','0001_initial','2017-05-02 01:06:34'),(4,'admin','0002_logentry_remove_auto_add','2017-05-02 01:06:34'),(5,'contenttypes','0002_remove_content_type_name','2017-05-02 01:06:34'),(6,'auth','0002_alter_permission_name_max_length','2017-05-02 01:06:34'),(7,'auth','0003_alter_user_email_max_length','2017-05-02 01:06:34'),(8,'auth','0004_alter_user_username_opts','2017-05-02 01:06:34'),(9,'auth','0005_alter_user_last_login_null','2017-05-02 01:06:34'),(10,'auth','0006_require_contenttypes_0002','2017-05-02 01:06:34'),(11,'auth','0007_alter_validators_add_error_messages','2017-05-02 01:06:34'),(12,'auth','0008_alter_user_username_max_length','2017-05-02 01:06:34'),(13,'sessions','0001_initial','2017-05-02 01:06:34'),(14,'assets','0001_initial','2017-06-06 06:29:01'),(15,'assets','0002_auto_20170606_1418','2017-06-06 06:29:01'),(16,'staff','0001_initial','2017-06-06 06:29:16'),(17,'service','0001_initial','2017-06-06 06:29:17'),(18,'staff','0002_auto_20170606_1418','2017-06-06 06:29:17');
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
INSERT INTO `django_session` VALUES ('b57jobsv520d430cr1k2po0opom8kdpa','Zjg0ZWVjZWI4OGNhNTk3NWRhYTFiNTBiMjQxNmM1YTA3YzQyMzY5MDp7Im1lbm51cyI6W3siZmljb25jbGFzcyI6ImZhLXVzZXIiLCJmbmFtZSI6Ilx1Njc0M1x1OTY1MFx1N2JhMVx1NzQwNiIsIm1lbnVzIjpbWyJcdTcyMzZcdTgzZGNcdTUzNTVcdTdiYTFcdTc0MDYiLCJwZXJtaXNzaW9uL21lbnVhZGQvIl0sWyJcdTViNTBcdTgzZGNcdTUzNTVcdTdiYTFcdTc0MDYiLCJwZXJtaXNzaW9uL3N1Ym1lbnVhZGQvIl1dfSx7ImZpY29uY2xhc3MiOiJmYS1kZXNrdG9wIiwiZm5hbWUiOiJcdThkNDRcdTRlYTdcdTdiYTFcdTc0MDYiLCJtZW51cyI6W1siXHU2NzBkXHU1MmExXHU1NjY4XHU3YmExXHU3NDA2IiwiYXNzZXRzL3NlcnZlcnMvIl0sWyJJRENcdTdiYTFcdTc0MDYiLCJhc3NldHMvaWRjcy8iXV19LHsiZmljb25jbGFzcyI6ImZhLXdoZWVsY2hhaXIiLCJmbmFtZSI6Ilx1NjcwZFx1NTJhMVx1N2JhMVx1NzQwNiIsIm1lbnVzIjpbWyJpcHRhYmxlc1x1N2JhMVx1NzQwNiIsImFzc2V0cy9pcHRhYmxlcy8iXV19XX0=','2017-06-01 05:58:43'),('j7krnbr0vkdzd24vlzpgvl3syndprecw','OGQ3MTk0MTlmMjQ0ODE5NjIzMDQyNjhiM2IzYTZmMzQ3MWY2M2M5YTp7Im1lbm51cyI6W3siZmljb25jbGFzcyI6ImZhLXRyZWUiLCJmbmFtZSI6Ilx1Njc0M1x1OTY1MFx1N2JhMVx1NzQwNiIsIm1lbnVzIjpbWyJcdTcyMzZcdTgzZGNcdTUzNTVcdTdiYTFcdTc0MDYiLCJwZXJtaXNzaW9uL21lbnVhZGQvIl0sWyJcdTViNTBcdTgzZGNcdTUzNTVcdTdiYTFcdTc0MDYiLCJwZXJtaXNzaW9uL3N1Ym1lbnVhZGQvIl1dfSx7ImZpY29uY2xhc3MiOiJmYS1kZXNrdG9wIiwiZm5hbWUiOiJcdThkNDRcdTRlYTdcdTdiYTFcdTc0MDYiLCJtZW51cyI6W1siXHU2NzBkXHU1MmExXHU1NjY4XHU3YmExXHU3NDA2IiwiYXNzZXRzL3NlcnZlcmFkZC8iXSxbIklEQ1x1N2JhMVx1NzQwNiIsImFzc2V0cy9pZGNhZGQvIl1dfSx7ImZpY29uY2xhc3MiOiJmYS13aGVlbGNoYWlyIiwiZm5hbWUiOiJcdTY3MGRcdTUyYTFcdTdiYTFcdTc0MDYiLCJtZW51cyI6W1siaXB0YWJsZXNcdTdiYTFcdTc0MDYiLCJzZXJ2aWNlL2lwdGFibGVzLyJdLFsiXHU5ODc5XHU3NmVlXHU3YmExXHU3NDA2Iiwic2VydmljZS9wcm9qZWN0cy8iXSxbIlx1NjcwZFx1NTJhMVx1N2JhMVx1NzQwNiIsInNlcnZpY2Uvc2VydmljZXMvIl1dfSx7ImZpY29uY2xhc3MiOiJmYS11c2VyIiwiZm5hbWUiOiJcdTU0NThcdTVkZTVcdTdiYTFcdTc0MDYiLCJtZW51cyI6W1siXHU5MGU4XHU5NWU4XHU3YmExXHU3NDA2Iiwic3RhZmYvZGVwYXJ0bWVudHMvIl0sWyJcdTU0NThcdTVkZTVcdTdiYTFcdTc0MDYiLCJzdGFmZi9zdGFmZnMvIl1dfV19','2017-06-05 07:33:13'),('ldma1vhmgmy6j2q4ucp42epkhio75jce','OGQ3MTk0MTlmMjQ0ODE5NjIzMDQyNjhiM2IzYTZmMzQ3MWY2M2M5YTp7Im1lbm51cyI6W3siZmljb25jbGFzcyI6ImZhLXRyZWUiLCJmbmFtZSI6Ilx1Njc0M1x1OTY1MFx1N2JhMVx1NzQwNiIsIm1lbnVzIjpbWyJcdTcyMzZcdTgzZGNcdTUzNTVcdTdiYTFcdTc0MDYiLCJwZXJtaXNzaW9uL21lbnVhZGQvIl0sWyJcdTViNTBcdTgzZGNcdTUzNTVcdTdiYTFcdTc0MDYiLCJwZXJtaXNzaW9uL3N1Ym1lbnVhZGQvIl1dfSx7ImZpY29uY2xhc3MiOiJmYS1kZXNrdG9wIiwiZm5hbWUiOiJcdThkNDRcdTRlYTdcdTdiYTFcdTc0MDYiLCJtZW51cyI6W1siXHU2NzBkXHU1MmExXHU1NjY4XHU3YmExXHU3NDA2IiwiYXNzZXRzL3NlcnZlcmFkZC8iXSxbIklEQ1x1N2JhMVx1NzQwNiIsImFzc2V0cy9pZGNhZGQvIl1dfSx7ImZpY29uY2xhc3MiOiJmYS13aGVlbGNoYWlyIiwiZm5hbWUiOiJcdTY3MGRcdTUyYTFcdTdiYTFcdTc0MDYiLCJtZW51cyI6W1siaXB0YWJsZXNcdTdiYTFcdTc0MDYiLCJzZXJ2aWNlL2lwdGFibGVzLyJdLFsiXHU5ODc5XHU3NmVlXHU3YmExXHU3NDA2Iiwic2VydmljZS9wcm9qZWN0cy8iXSxbIlx1NjcwZFx1NTJhMVx1N2JhMVx1NzQwNiIsInNlcnZpY2Uvc2VydmljZXMvIl1dfSx7ImZpY29uY2xhc3MiOiJmYS11c2VyIiwiZm5hbWUiOiJcdTU0NThcdTVkZTVcdTdiYTFcdTc0MDYiLCJtZW51cyI6W1siXHU5MGU4XHU5NWU4XHU3YmExXHU3NDA2Iiwic3RhZmYvZGVwYXJ0bWVudHMvIl0sWyJcdTU0NThcdTVkZTVcdTdiYTFcdTc0MDYiLCJzdGFmZi9zdGFmZnMvIl1dfV19','2017-06-20 02:39:49');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-06-08  9:48:37
