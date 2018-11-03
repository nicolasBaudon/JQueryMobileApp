-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 03, 2018 at 01:58 PM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 7.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `progavanzadaseleccion`
--

-- --------------------------------------------------------

--
-- Table structure for table `localidad`
--

CREATE TABLE `localidad` (
  `idLocalidad` int(11) NOT NULL,
  `nombreLocalidad` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  `fk_Provincia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `localidad`
--

INSERT INTO `localidad` (`idLocalidad`, `nombreLocalidad`, `fk_Provincia`) VALUES
(1, 'Ciudad', 2),
(2, 'Maipu', 2),
(3, 'Godoy Cruz', 2),
(4, 'Lujan', 2),
(5, 'Las Heras', 2),
(6, 'Guaymallen', 2),
(7, 'Lujan', 1),
(8, 'Lanus', 1),
(9, 'La Plata', 1),
(10, 'Pilar', 1),
(11, 'Ezeiza', 1),
(12, 'Cruz Del Eje', 3),
(13, 'Rio Cuarto', 3),
(14, 'Capital', 3);

-- --------------------------------------------------------

--
-- Table structure for table `pais`
--

CREATE TABLE `pais` (
  `idPais` int(11) NOT NULL,
  `nombrePais` varchar(200) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `pais`
--

INSERT INTO `pais` (`idPais`, `nombrePais`) VALUES
(1, 'Argentina'),
(3, 'Brasil'),
(4, 'Chile'),
(5, 'Estados Unidos');

-- --------------------------------------------------------

--
-- Table structure for table `provincia`
--

CREATE TABLE `provincia` (
  `idProvincia` int(11) NOT NULL,
  `nombreProvincia` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  `fk_Pais` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `provincia`
--

INSERT INTO `provincia` (`idProvincia`, `nombreProvincia`, `fk_Pais`) VALUES
(1, 'Buenos Aires', 1),
(2, 'Mendoza', 1),
(3, 'Cordoba', 1),
(4, 'San Juan', 1),
(5, 'Santa Fe', 1),
(6, 'Tucuman', 1),
(7, 'Entre Rios', 1),
(8, 'Misiones', 1),
(9, 'La Pampa', 1),
(10, 'Chaco', 1),
(11, 'Rio Negro', 1),
(12, 'Tierra del Fuego', 1),
(13, 'Chubut', 1),
(14, 'Jujuy', 1),
(15, 'Salta', 1),
(16, 'Santa Cruz', 1),
(17, 'San Luis', 1),
(18, 'Santiago Del Estero', 1),
(19, 'Corrientes', 1),
(20, 'La Rioja', 1),
(21, 'Neuquen', 1),
(22, 'Catamarca', 1),
(23, 'Formosa', 1),
(31, 'Sao Paulo', 3),
(33, 'Santiago', 4);

-- --------------------------------------------------------

--
-- Table structure for table `vuelo`
--

CREATE TABLE `vuelo` (
  `codVuelo` int(11) NOT NULL,
  `aerolinea` varchar(200) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `precio` float NOT NULL,
  `fk_Pais` int(11) NOT NULL,
  `fk_Provincia` int(11) NOT NULL,
  `destino` varchar(200) COLLATE utf8_spanish2_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `vuelo`
--

INSERT INTO `vuelo` (`codVuelo`, `aerolinea`, `precio`, `fk_Pais`, `fk_Provincia`, `destino`) VALUES
(1, 'Aerolineas Argentinas', 1000.8, 1, 2, 'Argentina'),
(2, 'Aerolineas Argentinas', 1522.89, 1, 2, 'Argentina'),
(3, 'Latam', 1400, 1, 2, 'Argentina'),
(4, 'Aerolineas Argentinas', 2500.65, 3, 31, 'Brasil');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `localidad`
--
ALTER TABLE `localidad`
  ADD PRIMARY KEY (`idLocalidad`),
  ADD KEY `fk_Provincia` (`fk_Provincia`);

--
-- Indexes for table `pais`
--
ALTER TABLE `pais`
  ADD PRIMARY KEY (`idPais`);

--
-- Indexes for table `provincia`
--
ALTER TABLE `provincia`
  ADD PRIMARY KEY (`idProvincia`),
  ADD KEY `fk_Pais` (`fk_Pais`);

--
-- Indexes for table `vuelo`
--
ALTER TABLE `vuelo`
  ADD PRIMARY KEY (`codVuelo`),
  ADD KEY `fk_Pais` (`fk_Pais`),
  ADD KEY `fk_Provincia` (`fk_Provincia`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `localidad`
--
ALTER TABLE `localidad`
  MODIFY `idLocalidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `pais`
--
ALTER TABLE `pais`
  MODIFY `idPais` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `provincia`
--
ALTER TABLE `provincia`
  MODIFY `idProvincia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `vuelo`
--
ALTER TABLE `vuelo`
  MODIFY `codVuelo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `localidad`
--
ALTER TABLE `localidad`
  ADD CONSTRAINT `localidad_ibfk_1` FOREIGN KEY (`fk_Provincia`) REFERENCES `provincia` (`idProvincia`);

--
-- Constraints for table `provincia`
--
ALTER TABLE `provincia`
  ADD CONSTRAINT `provincia_ibfk_1` FOREIGN KEY (`fk_Pais`) REFERENCES `pais` (`idPais`);

--
-- Constraints for table `vuelo`
--
ALTER TABLE `vuelo`
  ADD CONSTRAINT `vuelo_ibfk_1` FOREIGN KEY (`fk_Pais`) REFERENCES `pais` (`idPais`),
  ADD CONSTRAINT `vuelo_ibfk_2` FOREIGN KEY (`fk_Provincia`) REFERENCES `provincia` (`idProvincia`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
