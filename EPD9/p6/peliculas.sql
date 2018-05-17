-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-06-2016 a las 19:40:47
-- Versión del servidor: 10.1.10-MariaDB
-- Versión de PHP: 5.5.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `peliculas`
--
CREATE DATABASE IF NOT EXISTS `peliculas` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `peliculas`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pelicula`
--

CREATE TABLE `pelicula` (
  `id` int(5) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `fechaEstreno` date NOT NULL,
  `fechaVideo` date NOT NULL,
  `idioma` varchar(20) NOT NULL,
  `pais` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pelicula`
--

INSERT INTO `pelicula` (`id`, `nombre`, `fechaEstreno`, `fechaVideo`, `idioma`, `pais`) VALUES
(1, 'Jurassic Park', '1993-06-01', '1993-12-01', 'ingles', 'Estados Unidos'),
(2, 'Celda 211', '2009-08-01', '2010-01-01', 'español', 'España'),
(3, 'Buscando a Nemo', '2011-01-01', '2011-06-01', 'ingles', 'Estados Unidos'),
(4, 'El Kaisser', '2015-10-01', '2016-02-01', 'aleman', 'Alemania');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `pelicula`
--
ALTER TABLE `pelicula`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `pelicula`
--
ALTER TABLE `pelicula`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
