-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: m02ex01_modelatge_bbdd_vueling
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `model`
--

DROP TABLE IF EXISTS `model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model` (
  `model_id` int NOT NULL AUTO_INCREMENT,
  `model_LCombustible` int DEFAULT NULL COMMENT 'Quants L de combustible utilitza per km.',
  `model_AnyFabricació` year DEFAULT NULL COMMENT 'Any de fabricació en 4 xifres.',
  `model_CiutatFabricació` varchar(15) DEFAULT NULL COMMENT 'Ciutat de fabricació, paraula sencera.',
  PRIMARY KEY (`model_id`),
  UNIQUE KEY `model_id_UNIQUE` (`model_id`),
  KEY `model_LComb` (`model_LCombustible`) USING BTREE,
  KEY `model_AnyFab` (`model_AnyFabricació`),
  KEY `model_CiutatFab` (`model_CiutatFabricació`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model`
--

LOCK TABLES `model` WRITE;
/*!40000 ALTER TABLE `model` DISABLE KEYS */;
/*!40000 ALTER TABLE `model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plane`
--

DROP TABLE IF EXISTS `plane`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plane` (
  `plane_ID` int NOT NULL AUTO_INCREMENT COMMENT 'id de cada seient (per enumerar cada registre).',
  `plane_model` varchar(45) DEFAULT NULL COMMENT 'model de cada avió',
  `plane_capacitat` int DEFAULT NULL COMMENT 'número de persones que hi caben',
  PRIMARY KEY (`plane_ID`),
  UNIQUE KEY `plane_ID_UNIQUE` (`plane_ID`),
  KEY `plane_model` (`plane_model`),
  KEY `plane_capacitat` (`plane_capacitat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plane`
--

LOCK TABLES `plane` WRITE;
/*!40000 ALTER TABLE `plane` DISABLE KEYS */;
/*!40000 ALTER TABLE `plane` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seat`
--

DROP TABLE IF EXISTS `seat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seat` (
  `seat_ID` int NOT NULL AUTO_INCREMENT COMMENT 'id de cada seient (per enumerar cada registre).',
  `Plane_plane_ID` int NOT NULL,
  PRIMARY KEY (`seat_ID`),
  UNIQUE KEY `Seat_ID_UNIQUE` (`seat_ID`),
  KEY `fk_Seat_Plane_idx` (`Plane_plane_ID`),
  CONSTRAINT `fk_Seat_Plane` FOREIGN KEY (`Plane_plane_ID`) REFERENCES `plane` (`plane_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seat`
--

LOCK TABLES `seat` WRITE;
/*!40000 ALTER TABLE `seat` DISABLE KEYS */;
/*!40000 ALTER TABLE `seat` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-15 19:42:16
