-- --------------------------------------------------------
-- Hôte:                         127.0.0.1
-- Version du serveur:           8.0.30 - MySQL Community Server - GPL
-- SE du serveur:                Win64
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


-- Listage de la structure de la base pour cinema_alexandre
CREATE DATABASE IF NOT EXISTS `cinema_alexandre` /*!40100 DEFAULT CHARACTER SET latin1 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `cinema_alexandre`;

-- Listage de la structure de table cinema_alexandre. acteur
CREATE TABLE IF NOT EXISTS `acteur` (
  `id_acteur` int NOT NULL AUTO_INCREMENT,
  `id_personne` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_acteur`),
  KEY `FK_acteur_personne` (`id_personne`),
  CONSTRAINT `FK_acteur_personne` FOREIGN KEY (`id_personne`) REFERENCES `personne` (`id_personne`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

-- Listage des données de la table cinema_alexandre.acteur : ~29 rows (environ)
REPLACE INTO `acteur` (`id_acteur`, `id_personne`) VALUES
	(1, 2),
	(2, 4),
	(3, 5),
	(4, 7),
	(5, 8),
	(6, 9),
	(7, 10),
	(8, 13),
	(9, 15),
	(10, 16),
	(11, 17),
	(12, 18),
	(13, 19),
	(14, 20),
	(15, 21),
	(16, 22),
	(17, 23),
	(18, 24),
	(19, 25),
	(20, 26),
	(21, 27),
	(22, 28),
	(23, 29),
	(24, 30),
	(25, 31),
	(26, 32),
	(27, 33),
	(28, 34),
	(29, 35);

-- Listage de la structure de table cinema_alexandre. acteur_role
CREATE TABLE IF NOT EXISTS `acteur_role` (
  `id_acteur_role` int NOT NULL AUTO_INCREMENT,
  `nom_acteur_role` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_acteur_role`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

-- Listage des données de la table cinema_alexandre.acteur_role : ~30 rows (environ)
REPLACE INTO `acteur_role` (`id_acteur_role`, `nom_acteur_role`) VALUES
	(1, 'Rocky Balboa'),
	(2, 'Adrian Pennino'),
	(3, 'Walt Kowalski'),
	(4, 'Thao Vang Lor'),
	(5, 'Will Hunting'),
	(6, 'Sean Maguire'),
	(7, 'William Wallace'),
	(8, 'Princess Isabella'),
	(9, 'Jackson Maine'),
	(10, 'Ally Maine'),
	(11, 'William Munny'),
	(12, 'Ned Logan'),
	(13, 'Clarice Starling'),
	(14, 'Dr. Hannibal Lecter'),
	(15, 'John Dunbar'),
	(16, 'Stands With A Fist'),
	(17, 'Guido Orefice'),
	(18, 'Dora'),
	(19, 'Tony Mendez'),
	(20, 'Jack O\'Donnell'),
	(21, 'Lee Abbott'),
	(22, 'Evelyn Abbott'),
	(23, 'George Valentin'),
	(24, 'Peppy Miller'),
	(25, 'Chris Washington'),
	(26, 'Rose Armitage'),
	(27, 'Alvy Singer'),
	(28, 'Annie Hall'),
	(29, 'Lee Chandler'),
	(30, 'Randi');

-- Listage de la structure de table cinema_alexandre. casting
CREATE TABLE IF NOT EXISTS `casting` (
  `id_film` int DEFAULT NULL,
  `id_acteur` int DEFAULT NULL,
  `id_role` int DEFAULT NULL,
  KEY `FK_casting_acteur` (`id_acteur`),
  KEY `FK_casting_acteur_role` (`id_role`),
  KEY `FK_casting_film` (`id_film`),
  CONSTRAINT `FK_casting_acteur` FOREIGN KEY (`id_acteur`) REFERENCES `acteur` (`id_acteur`),
  CONSTRAINT `FK_casting_acteur_role` FOREIGN KEY (`id_role`) REFERENCES `acteur_role` (`id_acteur_role`),
  CONSTRAINT `FK_casting_film` FOREIGN KEY (`id_film`) REFERENCES `film` (`id_film`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Listage des données de la table cinema_alexandre.casting : ~28 rows (environ)
REPLACE INTO `casting` (`id_film`, `id_acteur`, `id_role`) VALUES
	(1, 9, 1),
	(1, 10, 2),
	(2, 1, 3),
	(2, 11, 4),
	(4, 2, 7),
	(5, 3, 9),
	(6, 1, 11),
	(6, 16, 12),
	(7, 17, 13),
	(7, 18, 14),
	(8, 4, 15),
	(8, 19, 16),
	(9, 5, 17),
	(9, 20, 18),
	(11, 7, 21),
	(11, 22, 22),
	(10, 6, 19),
	(10, 21, 20),
	(12, 23, 23),
	(12, 24, 24),
	(13, 25, 25),
	(13, 29, 26),
	(13, 26, 26),
	(13, 13, 26),
	(14, 8, 27),
	(14, 27, 28),
	(15, 28, 29),
	(15, 6, 29);

-- Listage de la structure de table cinema_alexandre. film
CREATE TABLE IF NOT EXISTS `film` (
  `id_film` int NOT NULL AUTO_INCREMENT,
  `titre_film` varchar(50) NOT NULL DEFAULT '0',
  `date_sortie_film` date NOT NULL,
  `duree_film` int NOT NULL DEFAULT '0',
  `synopsis_film` text NOT NULL,
  `note_film` decimal(5,2) NOT NULL DEFAULT '0.00',
  `id_realisateur` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_film`),
  KEY `FK_film_realisateur` (`id_realisateur`),
  CONSTRAINT `FK_film_realisateur` FOREIGN KEY (`id_realisateur`) REFERENCES `realisateur` (`id_realisateur`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=latin1;

-- Listage des données de la table cinema_alexandre.film : ~15 rows (environ)
REPLACE INTO `film` (`id_film`, `titre_film`, `date_sortie_film`, `duree_film`, `synopsis_film`, `note_film`, `id_realisateur`) VALUES
	(1, 'Rocky', '1976-12-03', 119, 'Un boxeur amateur devient l\'espoir du peuple américain', 4.70, 1),
	(2, 'Gran Torino', '2008-12-09', 116, 'Un vétéran de la guerre de Corée solitaire se lie d\'amitié avec ses voisins hmongs', 4.60, 2),
	(3, 'Will Hunting', '1997-12-05', 126, 'Un jeune génie des mathématiques découvre sa voie grâce à un psychologue', 4.80, 3),
	(4, 'Braveheart', '1995-05-24', 178, 'L\'histoire de William Wallace, héros et patriote écossais du XIIIème siècle', 4.80, 4),
	(5, 'A Star Is Born', '2018-10-05', 136, 'Une star de la musique country aide une jeune chanteuse talentueuse à percer', 4.70, 5),
	(6, 'Impitoyable', '1992-08-07', 130, 'Un ancien tueur reprend du service pour une dernière mission', 4.80, 2),
	(7, 'Le Silence des Agneaux', '1991-02-14', 118, 'Une jeune agent du FBI doit collaborer avec un tueur en série pour en arrêter un autre', 4.90, 6),
	(8, 'Danse avec les loups', '1990-11-09', 181, 'Un lieutenant de l\'armée américaine se lie d\'amitié avec une tribu sioux', 4.70, 7),
	(9, 'La vie est belle', '1997-12-20', 116, 'Un père utilise son imagination pour protéger son fils des horreurs d\'un camp de concentration', 4.90, 8),
	(10, 'Argo', '2012-10-12', 120, 'L\'exfiltration d\'otages américains d\'Iran sous couvert d\'un faux tournage de film', 4.70, 9),
	(11, 'Sans un bruit', '2018-04-06', 90, 'Une famille doit vivre en silence pour échapper à des créatures qui chassent par le son', 4.60, 10),
	(12, 'The Artist', '2011-10-12', 100, 'Un acteur du cinéma muet voit sa carrière décliner avec l\'arrivée du parlant', 4.80, 11),
	(13, 'Get Out', '2017-02-24', 104, 'Un jeune homme noir découvre un terrible secret en rencontrant la famille de sa petite amie blanche', 4.70, 12),
	(14, 'Annie Hall', '1977-04-20', 93, 'Un comédien new-yorkais analyse sa relation amoureuse ratée avec Annie Hall', 4.80, 13),
	(15, 'Manchester by the Sea', '2016-11-18', 137, 'Un homme hanté par son passé doit s\'occuper de son neveu après la mort de son frère', 4.70, 14);

-- Listage de la structure de table cinema_alexandre. film_genre
CREATE TABLE IF NOT EXISTS `film_genre` (
  `id_film` int DEFAULT NULL,
  `id_genre` int DEFAULT NULL,
  KEY `FK_film_genre_film` (`id_film`),
  KEY `FK_film_genre_genre` (`id_genre`),
  CONSTRAINT `FK_film_genre_film` FOREIGN KEY (`id_film`) REFERENCES `film` (`id_film`),
  CONSTRAINT `FK_film_genre_genre` FOREIGN KEY (`id_genre`) REFERENCES `genre` (`id_genre`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Listage des données de la table cinema_alexandre.film_genre : ~35 rows (environ)
REPLACE INTO `film_genre` (`id_film`, `id_genre`) VALUES
	(1, 1),
	(14, 2),
	(12, 2),
	(9, 2),
	(5, 2),
	(3, 2),
	(10, 3),
	(4, 3),
	(4, 4),
	(5, 5),
	(8, 6),
	(6, 6),
	(8, 7),
	(14, 8),
	(12, 8),
	(9, 8),
	(9, 9),
	(13, 10),
	(11, 10),
	(13, 11),
	(15, 12),
	(12, 12),
	(11, 12),
	(10, 12),
	(9, 12),
	(8, 12),
	(7, 12),
	(6, 12),
	(5, 12),
	(4, 12),
	(3, 12),
	(2, 12),
	(1, 12),
	(7, 13),
	(2, 13);

-- Listage de la structure de table cinema_alexandre. genre
CREATE TABLE IF NOT EXISTS `genre` (
  `id_genre` int NOT NULL AUTO_INCREMENT,
  `nom_genre` varchar(50) NOT NULL,
  PRIMARY KEY (`id_genre`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- Listage des données de la table cinema_alexandre.genre : ~14 rows (environ)
REPLACE INTO `genre` (`id_genre`, `nom_genre`) VALUES
	(1, 'Sport'),
	(2, 'Romance'),
	(3, 'Biographique'),
	(4, 'Historique'),
	(5, 'Musique'),
	(6, 'Western'),
	(7, 'Aventure'),
	(8, 'Comédie'),
	(9, 'Guerre'),
	(10, 'Horreur'),
	(11, 'Mystère'),
	(12, 'Drame'),
	(13, 'Crime'),
	(14, 'Thriller');

-- Listage de la structure de table cinema_alexandre. personne
CREATE TABLE IF NOT EXISTS `personne` (
  `id_personne` int NOT NULL AUTO_INCREMENT,
  `prenom_personne` varchar(50) NOT NULL,
  `nom_personne` varchar(50) NOT NULL,
  `genre_personne` varchar(50) NOT NULL,
  `date_naissance_personne` date NOT NULL,
  PRIMARY KEY (`id_personne`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=latin1;

-- Listage des données de la table cinema_alexandre.personne : ~36 rows (environ)
REPLACE INTO `personne` (`id_personne`, `prenom_personne`, `nom_personne`, `genre_personne`, `date_naissance_personne`) VALUES
	(1, 'John G.', 'Avildsen', 'Homme', '1935-12-21'),
	(2, 'Clint', 'Eastwood', 'Homme', '1930-05-31'),
	(3, 'Gus', 'Van Sant', 'Homme', '1952-07-24'),
	(4, 'Mel', 'Gibson', 'Homme', '1956-01-03'),
	(5, 'Bradley', 'Cooper', 'Homme', '1975-01-05'),
	(6, 'Jonathan', 'Demme', 'Homme', '1944-02-22'),
	(7, 'Kevin', 'Costner', 'Homme', '1955-01-18'),
	(8, 'Roberto', 'Benigni', 'Homme', '1952-10-27'),
	(9, 'Ben', 'Affleck', 'Homme', '1972-08-15'),
	(10, 'John', 'Krasinski', 'Homme', '1979-10-20'),
	(11, 'Michel', 'Hazanavicius', 'Homme', '1967-03-29'),
	(12, 'Jordan', 'Peele', 'Homme', '1979-02-21'),
	(13, 'Woody', 'Allen', 'Homme', '1935-12-01'),
	(14, 'Kenneth', 'Lonergan', 'Homme', '1962-10-16'),
	(15, 'Sylvester', 'Stallone', 'Homme', '1946-07-06'),
	(16, 'Talia', 'Shire', 'Femme', '1946-04-25'),
	(17, 'Bee', 'Vang', 'Homme', '1991-11-04'),
	(18, 'Matt', 'Damon', 'Homme', '1970-10-08'),
	(19, 'Robin', 'Williams', 'Homme', '1951-07-21'),
	(20, 'Sophie', 'Marceau', 'Femme', '1966-11-17'),
	(21, 'Lady', 'Gaga', 'Femme', '1986-03-28'),
	(22, 'Morgan', 'Freeman', 'Homme', '1937-06-01'),
	(23, 'Jodie', 'Foster', 'Femme', '1962-11-19'),
	(24, 'Anthony', 'Hopkins', 'Homme', '1937-12-31'),
	(25, 'Mary', 'McDonnell', 'Femme', '1952-04-28'),
	(26, 'Nicoletta', 'Braschi', 'Femme', '1960-04-19'),
	(27, 'Bryan', 'Cranston', 'Homme', '1956-03-07'),
	(28, 'Emily', 'Blunt', 'Femme', '1983-02-23'),
	(29, 'Jean', 'Dujardin', 'Homme', '1972-06-19'),
	(30, 'Bérénice', 'Bejo', 'Femme', '1976-07-07'),
	(31, 'Daniel', 'Kaluuya', 'Homme', '1989-02-24'),
	(32, 'Allison', 'Williams', 'Femme', '1988-04-13'),
	(33, 'Diane', 'Keaton', 'Femme', '1946-01-05'),
	(34, 'Casey', 'Affleck', 'Homme', '1975-08-12'),
	(35, 'Michelle', 'Williams', 'Femme', '1980-09-09'),
	(36, 'Micka', 'Murmann', 'Homme', '2005-11-25');

-- Listage de la structure de table cinema_alexandre. realisateur
CREATE TABLE IF NOT EXISTS `realisateur` (
  `id_realisateur` int NOT NULL AUTO_INCREMENT,
  `id_personne` int DEFAULT NULL,
  PRIMARY KEY (`id_realisateur`),
  KEY `FK_realisateur_personne` (`id_personne`),
  CONSTRAINT `FK_realisateur_personne` FOREIGN KEY (`id_personne`) REFERENCES `personne` (`id_personne`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- Listage des données de la table cinema_alexandre.realisateur : ~16 rows (environ)
REPLACE INTO `realisateur` (`id_realisateur`, `id_personne`) VALUES
	(1, 1),
	(2, 2),
	(3, 3),
	(4, 4),
	(5, 5),
	(6, 6),
	(7, 7),
	(8, 8),
	(9, 9),
	(10, 10),
	(11, 11),
	(12, 12),
	(13, 13),
	(14, 14),
	(15, 34),
	(16, 36);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
