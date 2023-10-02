-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: mysql-souliere.alwaysdata.net
-- Generation Time: Oct 02, 2023 at 08:37 PM
-- Server version: 10.6.14-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `souliere_passsafe`
--

-- --------------------------------------------------------

--
-- Table structure for table `credentials`
--

CREATE TABLE `credentials` (
  `id` int(11) NOT NULL,
  `encryptedPassword` text NOT NULL,
  `idUser` int(11) DEFAULT NULL,
  `complexity` int(11) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `emailAddress` varchar(255) DEFAULT NULL,
  `url` text DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `dateCreated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `credentials`
--

INSERT INTO `credentials` (`id`, `encryptedPassword`, `idUser`, `complexity`, `username`, `emailAddress`, `url`, `name`, `category`, `dateCreated`) VALUES
(19, 'EPhRbHGrwA+UuzrTVORPlQ==', 5, 90, 'mateo', 'email1_2@example.com', 'https://t0.gstatic.com/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&url=https://www.youtube.co&size=256', 'netflix', 'Work', '2023-09-25 11:49:17'),
(21, 'yvBN1MD/i/GD38IifMPCag==', 5, 10, 'mateo', 'email1_2@example.com', 'https://t0.gstatic.com/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&url=httphjs://www.youtube.com&size=256', 'netflix', 'Game', '2023-09-25 11:49:17'),
(22, 'yvBN1MD/i/GD38IifMPCag==', 26, 10, 'mateo', 'email1_2@example.com', 'https://t0.gstatic.com/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&url=https://www.youtube.com&size=256', 'netflix', 'Game', '2023-09-25 11:49:17'),
(29, 'yvBN1MD/i/GD38IifMPCag==', 5, 10, 'mateo', 'email1_2@example.com', 'https://t0.gstatic.com/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&url=https://www.youtube.com&size=256', 'netflixs', 'Work', '2023-09-25 11:49:17'),
(30, 'yvBN1MD/i/GD38IifMPCag==', 5, 10, 'mateo', 'email1_2@example.com', 'https://t0.gstatic.com/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&url=https://www.youtube.com&size=256', 'netflix', 'Game', '2023-09-25 11:49:17'),
(41, 'yvBN1MD/i/GD38IifMPCag==', 5, 10, 'mateo', 'email1_2@example.com', 'https://t0.gstatic.com/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&url=https://www.youtube.com&size=256', 'netflix', 'Game', '2023-09-25 11:49:17'),
(52, 'yvBN1MD/i/GD38IifMPCag==', 26, 10, 'mateo', 'email1_2@example.com', 'https://t0.gstatic.com/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&url=https://www.youtube.com&size=256', 'netflix', 'Game', '2023-09-25 11:49:17');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `encryptedPassword` text NOT NULL,
  `createdPasswd` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `encryptedPassword`, `createdPasswd`) VALUES
(5, 'totoo', 'tooto', 'yvBN1MD/i/GD38IifMPCag==', '2023-09-25 13:21:45'),
(10, 'kk', 'kk', 'ad370ed99b189921e7fe26057c40aab9f4fee8385e47606f50f348b9a5530af0', '2023-09-26 10:23:03'),
(19, 'nj', 'yuiio', 'ad370ed99b189921e7fe26057c40aab9f4fee8385e47606f50f348b9a5530af0', '2023-09-26 12:46:54'),
(20, 'aaa', 'aze@az.com', '9de809c8c27d6b184e19d3878fb2133d04d67135ea0fcbb84c3f1d3b2c5cd1e3', '2023-09-26 12:47:52'),
(21, 'mm', 'mm', '8fa1dddd53606ceb933c5c6a12e714ed41e11d37a2b7bc48e91d15b54171d033', '2023-09-26 17:09:48'),
(22, 'pp', 'pp', 'd53315bea08cec50d2591fcaf3b32dc5d289cdc6c16b7e8bed8c8e3f7ceaa34e', '2023-09-27 09:14:17'),
(23, 'cava', 'lndvd', 'b68f9eb5b1b2dfd7cb9351e6fff382fd5138e2c627e10156bbc777a18891b7c1', '2023-09-27 09:51:21'),
(24, 'caca', 'caca', '26429a356b1d25b7d57c0f9a6d5fed8a290cb42374185887dcd2874548df0779', '2023-09-27 09:51:45'),
(25, 'caca', 'pipi', 'abdcb58157a7f3b40a914257be7d618d2fc09630559711b6c71a39d500b8ced2', '2023-09-27 10:28:07'),
(26, 'mat', 'mat', '0c1c541af9cc252a1c759f3ae0416921e745c1d359dd9f782ec3d3ff0c432dcf', '2023-09-27 10:28:38'),
(29, 'www', 'www', '7c2ecd07f155648431e0f94b89247d713c5786e1e73e953f2fe7eca39534cd6d', '2023-10-01 15:15:19'),
(30, 'popp', 'popp', 'ZI4cnbetJfBkLQAwM2O9gQ==', '2023-10-02 09:11:16'),
(31, 'aaa', 'aaa', 'xtUMHpRHHQ4DTuoMQnY/dQ==', '2023-10-02 09:16:17'),
(32, 'iii', 'iii', 'abE/yLDA+nrNvomF7T5NhA==', '2023-10-02 09:18:09'),
(33, 'venki', 'venki', 'U3alGgdCdG22MiWmjjAlQg==', '2023-10-02 09:47:33');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `credentials`
--
ALTER TABLE `credentials`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idUser` (`idUser`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `credentials`
--
ALTER TABLE `credentials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `credentials`
--
ALTER TABLE `credentials`
  ADD CONSTRAINT `credentials_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `user` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
