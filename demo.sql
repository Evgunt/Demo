-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Июл 12 2023 г., 17:00
-- Версия сервера: 10.4.27-MariaDB
-- Версия PHP: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `demo`
--

-- --------------------------------------------------------

--
-- Структура таблицы `info`
--

CREATE TABLE `info` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `now` int(11) NOT NULL,
  `yesterday` int(11) NOT NULL,
  `thisWeek` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `info`
--

INSERT INTO `info` (`id`, `name`, `now`, `yesterday`, `thisWeek`) VALUES
(1, 'Выручка, руб', 500521, 480521, 480521),
(3, 'Наличные', 300000, 310000, 900000),
(4, 'Безналичный расчет', 450236, 480236, 490236),
(5, 'Кредитные карты', 569878, 969878, 59878),
(6, 'Средний чек, руб', 600000, 100000, 900000),
(7, 'Средний гость, руб', 562992, 562992, 562992),
(8, 'Удаление из чека (после оплаты), руб', 56444, 56444, 56444),
(9, 'Удаление из счета (до оплаты), руб', 5000, 5000, 5000),
(10, 'Количество чеков', 6, 5, 4),
(11, 'Количество гостей', 6, 4, 7);

-- --------------------------------------------------------

--
-- Структура таблицы `sales`
--

CREATE TABLE `sales` (
  `id` int(11) NOT NULL,
  `value` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `parent` int(11) NOT NULL,
  `sign` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `sales`
--

INSERT INTO `sales` (`id`, `value`, `position`, `parent`, `sign`) VALUES
(3, 4, 2, 4, 0),
(4, 4, 2, 5, 0),
(5, 44, 2, 6, 1),
(6, 45, 2, 7, 1),
(7, 15, 2, 8, 0),
(8, 4, 2, 9, 0),
(11, 20, 3, 6, 1),
(12, 20, 3, 7, 1),
(13, 30, 3, 8, 1),
(14, 30, 3, 9, 1);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `info`
--
ALTER TABLE `info`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent` (`parent`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `info`
--
ALTER TABLE `info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `info` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
