-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: m02ex01_modelatge_bbdd_culampolla
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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `address_id` int NOT NULL AUTO_INCREMENT COMMENT 'Conté l''id de cada adreça.',
  `address_carrer` varchar(45) NOT NULL COMMENT 'Conté el carrer de cada adreça.',
  `address_número` int NOT NULL COMMENT 'Conté el número de carrer de cada adreça.',
  `address_pis` int DEFAULT NULL COMMENT 'Conté el pis de cada adreça.',
  `address_porta` varchar(3) DEFAULT NULL COMMENT 'Conté la porta de cada adreça.',
  `address_ciutat` varchar(25) NOT NULL COMMENT 'Conté la ciutat de cada adreça.',
  `address_CP` varchar(5) NOT NULL COMMENT 'Conté el codi postal de cada adreça.',
  `address_país` varchar(25) NOT NULL COMMENT 'Conté el país de cada adreça.',
  PRIMARY KEY (`address_id`),
  KEY `address_ciutat` (`address_ciutat`),
  KEY `address_país` (`address_país`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'remolatxa',2,1,'A','Cargol','12345','Cervesaland'),(2,'carbassó',3,NULL,'2A','Girafa','45612','WineHill'),(3,'cebatendra',456,5,NULL,'Orca','7854A','Pimmstershire'),(4,'patata',75,NULL,NULL,'Dofí','NE245','Fermentaland'),(5,'esbergínia albina',3,2,'A','Fura','F1R4','MocktailBay'),(6,'pèsol verd',30,3,'X','Gatito','G4T29','Mount Kombutxa'),(7,'alvocat',8,3,'5','Cavall','R1B3S','Sucnatural Valley'),(8,'torrijas',3,5,'8','Gos','MUS1C','Cocktail Town'),(9,'pebrot vermell',5,3,'2','Gos','PS1C0','CocktailTown');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brand` (
  `brand_id` int NOT NULL AUTO_INCREMENT COMMENT 'Conté l''id de cada marca.',
  `brand_name` varchar(45) DEFAULT NULL COMMENT 'Conté el nom de cada marca.',
  `Provider_provider_id` int NOT NULL COMMENT 'Conté l''id del proveïdor de cada marca.',
  PRIMARY KEY (`brand_id`),
  KEY `fk_Brand_Provider1_idx` (`Provider_provider_id`),
  KEY `brand_name` (`brand_name`),
  CONSTRAINT `fk_Brand_Provider1` FOREIGN KEY (`Provider_provider_id`) REFERENCES `provider` (`provider_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
INSERT INTO `brand` VALUES (1,'WoodForLife',2),(2,'BlackIsTheNewBlack',2),(3,'AnotherHit',3),(4,'SheBoss',2),(5,'Versaillesque',4),(6,'LaParisienne',4),(7,'LaResistència',1),(8,'Productifectivitat',1);
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_ca`
--

DROP TABLE IF EXISTS `client_ca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_ca` (
  `client_CA_id` int NOT NULL AUTO_INCREMENT COMMENT 'Conté l''id de cada usuari.',
  `client_CA_nom` varchar(25) NOT NULL COMMENT 'Conté el nom de cada usuari.',
  `client_CA_cognom` varchar(60) NOT NULL COMMENT 'Conté el cognom de cada usuari.',
  `client_CA_telèfon` varchar(20) NOT NULL COMMENT 'Conté el telèfon de cada usuari.',
  `client_CA_email` varchar(60) NOT NULL COMMENT 'Conté l''email de cada usuari.',
  `client_CA_registre` date NOT NULL COMMENT 'Conté la data de registre.',
  `client_CA_recomanació` int DEFAULT NULL COMMENT 'Conté l''id del client que li ha recomanat l''establiment (sempre i quan algú li hagi recomanat)',
  PRIMARY KEY (`client_CA_id`),
  KEY `client_CA_nom` (`client_CA_nom`),
  KEY `client_CA_cognom` (`client_CA_cognom`),
  KEY `client_CA_telèfon` (`client_CA_telèfon`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_ca`
--

LOCK TABLES `client_ca` WRITE;
/*!40000 ALTER TABLE `client_ca` DISABLE KEYS */;
INSERT INTO `client_ca` VALUES (1,'Marta','Luna','45612345','martacantaora@gmail.com','2013-06-18',2),(2,'Sara','De Montagut','45696352','HotelBalneari@gmail.com','2013-06-18',1),(3,'Xavi','Maymo','74185296','dahell@gmail.com','2014-02-16',1),(4,'Cinta','Soler','96385214','frotifroti@gmail.com','2016-12-26',NULL);
/*!40000 ALTER TABLE `client_ca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_ca_has_address`
--

DROP TABLE IF EXISTS `client_ca_has_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_ca_has_address` (
  `client_CA_has_address_id` int NOT NULL AUTO_INCREMENT COMMENT 'Conté l''id de cada adreça de cada client.',
  `Client_CA_client_CA_id` int NOT NULL COMMENT 'Conté l''id de cada client.',
  `Address_address_id` int NOT NULL COMMENT 'Conté l''id de cada adreça.',
  PRIMARY KEY (`client_CA_has_address_id`,`Client_CA_client_CA_id`),
  KEY `fk_client_CA_has_address_Client_CA1_idx` (`Client_CA_client_CA_id`),
  KEY `fk_client_CA_has_address_Address1_idx` (`Address_address_id`),
  CONSTRAINT `fk_client_CA_has_address_Address1` FOREIGN KEY (`Address_address_id`) REFERENCES `address` (`address_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_client_CA_has_address_Client_CA1` FOREIGN KEY (`Client_CA_client_CA_id`) REFERENCES `client_ca` (`client_CA_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_ca_has_address`
--

LOCK TABLES `client_ca_has_address` WRITE;
/*!40000 ALTER TABLE `client_ca_has_address` DISABLE KEYS */;
INSERT INTO `client_ca_has_address` VALUES (3,3,6),(2,2,7),(1,1,8),(4,4,9);
/*!40000 ALTER TABLE `client_ca_has_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `employee_id` int NOT NULL AUTO_INCREMENT COMMENT 'Conté l''id de cada empleat.',
  `employee_nom` varchar(15) NOT NULL COMMENT 'Conté el nom de cada empleat.',
  `employee_cognom` varchar(40) NOT NULL COMMENT 'Conté el cognom de cada empleat.',
  `employee_antiguitat` date NOT NULL COMMENT 'Conté la data d''incorporació a l''empresa de cada empleat.',
  PRIMARY KEY (`employee_id`),
  KEY `employee_antiguitat` (`employee_antiguitat`),
  KEY `employee_cognom` (`employee_cognom`),
  KEY `employee_nom` (`employee_nom`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Clarke','Griffin','2015-01-15'),(2,'Bellamy','Blake','2017-03-28'),(3,'Octavia','Blodreina','2010-07-11'),(4,'John ','Murphy','2011-06-06'),(5,'Raven','Reyes','2012-02-12');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glasses`
--

DROP TABLE IF EXISTS `glasses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glasses` (
  `glasses_id` int NOT NULL AUTO_INCREMENT COMMENT 'Conté l''id de cada ullera.',
  `glasses_graduació_esquerre` float NOT NULL COMMENT 'Conté la graduació del vidre esquerre de cada ullera.',
  `glasses_graduació_dret` float NOT NULL COMMENT 'Conté la graduació del vidre dret de cada ullera.',
  `glasses_tipus_montura` varchar(1) NOT NULL COMMENT 'Possibles Valors:\nF = flotant\nP = pasta\nM = Metàl·lica',
  `glasses_color_montura` varchar(15) NOT NULL COMMENT 'Conté el color de la montura de cada ullera.',
  `glasses_color_vidre_esquerre` varchar(1) NOT NULL COMMENT 'Possibles Valors:\nD = per defecte\nT = transparent\nV = verd\nB = blau\nG = gris\nM = marró',
  `glasses_color_vidre_dret` varchar(1) NOT NULL COMMENT 'Possibles Valors:\nD = per defecte\nT = transparent\nV = verd\nB = blau\nG = gris\nM = marró',
  `glasses_preu` float NOT NULL COMMENT 'Conté el preu cada ullera.',
  `Brand_brand_id` int NOT NULL COMMENT 'Conté l''id de la marca de cada ullera.',
  `Provider_provider_id` int NOT NULL COMMENT 'Conté l''id del proveïdor de cada ullera.',
  `Employee_employee_id` int NOT NULL COMMENT 'Conté l''id de l''empleat que ha venut cada ullera.',
  PRIMARY KEY (`glasses_id`),
  KEY `fk_Glasses_Employee1_idx` (`Employee_employee_id`),
  KEY `fk_Glasses_Brand1_idx` (`Brand_brand_id`),
  KEY `fk_Glasses_Provider1_idx` (`Provider_provider_id`),
  KEY `glasses_tipus_montura` (`glasses_tipus_montura`),
  KEY `glasses_color_montura` (`glasses_color_montura`),
  KEY `glasses_preu` (`glasses_preu`),
  CONSTRAINT `fk_Glasses_Brand1` FOREIGN KEY (`Brand_brand_id`) REFERENCES `brand` (`brand_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Glasses_Employee1` FOREIGN KEY (`Employee_employee_id`) REFERENCES `employee` (`employee_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Glasses_Provider1` FOREIGN KEY (`Provider_provider_id`) REFERENCES `provider` (`provider_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glasses`
--

LOCK TABLES `glasses` WRITE;
/*!40000 ALTER TABLE `glasses` DISABLE KEYS */;
INSERT INTO `glasses` VALUES (1,3.75,4,'F','Negre','T','T',150.25,2,2,4),(2,1.25,1.5,'P','Tortuga','M','M',109.95,4,2,3),(3,3.25,3.25,'P','Verd ','V','V',180.8,8,1,2),(4,4,4.5,'P','Corall','B','B',110.05,3,3,1),(5,2.25,2.5,'P','Verd','T','T',95.95,5,4,4),(6,1.75,2,'M','Platejat','D','D',75,7,1,5);
/*!40000 ALTER TABLE `glasses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provider`
--

DROP TABLE IF EXISTS `provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provider` (
  `provider_id` int NOT NULL AUTO_INCREMENT COMMENT 'Conté l''id de cada proveïdor.',
  `provider_nom` varchar(45) NOT NULL COMMENT 'Conté el nom de cada proveïdor.',
  `provider_telèfon` varchar(20) NOT NULL COMMENT 'Conté el telèfon de cada proveïdor.',
  `provider_fax` varchar(20) DEFAULT NULL COMMENT 'Conté el fax de cada proveïdor.',
  `provider_NIF` varchar(10) NOT NULL COMMENT 'Conté el NIF de cada proveïdor.',
  PRIMARY KEY (`provider_id`),
  UNIQUE KEY `provider_NIF_UNIQUE` (`provider_NIF`),
  KEY `provider_nom` (`provider_nom`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provider`
--

LOCK TABLES `provider` WRITE;
/*!40000 ALTER TABLE `provider` DISABLE KEYS */;
INSERT INTO `provider` VALUES (1,'UlleresMil','93145621','165165618','ABCMIL15'),(2,'UllMoSa','93781365','934894561','ULLMO256'),(3,'GlassesINTL','+44 0207 693 5423',NULL,'GBGLA5423'),(4,'Lunettes de Paris','+33 0207 055 2000',NULL,'FRLUPA846');
/*!40000 ALTER TABLE `provider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provider_has_address`
--

DROP TABLE IF EXISTS `provider_has_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provider_has_address` (
  `provider_has_address_id` int NOT NULL AUTO_INCREMENT COMMENT 'Conté l''id de cada adreça de cada proveïdor.',
  `Provider_provider_id` int NOT NULL COMMENT 'Conté l''id de cada proveïdor.',
  `Address_address_id` int NOT NULL COMMENT 'Conté l''id de cada adreça.',
  PRIMARY KEY (`provider_has_address_id`,`Provider_provider_id`),
  KEY `fk_provider_has_address_Provider1_idx` (`Provider_provider_id`),
  KEY `fk_provider_has_address_Address1_idx` (`Address_address_id`),
  CONSTRAINT `fk_provider_has_address_Address1` FOREIGN KEY (`Address_address_id`) REFERENCES `address` (`address_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_provider_has_address_Provider1` FOREIGN KEY (`Provider_provider_id`) REFERENCES `provider` (`provider_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provider_has_address`
--

LOCK TABLES `provider_has_address` WRITE;
/*!40000 ALTER TABLE `provider_has_address` DISABLE KEYS */;
INSERT INTO `provider_has_address` VALUES (4,4,1),(1,1,2),(3,3,3),(2,2,4);
/*!40000 ALTER TABLE `provider_has_address` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-15 19:52:48
