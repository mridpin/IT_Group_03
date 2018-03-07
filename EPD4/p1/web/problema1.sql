-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-03-2018 a las 20:44:14
-- Versión del servidor: 10.1.21-MariaDB
-- Versión de PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `problema1`
--
CREATE DATABASE IF NOT EXISTS `problema1` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci;
USE `problema1`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parkingspots`
--

CREATE TABLE `parkingspots` (
  `matricula` varchar(8) COLLATE utf8_spanish_ci NOT NULL,
  `modelo` varchar(256) COLLATE utf8_spanish_ci NOT NULL,
  `horadeentrada` varchar(256) COLLATE utf8_spanish_ci NOT NULL,
  `horadesalida` varchar(256) COLLATE utf8_spanish_ci NOT NULL,
  `tiempopermitido` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `parkingspots`
--

INSERT INTO `parkingspots` (`matricula`, `modelo`, `horadeentrada`, `horadesalida`, `tiempopermitido`) VALUES
('12784HIH', 'BMW', '10:05', '--', 30),
('32162BAQ', 'Audi', '10:45', '--', 90),
('76234AAC', 'Toyota', '10:07', '10:35', 30),
('87823CDA', 'Mercedes', '10:46', '11:05', 15);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `parkingspots`
--
ALTER TABLE `parkingspots`
  ADD PRIMARY KEY (`matricula`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
