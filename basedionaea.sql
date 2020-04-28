-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 28-04-2020 a las 22:19:55
-- Versión del servidor: 5.5.16
-- Versión de PHP: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `basedionaea`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `almacen`
--

CREATE TABLE IF NOT EXISTS `almacen` (
  `IdProducto` int(10) NOT NULL,
  `Stock` int(30) NOT NULL,
  `Precio` decimal(10,2) NOT NULL,
  KEY `Fkproducto4` (`IdProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE IF NOT EXISTS `categoria` (
  `IdCategoria` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `Nombre` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`IdCategoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE IF NOT EXISTS `cliente` (
  `IdCliente` int(10) NOT NULL,
  `Nombre` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `Apellido1` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `Apellido2` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `Pais` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `Direccion` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `Localidad` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `CP` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `Telf` int(20) NOT NULL,
  `FechaNa` date NOT NULL,
  `Rfc` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`IdCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra`
--

CREATE TABLE IF NOT EXISTS `compra` (
  `idCompra` int(10) NOT NULL,
  `IdProducto` int(10) NOT NULL,
  `FechaEntrega` date DEFAULT NULL,
  `Cantidad` int(30) DEFAULT NULL,
  `IdProove` int(10) NOT NULL,
  PRIMARY KEY (`idCompra`),
  KEY `FkProduc` (`IdProducto`),
  KEY `FkPro` (`IdProove`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `descripro`
--

CREATE TABLE IF NOT EXISTS `descripro` (
  `IdProducto` int(10) NOT NULL,
  `Descripción` varchar(500) COLLATE utf8_spanish_ci NOT NULL,
  KEY `Fk_productos1` (`IdProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalleventa`
--

CREATE TABLE IF NOT EXISTS `detalleventa` (
  `IdVenta` int(10) NOT NULL,
  `IdProducto` int(10) DEFAULT NULL,
  `Cantidad` int(10) DEFAULT NULL,
  `CostoUni` decimal(10,2) DEFAULT NULL,
  `CostoTotal` decimal(10,2) DEFAULT NULL,
  KEY `FkVentas` (`IdVenta`),
  KEY `FkProducto3` (`IdProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `envio`
--

CREATE TABLE IF NOT EXISTS `envio` (
  `idEnvio` int(10) NOT NULL,
  `idPaqueteria` int(10) NOT NULL,
  `idVenta` int(10) NOT NULL,
  `Num_segui` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idEnvio`),
  KEY `FkVenta` (`idVenta`),
  KEY `FkPaqueteria` (`idPaqueteria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE IF NOT EXISTS `factura` (
  `idFactura` int(10) NOT NULL,
  `IdCliente` int(10) NOT NULL,
  `idVenta` int(10) NOT NULL,
  `Doc_Factura` varchar(250) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idFactura`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imagenpro`
--

CREATE TABLE IF NOT EXISTS `imagenpro` (
  `IdProducto` int(10) NOT NULL,
  `Imagen` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  KEY `FkProducto2` (`IdProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `log`
--

CREATE TABLE IF NOT EXISTS `log` (
  `idLog` int(11) NOT NULL,
  `idCliente` int(10) NOT NULL,
  `FechaLog` date NOT NULL,
  PRIMARY KEY (`idLog`),
  KEY `Fk_Us` (`idCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paqueteria`
--

CREATE TABLE IF NOT EXISTS `paqueteria` (
  `idPaqueteria` int(10) NOT NULL,
  `Nombre` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `Telefono` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `Web` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`idPaqueteria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE IF NOT EXISTS `producto` (
  `IdProducto` int(10) NOT NULL,
  `IdCategoria` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `Nombre` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `Peso` decimal(10,0) NOT NULL,
  `IdTipoP` tinyint(1) NOT NULL,
  `Activo` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`IdProducto`),
  KEY `FkCategoria` (`IdCategoria`),
  KEY `FkTip` (`IdTipoP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proovedor`
--

CREATE TABLE IF NOT EXISTS `proovedor` (
  `idProove` int(10) NOT NULL,
  `NombreEmp` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Repre` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Direccion` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Tel` int(20) DEFAULT NULL,
  `Correo` varchar(150) COLLATE utf8_spanish_ci DEFAULT NULL,
  `CP` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`idProove`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipopro`
--

CREATE TABLE IF NOT EXISTS `tipopro` (
  `idTipoPro` tinyint(1) NOT NULL,
  `Tipo` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idTipoPro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `IdCliente` int(10) NOT NULL,
  `Correo` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `Contra` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`Correo`),
  KEY `Fk_clientes` (`IdCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE IF NOT EXISTS `venta` (
  `idVenta` int(10) NOT NULL,
  `IdCliente` int(10) NOT NULL,
  `Fecha` date NOT NULL,
  `VentaTotal` decimal(10,2) NOT NULL,
  PRIMARY KEY (`idVenta`),
  KEY `FkClientes` (`IdCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `almacen`
--
ALTER TABLE `almacen`
  ADD CONSTRAINT `Fkproducto4` FOREIGN KEY (`IdProducto`) REFERENCES `producto` (`IdProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `compra`
--
ALTER TABLE `compra`
  ADD CONSTRAINT `FkProduc` FOREIGN KEY (`IdProducto`) REFERENCES `almacen` (`IdProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FkPro` FOREIGN KEY (`IdProove`) REFERENCES `proovedor` (`idProove`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `descripro`
--
ALTER TABLE `descripro`
  ADD CONSTRAINT `Fk_productos1` FOREIGN KEY (`IdProducto`) REFERENCES `producto` (`IdProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `detalleventa`
--
ALTER TABLE `detalleventa`
  ADD CONSTRAINT `FkVentas` FOREIGN KEY (`IdVenta`) REFERENCES `venta` (`idVenta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FkProducto3` FOREIGN KEY (`IdProducto`) REFERENCES `producto` (`IdProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `envio`
--
ALTER TABLE `envio`
  ADD CONSTRAINT `FkVenta` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FkPaqueteria` FOREIGN KEY (`idPaqueteria`) REFERENCES `paqueteria` (`idPaqueteria`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `imagenpro`
--
ALTER TABLE `imagenpro`
  ADD CONSTRAINT `FkProducto2` FOREIGN KEY (`IdProducto`) REFERENCES `producto` (`IdProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `log`
--
ALTER TABLE `log`
  ADD CONSTRAINT `Fk_Us` FOREIGN KEY (`idCliente`) REFERENCES `usuario` (`IdCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `FkCategoria` FOREIGN KEY (`IdCategoria`) REFERENCES `categoria` (`IdCategoria`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FkTip` FOREIGN KEY (`IdTipoP`) REFERENCES `tipopro` (`idTipoPro`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `Fk_clientes` FOREIGN KEY (`IdCliente`) REFERENCES `cliente` (`IdCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `FkClientes` FOREIGN KEY (`IdCliente`) REFERENCES `cliente` (`IdCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
