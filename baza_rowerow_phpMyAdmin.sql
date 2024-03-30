-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 30, 2024 at 01:45 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `baza_rowerow`
--

-- --------------------------------------------------------

--
-- Table structure for table `marka`
--

CREATE TABLE `marka` (
  `id_marka` int(10) NOT NULL,
  `id_rower_mrk` int(10) NOT NULL,
  `marka` enum('Scott','Connondale','Trek','GT','KTM','Ghost','Author','Merida','Felt','Orbea','Canyon','Superior','Kross','BTwin') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `miejscowosc`
--

CREATE TABLE `miejscowosc` (
  `id_miejscowosc` int(10) NOT NULL,
  `id_rower_mse` int(10) NOT NULL,
  `miejscowosc` enum('Warszawa','Krakow','Wroclaw','Poznan','Gdansk','Gdynia','Lublin','Katowice','Rzeszow') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posiada`
--

CREATE TABLE `posiada` (
  `id_posiada` int(10) NOT NULL,
  `id_uzytkownik` int(10) NOT NULL,
  `id_rower` int(10) NOT NULL,
  `data_od` date NOT NULL,
  `data_do` date NOT NULL,
  `opis` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rower`
--

CREATE TABLE `rower` (
  `id_rower` int(10) NOT NULL,
  `skradziony` enum('Tak','Nie') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `typ`
--

CREATE TABLE `typ` (
  `id_typ` int(10) NOT NULL,
  `id_rower_typ` int(10) NOT NULL,
  `typ` enum('Elektryczny','Klasyczny') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `uzytkownik`
--

CREATE TABLE `uzytkownik` (
  `id_uzytkownik` int(10) NOT NULL,
  `nazwisko` varchar(45) NOT NULL,
  `imie` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `marka`
--
ALTER TABLE `marka`
  ADD PRIMARY KEY (`id_marka`),
  ADD KEY `id_rower_mrk` (`id_rower_mrk`);

--
-- Indexes for table `miejscowosc`
--
ALTER TABLE `miejscowosc`
  ADD PRIMARY KEY (`id_miejscowosc`),
  ADD KEY `id_rower_mse` (`id_rower_mse`);

--
-- Indexes for table `posiada`
--
ALTER TABLE `posiada`
  ADD PRIMARY KEY (`id_posiada`),
  ADD KEY `id_rower` (`id_rower`),
  ADD KEY `id_uzytkownik` (`id_uzytkownik`);

--
-- Indexes for table `rower`
--
ALTER TABLE `rower`
  ADD PRIMARY KEY (`id_rower`);

--
-- Indexes for table `typ`
--
ALTER TABLE `typ`
  ADD PRIMARY KEY (`id_typ`),
  ADD KEY `id_rower` (`id_rower_typ`),
  ADD KEY `id_rower_2` (`id_rower_typ`);

--
-- Indexes for table `uzytkownik`
--
ALTER TABLE `uzytkownik`
  ADD PRIMARY KEY (`id_uzytkownik`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `marka`
--
ALTER TABLE `marka`
  ADD CONSTRAINT `id_rower_mrk` FOREIGN KEY (`id_rower_mrk`) REFERENCES `rower` (`id_rower`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `miejscowosc`
--
ALTER TABLE `miejscowosc`
  ADD CONSTRAINT `id_rower_mse` FOREIGN KEY (`id_rower_mse`) REFERENCES `rower` (`id_rower`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `posiada`
--
ALTER TABLE `posiada`
  ADD CONSTRAINT `id_rower` FOREIGN KEY (`id_rower`) REFERENCES `rower` (`id_rower`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `id_uzytkownik` FOREIGN KEY (`id_uzytkownik`) REFERENCES `uzytkownik` (`id_uzytkownik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `typ`
--
ALTER TABLE `typ`
  ADD CONSTRAINT `id_rowerr` FOREIGN KEY (`id_rower_typ`) REFERENCES `rower` (`id_rower`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
