-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Mar 21 Avril 2015 à 11:21
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `classes`
--

INSERT INTO `classes` (`idclass`, `name`) VALUES
(3, 'INF2-A'),
(65, 'INF3-A'),
(2, 'INF3-B');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=20 ;

--
-- Contenu de la table `events`
--

INSERT INTO `events` (`idevent`, `iduser`, `name`, `description`, `startdate`, `enddate`) VALUES
(4, 5, 'Faire PPT JEE', 'Car faut bien faire un Powerpoint', '2015-04-21 09:30:00', '2015-04-21 10:00:00'),
(5, 5, 'Présentation JEE', 'Oh yeah !', '2015-04-21 14:45:00', '2015-04-21 15:00:00'),
(9, 5, 'Cuda Saucisson', 'Fuu', '2015-04-22 08:45:00', '2015-04-22 10:15:00'),
(10, 5, 'Présentation Bought''n Sold', 'Oh yeah', '2015-04-24 12:45:00', '2015-04-24 12:45:00'),
(11, 5, 'Workshop Web''', 'Encore ?', '2015-04-23 14:15:00', '2015-04-23 16:50:00'),
(12, 5, 'Skype P3', 'hmm', '2015-04-20 18:00:00', '2015-04-20 20:00:00'),
(14, 5, 'Rendre projet C#', 'Car il le faut bien.', '2015-04-27 15:15:00', '2015-04-27 15:15:00'),
(15, 5, 'Rendre TP IA 3', 'Avec Andy', '2015-04-29 15:15:00', '2015-04-29 15:15:00'),
(16, 5, 'Fin de semèstre !', 'Murge ? Murge !', '2015-05-01 18:00:00', '2015-05-01 23:00:00'),
(17, 5, 'Cuda ?', 'Qui sait ?', '2015-05-03 12:00:00', '2015-05-03 12:00:00'),
(18, 1, 'Réunion administration', 'lel', '2015-04-21 09:45:00', '2015-04-21 12:45:00'),
(19, 6, 'Corriger Projets C#', ':(', '2015-04-27 15:00:00', '2015-04-27 23:00:00');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Contenu de la table `lessons`
--

INSERT INTO `lessons` (`idlesson`, `name`, `room`, `starttime`, `endtime`, `day`, `cycle`) VALUES
(6, '.Net', 150, '13:45:00', '16:15:00', 0, 0),
(7, 'C++ QT', 138, '09:45:00', '13:00:00', 0, 0);

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
  `idlesson` int(11) NOT NULL,
  PRIMARY KEY (`idrel`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Contenu de la table `rel_class_lesson`
--

INSERT INTO `rel_class_lesson` (`idrel`, `idclass`, `idlesson`) VALUES
(7, 65, 6),
(8, 2, 6),
(9, 3, 7);

-- --------------------------------------------------------

--
-- Structure de la table `rel_class_user`
--

CREATE TABLE IF NOT EXISTS `rel_class_user` (
  `idrel` int(11) NOT NULL AUTO_INCREMENT,
  `iduser` int(11) NOT NULL,
  `idclass` int(11) NOT NULL,
  PRIMARY KEY (`idrel`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `rel_class_user`
--

INSERT INTO `rel_class_user` (`idrel`, `iduser`, `idclass`) VALUES
(2, 2, 65),
(33, 1, 2);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Contenu de la table `users`
--

INSERT INTO `users` (`iduser`, `firstname`, `lastname`, `mail`, `password`, `permission`) VALUES
(1, 'admin', 'admin', 'admin.calendarc@he-arc.ch', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 1),
(2, 'Simon', 'Guillaume-gentil', 'simon.guillaume@he-arc.ch', '0a5d17d3b19f82f8340d3977609aa9e86b4ad8b9bd71bd9eced9271f1d5b2e4a', 2),
(3, 'Cyriaque', 'Skrapits', 'cysoun@gmail.com', 'df5bd2e887057a24380b2c60f2822556f534e8ea4cf5f8b74c37966e3c8232b6', 2),
(5, 'Eddy', 'Strambini', 'eddy.strambini@he-arc.ch', '10344fbb33cf720fe810d0735a7761a89c044b1e828504ae15d8750122edc2c5', 2),
(6, 'Olivier', 'Husser', 'olivier.husser@he-arc.ch', '152fc4dddcedc0be83ea10cd2667d9e4218b00439c65cb352f4a048e409203b2', 3);

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
