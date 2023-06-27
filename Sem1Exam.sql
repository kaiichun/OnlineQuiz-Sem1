-- Adminer 4.8.0 MySQL 5.5.5-10.5.17-MariaDB-1:10.5.17+maria~ubu2004 dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `questions`;
CREATE TABLE `questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` text NOT NULL,
  `answer` varchar(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `questions` (`id`, `question`, `answer`) VALUES
(1,	'Question 1',	'A'),
(2,	'Question 2',	'B'),
(3,	'Question 3',	'C'),
(4,	'Question 4',	'D');

DROP TABLE IF EXISTS `results`;
CREATE TABLE `results` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `answer` varchar(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `question_id` (`question_id`),
  CONSTRAINT `results_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `results_ibfk_4` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `results` (`id`, `user_id`, `question_id`, `answer`) VALUES
(1,	3,	1,	'A'),
(2,	3,	2,	'A'),
(3,	3,	3,	'B'),
(4,	3,	4,	'C'),
(5,	2,	1,	'A'),
(6,	2,	2,	'B'),
(7,	2,	3,	'B'),
(8,	2,	4,	'C'),
(9,	6,	1,	'A'),
(10,	6,	1,	'A'),
(11,	6,	1,	'A'),
(12,	6,	1,	'A'),
(13,	6,	1,	'A'),
(14,	6,	1,	'A'),
(15,	6,	1,	'A'),
(16,	6,	1,	'A'),
(17,	6,	1,	'A'),
(18,	6,	1,	'A'),
(19,	6,	1,	'A'),
(20,	6,	1,	'A'),
(21,	6,	1,	'A'),
(22,	6,	1,	'A'),
(23,	6,	1,	'A'),
(24,	6,	1,	'A'),
(25,	6,	1,	'A'),
(26,	6,	1,	'A'),
(27,	6,	1,	'A'),
(42,	9,	1,	'B'),
(43,	9,	2,	'B'),
(44,	9,	3,	'C'),
(45,	9,	4,	'B'),
(46,	7,	1,	'D'),
(47,	7,	2,	'C'),
(48,	7,	3,	'B'),
(49,	7,	4,	'A'),
(50,	6,	1,	'A'),
(51,	6,	1,	'A'),
(52,	6,	1,	'A'),
(53,	6,	2,	'B'),
(54,	6,	3,	'C'),
(55,	6,	4,	'D');

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` text NOT NULL,
  `role` varchar(100) NOT NULL DEFAULT 'user',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `users` (`id`, `name`, `email`, `password`, `role`, `created_at`) VALUES
(1,	'John',	'john1@gmail.com',	'$2y$10$gOxbRp/b.oThKfNaTj.4be4gHiL6xfA93HXcvGuw5LwJA6SpNFAAu',	'admin',	'2023-06-27 02:09:38'),
(2,	'Jane',	'jane@gmail.com',	'$2y$10$thgHB81jD.crXeFANytoQ.EfD2XB3ZPZ1OqVMrDH32GERkPsmNYPG',	'user',	'2023-05-21 05:55:24'),
(3,	'Jack',	'jack@gmail.com',	'$2y$10$FrNYGeEY1GnHZxCJ6hgw2ePyFkahlEj69JIRFiS76pCpNlDAe94QS',	'admin',	'2023-06-27 03:42:26'),
(4,	'Rex',	'rexyap@hotmail.com',	'$2y$10$1295AjM1dhCikX.IzK3tc.61C8agqd0PyrvC3v2gNduR2poUbHfL2',	'user',	'2023-06-27 03:26:59'),
(6,	'Denish Rao',	'denish@gmail.com',	'$2y$10$xz67OPgQmVRaAlVqbq6mO.x5.b3DgjzxIfvDTBs/9WoOD/hqmc7Qm',	'admin',	'2023-06-27 02:09:55'),
(7,	'Jie Kai',	'jiekai@gmail.com',	'$2y$10$BJDsVtdMqxl70Hua7S.oEeozTqO.0.LQmd2HacsBaZBdsJTps3Q.6',	'user',	'2023-06-27 02:10:22'),
(9,	'Alvin',	'alvin@gmail.com',	'$2y$10$PvzT.GGoh4UqVM6HnXJpvOruw.B8tsptQSv2BR6C7Z.RpxTEow1nO',	'user',	'2023-06-27 03:41:07');

-- 2023-06-27 04:00:58
