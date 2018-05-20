-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-05-2017 a las 22:35:32
-- Versión del servidor: 10.1.10-MariaDB
-- Versión de PHP: 5.5.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `almacen`
--
CREATE DATABASE IF NOT EXISTS `almacen` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `almacen`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libro`
--

CREATE TABLE `libro` (
  `id` int(11) NOT NULL,
  `autor` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `titulo` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `precio` float NOT NULL,
  `isbn` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `libro`
--

INSERT INTO `libro` (`id`, `autor`, `titulo`, `precio`, `isbn`) VALUES
(1, 'Arturo Pérez Reverte', 'El Capitan Alatriste', 1111, 101),
(2, 'Neil Gaiman', 'Humos y Espejos', 12, 102),
(3, 'Lewis Carrol', 'Alicia en el País de las Maravillas', 15, 103),
(4, 'Philip K. Dick', 'Cuentos Completos I', 14.5, 104),
(5, 'H. P. Lovecraft', 'La Llamada de Cthulhu', 11, 105),
(6, 'Arturo Perez Reverte', 'La Piel del Tambor', 118, 106);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `libro`
--
ALTER TABLE `libro`
  ADD PRIMARY KEY (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
