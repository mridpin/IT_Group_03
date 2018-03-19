-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 12, 2018 at 12:26 PM
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
-- Database: `garage`
--
CREATE DATABASE IF NOT EXISTS `garage` DEFAULT CHARACTER SET utf16 COLLATE utf16_spanish_ci;
USE `garage`;

-- --------------------------------------------------------

--
-- Table structure for table `parking`
--

CREATE TABLE `parking` (
  `matricula` varchar(8) COLLATE utf16_spanish_ci NOT NULL,
  `modelo` varchar(20) COLLATE utf16_spanish_ci NOT NULL,
  `entrada` int(16) NOT NULL,
  `salida` varchar(16) COLLATE utf16_spanish_ci NOT NULL,
  `tiempo_permitido` int(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_spanish_ci;

--
-- Dumping data for table `parking`
--

INSERT INTO `parking` (`matricula`, `modelo`, `entrada`, `salida`, `tiempo_permitido`) VALUES
('1234ABC', 'Tesla Model X', 1434, '714', 15),
('1234EXA', 'Example Car 2', 480, '--', 120),
('7878', 'FERRARI', 950, '1200', 45),
('9999ZZZ', 'LAMBO', 752, '774', 60);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `parking`
--
ALTER TABLE `parking`
  ADD PRIMARY KEY (`matricula`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
