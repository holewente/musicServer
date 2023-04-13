-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 05, 2023 at 01:16 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `musiclist`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(255) NOT NULL,
  `genre` varchar(20) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `genre`, `description`) VALUES
(1, 'Pop', 'Pop music is a genre of popular music that originated in its modern form during the mid-1950s in the United States and the United Kingdom.'),
(2, 'Chill-out', 'Chill-out (shortened as chill; also typeset as chillout or chill out) is a loosely defined form of popular music characterized by slow tempos and relaxed moods.'),
(3, 'Hip-hop', 'Hip hop music or hip-hop music, also known as rap music and formerly known as disco rap,[5][6] is a genre of popular music that originated in New York City in the 1970s.'),
(4, 'Rock', 'A rock egy könnyűzenei stílus, mely a második világháborút követő politikai feszültségek korában tört utat magának, egész kulturális forradalmat indítva.'),
(5, 'Electro', 'Electro (or electro-funk)[3][4] is a genre of electronic music and early hip hop directly influenced by the use of the Roland TR-808 drum machines,[5][6] and funk.'),
(6, 'Other', 'Choose this if the music is not any of the genres above');

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

CREATE TABLE `favorites` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `link_url` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- Dumping data for table `favorites`
--

INSERT INTO `favorites` (`id`, `user_id`, `link_url`) VALUES
(1, 1, 'https://www.youtube-nocookie.com/watch?v=U3ASj1L6_sY'),
(8, 1, 'https://soundcloud.com/lilyeat/not-sorry-prod-trgc-x-sharkboy'),
(9, 3, 'https://www.youtube.com/watch?v=vcAp4nmTZCA'),
(10, 3, 'https://soundcloud.com/trippie-hippie-2/ghostbusters');

-- --------------------------------------------------------

--
-- Table structure for table `library`
--

CREATE TABLE `library` (
  `id` int(255) NOT NULL,
  `categ_id` int(255) NOT NULL,
  `user_id` int(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `id_cloud` int(255) DEFAULT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- Dumping data for table `library`
--

INSERT INTO `library` (`id`, `categ_id`, `user_id`, `url`, `id_cloud`, `title`) VALUES
(2, 2, 0, 'https://www.youtube-nocookie.com/watch?v=U3ASj1L6_sY', NULL, 'Easy on Me'),
(7, 3, 0, 'https://www.youtube.com/watch?v=vcAp4nmTZCA', NULL, 'bladee - be nice to me'),
(18, 3, 0, 'https://soundcloud.com/trippie-hippie-2/ghostbusters', NULL, 'GhostBusters'),
(20, 3, 0, 'https://soundcloud.com/liluzivert/lil-uzi-vert-just-wanna-rock', NULL, 'Just Wanna Rock'),
(22, 6, 0, 'https://www.youtube.com/watch?v=eH_TOrddnZ0', NULL, 'Tell Em');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(255) NOT NULL,
  `username` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(20) NOT NULL DEFAULT 'user',
  `avatar` varchar(255) DEFAULT 'hacker.png',
  `avatar_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `role`, `avatar`, `avatar_id`) VALUES
(1, 'yeatlover911', 'yeatlover911@gmail.com', '$2a$10$VRjuu9WRKteZyUQr4qhncus0dabLgNP8H7Qf7thS58ipApujpAYEC', 'admin', 'http://res.cloudinary.com/dftcwkyba/image/upload/v1675410389/bycl33ikyfae5qubojii.jpg', 'bycl33ikyfae5qubojii'),
(3, 'register123', 'register123@gmail.com', '$2a$10$v4wTTXuIc6dmjt.sc.NWButOwasFykCroUN/GWRhFzd5Mkjrj6IkW', 'admin', 'hacker.png', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `library`
--
ALTER TABLE `library`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categ_id` (`categ_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `favorites`
--
ALTER TABLE `favorites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `library`
--
ALTER TABLE `library`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `favorites`
--
ALTER TABLE `favorites`
  ADD CONSTRAINT `favorites_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `library`
--
ALTER TABLE `library`
  ADD CONSTRAINT `library_ibfk_1` FOREIGN KEY (`categ_id`) REFERENCES `category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
