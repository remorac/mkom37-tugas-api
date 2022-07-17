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
('m000000_000000_base',	1657956194),
('m130524_201442_init',	1657956195),
('m190124_110200_add_verification_token_column_to_user_table',	1657956195);

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
  `identity_number` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `payment_status` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `password_reset_token` (`password_reset_token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

INSERT INTO `user` (`id`, `username`, `auth_key`, `password_hash`, `password_reset_token`, `email`, `status`, `created_at`, `updated_at`, `verification_token`, `identity_number`, `payment_status`) VALUES
(1,	'test',	'd8MdrM9rMkkMm1hIEGV1uE5TUkryiQfJ',	'$2y$13$JuFYFcS2fVSzPq.xsVMeQO7keFemgpJ7F7IazzE.3rQ6f27ZrKEsu',	NULL,	'test@test.test',	10,	1657957148,	1657960197,	'f-qIwaQxrYg8UFHq_GAwlwgqdF2A_xL8_1657957148',	'29084578976904',	1),
(2,	'khairul.fajri.ilahi',	'8mK4tLhe8WyiBOm5EG4hLPtDm59ea0Jh',	'$2y$13$8B307r9ZAbGy/EMteeM4ieU9XOPY6efuYJZiEnDL8GlcanaZqM/KC',	NULL,	'khairul@gmail.com',	10,	1657960318,	1657960345,	'_1GChD1zA0IO9NrmXk8JFQYYRPfZ7knQ_1657960318',	'202321058',	1),
(3,	'habiburrahman',	'Iz3wpw7of4iwrYqvEqhC4jbcmhPGGO9l',	'$2y$13$5TKx/YGu.itjHQT6CjBI2ezrmuxdBSSA18F9jCq3xRFgUHgGmkami',	NULL,	'habiburrahman@example.com',	10,	1657960619,	1657960619,	'dY_2aV7I7BxhcMWsV3THut24Kw_soj3W_1657960619',	'202321055',	0),
(4,	'jelviana.risa',	'5fTbCfc0aJKevOxNMlgkX4-rl8kmkKvm',	'$2y$13$8Blfb3liuSMr2qH0k20QS./tHqsmb40mu49/nebVY/skJmy4z9zTu',	NULL,	'jelviana.risa@example.com',	10,	1657960673,	1657960700,	'pmMBYBFrXDVrPGb3DviqEUH30swk1wDZ_1657960673',	'202321057',	1);

-- 2022-07-16 08:43:26
