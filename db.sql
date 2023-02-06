-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server Version:               8.0.31 - MySQL Community Server - GPL
-- Server Betriebssystem:        Linux
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Exportiere Datenbank Struktur für db
CREATE DATABASE IF NOT EXISTS `db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db`;

-- Exportiere Struktur von Tabelle db.answers
CREATE TABLE IF NOT EXISTS `answers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `question_id` int NOT NULL,
  `is_correct` enum('1','0') COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0',
  `answer` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `foreign_key` (`question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Die Antworten nach Fragen Sortiert';

-- Exportiere Daten aus Tabelle db.answers: ~21 rows (ungefähr)
REPLACE INTO `answers` (`id`, `question_id`, `is_correct`, `answer`) VALUES
	(1, 1, '0', 'Europe'),
	(2, 1, '0', 'Asia'),
	(3, 1, '1', 'South America'),
	(4, 1, '0', 'Australia'),
	(5, 1, '0', 'North America');

-- Exportiere Struktur von Tabelle db.questions
CREATE TABLE IF NOT EXISTS `questions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `topic` enum('music','ch-norris','animals','movies','d-n-d','astronautics','technology','ai','geography','sports','science','informatics','gen-knowledge') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `question_text` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer-1` varchar(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer-2` varchar(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer-3` varchar(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer-4` varchar(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer-5` varchar(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `correct` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Exportiere Daten aus Tabelle db.questions: ~30 rows (ungefähr)
REPLACE INTO `questions` (`id`, `topic`, `question_text`, `answer-1`, `answer-2`, `answer-3`, `answer-4`, `answer-5`, `correct`) VALUES
	(1, 'geography', 'On which continent lies São Paulo?', 'Europe', 'Asia', 'South America', 'Australia', 'North America', '3'),
	(2, 'music', 'Who is the lead singer of the band "Queen"?', 'Freddie Mercury', 'David Bowie', 'Elton John', 'Bruce Springsteen', 'John Lennon', '1'),
	(3, 'music', 'What is the most famous song of the band "Beatles"?', 'Hey Jude', 'Imagine', 'Let it Be', 'Yesterday', 'Help!', '3'),
	(4, 'music', 'Who is the author of the famous opera "The Barber of Seville"?', 'Giacomo Puccini', 'Wolfgang Amadeus Mozart', 'Gioachino Rossini', 'Ludwig van Beethoven', 'Giuseppe Verdi', '3'),
	(5, 'music', 'What is the name of the famous melody composed by Tchaikovsky in 1875-76?', 'Swan Lake', 'The Nutcracker', 'The Sleeping Beauty', 'Romeo and Juliet', 'Cinderella', '2'),
	(6, 'music', 'What is the name of the famous jazz standard composed by George Gershwin in 1924?', 'Rhapsody in Blue', 'Concerto in F', 'An American in Paris', 'Prelude No. 2', 'Piano Concerto No. 2', '1'),
	(7, 'geography', 'What is the largest country in the world by area?', 'Russia', 'Canada', 'China', 'United States', 'Antarctica', '1'),
	(8, 'geography', 'What is the capital city of Italy?', 'Paris', 'Madrid', 'Berlin', 'Rome', 'London', '4'),
	(9, 'geography', 'What is the currency used in Spain?', 'Euro', 'Dollar', 'Pound', 'Yen', 'Franc', '1'),
	(10, 'geography', 'Which African country is known as the "Horn of Africa"?', 'South Africa', 'Nigeria', 'Egypt', 'Ethiopia', 'Morocco', '4'),
	(11, 'geography', 'What is the smallest country in the world by area?', 'Monaco', 'San Marino', 'Vatican City', 'Nauru', 'Tuvalu', '3'),
	(12, 'music', 'What is the name of the famous hip-hop album released by Tupac in 1996?', 'All Eyez on Me', 'The Chronic', 'The Slim Shady LP', 'Ready to Die', 'Life After Death', '1'),
	(13, 'music', 'Who is the author of the famous rock song "Stairway to Heaven"?', 'Led Zeppelin', 'Black Sabbath', 'The Who', 'Deep Purple', 'Pink Floyd', '1'),
	(14, 'music', 'What is the name of the famous song performed by Michael Jackson in 1982?', 'Thriller', 'Beat It', 'Billie Jean', 'Bad', 'Man in the Mirror', '1'),
	(15, 'music', 'What is the name of the famous song performed by Elvis Presley in 1957?', 'Suspicious Minds', 'Blue Suede Shoes', 'Heartbreak Hotel', 'Hound Dog', 'Love Me Tender', '5'),
	(16, 'music', 'What is the name of the famous song performed by Adele in 2011?', 'Someone Like You', 'Hello', 'Set Fire to the Rain', 'Rolling in the Deep', 'Skyfall', '3'),
	(17, 'ch-norris', 'Which movie starred Chuck Norris as the lead role?', 'Missing in Action', 'Invasion U.S.A.', 'The Octagon', 'Delta Force', 'Code of Silence', '1'),
	(18, 'ch-norris', 'What is the real name of Chuck Norris?', 'Carlos Ray Norris', 'Charles Richard Norris', 'Charles Robert Norris', 'Charles Raymond Norris', 'Carl Richard Norris', '1'),
	(19, 'ch-norris', 'What is Chuck Norris famous for?', 'Martial Arts', 'Comedian', 'Actor', 'Philanthropist', 'Politician', '1'),
	(20, 'ch-norris', 'What kind of belt does Chuck Norris hold in martial arts?', '10th Degree Black Belt', '8th Degree Black Belt', '9th Degree Black Belt', '7th Degree Black Belt', '6th Degree Black Belt', '1'),
	(21, 'ch-norris', 'Which year was Chuck Norris born?', '1940', '1941', '1942', '1943', '1944', '1'),
	(22, 'animals', 'What is the scientific name for domestic cat?', 'Felis catus', 'Felis silvestris catus', 'Panthera tigris', 'Canis lupus', 'Equus caballus', '2'),
	(23, 'animals', 'Which animal is known as the king of the jungle?', 'Lion', 'Tiger', 'Jaguar', 'Leopard', 'Elephant', '1'),
	(24, 'animals', 'What is the largest living bird by height?', 'Ostrich', 'Emu', 'Kiwi', 'Pelican', 'Swan', '1'),
	(25, 'animals', 'What is the smallest mammal in the world?', 'Bumblebee Bat', 'Pygmy Shrew', 'Etruscan Shrew', 'Harvest Mouse', 'African Pygmy Mouse', '1'),
	(26, 'animals', 'What is the national bird of the United States?', 'Eagle', 'Hawk', 'Falcon', 'Owl', 'Pelican', '1'),
	(27, 'movies', 'What is the highest-grossing movie of all time (unadjusted for inflation)?', 'Avengers: Endgame', 'Avatar', 'Titanic', 'Star Wars: The Force Awakens', 'Avengers: Infinity War', '1'),
	(28, 'movies', 'Which movie won the Best Picture Oscar in 2020?', '1917', 'Parasite', 'Joker', 'The Irishman', 'Once Upon a Time in Hollywood', '2'),
	(29, 'movies', 'Who directed the movie "The Shawshank Redemption"?', 'Frank Darabont', 'Martin Scorsese', 'Quentin Tarantino', 'Steven Spielberg', 'David Fincher', '1'),
	(30, 'movies', 'What is the real name of the actor who played Indiana Jones?', 'Harrison Ford', 'Tom Hanks', 'Matt Damon', 'Brad Pitt', 'George Clooney', '1');

-- Exportiere Struktur von Tabelle db.summary
CREATE TABLE IF NOT EXISTS `summary` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `question_id` int NOT NULL,
  `answer` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `correct` tinyint NOT NULL DEFAULT '0',
  `timest` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Quiz Log des Opportunity quizes';

-- Exportiere Daten aus Tabelle db.summary: ~21 rows (ungefähr)
REPLACE INTO `summary` (`id`, `user_id`, `question_id`, `answer`, `correct`, `timest`) VALUES
	(1, 1, 1, '3', 3, '1675163623'),
	(2, 1, 7, '1', 1, '1675163627'),
	(3, 1, 8, '4', 4, '1675163632'),
	(4, 1, 9, '1', 1, '1675163638'),
	(5, 1, 10, '1', 4, '1675163645'),
	(6, 1, 11, '3', 3, '1675163655'),
	(7, 1, 2, '1', 1, '1675163997'),
	(8, 1, 3, '1', 3, '1675164000'),
	(9, 1, 4, '1', 3, '1675164004'),
	(10, 1, 5, '1', 2, '1675164007'),
	(11, 1, 6, '1', 1, '1675164011'),
	(12, 1, 12, '1', 1, '1675164014'),
	(13, 1, 13, '1', 1, '1675164018'),
	(14, 1, 14, '1', 1, '1675164022'),
	(15, 1, 15, '1', 5, '1675164025'),
	(16, 1, 16, '1', 3, '1675164028'),
	(17, 1, 17, '4', 1, '1675164238'),
	(18, 1, 18, '1', 1, '1675164244'),
	(19, 1, 19, '3', 1, '1675164249'),
	(20, 1, 20, '1', 1, '1675164255'),
	(21, 1, 21, '1', 1, '1675164259');

-- Exportiere Struktur von Tabelle db.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(18) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0',
  `password_sha256` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'standard@email.com',
  `created_at` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `last_login` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ip` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `score` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Benutzer Tabelle oop Project 1 PHP Quiz';

-- Exportiere Daten aus Tabelle db.users: ~1 rows (ungefähr)
REPLACE INTO `users` (`id`, `username`, `password_sha256`, `email`, `created_at`, `last_login`, `ip`, `score`) VALUES
	(1, 'Trojan', 'dd67797d20b32f6df658be198b2fcd9d4e78fc6dc6861f798a10cc9b657c5417', 'sven.bledt@gmail.com', '1674738529', '1675164325', '172.19.0.1', 0);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
