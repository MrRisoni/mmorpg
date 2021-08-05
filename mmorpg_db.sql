-- phpMyAdmin SQL Dump
-- version 5.1.1-1.fc34
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 05, 2021 at 06:54 AM
-- Server version: 10.5.9-MariaDB
-- PHP Version: 7.4.21

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
-- Table structure for table `affixes`
--

CREATE TABLE `affixes` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `title` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `affixes`
--

INSERT INTO `affixes` (`id`, `title`) VALUES
(1, 'Fortified'),
(2, 'Inspiring'),
(3, 'Grievous'),
(4, 'Tormented'),
(5, 'Tyrannical'),
(6, 'Prideful');

-- --------------------------------------------------------

--
-- Table structure for table `armory`
--

CREATE TABLE `armory` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `character_id` bigint(20) UNSIGNED NOT NULL,
  `slot_id` tinyint(3) UNSIGNED NOT NULL,
  `item_id` bigint(20) UNSIGNED NOT NULL,
  `ilvl` smallint(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `armory`
--

INSERT INTO `armory` (`id`, `character_id`, `slot_id`, `item_id`, `ilvl`) VALUES
(1, 4, 1, 7, 197),
(2, 4, 7, 11, 210);

-- --------------------------------------------------------

--
-- Table structure for table `armory_enchants`
--

CREATE TABLE `armory_enchants` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `armory_id` bigint(20) UNSIGNED NOT NULL,
  `enchant_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `armory_enchants`
--

INSERT INTO `armory_enchants` (`id`, `armory_id`, `enchant_id`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `armory_gems`
--

CREATE TABLE `armory_gems` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `armory_id` bigint(20) UNSIGNED NOT NULL,
  `gem_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `armory_gems`
--

INSERT INTO `armory_gems` (`id`, `armory_id`, `gem_id`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `armory_item_rank`
--

CREATE TABLE `armory_item_rank` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `armory_id` bigint(20) UNSIGNED NOT NULL,
  `rank` tinyint(3) UNSIGNED NOT NULL DEFAULT 2
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `armory_item_rank`
--

INSERT INTO `armory_item_rank` (`id`, `armory_id`, `rank`) VALUES
(1, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `armor_item_stats`
--

CREATE TABLE `armor_item_stats` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `item_id` bigint(20) UNSIGNED NOT NULL,
  `val` smallint(5) UNSIGNED NOT NULL,
  `stat_id` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `armor_item_stats`
--

INSERT INTO `armor_item_stats` (`id`, `item_id`, `val`, `stat_id`) VALUES
(1, 1, 24, 4),
(2, 2, 30, 4),
(3, 3, 34, 4),
(4, 4, 44, 4),
(5, 7, 44, 4),
(6, 7, 34, 3);

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
(2, 3, 1, '820.00', 820, 0, 0, 1, '2021-05-04 16:20:56'),
(3, 5, 1, '910.00', 0, 0, 0, 1, '2021-05-16 15:44:27');

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
-- Table structure for table `characher_slots`
--

CREATE TABLE `characher_slots` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `title` varchar(22) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `characher_slots`
--

INSERT INTO `characher_slots` (`id`, `title`) VALUES
(1, 'Head'),
(2, 'Neck'),
(3, 'Shoulder'),
(4, 'Back'),
(5, 'Chest'),
(6, 'Wrist'),
(7, 'Hands'),
(8, 'Waist'),
(9, 'Legs'),
(10, 'Feet'),
(11, 'Ring 1'),
(12, 'Ring 2'),
(13, 'Trinket 1'),
(14, 'Trinket 2'),
(15, 'Main Hand'),
(16, 'Off-hand');

-- --------------------------------------------------------

--
-- Table structure for table `characters`
--

CREATE TABLE `characters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `account_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `realm_id` int(10) UNSIGNED NOT NULL,
  `race_id` tinyint(3) UNSIGNED NOT NULL,
  `faction_id` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
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

INSERT INTO `characters` (`id`, `account_id`, `realm_id`, `race_id`, `faction_id`, `class_id`, `name`, `lvl`, `gold`, `silver`, `copper`, `location`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 1, 2, 'Shiar', 60, 45000, 77, 45, '', '2021-05-04 16:13:32', '2021-05-04 16:13:32'),
(2, 2, 1, 2, 1, 1, 'Kungen', 70, 0, 0, 0, '', '2021-05-04 16:15:21', '2021-05-04 16:15:21'),
(3, 2, 1, 2, 1, 5, 'Sontse', 70, 0, 0, 0, '', '2021-05-04 16:15:21', '2021-05-04 16:15:21'),
(4, 1, 1, 11, 1, 3, 'Dakini', 60, 0, 0, 0, '', '2021-05-16 15:08:49', '2021-05-16 15:08:49'),
(5, 1, 1, 4, 1, 4, 'Xav', 70, 0, 0, 0, '', '2021-05-16 15:44:04', '2021-05-16 15:44:04');

-- --------------------------------------------------------

--
-- Table structure for table `character_currencies`
--

CREATE TABLE `character_currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `character_id` bigint(20) UNSIGNED NOT NULL,
  `currency_id` bigint(20) UNSIGNED NOT NULL,
  `amount` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `character_currencies`
--

INSERT INTO `character_currencies` (`id`, `character_id`, `currency_id`, `amount`) VALUES
(1, 4, 1, 14563),
(2, 4, 3, 34);

-- --------------------------------------------------------

--
-- Table structure for table `character_scoring`
--

CREATE TABLE `character_scoring` (
  `id` bigint(10) UNSIGNED NOT NULL,
  `character_id` bigint(10) UNSIGNED NOT NULL,
  `season_id` bigint(10) UNSIGNED NOT NULL,
  `score` decimal(10,2) NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `character_scoring`
--

INSERT INTO `character_scoring` (`id`, `character_id`, `season_id`, `score`, `updated_at`) VALUES
(1, 4, 1, '456.45', '2021-07-20 05:13:36');

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
(11, 'Death Knight'),
(10, 'Demon Hunter'),
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
-- Table structure for table `class_specs`
--

CREATE TABLE `class_specs` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `class_id` tinyint(3) UNSIGNED NOT NULL,
  `title` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `class_specs`
--

INSERT INTO `class_specs` (`id`, `class_id`, `title`) VALUES
(8, 4, 'Elemental'),
(7, 4, 'Enchancement'),
(9, 4, 'Restoration'),
(1, 5, 'Holy'),
(2, 5, 'Protection'),
(3, 5, 'Retribution'),
(4, 11, 'Blood'),
(6, 11, 'Frost'),
(5, 11, 'Unholy');

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `expansion_id` tinyint(3) UNSIGNED NOT NULL,
  `title` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `expansion_id`, `title`) VALUES
(1, 2, 'Soul ash'),
(2, 2, 'Anima'),
(3, 2, 'Stygian Embers');

-- --------------------------------------------------------

--
-- Table structure for table `difficulties`
--

CREATE TABLE `difficulties` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `title` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `difficulties`
--

INSERT INTO `difficulties` (`id`, `title`) VALUES
(1, 'Normal'),
(2, 'Heroic'),
(3, 'Mythic'),
(4, 'Mythic+');

-- --------------------------------------------------------

--
-- Table structure for table `dungeons`
--

CREATE TABLE `dungeons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `expansion_id` tinyint(3) UNSIGNED NOT NULL,
  `title` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `dungeons`
--

INSERT INTO `dungeons` (`id`, `expansion_id`, `title`) VALUES
(1, 2, 'Necrotic wake'),
(2, 1, 'Spires of Ascension'),
(3, 2, 'Plaguefall'),
(4, 2, 'Theater of Pain'),
(5, 2, 'Mist of Tirna Scithe'),
(6, 2, 'De Other Side'),
(7, 2, 'Sanguine Depths'),
(8, 2, 'Halls of Atonement');

-- --------------------------------------------------------

--
-- Table structure for table `enchants`
--

CREATE TABLE `enchants` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `enchants`
--

INSERT INTO `enchants` (`id`, `title`) VALUES
(1, '+ 15 Haste');

-- --------------------------------------------------------

--
-- Table structure for table `expansions`
--

CREATE TABLE `expansions` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `title` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `expansions`
--

INSERT INTO `expansions` (`id`, `title`) VALUES
(1, 'Battle For Azerorth'),
(2, 'Shadowlands'),
(3, 'Classic');

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
-- Table structure for table `gems`
--

CREATE TABLE `gems` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gems`
--

INSERT INTO `gems` (`id`, `title`) VALUES
(1, '+20 Haste');

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
(1, 'Arcanite Bar'),
(2, 'Runecloth'),
(3, 'Coarse Thread'),
(4, 'Sinful Gladiator'),
(5, 'SInful Aspirant Axe'),
(6, 'SInful Aspirant Sword'),
(7, 'SInful Aspirant Helmet'),
(8, 'Helm of Transendence'),
(9, 'Pauldrons of Transendence'),
(10, 'Robes of Prophecy'),
(11, 'Gauntlets of endurance');

-- --------------------------------------------------------

--
-- Table structure for table `item_origins`
--

CREATE TABLE `item_origins` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `title` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item_origins`
--

INSERT INTO `item_origins` (`id`, `title`) VALUES
(1, 'Raid Finder'),
(2, 'Heroic'),
(3, 'Mythic');

-- --------------------------------------------------------

--
-- Table structure for table `item_titles`
--

CREATE TABLE `item_titles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `item_id` bigint(20) UNSIGNED NOT NULL,
  `title_id` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item_titles`
--

INSERT INTO `item_titles` (`id`, `item_id`, `title_id`) VALUES
(1, 7, 1),
(2, 11, 3);

-- --------------------------------------------------------

--
-- Table structure for table `learned_spells`
--

CREATE TABLE `learned_spells` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `character_id` bigint(20) UNSIGNED NOT NULL,
  `spell_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `learned_spells`
--

INSERT INTO `learned_spells` (`id`, `character_id`, `spell_id`) VALUES
(1, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `mobs`
--

CREATE TABLE `mobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(45) NOT NULL,
  `lvl` tinyint(3) UNSIGNED NOT NULL,
  `requires_skin` smallint(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
-- Table structure for table `party_roles`
--

CREATE TABLE `party_roles` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `title` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `party_roles`
--

INSERT INTO `party_roles` (`id`, `title`) VALUES
(1, 'Tank'),
(2, 'Healer'),
(3, 'DPS');

-- --------------------------------------------------------

--
-- Table structure for table `profession_skills`
--

CREATE TABLE `profession_skills` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `color` varchar(45) NOT NULL,
  `probability` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `profession_skills`
--

INSERT INTO `profession_skills` (`id`, `color`, `probability`) VALUES
(1, 'Orange', 100),
(2, 'Yellow', 80),
(3, 'Green', 60),
(4, 'Gray', 0);

-- --------------------------------------------------------

--
-- Table structure for table `pvp_currency`
--

CREATE TABLE `pvp_currency` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `title` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pvp_currency`
--

INSERT INTO `pvp_currency` (`id`, `title`) VALUES
(1, 'Honor'),
(2, 'Conquest');

-- --------------------------------------------------------

--
-- Table structure for table `pvp_item_upgrades`
--

CREATE TABLE `pvp_item_upgrades` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `item_id` bigint(20) UNSIGNED NOT NULL,
  `from_rank` tinyint(3) UNSIGNED NOT NULL,
  `to_rank` tinyint(3) UNSIGNED NOT NULL,
  `currency_id` tinyint(3) UNSIGNED NOT NULL,
  `new_item_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `cost` smallint(5) UNSIGNED NOT NULL,
  `renown` tinyint(3) UNSIGNED NOT NULL,
  `rating` smallint(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pvp_item_upgrades`
--

INSERT INTO `pvp_item_upgrades` (`id`, `item_id`, `from_rank`, `to_rank`, `currency_id`, `new_item_id`, `cost`, `renown`, `rating`) VALUES
(1, 1, 1, 2, 1, 2, 800, 0, 0),
(3, 3, 1, 2, 2, 4, 300, 5, 50);

-- --------------------------------------------------------

--
-- Table structure for table `pvp_vendors`
--

CREATE TABLE `pvp_vendors` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `title` varchar(34) NOT NULL,
  `currency_id` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pvp_vendors`
--

INSERT INTO `pvp_vendors` (`id`, `title`, `currency_id`) VALUES
(1, 'Honor Vendor', 1),
(2, 'Conquest Vendor', 2);

-- --------------------------------------------------------

--
-- Table structure for table `pvp_vendors_items`
--

CREATE TABLE `pvp_vendors_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `item_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `class_spec_id` tinyint(3) UNSIGNED NOT NULL,
  `vendor_id` tinyint(3) UNSIGNED NOT NULL,
  `season_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `slot_id` tinyint(3) UNSIGNED NOT NULL,
  `rank_id` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `cost` smallint(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pvp_vendors_items`
--

INSERT INTO `pvp_vendors_items` (`id`, `item_id`, `class_spec_id`, `vendor_id`, `season_id`, `slot_id`, `rank_id`, `cost`) VALUES
(1, 4, 1, 1, 1, 15, 1, 1250),
(2, 5, 1, 1, 1, 15, 2, 0),
(3, 6, 4, 2, 1, 13, 1, 525),
(4, 7, 4, 2, 1, 13, 2, 0);

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
-- Table structure for table `raids`
--

CREATE TABLE `raids` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `expansion_id` tinyint(3) UNSIGNED NOT NULL,
  `title` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `raids`
--

INSERT INTO `raids` (`id`, `expansion_id`, `title`) VALUES
(1, 2, 'Castle Nathria'),
(2, 2, 'Sanctum of Domination'),
(3, 3, 'Blackwing Lair'),
(4, 3, 'Molten Core');

-- --------------------------------------------------------

--
-- Table structure for table `raid_bosses`
--

CREATE TABLE `raid_bosses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `raid_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `raid_bosses`
--

INSERT INTO `raid_bosses` (`id`, `raid_id`, `title`) VALUES
(1, 1, 'Huntsman Altimor'),
(2, 1, 'Hungering Destroyer'),
(3, 1, 'Innerva'),
(4, 1, 'Shriekwing'),
(5, 1, 'Sludgefist'),
(6, 1, 'Stone Legion Generals'),
(7, 1, 'Kael\'thas Sunstrider'),
(8, 1, 'Artificer Xymox'),
(9, 1, 'The Council of Blood'),
(10, 1, 'Sire Denathrius'),
(11, 3, 'Nefarian'),
(12, 3, 'Chromaggus'),
(13, 4, 'Baron Geddon');

-- --------------------------------------------------------

--
-- Table structure for table `raid_bosses_killed`
--

CREATE TABLE `raid_bosses_killed` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `character_id` bigint(20) UNSIGNED NOT NULL,
  `raid_boss_id` bigint(20) UNSIGNED NOT NULL,
  `difficulty_id` tinyint(3) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `raid_bosses_killed`
--

INSERT INTO `raid_bosses_killed` (`id`, `character_id`, `raid_boss_id`, `difficulty_id`, `created_at`) VALUES
(1, 4, 8, 1, '2021-07-20 05:00:17');

-- --------------------------------------------------------

--
-- Table structure for table `raid_bosses_loot`
--

CREATE TABLE `raid_bosses_loot` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `boss_id` bigint(20) UNSIGNED NOT NULL,
  `item_id` bigint(20) UNSIGNED NOT NULL,
  `drop_chance` decimal(5,2) UNSIGNED NOT NULL DEFAULT 25.00
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `raid_bosses_loot`
--

INSERT INTO `raid_bosses_loot` (`id`, `boss_id`, `item_id`, `drop_chance`) VALUES
(1, 11, 8, '25.00'),
(2, 12, 9, '25.00'),
(3, 13, 10, '25.00');

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
-- Table structure for table `recipe`
--

CREATE TABLE `recipe` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `profession_id` tinyint(3) UNSIGNED NOT NULL,
  `requires_skill` smallint(5) UNSIGNED NOT NULL,
  `title` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `recipe`
--

INSERT INTO `recipe` (`id`, `profession_id`, `requires_skill`, `title`) VALUES
(1, 1, 200, 'Runecloth Bag');

-- --------------------------------------------------------

--
-- Table structure for table `recipe_mats`
--

CREATE TABLE `recipe_mats` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `recipe_id` bigint(20) UNSIGNED NOT NULL,
  `item_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `recipe_mats`
--

INSERT INTO `recipe_mats` (`id`, `recipe_id`, `item_id`, `quantity`) VALUES
(1, 1, 2, 10),
(2, 1, 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `reputation_factions`
--

CREATE TABLE `reputation_factions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reputation_factions`
--

INSERT INTO `reputation_factions` (`id`, `title`) VALUES
(1, 'Brood of Nozdormu');

-- --------------------------------------------------------

--
-- Table structure for table `reputation_factions_ranks`
--

CREATE TABLE `reputation_factions_ranks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `faction_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(45) NOT NULL,
  `amount` mediumint(8) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reputation_factions_ranks`
--

INSERT INTO `reputation_factions_ranks` (`id`, `faction_id`, `title`, `amount`) VALUES
(1, 1, 'Hated', 1800),
(2, 1, 'Unfriendly', 2500),
(3, 1, 'Neutral', 3400),
(4, 1, 'Honored', 4500),
(5, 1, 'Revered', 5900),
(6, 1, 'Exalted', 6300);

-- --------------------------------------------------------

--
-- Table structure for table `reputation_faction_character`
--

CREATE TABLE `reputation_faction_character` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `character_id` bigint(20) UNSIGNED NOT NULL,
  `faction_id` bigint(20) UNSIGNED NOT NULL,
  `rank_id` bigint(20) UNSIGNED NOT NULL,
  `amount` smallint(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reputation_faction_character`
--

INSERT INTO `reputation_faction_character` (`id`, `character_id`, `faction_id`, `rank_id`, `amount`) VALUES
(1, 4, 1, 3, 1560);

-- --------------------------------------------------------

--
-- Table structure for table `seasons`
--

CREATE TABLE `seasons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `expansion_id` tinyint(3) UNSIGNED NOT NULL,
  `title` varchar(35) NOT NULL,
  `starts_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `seasons`
--

INSERT INTO `seasons` (`id`, `expansion_id`, `title`, `starts_at`) VALUES
(1, 2, 'Season 1', '2020-12-01');

-- --------------------------------------------------------

--
-- Table structure for table `sl_character_covenants`
--

CREATE TABLE `sl_character_covenants` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `character_id` bigint(20) UNSIGNED NOT NULL,
  `covenant_id` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sl_character_covenants`
--

INSERT INTO `sl_character_covenants` (`id`, `character_id`, `covenant_id`) VALUES
(1, 4, 4);

-- --------------------------------------------------------

--
-- Table structure for table `sl_covenants`
--

CREATE TABLE `sl_covenants` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `title` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sl_covenants`
--

INSERT INTO `sl_covenants` (`id`, `title`) VALUES
(1, 'Kyrian'),
(2, 'Necrolords'),
(3, 'Night Fae'),
(4, 'Venthyr');

-- --------------------------------------------------------

--
-- Table structure for table `sl_covenant_conduits`
--

CREATE TABLE `sl_covenant_conduits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `covenant_id` tinyint(3) UNSIGNED NOT NULL,
  `title` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sl_covenant_conduits`
--

INSERT INTO `sl_covenant_conduits` (`id`, `covenant_id`, `title`) VALUES
(1, 1, 'test');

-- --------------------------------------------------------

--
-- Table structure for table `sl_covenant_soulbinds`
--

CREATE TABLE `sl_covenant_soulbinds` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `covenant_id` tinyint(3) UNSIGNED NOT NULL,
  `title` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sl_covenant_soulbinds`
--

INSERT INTO `sl_covenant_soulbinds` (`id`, `covenant_id`, `title`) VALUES
(1, 1, 'Kleia'),
(2, 1, 'Pelagos'),
(3, 4, 'Nadja'),
(4, 4, 'Theothar');

-- --------------------------------------------------------

--
-- Table structure for table `sl_socketed_conduits`
--

CREATE TABLE `sl_socketed_conduits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `soulbind_id` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `conduit_id` bigint(20) UNSIGNED NOT NULL,
  `character_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sl_socketed_conduits`
--

INSERT INTO `sl_socketed_conduits` (`id`, `soulbind_id`, `conduit_id`, `character_id`) VALUES
(1, 1, 1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `sl_soulbinds_characters`
--

CREATE TABLE `sl_soulbinds_characters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `character_id` bigint(20) UNSIGNED NOT NULL,
  `soulbind_id` tinyint(3) UNSIGNED NOT NULL,
  `spec_id` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sl_soulbinds_characters`
--

INSERT INTO `sl_soulbinds_characters` (`id`, `character_id`, `soulbind_id`, `spec_id`) VALUES
(1, 4, 4, 7);

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
  `cost_total` decimal(5,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `cost_g` tinyint(3) UNSIGNED NOT NULL,
  `cost_s` tinyint(3) UNSIGNED NOT NULL,
  `cost_c` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `spells`
--

INSERT INTO `spells` (`id`, `class_id`, `required_lvl`, `rank_id`, `title`, `spec_id`, `cost_total`, `cost_g`, `cost_s`, `cost_c`) VALUES
(1, 5, 12, 1, 'Redemption', 1, '0.20', 0, 2, 0),
(2, 5, 45, 1, 'Seal of Light', 1, '2.00', 2, 0, 0),
(3, 5, 52, 2, 'Seal of Light', 1, '2.80', 2, 80, 0),
(4, 5, 18, 1, 'Righteous Fury', 2, '0.50', 0, 5, 0);

-- --------------------------------------------------------

--
-- Table structure for table `stats`
--

CREATE TABLE `stats` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `title` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stats`
--

INSERT INTO `stats` (`id`, `title`) VALUES
(2, 'Agility'),
(7, 'Haste'),
(3, 'Intellect'),
(6, 'Mastery'),
(4, 'Stamina'),
(1, 'Strength'),
(5, 'Versatility');

-- --------------------------------------------------------

--
-- Table structure for table `tier_sets`
--

CREATE TABLE `tier_sets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `class_id` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `title` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tier_sets`
--

INSERT INTO `tier_sets` (`id`, `class_id`, `title`) VALUES
(1, 6, 'Transendence Regalia'),
(2, 6, 'Vestments of Prophecy');

-- --------------------------------------------------------

--
-- Table structure for table `tier_set_pieces`
--

CREATE TABLE `tier_set_pieces` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tier_set_id` bigint(20) UNSIGNED NOT NULL,
  `slot_id` tinyint(3) UNSIGNED NOT NULL,
  `item_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tier_set_pieces`
--

INSERT INTO `tier_set_pieces` (`id`, `tier_set_id`, `slot_id`, `item_id`) VALUES
(1, 1, 1, 8),
(2, 1, 3, 9),
(3, 2, 5, 10);

-- --------------------------------------------------------

--
-- Table structure for table `transmog`
--

CREATE TABLE `transmog` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `original_item_id` bigint(20) UNSIGNED NOT NULL,
  `transmoged_to_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transmog`
--

INSERT INTO `transmog` (`id`, `original_item_id`, `transmoged_to_id`) VALUES
(1, 1, 8);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `affixes`
--
ALTER TABLE `affixes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `armory`
--
ALTER TABLE `armory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `character_id` (`character_id`),
  ADD KEY `slot_id` (`slot_id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `armory_enchants`
--
ALTER TABLE `armory_enchants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `armory_id` (`armory_id`),
  ADD KEY `enchant_id` (`enchant_id`);

--
-- Indexes for table `armory_gems`
--
ALTER TABLE `armory_gems`
  ADD PRIMARY KEY (`id`),
  ADD KEY `armory_id` (`armory_id`),
  ADD KEY `gem_id` (`gem_id`);

--
-- Indexes for table `armory_item_rank`
--
ALTER TABLE `armory_item_rank`
  ADD PRIMARY KEY (`id`),
  ADD KEY `armory_id` (`armory_id`);

--
-- Indexes for table `armor_item_stats`
--
ALTER TABLE `armor_item_stats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stat_id` (`stat_id`),
  ADD KEY `armor_item_stats_ibfk_1` (`item_id`);

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
-- Indexes for table `characher_slots`
--
ALTER TABLE `characher_slots`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `characters`
--
ALTER TABLE `characters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `realm_id` (`realm_id`),
  ADD KEY `race_id` (`race_id`),
  ADD KEY `class_id` (`class_id`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `faction_id` (`faction_id`);

--
-- Indexes for table `character_currencies`
--
ALTER TABLE `character_currencies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `character_id` (`character_id`),
  ADD KEY `currency_id` (`currency_id`);

--
-- Indexes for table `character_scoring`
--
ALTER TABLE `character_scoring`
  ADD PRIMARY KEY (`id`),
  ADD KEY `character_id` (`character_id`),
  ADD KEY `season_id` (`season_id`);

--
-- Indexes for table `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `title` (`title`);

--
-- Indexes for table `class_specs`
--
ALTER TABLE `class_specs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `class_id_2` (`class_id`,`title`),
  ADD KEY `class_id` (`class_id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expansion_Id` (`expansion_id`);

--
-- Indexes for table `difficulties`
--
ALTER TABLE `difficulties`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dungeons`
--
ALTER TABLE `dungeons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expansion_id` (`expansion_id`);

--
-- Indexes for table `enchants`
--
ALTER TABLE `enchants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expansions`
--
ALTER TABLE `expansions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `factions`
--
ALTER TABLE `factions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gems`
--
ALTER TABLE `gems`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item_origins`
--
ALTER TABLE `item_origins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item_titles`
--
ALTER TABLE `item_titles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `title_id` (`title_id`);

--
-- Indexes for table `learned_spells`
--
ALTER TABLE `learned_spells`
  ADD PRIMARY KEY (`id`),
  ADD KEY `character_id` (`character_id`),
  ADD KEY `spell_id` (`spell_id`);

--
-- Indexes for table `mobs`
--
ALTER TABLE `mobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `npcs`
--
ALTER TABLE `npcs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `party_roles`
--
ALTER TABLE `party_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `profession_skills`
--
ALTER TABLE `profession_skills`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pvp_currency`
--
ALTER TABLE `pvp_currency`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pvp_item_upgrades`
--
ALTER TABLE `pvp_item_upgrades`
  ADD PRIMARY KEY (`id`),
  ADD KEY `currency_id` (`currency_id`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `new_item_id` (`new_item_id`);

--
-- Indexes for table `pvp_vendors`
--
ALTER TABLE `pvp_vendors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `currency_id` (`currency_id`);

--
-- Indexes for table `pvp_vendors_items`
--
ALTER TABLE `pvp_vendors_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `slot_id` (`slot_id`),
  ADD KEY `vendor_id` (`vendor_id`),
  ADD KEY `class_spec_id` (`class_spec_id`),
  ADD KEY `season_id` (`season_id`),
  ADD KEY `item_id` (`item_id`);

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
-- Indexes for table `raids`
--
ALTER TABLE `raids`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expansion_id` (`expansion_id`);

--
-- Indexes for table `raid_bosses`
--
ALTER TABLE `raid_bosses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `raid_id` (`raid_id`);

--
-- Indexes for table `raid_bosses_killed`
--
ALTER TABLE `raid_bosses_killed`
  ADD PRIMARY KEY (`id`),
  ADD KEY `character_id` (`character_id`),
  ADD KEY `raid_id` (`raid_boss_id`),
  ADD KEY `difficulty_id` (`difficulty_id`),
  ADD KEY `raid_boss_id` (`raid_boss_id`);

--
-- Indexes for table `raid_bosses_loot`
--
ALTER TABLE `raid_bosses_loot`
  ADD PRIMARY KEY (`id`),
  ADD KEY `boss_id` (`boss_id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `realms`
--
ALTER TABLE `realms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `realm_category_id` (`realm_category_id`);

--
-- Indexes for table `recipe`
--
ALTER TABLE `recipe`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `recipe_mats`
--
ALTER TABLE `recipe_mats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recipe_id` (`recipe_id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `reputation_factions`
--
ALTER TABLE `reputation_factions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reputation_factions_ranks`
--
ALTER TABLE `reputation_factions_ranks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `faction_id` (`faction_id`);

--
-- Indexes for table `reputation_faction_character`
--
ALTER TABLE `reputation_faction_character`
  ADD PRIMARY KEY (`id`),
  ADD KEY `character_id` (`character_id`),
  ADD KEY `faction_id` (`faction_id`),
  ADD KEY `rank_id` (`rank_id`);

--
-- Indexes for table `seasons`
--
ALTER TABLE `seasons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expansion_id` (`expansion_id`);

--
-- Indexes for table `sl_character_covenants`
--
ALTER TABLE `sl_character_covenants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `character_id` (`character_id`),
  ADD KEY `covenant_id` (`covenant_id`);

--
-- Indexes for table `sl_covenants`
--
ALTER TABLE `sl_covenants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sl_covenant_conduits`
--
ALTER TABLE `sl_covenant_conduits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `covenant_id` (`covenant_id`);

--
-- Indexes for table `sl_covenant_soulbinds`
--
ALTER TABLE `sl_covenant_soulbinds`
  ADD PRIMARY KEY (`id`),
  ADD KEY `covenant_id` (`covenant_id`);

--
-- Indexes for table `sl_socketed_conduits`
--
ALTER TABLE `sl_socketed_conduits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `conduit_id` (`conduit_id`),
  ADD KEY `character_id` (`character_id`),
  ADD KEY `soulbind_id` (`soulbind_id`);

--
-- Indexes for table `sl_soulbinds_characters`
--
ALTER TABLE `sl_soulbinds_characters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `character_id` (`character_id`),
  ADD KEY `soulbind_id` (`soulbind_id`),
  ADD KEY `spec_id` (`spec_id`);

--
-- Indexes for table `spells`
--
ALTER TABLE `spells`
  ADD PRIMARY KEY (`id`),
  ADD KEY `class_id` (`class_id`),
  ADD KEY `spec_id` (`spec_id`);

--
-- Indexes for table `stats`
--
ALTER TABLE `stats`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `title` (`title`);

--
-- Indexes for table `tier_sets`
--
ALTER TABLE `tier_sets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `class_id` (`class_id`);

--
-- Indexes for table `tier_set_pieces`
--
ALTER TABLE `tier_set_pieces`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tier_set_id` (`tier_set_id`),
  ADD KEY `slot_it` (`slot_id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `transmog`
--
ALTER TABLE `transmog`
  ADD PRIMARY KEY (`id`),
  ADD KEY `original_item_id` (`original_item_id`),
  ADD KEY `transmoged_to_id` (`transmoged_to_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `affixes`
--
ALTER TABLE `affixes`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `armory`
--
ALTER TABLE `armory`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `armory_enchants`
--
ALTER TABLE `armory_enchants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `armory_gems`
--
ALTER TABLE `armory_gems`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `armory_item_rank`
--
ALTER TABLE `armory_item_rank`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `armor_item_stats`
--
ALTER TABLE `armor_item_stats`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `auction_bids_history`
--
ALTER TABLE `auction_bids_history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
-- AUTO_INCREMENT for table `characher_slots`
--
ALTER TABLE `characher_slots`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `characters`
--
ALTER TABLE `characters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `character_currencies`
--
ALTER TABLE `character_currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `character_scoring`
--
ALTER TABLE `character_scoring`
  MODIFY `id` bigint(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `classes`
--
ALTER TABLE `classes`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `class_specs`
--
ALTER TABLE `class_specs`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `difficulties`
--
ALTER TABLE `difficulties`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `dungeons`
--
ALTER TABLE `dungeons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `enchants`
--
ALTER TABLE `enchants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `expansions`
--
ALTER TABLE `expansions`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `factions`
--
ALTER TABLE `factions`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `gems`
--
ALTER TABLE `gems`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `item_origins`
--
ALTER TABLE `item_origins`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `item_titles`
--
ALTER TABLE `item_titles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `learned_spells`
--
ALTER TABLE `learned_spells`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `mobs`
--
ALTER TABLE `mobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `npcs`
--
ALTER TABLE `npcs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `party_roles`
--
ALTER TABLE `party_roles`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `profession_skills`
--
ALTER TABLE `profession_skills`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pvp_currency`
--
ALTER TABLE `pvp_currency`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pvp_item_upgrades`
--
ALTER TABLE `pvp_item_upgrades`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pvp_vendors`
--
ALTER TABLE `pvp_vendors`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pvp_vendors_items`
--
ALTER TABLE `pvp_vendors_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
-- AUTO_INCREMENT for table `raids`
--
ALTER TABLE `raids`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `raid_bosses`
--
ALTER TABLE `raid_bosses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `raid_bosses_killed`
--
ALTER TABLE `raid_bosses_killed`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `raid_bosses_loot`
--
ALTER TABLE `raid_bosses_loot`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `realms`
--
ALTER TABLE `realms`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `recipe`
--
ALTER TABLE `recipe`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `recipe_mats`
--
ALTER TABLE `recipe_mats`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `reputation_factions`
--
ALTER TABLE `reputation_factions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `reputation_factions_ranks`
--
ALTER TABLE `reputation_factions_ranks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `reputation_faction_character`
--
ALTER TABLE `reputation_faction_character`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `seasons`
--
ALTER TABLE `seasons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sl_character_covenants`
--
ALTER TABLE `sl_character_covenants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sl_covenants`
--
ALTER TABLE `sl_covenants`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sl_covenant_conduits`
--
ALTER TABLE `sl_covenant_conduits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sl_covenant_soulbinds`
--
ALTER TABLE `sl_covenant_soulbinds`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sl_socketed_conduits`
--
ALTER TABLE `sl_socketed_conduits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sl_soulbinds_characters`
--
ALTER TABLE `sl_soulbinds_characters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `spells`
--
ALTER TABLE `spells`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `stats`
--
ALTER TABLE `stats`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tier_sets`
--
ALTER TABLE `tier_sets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tier_set_pieces`
--
ALTER TABLE `tier_set_pieces`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `transmog`
--
ALTER TABLE `transmog`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `armory`
--
ALTER TABLE `armory`
  ADD CONSTRAINT `armory_ibfk_1` FOREIGN KEY (`character_id`) REFERENCES `characters` (`id`),
  ADD CONSTRAINT `armory_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`),
  ADD CONSTRAINT `armory_ibfk_3` FOREIGN KEY (`slot_id`) REFERENCES `characher_slots` (`id`);

--
-- Constraints for table `armory_enchants`
--
ALTER TABLE `armory_enchants`
  ADD CONSTRAINT `armory_enchants_ibfk_1` FOREIGN KEY (`armory_id`) REFERENCES `armory` (`id`),
  ADD CONSTRAINT `armory_enchants_ibfk_2` FOREIGN KEY (`enchant_id`) REFERENCES `enchants` (`id`);

--
-- Constraints for table `armory_gems`
--
ALTER TABLE `armory_gems`
  ADD CONSTRAINT `armory_gems_ibfk_1` FOREIGN KEY (`armory_id`) REFERENCES `armory` (`id`),
  ADD CONSTRAINT `armory_gems_ibfk_2` FOREIGN KEY (`gem_id`) REFERENCES `gems` (`id`);

--
-- Constraints for table `armory_item_rank`
--
ALTER TABLE `armory_item_rank`
  ADD CONSTRAINT `armory_item_rank_ibfk_1` FOREIGN KEY (`armory_id`) REFERENCES `armory` (`id`);

--
-- Constraints for table `armor_item_stats`
--
ALTER TABLE `armor_item_stats`
  ADD CONSTRAINT `armor_item_stats_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`),
  ADD CONSTRAINT `armor_item_stats_ibfk_2` FOREIGN KEY (`stat_id`) REFERENCES `stats` (`id`);

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
  ADD CONSTRAINT `characters_ibfk_4` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`),
  ADD CONSTRAINT `characters_ibfk_5` FOREIGN KEY (`faction_id`) REFERENCES `factions` (`id`);

--
-- Constraints for table `character_currencies`
--
ALTER TABLE `character_currencies`
  ADD CONSTRAINT `character_currencies_ibfk_1` FOREIGN KEY (`character_id`) REFERENCES `characters` (`id`),
  ADD CONSTRAINT `character_currencies_ibfk_2` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`);

--
-- Constraints for table `character_scoring`
--
ALTER TABLE `character_scoring`
  ADD CONSTRAINT `character_scoring_ibfk_1` FOREIGN KEY (`character_id`) REFERENCES `characters` (`id`),
  ADD CONSTRAINT `character_scoring_ibfk_2` FOREIGN KEY (`season_id`) REFERENCES `seasons` (`id`);

--
-- Constraints for table `class_specs`
--
ALTER TABLE `class_specs`
  ADD CONSTRAINT `class_specs_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`);

--
-- Constraints for table `currencies`
--
ALTER TABLE `currencies`
  ADD CONSTRAINT `currencies_ibfk_1` FOREIGN KEY (`expansion_id`) REFERENCES `expansions` (`id`);

--
-- Constraints for table `dungeons`
--
ALTER TABLE `dungeons`
  ADD CONSTRAINT `dungeons_ibfk_1` FOREIGN KEY (`expansion_id`) REFERENCES `expansions` (`id`);

--
-- Constraints for table `item_titles`
--
ALTER TABLE `item_titles`
  ADD CONSTRAINT `item_titles_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`),
  ADD CONSTRAINT `item_titles_ibfk_2` FOREIGN KEY (`title_id`) REFERENCES `item_origins` (`id`);

--
-- Constraints for table `learned_spells`
--
ALTER TABLE `learned_spells`
  ADD CONSTRAINT `learned_spells_ibfk_1` FOREIGN KEY (`character_id`) REFERENCES `characters` (`id`),
  ADD CONSTRAINT `learned_spells_ibfk_2` FOREIGN KEY (`spell_id`) REFERENCES `spells` (`id`);

--
-- Constraints for table `pvp_item_upgrades`
--
ALTER TABLE `pvp_item_upgrades`
  ADD CONSTRAINT `pvp_item_upgrades_ibfk_1` FOREIGN KEY (`currency_id`) REFERENCES `pvp_currency` (`id`),
  ADD CONSTRAINT `pvp_item_upgrades_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `pvp_vendors_items` (`id`),
  ADD CONSTRAINT `pvp_item_upgrades_ibfk_3` FOREIGN KEY (`new_item_id`) REFERENCES `pvp_vendors_items` (`id`);

--
-- Constraints for table `pvp_vendors`
--
ALTER TABLE `pvp_vendors`
  ADD CONSTRAINT `pvp_vendors_ibfk_1` FOREIGN KEY (`currency_id`) REFERENCES `pvp_currency` (`id`);

--
-- Constraints for table `pvp_vendors_items`
--
ALTER TABLE `pvp_vendors_items`
  ADD CONSTRAINT `pvp_vendors_items_ibfk_1` FOREIGN KEY (`slot_id`) REFERENCES `characher_slots` (`id`),
  ADD CONSTRAINT `pvp_vendors_items_ibfk_2` FOREIGN KEY (`vendor_id`) REFERENCES `pvp_vendors` (`id`),
  ADD CONSTRAINT `pvp_vendors_items_ibfk_3` FOREIGN KEY (`class_spec_id`) REFERENCES `class_specs` (`id`),
  ADD CONSTRAINT `pvp_vendors_items_ibfk_4` FOREIGN KEY (`season_id`) REFERENCES `seasons` (`id`),
  ADD CONSTRAINT `pvp_vendors_items_ibfk_5` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`);

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
-- Constraints for table `raids`
--
ALTER TABLE `raids`
  ADD CONSTRAINT `raids_ibfk_1` FOREIGN KEY (`expansion_id`) REFERENCES `expansions` (`id`);

--
-- Constraints for table `raid_bosses`
--
ALTER TABLE `raid_bosses`
  ADD CONSTRAINT `raid_bosses_ibfk_1` FOREIGN KEY (`raid_id`) REFERENCES `raids` (`id`);

--
-- Constraints for table `raid_bosses_killed`
--
ALTER TABLE `raid_bosses_killed`
  ADD CONSTRAINT `raid_bosses_killed_ibfk_1` FOREIGN KEY (`character_id`) REFERENCES `characters` (`id`),
  ADD CONSTRAINT `raid_bosses_killed_ibfk_2` FOREIGN KEY (`difficulty_id`) REFERENCES `difficulties` (`id`),
  ADD CONSTRAINT `raid_bosses_killed_ibfk_3` FOREIGN KEY (`raid_boss_id`) REFERENCES `raid_bosses` (`id`);

--
-- Constraints for table `raid_bosses_loot`
--
ALTER TABLE `raid_bosses_loot`
  ADD CONSTRAINT `raid_bosses_loot_ibfk_1` FOREIGN KEY (`boss_id`) REFERENCES `raid_bosses` (`id`),
  ADD CONSTRAINT `raid_bosses_loot_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`);

--
-- Constraints for table `recipe_mats`
--
ALTER TABLE `recipe_mats`
  ADD CONSTRAINT `recipe_mats_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`),
  ADD CONSTRAINT `recipe_mats_ibfk_2` FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`id`);

--
-- Constraints for table `reputation_factions_ranks`
--
ALTER TABLE `reputation_factions_ranks`
  ADD CONSTRAINT `reputation_factions_ranks_ibfk_1` FOREIGN KEY (`faction_id`) REFERENCES `reputation_factions` (`id`);

--
-- Constraints for table `reputation_faction_character`
--
ALTER TABLE `reputation_faction_character`
  ADD CONSTRAINT `reputation_faction_character_ibfk_1` FOREIGN KEY (`character_id`) REFERENCES `characters` (`id`),
  ADD CONSTRAINT `reputation_faction_character_ibfk_2` FOREIGN KEY (`faction_id`) REFERENCES `reputation_factions` (`id`),
  ADD CONSTRAINT `reputation_faction_character_ibfk_3` FOREIGN KEY (`rank_id`) REFERENCES `reputation_factions_ranks` (`id`);

--
-- Constraints for table `seasons`
--
ALTER TABLE `seasons`
  ADD CONSTRAINT `seasons_ibfk_1` FOREIGN KEY (`expansion_id`) REFERENCES `expansions` (`id`);

--
-- Constraints for table `sl_character_covenants`
--
ALTER TABLE `sl_character_covenants`
  ADD CONSTRAINT `sl_character_covenants_ibfk_1` FOREIGN KEY (`character_id`) REFERENCES `characters` (`id`),
  ADD CONSTRAINT `sl_character_covenants_ibfk_2` FOREIGN KEY (`covenant_id`) REFERENCES `sl_covenants` (`id`);

--
-- Constraints for table `sl_covenant_conduits`
--
ALTER TABLE `sl_covenant_conduits`
  ADD CONSTRAINT `sl_covenant_conduits_ibfk_1` FOREIGN KEY (`covenant_id`) REFERENCES `sl_covenants` (`id`);

--
-- Constraints for table `sl_covenant_soulbinds`
--
ALTER TABLE `sl_covenant_soulbinds`
  ADD CONSTRAINT `sl_covenant_soulbinds_ibfk_1` FOREIGN KEY (`covenant_id`) REFERENCES `sl_covenants` (`id`);

--
-- Constraints for table `sl_socketed_conduits`
--
ALTER TABLE `sl_socketed_conduits`
  ADD CONSTRAINT `sl_socketed_conduits_ibfk_1` FOREIGN KEY (`character_id`) REFERENCES `characters` (`id`),
  ADD CONSTRAINT `sl_socketed_conduits_ibfk_2` FOREIGN KEY (`conduit_id`) REFERENCES `sl_covenant_conduits` (`id`),
  ADD CONSTRAINT `sl_socketed_conduits_ibfk_3` FOREIGN KEY (`soulbind_id`) REFERENCES `sl_covenant_soulbinds` (`id`);

--
-- Constraints for table `sl_soulbinds_characters`
--
ALTER TABLE `sl_soulbinds_characters`
  ADD CONSTRAINT `sl_soulbinds_characters_ibfk_1` FOREIGN KEY (`character_id`) REFERENCES `characters` (`id`),
  ADD CONSTRAINT `sl_soulbinds_characters_ibfk_2` FOREIGN KEY (`soulbind_id`) REFERENCES `sl_covenant_soulbinds` (`id`),
  ADD CONSTRAINT `sl_soulbinds_characters_ibfk_3` FOREIGN KEY (`spec_id`) REFERENCES `class_specs` (`id`);

--
-- Constraints for table `spells`
--
ALTER TABLE `spells`
  ADD CONSTRAINT `spells_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`),
  ADD CONSTRAINT `spells_ibfk_2` FOREIGN KEY (`spec_id`) REFERENCES `class_specs` (`id`);

--
-- Constraints for table `tier_sets`
--
ALTER TABLE `tier_sets`
  ADD CONSTRAINT `tier_sets_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`);

--
-- Constraints for table `tier_set_pieces`
--
ALTER TABLE `tier_set_pieces`
  ADD CONSTRAINT `tier_set_pieces_ibfk_1` FOREIGN KEY (`tier_set_id`) REFERENCES `tier_sets` (`id`),
  ADD CONSTRAINT `tier_set_pieces_ibfk_2` FOREIGN KEY (`slot_id`) REFERENCES `characher_slots` (`id`),
  ADD CONSTRAINT `tier_set_pieces_ibfk_3` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`);

--
-- Constraints for table `transmog`
--
ALTER TABLE `transmog`
  ADD CONSTRAINT `transmog_ibfk_1` FOREIGN KEY (`original_item_id`) REFERENCES `armory` (`id`),
  ADD CONSTRAINT `transmog_ibfk_2` FOREIGN KEY (`transmoged_to_id`) REFERENCES `items` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
