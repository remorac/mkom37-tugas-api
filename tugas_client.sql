-- Adminer 4.8.1 MySQL 5.5.5-10.7.3-MariaDB dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `migration`;
CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base',	1657955574),
('m130524_201442_init',	1657955576),
('m190124_110200_add_verification_token_column_to_user_table',	1657955576);

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
(5,	'29084578976904',	1657960197),
(6,	'202321058',	1657960345),
(7,	'202321057',	1657960700);

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8mb3_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT 10,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `verification_token` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `password_reset_token` (`password_reset_token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

INSERT INTO `user` (`id`, `username`, `auth_key`, `password_hash`, `password_reset_token`, `email`, `status`, `created_at`, `updated_at`, `verification_token`) VALUES
(1,	'user',	'IWUTq6818hSVeaHKzcc2kRJdyUpV6xfD',	'$2y$13$j34OAqiV3qm2DNGjIrUquuDGw2TNbehZ/YnlJRhopDHPgmmTDQZ9e',	NULL,	'user@example.com',	10,	1657955583,	1657955583,	'Ne9VqQI1HyjITFjjIuZWFDWTjmIFR9uY_1657955583');

-- 2022-07-16 08:43:38
