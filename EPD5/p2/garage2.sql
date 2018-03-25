-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-03-2018 a las 16:36:02
-- Versión del servidor: 10.1.13-MariaDB
-- Versión de PHP: 5.5.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `garage2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parkingspot`
--

CREATE TABLE `parkingspot` (
  `Matricula` varchar(8) NOT NULL,
  `Modelo` varchar(20) NOT NULL,
  `horaEntrada` int(16) NOT NULL,
  `horaSalida` int(16) NOT NULL,
  `tiempoPermitido` int(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `parkingspot`
--

INSERT INTO `parkingspot` (`Matricula`, `Modelo`, `horaEntrada`, `horaSalida`, `tiempoPermitido`) VALUES
('12784HIH', 'BMW', 1434, 714, 15),
('32162BAQ', 'FERRARI', 321, -1, 0),
('76234AAC', 'Toyota', 950, 1200, 45),
('87823CDA', 'Tesla', 752, 774, 60);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `parkingspot`
--
ALTER TABLE `parkingspot`
  ADD PRIMARY KEY (`Matricula`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
