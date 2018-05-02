-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le :  mer. 02 mai 2018 à 09:23
-- Version du serveur :  10.1.30-MariaDB
-- Version de PHP :  7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `test`
--

DELIMITER $$
--
-- Procédures
--
CREATE DEFINER=`` PROCEDURE `AddGeometryColumn` (`catalog` VARCHAR(64), `t_schema` VARCHAR(64), `t_name` VARCHAR(64), `geometry_column` VARCHAR(64), `t_srid` INT)  begin
  set @qwe= concat('ALTER TABLE ', t_schema, '.', t_name, ' ADD ', geometry_column,' GEOMETRY REF_SYSTEM_ID=', t_srid); PREPARE ls from @qwe; execute ls; deallocate prepare ls; end$$

CREATE DEFINER=`` PROCEDURE `DropGeometryColumn` (`catalog` VARCHAR(64), `t_schema` VARCHAR(64), `t_name` VARCHAR(64), `geometry_column` VARCHAR(64))  begin
  set @qwe= concat('ALTER TABLE ', t_schema, '.', t_name, ' DROP ', geometry_column); PREPARE ls from @qwe; execute ls; deallocate prepare ls; end$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `billets`
--

CREATE TABLE `billets` (
  `id` int(11) NOT NULL,
  `titre` varchar(255) NOT NULL,
  `contenu` text NOT NULL,
  `date_creation` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `billets`
--

INSERT INTO `billets` (`id`, `titre`, `contenu`, `date_creation`) VALUES
(1, 'Bienvenue sur mon blog !', 'Je vous souhaite à toutes et à tous la bienvenue sur mon blog qui parlera de... PHP bien sûr !', '2010-03-25 16:28:41'),
(2, 'Le PHP à la conquête du monde !', 'C\'est officiel, l\'éléPHPant a annoncé à la radio hier soir \"J\'ai l\'intention de conquérir le monde !\".\r\nIl a en outre précisé que le monde serait à sa botte en moins de temps qu\'il n\'en fallait pour dire \"éléPHPant\". Pas dur, ceci dit entre nous...', '2010-03-27 18:31:11'),
(5, 'Gonfler la bulle boursière', 'Le Border Adjustment Tax, abandonné mi-2017, a laissé la place, début novembre, à un projet de loi envisageant de taxer, à un taux de 20 %, les importations intergroupes des multinationales étrangères situées sur le sol US, ainsi que celles des filiales étrangères des multinationales états-uniennes.\r\nCette fois, il ne s’agissait pas de taxer toutes les importations, mais seulement les flux entre les unités d’un même groupe présent aux États-Unis [4]. L’objectif était d’éviter qu’un groupe puisse réduire ses profits taxables aux USA en achetant des biens intermédiaires produits par ses filiales à l’étranger et ainsi déplacer la production hors du territoire national. Cette taxe aurait seulement rapporté au Trésor 155 milliards de dollars sur une période de 10 ans, soit 10 fois moins que le Border Adjustment Tax. Cependant, l’objectif était moins dans les rentrées fiscales que dans l’incitation à produire aux USA.', '2018-02-28 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `commentaires`
--

CREATE TABLE `commentaires` (
  `id` int(11) NOT NULL,
  `id_billet` int(11) NOT NULL,
  `auteur` varchar(255) NOT NULL,
  `commentaire` text NOT NULL,
  `date_commentaire` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `commentaires`
--

INSERT INTO `commentaires` (`id`, `id_billet`, `auteur`, `commentaire`, `date_commentaire`) VALUES
(1, 1, 'M@teo21', 'Un peu court ce billet !', '2010-03-25 16:49:53'),
(2, 1, 'Maxime', 'Oui, ça commence pas très fort ce blog...', '2010-03-25 16:57:16'),
(3, 1, 'MultiKiller', '+1 !', '2010-03-25 17:12:52'),
(4, 2, 'John', 'Preum\'s !', '2010-03-27 18:59:49'),
(5, 2, 'Maxime', 'Excellente analyse de la situation !\r\nIl y arrivera plus tôt qu\'on ne le pense !', '2010-03-27 22:02:13'),
(11, 5, 'Samantha', 'Mais y a pas encore de commentaire ici dis donc !', '0000-00-00 00:00:00'),
(8, 2, 'Michel', 'commentaire 7', '2018-03-01 12:17:06'),
(9, 2, 'Jérôme', 'Grosse start up', '2018-03-01 12:17:18'),
(10, 2, 'dffddf', 'suite modifier', '2018-03-05 10:05:51'),
(12, 5, 'Samantha', 'Mais y a pas encore de commentaire ici dis donc !', '2018-03-14 20:31:09'),
(31, 1, 'Olivier', 'J\'ai pas essayé hein !', '2018-03-21 17:35:45'),
(29, 1, 'Orthodox', 'L\'empire renaîtra', '2018-03-21 12:07:30'),
(30, 2, 'Valaam', 'Orthodox shrines choirs North Russia', '2018-03-21 12:23:33'),
(19, 5, 'JD', 'Je bouffe des framboises', '2018-03-19 18:52:03'),
(23, 5, 'lol', 'Pq ça marche pas', '2018-03-19 19:00:59'),
(34, 2, 'Larond', 'C\'est génial!', '2018-03-29 20:14:50'),
(25, 5, 'Kad Merad', 'Kamoulox !', '2018-03-19 20:56:33'),
(27, 5, 'Joseph', 'Je suis venu', '2018-03-19 21:31:46'),
(28, 2, 'Papa', 'Posé son regard', '2018-03-19 21:32:08');

-- --------------------------------------------------------

--
-- Structure de la table `minichat`
--

CREATE TABLE `minichat` (
  `ID` int(11) NOT NULL,
  `Pseudo` varchar(10) NOT NULL,
  `message` varchar(200) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `minichat`
--

INSERT INTO `minichat` (`ID`, `Pseudo`, `message`, `date`) VALUES
(1, 'Nico', 'Bonjour', '2018-02-27 23:19:22'),
(2, 'John', 'Esoteric', '2018-02-27 23:19:22'),
(3, 'Kirk', 'Entreprise', '2018-02-27 23:19:22'),
(4, 'Nico', 'Jai pas envie de bosser', '2018-02-27 23:19:22'),
(6, 'Alixe', 'j\'initialise une fonction', '2018-02-27 23:19:22'),
(7, 'Olivier', 'Bonne question', '2018-02-27 23:19:22'),
(8, 'Simon', 'ok', '2018-02-27 23:19:22'),
(10, 'Gigi', 'Nouveau message', '2018-02-27 23:19:22'),
(11, 'Alixe', 'linkedin', '2018-02-27 23:19:22'),
(12, 'Klik', 'Evoken', '2018-02-27 23:19:22'),
(13, 'Mike', 'Gu us destia', '2018-02-27 23:19:22'),
(14, 'Nico', 'Mergrul', '2018-02-27 23:19:22'),
(15, 'Simon', 'YTP', '2018-02-27 23:19:22'),
(16, 'Simon', 'Badminton ce soir !', '2018-02-27 23:19:22'),
(17, 'Lara', 'Le dernier est pas mal', '2018-02-27 23:19:22'),
(18, 'Lara', 'manette', '2018-02-27 23:19:22');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `billets`
--
ALTER TABLE `billets`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `commentaires`
--
ALTER TABLE `commentaires`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `minichat`
--
ALTER TABLE `minichat`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `billets`
--
ALTER TABLE `billets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `commentaires`
--
ALTER TABLE `commentaires`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT pour la table `minichat`
--
ALTER TABLE `minichat`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
