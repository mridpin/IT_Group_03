-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 20, 2018 at 04:16 PM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.2.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `peliculas`
--
CREATE DATABASE IF NOT EXISTS `peliculas` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `peliculas`;

-- --------------------------------------------------------

--
-- Table structure for table `pelicula`
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
-- Dumping data for table `pelicula`
--

INSERT INTO `pelicula` (`id`, `nombre`, `fechaEstreno`, `fechaVideo`, `idioma`, `pais`) VALUES
(1, 'Jurassic Park', '1993-06-01', '1993-12-01', 'ingles', 'Estados Unidos'),
(2, 'Celda 211', '2009-08-01', '2010-01-01', 'Spanish', 'Spain'),
(3, 'Buscando a Nemo', '2011-01-01', '2011-06-01', 'ingles', 'Estados Unidos'),
(4, 'El Kaisser', '2015-10-01', '2016-02-01', 'aleman', 'Alemania'),
(7, 'Jurassic Park', '1993-06-01', '1993-12-01', 'English', 'Estados Unidos'),
(16, 'Titanic', '1993-06-01', '1993-06-01', 'English', 'USA');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pelicula`
--
ALTER TABLE `pelicula`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pelicula`
--
ALTER TABLE `pelicula`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
