-- MariaDB dump 10.19-11.3.2-MariaDB, for osx10.19 (x86_64)
--
-- Host: localhost    Database: tifosi
-- ------------------------------------------------------
-- Server version	11.3.2-MariaDB

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
-- Current Database: `tifosi`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `tifosi` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `tifosi`;

--
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brands` (
  `id_brand` int(11) NOT NULL AUTO_INCREMENT,
  `name_brand` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_brand`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brands`
--

LOCK TABLES `brands` WRITE;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
INSERT INTO `brands` VALUES
(1,'Coca-cola'),
(2,'Cristalline'),
(3,'Monster'),
(4,'Pepsico');
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers` (
  `id_customer` int(11) NOT NULL AUTO_INCREMENT,
  `name_customer` varchar(45) NOT NULL,
  `age` int(11) DEFAULT NULL,
  `cp_customer` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_customer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers_focaccia`
--

DROP TABLE IF EXISTS `customers_focaccia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers_focaccia` (
  `customer_id` int(11) NOT NULL,
  `focaccia_id` int(11) NOT NULL,
  `day` date NOT NULL,
  PRIMARY KEY (`customer_id`,`focaccia_id`),
  UNIQUE KEY `customer_id` (`customer_id`,`focaccia_id`),
  KEY `fk_customers_focaccia_2` (`focaccia_id`),
  CONSTRAINT `fk_customers_focaccia_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id_customer`) ON DELETE CASCADE,
  CONSTRAINT `fk_customers_focaccia_2` FOREIGN KEY (`focaccia_id`) REFERENCES `focaccia` (`id_focaccia`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers_focaccia`
--

LOCK TABLES `customers_focaccia` WRITE;
/*!40000 ALTER TABLE `customers_focaccia` DISABLE KEYS */;
/*!40000 ALTER TABLE `customers_focaccia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers_menus`
--

DROP TABLE IF EXISTS `customers_menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers_menus` (
  `customer_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `day` date NOT NULL,
  PRIMARY KEY (`customer_id`,`menu_id`),
  UNIQUE KEY `customer_id` (`customer_id`,`menu_id`),
  KEY `fk_customers_menus_2` (`menu_id`),
  CONSTRAINT `fk_customers_menus_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id_customer`) ON DELETE CASCADE,
  CONSTRAINT `fk_customers_menus_2` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id_menu`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers_menus`
--

LOCK TABLES `customers_menus` WRITE;
/*!40000 ALTER TABLE `customers_menus` DISABLE KEYS */;
/*!40000 ALTER TABLE `customers_menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drinks`
--

DROP TABLE IF EXISTS `drinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drinks` (
  `id_drink` int(11) NOT NULL AUTO_INCREMENT,
  `name_drink` varchar(45) DEFAULT NULL,
  `brand_id` int(11) NOT NULL,
  PRIMARY KEY (`id_drink`),
  KEY `fk_drinks_brands` (`brand_id`),
  CONSTRAINT `fk_drinks_brands` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id_brand`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drinks`
--

LOCK TABLES `drinks` WRITE;
/*!40000 ALTER TABLE `drinks` DISABLE KEYS */;
INSERT INTO `drinks` VALUES
(1,'Coca-cola zéro',1),
(2,'Coca-cola original',1),
(3,'Fanta citron',1),
(4,'Fanta orange',1),
(5,'Capri-sun',1),
(6,'Pepsi',4),
(7,'Pepsi Max Zéro',4),
(8,'Lipton zéro citron',4),
(9,'Lipton Peach',4),
(10,'Monster energy ultra gold',3),
(11,'Monster energy ultra blue',3),
(12,'Eau de source',2);
/*!40000 ALTER TABLE `drinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drinks_menus`
--

DROP TABLE IF EXISTS `drinks_menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drinks_menus` (
  `drink_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  PRIMARY KEY (`drink_id`,`menu_id`),
  UNIQUE KEY `drink_id` (`drink_id`,`menu_id`),
  KEY `fk_drinks_menus_2` (`menu_id`),
  CONSTRAINT `fk_drinks_menus_1` FOREIGN KEY (`drink_id`) REFERENCES `drinks` (`id_drink`) ON DELETE CASCADE,
  CONSTRAINT `fk_drinks_menus_2` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id_menu`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drinks_menus`
--

LOCK TABLES `drinks_menus` WRITE;
/*!40000 ALTER TABLE `drinks_menus` DISABLE KEYS */;
/*!40000 ALTER TABLE `drinks_menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `focaccia`
--

DROP TABLE IF EXISTS `focaccia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `focaccia` (
  `id_focaccia` int(11) NOT NULL AUTO_INCREMENT,
  `name_focaccia` varchar(45) NOT NULL,
  `price_focaccia` int(11) NOT NULL,
  PRIMARY KEY (`id_focaccia`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `focaccia`
--

LOCK TABLES `focaccia` WRITE;
/*!40000 ALTER TABLE `focaccia` DISABLE KEYS */;
INSERT INTO `focaccia` VALUES
(1,'Mozaccia',10),
(2,'Gorgonzollaccia',11),
(3,'Raclaccia',9),
(4,'Emmentalaccia',10),
(5,'Tradizione',9),
(6,'Hawaienne',11),
(7,'Américaine',11),
(8,'Paysanne',13);
/*!40000 ALTER TABLE `focaccia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `focaccia_ingredients`
--

DROP TABLE IF EXISTS `focaccia_ingredients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `focaccia_ingredients` (
  `focaccia_id` int(11) NOT NULL,
  `ingredient_id` int(11) NOT NULL,
  PRIMARY KEY (`focaccia_id`,`ingredient_id`),
  UNIQUE KEY `focaccia_id` (`focaccia_id`,`ingredient_id`),
  KEY `fk_focaccia_ingredients_2` (`ingredient_id`),
  CONSTRAINT `fk_focaccia_ingredients_1` FOREIGN KEY (`focaccia_id`) REFERENCES `focaccia` (`id_focaccia`) ON DELETE CASCADE,
  CONSTRAINT `fk_focaccia_ingredients_2` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredients` (`id_ingredient`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `focaccia_ingredients`
--

LOCK TABLES `focaccia_ingredients` WRITE;
/*!40000 ALTER TABLE `focaccia_ingredients` DISABLE KEYS */;
INSERT INTO `focaccia_ingredients` VALUES
(1,1),
(2,1),
(3,1),
(8,1),
(6,2),
(1,3),
(8,3),
(6,4),
(7,4),
(1,5),
(2,5),
(3,5),
(5,5),
(6,5),
(7,5),
(4,6),
(8,6),
(1,7),
(2,7),
(3,7),
(4,7),
(5,7),
(8,7),
(8,8),
(1,9),
(2,9),
(3,9),
(4,9),
(5,9),
(6,9),
(7,9),
(8,9),
(4,10),
(2,11),
(5,12),
(1,13),
(8,13),
(8,14),
(4,15),
(1,16),
(2,16),
(5,16),
(6,16),
(7,16),
(8,16),
(5,17),
(1,18),
(2,18),
(3,18),
(4,18),
(5,18),
(6,18),
(7,18),
(8,18),
(6,19),
(1,20),
(2,20),
(3,20),
(4,20),
(5,20),
(6,20),
(7,20),
(8,20),
(7,21),
(8,21),
(3,22),
(1,25),
(5,25),
(6,25),
(7,25);
/*!40000 ALTER TABLE `focaccia_ingredients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredients`
--

DROP TABLE IF EXISTS `ingredients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ingredients` (
  `id_ingredient` int(11) NOT NULL AUTO_INCREMENT,
  `name_ingredient` varchar(45) NOT NULL,
  PRIMARY KEY (`id_ingredient`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredients`
--

LOCK TABLES `ingredients` WRITE;
/*!40000 ALTER TABLE `ingredients` DISABLE KEYS */;
INSERT INTO `ingredients` VALUES
(1,'Ail'),
(2,'Ananas'),
(3,'Artichaut'),
(4,'Bacon'),
(5,'Base Tomate'),
(6,'Base crème'),
(7,'Champignon'),
(8,'Chevre'),
(9,'Cresson'),
(10,'Emmental'),
(11,'Gorgonzola'),
(12,'Jambon cuit'),
(13,'Jambon fumé'),
(14,'Oeuf'),
(15,'Oignon'),
(16,'Olive noire'),
(17,'Olive verte'),
(18,'Parmesan'),
(19,'Piment'),
(20,'Poivre'),
(21,'Pomme de terre'),
(22,'Raclette'),
(23,'Salami'),
(24,'Tomate cerise'),
(25,'Mozzarella');
/*!40000 ALTER TABLE `ingredients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menus` (
  `id_menu` int(11) NOT NULL AUTO_INCREMENT,
  `name_menu` varchar(45) NOT NULL,
  `price_menu` float NOT NULL,
  `focaccia_id` int(11) NOT NULL,
  PRIMARY KEY (`id_menu`),
  KEY `fk_focaccia_menu` (`focaccia_id`),
  CONSTRAINT `fk_focaccia_menu` FOREIGN KEY (`focaccia_id`) REFERENCES `focaccia` (`id_focaccia`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-21 13:11:59
