-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 21, 2021 at 12:57 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `agencia_turismo`
--

-- --------------------------------------------------------

--
-- Table structure for table `cliente`
--

CREATE TABLE `cliente` (
  `ID_CLIENTE` int(11) NOT NULL,
  `APELLIDO` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `CELULAR` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `CLIENTE_ACTIVO` tinyint(1) DEFAULT 0,
  `DIRECCION` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `DNI` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `EMAIL` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `FECHA_NAC` date DEFAULT NULL,
  `NACIONALIDAD` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `NOMBRE` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `cliente`
--

INSERT INTO `cliente` (`ID_CLIENTE`, `APELLIDO`, `CELULAR`, `CLIENTE_ACTIVO`, `DIRECCION`, `DNI`, `EMAIL`, `FECHA_NAC`, `NACIONALIDAD`, `NOMBRE`) VALUES
(1, 'Kim', '1134330220', 1, 'Charcas 2872', '93905358', 'hjdkim@gmail.com', '1987-03-09', 'Surcoreana', 'Daniel'),
(3, 'Pérez', '1198765432', 1, 'Bolívar 100', '12345678', 'jperez@inventado.com', '1980-07-24', 'Argentina', 'Jorge');

-- --------------------------------------------------------

--
-- Table structure for table `empleado`
--

CREATE TABLE `empleado` (
  `ID_EMPLEADO` int(11) NOT NULL,
  `APELLIDO` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `CARGO` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `CELULAR` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `DIRECCION` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `DNI` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `EMAIL` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `EMPLEADO_ACTIVO` tinyint(1) DEFAULT 0,
  `FECHA_NAC` date DEFAULT NULL,
  `NACIONALIDAD` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `NOMBRE` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `SUELDO` double DEFAULT NULL,
  `USU_ID_USUARIO` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `empleado`
--

INSERT INTO `empleado` (`ID_EMPLEADO`, `APELLIDO`, `CARGO`, `CELULAR`, `DIRECCION`, `DNI`, `EMAIL`, `EMPLEADO_ACTIVO`, `FECHA_NAC`, `NACIONALIDAD`, `NOMBRE`, `SUELDO`, `USU_ID_USUARIO`) VALUES
(1, '', 'Administrador', 'admin', 'admin', 'admin', 'admin@admin.com', 1, '2000-01-01', 'admin', 'admin', 0, 1),
(5, 'Kim', 'Jefe de ventas', '1134330220', 'Charcas 2872', '93905358', 'hjdkim@gmail.com', 1, '1987-03-09', 'Surcoreana', 'Ho Joong', 1000000, 8),
(6, 'Marley', 'Recursos humanos', '1116273849', 'Jamaica 420', '16273849', 'bobmarley@reggae.com', 1, '1945-02-06', 'Jamaiquino', 'Bob', 400000, 10),
(7, 'Fulanito', 'Gerente General', '1199999999', 'Calle Falsa 123', '99999999', 'correo@falso.com', 1, '1971-11-11', 'Argentina', 'Cosme', 5000000, 12);

-- --------------------------------------------------------

--
-- Table structure for table `paquete`
--

CREATE TABLE `paquete` (
  `CODIGO_PAQUETE` int(11) NOT NULL,
  `COSTO_PAQUETE` double DEFAULT NULL,
  `PAQUETE_ACTIVO` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `paquete`
--

INSERT INTO `paquete` (`CODIGO_PAQUETE`, `COSTO_PAQUETE`, `PAQUETE_ACTIVO`) VALUES
(2, 336600, 1),
(3, 189000, 1),
(4, 14175, 1);

-- --------------------------------------------------------

--
-- Table structure for table `paquete_servicio`
--

CREATE TABLE `paquete_servicio` (
  `codigo_paquete` int(11) NOT NULL,
  `codigo_servicio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `paquete_servicio`
--

INSERT INTO `paquete_servicio` (`codigo_paquete`, `codigo_servicio`) VALUES
(2, 1),
(2, 2),
(2, 6),
(3, 2),
(3, 4),
(4, 3),
(4, 4),
(4, 5);

-- --------------------------------------------------------

--
-- Table structure for table `servicio`
--

CREATE TABLE `servicio` (
  `CODIGO_SERVICIO` int(11) NOT NULL,
  `COSTO_SERVICIO` double DEFAULT NULL,
  `DESCRIPCION_BREVE` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `DESTINO_SERVICIO` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `FECHA_SERVICIO` date DEFAULT NULL,
  `NOMBRE` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `SERVICIO_ACTIVO` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `servicio`
--

INSERT INTO `servicio` (`CODIGO_SERVICIO`, `COSTO_SERVICIO`, `DESCRIPCION_BREVE`, `DESTINO_SERVICIO`, `FECHA_SERVICIO`, `NOMBRE`, `SERVICIO_ACTIVO`) VALUES
(1, 170000, 'Una noche en el suite presidencial del hotel Llao Llao', 'Bariloche', '2022-03-01', 'Llao Llao', 1),
(2, 200000, 'Alquiler de Toyota Hilux por una semana', 'Cualquiera', '2022-03-01', 'Alquiler de auto', 1),
(3, 5000, 'Pasaje de micro de ida a Mar del Plata', 'Mar del Plata', '2022-02-01', 'Micro Mar del Plata', 1),
(4, 10000, 'Pasaje de avión de ida a Puerto Iguazú', 'Iguazú', '2022-03-01', 'Avión a Puerto Iguazú', 1),
(5, 750, 'Pasaje de tren de ida a Bahía Blanca', 'Bahía Blanca', '2022-08-01', 'Tren a Bahía Blanca', 1),
(6, 4000, 'Recorrido del camino de los 7 lagos en combi', 'San Martín de los Andes', '2022-03-05', 'Camino de los 7 lagos', 1),
(7, 11500, 'Entrada al recital de Coldplay en el Monumental', 'CABA', '2022-10-29', 'Recital de Coldplay', 1);

-- --------------------------------------------------------

--
-- Table structure for table `usuario`
--

CREATE TABLE `usuario` (
  `ID_USUARIO` int(11) NOT NULL,
  `CONTRASENIA` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `NOMBREUSU` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `usuario`
--

INSERT INTO `usuario` (`ID_USUARIO`, `CONTRASENIA`, `NOMBREUSU`) VALUES
(1, 'qwerty', 'admin'),
(7, 'kim', 'hojoong'),
(8, 'kim', 'hojoong'),
(9, 'marley', 'bob'),
(10, 'marley', 'bob'),
(11, 'fulanito', 'cosme'),
(12, 'fulanito', 'cosme'),
(13, 'prueba', 'prueba');

-- --------------------------------------------------------

--
-- Table structure for table `venta`
--

CREATE TABLE `venta` (
  `NUM_VENTA` int(11) NOT NULL,
  `FECHA_VENTA` date DEFAULT NULL,
  `MEDIO_PAGO` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `VENTA_SERVICIO_CODIGO_SERVICIO` int(11) DEFAULT NULL,
  `VENTA_CLIENTE_ID_CLIENTE` int(11) DEFAULT NULL,
  `VENTA_EMPLEADO_ID_EMPLEADO` int(11) DEFAULT NULL,
  `VENTA_PAQUETE_CODIGO_PAQUETE` int(11) DEFAULT NULL,
  `VENTA_ACTIVO` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `venta`
--

INSERT INTO `venta` (`NUM_VENTA`, `FECHA_VENTA`, `MEDIO_PAGO`, `VENTA_SERVICIO_CODIGO_SERVICIO`, `VENTA_CLIENTE_ID_CLIENTE`, `VENTA_EMPLEADO_ID_EMPLEADO`, `VENTA_PAQUETE_CODIGO_PAQUETE`, `VENTA_ACTIVO`) VALUES
(2, '2021-12-20', 'Efectivo', NULL, 3, 5, 2, 1),
(3, '2021-12-18', 'Tarjeta de crédito', 7, 1, 6, NULL, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`ID_CLIENTE`);

--
-- Indexes for table `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`ID_EMPLEADO`),
  ADD KEY `FK_EMPLEADO_USU_ID_USUARIO` (`USU_ID_USUARIO`);

--
-- Indexes for table `paquete`
--
ALTER TABLE `paquete`
  ADD PRIMARY KEY (`CODIGO_PAQUETE`);

--
-- Indexes for table `paquete_servicio`
--
ALTER TABLE `paquete_servicio`
  ADD PRIMARY KEY (`codigo_paquete`,`codigo_servicio`),
  ADD KEY `FK_paquete_servicio_codigo_servicio` (`codigo_servicio`);

--
-- Indexes for table `servicio`
--
ALTER TABLE `servicio`
  ADD PRIMARY KEY (`CODIGO_SERVICIO`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`ID_USUARIO`);

--
-- Indexes for table `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`NUM_VENTA`),
  ADD KEY `FK_VENTA_VENTA_PAQUETE_CODIGO_PAQUETE` (`VENTA_PAQUETE_CODIGO_PAQUETE`),
  ADD KEY `FK_VENTA_VENTA_SERVICIO_CODIGO_SERVICIO` (`VENTA_SERVICIO_CODIGO_SERVICIO`),
  ADD KEY `FK_VENTA_VENTA_EMPLEADO_ID_EMPLEADO` (`VENTA_EMPLEADO_ID_EMPLEADO`),
  ADD KEY `FK_VENTA_VENTA_CLIENTE_ID_CLIENTE` (`VENTA_CLIENTE_ID_CLIENTE`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cliente`
--
ALTER TABLE `cliente`
  MODIFY `ID_CLIENTE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `empleado`
--
ALTER TABLE `empleado`
  MODIFY `ID_EMPLEADO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `paquete`
--
ALTER TABLE `paquete`
  MODIFY `CODIGO_PAQUETE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `servicio`
--
ALTER TABLE `servicio`
  MODIFY `CODIGO_SERVICIO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `ID_USUARIO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `venta`
--
ALTER TABLE `venta`
  MODIFY `NUM_VENTA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `FK_EMPLEADO_USU_ID_USUARIO` FOREIGN KEY (`USU_ID_USUARIO`) REFERENCES `usuario` (`ID_USUARIO`);

--
-- Constraints for table `paquete_servicio`
--
ALTER TABLE `paquete_servicio`
  ADD CONSTRAINT `FK_paquete_servicio_codigo_paquete` FOREIGN KEY (`codigo_paquete`) REFERENCES `paquete` (`CODIGO_PAQUETE`),
  ADD CONSTRAINT `FK_paquete_servicio_codigo_servicio` FOREIGN KEY (`codigo_servicio`) REFERENCES `servicio` (`CODIGO_SERVICIO`);

--
-- Constraints for table `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `FK_VENTA_VENTA_CLIENTE_ID_CLIENTE` FOREIGN KEY (`VENTA_CLIENTE_ID_CLIENTE`) REFERENCES `cliente` (`ID_CLIENTE`),
  ADD CONSTRAINT `FK_VENTA_VENTA_EMPLEADO_ID_EMPLEADO` FOREIGN KEY (`VENTA_EMPLEADO_ID_EMPLEADO`) REFERENCES `empleado` (`ID_EMPLEADO`),
  ADD CONSTRAINT `FK_VENTA_VENTA_PAQUETE_CODIGO_PAQUETE` FOREIGN KEY (`VENTA_PAQUETE_CODIGO_PAQUETE`) REFERENCES `paquete` (`CODIGO_PAQUETE`),
  ADD CONSTRAINT `FK_VENTA_VENTA_SERVICIO_CODIGO_SERVICIO` FOREIGN KEY (`VENTA_SERVICIO_CODIGO_SERVICIO`) REFERENCES `servicio` (`CODIGO_SERVICIO`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
