-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 2021 m. Bir 22 d. 13:40
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kursas`
--

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `autoriai`
--

CREATE TABLE `autoriai` (
  `Autoriaus_id` int(11) NOT NULL,
  `Vardas` varchar(255) COLLATE utf8mb4_lithuanian_ci NOT NULL,
  `Pavarde` varchar(255) COLLATE utf8mb4_lithuanian_ci NOT NULL,
  `Gimimo_metai` date NOT NULL,
  `El_pastas` varchar(255) COLLATE utf8mb4_lithuanian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_lithuanian_ci;

--
-- Sukurta duomenų kopija lentelei `autoriai`
--

INSERT INTO `autoriai` (`Autoriaus_id`, `Vardas`, `Pavarde`, `Gimimo_metai`, `El_pastas`) VALUES
(123, 'Autorius', 'Auto', '1999-11-11', 'auto@auto.lt'),
(321, 'Das', 'Auto', '1988-12-12', 'a@b.c');

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `komentarai`
--

CREATE TABLE `komentarai` (
  `Komentaro_id` int(11) NOT NULL,
  `Kurso_id` int(11) NOT NULL,
  `Komentaras` text COLLATE utf8mb4_lithuanian_ci NOT NULL,
  `Sukurimo_data` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Autorius` varchar(255) COLLATE utf8mb4_lithuanian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_lithuanian_ci;

--
-- Sukurta duomenų kopija lentelei `komentarai`
--

INSERT INTO `komentarai` (`Komentaro_id`, `Kurso_id`, `Komentaras`, `Sukurimo_data`, `Autorius`) VALUES
(1, 1, 'Naujas komentaras', '2020-12-11 21:00:00', '123'),
(2, 1, 'Naujas komentaras', '2020-12-11 21:00:00', '123'),
(3, 1, 'Naujas komentaras', '2020-12-11 21:00:00', '123'),
(4, 4, 'Naujausias komentaras', '2021-06-22 09:24:46', '321');

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `kursai`
--

CREATE TABLE `kursai` (
  `Kurso_id` int(11) NOT NULL,
  `Autoriaus_id` int(11) NOT NULL,
  `Sukurimo_data` datetime NOT NULL,
  `Pavadinimas` varchar(255) COLLATE utf8mb4_lithuanian_ci NOT NULL,
  `Trumpas_aprasas` varchar(100) COLLATE utf8mb4_lithuanian_ci NOT NULL,
  `Platus_aprasas` text COLLATE utf8mb4_lithuanian_ci NOT NULL,
  `Nuotraukos_path` varchar(255) COLLATE utf8mb4_lithuanian_ci NOT NULL,
  `Kaina` float NOT NULL,
  `Reitingas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_lithuanian_ci;

--
-- Sukurta duomenų kopija lentelei `kursai`
--

INSERT INTO `kursai` (`Kurso_id`, `Autoriaus_id`, `Sukurimo_data`, `Pavadinimas`, `Trumpas_aprasas`, `Platus_aprasas`, `Nuotraukos_path`, `Kaina`, `Reitingas`) VALUES
(1, 123, '2020-12-12 00:00:00', 'PHP pagrindai', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Provident pariatur odit voluptatibus cum! ', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Provident pariatur odit voluptatibus cum! Suscipitv cumat.', './img/php.jpg', 10.1, 3),
(2, 321, '2020-12-12 00:00:00', 'HTML/CSS Įvadas', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Provident pariaturodit voluptatibus cum! S', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Provident pariaturodit voluptatibus cum! Suscipitv cumat.', './img/css.jpg', 9.9, 4),
(3, 123, '2020-12-12 00:00:00', 'Pažintis Su GIT', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Provident pariaturodit voluptatibus cum! S', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Provident pariaturodit voluptatibus cum! Suscipitv cumat.', './img/git.jpg', 9.9, 4),
(4, 321, '2020-12-12 00:00:00', 'JavaScript Žaliems', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Provident pariaturodit voluptatibus cum! S', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Provident pariaturodit voluptatibus cum! Suscipitv cumat.', './img/js.jpg', 9.9, 5);

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `nupirkti_kursai`
--

CREATE TABLE `nupirkti_kursai` (
  `pirkejo_id` int(11) NOT NULL,
  `kurso_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_lithuanian_ci;

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `pirkejai`
--

CREATE TABLE `pirkejai` (
  `Pirkejo_id` int(11) NOT NULL,
  `Vardas` varchar(255) COLLATE utf8mb4_lithuanian_ci NOT NULL,
  `Pavarde` varchar(255) COLLATE utf8mb4_lithuanian_ci NOT NULL,
  `Gimimo_metai` date NOT NULL,
  `El_pastas` varchar(255) COLLATE utf8mb4_lithuanian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_lithuanian_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `autoriai`
--
ALTER TABLE `autoriai`
  ADD PRIMARY KEY (`Autoriaus_id`);

--
-- Indexes for table `komentarai`
--
ALTER TABLE `komentarai`
  ADD PRIMARY KEY (`Komentaro_id`),
  ADD KEY `Komentarai_fk0` (`Kurso_id`);

--
-- Indexes for table `kursai`
--
ALTER TABLE `kursai`
  ADD PRIMARY KEY (`Kurso_id`),
  ADD KEY `Kursai_fk0` (`Autoriaus_id`);

--
-- Indexes for table `nupirkti_kursai`
--
ALTER TABLE `nupirkti_kursai`
  ADD KEY `Nupirkti_kursai_fk0` (`pirkejo_id`),
  ADD KEY `Nupirkti_kursai_fk1` (`kurso_id`);

--
-- Indexes for table `pirkejai`
--
ALTER TABLE `pirkejai`
  ADD PRIMARY KEY (`Pirkejo_id`);

--
-- Apribojimai eksportuotom lentelėm
--

--
-- Apribojimai lentelei `komentarai`
--
ALTER TABLE `komentarai`
  ADD CONSTRAINT `Komentarai_fk0` FOREIGN KEY (`Kurso_id`) REFERENCES `kursai` (`Kurso_id`);

--
-- Apribojimai lentelei `kursai`
--
ALTER TABLE `kursai`
  ADD CONSTRAINT `Kursai_fk0` FOREIGN KEY (`Autoriaus_id`) REFERENCES `autoriai` (`Autoriaus_id`);

--
-- Apribojimai lentelei `nupirkti_kursai`
--
ALTER TABLE `nupirkti_kursai`
  ADD CONSTRAINT `Nupirkti_kursai_fk0` FOREIGN KEY (`pirkejo_id`) REFERENCES `pirkejai` (`Pirkejo_id`),
  ADD CONSTRAINT `Nupirkti_kursai_fk1` FOREIGN KEY (`kurso_id`) REFERENCES `kursai` (`Kurso_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
