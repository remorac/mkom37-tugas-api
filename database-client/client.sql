-- Adminer 4.8.1 MySQL 5.5.5-10.7.3-MariaDB dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `payment`;
CREATE TABLE `payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identity_number` varchar(255) NOT NULL,
  `paid_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `identity_number` (`identity_number`),
  KEY `paid_at` (`paid_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `payment` (`id`, `identity_number`, `paid_at`) VALUES
(6,	'202321058',	1657960345),
(7,	'202321057',	1657960700);

-- 2022-07-17 04:01:43
