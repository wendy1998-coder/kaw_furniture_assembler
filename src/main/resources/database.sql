-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 07, 2022 at 12:25 PM
-- Server version: 8.0.13-4
-- PHP Version: 7.2.24-0ubuntu0.18.04.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sxk77JdigU`
--
CREATE DATABASE IF NOT EXISTS `sxk77JdigU` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `sxk77JdigU`;

-- --------------------------------------------------------

--
-- Table structure for table `Furniture_piece`
--

DROP TABLE IF EXISTS `Furniture_piece`;
CREATE TABLE `Furniture_piece` (
  `id` int(11) NOT NULL,
  `name` varchar(35) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `furniture_set` int(4) NOT NULL COMMENT 'FK naar Furniture_set',
  `slot` enum('Workshop wall','Throneroom wall','Chamber wall','Top left','Mid left','Bottom left','Armor','Weapon','Floor','Rug','Dias','Left side throne','Right side throne','Throne','Pillars','Banner','Chandelier','Pet food','Pet') COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Furniture_piece`
--

INSERT INTO `Furniture_piece` (`id`, `name`, `furniture_set`, `slot`) VALUES
(1, 'Green Marble Workshop Wall', 4, 'Workshop wall'),
(2, 'Blue Marble Workshop Wall', 4, 'Workshop wall'),
(3, 'Slate Gray Workshop Wall', 4, 'Workshop wall'),
(4, 'Slate Gray Marble Wall', 4, 'Throneroom wall'),
(5, 'Blue Marble Wall', 4, 'Throneroom wall'),
(6, 'Purple Marble Wall', 4, 'Throneroom wall'),
(7, 'Green Marble Chamber Wall', 4, 'Chamber wall'),
(8, 'Blue Marble Chamber Wall', 4, 'Chamber wall'),
(9, 'Purple Marble Chamber Wall', 4, 'Chamber wall'),
(10, 'Gray Breastplate', 4, 'Armor'),
(11, 'Dark Gray Breastplate', 4, 'Armor'),
(12, 'Black Breastplate', 4, 'Armor'),
(16, 'Green Horse Head Banner', 4, 'Banner'),
(17, 'Blue Horse Head Banner', 4, 'Banner'),
(18, 'Purple Horse Head Banner', 4, 'Banner'),
(19, 'Green Horse Head Tabard', 4, 'Bottom left'),
(20, 'Blue Horse Head Tabard', 4, 'Bottom left'),
(21, 'Red Horse Head Tabard', 4, 'Bottom left'),
(22, 'Yellow Iron Chandelier', 4, 'Chandelier'),
(23, 'Blue Iron Chandelier', 4, 'Chandelier'),
(24, 'Black Iron Chandelier', 4, 'Chandelier'),
(25, 'White Marble Dais', 4, 'Dias'),
(26, 'Gray Marble Dais', 4, 'Dias'),
(27, 'Slate Gray Marble Dais', 4, 'Dias'),
(28, 'White Marble Floor', 4, 'Floor'),
(29, 'Blue Marble Floor', 4, 'Floor'),
(30, 'Black Marble Floor', 4, 'Floor'),
(31, 'Blue Horse Bust', 4, 'Left side throne'),
(32, 'Salmon Horse Bust', 4, 'Left side throne'),
(33, 'Target Dummy', 4, 'Mid left'),
(34, 'Archery Dummy', 4, 'Mid left'),
(35, 'Blood-Spattered Dummy', 4, 'Mid left'),
(36, 'Chestnut Horse', 4, 'Pet'),
(37, 'Red Dun Horse', 4, 'Pet'),
(38, 'Blood Bay Horse', 4, 'Pet'),
(39, 'Pile of Feed', 4, 'Pet food'),
(40, 'Stack of Fodder', 4, 'Pet food'),
(41, 'Stack of Hay', 4, 'Pet food'),
(42, 'Green Marble Pillars', 4, 'Pillars'),
(43, 'White Marble Pillars', 4, 'Pillars'),
(44, 'Salmon Marble Pillars', 4, 'Pillars'),
(45, 'Gray Charger Bust', 4, 'Right side throne'),
(46, 'White Charger Bust', 4, 'Right side throne'),
(47, 'Salmon Charger Bust', 4, 'Right side throne'),
(48, 'Green Carpet', 4, 'Rug'),
(49, 'Blue Carpet', 4, 'Rug'),
(50, 'Red Carpet', 4, 'Rug'),
(51, 'Orange Horse Head Throne', 4, 'Throne'),
(52, 'Blue Horse Head Throne', 4, 'Throne'),
(53, 'Red Horse Head Throne', 4, 'Throne'),
(54, 'Green Horse Head Shield', 4, 'Top left'),
(55, 'Purple Horse Head Shield', 4, 'Top left'),
(56, 'Red Horse Head Shield', 4, 'Top left'),
(57, 'Ornate Crossed Swords', 4, 'Weapon'),
(58, 'Ornamental Crossed Swords', 4, 'Weapon'),
(59, 'Wall-Mounted Crossed Swords', 4, 'Weapon'),
(60, 'Aurafrost Palace Chamber Wall', 1, 'Chamber wall'),
(61, 'Aurafrost Palace Wall', 1, 'Throneroom wall'),
(62, 'Aurafrost Palace Workshop Wall', 1, 'Workshop wall'),
(63, 'Default wall', 5, 'Chamber wall'),
(64, 'Default wall', 5, 'Throneroom wall'),
(65, 'Default Workshop Wall', 5, 'Workshop wall'),
(66, 'Shipwreck Workshop Wall', 6, 'Workshop wall'),
(67, 'Shipwreck Wall', 6, 'Throneroom wall'),
(68, 'Oceanview Chamber Wall', 6, 'Chamber wall'),
(69, 'Cracked Horn of Summoning', 6, 'Armor'),
(70, 'Potion of Willpower', 7, 'Armor'),
(71, 'Banner of the Blood Trident', 6, 'Banner'),
(72, 'Banner of the Thaumadrake', 3, 'Banner'),
(73, 'Banner of Viskard', 7, 'Banner'),
(74, 'Prayerbook to Rosabranta', 6, 'Bottom left'),
(75, 'Aurafrost Palace Chandelier', 1, 'Chandelier'),
(76, 'Anemone Chandelier', 6, 'Chandelier'),
(77, 'Silverknight Dais', 8, 'Dias'),
(78, 'Woven Reed Dais', 6, 'Dias'),
(79, 'Thaumadrake Dais', 3, 'Dias'),
(80, 'Seaglass Floor', 6, 'Floor'),
(81, 'Seaglass Vase, Left', 6, 'Left side throne'),
(82, 'The Tablet of Alramalia', 3, 'Left side throne'),
(83, 'Crown of the Astral', 3, 'Left side throne'),
(84, 'Viskard\'s Wellspring', 7, 'Left side throne'),
(85, 'Map of Nautical Tactics', 6, 'Mid left'),
(86, 'Thaumadrake Crystal Daggers', 3, 'Mid left'),
(87, 'Sheldon the Sea Otter', 6, 'Pet'),
(88, 'Crackling Seawater', 6, 'Pet food'),
(89, 'Warding Crystal Bowl', 9, 'Pet food'),
(90, 'Seaglass Pillars', 6, 'Pillars'),
(91, 'Thaumadrake Pillars', 3, 'Pillars'),
(92, 'Thaumadrake Railing', 3, 'Pillars'),
(93, 'Seaglass Vase, Right', 6, 'Right side throne'),
(94, 'Winter Fae Palace Path', 10, 'Rug'),
(95, 'Woven Reed Carpet', 6, 'Rug'),
(96, 'Shipwreck Throne', 6, 'Throne'),
(97, 'Sparking Rod of Lightning', 6, 'Top left'),
(98, 'Thaumadrake Crystal Shield', 3, 'Top left'),
(99, 'Token of Rosabranta', 11, 'Top left'),
(100, 'Captured Blood Trident', 6, 'Weapon');

-- --------------------------------------------------------

--
-- Table structure for table `Furniture_set`
--

DROP TABLE IF EXISTS `Furniture_set`;
CREATE TABLE `Furniture_set` (
  `id` int(11) NOT NULL,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `currentSet` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Furniture_set`
--

INSERT INTO `Furniture_set` (`id`, `name`, `currentSet`) VALUES
(1, 'Aurafrost palace', 0),
(3, 'Thaumadrake', 0),
(4, 'Standard', 0),
(5, 'Default', 0),
(6, 'Seasunken', 0),
(7, 'Viskard temple', 0),
(8, 'Priark', 0),
(9, 'Zeruan', 0),
(10, 'Faefrost', 0),
(11, 'Vampirates', 0),
(12, 'Caduceal', 0),
(13, 'Bloody Bandage', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Furniture_piece`
--
ALTER TABLE `Furniture_piece`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_set` (`furniture_set`);

--
-- Indexes for table `Furniture_set`
--
ALTER TABLE `Furniture_set`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Furniture_piece`
--
ALTER TABLE `Furniture_piece`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `Furniture_set`
--
ALTER TABLE `Furniture_set`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Furniture_piece`
--
ALTER TABLE `Furniture_piece`
  ADD CONSTRAINT `fk_set` FOREIGN KEY (`furniture_set`) REFERENCES `Furniture_set` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
