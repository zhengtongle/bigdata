-- MariaDB dump 10.19  Distrib 10.11.3-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: visual
-- ------------------------------------------------------
-- Server version	10.11.3-MariaDB-1

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
-- Table structure for table `conversion_rate`
--

DROP TABLE IF EXISTS `conversion_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conversion_rate` (
  `pv` int(11) DEFAULT NULL,
  `fav` int(11) DEFAULT NULL,
  `cart` int(11) DEFAULT NULL,
  `fav+cart` int(11) DEFAULT NULL,
  `buy` int(11) DEFAULT NULL,
  `pv2favcart` float DEFAULT NULL,
  `favcart2buy` float DEFAULT NULL,
  `pv2buy` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conversion_rate`
--

LOCK TABLES `conversion_rate` WRITE;
/*!40000 ALTER TABLE `conversion_rate` DISABLE KEYS */;
INSERT INTO `conversion_rate` VALUES
(33148591,441965,597263,1039228,2193079,0.0314,2.1103,0.0662);
/*!40000 ALTER TABLE `conversion_rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_type_count`
--

DROP TABLE IF EXISTS `customer_type_count`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_type_count` (
  `重要价值用户` int(11) DEFAULT NULL,
  `消费潜力用户` int(11) DEFAULT NULL,
  `频次深耕用户` int(11) DEFAULT NULL,
  `新客户` int(11) DEFAULT NULL,
  `重要价值流失预警客户` int(11) DEFAULT NULL,
  `一般客户` int(11) DEFAULT NULL,
  `高消费客户` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_type_count`
--

LOCK TABLES `customer_type_count` WRITE;
/*!40000 ALTER TABLE `customer_type_count` DISABLE KEYS */;
INSERT INTO `customer_type_count` VALUES
(1586,0,198069,318813,478,5,364586);
/*!40000 ALTER TABLE `customer_type_count` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `day_pv`
--

DROP TABLE IF EXISTS `day_pv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `day_pv` (
  `date` date DEFAULT NULL,
  `pv` int(11) DEFAULT NULL,
  `uv` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `day_pv`
--

LOCK TABLES `day_pv` WRITE;
/*!40000 ALTER TABLE `day_pv` DISABLE KEYS */;
INSERT INTO `day_pv` VALUES
('2018-02-01',735005,141054),
('2018-02-02',655075,132500),
('2018-02-03',722515,141231),
('2018-02-04',828307,152688),
('2018-02-05',736592,150155),
('2018-02-06',799620,150573),
('2018-02-07',663087,138528),
('2018-02-08',608541,130657),
('2018-02-09',567990,126255),
('2018-02-10',562124,123376),
('2018-02-11',492385,110795),
('2018-02-12',423961,99662),
('2018-02-13',378331,91303),
('2018-02-14',289377,77049),
('2018-02-15',206239,59270),
('2018-02-16',240232,62944),
('2018-02-17',285343,70316),
('2018-02-18',307524,74252),
('2018-02-19',335310,78978),
('2018-02-20',355252,84769),
('2018-02-21',394294,93669),
('2018-02-22',445773,104581),
('2018-02-23',489152,116144),
('2018-02-24',501093,118780),
('2018-02-25',485045,117073),
('2018-02-26',483851,121591),
('2018-02-27',493702,124937),
('2018-02-28',483486,123521),
('2018-03-01',465981,120431),
('2018-03-02',439559,116018),
('2018-03-03',480692,123445),
('2018-03-04',490897,122779),
('2018-03-05',462620,122781),
('2018-03-06',480180,125046),
('2018-03-07',489358,127823),
('2018-03-08',469391,123899),
('2018-03-09',450608,122411),
('2018-03-10',442282,114195),
('2018-03-11',451203,117019),
('2018-03-12',451590,121240),
('2018-03-13',467519,120274),
('2018-03-14',499020,120908),
('2018-03-15',539660,127619),
('2018-03-16',457931,115204),
('2018-03-17',478367,118291),
('2018-03-18',501236,122436),
('2018-03-19',482660,120926),
('2018-03-20',483679,121420),
('2018-03-21',466906,117952),
('2018-03-22',447734,114785),
('2018-03-23',429964,113727),
('2018-03-24',433632,109388),
('2018-03-25',447433,113881),
('2018-03-26',456543,115331),
('2018-03-27',1261,39606),
('2018-03-28',4087,45433),
('2018-03-29',430293,110581),
('2018-03-30',396780,105562),
('2018-03-31',408801,103626),
('2018-04-01',382468,102603),
('2018-04-02',371439,105061),
('2018-04-03',382522,108092),
('2018-04-04',347701,97015),
('2018-04-05',381503,99207),
('2018-04-06',407265,107025),
('2018-04-07',393032,104609),
('2018-04-08',376661,105819),
('2018-04-09',410913,110950),
('2018-04-10',415075,110828),
('2018-04-11',401844,110850),
('2018-04-12',395438,107958),
('2018-04-13',384859,104145),
('2018-04-14',371782,101774),
('2018-04-15',349015,95325);
/*!40000 ALTER TABLE `day_pv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `male_ratio`
--

DROP TABLE IF EXISTS `male_ratio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `male_ratio` (
  `male` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `male_ratio`
--

LOCK TABLES `male_ratio` WRITE;
/*!40000 ALTER TABLE `male_ratio` DISABLE KEYS */;
INSERT INTO `male_ratio` VALUES
(0.500243);
/*!40000 ALTER TABLE `male_ratio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `total_pv`
--

DROP TABLE IF EXISTS `total_pv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `total_pv` (
  `pv` int(11) DEFAULT NULL,
  `uv` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `total_pv`
--

LOCK TABLES `total_pv` WRITE;
/*!40000 ALTER TABLE `total_pv` DISABLE KEYS */;
INSERT INTO `total_pv` VALUES
(1608706,33148590);
/*!40000 ALTER TABLE `total_pv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_address_count`
--

DROP TABLE IF EXISTS `user_address_count`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_address_count` (
  `北京市` int(11) DEFAULT NULL,
  `天津市` int(11) DEFAULT NULL,
  `河北省` int(11) DEFAULT NULL,
  `山西省` int(11) DEFAULT NULL,
  `内蒙古` int(11) DEFAULT NULL,
  `辽宁省` int(11) DEFAULT NULL,
  `吉林省` int(11) DEFAULT NULL,
  `黑龙江省` int(11) DEFAULT NULL,
  `上海市` int(11) DEFAULT NULL,
  `江苏省` int(11) DEFAULT NULL,
  `浙江省` int(11) DEFAULT NULL,
  `安徽省` int(11) DEFAULT NULL,
  `福建省` int(11) DEFAULT NULL,
  `江西省` int(11) DEFAULT NULL,
  `山东省` int(11) DEFAULT NULL,
  `河南省` int(11) DEFAULT NULL,
  `湖北省` int(11) DEFAULT NULL,
  `湖南省` int(11) DEFAULT NULL,
  `广东省` int(11) DEFAULT NULL,
  `广西` int(11) DEFAULT NULL,
  `海南省` int(11) DEFAULT NULL,
  `重庆市` int(11) DEFAULT NULL,
  `四川省` int(11) DEFAULT NULL,
  `贵州省` int(11) DEFAULT NULL,
  `云南省` int(11) DEFAULT NULL,
  `西藏` int(11) DEFAULT NULL,
  `陕西省` int(11) DEFAULT NULL,
  `甘肃省` int(11) DEFAULT NULL,
  `青海省` int(11) DEFAULT NULL,
  `宁夏` int(11) DEFAULT NULL,
  `新疆` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_address_count`
--

LOCK TABLES `user_address_count` WRITE;
/*!40000 ALTER TABLE `user_address_count` DISABLE KEYS */;
INSERT INTO `user_address_count` VALUES
(140034,6901,65410,39110,14286,29830,17195,20686,240805,48103,46927,38393,36519,35949,73658,70250,40672,49267,343201,33276,7621,18457,68004,31102,16713,6017,36403,15194,5927,2931,9867);
/*!40000 ALTER TABLE `user_address_count` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_age_count`
--

DROP TABLE IF EXISTS `user_age_count`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_age_count` (
  `age` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_age_count`
--

LOCK TABLES `user_age_count` WRITE;
/*!40000 ALTER TABLE `user_age_count` DISABLE KEYS */;
INSERT INTO `user_age_count` VALUES
(12,80509),
(1,80410),
(13,80684),
(16,80298),
(6,80354),
(3,80504),
(20,62911),
(5,80179),
(19,80399),
(15,80474),
(17,80072),
(9,80454),
(4,80628),
(8,80912),
(7,80570),
(10,80143),
(11,80689),
(14,80716),
(2,80188),
(0,17019),
(18,80595);
/*!40000 ALTER TABLE `user_age_count` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `week`
--

DROP TABLE IF EXISTS `week`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `week` (
  `week` int(11) DEFAULT NULL,
  `pv` int(11) DEFAULT NULL,
  `follow` int(11) DEFAULT NULL,
  `cart` int(11) DEFAULT NULL,
  `buy` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `week`
--

LOCK TABLES `week` WRITE;
/*!40000 ALTER TABLE `week` DISABLE KEYS */;
INSERT INTO `week` VALUES
(1,5112174,67342,134899,321521),
(2,4615479,59661,82575,296040),
(3,4257141,59293,82211,301578),
(4,4039160,59484,78272,300367),
(5,5125558,66211,76468,332665),
(6,4919415,63940,72993,320066),
(7,5079663,66029,69845,320824);
/*!40000 ALTER TABLE `week` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-12 18:19:51
