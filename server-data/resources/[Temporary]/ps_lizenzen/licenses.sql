-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 07. Mai 2020 um 13:52
-- Server-Version: 10.4.11-MariaDB
-- PHP-Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `essentialmode`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `licenses`
--

CREATE TABLE `licenses` (
  `type` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `licenses`
--

INSERT INTO `licenses` (`type`, `label`) VALUES
('aircraft', 'Fluglizenz'),
('boat', 'Boot - Lizenz'),
('dmv', 'Theoretische Prüfung'),
('drive', 'PKW - Lizenz'),
('drive_bike', 'Motorradlizenz'),
('drive_truck', 'LKW - Lizenz'),
('ehk', 'Erste-Hilfe Lizenz'),
('flight2', 'Militär-Fluglizenz'),
('pbs', 'Personen Beförderungsschein'),
('taxi', 'Taxilizenz'),
('weapon', 'Waffenschein');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `licenses`
--
ALTER TABLE `licenses`
  ADD PRIMARY KEY (`type`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
