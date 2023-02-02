-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2023. Feb 02. 12:30
-- Kiszolgáló verziója: 10.4.21-MariaDB
-- PHP verzió: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `musiclist`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `category`
--

CREATE TABLE `category` (
  `id` int(255) NOT NULL,
  `genre` varchar(20) COLLATE utf8_hungarian_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `category`
--

INSERT INTO `category` (`id`, `genre`, `description`) VALUES
(1, 'pop', 'Pop music is a genre of popular music that originated in its modern form during the mid-1950s in the United States and the United Kingdom.'),
(2, 'Chill-out', 'Chill-out (shortened as chill; also typeset as chillout or chill out) is a loosely defined form of popular music characterized by slow tempos and relaxed moods.'),
(3, 'rap', 'Hip hop music or hip-hop music, also known as rap music and formerly known as disco rap,[5][6] is a genre of popular music that originated in New York City in the 1970s.');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `library`
--

CREATE TABLE `library` (
  `id` int(255) NOT NULL,
  `categ_id` int(255) NOT NULL,
  `url` varchar(255) COLLATE utf8_hungarian_ci NOT NULL,
  `id_cloud` int(255) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `library`
--

INSERT INTO `library` (`id`, `categ_id`, `url`, `id_cloud`, `title`) VALUES
(2, 2, 'https://www.youtube-nocookie.com/watch?v=U3ASj1L6_sY', NULL, ''),
(3, 1, 'https://open.spotify.com/track/2KJkKZ6u3QRm9Xpu5I2CPB', NULL, ''),
(4, 3, 'https://soundcloud.com/lilyeat/not-sorry-prod-trgc-x-sharkboy', NULL, '');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `users`
--

CREATE TABLE `users` (
  `id` int(255) NOT NULL,
  `username` varchar(20) COLLATE utf8_hungarian_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_hungarian_ci NOT NULL,
  `password` varchar(256) COLLATE utf8_hungarian_ci NOT NULL,
  `role` varchar(20) COLLATE utf8_hungarian_ci NOT NULL DEFAULT 'user',
  `avatar` varchar(255) COLLATE utf8_hungarian_ci DEFAULT 'user.png',
  `avatar_id` varchar(255) COLLATE utf8_hungarian_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `role`, `avatar`, `avatar_id`) VALUES
(1, 'register123', 'register123@gmail.com', '$2a$10$BfrfCuwMyX4w66VQYzYW0OmZ68ZQEPjdc2eejn/vd/MCKcVLRbb1q', 'admin', 'hacker.png', NULL);

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `library`
--
ALTER TABLE `library`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categ_id` (`categ_id`);

--
-- A tábla indexei `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `category`
--
ALTER TABLE `category`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT a táblához `library`
--
ALTER TABLE `library`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT a táblához `users`
--
ALTER TABLE `users`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `library`
--
ALTER TABLE `library`
  ADD CONSTRAINT `library_ibfk_1` FOREIGN KEY (`categ_id`) REFERENCES `category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
