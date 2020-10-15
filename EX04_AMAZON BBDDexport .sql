-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: m02ex01_modelatge_bbdd_amazon
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
-- Table structure for table `author_amazon`
--

DROP TABLE IF EXISTS `author_amazon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `author_amazon` (
  `author_id` int NOT NULL AUTO_INCREMENT,
  `author_nom` varchar(25) NOT NULL,
  `author_cognom` varchar(45) NOT NULL,
  `author_direcció` varchar(45) NOT NULL,
  `author_llibres_escrits` int NOT NULL,
  PRIMARY KEY (`author_id`),
  KEY `author_nom` (`author_nom`),
  KEY `author_cognom` (`author_cognom`),
  KEY `author_llibres_escrits` (`author_llibres_escrits`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author_amazon`
--

LOCK TABLES `author_amazon` WRITE;
/*!40000 ALTER TABLE `author_amazon` DISABLE KEYS */;
INSERT INTO `author_amazon` VALUES (1,'John Ronald Reuel','Tolkien','Bloemfontein, South Africa',33),(2,'Arthur Conan','Doyle','Edinburgh, United Kingdom',47),(3,'Agatha ','Christie','Torquay, United Kingdom',77),(4,'Jules ','Verne','Nantes, France',24),(5,'Joanne','Rowling ','Yate, United Kingdom',31),(6,'Stephen ','King','Maine, United States',87),(7,'Natza ','Farré ','Barcelona, Catalonia',2),(8,'Pepe','Colubi','Astúrias, Spain',10);
/*!40000 ALTER TABLE `author_amazon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill`
--

DROP TABLE IF EXISTS `bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bill` (
  `bill_id` int NOT NULL AUTO_INCREMENT COMMENT 'Número de factura.',
  `Client_client_id` int NOT NULL,
  `Author_author_id` int NOT NULL COMMENT 'L''identificador de cada autor.',
  `Book_catalogue_book_catalogue_id` int NOT NULL,
  `Book_catalogue_book_catalogue_preu` float NOT NULL,
  PRIMARY KEY (`bill_id`),
  KEY `fk_Bill_Author1_idx` (`Author_author_id`),
  KEY `fk_Bill_Book_catalogue_idx` (`Book_catalogue_book_catalogue_id`,`Book_catalogue_book_catalogue_preu`),
  KEY `fk_Bill_Client1_idx` (`Client_client_id`),
  KEY `bill_preu` (`Book_catalogue_book_catalogue_preu`),
  KEY `bill_book` (`Book_catalogue_book_catalogue_id`),
  CONSTRAINT `fk_Bill_Author1` FOREIGN KEY (`Author_author_id`) REFERENCES `author_amazon` (`author_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Bill_Book_catalogue1` FOREIGN KEY (`Book_catalogue_book_catalogue_id`, `Book_catalogue_book_catalogue_preu`) REFERENCES `book_catalogue` (`book_catalogue_id`, `book_catalogue_preu`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Bill_Client1` FOREIGN KEY (`Client_client_id`) REFERENCES `client_az` (`client_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill`
--

LOCK TABLES `bill` WRITE;
/*!40000 ALTER TABLE `bill` DISABLE KEYS */;
INSERT INTO `bill` VALUES (1,1,1,1,20),(2,2,2,2,15),(3,4,5,3,18),(4,3,3,4,16),(5,2,7,5,22);
/*!40000 ALTER TABLE `bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_catalogue`
--

DROP TABLE IF EXISTS `book_catalogue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_catalogue` (
  `book_catalogue_id` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador de cada llibre',
  `book_catalogue_unitats_dispo` int DEFAULT NULL COMMENT 'Quantitat disponible de cada llibre.',
  `book_catalogue_preu` float NOT NULL COMMENT 'Preu de cada llibre, en decimals.',
  `author_author_id` int NOT NULL,
  `book_catalogue_títol` varchar(30) NOT NULL COMMENT 'Títol del llibre.',
  PRIMARY KEY (`book_catalogue_id`,`book_catalogue_preu`),
  KEY `fk_Book_catalogue_author1_idx` (`author_author_id`),
  KEY `book_catalogue_títol` (`book_catalogue_títol`),
  CONSTRAINT `fk_Book_catalogue_author1` FOREIGN KEY (`author_author_id`) REFERENCES `author_amazon` (`author_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_catalogue`
--

LOCK TABLES `book_catalogue` WRITE;
/*!40000 ALTER TABLE `book_catalogue` DISABLE KEYS */;
INSERT INTO `book_catalogue` VALUES (1,5,20,1,'The Hobbit'),(2,2,15,2,'A Study in Scarlet'),(3,15,18,5,'Harry Potter 1'),(4,4,16,3,'Murder on the Orient Express'),(5,20,22,7,'Que no t\'expliquin contes');
/*!40000 ALTER TABLE `book_catalogue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_az`
--

DROP TABLE IF EXISTS `client_az`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_az` (
  `client_id` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador de cada usuari.',
  `client_nom` varchar(40) NOT NULL COMMENT 'Nom d''usuari. Haurà de ser únic.',
  `client_email` varchar(30) NOT NULL COMMENT 'Email d''usuari. Haurà de ser única.',
  `client_contrassenya` varchar(20) NOT NULL COMMENT 'Contrassenya d''usuari. No cal que sigui única. ',
  PRIMARY KEY (`client_id`),
  UNIQUE KEY `client_nom_UNIQUE` (`client_nom`),
  UNIQUE KEY `client_email_UNIQUE` (`client_email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_az`
--

LOCK TABLES `client_az` WRITE;
/*!40000 ALTER TABLE `client_az` DISABLE KEYS */;
INSERT INTO `client_az` VALUES (1,'XaviMaymo','xavimaymo@email.com','H3LLWill0pen'),(2,'MontseCodina','LaMontseCuqui@email.com','Y0GGAA!'),(3,'JesusMaymo','jesusBricolatge@email.com','Chus000'),(4,'FrancescMaymo','FranWoodwork@email.com','L4Fust4'),(5,'ElenaVerte','ElenaLlana@email.com','C0siRiC0siR');
/*!40000 ALTER TABLE `client_az` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-15 19:52:05
