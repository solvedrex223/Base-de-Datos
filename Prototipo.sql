-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.2.6-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             9.4.0.5185
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para datos
CREATE DATABASE IF NOT EXISTS `datos` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `datos`;

-- Volcando estructura para tabla datos.admistracion
CREATE TABLE IF NOT EXISTS `admistracion` (
  `Manifiesto` int(11) NOT NULL,
  `Número de Factura` int(11) DEFAULT NULL,
  PRIMARY KEY (`Manifiesto`),
  CONSTRAINT `Manifiesto3` FOREIGN KEY (`Manifiesto`) REFERENCES `laboratorio` (`Manifiesto`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla datos.admistracion: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `admistracion` DISABLE KEYS */;
/*!40000 ALTER TABLE `admistracion` ENABLE KEYS */;

-- Volcando estructura para tabla datos.laboratorio
CREATE TABLE IF NOT EXISTS `laboratorio` (
  `Manifiesto` int(11) NOT NULL,
  `Descripción del residuo` mediumtext DEFAULT NULL,
  `Cantidad` float DEFAULT NULL,
  `Unidades` text DEFAULT NULL,
  `No. de control interno` int(11) DEFAULT NULL,
  `pH` int(11) DEFAULT NULL,
  `Densidad` tinytext DEFAULT NULL,
  `Color` tinytext DEFAULT NULL,
  `Olor` tinytext DEFAULT NULL,
  `Flamabilidad` tinytext DEFAULT NULL,
  `Flamabilidad por fricción` tinytext DEFAULT NULL,
  `Proceso asignado` mediumtext DEFAULT NULL,
  `Observaciónes al residuo` text DEFAULT NULL,
  PRIMARY KEY (`Manifiesto`),
  CONSTRAINT `Manifiesto2` FOREIGN KEY (`Manifiesto`) REFERENCES `vigilancia` (`Manifiesto`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla datos.laboratorio: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `laboratorio` DISABLE KEYS */;
/*!40000 ALTER TABLE `laboratorio` ENABLE KEYS */;

-- Volcando estructura para tabla datos.vigilancia
CREATE TABLE IF NOT EXISTS `vigilancia` (
  `Fecha` date DEFAULT NULL,
  `Hora de llegada` time NOT NULL,
  `Hora de descarga` time DEFAULT NULL,
  `Hora de salida` time DEFAULT NULL,
  `Manifiesto` int(11) NOT NULL,
  `Empresa Transportista` tinytext DEFAULT NULL,
  `Nombre Operador` tinytext DEFAULT NULL,
  `Numero Licencia Tipo E` tinytext DEFAULT NULL,
  `Observaciones al embarque` tinytext DEFAULT NULL,
  `Generador` int(11) DEFAULT NULL,
  PRIMARY KEY (`Manifiesto`),
  CONSTRAINT `Manifiesto` FOREIGN KEY (`Manifiesto`) REFERENCES `waste tracking` (`Manifiesto`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla datos.vigilancia: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `vigilancia` DISABLE KEYS */;
/*!40000 ALTER TABLE `vigilancia` ENABLE KEYS */;

-- Volcando estructura para tabla datos.waste tracking
CREATE TABLE IF NOT EXISTS `waste tracking` (
  `Manifiesto` int(11) NOT NULL,
  `Fecha de procesado` date DEFAULT NULL,
  `Cantidad en Kg` float DEFAULT NULL,
  `Número de registro ambiental` int(11) DEFAULT NULL,
  `Autorización SERMARNAT transportista` int(11) DEFAULT NULL,
  `Autorización SCT transportista` int(11) DEFAULT NULL,
  `Observaciónes al manifiesto` text DEFAULT NULL,
  PRIMARY KEY (`Manifiesto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla datos.waste tracking: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `waste tracking` DISABLE KEYS */;
INSERT INTO `waste tracking` (`Manifiesto`, `Fecha de procesado`, `Cantidad en Kg`, `Número de registro ambiental`, `Autorización SERMARNAT transportista`, `Autorización SCT transportista`, `Observaciónes al manifiesto`) VALUES
	(1, NULL, NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `waste tracking` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
