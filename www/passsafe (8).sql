-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 25 sep. 2023 à 16:21
-- Version du serveur : 8.0.21
-- Version de PHP : 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `passsafe`
--

-- --------------------------------------------------------

--
-- Structure de la table `credentials`
--

DROP TABLE IF EXISTS `credentials`;
CREATE TABLE IF NOT EXISTS `credentials` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `EncryptedPassword` text NOT NULL,
  `IdUser` int DEFAULT NULL,
  `Complexity` int DEFAULT NULL,
  `Username` varchar(255) NOT NULL,
  `EmailAddress` varchar(255) DEFAULT NULL,
  `Url` text,
  `Name` varchar(255) DEFAULT NULL,
  `Category` varchar(255) DEFAULT NULL,
  `DateCreated` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `IdUser` (`IdUser`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `credentials`
--

INSERT INTO `credentials` (`Id`, `EncryptedPassword`, `IdUser`, `Complexity`, `Username`, `EmailAddress`, `Url`, `Name`, `Category`, `DateCreated`) VALUES
(8, 'encryptedpassword_for_cred2', 5, NULL, 'user1_username2', 'email1_2@example.com', 'http://example2.com', 'name2', 'Game', '2023-09-25 11:49:17'),
(9, 'sfgfsdg', 6, 4, 'fdsgfd', 'gfdgfd', 'gfdgd', 'gdgd', 'dfgdg', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Username` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `EncryptedPassword` text NOT NULL,
  `CreatedPasswd` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`Id`, `Username`, `Email`, `EncryptedPassword`, `CreatedPasswd`) VALUES
(5, 'totoo', 'tooto', '68dbf73d03d3a5107edad3b05676eee240e68c280296e52b6986873c54cef3cb', '2023-09-25 13:21:45'),
(6, 'user3', 'user3@example.com', 'encryptedpassword1', '2023-09-25 11:33:31'),
(7, 'toto', 'toto', 'toto', '2023-09-25 13:00:31');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `credentials`
--
ALTER TABLE `credentials`
  ADD CONSTRAINT `credentials_ibfk_1` FOREIGN KEY (`IdUser`) REFERENCES `user` (`Id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
