-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 16, 2021 at 10:17 AM
-- Server version: 10.5.9-MariaDB
-- PHP Version: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mmorpg_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `username`) VALUES
(1, 'shiar'),
(2, 'kungen'),
(3, 'mrgoblin');

-- --------------------------------------------------------

--
-- Table structure for table `auction_bids_history`
--

CREATE TABLE `auction_bids_history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `bidder_id` bigint(20) UNSIGNED NOT NULL,
  `listing_id` bigint(20) UNSIGNED NOT NULL,
  `bid_total` decimal(10,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `bid_g` mediumint(8) UNSIGNED NOT NULL,
  `bid_s` tinyint(3) UNSIGNED NOT NULL,
  `bid_c` tinyint(3) UNSIGNED NOT NULL,
  `active` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auction_bids_history`
--

INSERT INTO `auction_bids_history` (`id`, `bidder_id`, `listing_id`, `bid_total`, `bid_g`, `bid_s`, `bid_c`, `active`, `created_at`) VALUES
(1, 2, 1, '801.00', 801, 0, 0, 1, '2021-05-04 16:20:56'),
(2, 3, 1, '820.00', 820, 0, 0, 1, '2021-05-04 16:20:56');

-- --------------------------------------------------------

--
-- Table structure for table `auction_categories`
--

CREATE TABLE `auction_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `title` varchar(45) NOT NULL,
  `show_order` tinyint(3) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auction_categories`
--

INSERT INTO `auction_categories` (`id`, `parent_id`, `title`, `show_order`) VALUES
(1, 1, 'Reagents', 0),
(2, 0, 'Alchemy', 0);

-- --------------------------------------------------------

--
-- Table structure for table `auction_listings`
--

CREATE TABLE `auction_listings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `character_id` bigint(20) UNSIGNED NOT NULL,
  `item_id` bigint(20) UNSIGNED NOT NULL,
  `auction_category_id` int(10) UNSIGNED NOT NULL,
  `quantity` tinyint(3) UNSIGNED NOT NULL,
  `starting_bid_total` decimal(10,2) UNSIGNED NOT NULL,
  `starting_bid_g` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `starting_bid_s` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `starting_bid_c` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `buyout_total` decimal(10,2) UNSIGNED NOT NULL,
  `buyout_g` mediumint(8) UNSIGNED NOT NULL,
  `buyout_s` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `buyout_c` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL,
  `expires_at` datetime NOT NULL,
  `delisted` tinyint(4) NOT NULL DEFAULT 0,
  `sold` tinyint(3) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auction_listings`
--

INSERT INTO `auction_listings` (`id`, `character_id`, `item_id`, `auction_category_id`, `quantity`, `starting_bid_total`, `starting_bid_g`, `starting_bid_s`, `starting_bid_c`, `buyout_total`, `buyout_g`, `buyout_s`, `buyout_c`, `created_at`, `expires_at`, `delisted`, `sold`) VALUES
(1, 1, 1, 2, 1, '800.00', 800, 0, 0, '0.00', 900, 0, 0, '2021-05-04 16:17:35', '2021-05-04 16:17:35', 0, 0),
(2, 1, 1, 2, 1, '0.01', 0, 0, 1, '0.00', 9000, 0, 0, '2021-05-04 16:17:35', '2021-05-04 16:17:35', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `characters`
--

CREATE TABLE `characters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `account_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `realm_id` int(10) UNSIGNED NOT NULL,
  `race_id` tinyint(3) UNSIGNED NOT NULL,
  `class_id` tinyint(3) UNSIGNED NOT NULL,
  `name` varchar(45) NOT NULL,
  `lvl` smallint(5) UNSIGNED NOT NULL,
  `gold` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `silver` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `copper` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `location` varchar(20) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `characters`
--

INSERT INTO `characters` (`id`, `account_id`, `realm_id`, `race_id`, `class_id`, `name`, `lvl`, `gold`, `silver`, `copper`, `location`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 2, 'Shiar', 60, 45000, 77, 45, '', '2021-05-04 16:13:32', '2021-05-04 16:13:32'),
(2, 2, 1, 2, 1, 'Kungen', 70, 0, 0, 0, '', '2021-05-04 16:15:21', '2021-05-04 16:15:21'),
(3, 2, 1, 2, 5, 'Sontse', 70, 0, 0, 0, '', '2021-05-04 16:15:21', '2021-05-04 16:15:21');

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

CREATE TABLE `classes` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `title` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `classes`
--

INSERT INTO `classes` (`id`, `title`) VALUES
(2, 'Druid'),
(3, 'Hunter'),
(7, 'Mage'),
(5, 'Paladin'),
(6, 'Priest'),
(9, 'Rogue'),
(4, 'Shaman'),
(8, 'Warlock'),
(1, 'Warrior');

-- --------------------------------------------------------

--
-- Table structure for table `factions`
--

CREATE TABLE `factions` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `title` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `factions`
--

INSERT INTO `factions` (`id`, `title`) VALUES
(1, 'Horde'),
(2, 'Alliance');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `title`) VALUES
(1, 'Arcanite Bar');

-- --------------------------------------------------------

--
-- Table structure for table `npcs`
--

CREATE TABLE `npcs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `races`
--

CREATE TABLE `races` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `title` varchar(45) NOT NULL,
  `faction_id` tinyint(3) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `races`
--

INSERT INTO `races` (`id`, `title`, `faction_id`) VALUES
(1, 'Orc', 1),
(2, 'Tauren', 1),
(3, 'Darkspear Troll', 1),
(4, 'Forsaken', 1),
(5, 'Goblin', 1),
(6, 'Zandarali Troll', 1),
(7, 'Vulpera', 1),
(8, 'Nightborne Elf', 1),
(9, 'Maghar Orc', 1),
(10, 'Humans', 2),
(11, 'Dwarfs', 2),
(12, 'Night Elfs', 2),
(13, 'Gnomes', 2),
(14, 'Void Elfs', 2),
(15, 'Kul Tiran', 2),
(16, 'Dark Iron Dwarf', 2),
(17, 'Mecha gnome', 2),
(18, 'Blood Elf', 1),
(19, 'Dranei', 2),
(20, 'Lightforge Dranei', 2),
(21, 'Worgen', 2),
(22, 'Highmountain Tauren', 1);

-- --------------------------------------------------------

--
-- Table structure for table `race_class_combo`
--

CREATE TABLE `race_class_combo` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `race_id` tinyint(3) UNSIGNED NOT NULL,
  `class_id` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `race_class_combo`
--

INSERT INTO `race_class_combo` (`id`, `race_id`, `class_id`) VALUES
(1, 1, 1),
(4, 1, 3),
(7, 1, 4),
(5, 1, 6),
(8, 1, 8),
(6, 1, 9),
(2, 2, 1),
(3, 2, 2),
(9, 2, 3),
(12, 2, 4),
(10, 2, 5),
(11, 2, 6),
(24, 3, 1),
(15, 3, 2),
(16, 3, 3),
(22, 3, 4),
(18, 3, 6),
(17, 3, 7),
(23, 3, 8),
(21, 3, 9),
(29, 4, 1),
(26, 4, 6),
(25, 4, 7),
(28, 4, 8),
(27, 4, 9),
(31, 10, 5),
(32, 10, 6),
(30, 10, 7),
(34, 10, 8),
(33, 10, 9),
(39, 11, 1),
(35, 11, 3),
(38, 11, 4),
(36, 11, 5),
(37, 11, 6);

-- --------------------------------------------------------

--
-- Table structure for table `realms`
--

CREATE TABLE `realms` (
  `id` int(10) UNSIGNED NOT NULL,
  `realm_category_id` tinyint(3) UNSIGNED NOT NULL,
  `name` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `realms`
--

INSERT INTO `realms` (`id`, `realm_category_id`, `name`) VALUES
(1, 1, 'Ahn\'Qiraj');

-- --------------------------------------------------------

--
-- Table structure for table `spells`
--

CREATE TABLE `spells` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `class_id` tinyint(3) UNSIGNED NOT NULL,
  `required_lvl` smallint(5) UNSIGNED NOT NULL,
  `rank_id` tinyint(10) UNSIGNED NOT NULL,
  `title` varchar(45) NOT NULL,
  `spec_id` tinyint(3) UNSIGNED NOT NULL,
  `cost_g` tinyint(3) UNSIGNED NOT NULL,
  `cost_s` tinyint(3) UNSIGNED NOT NULL,
  `cost_c` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auction_bids_history`
--
ALTER TABLE `auction_bids_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bidder_id` (`bidder_id`),
  ADD KEY `listing_id` (`listing_id`);

--
-- Indexes for table `auction_categories`
--
ALTER TABLE `auction_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auction_listings`
--
ALTER TABLE `auction_listings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `character_id` (`character_id`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `auction_category_id` (`auction_category_id`),
  ADD KEY `character_id_2` (`character_id`);

--
-- Indexes for table `characters`
--
ALTER TABLE `characters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `realm_id` (`realm_id`),
  ADD KEY `race_id` (`race_id`),
  ADD KEY `class_id` (`class_id`),
  ADD KEY `account_id` (`account_id`);

--
-- Indexes for table `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `title` (`title`);

--
-- Indexes for table `factions`
--
ALTER TABLE `factions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `npcs`
--
ALTER TABLE `npcs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `races`
--
ALTER TABLE `races`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `title` (`title`),
  ADD KEY `faction_id` (`faction_id`);

--
-- Indexes for table `race_class_combo`
--
ALTER TABLE `race_class_combo`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `race_id_2` (`race_id`,`class_id`),
  ADD KEY `race_id` (`race_id`),
  ADD KEY `combo_id` (`class_id`);

--
-- Indexes for table `realms`
--
ALTER TABLE `realms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `realm_category_id` (`realm_category_id`);

--
-- Indexes for table `spells`
--
ALTER TABLE `spells`
  ADD PRIMARY KEY (`id`),
  ADD KEY `class_id` (`class_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `auction_bids_history`
--
ALTER TABLE `auction_bids_history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `auction_categories`
--
ALTER TABLE `auction_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `auction_listings`
--
ALTER TABLE `auction_listings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `characters`
--
ALTER TABLE `characters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `classes`
--
ALTER TABLE `classes`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `factions`
--
ALTER TABLE `factions`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `npcs`
--
ALTER TABLE `npcs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `races`
--
ALTER TABLE `races`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `race_class_combo`
--
ALTER TABLE `race_class_combo`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `realms`
--
ALTER TABLE `realms`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `spells`
--
ALTER TABLE `spells`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auction_bids_history`
--
ALTER TABLE `auction_bids_history`
  ADD CONSTRAINT `auction_bids_history_ibfk_1` FOREIGN KEY (`bidder_id`) REFERENCES `characters` (`id`),
  ADD CONSTRAINT `auction_bids_history_ibfk_2` FOREIGN KEY (`listing_id`) REFERENCES `auction_listings` (`id`);

--
-- Constraints for table `auction_listings`
--
ALTER TABLE `auction_listings`
  ADD CONSTRAINT `auction_listings_ibfk_1` FOREIGN KEY (`auction_category_id`) REFERENCES `auction_categories` (`id`),
  ADD CONSTRAINT `auction_listings_ibfk_2` FOREIGN KEY (`character_id`) REFERENCES `characters` (`id`),
  ADD CONSTRAINT `auction_listings_ibfk_3` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`);

--
-- Constraints for table `characters`
--
ALTER TABLE `characters`
  ADD CONSTRAINT `characters_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`),
  ADD CONSTRAINT `characters_ibfk_2` FOREIGN KEY (`race_id`) REFERENCES `races` (`id`),
  ADD CONSTRAINT `characters_ibfk_3` FOREIGN KEY (`realm_id`) REFERENCES `realms` (`id`),
  ADD CONSTRAINT `characters_ibfk_4` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`);

--
-- Constraints for table `races`
--
ALTER TABLE `races`
  ADD CONSTRAINT `races_ibfk_1` FOREIGN KEY (`faction_id`) REFERENCES `factions` (`id`);

--
-- Constraints for table `race_class_combo`
--
ALTER TABLE `race_class_combo`
  ADD CONSTRAINT `race_class_combo_ibfk_1` FOREIGN KEY (`race_id`) REFERENCES `races` (`id`),
  ADD CONSTRAINT `race_class_combo_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`);

--
-- Constraints for table `spells`
--
ALTER TABLE `spells`
  ADD CONSTRAINT `spells_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
