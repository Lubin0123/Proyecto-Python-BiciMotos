-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: roundhouse.proxy.rlwy.net    Database: tiendaProyecto
-- ------------------------------------------------------
-- Server version	8.3.0

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
-- Table structure for table `auditoria`
--

DROP TABLE IF EXISTS `auditoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auditoria` (
  `idAuditoria` int NOT NULL AUTO_INCREMENT,
  `detalleAuditoria` varchar(45) NOT NULL,
  `idUsuarioAuditoria` varchar(45) NOT NULL,
  `fechaAuditoria` varchar(45) NOT NULL,
  PRIMARY KEY (`idAuditoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditoria`
--

LOCK TABLES `auditoria` WRITE;
/*!40000 ALTER TABLE `auditoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `auditoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `idClientes` int NOT NULL AUTO_INCREMENT,
  `nombreClientes` varchar(45) NOT NULL,
  `cedulaClientes` varchar(45) NOT NULL,
  `correoClientes` varchar(45) NOT NULL,
  `password` varchar(255) NOT NULL,
  `rol` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idClientes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalleCompra`
--

DROP TABLE IF EXISTS `detalleCompra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalleCompra` (
  `idDetalleCompra` int NOT NULL AUTO_INCREMENT,
  `cantidadDetalleCompra` varchar(45) NOT NULL,
  `idFacturaCompra` int NOT NULL,
  `idProveedores` int NOT NULL,
  `idProductos` int NOT NULL,
  PRIMARY KEY (`idDetalleCompra`,`idFacturaCompra`,`idProveedores`,`idProductos`),
  KEY `fk_detalleCompra_facturaCompra1_idx` (`idFacturaCompra`,`idProveedores`),
  KEY `fk_detalleCompra_Productos1_idx` (`idProductos`),
  CONSTRAINT `fk_detalleCompra_facturaCompra1` FOREIGN KEY (`idFacturaCompra`, `idProveedores`) REFERENCES `facturaCompra` (`idFacturaCompra`, `idProveedores`),
  CONSTRAINT `fk_detalleCompra_Productos1` FOREIGN KEY (`idProductos`) REFERENCES `producto` (`idProductos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalleCompra`
--

LOCK TABLES `detalleCompra` WRITE;
/*!40000 ALTER TABLE `detalleCompra` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalleCompra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalleVenta`
--

DROP TABLE IF EXISTS `detalleVenta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalleVenta` (
  `idDetalleVenta` int NOT NULL AUTO_INCREMENT,
  `cantidadDetalleVenta` varchar(45) NOT NULL,
  `idFactura` int NOT NULL,
  `idClientes` int NOT NULL,
  `idProductos` int NOT NULL,
  PRIMARY KEY (`idDetalleVenta`,`idFactura`,`idClientes`,`idProductos`),
  KEY `fk_detalleVenta_facturaVenta1_idx` (`idFactura`,`idClientes`),
  KEY `fk_detalleVenta_Productos1_idx` (`idProductos`),
  CONSTRAINT `fk_detalleVenta_facturaVenta1` FOREIGN KEY (`idFactura`, `idClientes`) REFERENCES `facturaVenta` (`idFacturaVenta`, `idClientes`),
  CONSTRAINT `fk_detalleVenta_Productos1` FOREIGN KEY (`idProductos`) REFERENCES `producto` (`idProductos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalleVenta`
--

LOCK TABLES `detalleVenta` WRITE;
/*!40000 ALTER TABLE `detalleVenta` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalleVenta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facturaCompra`
--

DROP TABLE IF EXISTS `facturaCompra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facturaCompra` (
  `idFacturaCompra` int NOT NULL AUTO_INCREMENT,
  `horaFacturaCompra` varchar(45) NOT NULL,
  `idProveedores` int NOT NULL,
  `totalFacturaCompra` varchar(45) NOT NULL,
  PRIMARY KEY (`idFacturaCompra`,`idProveedores`),
  KEY `fk_facturaCompra_proveedores1_idx` (`idProveedores`),
  CONSTRAINT `fk_facturaCompra_proveedores1` FOREIGN KEY (`idProveedores`) REFERENCES `proveedor` (`idProveedores`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facturaCompra`
--

LOCK TABLES `facturaCompra` WRITE;
/*!40000 ALTER TABLE `facturaCompra` DISABLE KEYS */;
/*!40000 ALTER TABLE `facturaCompra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facturaVenta`
--

DROP TABLE IF EXISTS `facturaVenta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facturaVenta` (
  `idFacturaVenta` int NOT NULL AUTO_INCREMENT,
  `idClientes` int NOT NULL,
  `horaFacturaVenta` time NOT NULL,
  `totalFacturaVenta` varchar(45) NOT NULL,
  PRIMARY KEY (`idFacturaVenta`,`idClientes`),
  KEY `fk_facturaVenta_clientes1_idx` (`idClientes`),
  CONSTRAINT `fk_facturaVenta_clientes1` FOREIGN KEY (`idClientes`) REFERENCES `cliente` (`idClientes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facturaVenta`
--

LOCK TABLES `facturaVenta` WRITE;
/*!40000 ALTER TABLE `facturaVenta` DISABLE KEYS */;
/*!40000 ALTER TABLE `facturaVenta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `idProductos` int NOT NULL AUTO_INCREMENT,
  `descripcionProductos` varchar(45) NOT NULL,
  `precioProductos` varchar(45) NOT NULL,
  `cantidadProductos` varchar(45) NOT NULL,
  `nombreImagen` varchar(255) DEFAULT NULL,
  `informacionProductos` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idProductos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor` (
  `idProveedores` int NOT NULL AUTO_INCREMENT,
  `nombreProveedores` varchar(45) NOT NULL,
  `correoProveedores` varchar(45) NOT NULL,
  `direccionProveedores` varchar(45) NOT NULL,
  PRIMARY KEY (`idProveedores`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `idRol` int NOT NULL AUTO_INCREMENT,
  `nombreRol` varchar(45) NOT NULL,
  PRIMARY KEY (`idRol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-24 19:46:47
