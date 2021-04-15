-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: quisimagna
-- ------------------------------------------------------
-- Server version	5.7.22-log

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
-- Table structure for table `associata`
--

DROP TABLE IF EXISTS `associata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `associata` (
  `prenotazione` int(11) NOT NULL,
  `tavolo` int(11) NOT NULL,
  PRIMARY KEY (`prenotazione`,`tavolo`),
  KEY `tavolo` (`tavolo`),
  CONSTRAINT `associata_ibfk_1` FOREIGN KEY (`prenotazione`) REFERENCES `prenotazione` (`id_prenotazione`),
  CONSTRAINT `associata_ibfk_2` FOREIGN KEY (`tavolo`) REFERENCES `tavolo` (`id_tavolo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `associata`
--

LOCK TABLES `associata` WRITE;
/*!40000 ALTER TABLE `associata` DISABLE KEYS */;
/*!40000 ALTER TABLE `associata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `codfisc` char(16) NOT NULL,
  `cognome` varchar(20) DEFAULT NULL,
  `nome` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`codfisc`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `composto`
--

DROP TABLE IF EXISTS `composto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `composto` (
  `piatto` varchar(50) NOT NULL,
  `ingrediente` int(11) NOT NULL,
  `quantita` double NOT NULL,
  PRIMARY KEY (`piatto`,`ingrediente`,`quantita`),
  KEY `ingrediente` (`ingrediente`),
  CONSTRAINT `composto_ibfk_1` FOREIGN KEY (`piatto`) REFERENCES `piatto` (`nome`),
  CONSTRAINT `composto_ibfk_2` FOREIGN KEY (`ingrediente`) REFERENCES `ingrediente` (`codice`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `composto`
--

LOCK TABLES `composto` WRITE;
/*!40000 ALTER TABLE `composto` DISABLE KEYS */;
INSERT INTO `composto` VALUES ('Margherita',1,0.2),('Margherita',3,0.1),('Mediterraneo',3,0.2),('Salumi grande',3,0.2),('Salumi medio',3,0.2),('Salumi piccolo',3,0.2),('Margherita',4,0.1),('Mediterraneo',4,0.2),('Salumi grande',5,1),('Salumi medio',5,0.7),('Salumi piccolo',5,0.5),('Misto GlutenFree',6,0.1),('Salumi grande',8,1),('Salumi medio',8,0.7),('Salumi piccolo',8,0.5),('Misto GlutenFree',9,0.1),('Insalatina NoLat',12,0.5),('Mediterraneo',12,0.5),('Misto Vegano',12,0.5),('Misto GlutenFree',14,0.1),('Misto Vegano',15,0.2),('Insalatina NoLat',16,0.2),('Insalatina NoLat',17,0.1),('Misto Vegano',17,0.1),('Misto Vegetariano',17,0.1),('Misto Vegetariano',19,0.2),('Misto Vegetariano',21,0.1),('Acqua 0.5L',27,1),('Acqua 1L',28,1),('Coca Cola 1L',29,1),('Sprite 1L',30,1),('Aranciata 1L',31,1),('Chinotto 1L',32,1);
/*!40000 ALTER TABLE `composto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingrediente`
--

DROP TABLE IF EXISTS `ingrediente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ingrediente` (
  `codice` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `qta_disp` double NOT NULL,
  `qta_min` double NOT NULL,
  `misura` varchar(20) NOT NULL,
  PRIMARY KEY (`codice`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingrediente`
--

LOCK TABLES `ingrediente` WRITE;
/*!40000 ALTER TABLE `ingrediente` DISABLE KEYS */;
INSERT INTO `ingrediente` VALUES (1,'Farina',5,3,'kg'),(2,'Farina senza glutine',5,3,'kg'),(3,'Mozzarella',5,3,'kg'),(4,'Pomodoro',5,3,'kg'),(5,'Prosciutto cotto',15,10,'etti'),(6,'Prosciutto cotto GlutenFree',15,10,'etti'),(7,'Funghi',5,3,'kg'),(8,'Salame',15,10,'etti'),(9,'Uova',60,30,'pezzi'),(10,'Salsiccia',5,3,'kg'),(11,'Patatine',3,2,'kg'),(12,'Scamorza',10,8,'kg'),(13,'Rucola',8,6,'etti'),(14,'Carote',3,2,'kg'),(15,'Cipolla',5,3,'kg'),(16,'Mozzarella vegana',8,6,'kg'),(17,'Formaggio senza lattosio',4,3,'kg'),(18,'Piselli',3,2,'kg'),(19,'Curry',3,2,'kg'),(20,'Melanzane',5,3,'kg'),(21,'Polpette',3,2,'kg'),(22,'Asparagi',2,1,'kg'),(23,'Pere',2,1,'kg'),(24,'Mele',2,1,'kg'),(25,'Zucchine',4,3,'kg'),(26,'Radicchio',3,2,'kg'),(27,'Acqua 0.5L',100,50,'pezzi'),(28,'Acqua 1L',100,50,'pezzi'),(29,'Coca Cola 1L',60,50,'pezzi'),(30,'Aranciata 1L',60,50,'pezzi'),(31,'Sprite 1L',60,50,'pezzi'),(32,'Chinotto 1L',60,50,'pezzi');
/*!40000 ALTER TABLE `ingrediente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `id_menu` int(11) NOT NULL AUTO_INCREMENT,
  `tipologia` varchar(50) NOT NULL,
  PRIMARY KEY (`id_menu`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'Classico'),(2,'Vegano'),(3,'Vegetariano'),(4,'Intolleranti al lattosio'),(5,'Per Celiaci');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordinazione`
--

DROP TABLE IF EXISTS `ordinazione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ordinazione` (
  `prenotazione` int(11) NOT NULL,
  `piatto` varchar(50) NOT NULL,
  `quantita` int(11) NOT NULL,
  PRIMARY KEY (`prenotazione`,`piatto`,`quantita`),
  KEY `piatto` (`piatto`),
  CONSTRAINT `ordinazione_ibfk_1` FOREIGN KEY (`prenotazione`) REFERENCES `prenotazione` (`id_prenotazione`),
  CONSTRAINT `ordinazione_ibfk_2` FOREIGN KEY (`piatto`) REFERENCES `piatto` (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordinazione`
--

LOCK TABLES `ordinazione` WRITE;
/*!40000 ALTER TABLE `ordinazione` DISABLE KEYS */;
/*!40000 ALTER TABLE `ordinazione` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `quisimagna`.`ordinazione_AFTER_INSERT` AFTER INSERT ON `ordinazione` FOR EACH ROW
BEGIN
	declare costo1 real;
    declare nuovopiatto varchar(50);
    declare nuovaprenotazione integer;
    declare nuovaquantita real;
    declare quantitaconsumata integer;
    declare idingrediente integer;
    
    set nuovopiatto = new.piatto;
    set nuovaprenotazione = new.prenotazione;
	set nuovaquantita = new.quantita;
    
	select costo
	from piatto
	where piatto.nome = nuovopiatto
	into costo1;
	
	update prenotazione 
	set costo_totale = costo_totale + costo1*nuovaquantita
	where id_prenotazione=nuovaprenotazione;
    
    
    BEGIN
    DECLARE finished INTEGER DEFAULT 0;
    declare quantita2 real;
    declare idingrediente2 integer;
    
    DECLARE cur1 CURSOR FOR select quantita, codice from tutto where nome = nuovopiatto;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;
	OPEN cur1;
	
    prova: loop
		FETCH cur1 INTO quantita2,idingrediente2;
		update ingrediente 
		set qta_disp = qta_disp - quantita2*nuovaquantita
		where codice = idingrediente2;
        IF finished = 1 THEN 
			LEAVE prova;
		END IF;
    end loop prova;
    close cur1;
	END;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `piatto`
--

DROP TABLE IF EXISTS `piatto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `piatto` (
  `nome` varchar(50) NOT NULL,
  `costo` double NOT NULL,
  `tipologia` varchar(20) NOT NULL,
  `menu` int(11) NOT NULL,
  PRIMARY KEY (`nome`),
  KEY `menu` (`menu`),
  CONSTRAINT `piatto_ibfk_1` FOREIGN KEY (`menu`) REFERENCES `menu` (`id_menu`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `piatto`
--

LOCK TABLES `piatto` WRITE;
/*!40000 ALTER TABLE `piatto` DISABLE KEYS */;
INSERT INTO `piatto` VALUES ('Acqua 0.5L',1,'Bevanda',1),('Acqua 1L',2,'Bevanda',1),('Amaro',3,'Bevanda',1),('Aranciata 1L',3,'Bevanda',1),('Caffè',2,'Bevanda',1),('Chinotto 1L',3,'Bevanda',1),('Coca Cola 1L',3,'Bevanda',1),('Crazy Cake',4,'Dolce',4),('Farfalle al Salmone',10,'Primo',1),('Farinate con Asparagi',11,'Secondo',5),('Frittata Piselli e Curry',12,'Secondo',2),('Fusilli con Radicchio',11,'Primo',3),('GlutenFree',7,'Pizza',5),('Grigliata Mista',10,'Secondo',1),('Insalatina NoLat',9,'Antipasto',4),('Margherita',5,'Pizza',1),('Mediterraneo',10,'Antipasto',1),('Misto GlutenFree',11,'Antipasto',5),('Misto vegano',12,'Antipasto',2),('Misto vegetariano',11,'Antipasto',3),('Olio e Pomodoro',7,'Pizza',4),('Parmigiana di Melanzane',11,'Secondo',3),('Pasta Zucchine e Gamberetti',9,'Primo',4),('Polpette al limone',9,'Secondo',4),('Salumi grande',10,'Antipasto',1),('Salumi medio',7,'Antipasto',1),('Salumi piccolo',5,'Antipasto',1),('Spaghetti di Zucchine',12,'Primo',2),('Sprite 1L',3,'Bevanda',1),('Sufflè Vegano',5,'Dolce',2),('Tagliatelle con Zucchine',11,'Primo',5),('Tiramisù',4,'Dolce',1),('Torta di Mele senza glutine',5,'Dolce',5),('Torta di Pere',4,'Dolce',3),('VeganPizza',7,'Pizza',2),('Vegetariana',6,'Pizza',3);
/*!40000 ALTER TABLE `piatto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prenotazione`
--

DROP TABLE IF EXISTS `prenotazione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prenotazione` (
  `id_prenotazione` int(11) NOT NULL AUTO_INCREMENT,
  `data_evento` varchar(20) NOT NULL,
  `ora_evento` varchar(20) NOT NULL,
  `costo_totale` double DEFAULT '0',
  `n_persone` int(11) NOT NULL,
  `note` varchar(50) DEFAULT NULL,
  `cliente` char(16) NOT NULL,
  PRIMARY KEY (`id_prenotazione`),
  KEY `cliente` (`cliente`),
  CONSTRAINT `prenotazione_ibfk_1` FOREIGN KEY (`cliente`) REFERENCES `cliente` (`codfisc`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prenotazione`
--

LOCK TABLES `prenotazione` WRITE;
/*!40000 ALTER TABLE `prenotazione` DISABLE KEYS */;
/*!40000 ALTER TABLE `prenotazione` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `quisimagna`.`prenotazione_BEFORE_INSERT` BEFORE INSERT ON `prenotazione` FOR EACH ROW
BEGIN
declare fiscale char(16);

  SET fiscale = IF(EXISTS( select codfisc from cliente, prenotazione where codfisc=cliente and codfisc = new.cliente), null, new.cliente);
  
    if fiscale is not null then
    insert into cliente(codfisc) values (fiscale);
        
    end if;    
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `quisimagna`.`prenotazione_AFTER_INSERT` AFTER INSERT ON `prenotazione` FOR EACH ROW
BEGIN
declare posti1 integer;
declare tavolo1 integer;

set posti1 = new.n_persone;

while posti1>0 do
	select id_tavolo
	from tavolo
	where occupazione=false
    
    limit 1
    into tavolo1;
    
    set posti1=posti1- 6;
    insert into associata values (new.id_prenotazione, tavolo1);
    update tavolo set occupazione = true where id_tavolo = tavolo1;
end while;    
 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tavolo`
--

DROP TABLE IF EXISTS `tavolo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tavolo` (
  `id_tavolo` int(11) NOT NULL,
  `posizione` varchar(20) NOT NULL,
  `n_posti` int(11) NOT NULL,
  `occupazione` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id_tavolo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tavolo`
--

LOCK TABLES `tavolo` WRITE;
/*!40000 ALTER TABLE `tavolo` DISABLE KEYS */;
INSERT INTO `tavolo` VALUES (1,'Interno',6,0),(2,'Interno',6,0),(3,'Interno',6,0),(4,'Interno',6,0),(5,'Interno',6,0),(6,'Esterno',6,0),(7,'Esterno',6,0),(8,'Esterno',6,0),(9,'Esterno',6,0),(10,'Esterno',6,0);
/*!40000 ALTER TABLE `tavolo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `tutto`
--

DROP TABLE IF EXISTS `tutto`;
/*!50001 DROP VIEW IF EXISTS `tutto`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `tutto` AS SELECT 
 1 AS `quantita`,
 1 AS `costo`,
 1 AS `codice`,
 1 AS `ingrediente`,
 1 AS `nome`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `tutto`
--

/*!50001 DROP VIEW IF EXISTS `tutto`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `tutto` AS select `composto`.`quantita` AS `quantita`,`piatto`.`costo` AS `costo`,`ingrediente`.`codice` AS `codice`,`ingrediente`.`nome` AS `ingrediente`,`piatto`.`nome` AS `nome` from ((`ingrediente` join `composto`) join `piatto`) where ((1 = 1) and (`piatto`.`nome` = `composto`.`piatto`) and (`ingrediente`.`codice` = `composto`.`ingrediente`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-07-24 20:57:19
