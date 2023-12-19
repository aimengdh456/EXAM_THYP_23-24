-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mar. 19 déc. 2023 à 10:15
-- Version du serveur : 8.0.33
-- Version de PHP : 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `omeka-s`
--

-- --------------------------------------------------------

--
-- Structure de la table `api_key`
--

DROP TABLE IF EXISTS `api_key`;
CREATE TABLE IF NOT EXISTS `api_key` (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner_id` int NOT NULL,
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `credential_hash` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_ip` varbinary(16) DEFAULT NULL COMMENT '(DC2Type:ip_address)',
  `last_accessed` datetime DEFAULT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_C912ED9D7E3C61F9` (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `asset`
--

DROP TABLE IF EXISTS `asset`;
CREATE TABLE IF NOT EXISTS `asset` (
  `id` int NOT NULL AUTO_INCREMENT,
  `owner_id` int DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `media_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `storage_id` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `extension` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alt_text` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_2AF5A5C5CC5DB90` (`storage_id`),
  KEY `IDX_2AF5A5C7E3C61F9` (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `fulltext_search`
--

DROP TABLE IF EXISTS `fulltext_search`;
CREATE TABLE IF NOT EXISTS `fulltext_search` (
  `id` int NOT NULL,
  `resource` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner_id` int DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL,
  `title` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `text` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`,`resource`),
  KEY `IDX_AA31FE4A7E3C61F9` (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `fulltext_search`
--

INSERT INTO `fulltext_search` (`id`, `resource`, `owner_id`, `is_public`, `title`, `text`) VALUES
(2, 'site_pages', 1, 1, 'affichageItems', 'Miserables\nCuisine'),
(8, 'items', 1, 1, 'Fiche Ahlete John Doe', 'Fiche Ahlete John Doe\nGold\nJohn Doe\nUSA\n1'),
(9, 'items', 1, 1, 'Fiche Athlete Alice Smith', 'Fiche Athlete Alice Smith\nSilver\nAlice Smith\nCanada\n2'),
(10, 'items', 1, 1, 'Fiche Athlete Mohammed Ahmed', 'Fiche Athlete Mohammed Ahmed\nBronze\nMohammed Ahmed\nEthiopia\n3'),
(11, 'items', 1, 1, 'Compétition 1', 'Compétition 1\nSummer Olympics 2020\nSuccessful\n2020'),
(12, 'items', 1, 1, 'Competition 2', 'Competition 2\nWinter Olympics 2022\nIn Progress\n2022'),
(13, 'items', 1, 1, 'Statistiques medal 2020', 'Statistiques medal 2020\nJapan\n2020'),
(14, 'items', 1, 1, 'Statistiques medal 2024', 'Statistiques medal 2024\nFrance\n2024'),
(15, 'items', 1, 1, 'Sport 1', 'Sport 1\nAthletics'),
(16, 'items', 1, 1, 'sport 2', 'sport 2\nSwiming');

-- --------------------------------------------------------

--
-- Structure de la table `item`
--

DROP TABLE IF EXISTS `item`;
CREATE TABLE IF NOT EXISTS `item` (
  `id` int NOT NULL,
  `primary_media_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_1F1B251ECBE0B084` (`primary_media_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `item`
--

INSERT INTO `item` (`id`, `primary_media_id`) VALUES
(8, NULL),
(9, NULL),
(10, NULL),
(11, NULL),
(12, NULL),
(13, NULL),
(14, NULL),
(15, NULL),
(16, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `item_item_set`
--

DROP TABLE IF EXISTS `item_item_set`;
CREATE TABLE IF NOT EXISTS `item_item_set` (
  `item_id` int NOT NULL,
  `item_set_id` int NOT NULL,
  PRIMARY KEY (`item_id`,`item_set_id`),
  KEY `IDX_6D0C9625126F525E` (`item_id`),
  KEY `IDX_6D0C9625960278D7` (`item_set_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `item_set`
--

DROP TABLE IF EXISTS `item_set`;
CREATE TABLE IF NOT EXISTS `item_set` (
  `id` int NOT NULL,
  `is_open` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `item_site`
--

DROP TABLE IF EXISTS `item_site`;
CREATE TABLE IF NOT EXISTS `item_site` (
  `item_id` int NOT NULL,
  `site_id` int NOT NULL,
  PRIMARY KEY (`item_id`,`site_id`),
  KEY `IDX_A1734D1F126F525E` (`item_id`),
  KEY `IDX_A1734D1FF6BD1646` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `item_site`
--

INSERT INTO `item_site` (`item_id`, `site_id`) VALUES
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1);

-- --------------------------------------------------------

--
-- Structure de la table `job`
--

DROP TABLE IF EXISTS `job`;
CREATE TABLE IF NOT EXISTS `job` (
  `id` int NOT NULL AUTO_INCREMENT,
  `owner_id` int DEFAULT NULL,
  `pid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `class` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `args` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:json_array)',
  `log` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `started` datetime NOT NULL,
  `ended` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FBD8E0F87E3C61F9` (`owner_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `job`
--

INSERT INTO `job` (`id`, `owner_id`, `pid`, `status`, `class`, `args`, `log`, `started`, `ended`) VALUES
(1, 1, NULL, 'starting', 'Omeka\\Job\\UpdateSiteItems', '{\"sites\":{\"1\":[]},\"action\":\"add\"}', NULL, '2023-11-05 14:39:23', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `media`
--

DROP TABLE IF EXISTS `media`;
CREATE TABLE IF NOT EXISTS `media` (
  `id` int NOT NULL,
  `item_id` int NOT NULL,
  `ingester` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `renderer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:json_array)',
  `source` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `media_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `storage_id` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extension` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sha256` char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` bigint DEFAULT NULL,
  `has_original` tinyint(1) NOT NULL,
  `has_thumbnails` tinyint(1) NOT NULL,
  `position` int DEFAULT NULL,
  `lang` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alt_text` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_6A2CA10C5CC5DB90` (`storage_id`),
  KEY `IDX_6A2CA10C126F525E` (`item_id`),
  KEY `item_position` (`item_id`,`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `migration`
--

DROP TABLE IF EXISTS `migration`;
CREATE TABLE IF NOT EXISTS `migration` (
  `version` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migration`
--

INSERT INTO `migration` (`version`) VALUES
('20171128053327'),
('20180412035023'),
('20180919072656'),
('20180924033501'),
('20181002015551'),
('20181004043735'),
('20181106060421'),
('20190307043537'),
('20190319020708'),
('20190412090532'),
('20190423040354'),
('20190423071228'),
('20190514061351'),
('20190515055359'),
('20190729023728'),
('20190809092609'),
('20190815062003'),
('20200224022356'),
('20200226064602'),
('20200325091157'),
('20200326091310'),
('20200803000000'),
('20200831000000'),
('20210205101827'),
('20210225095734'),
('20210810083804'),
('20220718090449'),
('20220824103916'),
('20230601060113'),
('20230713101012');

-- --------------------------------------------------------

--
-- Structure de la table `module`
--

DROP TABLE IF EXISTS `module`;
CREATE TABLE IF NOT EXISTS `module` (
  `id` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `version` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `password_creation`
--

DROP TABLE IF EXISTS `password_creation`;
CREATE TABLE IF NOT EXISTS `password_creation` (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `user_id` int NOT NULL,
  `created` datetime NOT NULL,
  `activate` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_C77917B4A76ED395` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `password_creation`
--

INSERT INTO `password_creation` (`id`, `user_id`, `created`, `activate`) VALUES
('j3tpU2lddhLtWM2GOAD6xenG5JgwSCSW', 1, '2023-12-18 19:52:46', 0);

-- --------------------------------------------------------

--
-- Structure de la table `property`
--

DROP TABLE IF EXISTS `property`;
CREATE TABLE IF NOT EXISTS `property` (
  `id` int NOT NULL AUTO_INCREMENT,
  `owner_id` int DEFAULT NULL,
  `vocabulary_id` int NOT NULL,
  `local_name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8BF21CDEAD0E05F6623C14D5` (`vocabulary_id`,`local_name`),
  KEY `IDX_8BF21CDE7E3C61F9` (`owner_id`),
  KEY `IDX_8BF21CDEAD0E05F6` (`vocabulary_id`)
) ENGINE=InnoDB AUTO_INCREMENT=245 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `property`
--

INSERT INTO `property` (`id`, `owner_id`, `vocabulary_id`, `local_name`, `label`, `comment`) VALUES
(1, NULL, 1, 'title', 'Title', 'A name given to the resource.'),
(2, NULL, 1, 'creator', 'Creator', 'An entity primarily responsible for making the resource.'),
(3, NULL, 1, 'subject', 'Subject', 'The topic of the resource.'),
(4, NULL, 1, 'description', 'Description', 'An account of the resource.'),
(5, NULL, 1, 'publisher', 'Publisher', 'An entity responsible for making the resource available.'),
(6, NULL, 1, 'contributor', 'Contributor', 'An entity responsible for making contributions to the resource.'),
(7, NULL, 1, 'date', 'Date', 'A point or period of time associated with an event in the lifecycle of the resource.'),
(8, NULL, 1, 'type', 'Type', 'The nature or genre of the resource.'),
(9, NULL, 1, 'format', 'Format', 'The file format, physical medium, or dimensions of the resource.'),
(10, NULL, 1, 'identifier', 'Identifier', 'An unambiguous reference to the resource within a given context.'),
(11, NULL, 1, 'source', 'Source', 'A related resource from which the described resource is derived.'),
(12, NULL, 1, 'language', 'Language', 'A language of the resource.'),
(13, NULL, 1, 'relation', 'Relation', 'A related resource.'),
(14, NULL, 1, 'coverage', 'Coverage', 'The spatial or temporal topic of the resource, the spatial applicability of the resource, or the jurisdiction under which the resource is relevant.'),
(15, NULL, 1, 'rights', 'Rights', 'Information about rights held in and over the resource.'),
(16, NULL, 1, 'audience', 'Audience', 'A class of entity for whom the resource is intended or useful.'),
(17, NULL, 1, 'alternative', 'Alternative Title', 'An alternative name for the resource.'),
(18, NULL, 1, 'tableOfContents', 'Table Of Contents', 'A list of subunits of the resource.'),
(19, NULL, 1, 'abstract', 'Abstract', 'A summary of the resource.'),
(20, NULL, 1, 'created', 'Date Created', 'Date of creation of the resource.'),
(21, NULL, 1, 'valid', 'Date Valid', 'Date (often a range) of validity of a resource.'),
(22, NULL, 1, 'available', 'Date Available', 'Date (often a range) that the resource became or will become available.'),
(23, NULL, 1, 'issued', 'Date Issued', 'Date of formal issuance (e.g., publication) of the resource.'),
(24, NULL, 1, 'modified', 'Date Modified', 'Date on which the resource was changed.'),
(25, NULL, 1, 'extent', 'Extent', 'The size or duration of the resource.'),
(26, NULL, 1, 'medium', 'Medium', 'The material or physical carrier of the resource.'),
(27, NULL, 1, 'isVersionOf', 'Is Version Of', 'A related resource of which the described resource is a version, edition, or adaptation.'),
(28, NULL, 1, 'hasVersion', 'Has Version', 'A related resource that is a version, edition, or adaptation of the described resource.'),
(29, NULL, 1, 'isReplacedBy', 'Is Replaced By', 'A related resource that supplants, displaces, or supersedes the described resource.'),
(30, NULL, 1, 'replaces', 'Replaces', 'A related resource that is supplanted, displaced, or superseded by the described resource.'),
(31, NULL, 1, 'isRequiredBy', 'Is Required By', 'A related resource that requires the described resource to support its function, delivery, or coherence.'),
(32, NULL, 1, 'requires', 'Requires', 'A related resource that is required by the described resource to support its function, delivery, or coherence.'),
(33, NULL, 1, 'isPartOf', 'Is Part Of', 'A related resource in which the described resource is physically or logically included.'),
(34, NULL, 1, 'hasPart', 'Has Part', 'A related resource that is included either physically or logically in the described resource.'),
(35, NULL, 1, 'isReferencedBy', 'Is Referenced By', 'A related resource that references, cites, or otherwise points to the described resource.'),
(36, NULL, 1, 'references', 'References', 'A related resource that is referenced, cited, or otherwise pointed to by the described resource.'),
(37, NULL, 1, 'isFormatOf', 'Is Format Of', 'A related resource that is substantially the same as the described resource, but in another format.'),
(38, NULL, 1, 'hasFormat', 'Has Format', 'A related resource that is substantially the same as the pre-existing described resource, but in another format.'),
(39, NULL, 1, 'conformsTo', 'Conforms To', 'An established standard to which the described resource conforms.'),
(40, NULL, 1, 'spatial', 'Spatial Coverage', 'Spatial characteristics of the resource.'),
(41, NULL, 1, 'temporal', 'Temporal Coverage', 'Temporal characteristics of the resource.'),
(42, NULL, 1, 'mediator', 'Mediator', 'An entity that mediates access to the resource and for whom the resource is intended or useful.'),
(43, NULL, 1, 'dateAccepted', 'Date Accepted', 'Date of acceptance of the resource.'),
(44, NULL, 1, 'dateCopyrighted', 'Date Copyrighted', 'Date of copyright.'),
(45, NULL, 1, 'dateSubmitted', 'Date Submitted', 'Date of submission of the resource.'),
(46, NULL, 1, 'educationLevel', 'Audience Education Level', 'A class of entity, defined in terms of progression through an educational or training context, for which the described resource is intended.'),
(47, NULL, 1, 'accessRights', 'Access Rights', 'Information about who can access the resource or an indication of its security status.'),
(48, NULL, 1, 'bibliographicCitation', 'Bibliographic Citation', 'A bibliographic reference for the resource.'),
(49, NULL, 1, 'license', 'License', 'A legal document giving official permission to do something with the resource.'),
(50, NULL, 1, 'rightsHolder', 'Rights Holder', 'A person or organization owning or managing rights over the resource.'),
(51, NULL, 1, 'provenance', 'Provenance', 'A statement of any changes in ownership and custody of the resource since its creation that are significant for its authenticity, integrity, and interpretation.'),
(52, NULL, 1, 'instructionalMethod', 'Instructional Method', 'A process, used to engender knowledge, attitudes and skills, that the described resource is designed to support.'),
(53, NULL, 1, 'accrualMethod', 'Accrual Method', 'The method by which items are added to a collection.'),
(54, NULL, 1, 'accrualPeriodicity', 'Accrual Periodicity', 'The frequency with which items are added to a collection.'),
(55, NULL, 1, 'accrualPolicy', 'Accrual Policy', 'The policy governing the addition of items to a collection.'),
(240, 1, 7, 'name', 'name', NULL),
(241, 1, 7, 'country', 'country', NULL),
(242, 1, 7, 'year', 'year', NULL),
(243, 1, 7, 'result', 'result', NULL),
(244, 1, 7, 'rank', 'rank', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `resource`
--

DROP TABLE IF EXISTS `resource`;
CREATE TABLE IF NOT EXISTS `resource` (
  `id` int NOT NULL AUTO_INCREMENT,
  `owner_id` int DEFAULT NULL,
  `resource_class_id` int DEFAULT NULL,
  `resource_template_id` int DEFAULT NULL,
  `thumbnail_id` int DEFAULT NULL,
  `title` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_public` tinyint(1) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `resource_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_BC91F4167E3C61F9` (`owner_id`),
  KEY `IDX_BC91F416448CC1BD` (`resource_class_id`),
  KEY `IDX_BC91F41616131EA` (`resource_template_id`),
  KEY `IDX_BC91F416FDFF2E92` (`thumbnail_id`),
  KEY `title` (`title`(190))
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `resource`
--

INSERT INTO `resource` (`id`, `owner_id`, `resource_class_id`, `resource_template_id`, `thumbnail_id`, `title`, `is_public`, `created`, `modified`, `resource_type`) VALUES
(8, 1, 129, 4, NULL, 'Fiche Ahlete John Doe', 1, '2023-12-19 10:02:48', '2023-12-19 10:05:09', 'Omeka\\Entity\\Item'),
(9, 1, 129, 4, NULL, 'Fiche Athlete Alice Smith', 1, '2023-12-19 10:04:06', '2023-12-19 10:04:06', 'Omeka\\Entity\\Item'),
(10, 1, 129, 4, NULL, 'Fiche Athlete Mohammed Ahmed', 1, '2023-12-19 10:04:52', '2023-12-19 10:04:52', 'Omeka\\Entity\\Item'),
(11, 1, 132, 7, NULL, 'Compétition 1', 1, '2023-12-19 10:07:02', '2023-12-19 10:07:02', 'Omeka\\Entity\\Item'),
(12, 1, 132, 7, NULL, 'Competition 2', 1, '2023-12-19 10:07:56', '2023-12-19 10:07:56', 'Omeka\\Entity\\Item'),
(13, 1, 131, 6, NULL, 'Statistiques medal 2020', 1, '2023-12-19 10:09:26', '2023-12-19 10:09:26', 'Omeka\\Entity\\Item'),
(14, 1, 131, 6, NULL, 'Statistiques medal 2024', 1, '2023-12-19 10:10:04', '2023-12-19 10:10:04', 'Omeka\\Entity\\Item'),
(15, 1, 130, 5, NULL, 'Sport 1', 1, '2023-12-19 10:11:00', '2023-12-19 10:11:00', 'Omeka\\Entity\\Item'),
(16, 1, 130, 5, NULL, 'sport 2', 1, '2023-12-19 10:11:36', '2023-12-19 10:11:36', 'Omeka\\Entity\\Item');

-- --------------------------------------------------------

--
-- Structure de la table `resource_class`
--

DROP TABLE IF EXISTS `resource_class`;
CREATE TABLE IF NOT EXISTS `resource_class` (
  `id` int NOT NULL AUTO_INCREMENT,
  `owner_id` int DEFAULT NULL,
  `vocabulary_id` int NOT NULL,
  `local_name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_C6F063ADAD0E05F6623C14D5` (`vocabulary_id`,`local_name`),
  KEY `IDX_C6F063AD7E3C61F9` (`owner_id`),
  KEY `IDX_C6F063ADAD0E05F6` (`vocabulary_id`)
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `resource_class`
--

INSERT INTO `resource_class` (`id`, `owner_id`, `vocabulary_id`, `local_name`, `label`, `comment`) VALUES
(1, NULL, 1, 'Agent', 'Agent', 'A resource that acts or has the power to act.'),
(2, NULL, 1, 'AgentClass', 'Agent Class', 'A group of agents.'),
(3, NULL, 1, 'BibliographicResource', 'Bibliographic Resource', 'A book, article, or other documentary resource.'),
(4, NULL, 1, 'FileFormat', 'File Format', 'A digital resource format.'),
(5, NULL, 1, 'Frequency', 'Frequency', 'A rate at which something recurs.'),
(6, NULL, 1, 'Jurisdiction', 'Jurisdiction', 'The extent or range of judicial, law enforcement, or other authority.'),
(7, NULL, 1, 'LicenseDocument', 'License Document', 'A legal document giving official permission to do something with a Resource.'),
(8, NULL, 1, 'LinguisticSystem', 'Linguistic System', 'A system of signs, symbols, sounds, gestures, or rules used in communication.'),
(9, NULL, 1, 'Location', 'Location', 'A spatial region or named place.'),
(10, NULL, 1, 'LocationPeriodOrJurisdiction', 'Location, Period, or Jurisdiction', 'A location, period of time, or jurisdiction.'),
(11, NULL, 1, 'MediaType', 'Media Type', 'A file format or physical medium.'),
(12, NULL, 1, 'MediaTypeOrExtent', 'Media Type or Extent', 'A media type or extent.'),
(13, NULL, 1, 'MethodOfInstruction', 'Method of Instruction', 'A process that is used to engender knowledge, attitudes, and skills.'),
(14, NULL, 1, 'MethodOfAccrual', 'Method of Accrual', 'A method by which resources are added to a collection.'),
(15, NULL, 1, 'PeriodOfTime', 'Period of Time', 'An interval of time that is named or defined by its start and end dates.'),
(16, NULL, 1, 'PhysicalMedium', 'Physical Medium', 'A physical material or carrier.'),
(17, NULL, 1, 'PhysicalResource', 'Physical Resource', 'A material thing.'),
(18, NULL, 1, 'Policy', 'Policy', 'A plan or course of action by an authority, intended to influence and determine decisions, actions, and other matters.'),
(19, NULL, 1, 'ProvenanceStatement', 'Provenance Statement', 'A statement of any changes in ownership and custody of a resource since its creation that are significant for its authenticity, integrity, and interpretation.'),
(20, NULL, 1, 'RightsStatement', 'Rights Statement', 'A statement about the intellectual property rights (IPR) held in or over a Resource, a legal document giving official permission to do something with a resource, or a statement about access rights.'),
(21, NULL, 1, 'SizeOrDuration', 'Size or Duration', 'A dimension or extent, or a time taken to play or execute.'),
(22, NULL, 1, 'Standard', 'Standard', 'A basis for comparison; a reference point against which other things can be evaluated.'),
(23, NULL, 2, 'Collection', 'Collection', 'An aggregation of resources.'),
(24, NULL, 2, 'Dataset', 'Dataset', 'Data encoded in a defined structure.'),
(25, NULL, 2, 'Event', 'Event', 'A non-persistent, time-based occurrence.'),
(26, NULL, 2, 'Image', 'Image', 'A visual representation other than text.'),
(27, NULL, 2, 'InteractiveResource', 'Interactive Resource', 'A resource requiring interaction from the user to be understood, executed, or experienced.'),
(28, NULL, 2, 'Service', 'Service', 'A system that provides one or more functions.'),
(29, NULL, 2, 'Software', 'Software', 'A computer program in source or compiled form.'),
(30, NULL, 2, 'Sound', 'Sound', 'A resource primarily intended to be heard.'),
(31, NULL, 2, 'Text', 'Text', 'A resource consisting primarily of words for reading.'),
(32, NULL, 2, 'PhysicalObject', 'Physical Object', 'An inanimate, three-dimensional object or substance.'),
(33, NULL, 2, 'StillImage', 'Still Image', 'A static visual representation.'),
(34, NULL, 2, 'MovingImage', 'Moving Image', 'A series of visual representations imparting an impression of motion when shown in succession.'),
(129, 1, 7, 'athlete', 'athlete', NULL),
(130, 1, 7, 'sport', 'sport', NULL),
(131, 1, 7, 'medal', 'medal', NULL),
(132, 1, 7, 'competition', 'competition', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `resource_template`
--

DROP TABLE IF EXISTS `resource_template`;
CREATE TABLE IF NOT EXISTS `resource_template` (
  `id` int NOT NULL AUTO_INCREMENT,
  `owner_id` int DEFAULT NULL,
  `resource_class_id` int DEFAULT NULL,
  `title_property_id` int DEFAULT NULL,
  `description_property_id` int DEFAULT NULL,
  `label` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_39ECD52EEA750E8` (`label`),
  KEY `IDX_39ECD52E7E3C61F9` (`owner_id`),
  KEY `IDX_39ECD52E448CC1BD` (`resource_class_id`),
  KEY `IDX_39ECD52E724734A3` (`title_property_id`),
  KEY `IDX_39ECD52EB84E0D1D` (`description_property_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `resource_template`
--

INSERT INTO `resource_template` (`id`, `owner_id`, `resource_class_id`, `title_property_id`, `description_property_id`, `label`) VALUES
(4, 1, 129, NULL, NULL, 'athlete'),
(5, 1, 130, NULL, NULL, 'sport'),
(6, 1, 131, NULL, NULL, 'medal'),
(7, 1, 132, NULL, NULL, 'competition');

-- --------------------------------------------------------

--
-- Structure de la table `resource_template_property`
--

DROP TABLE IF EXISTS `resource_template_property`;
CREATE TABLE IF NOT EXISTS `resource_template_property` (
  `id` int NOT NULL AUTO_INCREMENT,
  `resource_template_id` int NOT NULL,
  `property_id` int NOT NULL,
  `alternate_label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alternate_comment` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `position` int DEFAULT NULL,
  `data_type` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:json_array)',
  `is_required` tinyint(1) NOT NULL,
  `is_private` tinyint(1) NOT NULL,
  `default_lang` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_4689E2F116131EA549213EC` (`resource_template_id`,`property_id`),
  KEY `IDX_4689E2F116131EA` (`resource_template_id`),
  KEY `IDX_4689E2F1549213EC` (`property_id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `resource_template_property`
--

INSERT INTO `resource_template_property` (`id`, `resource_template_id`, `property_id`, `alternate_label`, `alternate_comment`, `position`, `data_type`, `is_required`, `is_private`, `default_lang`) VALUES
(26, 4, 1, NULL, NULL, 1, NULL, 0, 0, NULL),
(27, 4, 243, NULL, NULL, 2, NULL, 0, 0, NULL),
(28, 4, 240, NULL, NULL, 3, NULL, 0, 0, NULL),
(29, 4, 241, NULL, NULL, 4, NULL, 0, 0, NULL),
(30, 4, 244, NULL, NULL, 5, NULL, 0, 0, NULL),
(31, 5, 1, NULL, NULL, 1, NULL, 0, 0, NULL),
(32, 5, 240, NULL, NULL, 2, NULL, 0, 0, NULL),
(33, 6, 1, NULL, NULL, 1, NULL, 0, 0, NULL),
(34, 6, 241, NULL, NULL, 2, NULL, 0, 0, NULL),
(35, 6, 242, NULL, NULL, 3, NULL, 0, 0, NULL),
(36, 7, 1, NULL, NULL, 1, NULL, 0, 0, NULL),
(37, 7, 240, NULL, NULL, 2, NULL, 0, 0, NULL),
(38, 7, 243, NULL, NULL, 3, NULL, 0, 0, NULL),
(39, 7, 242, NULL, NULL, 4, NULL, 0, 0, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `session`
--

DROP TABLE IF EXISTS `session`;
CREATE TABLE IF NOT EXISTS `session` (
  `id` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` longblob NOT NULL,
  `modified` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `session`
--

INSERT INTO `session` (`id`, `data`, `modified`) VALUES
('oli72f7rt1bbk2b4su1e4645em', 0x5f5f4c616d696e61737c613a383a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730323934303832362e3035303134393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226b376733626a6b30727436317176617670613139677275766d39223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313730323933323836383b7d733a35313a224c616d696e61735f56616c696461746f725f437372665f73616c745f666f72676f7470617373776f7264666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313730323933323830343b7d733a34373a224c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313730323934343031373b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313730323934343138363b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313730323934343333353b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313730323934343333373b7d7d72656469726563745f75726c7c733a33303a22687474703a2f2f6c6f63616c686f73742f6f6d656b612d732f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a373a7b733a33323a223836306663616265326161313237363032333362353834396339366237383834223b733a33323a223832656564386430383938366531366138663635396166616338633765396439223b733a33323a223635346264646563613366613264383330303432643838303331656639323135223b733a33323a223134343630623339376430646264313138623864323136613435376162663233223b733a33323a226333633938336262623965656231666134396436353638396334623136643035223b733a33323a226535343838386539396435626462303632363161313366303337386235616439223b733a33323a223136393237613338616132336236333634646139626138363733323034663236223b733a33323a226434333164363035383338316364306263346131396635353137376632386332223b733a33323a226361663966373561376231363565313634653131623639626431343032393563223b733a33323a223036386134303162653530656430383735646531346634373433346537376639223b733a33323a223561663763396630383763643864366266313539653362313461333936653631223b733a33323a226630373336366337343764326433373934363634343131376237303332323963223b733a33323a223630636535656235303735303835666431313766316364306235373233356439223b733a33323a223866303766633631396161316335316338666663373261323836643635323634223b7d733a343a2268617368223b733a36353a2238663037666336313961613163353163386666633732613238366436353236342d3630636535656235303735303835666431313766316364306235373233356439223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f666f72676f7470617373776f7264666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a333a7b733a33323a226261366662353663313430616137313636623231373334313133656333663935223b733a33323a223032623763333137653232356533646537663934333038346563313864623731223b733a33323a226262396138653161393439393337363130343932303837633830313266636166223b733a33323a223865343232343032376531633961393365323761626266663530643839313061223b733a33323a226464316265303066303163373030646465323337363136666335303666653634223b733a33323a226238343736343239656435326638633232356537393039653236633031626236223b7d733a343a2268617368223b733a36353a2262383437363432396564353266386332323565373930396532366330316262362d6464316265303066303163373030646465323337363136666335303666653634223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223764643361353134656438636530396139393063643236303537313332643833223b733a33323a223737366530313764396433633739376636396236346464313739346665636535223b7d733a343a2268617368223b733a36353a2237373665303137643964336337393766363962363464643137393466656365352d3764643361353134656438636530396139393063643236303537313332643833223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226532346561616137646432376433313130626539346466356137323161663363223b733a33323a223134363331333232366437363233346563333861356362343335616133386336223b7d733a343a2268617368223b733a36353a2231343633313332323664373632333465633338613563623433356161333863362d6532346561616137646432376433313130626539346466356137323161663363223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a363a7b733a33323a226133346138383564633231363961393833613339653334636363346162346566223b733a33323a223962306361363539663262366230373666313039663766356365636438643066223b733a33323a223531643261313661633365626533623361393330656531363062333864666532223b733a33323a226237613038656565383137333939353337663062333037613335313631386333223b733a33323a226562373363303333663136623533663565646533653061656663623130633837223b733a33323a226234333866366361333530333964663433333061393132353765303431316664223b733a33323a226132333532396139326466373339613931353134333432346361323130383536223b733a33323a223238323134336239303832653335373439343931623265316662313435353330223b733a33323a223634333131336162613162313634386230613065333236373765643839323732223b733a33323a223038336531326639636539366638653834393666393330663965613261393139223b733a33323a223533313865656437376565353063346238313863363537353265353934353034223b733a33323a226435333961386364383831376236326664623663633566343837613537386137223b7d733a343a2268617368223b733a36353a2264353339613863643838313762363266646236636335663438376135373861372d3533313865656437376565353063346238313863363537353265353934353034223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a333a7b733a33323a223532313931373336646230393962633631313532346165396661323834363063223b733a33323a223730343364393465633533626330396236383866343935333764643130383032223b733a33323a223761646638393161343834613333303633656530386261306664366132356535223b733a33323a226638313531353365626533306138343966653562633939623638313630633363223b733a33323a223639633361356665373533393661623762373564323136353066643630333832223b733a33323a223764363032393231353533636639323166646232376132656432613964343937223b7d733a343a2268617368223b733a36353a2237643630323932313535336366393231666462323761326564326139643439372d3639633361356665373533393661623762373564323136353066643630333832223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1702940826),
('vuhoc1vfotka46go2pltbejaou', 0x5f5f4c616d696e61737c613a373a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730323938303639362e3739383339363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226d3433616f617575366b6d76327575386b713134756a6d686568223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313730323938313138363b7d733a34373a224c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313730323938323239393b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313730323938333034363b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313730323938343236323b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313730323938343236343b7d7d72656469726563745f75726c7c733a33303a22687474703a2f2f6c6f63616c686f73742f6f6d656b612d732f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223562633165616538613436343730326566376239653732633639313635323262223b733a33323a223663396464316461356137303135333233336664663661643630326131323237223b7d733a343a2268617368223b733a36353a2236633964643164613561373031353332333366646636616436303261313232372d3562633165616538613436343730326566376239653732633639313635323262223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31333a7b733a33323a226633666531663836306636306632613830333633383064393363666362383138223b733a33323a223039636662386331306261646132363933623365663162666231323232623965223b733a33323a223337363335326131356164333838353230373666343534636230626237636132223b733a33323a223435303034373433333264373931303135393732373536646163623133363563223b733a33323a226261656562353438343065613133393439363833616365383265633835326633223b733a33323a223338646631373163353166383731343061643333633135333066333262313037223b733a33323a223530663331613232633263653932336461336139653630613639646439313066223b733a33323a226438653838353962323232356362383039333666313837623038663363346562223b733a33323a226261646238313638663939626139396337343933306166396561393431323665223b733a33323a223639613031396532383063666434306231633132623935346265363438643730223b733a33323a226131666232356438353438326431356266633436626535306263396537323833223b733a33323a226435646130636262613139323334303935306231323134376465306638616436223b733a33323a223363633934373332336164613734353130643936663434656633653566653938223b733a33323a223038666366633063356630313538623833346237313461326165316365636639223b733a33323a226461336266366433353066653833633564623262343966636237623331656164223b733a33323a223363666632303930626136363637653461353862323238303035303738326639223b733a33323a223235623861663436653635346130333661636135656262353165626430393131223b733a33323a223263363663386631336361636436313164303561326264363362653263316233223b733a33323a223532633363363136306536306663373464323330663064643235663931663335223b733a33323a223135306564653039356433653265613465646237303838363763393461373038223b733a33323a223239653132653939376264623737303735323734383931663462396336616632223b733a33323a226133616262303333366430346334396230363432313066646435643131633331223b733a33323a226532373030633630616438333532626430306466343131343636343633666136223b733a33323a223066663464363133316464656438366139633038666436393862366238616164223b733a33323a223937303462613139653634396433633538366538386533303064346263313830223b733a33323a226638396536393838323035303364663763343832646261636664343866656566223b7d733a343a2268617368223b733a36353a2266383965363938383230353033646637633438326462616366643438666565662d3937303462613139653634396433633538366538386533303064346263313830223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a343a7b733a33323a226330383432393836383562316531623131303130333330346437623939636564223b733a33323a223738643365323931306136393232343333353964633762316237613031663935223b733a33323a226666336330646262363032393961626238616166633661643266373362313833223b733a33323a226439386630393036623138303265313531386562353966383861303761366333223b733a33323a226133623963666331396635316463323839613538373636666164323336313261223b733a33323a226235643063656336303636306539616431616138623332636331623863646164223b733a33323a223536376434663966303931336661306433353936616664616463386531366566223b733a33323a223438393862383837613266633132376266613935343339313264303831643839223b7d733a343a2268617368223b733a36353a2234383938623838376132666331323762666139353433393132643038316438392d3536376434663966303931336661306433353936616664616463386531366566223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a34303a7b733a33323a226438616537366330636131663264643166366561363766623636656632353862223b733a33323a223766383930363632646232336638333064666634373531633764396666633865223b733a33323a223535383230383364366235386364666234626663373030303638313062393563223b733a33323a226432643462353236643661326339353438633633373865366136313364663835223b733a33323a226262643037636163616431323838366661343835343131383662313632656132223b733a33323a223863636337356162333339623539326262383263303965666166396635323564223b733a33323a223735346262623233333838383039666537643332333930623566376238346635223b733a33323a223738366361383434646365356663343062653531323561666639643630313238223b733a33323a223465636638303130633165626433663261353736386639666662303539643638223b733a33323a223165626366306639663033363934323362646166636637383632623230646366223b733a33323a226430353037353031653632376561396333613535363432356236326637626637223b733a33323a226534373036623534313534663033303865316136323266336465323233633436223b733a33323a226334303563393037343534363538643937626433343335313637343062313363223b733a33323a223638636434353236373431333132626663613065393134616564396363303034223b733a33323a223431666563393632333534613663313163366162633837356437363737636337223b733a33323a226639353766343365643661316563633262356237633839613866653730393863223b733a33323a223733393833393330393538343936653030623465653664356136356535653235223b733a33323a223934366461316565636133393834343164383564386437623536303432333665223b733a33323a223833643432366439313438393563346366656666623232323636386231653066223b733a33323a223937613131646662663864613261343431613038336233343935383061346634223b733a33323a223863353236323064656331623439323834646362653534376364396433646333223b733a33323a223130363662626261653038633832666534653034613164316562623338303836223b733a33323a223637343463353631333561366135323164306139626565616465306532336163223b733a33323a223830653762373961383664373331666632303935383235393733643135343166223b733a33323a226164383431316532366636313063626266323039636363353030653531323339223b733a33323a223030326663303062616438363865663837633839303166353538393962383530223b733a33323a223466336131343962616333303332356133366165633064343034393337636632223b733a33323a223163653937626533656263396365396339343464643762353963636130366639223b733a33323a223661353835373737386661333366626632663136623033333833616566666239223b733a33323a226466623733396432336465666239653739353635633930653431386638616431223b733a33323a223763653761393631366135336630323439303461613330343137663434383335223b733a33323a223335336362333965323433323337383764386237666236303264393733636536223b733a33323a223564356232653736643033653933653662626637636665636530363462353231223b733a33323a223930333030666237326462636363646231336534633862303365636130336630223b733a33323a223865356436616230313934646361623431373634306438646236303166383632223b733a33323a223039626334386161386436643366393764663066633530643334396562656233223b733a33323a226334653362353232616637326332643966653431613462646435333530386131223b733a33323a226634653462363261613337343061663665343365346163316534383162386664223b733a33323a223163353836393932656334643864393164383736363034316563663234316162223b733a33323a223736393664386139363239323666366262653635313064343931393139663735223b733a33323a223238356630663265633931333166666539353634373636623462663066656435223b733a33323a226365373238303663623437313731346361316335356533363265343038323365223b733a33323a223563613430343665623230653332613961386566316238663137326464383231223b733a33323a223766623436333730336261316230633566343763316130636134613133316435223b733a33323a223034343238343430303264383435323861663730643564653462393463633062223b733a33323a226466373539333639363465646462393933396337373530326361316266633230223b733a33323a226266323032303838316434316465643935346433393534653935653661653836223b733a33323a226134343666343161326465333439646134306638323262623838613633313331223b733a33323a226465633932616335333263393064373730383363663264636333613465323566223b733a33323a226530333931306138613732626532376163323163663430633261323936643439223b733a33323a223230303163623035653534326435343732386236316631343231363134666332223b733a33323a226337626265663630326632373734623431666430613535653535313364316637223b733a33323a223961356163626539303663643839643061643765363132376338333235623439223b733a33323a223265353062353532393461633435643637656130663534393865616339366663223b733a33323a223435313565626564353364633934333237396232313361366233653934616339223b733a33323a223465656437623934633433346637633764396433633236323531343938333166223b733a33323a223134376236633931316365396665313635333765626164316431663865353139223b733a33323a223233613833393062653066353931363436303262633037356134366163613934223b733a33323a223531323362393665353533346365653964656631666139626562343530643735223b733a33323a223535663866643930646561393537353064356633653864383031393537663162223b733a33323a226530393261633639616633386162663335613264313865303939633236646666223b733a33323a223634353934663135326237623965623436356436383933326162653832396436223b733a33323a226338643735323131353664623839313537666338373432376538386538646230223b733a33323a226633306232303164333335636338613336383830376538383331633762383335223b733a33323a223936636361623233373461313666346630306263393239346165383466316466223b733a33323a223930643433633934336535333836363864646237376639376530633234636236223b733a33323a223365366232643361656666313034636666376166626364383136616539656138223b733a33323a226265396530383139636431393365316231386634313738663666393761353465223b733a33323a226561633439343232336561616430313732623861393033323735623465353666223b733a33323a223563306334656338666530303436306435386664376338613561303462323432223b733a33323a223465386165316334356330373036363462663962346436353662396636373637223b733a33323a226165326231323864353931356438363432306561643531383935376131626566223b733a33323a223932383534663339616162633631376539646336323964633264623365336532223b733a33323a223731323461386430353530363465313266653162653731366434643738363765223b733a33323a223037666664306336343131643230326365363131346238616562366432643336223b733a33323a223334303439626537343136356463613437353736366630393038653034333063223b733a33323a223564343333386261333739326134343933323562633039363337383263333262223b733a33323a226462363663623735646231316332363265663666383936396135346664633066223b733a33323a226531363461353436343163363962656362663736653530343161653965333663223b733a33323a226535393139353863326433623639653130303038653363333536643465353831223b7d733a343a2268617368223b733a36353a2265353931393538633264336236396531303030386533633335366434653538312d6531363461353436343163363962656362663736653530343161653965333663223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31323a7b733a33323a223932393732663861636132303839356332653966653265613035626538656363223b733a33323a223363383439643164376534653334326338326332636564626165623933636366223b733a33323a226136363764653036383232633132373732326361646530376439353835643062223b733a33323a223538343634343133333536383364393830333338363734383062353931313261223b733a33323a226261653135303037323864346262633165663463613839613933663432346237223b733a33323a223239343566643065653333323132346365336137313264623338613931646162223b733a33323a223134356161363263666334373334633733376535663430303436383866343562223b733a33323a226334313061653162333633386363366131383636623033643934353533356238223b733a33323a223135656334616461343464323037613535393833363634333564306633336366223b733a33323a223034613037353839623037353765623563653433313039316662336535663438223b733a33323a223336336236636239303239653165613961616533663537623137346530633966223b733a33323a226630383031613439383432643162336465376338353261373862393461356138223b733a33323a223834623139663361373963386633383834666566326637393164373633346266223b733a33323a226163613936343830323462346133396461336166373161343661383736353336223b733a33323a226662396435663463626635366639326462393537633935623930316132373037223b733a33323a226366633365643936366439333634303265316336333366653730343766343761223b733a33323a226533623032386364353632323865386431663835333632646463633166633936223b733a33323a226161303564353062313734613666666337346530306462643163386138633231223b733a33323a223530626437656662643264376234383330323731613266356163353766376433223b733a33323a223237666561643364646631393461313730646231373064626139623237313230223b733a33323a223531353231666466343534613431306337393030353031633132666335343864223b733a33323a226436323564326662396636343839663730383430333936373938636261356330223b733a33323a226435333464383361663462636265646536646335313833346534653338626337223b733a33323a226537313861306261303937383437613731353333353762653633363431333266223b7d733a343a2268617368223b733a36353a2265373138613062613039373834376137313533333537626536333634313332662d6435333464383361663462636265646536646335313833346534653338626337223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1702980696);

-- --------------------------------------------------------

--
-- Structure de la table `setting`
--

DROP TABLE IF EXISTS `setting`;
CREATE TABLE IF NOT EXISTS `setting` (
  `id` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `setting`
--

INSERT INTO `setting` (`id`, `value`) VALUES
('administrator_email', '\"guidoucheaimen@gmail.com\"'),
('extension_whitelist', '[\"aac\",\"aif\",\"aiff\",\"asf\",\"asx\",\"avi\",\"bmp\",\"c\",\"cc\",\"class\",\"css\",\"divx\",\"doc\",\"docx\",\"exe\",\"gif\",\"gz\",\"gzip\",\"h\",\"ico\",\"j2k\",\"jp2\",\"jpe\",\"jpeg\",\"jpg\",\"m4a\",\"m4v\",\"mdb\",\"mid\",\"midi\",\"mov\",\"mp2\",\"mp3\",\"mp4\",\"mpa\",\"mpe\",\"mpeg\",\"mpg\",\"mpp\",\"odb\",\"odc\",\"odf\",\"odg\",\"odp\",\"ods\",\"odt\",\"ogg\",\"opus\",\"pdf\",\"png\",\"pot\",\"pps\",\"ppt\",\"pptx\",\"qt\",\"ra\",\"ram\",\"rtf\",\"rtx\",\"swf\",\"tar\",\"tif\",\"tiff\",\"txt\",\"wav\",\"wax\",\"webm\",\"wma\",\"wmv\",\"wmx\",\"wri\",\"xla\",\"xls\",\"xlsx\",\"xlt\",\"xlw\",\"zip\"]'),
('installation_title', '\"omekaInstall\"'),
('locale', '\"\"'),
('media_type_whitelist', '[\"application\\/msword\",\"application\\/ogg\",\"application\\/pdf\",\"application\\/rtf\",\"application\\/vnd.ms-access\",\"application\\/vnd.ms-excel\",\"application\\/vnd.ms-powerpoint\",\"application\\/vnd.ms-project\",\"application\\/vnd.ms-write\",\"application\\/vnd.oasis.opendocument.chart\",\"application\\/vnd.oasis.opendocument.database\",\"application\\/vnd.oasis.opendocument.formula\",\"application\\/vnd.oasis.opendocument.graphics\",\"application\\/vnd.oasis.opendocument.presentation\",\"application\\/vnd.oasis.opendocument.spreadsheet\",\"application\\/vnd.oasis.opendocument.text\",\"application\\/vnd.openxmlformats-officedocument.wordprocessingml.document\",\"application\\/vnd.openxmlformats-officedocument.presentationml.presentation\",\"application\\/vnd.openxmlformats-officedocument.spreadsheetml.sheet\",\"application\\/x-gzip\",\"application\\/x-ms-wmp\",\"application\\/x-msdownload\",\"application\\/x-shockwave-flash\",\"application\\/x-tar\",\"application\\/zip\",\"audio\\/midi\",\"audio\\/mp4\",\"audio\\/mpeg\",\"audio\\/ogg\",\"audio\\/x-aac\",\"audio\\/x-aiff\",\"audio\\/x-ms-wma\",\"audio\\/x-ms-wax\",\"audio\\/x-realaudio\",\"audio\\/x-wav\",\"image\\/bmp\",\"image\\/gif\",\"image\\/jp2\",\"image\\/jpeg\",\"image\\/pjpeg\",\"image\\/png\",\"image\\/tiff\",\"image\\/x-icon\",\"text\\/css\",\"text\\/plain\",\"text\\/richtext\",\"video\\/divx\",\"video\\/mp4\",\"video\\/mpeg\",\"video\\/ogg\",\"video\\/quicktime\",\"video\\/webm\",\"video\\/x-ms-asf,\",\"video\\/x-msvideo\",\"video\\/x-ms-wmv\"]'),
('pagination_per_page', '25'),
('time_zone', '\"Europe\\/Paris\"'),
('use_htmlpurifier', '\"1\"'),
('version', '\"4.0.4\"'),
('version_notifications', '\"1\"');

-- --------------------------------------------------------

--
-- Structure de la table `site`
--

DROP TABLE IF EXISTS `site`;
CREATE TABLE IF NOT EXISTS `site` (
  `id` int NOT NULL AUTO_INCREMENT,
  `thumbnail_id` int DEFAULT NULL,
  `homepage_id` int DEFAULT NULL,
  `owner_id` int DEFAULT NULL,
  `slug` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `theme` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `navigation` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)',
  `item_pool` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)',
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL,
  `assign_new_items` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_694309E4989D9B62` (`slug`),
  UNIQUE KEY `UNIQ_694309E4571EDDA` (`homepage_id`),
  KEY `IDX_694309E4FDFF2E92` (`thumbnail_id`),
  KEY `IDX_694309E47E3C61F9` (`owner_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `site`
--

INSERT INTO `site` (`id`, `thumbnail_id`, `homepage_id`, `owner_id`, `slug`, `theme`, `title`, `summary`, `navigation`, `item_pool`, `created`, `modified`, `is_public`, `assign_new_items`) VALUES
(1, NULL, NULL, 1, 'affichage', 'default', 'affichage', 'affichage des items', '[{\"type\":\"browse\",\"data\":{\"label\":\"Browse\",\"query\":\"\"},\"links\":[]}]', '[]', '2023-10-30 09:33:14', '2023-11-05 14:39:24', 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `site_block_attachment`
--

DROP TABLE IF EXISTS `site_block_attachment`;
CREATE TABLE IF NOT EXISTS `site_block_attachment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `block_id` int NOT NULL,
  `item_id` int DEFAULT NULL,
  `media_id` int DEFAULT NULL,
  `caption` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_236473FEE9ED820C` (`block_id`),
  KEY `IDX_236473FE126F525E` (`item_id`),
  KEY `IDX_236473FEEA9FDD75` (`media_id`),
  KEY `block_position` (`block_id`,`position`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `site_block_attachment`
--

INSERT INTO `site_block_attachment` (`id`, `block_id`, `item_id`, `media_id`, `caption`, `position`) VALUES
(1, 6, NULL, NULL, '', 1),
(2, 7, NULL, NULL, '', 1);

-- --------------------------------------------------------

--
-- Structure de la table `site_item_set`
--

DROP TABLE IF EXISTS `site_item_set`;
CREATE TABLE IF NOT EXISTS `site_item_set` (
  `id` int NOT NULL AUTO_INCREMENT,
  `site_id` int NOT NULL,
  `item_set_id` int NOT NULL,
  `position` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_D4CE134F6BD1646960278D7` (`site_id`,`item_set_id`),
  KEY `IDX_D4CE134F6BD1646` (`site_id`),
  KEY `IDX_D4CE134960278D7` (`item_set_id`),
  KEY `position` (`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `site_page`
--

DROP TABLE IF EXISTS `site_page`;
CREATE TABLE IF NOT EXISTS `site_page` (
  `id` int NOT NULL AUTO_INCREMENT,
  `site_id` int NOT NULL,
  `slug` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_public` tinyint(1) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_2F900BD9F6BD1646989D9B62` (`site_id`,`slug`),
  KEY `IDX_2F900BD9F6BD1646` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `site_page`
--

INSERT INTO `site_page` (`id`, `site_id`, `slug`, `title`, `is_public`, `created`, `modified`) VALUES
(1, 1, 'welcome', 'Welcome', 1, '2023-10-30 09:33:14', '2023-10-30 09:33:14'),
(2, 1, 'affichageitems', 'affichageItems', 1, '2023-10-30 09:34:09', '2023-10-30 09:54:12');

-- --------------------------------------------------------

--
-- Structure de la table `site_page_block`
--

DROP TABLE IF EXISTS `site_page_block`;
CREATE TABLE IF NOT EXISTS `site_page_block` (
  `id` int NOT NULL AUTO_INCREMENT,
  `page_id` int NOT NULL,
  `layout` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)',
  `position` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_C593E731C4663E4` (`page_id`),
  KEY `page_position` (`page_id`,`position`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `site_page_block`
--

INSERT INTO `site_page_block` (`id`, `page_id`, `layout`, `data`, `position`) VALUES
(1, 1, 'html', '{\"html\":\"    <p>Welcome to your new site. This is an example page.<\\/p>\\r\\n    <ul>\\r\\n        <li>This is a bullet list.<\\/li>\\r\\n        <li>Second entry.<\\/li>\\r\\n    <\\/ul>\\r\\n    <p>Back to normal again.<\\/p>\\r\\n    <ol>\\r\\n        <li>This is an ordered list.<\\/li>\\r\\n        <li>Second entry.<\\/li>\\r\\n    <\\/ol>\\r\\n    <p>Back to normal again.<\\/p>\\r\\n    <blockquote>This is a blockquote.<\\/blockquote>\\r\\n    <p>Back to normal again.<\\/p>\\r\\n    <div><a href=\\\"#\\\">This text is a link, which currently points to nothing.<\\/a><\\/div>\\r\\n    <p><strong>This text is bold, in a &lt;strong&gt; tag.<\\/strong><\\/p>\\r\\n    <p><em>This text is italicized, in an &lt;em&gt; tag.<\\/em><\\/p>\\r\\n    <p><u>This text is underlined, in a &lt;u&gt; tag.<\\/u><\\/p>\\r\\n    <p><s>This text has a strikethrough, in a &lt;s&gt; tag.<\\/s><\\/p>\\r\\n    <p>This text is <sub>subscript<\\/sub> and <sup>superscript<\\/sup> using &lt;sub&gt; and &lt;sup&gt;, which can be used for adding notes and citations.<\\/p>\\r\\n    <hr \\/>\\r\\n    <h1>This is an H1 title. It is bigger than the Page Title, which is rendered in H2.<\\/h1>\\r\\n    <h2>This is an H2 header, the same size as the Page Title.<\\/h2>\\r\\n    <h3>This is an H3 subheader.<\\/h3>\\r\\n    <h4>This is an H4 subheader.<\\/h4>\\r\\n    <h5>This is an H5 subheader.<\\/h5>\\r\\n    <h6>This is an H6 subheader.<\\/h6>\"}', 1),
(2, 1, 'lineBreak', '{\"break_type\":\"opaque\"}', 2),
(3, 1, 'html', '{\"html\":\"    <h2 style=\\\"font-style:italic;\\\">This is the \\\"Italic Title\\\" block style.<\\/h2>\\r\\n    <h3 style=\\\"color:#aaaaaa;font-style:italic;\\\">This is the \\\"Subtitle\\\" block style.<\\/h3>\\r\\n    <div style=\\\"background:#eeeeee;border:1px solid #cccccc;padding:5px 10px;\\\">This is the \\\"Special Container\\\" block style.<\\/div>\\r\\n    <p><span class=\\\"marker\\\">This is the \\\"Marker\\\" inline style. <\\/span><\\/p>\\r\\n    <p><big>This is the \\\"Big\\\" inline style.<\\/big> This is normal text.<\\/p>\\r\\n    <p><small>This text is inside a \\\"small\\\" inline style.<\\/small> This is normal text.<\\/p>\\r\\n    <p><code>This is the \\\"Computer Code\\\" inline style.<\\/code><\\/p>\\r\\n    <p><span dir=\\\"rtl\\\">\\u0644\\u0643\\u0646 \\u0644\\u0627 \\u0628\\u062f \\u0623\\u0646 \\u0623\\u0648\\u0636\\u062d \\u0644\\u0643 \\u0623\\u0646 \\u0643\\u0644 \\u0647\\u0630\\u0647 \\u0627\\u0644\\u0623\\u0641\\u0643\\u0627\\u0631 \\u0627\\u0644\\u0645\\u063a\\u0644\\u0648\\u0637\\u0629 \\u062d\\u0648\\u0644 \\u0627\\u0633\\u062a\\u0646\\u0643\\u0627\\u0631 \\u0627\\u0644\\u0646\\u0634\\u0648\\u0629 \\u0648\\u062a\\u0645\\u062c\\u064a\\u062f \\u0627\\u0644\\u0623\\u0644\\u0645 \\u064a\\u0639\\u0631\\u0636 \\u0647\\u0630\\u0627 \\u0627\\u0644\\u0646\\u0635 \\u0645\\u0646 \\u0627\\u0644\\u064a\\u0645\\u064a\\u0646 \\u0625\\u0644\\u0649 \\u0627\\u0644\\u064a\\u0633\\u0627\\u0631.<\\/span><\\/p>\"}', 3),
(4, 2, 'pageTitle', '[]', 1),
(5, 2, 'itemShowCase', '{\"thumbnail_type\":\"large\",\"show_title_option\":\"item_title\"}', 2),
(6, 2, 'itemWithMetadata', '[]', 3),
(7, 2, 'itemWithMetadata', '[]', 4);

-- --------------------------------------------------------

--
-- Structure de la table `site_permission`
--

DROP TABLE IF EXISTS `site_permission`;
CREATE TABLE IF NOT EXISTS `site_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `site_id` int NOT NULL,
  `user_id` int NOT NULL,
  `role` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_C0401D6FF6BD1646A76ED395` (`site_id`,`user_id`),
  KEY `IDX_C0401D6FF6BD1646` (`site_id`),
  KEY `IDX_C0401D6FA76ED395` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `site_permission`
--

INSERT INTO `site_permission` (`id`, `site_id`, `user_id`, `role`) VALUES
(1, 1, 1, 'admin');

-- --------------------------------------------------------

--
-- Structure de la table `site_setting`
--

DROP TABLE IF EXISTS `site_setting`;
CREATE TABLE IF NOT EXISTS `site_setting` (
  `id` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_id` int NOT NULL,
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)',
  PRIMARY KEY (`id`,`site_id`),
  KEY `IDX_64D05A53F6BD1646` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `password_hash` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `name`, `created`, `modified`, `password_hash`, `role`, `is_active`) VALUES
(1, 'guidoucheaimen@gmail.com', 'aimen', '2023-10-30 09:02:09', '2023-10-30 09:02:09', '$2y$10$iABDCOJTzDNefMnMGa83WuIZkpg7.U2DfLUB/cPh2duZl1lLLkKgO', 'global_admin', 1);

-- --------------------------------------------------------

--
-- Structure de la table `user_setting`
--

DROP TABLE IF EXISTS `user_setting`;
CREATE TABLE IF NOT EXISTS `user_setting` (
  `id` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int NOT NULL,
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)',
  PRIMARY KEY (`id`,`user_id`),
  KEY `IDX_C779A692A76ED395` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `value`
--

DROP TABLE IF EXISTS `value`;
CREATE TABLE IF NOT EXISTS `value` (
  `id` int NOT NULL AUTO_INCREMENT,
  `resource_id` int NOT NULL,
  `property_id` int NOT NULL,
  `value_resource_id` int DEFAULT NULL,
  `value_annotation_id` int DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `uri` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_public` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_1D7758349B66727E` (`value_annotation_id`),
  KEY `IDX_1D77583489329D25` (`resource_id`),
  KEY `IDX_1D775834549213EC` (`property_id`),
  KEY `IDX_1D7758344BC72506` (`value_resource_id`),
  KEY `value` (`value`(190)),
  KEY `uri` (`uri`(190))
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `value`
--

INSERT INTO `value` (`id`, `resource_id`, `property_id`, `value_resource_id`, `value_annotation_id`, `type`, `lang`, `value`, `uri`, `is_public`) VALUES
(14, 8, 1, NULL, NULL, 'literal', '', 'Fiche Ahlete John Doe', NULL, 1),
(15, 8, 243, NULL, NULL, 'literal', '', 'Gold', NULL, 1),
(16, 8, 240, NULL, NULL, 'literal', '', 'John Doe', NULL, 1),
(17, 8, 241, NULL, NULL, 'literal', '', 'USA', NULL, 1),
(18, 8, 244, NULL, NULL, 'literal', '', '1', NULL, 1),
(19, 9, 1, NULL, NULL, 'literal', '', 'Fiche Athlete Alice Smith', NULL, 1),
(20, 9, 243, NULL, NULL, 'literal', '', 'Silver', NULL, 1),
(21, 9, 240, NULL, NULL, 'literal', '', 'Alice Smith', NULL, 1),
(22, 9, 241, NULL, NULL, 'literal', '', 'Canada', NULL, 1),
(23, 9, 244, NULL, NULL, 'literal', '', '2', NULL, 1),
(24, 10, 1, NULL, NULL, 'literal', '', 'Fiche Athlete Mohammed Ahmed', NULL, 1),
(25, 10, 243, NULL, NULL, 'literal', '', 'Bronze', NULL, 1),
(26, 10, 240, NULL, NULL, 'literal', '', 'Mohammed Ahmed', NULL, 1),
(27, 10, 241, NULL, NULL, 'literal', '', 'Ethiopia', NULL, 1),
(28, 10, 244, NULL, NULL, 'literal', '', '3', NULL, 1),
(29, 11, 1, NULL, NULL, 'literal', '', 'Compétition 1', NULL, 1),
(30, 11, 240, NULL, NULL, 'literal', '', 'Summer Olympics 2020', NULL, 1),
(31, 11, 243, NULL, NULL, 'literal', '', 'Successful', NULL, 1),
(32, 11, 242, NULL, NULL, 'literal', '', '2020', NULL, 1),
(33, 12, 1, NULL, NULL, 'literal', '', 'Competition 2', NULL, 1),
(34, 12, 240, NULL, NULL, 'literal', '', 'Winter Olympics 2022', NULL, 1),
(35, 12, 243, NULL, NULL, 'literal', '', 'In Progress', NULL, 1),
(36, 12, 242, NULL, NULL, 'literal', '', '2022', NULL, 1),
(37, 13, 1, NULL, NULL, 'literal', '', 'Statistiques medal 2020', NULL, 1),
(38, 13, 241, NULL, NULL, 'literal', '', 'Japan', NULL, 1),
(39, 13, 242, NULL, NULL, 'literal', '', '2020', NULL, 1),
(40, 14, 1, NULL, NULL, 'literal', '', 'Statistiques medal 2024', NULL, 1),
(41, 14, 241, NULL, NULL, 'literal', '', 'France', NULL, 1),
(42, 14, 242, NULL, NULL, 'literal', '', '2024', NULL, 1),
(43, 15, 1, NULL, NULL, 'literal', '', 'Sport 1', NULL, 1),
(44, 15, 240, NULL, NULL, 'literal', '', 'Athletics', NULL, 1),
(45, 16, 1, NULL, NULL, 'literal', '', 'sport 2', NULL, 1),
(46, 16, 240, NULL, NULL, 'literal', '', 'Swiming', NULL, 1);

-- --------------------------------------------------------

--
-- Structure de la table `value_annotation`
--

DROP TABLE IF EXISTS `value_annotation`;
CREATE TABLE IF NOT EXISTS `value_annotation` (
  `id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `vocabulary`
--

DROP TABLE IF EXISTS `vocabulary`;
CREATE TABLE IF NOT EXISTS `vocabulary` (
  `id` int NOT NULL AUTO_INCREMENT,
  `owner_id` int DEFAULT NULL,
  `namespace_uri` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `prefix` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_9099C97B9B267FDF` (`namespace_uri`),
  UNIQUE KEY `UNIQ_9099C97B93B1868E` (`prefix`),
  KEY `IDX_9099C97B7E3C61F9` (`owner_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `vocabulary`
--

INSERT INTO `vocabulary` (`id`, `owner_id`, `namespace_uri`, `prefix`, `label`, `comment`) VALUES
(1, NULL, 'http://purl.org/dc/terms/', 'dcterms', 'Dublin Core', 'Basic resource metadata (DCMI Metadata Terms)'),
(2, NULL, 'http://purl.org/dc/dcmitype/', 'dctype', 'Dublin Core Type', 'Basic resource types (DCMI Type Vocabulary)'),
(7, 1, 'https://JeuxOlympiques.univ-paris8.fr/onto/joc#', 'joc', 'JeuxOlympiques', '');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `fulltext_search`
--
ALTER TABLE `fulltext_search` ADD FULLTEXT KEY `IDX_AA31FE4A2B36786B3B8BA7C7` (`title`,`text`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `api_key`
--
ALTER TABLE `api_key`
  ADD CONSTRAINT `FK_C912ED9D7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `asset`
--
ALTER TABLE `asset`
  ADD CONSTRAINT `FK_2AF5A5C7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `fulltext_search`
--
ALTER TABLE `fulltext_search`
  ADD CONSTRAINT `FK_AA31FE4A7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `FK_1F1B251EBF396750` FOREIGN KEY (`id`) REFERENCES `resource` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_1F1B251ECBE0B084` FOREIGN KEY (`primary_media_id`) REFERENCES `media` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `item_item_set`
--
ALTER TABLE `item_item_set`
  ADD CONSTRAINT `FK_6D0C9625126F525E` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_6D0C9625960278D7` FOREIGN KEY (`item_set_id`) REFERENCES `item_set` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `item_set`
--
ALTER TABLE `item_set`
  ADD CONSTRAINT `FK_1015EEEBF396750` FOREIGN KEY (`id`) REFERENCES `resource` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `item_site`
--
ALTER TABLE `item_site`
  ADD CONSTRAINT `FK_A1734D1F126F525E` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_A1734D1FF6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `job`
--
ALTER TABLE `job`
  ADD CONSTRAINT `FK_FBD8E0F87E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `media`
--
ALTER TABLE `media`
  ADD CONSTRAINT `FK_6A2CA10C126F525E` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`),
  ADD CONSTRAINT `FK_6A2CA10CBF396750` FOREIGN KEY (`id`) REFERENCES `resource` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `password_creation`
--
ALTER TABLE `password_creation`
  ADD CONSTRAINT `FK_C77917B4A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `property`
--
ALTER TABLE `property`
  ADD CONSTRAINT `FK_8BF21CDE7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_8BF21CDEAD0E05F6` FOREIGN KEY (`vocabulary_id`) REFERENCES `vocabulary` (`id`);

--
-- Contraintes pour la table `resource`
--
ALTER TABLE `resource`
  ADD CONSTRAINT `FK_BC91F41616131EA` FOREIGN KEY (`resource_template_id`) REFERENCES `resource_template` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_BC91F416448CC1BD` FOREIGN KEY (`resource_class_id`) REFERENCES `resource_class` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_BC91F4167E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_BC91F416FDFF2E92` FOREIGN KEY (`thumbnail_id`) REFERENCES `asset` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `resource_class`
--
ALTER TABLE `resource_class`
  ADD CONSTRAINT `FK_C6F063AD7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_C6F063ADAD0E05F6` FOREIGN KEY (`vocabulary_id`) REFERENCES `vocabulary` (`id`);

--
-- Contraintes pour la table `resource_template`
--
ALTER TABLE `resource_template`
  ADD CONSTRAINT `FK_39ECD52E448CC1BD` FOREIGN KEY (`resource_class_id`) REFERENCES `resource_class` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_39ECD52E724734A3` FOREIGN KEY (`title_property_id`) REFERENCES `property` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_39ECD52E7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_39ECD52EB84E0D1D` FOREIGN KEY (`description_property_id`) REFERENCES `property` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `resource_template_property`
--
ALTER TABLE `resource_template_property`
  ADD CONSTRAINT `FK_4689E2F116131EA` FOREIGN KEY (`resource_template_id`) REFERENCES `resource_template` (`id`),
  ADD CONSTRAINT `FK_4689E2F1549213EC` FOREIGN KEY (`property_id`) REFERENCES `property` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `site`
--
ALTER TABLE `site`
  ADD CONSTRAINT `FK_694309E4571EDDA` FOREIGN KEY (`homepage_id`) REFERENCES `site_page` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_694309E47E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_694309E4FDFF2E92` FOREIGN KEY (`thumbnail_id`) REFERENCES `asset` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `site_block_attachment`
--
ALTER TABLE `site_block_attachment`
  ADD CONSTRAINT `FK_236473FE126F525E` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_236473FEE9ED820C` FOREIGN KEY (`block_id`) REFERENCES `site_page_block` (`id`),
  ADD CONSTRAINT `FK_236473FEEA9FDD75` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `site_item_set`
--
ALTER TABLE `site_item_set`
  ADD CONSTRAINT `FK_D4CE134960278D7` FOREIGN KEY (`item_set_id`) REFERENCES `item_set` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_D4CE134F6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `site_page`
--
ALTER TABLE `site_page`
  ADD CONSTRAINT `FK_2F900BD9F6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`);

--
-- Contraintes pour la table `site_page_block`
--
ALTER TABLE `site_page_block`
  ADD CONSTRAINT `FK_C593E731C4663E4` FOREIGN KEY (`page_id`) REFERENCES `site_page` (`id`);

--
-- Contraintes pour la table `site_permission`
--
ALTER TABLE `site_permission`
  ADD CONSTRAINT `FK_C0401D6FA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_C0401D6FF6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `site_setting`
--
ALTER TABLE `site_setting`
  ADD CONSTRAINT `FK_64D05A53F6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `user_setting`
--
ALTER TABLE `user_setting`
  ADD CONSTRAINT `FK_C779A692A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `value`
--
ALTER TABLE `value`
  ADD CONSTRAINT `FK_1D7758344BC72506` FOREIGN KEY (`value_resource_id`) REFERENCES `resource` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_1D775834549213EC` FOREIGN KEY (`property_id`) REFERENCES `property` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_1D77583489329D25` FOREIGN KEY (`resource_id`) REFERENCES `resource` (`id`),
  ADD CONSTRAINT `FK_1D7758349B66727E` FOREIGN KEY (`value_annotation_id`) REFERENCES `value_annotation` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `value_annotation`
--
ALTER TABLE `value_annotation`
  ADD CONSTRAINT `FK_C03BA4EBF396750` FOREIGN KEY (`id`) REFERENCES `resource` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `vocabulary`
--
ALTER TABLE `vocabulary`
  ADD CONSTRAINT `FK_9099C97B7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
