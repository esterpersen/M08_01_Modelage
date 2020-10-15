-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: m02ex01_modelatge_bbdd_quadres
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
-- Table structure for table `author(quadres)`
--

DROP TABLE IF EXISTS `author(quadres)`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `author(quadres)` (
  `author_id` int NOT NULL AUTO_INCREMENT,
  `author_nom` varchar(15) DEFAULT NULL,
  `author_cognom` varchar(25) DEFAULT NULL,
  `author_nacionalitat` varchar(15) DEFAULT NULL,
  `author_naixement` date DEFAULT NULL,
  `author_defunció` date DEFAULT NULL,
  `author_estil` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`author_id`),
  KEY `author_nom` (`author_nom`),
  KEY `author_cognom` (`author_cognom`),
  KEY `author_nacionalitat` (`author_nacionalitat`),
  KEY `author_estil` (`author_estil`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author(quadres)`
--

LOCK TABLES `author(quadres)` WRITE;
/*!40000 ALTER TABLE `author(quadres)` DISABLE KEYS */;
INSERT INTO `author(quadres)` VALUES (1,'Anònim','Anònim',NULL,NULL,NULL,NULL),(2,'Ernest','Sentís','Catalan','1984-10-18',NULL,'Renaixentisme'),(3,'Ainhoa','Díaz-Tarragó','Catalan','1984-09-26',NULL,'Gòtic'),(4,'Ona','Sentís','French','2014-08-16',NULL,'Modernisme'),(5,'Mar','Sentís','Italian','2018-09-26',NULL,'Puntillisme');
/*!40000 ALTER TABLE `author(quadres)` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buyer`
--

DROP TABLE IF EXISTS `buyer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `buyer` (
  `buyer_id` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador de cada comprador',
  `buyer_nom` varchar(15) DEFAULT NULL COMMENT 'Nom de cada comprador',
  `buyer_cognom` varchar(25) DEFAULT NULL COMMENT 'Cognom de cada comprador',
  `buyer_DNI` varchar(9) DEFAULT NULL COMMENT 'DNI de cada comprador- ha de ser únic.',
  PRIMARY KEY (`buyer_id`),
  UNIQUE KEY `buyer_DNI_UNIQUE` (`buyer_DNI`),
  KEY `buyer_nom` (`buyer_nom`),
  KEY `buyer_cognom` (`buyer_cognom`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buyer`
--

LOCK TABLES `buyer` WRITE;
/*!40000 ALTER TABLE `buyer` DISABLE KEYS */;
INSERT INTO `buyer` VALUES (1,'Anna','Sentís','12345678A'),(2,'Àngel','Perelló','87654321B'),(3,'Ferran','Perelló','12312312C'),(4,'Tasi','Koval','45645645D');
/*!40000 ALTER TABLE `buyer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paint`
--

DROP TABLE IF EXISTS `paint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paint` (
  `paint_id` int NOT NULL AUTO_INCREMENT,
  `paint_preu` float NOT NULL,
  `paint_autor` varchar(45) DEFAULT NULL,
  `Buyer_buyer_id` int NOT NULL,
  PRIMARY KEY (`paint_id`),
  UNIQUE KEY `Paint_id_UNIQUE` (`paint_id`),
  KEY `paint_preu` (`paint_preu`),
  KEY `fk_Paint_Buyer1_idx` (`Buyer_buyer_id`),
  CONSTRAINT `fk_Paint_Buyer1` FOREIGN KEY (`Buyer_buyer_id`) REFERENCES `buyer` (`buyer_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paint`
--

LOCK TABLES `paint` WRITE;
/*!40000 ALTER TABLE `paint` DISABLE KEYS */;
INSERT INTO `paint` VALUES (1,25.6,'2',1),(2,20,'5',3),(3,15.15,'3',2),(4,25.5,'1',2),(5,30.1,'4',3),(6,15.5,'4',4),(7,20.15,'1',1);
/*!40000 ALTER TABLE `paint` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-15 19:49:42
