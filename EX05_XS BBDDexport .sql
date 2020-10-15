-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: m02ex01_modelatge_bbdd_xs
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
-- Table structure for table `friendship`
--

DROP TABLE IF EXISTS `friendship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `friendship` (
  `friendship_id` int NOT NULL AUTO_INCREMENT COMMENT 'Conté el número de registre de cada amistat.',
  `User_xs_user_xs_id2` int NOT NULL,
  `User_xs_user_xs_id` int NOT NULL,
  `Relationship_relationship_id` int NOT NULL,
  PRIMARY KEY (`friendship_id`),
  KEY `fk_Friendship_User_xs1_idx` (`User_xs_user_xs_id2`),
  KEY `fk_Friendship_User_xs2_idx` (`User_xs_user_xs_id`),
  KEY `fk_Friendship_Relationship1_idx` (`Relationship_relationship_id`),
  CONSTRAINT `fk_Friendship_Relationship1` FOREIGN KEY (`Relationship_relationship_id`) REFERENCES `relationship` (`relationship_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Friendship_User_xs1` FOREIGN KEY (`User_xs_user_xs_id2`) REFERENCES `user_xs` (`user_xs_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Friendship_User_xs2` FOREIGN KEY (`User_xs_user_xs_id`) REFERENCES `user_xs` (`user_xs_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friendship`
--

LOCK TABLES `friendship` WRITE;
/*!40000 ALTER TABLE `friendship` DISABLE KEYS */;
INSERT INTO `friendship` VALUES (1,0,1,6),(2,0,2,6),(3,0,2,7),(4,0,2,9),(5,0,1,7),(6,0,1,11),(7,0,3,8);
/*!40000 ALTER TABLE `friendship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photo`
--

DROP TABLE IF EXISTS `photo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `photo` (
  `photo_id` int NOT NULL AUTO_INCREMENT COMMENT 'Conté el número de registre de cada foto.',
  `photo_lloc` varchar(40) DEFAULT NULL COMMENT 'Adreça de la foto. Es pot deixar en blanc. ',
  `photo_url_foto` varchar(45) NOT NULL COMMENT 'Url d''on està emmagatzemada la foto. Serà un link acabat en .img',
  `photo_descripció` varchar(2000) DEFAULT NULL COMMENT 'Descripció o comentari de la foto.',
  `User_xs_user_xs_id` int NOT NULL,
  PRIMARY KEY (`photo_id`),
  UNIQUE KEY `photo_url_foto_UNIQUE` (`photo_url_foto`),
  KEY `fk_Photo_User_xs1_idx` (`User_xs_user_xs_id`),
  CONSTRAINT `fk_Photo_User_xs1` FOREIGN KEY (`User_xs_user_xs_id`) REFERENCES `user_xs` (`user_xs_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photo`
--

LOCK TABLES `photo` WRITE;
/*!40000 ALTER TABLE `photo` DISABLE KEYS */;
INSERT INTO `photo` VALUES (1,'Búnquers','http://xs.cat/foto_id=fwX2sq68Ff','Escoltant la vida des de les altures',4),(2,'Estudi de gravació','http://xs.cat/foto_id=MNh7YWzbKO','Us presento la meva nova cançó \"Un juliol per no oblidar\"',1),(3,'Ribes de Freser','http://xs.cat/foto_id=0msq1z6kHx','L\'hotel comença a agafar els colors de tardor',3),(4,'Estadi Laykers','http://xs.cat/foto_id=z57zcM3hR6','Partidàs inolblidable - En Kobe estaría orgullós',2),(5,'Estudi de gravació ','http://xs.cat/foto_id=fTsrx2fDRq','Nova versió de \"Vestida de nit\"',1);
/*!40000 ALTER TABLE `photo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relationship`
--

DROP TABLE IF EXISTS `relationship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `relationship` (
  `relationship_id` int NOT NULL AUTO_INCREMENT COMMENT 'Conté el número de registre de cada relació.',
  `relationship_nom` varchar(15) NOT NULL COMMENT 'Nom de cada tipus de relació. No pot estar en blanc.',
  PRIMARY KEY (`relationship_id`),
  UNIQUE KEY `relationship_nom_UNIQUE` (`relationship_nom`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relationship`
--

LOCK TABLES `relationship` WRITE;
/*!40000 ALTER TABLE `relationship` DISABLE KEYS */;
INSERT INTO `relationship` VALUES (10,'altres'),(7,'amistat'),(6,'familiars'),(8,'hobby'),(9,'parella'),(5,'professió'),(11,'universitat');
/*!40000 ALTER TABLE `relationship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_xs`
--

DROP TABLE IF EXISTS `user_xs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_xs` (
  `user_xs_id` int NOT NULL AUTO_INCREMENT COMMENT 'Conté el número de registre de cada usuari.',
  `user_xs_nom` varchar(25) NOT NULL COMMENT 'Conté el nom de cada usuari. Valor únic per no confondre usuaris.',
  `user_xs_mail` varchar(35) NOT NULL COMMENT 'Conté el mail de cada usuari. Valor únic per no confondre usuaris.',
  `user_xs_contrassenya` varchar(20) NOT NULL COMMENT 'Conté la contrassenya de cada usuari. ',
  PRIMARY KEY (`user_xs_id`),
  UNIQUE KEY `user_xs_mail_UNIQUE` (`user_xs_mail`),
  UNIQUE KEY `user_xs_nom_UNIQUE` (`user_xs_nom`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_xs`
--

LOCK TABLES `user_xs` WRITE;
/*!40000 ALTER TABLE `user_xs` DISABLE KEYS */;
INSERT INTO `user_xs` VALUES (1,'ele.de.luna','marta@gmail.com','Lun4'),(2,'DaHell','xavi@gmail.com','D4H3LL'),(3,'SaraDeMontagut','hotelmontagut@gmail.com','Rib3S'),(4,'ximixurri','albert@gmail.com','Mus1C');
/*!40000 ALTER TABLE `user_xs` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-15 19:52:21
