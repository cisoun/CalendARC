-- phpMyAdmin SQL Dump
-- version 4.4.2
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Mar 21 Avril 2015 à 15:56
-- Version du serveur :  10.0.17-MariaDB-log
-- Version de PHP :  5.6.8

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Contenu de la table `classes`
--

INSERT INTO `classes` (`idclass`, `name`) VALUES
(1, 'INF1'),
(2, 'INF2');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Contenu de la table `events`
--

INSERT INTO `events` (`idevent`, `iduser`, `name`, `description`, `startdate`, `enddate`) VALUES
(1, 3, 'Event 1', 'Oui', '2015-04-23 14:00:00', '2015-04-23 20:00:00'),
(2, 3, 'Event 2', 'Non', '2015-04-21 14:00:00', '2015-04-21 17:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `lessons`
--

CREATE TABLE IF NOT EXISTS `lessons` (
  `idlesson` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `room` int(11) NOT NULL,
  `period` smallint(6) NOT NULL,
  `length` smallint(6) NOT NULL,
  `day` tinyint(2) NOT NULL,
  `cycle` tinyint(2) DEFAULT NULL COMMENT '0/null for every week, 1 for even, 2 for odd'
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Contenu de la table `lessons`
--

INSERT INTO `lessons` (`idlesson`, `name`, `room`, `period`, `length`, `day`, `cycle`) VALUES
(3, 'Le fist', 666, 1, 3, 3, 0);

-- --------------------------------------------------------

--
-- Structure de la table `permission`
--

CREATE TABLE IF NOT EXISTS `permission` (
  `id` int(11) NOT NULL,
  `permissionName` varchar(25) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `permission`
--

INSERT INTO `permission` (`id`, `permissionName`) VALUES
(1, 'admin'),
(2, 'student'),
(3, 'teacher');

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
  `idlesson` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Contenu de la table `rel_class_lesson`
--

INSERT INTO `rel_class_lesson` (`idrel`, `idclass`, `idlesson`) VALUES
(2, 1, 3);

-- --------------------------------------------------------

--
-- Structure de la table `rel_class_user`
--

CREATE TABLE IF NOT EXISTS `rel_class_user` (
  `idrel` int(11) NOT NULL,
  `iduser` int(11) NOT NULL,
  `idclass` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Contenu de la table `rel_class_user`
--

INSERT INTO `rel_class_user` (`idrel`, `iduser`, `idclass`) VALUES
(1, 3, 1);

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
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `mail` varchar(64) NOT NULL,
  `password` varchar(64) NOT NULL,
  `permission` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Contenu de la table `users`
--

INSERT INTO `users` (`iduser`, `firstname`, `lastname`, `mail`, `password`, `permission`) VALUES
(1, 'Robert', 'Paulson', 'robert.paulson@he-arc.ch', '4007d46292298e83da10d0763d95d5139fe0c157148d0587aa912170414ccba6', 1),
(2, 'Simon', 'Guillaume-gentil', 'simon.guillaume@he-arc.ch', '088e16a1019277b15d58faf0541e11910eb756f6', 2),
(3, 'Jean', 'Jacques', 'jean@jean.com', '4ff17bc8ee5f240c792b8a41bfa2c58af726d83b925cf696af0c811627714c85', 3);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `userspermissions`
--
CREATE TABLE IF NOT EXISTS `userspermissions` (
`idUser` int(11)
,`firstname` varchar(255)
,`lastname` varchar(255)
,`mail` varchar(64)
,`password` varchar(64)
,`permissionName` varchar(25)
);

-- --------------------------------------------------------

--
-- Structure de la vue `userspermissions`
--
DROP TABLE IF EXISTS `userspermissions`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `userspermissions` AS select `users`.`iduser` AS `idUser`,`users`.`firstname` AS `firstname`,`users`.`lastname` AS `lastname`,`users`.`mail` AS `mail`,`users`.`password` AS `password`,`permission`.`permissionName` AS `permissionName` from (`users` join `permission`) where (`users`.`permission` = `permission`.`id`);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`idadmin`),
  ADD UNIQUE KEY `iduser_UNIQUE` (`iduser`);

--
-- Index pour la table `calendars`
--
ALTER TABLE `calendars`
  ADD PRIMARY KEY (`idcalendar`);

--
-- Index pour la table `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`idclass`),
  ADD UNIQUE KEY `name` (`name`);

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
-- Index pour la table `permission`
--
ALTER TABLE `permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

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
-- Index pour la table `rel_class_user`
--
ALTER TABLE `rel_class_user`
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
  ADD PRIMARY KEY (`idteacher`),
  ADD UNIQUE KEY `iduser` (`iduser`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`iduser`),
  ADD UNIQUE KEY `mail` (`mail`),
  ADD KEY `permission` (`permission`);

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
  MODIFY `idclass` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `events`
--
ALTER TABLE `events`
  MODIFY `idevent` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `lessons`
--
ALTER TABLE `lessons`
  MODIFY `idlesson` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT pour la table `permission`
--
ALTER TABLE `permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
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
  MODIFY `idrel` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `rel_class_user`
--
ALTER TABLE `rel_class_user`
  MODIFY `idrel` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
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
  MODIFY `iduser` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_permission` FOREIGN KEY (`permission`) REFERENCES `permission` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
