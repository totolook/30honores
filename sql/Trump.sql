CREATE DATABASE  IF NOT EXISTS `ecommercedb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `ecommercedb`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: ecommercedb
-- ------------------------------------------------------
-- Server version	5.7.19-log

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
-- Table structure for table `Barche`
--

DROP TABLE IF EXISTS `Barche`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Barche` (
  `tipo` varchar(45) NOT NULL,
  `lunghezza` float NOT NULL,
  `modello` varchar(45) NOT NULL,
  `zavorra` float NOT NULL,
  `prodotto` int(11) NOT NULL,
  PRIMARY KEY (`prodotto`),
  CONSTRAINT `fk_Barche_Prodotto1` FOREIGN KEY (`prodotto`) REFERENCES `Prodotti` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Barche`
--

LOCK TABLES `Barche` WRITE;
/*!40000 ALTER TABLE `Barche` DISABLE KEYS */;
INSERT INTO `Barche` VALUES ('Motoscafo',8,'Yamaha',12,1),('Crociera',200,'Mercury',40,2),('Motoscafo',14,'Honda',14,3),('Yacht',80,'Honda',20,4),('Gommone',4,'Remi',4,5),('Peschereccio',40,'Yamaha',17,6),('Peschereccio',30,'Honda',18,7),('Yacht',35,'Mercury',19,8),('Petroliera',500,'Honda',50,9),('Yacht',40,'Yamaha',16,10),('Veliero',300,'Vela',35,11),('Crociera',400,'Mercury',50,12),('Yacht',25,'Honda',15,13),('Peschereccio',38,'Yamaha',20,14);
/*!40000 ALTER TABLE `Barche` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Carrelli`
--

DROP TABLE IF EXISTS `Carrelli`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Carrelli` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data` date NOT NULL,
  `utente` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Carrello_Utente_idx` (`utente`),
  CONSTRAINT `fk_Carrello_Utente` FOREIGN KEY (`utente`) REFERENCES `Utenti` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Carrelli`
--

LOCK TABLES `Carrelli` WRITE;
/*!40000 ALTER TABLE `Carrelli` DISABLE KEYS */;
INSERT INTO `Carrelli` VALUES (1,'2017-08-20',1),(2,'2017-08-21',1),(3,'2017-08-21',2),(4,'2017-08-21',2);
/*!40000 ALTER TABLE `Carrelli` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Keywords`
--

DROP TABLE IF EXISTS `Keywords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Keywords` (
  `id` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Keywords`
--

LOCK TABLES `Keywords` WRITE;
/*!40000 ALTER TABLE `Keywords` DISABLE KEYS */;
INSERT INTO `Keywords` VALUES (1,'Barca'),(2,'Motoscafo'),(3,'Gommone'),(4,'Aliscafo'),(5,'Yacht'),(6,'Peschereccio'),(7,'Yamaha'),(8,'Honda'),(9,'Mercury'),(10,'Letti'),(11,'Cucina'),(12,'Pesca'),(13,'Motore'),(14,'Remi'),(15,'Vela'),(16,'Legno'),(17,'Vetroresina'),(18,'Metallo'),(19,'Oro');
/*!40000 ALTER TABLE `Keywords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Keywords_has_Multimedia`
--

DROP TABLE IF EXISTS `Keywords_has_Multimedia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Keywords_has_Multimedia` (
  `keyword` int(11) NOT NULL,
  `Multimedia` int(11) NOT NULL,
  PRIMARY KEY (`keyword`,`Multimedia`),
  KEY `fk_Keywords_has_Multimedia_Multimedia1_idx` (`Multimedia`),
  KEY `fk_Keywords_has_Multimedia_Keywords1_idx` (`keyword`),
  CONSTRAINT `fk_Keywords_has_Multimedia_Keywords1` FOREIGN KEY (`keyword`) REFERENCES `Keywords` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_Keywords_has_Multimedia_Multimedia1` FOREIGN KEY (`Multimedia`) REFERENCES `Multimedia` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Keywords_has_Multimedia`
--

LOCK TABLES `Keywords_has_Multimedia` WRITE;
/*!40000 ALTER TABLE `Keywords_has_Multimedia` DISABLE KEYS */;
/*!40000 ALTER TABLE `Keywords_has_Multimedia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Magazzini`
--

DROP TABLE IF EXISTS `Magazzini`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Magazzini` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sede` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Magazzini_Sedi1_idx` (`sede`),
  CONSTRAINT `fk_Magazzini_Sedi1` FOREIGN KEY (`sede`) REFERENCES `Sedi` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Magazzini`
--

LOCK TABLES `Magazzini` WRITE;
/*!40000 ALTER TABLE `Magazzini` DISABLE KEYS */;
INSERT INTO `Magazzini` VALUES (1,1),(2,2),(3,3);
/*!40000 ALTER TABLE `Magazzini` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Multimedia`
--

DROP TABLE IF EXISTS `Multimedia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Multimedia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pathname` varchar(100) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `descrizione` text,
  `prodotto` int(11) NOT NULL,
  `tipo` tinyint(4) NOT NULL,
  `Multimedia` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Multimedia_Prodotto1_idx` (`prodotto`),
  KEY `fk_Multimedia_Multimedia1_idx` (`Multimedia`),
  CONSTRAINT `fk_Multimedia_Multimedia1` FOREIGN KEY (`Multimedia`) REFERENCES `Multimedia` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_Multimedia_Prodotto1` FOREIGN KEY (`prodotto`) REFERENCES `Prodotti` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Multimedia`
--

LOCK TABLES `Multimedia` WRITE;
/*!40000 ALTER TABLE `Multimedia` DISABLE KEYS */;
INSERT INTO `Multimedia` VALUES (1,'/boatAPI/models/1.zip','1.zip',NULL,1,0,NULL),(2,'/boatAPI/images/2.jpg','2.jpg',NULL,1,1,1),(3,'/boatAPI/models/3.zip','3.zip',NULL,2,0,NULL),(4,'/boatAPI/images/4.jpg','4.jpg',NULL,2,1,3),(5,'/boatAPI/models/5.zip','5.zip',NULL,3,0,NULL),(6,'/boatAPI/images/6.jpg','6.jpg',NULL,3,1,5),(7,'/boatAPI/models/7.zip','7.zip',NULL,4,0,NULL),(8,'/boatAPI/images/8.jpg','8.jpg',NULL,4,1,7),(9,'/boatAPI/models/9.zip','9.zip',NULL,5,0,NULL),(10,'/boatAPI/images/10.jpg','10.jpg',NULL,5,1,9),(11,'/boatAPI/models/11.zip','11.zip',NULL,6,0,NULL),(12,'/boatAPI/images/12.jpg','12.jpg',NULL,6,1,11),(13,'/boatAPI/models/13.zip','13.zip',NULL,7,0,NULL),(14,'/boatAPI/images/14.jpg','14.jpg',NULL,7,1,13),(15,'/boatAPI/models/15.zip','15.zip',NULL,8,0,NULL),(16,'/boatAPI/images/16.jpg','16.jpg',NULL,8,1,15),(17,'/boatAPI/models/17.zip','17.zip',NULL,9,0,NULL),(18,'/boatAPI/images/18.jpg','18.jpg',NULL,9,1,17),(19,'/boatAPI/models/19.zip','19.zip',NULL,10,0,NULL),(20,'/boatAPI/images/20.jpg','20.jpg',NULL,10,1,19),(21,'/boatAPI/models/21.zip','21.zip',NULL,11,0,NULL),(22,'/boatAPI/images/22.jpg','22.jpg',NULL,11,1,21),(23,'/boatAPI/models/23.zip','23.zip',NULL,12,0,NULL),(24,'/boatAPI/images/24.jpg','24.jpg',NULL,12,1,23),(25,'/boatAPI/models/25.zip','25.zip',NULL,13,0,NULL),(26,'/boatAPI/images/26.jpg','26.jpg',NULL,13,1,25),(27,'/boatAPI/models/27.zip','27.zip',NULL,14,0,NULL),(28,'/boatAPI/images/28.jpg','28.jpg',NULL,14,1,27);
/*!40000 ALTER TABLE `Multimedia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Prodotti`
--

DROP TABLE IF EXISTS `Prodotti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Prodotti` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `descrizione` varchar(45) DEFAULT NULL,
  `prezzo` float NOT NULL,
  `magazzino` int(11) DEFAULT NULL,
  `quantita` int(11) NOT NULL,
  `sconto` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_Prodotto_Magazzini1_idx` (`magazzino`),
  CONSTRAINT `fk_Prodotto_Magazzini1` FOREIGN KEY (`magazzino`) REFERENCES `Magazzini` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Prodotti`
--

LOCK TABLES `Prodotti` WRITE;
/*!40000 ALTER TABLE `Prodotti` DISABLE KEYS */;
INSERT INTO `Prodotti` VALUES (1,'Vento blu',NULL,120000,2,-288,2),(2,'Olimpia',NULL,1000000,1,-135,3),(3,'Wave dancer',NULL,200000,2,-288,4),(4,'Antares',NULL,500000,2,-133,5),(5,'Va lentina',NULL,3000,3,-43,6),(6,'Ma remma',NULL,18000,3,20,7),(7,'Davy',NULL,22000,3,20,8),(8,'Helga',NULL,180000,2,20,9),(9,'Le vagabond',NULL,600000,1,20,10),(10,'Blue moon',NULL,240000,2,-133,11),(11,'La perla nera',NULL,450000,1,20,12),(12,'Alejandra',NULL,2000000,1,20,13),(13,'Blume',NULL,160000,2,20,14),(14,'Saint lidia II',NULL,30000,3,20,15);
/*!40000 ALTER TABLE `Prodotti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Prodotti_has_Carrelli`
--

DROP TABLE IF EXISTS `Prodotti_has_Carrelli`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Prodotti_has_Carrelli` (
  `prodotto` int(11) NOT NULL,
  `carrello` int(11) NOT NULL,
  PRIMARY KEY (`prodotto`,`carrello`),
  KEY `fk_Prodotto_has_Carrello_Carrello1_idx` (`carrello`),
  KEY `fk_Prodotto_has_Carrello_Prodotto1_idx` (`prodotto`),
  CONSTRAINT `fk_Prodotto_has_Carrello_Carrello1` FOREIGN KEY (`carrello`) REFERENCES `Carrelli` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Prodotto_has_Carrello_Prodotto1` FOREIGN KEY (`prodotto`) REFERENCES `Prodotti` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Prodotti_has_Carrelli`
--

LOCK TABLES `Prodotti_has_Carrelli` WRITE;
/*!40000 ALTER TABLE `Prodotti_has_Carrelli` DISABLE KEYS */;
INSERT INTO `Prodotti_has_Carrelli` VALUES (1,1),(2,1),(3,1),(4,1),(1,2),(3,2),(10,2),(5,3),(1,4),(2,4),(3,4);
/*!40000 ALTER TABLE `Prodotti_has_Carrelli` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;

/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Sedi`
--

DROP TABLE IF EXISTS `Sedi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Sedi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `via` varchar(45) NOT NULL,
  `citta` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sedi`
--

LOCK TABLES `Sedi` WRITE;
/*!40000 ALTER TABLE `Sedi` DISABLE KEYS */;
INSERT INTO `Sedi` VALUES (1,'Amedeo Modigliani','Toronto'),(2,'Nuova Agnano','Messico'),(3,'Calata porta di massa','Napoli');
/*!40000 ALTER TABLE `Sedi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Utenti`
--

DROP TABLE IF EXISTS `Utenti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Utenti` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `cognome` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Utenti`
--

LOCK TABLES `Utenti` WRITE;
/*!40000 ALTER TABLE `Utenti` DISABLE KEYS */;
INSERT INTO `Utenti` VALUES (1,'pwd0','ric.carbone@foo.it','riccardo','carbone'),(2,'pwd1','an.bellizzi@foo.it','andrea','bellizzi'),(3,'pwd2','an.digiovanni@foo.it','antonio','di giovanni'),(4,'pwd3','r.canonic@foo.it','roberto','canonico'),(5,'1','1','1','1');
/*!40000 ALTER TABLE `Utenti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'ecommercedb'
--

--
-- Dumping routines for database 'ecommercedb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-08-27 23:44:11
