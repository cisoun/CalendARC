-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Mar 31 Mars 2015 à 16:10
-- Version du serveur :  5.6.17
-- Version de PHP :  5.5.12

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
  `idadmin` int(11) NOT NULL AUTO_INCREMENT,
  `iduser` int(11) DEFAULT NULL,
  PRIMARY KEY (`idadmin`),
  UNIQUE KEY `iduser_UNIQUE` (`iduser`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

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
  `idcalendar` int(11) NOT NULL AUTO_INCREMENT,
  `iduser` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`idcalendar`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `classes`
--

CREATE TABLE IF NOT EXISTS `classes` (
  `idclass` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(12) NOT NULL,
  PRIMARY KEY (`idclass`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `events`
--

CREATE TABLE IF NOT EXISTS `events` (
  `idevent` int(11) NOT NULL AUTO_INCREMENT,
  `iduser` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text,
  `startdate` datetime NOT NULL,
  `enddate` datetime NOT NULL,
  PRIMARY KEY (`idevent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `lessons`
--

CREATE TABLE IF NOT EXISTS `lessons` (
  `idlesson` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `room` int(11) NOT NULL,
  `starttime` time NOT NULL,
  `endtime` time NOT NULL,
  `day` tinyint(1) NOT NULL,
  `cycle` tinyint(1) DEFAULT NULL COMMENT '0/null for every week, 1 for even, 2 for odd',
  PRIMARY KEY (`idlesson`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `permission`
--

CREATE TABLE IF NOT EXISTS `permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionName` varchar(25) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

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
  `idrel` int(11) NOT NULL AUTO_INCREMENT,
  `idcalendar` int(11) NOT NULL,
  `idevent` int(11) NOT NULL,
  PRIMARY KEY (`idrel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `rel_calendar_user`
--

CREATE TABLE IF NOT EXISTS `rel_calendar_user` (
  `idrel` int(11) NOT NULL AUTO_INCREMENT,
  `idcalendar` int(11) NOT NULL,
  `iduser` int(11) NOT NULL,
  PRIMARY KEY (`idrel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `rel_class_lesson`
--

CREATE TABLE IF NOT EXISTS `rel_class_lesson` (
  `idrel` int(11) NOT NULL AUTO_INCREMENT,
  `idclass` int(11) NOT NULL,
  `idroom` int(11) NOT NULL,
  PRIMARY KEY (`idrel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `rel_event_user`
--

CREATE TABLE IF NOT EXISTS `rel_event_user` (
  `idrel` int(11) NOT NULL AUTO_INCREMENT,
  `idevent` int(11) NOT NULL,
  `iduser` int(11) NOT NULL,
  PRIMARY KEY (`idrel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `rel_lesson_user`
--

CREATE TABLE IF NOT EXISTS `rel_lesson_user` (
  `idrel` int(11) NOT NULL AUTO_INCREMENT,
  `idlesson` int(11) NOT NULL,
  `iduser` int(11) NOT NULL,
  PRIMARY KEY (`idrel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `teachers`
--

CREATE TABLE IF NOT EXISTS `teachers` (
  `idteacher` int(11) NOT NULL AUTO_INCREMENT,
  `iduser` int(11) NOT NULL,
  PRIMARY KEY (`idteacher`),
  UNIQUE KEY `iduser` (`iduser`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

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
  `iduser` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `mail` varchar(64) NOT NULL,
  `password` varchar(64) NOT NULL,
  `permission` int(11) NOT NULL,
  PRIMARY KEY (`iduser`),
  UNIQUE KEY `mail` (`mail`),
  KEY `permission` (`permission`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `users`
--

INSERT INTO `users` (`iduser`, `firstname`, `lastname`, `mail`, `password`, `permission`) VALUES
(1, 'Robert', 'Paulson', 'robert.paulson@he-arc.ch', '12e9293ec6b30c7fa8a0926af42807e929c1684f', 1),
(2, 'Simon', 'Guillaume-gentil', 'simon.guillaume@he-arc.ch', '088e16a1019277b15d58faf0541e11910eb756f6', 2);

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
