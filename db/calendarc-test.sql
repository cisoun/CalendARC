-- phpMyAdmin SQL Dump
-- version 4.3.11.1
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Mar 10 Mars 2015 à 13:32
-- Version du serveur :  10.0.17-MariaDB-log
-- Version de PHP :  5.6.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `calendarc`
--

-- --------------------------------------------------------

--
-- Structure de la table `admins`
--

CREATE TABLE IF NOT EXISTS `admins` (
  `idadmin` int(11) NOT NULL,
  `iduser` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Contenu de la table `admins`
--

INSERT INTO `admins` (`idadmin`, `iduser`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `calendars`
--

CREATE TABLE IF NOT EXISTS `calendars` (
  `idcalendar` int(11) NOT NULL,
  `iduser` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `classes`
--

CREATE TABLE IF NOT EXISTS `classes` (
  `idclass` int(11) NOT NULL,
  `name` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `events`
--

CREATE TABLE IF NOT EXISTS `events` (
  `idevent` int(11) NOT NULL,
  `iduser` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text,
  `startdate` datetime NOT NULL,
  `enddate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `lessons`
--

CREATE TABLE IF NOT EXISTS `lessons` (
  `idlesson` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `room` int(11) NOT NULL,
  `starttime` time NOT NULL,
  `endtime` time NOT NULL,
  `day` tinyint(1) NOT NULL,
  `cycle` tinyint(1) DEFAULT NULL COMMENT '0/null for every week, 1 for even, 2 for odd'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `rel_calendar_event`
--

CREATE TABLE IF NOT EXISTS `rel_calendar_event` (
  `idrel` int(11) NOT NULL,
  `idcalendar` int(11) NOT NULL,
  `idevent` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `rel_calendar_user`
--

CREATE TABLE IF NOT EXISTS `rel_calendar_user` (
  `idrel` int(11) NOT NULL,
  `idcalendar` int(11) NOT NULL,
  `iduser` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `rel_class_lesson`
--

CREATE TABLE IF NOT EXISTS `rel_class_lesson` (
  `idrel` int(11) NOT NULL,
  `idclass` int(11) NOT NULL,
  `idroom` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `rel_event_user`
--

CREATE TABLE IF NOT EXISTS `rel_event_user` (
  `idrel` int(11) NOT NULL,
  `idevent` int(11) NOT NULL,
  `iduser` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `rel_lesson_user`
--

CREATE TABLE IF NOT EXISTS `rel_lesson_user` (
  `idrel` int(11) NOT NULL,
  `idlesson` int(11) NOT NULL,
  `iduser` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `teachers`
--

CREATE TABLE IF NOT EXISTS `teachers` (
  `idteacher` int(11) NOT NULL,
  `iduser` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Contenu de la table `teachers`
--

INSERT INTO `teachers` (`idteacher`, `iduser`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `iduser` int(11) NOT NULL,
  `firtsname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `mail` varchar(64) NOT NULL,
  `password` varchar(64) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Contenu de la table `users`
--

INSERT INTO `users` (`iduser`, `firtsname`, `lastname`, `mail`, `password`) VALUES
(1, 'Robert', 'Paulson', 'robert.paulson@he-arc.ch', '12e9293ec6b30c7fa8a0926af42807e929c1684f'),
(2, 'Simon', 'Guillaume-gentil', 'simon.guillaume@he-arc.ch', '088e16a1019277b15d58faf0541e11910eb756f6');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`idadmin`), ADD UNIQUE KEY `iduser_UNIQUE` (`iduser`);

--
-- Index pour la table `calendars`
--
ALTER TABLE `calendars`
  ADD PRIMARY KEY (`idcalendar`);

--
-- Index pour la table `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`idclass`), ADD UNIQUE KEY `name` (`name`);

--
-- Index pour la table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`idevent`);

--
-- Index pour la table `lessons`
--
ALTER TABLE `lessons`
  ADD PRIMARY KEY (`idlesson`);

--
-- Index pour la table `rel_calendar_event`
--
ALTER TABLE `rel_calendar_event`
  ADD PRIMARY KEY (`idrel`);

--
-- Index pour la table `rel_calendar_user`
--
ALTER TABLE `rel_calendar_user`
  ADD PRIMARY KEY (`idrel`);

--
-- Index pour la table `rel_class_lesson`
--
ALTER TABLE `rel_class_lesson`
  ADD PRIMARY KEY (`idrel`);

--
-- Index pour la table `rel_event_user`
--
ALTER TABLE `rel_event_user`
  ADD PRIMARY KEY (`idrel`);

--
-- Index pour la table `rel_lesson_user`
--
ALTER TABLE `rel_lesson_user`
  ADD PRIMARY KEY (`idrel`);

--
-- Index pour la table `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`idteacher`), ADD UNIQUE KEY `iduser` (`iduser`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`iduser`), ADD UNIQUE KEY `mail` (`mail`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `admins`
--
ALTER TABLE `admins`
  MODIFY `idadmin` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `calendars`
--
ALTER TABLE `calendars`
  MODIFY `idcalendar` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `classes`
--
ALTER TABLE `classes`
  MODIFY `idclass` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `events`
--
ALTER TABLE `events`
  MODIFY `idevent` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `lessons`
--
ALTER TABLE `lessons`
  MODIFY `idlesson` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `rel_calendar_event`
--
ALTER TABLE `rel_calendar_event`
  MODIFY `idrel` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `rel_calendar_user`
--
ALTER TABLE `rel_calendar_user`
  MODIFY `idrel` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `rel_class_lesson`
--
ALTER TABLE `rel_class_lesson`
  MODIFY `idrel` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `rel_event_user`
--
ALTER TABLE `rel_event_user`
  MODIFY `idrel` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `rel_lesson_user`
--
ALTER TABLE `rel_lesson_user`
  MODIFY `idrel` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `teachers`
--
ALTER TABLE `teachers`
  MODIFY `idteacher` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `iduser` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
