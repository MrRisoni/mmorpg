-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 04, 2021 at 04:23 PM
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
(2, 'kungen');

-- --------------------------------------------------------

--
-- Table structure for table `auction_bids_history`
--

CREATE TABLE `auction_bids_history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `bidder_id` bigint(20) UNSIGNED NOT NULL,
  `listing_id` bigint(20) UNSIGNED NOT NULL,
  `bid_g` mediumint(8) UNSIGNED NOT NULL,
  `bid_s` tinyint(3) UNSIGNED NOT NULL,
  `bid_c` tinyint(3) UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auction_bids_history`
--

INSERT INTO `auction_bids_history` (`id`, `bidder_id`, `listing_id`, `bid_g`, `bid_s`, `bid_c`, `created_at`) VALUES
(1, 2, 1, 801, 0, 0, '2021-05-04 16:20:56');

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
  `starting_bid_g` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `starting_bid_c` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `starting_bid_s` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `buyout_g` mediumint(8) UNSIGNED NOT NULL,
  `buyout_s` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `buyout_c` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL,
  `expires_at` datetime NOT NULL,
  `delisted` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auction_listings`
--

INSERT INTO `auction_listings` (`id`, `character_id`, `item_id`, `auction_category_id`, `quantity`, `starting_bid_g`, `starting_bid_c`, `starting_bid_s`, `buyout_g`, `buyout_s`, `buyout_c`, `created_at`, `expires_at`, `delisted`) VALUES
(1, 1, 1, 2, 10, 800, 0, 0, 900, 0, 0, '2021-05-04 16:17:35', '2021-05-04 16:17:35', 0);

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
(2, 2, 1, 2, 1, 'Kungen', 70, 0, 0, 0, '', '2021-05-04 16:15:21', '2021-05-04 16:15:21');

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
(2, 'Tauren', 1);

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
(2, 2, 1),
(3, 2, 2);

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
  ADD UNIQUE KEY `title` (`title`);

--
-- Indexes for table `race_class_combo`
--
ALTER TABLE `race_class_combo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `race_id` (`race_id`),
  ADD KEY `combo_id` (`class_id`);

--
-- Indexes for table `realms`
--
ALTER TABLE `realms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `realm_category_id` (`realm_category_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `auction_bids_history`
--
ALTER TABLE `auction_bids_history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `auction_categories`
--
ALTER TABLE `auction_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `auction_listings`
--
ALTER TABLE `auction_listings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `characters`
--
ALTER TABLE `characters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `classes`
--
ALTER TABLE `classes`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `race_class_combo`
--
ALTER TABLE `race_class_combo`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `realms`
--
ALTER TABLE `realms`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
-- Constraints for table `race_class_combo`
--
ALTER TABLE `race_class_combo`
  ADD CONSTRAINT `race_class_combo_ibfk_1` FOREIGN KEY (`race_id`) REFERENCES `races` (`id`),
  ADD CONSTRAINT `race_class_combo_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
