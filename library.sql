-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Ноя 28 2024 г., 09:00
-- Версия сервера: 8.0.30
-- Версия PHP: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `library`
--

-- --------------------------------------------------------

--
-- Структура таблицы `Users`
--

CREATE TABLE `Users` (
  `id` int NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `Users`
--

INSERT INTO `Users` (`id`, `username`, `email`, `password`) VALUES
(1, 'admin', 'admin@example.com', 'adminpassword'),
(2, 'user1', 'user1@example.com', 'userpassword');

-- --------------------------------------------------------

--
-- Структура таблицы `Учебники`
--

CREATE TABLE `Учебники` (
  `id` int NOT NULL,
  `название` varchar(255) NOT NULL,
  `автор` varchar(255) NOT NULL,
  `доступность` tinyint(1) NOT NULL DEFAULT '1',
  `пользователь_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `Учебники`
--

INSERT INTO `Учебники` (`id`, `название`, `автор`, `доступность`, `пользователь_id`) VALUES
(1, 'JavaScript для начинающих', 'Иванов И.', 0, 1),
(2, 'PHP для начинающих', 'Петров П.П.', 0, 1),
(3, '', '', 0, 1);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `Учебники`
--
ALTER TABLE `Учебники`
  ADD PRIMARY KEY (`id`),
  ADD KEY `пользователь_id` (`пользователь_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `Users`
--
ALTER TABLE `Users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `Учебники`
--
ALTER TABLE `Учебники`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `Учебники`
--
ALTER TABLE `Учебники`
  ADD CONSTRAINT `учебники_ibfk_1` FOREIGN KEY (`пользователь_id`) REFERENCES `Users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
