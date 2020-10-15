-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: m02ex01_modelatge_bbdd_stube
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
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT COMMENT 'L''id del registre',
  `user_email` varchar(40) NOT NULL COMMENT 'L''email de cada usuari. Ha de ser únic.',
  `user_contrassenya` varchar(20) NOT NULL COMMENT 'La contrassenya de cada usuari. Ha de ser única (faltaria saber com posar un nombre mínim de caràcters).',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_email_UNIQUE` (`user_email`),
  UNIQUE KEY `user_contrassenya_UNIQUE` (`user_contrassenya`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'bruce.springsteen@theboss.com','Th3Bo55'),(2,'luke.spiller@thestruts.com','Strut5'),(3,'brandon.urie@panicatthedisco.com','P4N1C'),(4,'lluis.gavalda@elspets.cat','L3SLLUF3S');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video`
--

DROP TABLE IF EXISTS `video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `video` (
  `video_id` int NOT NULL AUTO_INCREMENT COMMENT 'L''id del registre',
  `video_descripció` varchar(2000) NOT NULL COMMENT 'Descripció de cada vídeo. Màxim 2.000 caràcters.',
  `video_títol` varchar(80) NOT NULL COMMENT 'Títol del vídeo. Màxim 80 caràcters. ',
  `video_url` varchar(60) NOT NULL COMMENT 'Url de cada vídeo. Serà la suma de la URL de la web Stube+l''identificador únic de cada vídeo. ',
  `video_identificador` varchar(20) NOT NULL COMMENT 'Identificador únic de cada vídeo. L''unirem al final de la URL de la web Stube per formar la URL única de cada vídeo. ',
  `User_user_id` int NOT NULL,
  PRIMARY KEY (`video_id`),
  UNIQUE KEY `video_identificador_UNIQUE` (`video_identificador`),
  KEY `video_títol` (`video_títol`),
  KEY `fk_Video_User1_idx` (`User_user_id`),
  CONSTRAINT `fk_Video_User1` FOREIGN KEY (`User_user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video`
--

LOCK TABLES `video` WRITE;
/*!40000 ALTER TABLE `video` DISABLE KEYS */;
INSERT INTO `video` VALUES (1,'Actuació en directe el 1999 d\'Els Pets al poble espanyol','Els Pets al poble espanyol 1999 - Actuació sencera','https://www.stube.com/watch?v=QZnBUzdhay','QZnBUzdhay',4),(2,'Listen to the latest release from Bruce Springsteen','Bruce Springsteen - Ghosts','https://www.stube.com/watch?v=Rl35cCLivq','Rl35cCLivq',1),(3,'The Struts tell us how they used the lockdown to create their latest album.','The Struts - New album \"Strange Days\" coming soon - 1st Teaser','https://www.stube.com/watch?v=KLqMbHyuFm','KLqMbHyuFm',2),(4,'Brandon Urie participated in the Book of Mormon\'s performance at the Oscars 2019.','Brandon Urie\'s performance in the Book of Mormon - The Oscars 2019','https://www.stube.com/watch?v=9n1kfwiH9g','9n1kfwiH9g',3),(5,'Cançó de l\'àlbum Respira','Un món, dues classes de persones - Els Pets','https://www.stube.com/watch?v=V2TVnD6fo3','V2TVnD6fo3',4);
/*!40000 ALTER TABLE `video` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-15 19:51:28
