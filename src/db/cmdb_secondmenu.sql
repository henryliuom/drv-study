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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmdb_secondmenu`
--

LOCK TABLES `cmdb_secondmenu` WRITE;
/*!40000 ALTER TABLE `cmdb_secondmenu` DISABLE KEYS */;
INSERT INTO `cmdb_secondmenu` VALUES (1,'父菜单管理','permission/menuadd/',1,'',1),(2,'子菜单管理','permission/submenuadd/',1,'',1),(3,'iptables管理','service/iptables/',1,'服务器iptables展示、修改',27),(16,'服务器管理','assets/serveradd/',1,'增、删、改、查服务器硬件信息',3),(18,'IDC管理','assets/idcadd/',1,'IDC机房信息增、删、改、查',3),(19,'部门管理','staff/departments/',1,'',28),(20,'员工管理','staff/staffs/',1,'',28),(21,'项目管理','service/projects/',1,'项目及责任人的管理',27),(22,'服务管理','service/services/',1,'',27);
/*!40000 ALTER TABLE `cmdb_secondmenu` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-06-07 10:02:18
