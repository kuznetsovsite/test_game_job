-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.22 - MySQL Community Server (GPL)
-- Server OS:                    Linux
-- HeidiSQL Version:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table library.lib_authors
CREATE TABLE IF NOT EXISTS `lib_authors` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- Dumping data for table library.lib_authors: ~0 rows (approximately)
DELETE FROM `lib_authors`;
/*!40000 ALTER TABLE `lib_authors` DISABLE KEYS */;
INSERT INTO `lib_authors` (`id`, `title`) VALUES
	(1, 'Автор1'),
	(2, 'Автор2'),
	(3, 'Автор3'),
	(4, 'Автор4'),
	(5, 'Автор5'),
	(6, 'Автор6'),
	(7, 'Автор7');
/*!40000 ALTER TABLE `lib_authors` ENABLE KEYS */;

-- Dumping structure for table library.lib_books
CREATE TABLE IF NOT EXISTS `lib_books` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table library.lib_books: ~0 rows (approximately)
DELETE FROM `lib_books`;
/*!40000 ALTER TABLE `lib_books` DISABLE KEYS */;
INSERT INTO `lib_books` (`id`, `title`) VALUES
	(1, 'Book1'),
	(2, 'Book2'),
	(3, 'Book3'),
	(4, 'Book4'),
	(5, 'Book5'),
	(6, 'Book6'),
	(7, 'Book7');
/*!40000 ALTER TABLE `lib_books` ENABLE KEYS */;

-- Dumping structure for table library.lib_book_author
CREATE TABLE IF NOT EXISTS `lib_book_author` (
  `book_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  PRIMARY KEY (`book_id`,`author_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table library.lib_book_author: ~0 rows (approximately)
DELETE FROM `lib_book_author`;
/*!40000 ALTER TABLE `lib_book_author` DISABLE KEYS */;
INSERT INTO `lib_book_author` (`book_id`, `author_id`) VALUES
	(1, 1),
	(1, 2),
	(1, 7),
	(2, 1),
	(3, 3),
	(3, 7),
	(4, 7),
	(5, 7),
	(6, 7),
	(7, 7);
/*!40000 ALTER TABLE `lib_book_author` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;



-- Result

SELECT b.id, b.title, COUNT(ba.author_id) AS count_authors FROM  lib_books b 
INNER JOIN lib_book_author ba ON b.id=ba.book_id
GROUP BY ba.book_id;

SELECT b.id, b.title AS count_authors FROM  lib_books b 
INNER JOIN lib_book_author ba ON b.id=ba.book_id
GROUP BY ba.book_id
HAVING COUNT(ba.author_id)=3;
