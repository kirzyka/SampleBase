-- --------------------------------------------------------
-- Хост:                         127.0.0.1
-- Версия сервера:               5.5.23 - MySQL Community Server (GPL)
-- ОС Сервера:                   Win64
-- HeidiSQL Версия:              8.3.0.4694
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Дамп структуры базы данных morkovka
CREATE DATABASE IF NOT EXISTS `morkovka` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `morkovka`;


-- Дамп структуры для таблица morkovka.client
CREATE TABLE IF NOT EXISTS `client` (
  `CLIENT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PHONE` int(11) NOT NULL,
  `EMAIL` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'netu@mail.ru',
  PRIMARY KEY (`CLIENT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы morkovka.client: ~29 rows (приблизительно)
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` (`CLIENT_ID`, `NAME`, `PHONE`, `EMAIL`) VALUES
	(38, 'Виктор Мудрый', 957647423, ''),
	(39, 'Anton', 123456, 'kirzyka@gmail.com'),
	(40, 'Anton', 2141245, 'kirzyka@gmail.com'),
	(41, 'dsfsadf', 1902219432, ''),
	(42, 'aS', 214124, ''),
	(43, 'Антон', 506520635, 'kirzyka@gmail.com'),
	(44, 'Виктор', 234234312, ''),
	(45, 'Алексей', 234234234, ''),
	(46, 'blablbalba', 123423153, 'iugsafhuiwoijao@csadmoi.ru'),
	(47, 'ssd', 131231232, ''),
	(48, 'привет', 95764645, ''),
	(49, 'test', 345345345, ''),
	(50, 'Андрей', 123123123, ''),
	(51, 'Илья Муромец', 432343223, ''),
	(52, 'elf', 345344334, ''),
	(53, 'Роман', 934945705, ''),
	(54, 'Антуан', 112131231, 'kirzyka@gmail.com'),
	(55, 'elf мудрый', 543453434, ''),
	(56, 'Алеша Попович', 345343454, ''),
	(57, 'Василий Хмурый', 345423232, ''),
	(58, 'Василиса Премудрая', 345453434, ''),
	(59, 'Эгегей Внезапный', 345343434, ''),
	(60, 'новое имя', 3423232, ''),
	(61, 'www', 342342342, ''),
	(62, 'ddd', 333333333, ''),
	(63, 'Суполюб', 232343223, ''),
	(64, 'Добрыня Никитич', 345434543, ''),
	(65, 'elf', 1231212, ''),
	(66, 'test2', 423523523, 'kirzyka@gmail.com');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;


-- Дамп структуры для таблица morkovka.dish
CREATE TABLE IF NOT EXISTS `dish` (
  `DISH_ID` int(11) NOT NULL AUTO_INCREMENT,
  `SUPPLIER_ID` int(11) NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `WEIGHT` int(4) DEFAULT NULL COMMENT 'в граммах',
  `PICTURE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `STATUS` int(2) NOT NULL DEFAULT '1' COMMENT '1 - active, 2 - delete',
  `DEFAULT_PRICE` decimal(5,2) DEFAULT NULL,
  `TYPE` int(2) NOT NULL COMMENT '1 - первое,  2 - второе, 3 - напиток, 4 - десерт, 5 - не указан / другое ',
  PRIMARY KEY (`DISH_ID`),
  KEY `FK_SUPPLIER_ID` (`SUPPLIER_ID`),
  CONSTRAINT `FK_SUPPLIER_ID` FOREIGN KEY (`SUPPLIER_ID`) REFERENCES `supplier` (`SUPPLIER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы morkovka.dish: ~25 rows (приблизительно)
/*!40000 ALTER TABLE `dish` DISABLE KEYS */;
INSERT INTO `dish` (`DISH_ID`, `SUPPLIER_ID`, `NAME`, `DESCRIPTION`, `WEIGHT`, `PICTURE`, `STATUS`, `DEFAULT_PRICE`, `TYPE`) VALUES
	(56, 1, 'Первое тестовое блюдо', 'Необходимо удалить перед стартом', 150, '777', 2, 15.00, 1),
	(57, 4, 'Первое тестовое блюдо', 'Удалить перед стартом', 170, '777', 1, 17.00, 1),
	(58, 4, 'Уха из морепродуктов', 'Состав: лосось, креветка, рис, лук, морковь ', 200, '', 1, 30.00, 1),
	(59, 4, 'Суп из моркови и чечевицы', 'Состав: чечевица, морковь, лук ', 200, '777', 1, 22.50, 1),
	(60, 4, 'Куриный бульон', 'Бульон с курицей ', 200, '', 1, 18.75, 1),
	(61, 4, 'Крем-суп из брокколи', 'Крем суп из брокколи ', 200, '', 1, 22.50, 1),
	(62, 4, 'Крем-суп из шампиньонов', 'Воздушный крем суп из шампиньонов ', 200, '777', 1, 22.50, 1),
	(63, 4, 'Куриный стейк', 'Стейк из курицы ', 200, '777', 1, 26.25, 2),
	(64, 4, 'Медальоны из телятины', 'Телячие медальоны ', 200, '777', 1, 41.25, 2),
	(65, 4, 'Куриные кнели на пару', 'Кнели из курицы ', 200, '777', 1, 26.25, 2),
	(66, 4, 'Медальоны из свинины', 'Свиные медальоны ', 200, '', 1, 33.75, 2),
	(67, 4, 'Отварная телятина', 'Отварная телятина ', 200, '', 1, 37.50, 2),
	(68, 4, 'Филе телапии с оливками и каперсами', 'Филе телапии с оливками и каперсами', 200, '777', 1, 30.00, 2),
	(69, 4, 'Стейк из лосося', 'Стейк из лосося', 200, '', 1, 52.50, 2),
	(70, 4, 'Дорадо по-марокански (с овощами)', 'Дорадо по-марокански (с овощами)', 200, '', 1, 45.00, 2),
	(71, 4, 'Филе хека с грибами', 'Филе хека с грибами', 200, '', 1, 37.50, 2),
	(72, 4, 'Форель запеченная с овощами', 'Форель запеченная с овощами', 200, '', 1, 45.00, 2),
	(73, 4, 'Микс салат с креветками', 'Микс салат с креветками', 180, '', 1, 33.75, 5),
	(74, 4, 'Беби микс с моцареллой и перепелиным яйцом', 'Беби микс с моцареллой и перепелиным яйцом', 180, '777', 1, 30.00, 5),
	(75, 4, 'Овощной салат', 'Овощной салат', 180, '777', 1, 22.50, 5),
	(76, 1, 'Ланч 22.04', 'Старорусский суп на рассоле "калья" с тофу\nПирожки "кибинай" с растительным мясом и салат с яблоком, морковью и орехами\nРулет с отрубного бисквита с шоколадным кремом ', 700, '777', 1, 60.00, 7),
	(77, 1, 'Ланч 23.04', 'Лёгкий консоме с ньоками\nКарри-пшено с тофу и полезными овощами, запечёнными в своём соку\nЯгодный ванильный бисквит', 700, '777', 1, 60.00, 7),
	(78, 1, 'Баклажановый суп-пюре с копчёным тофу', 'Нежный суп из баклажанов, лука, моркови с добавлением пряно-копчёного сыра тофу', 280, '777', 1, 25.00, 1),
	(79, 1, 'Рисовые оладьи с кабачками и салат с чечевицей', 'Азия и Европа в одной тарелке. Вкусно и питательно! ', 280, '', 1, 25.00, 2),
	(80, 1, 'Греческая халава с бананом, яблоком и клубникой', 'Орехи, семена, изюм, финики, фрукты и ягоды', 100, '777', 1, 10.00, 4);
/*!40000 ALTER TABLE `dish` ENABLE KEYS */;


-- Дамп структуры для таблица morkovka.dish_offer
CREATE TABLE IF NOT EXISTS `dish_offer` (
  `DISH_ID` int(11) NOT NULL,
  `OFFER_ID` int(11) NOT NULL,
  `AMOUNT` int(1) NOT NULL DEFAULT '1' COMMENT '0 - пол порции,  1 - целая,  2 - двойная порция',
  KEY `FK_DISH_ID` (`DISH_ID`),
  KEY `FK_OFFER_ID` (`OFFER_ID`),
  CONSTRAINT `FK_DISH_ID` FOREIGN KEY (`DISH_ID`) REFERENCES `dish` (`DISH_ID`),
  CONSTRAINT `FK_OFFER_ID` FOREIGN KEY (`OFFER_ID`) REFERENCES `offer` (`OFFER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы morkovka.dish_offer: ~42 rows (приблизительно)
/*!40000 ALTER TABLE `dish_offer` DISABLE KEYS */;
INSERT INTO `dish_offer` (`DISH_ID`, `OFFER_ID`, `AMOUNT`) VALUES
	(56, 55, 1),
	(57, 56, 1),
	(57, 57, 1),
	(58, 59, 1),
	(58, 60, 1),
	(68, 61, 1),
	(56, 62, 1),
	(56, 54, 1),
	(57, 64, 1),
	(57, 65, 1),
	(56, 63, 1),
	(57, 66, 1),
	(58, 58, 1),
	(58, 68, 1),
	(59, 80, 1),
	(60, 81, 1),
	(76, 79, 1),
	(76, 78, 1),
	(76, 82, 1),
	(76, 83, 1),
	(76, 84, 1),
	(76, 85, 1),
	(78, 86, 1),
	(79, 86, 1),
	(80, 86, 1),
	(63, 72, 1),
	(64, 73, 1),
	(66, 75, 1),
	(67, 76, 1),
	(59, 87, 1),
	(70, 88, 1),
	(71, 89, 1),
	(72, 90, 1),
	(73, 91, 1),
	(74, 92, 1),
	(75, 93, 1),
	(58, 67, 1),
	(60, 69, 1),
	(61, 70, 1),
	(62, 71, 1),
	(65, 74, 1),
	(68, 77, 1);
/*!40000 ALTER TABLE `dish_offer` ENABLE KEYS */;


-- Дамп структуры для таблица morkovka.location
CREATE TABLE IF NOT EXISTS `location` (
  `LOCATION_ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`LOCATION_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы morkovka.location: ~2 rows (приблизительно)
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` (`LOCATION_ID`, `NAME`, `DESCRIPTION`) VALUES
	(1, 'БЦ Ирва (к.А)', 'Радищева 10/14 корпус А холл'),
	(2, 'БЦ Ирва (к.Б)', 'Радищева 10/14 корпус Б холл');
/*!40000 ALTER TABLE `location` ENABLE KEYS */;


-- Дамп структуры для таблица morkovka.location_offer
CREATE TABLE IF NOT EXISTS `location_offer` (
  `LOCATION_ID` int(11) NOT NULL,
  `OFFER_ID` int(11) NOT NULL,
  KEY `FK_LOCATION_ID` (`LOCATION_ID`),
  KEY `FK_LO_OFFER_ID` (`OFFER_ID`),
  CONSTRAINT `location_offer_ibfk_1` FOREIGN KEY (`LOCATION_ID`) REFERENCES `location` (`LOCATION_ID`),
  CONSTRAINT `location_offer_ibfk_2` FOREIGN KEY (`OFFER_ID`) REFERENCES `offer` (`OFFER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы morkovka.location_offer: ~57 rows (приблизительно)
/*!40000 ALTER TABLE `location_offer` DISABLE KEYS */;
INSERT INTO `location_offer` (`LOCATION_ID`, `OFFER_ID`) VALUES
	(2, 55),
	(1, 56),
	(2, 57),
	(1, 59),
	(1, 60),
	(1, 61),
	(2, 62),
	(1, 54),
	(1, 64),
	(2, 65),
	(2, 63),
	(1, 66),
	(1, 58),
	(2, 68),
	(2, 80),
	(2, 81),
	(1, 79),
	(2, 78),
	(1, 82),
	(1, 83),
	(1, 84),
	(1, 85),
	(1, 86),
	(2, 72),
	(1, 72),
	(2, 73),
	(1, 73),
	(2, 75),
	(1, 75),
	(2, 76),
	(1, 76),
	(2, 87),
	(1, 87),
	(2, 88),
	(1, 88),
	(2, 89),
	(1, 89),
	(2, 90),
	(1, 90),
	(2, 91),
	(1, 91),
	(2, 92),
	(1, 92),
	(2, 93),
	(1, 93),
	(2, 67),
	(1, 67),
	(2, 69),
	(1, 69),
	(2, 70),
	(1, 70),
	(2, 71),
	(1, 71),
	(2, 74),
	(1, 74),
	(2, 77),
	(1, 77);
/*!40000 ALTER TABLE `location_offer` ENABLE KEYS */;


-- Дамп структуры для таблица morkovka.offer
CREATE TABLE IF NOT EXISTS `offer` (
  `OFFER_ID` int(11) NOT NULL AUTO_INCREMENT,
  `PRICE` decimal(5,2) NOT NULL,
  `PRICE_HALF` decimal(5,2) DEFAULT NULL,
  `PRICE_DOUBLE` decimal(5,2) DEFAULT NULL,
  `WEIGHT` int(4) NOT NULL DEFAULT '0' COMMENT 'в граммах',
  `WEIGHT_HALF` int(4) NOT NULL DEFAULT '0' COMMENT 'в граммах половина порции',
  `WEIGHT_DOUBLE` int(4) NOT NULL DEFAULT '0' COMMENT 'в граммах двойная порция',
  `STATUS` int(2) NOT NULL DEFAULT '1' COMMENT '1 - active, 2 - delete',
  `START_DATE` bigint(20) NOT NULL,
  `END_DATE` bigint(20) DEFAULT NULL,
  `DAY_OF_WEEK` int(7) NOT NULL,
  `H08` int(2) NOT NULL DEFAULT '-1',
  `H09` int(2) NOT NULL DEFAULT '-1',
  `H10` int(2) NOT NULL DEFAULT '-1',
  `H11` int(2) NOT NULL DEFAULT '-1',
  `H12` int(2) NOT NULL DEFAULT '-1',
  `H13` int(2) NOT NULL DEFAULT '-1',
  `H14` int(2) NOT NULL DEFAULT '-1',
  `H15` int(2) NOT NULL DEFAULT '-1',
  `H16` int(2) NOT NULL DEFAULT '-1',
  `H17` int(2) NOT NULL DEFAULT '-1',
  `H18` int(2) NOT NULL DEFAULT '-1',
  `H19` int(2) NOT NULL DEFAULT '-1',
  `H20` int(2) NOT NULL DEFAULT '-1',
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PICTURE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IS_RULE` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 - предложение выводится в меню, 2 - предложение является "правилом", не выводится в меню и используется для пересчета заказа в  корзине',
  `TYPE` int(2) NOT NULL DEFAULT '5' COMMENT '1 - первое,  2 - второе, 3 - напиток, 4 - десерт, 5 - не указан / другое ',
  PRIMARY KEY (`OFFER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы morkovka.offer: ~40 rows (приблизительно)
/*!40000 ALTER TABLE `offer` DISABLE KEYS */;
INSERT INTO `offer` (`OFFER_ID`, `PRICE`, `PRICE_HALF`, `PRICE_DOUBLE`, `WEIGHT`, `WEIGHT_HALF`, `WEIGHT_DOUBLE`, `STATUS`, `START_DATE`, `END_DATE`, `DAY_OF_WEEK`, `H08`, `H09`, `H10`, `H11`, `H12`, `H13`, `H14`, `H15`, `H16`, `H17`, `H18`, `H19`, `H20`, `NAME`, `DESCRIPTION`, `PICTURE`, `IS_RULE`, `TYPE`) VALUES
	(54, 15.00, 0.00, 30.00, 150, 0, 300, 2, 1429390800000, 1429909200000, 62, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 'Первое тестовое блюдо', 'Необходимо удалить перед стартом', NULL, 1, 0),
	(55, 15.00, 0.00, 0.00, 150, 0, 0, 2, 1429390800000, 1429822800000, 62, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 'Первое тестовое блюдо', 'Необходимо удалить перед стартом', NULL, 1, 1),
	(56, 17.00, 0.00, 0.00, 170, 0, 0, 2, 1429390800000, 1429822800000, 62, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 'Первое тестовое блюдо', 'Удалить перед стартом', NULL, 1, 1),
	(57, 17.00, 0.00, 0.00, 170, 0, 0, 2, 1429390800000, 1429822800000, 62, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 'Первое тестовое блюдо', 'Удалить перед стартом', NULL, 1, 1),
	(58, 30.00, 0.00, 0.00, 200, 0, 0, 2, 1429549885200, NULL, 62, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 'Уха из морепродуктов', 'Состав: Лосось криветка рис лук морковь ', NULL, 1, 0),
	(59, 30.00, 0.00, 0.00, 200, 0, 0, 2, 1429550029980, NULL, 62, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 'Уха из морепродуктов', 'Состав: Лосось криветка рис лук морковь ', NULL, 1, 1),
	(60, 30.00, 0.00, 0.00, 200, 0, 0, 2, 1429554786241, NULL, 62, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 'Уха из морепродуктов', 'Состав: Лосось криветка рис лук морковь ', NULL, 1, 1),
	(61, 30.00, 0.00, 0.00, 200, 0, 0, 2, 1429563600000, 1430341200000, 62, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 'Филе телапии с оливками и каперсами', 'Филе телапии с оливками и каперсами', NULL, 1, 2),
	(62, 15.00, 0.00, 0.00, 150, 0, 0, 2, 1429563600000, 1429909200000, 62, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 'Первое тестовое блюдо', 'Необходимо удалить перед стартом', NULL, 1, 1),
	(63, 15.00, 0.00, 0.00, 150, 0, 0, 2, 1429563600000, 1429909200000, 62, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 'Первое тестовое блюдо', 'Необходимо удалить перед стартом', NULL, 1, 1),
	(64, 17.00, 0.00, 0.00, 170, 0, 0, 2, 1429563600000, 1430341200000, 62, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 'Первое тестовое блюдо', 'Удалить перед стартом', NULL, 1, 1),
	(65, 17.00, 0.00, 0.00, 170, 0, 0, 2, 1429563600000, 1430341200000, 62, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 'Первое тестовое блюдо', 'Удалить перед стартом', NULL, 1, 1),
	(66, 17.00, 0.00, 0.00, 170, 0, 0, 2, 1429622070107, NULL, 62, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 'Первое тестовое блюдо', 'Удалить перед стартом', NULL, 1, 1),
	(67, 30.00, 0.00, 0.00, 200, 0, 0, 1, 1429563600000, 1430427600000, 62, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 'Уха из морепродуктов', 'Состав: Лосось криветка рис лук морковь ', NULL, 1, 1),
	(68, 30.00, 0.00, 0.00, 200, 0, 0, 2, 1429622963761, NULL, 62, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 'Уха из морепродуктов', 'Состав: Лосось криветка рис лук морковь ', NULL, 1, 1),
	(69, 18.75, 0.00, 0.00, 200, 0, 0, 1, 1429563600000, 1430427600000, 62, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 'Куриный бульон', 'Куриный бульон', NULL, 1, 1),
	(70, 22.50, 0.00, 0.00, 200, 0, 0, 1, 1429563600000, 1430427600000, 62, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 'Крем-суп из брокколи', 'Крем суп из броколи ', NULL, 1, 1),
	(71, 22.50, 0.00, 0.00, 200, 0, 0, 1, 1429563600000, 1430427600000, 62, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 'Крем-суп из шампиньонов', 'Воздушный крем суп из шампиньонов ', NULL, 1, 1),
	(72, 26.25, 0.00, 0.00, 200, 0, 0, 1, 1429563600000, 1430427600000, 62, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 'Куриный стейк', 'Стейк из курицы ', NULL, 1, 2),
	(73, 41.25, 0.00, 0.00, 200, 0, 0, 1, 1429563600000, 1430427600000, 62, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 'Медальоны из телятины', 'Телячие медальоны ', NULL, 1, 2),
	(74, 26.25, 0.00, 0.00, 200, 0, 0, 1, 1429563600000, 1430427600000, 62, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 'Куриные кнели на пару', 'Кнели из курицы ', NULL, 1, 2),
	(75, 33.75, 0.00, 0.00, 200, 0, 0, 1, 1429563600000, 1430427600000, 62, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 'Медальоны из свинины', 'Медальоны из свинины', NULL, 1, 2),
	(76, 37.50, 0.00, 0.00, 200, 0, 0, 1, 1429563600000, 1430427600000, 62, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 'Отварная телятина', 'Отварная телятина ', NULL, 1, 2),
	(77, 30.00, 0.00, 0.00, 200, 0, 0, 1, 1429563600000, 1430427600000, 62, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 'Филе телапии с оливками и каперсами', 'Филе телапии с оливками и каперсами', NULL, 1, 2),
	(78, 60.00, 0.00, 0.00, 700, 0, 0, 2, 1429650000000, NULL, 8, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 'Ланч 22.04', 'Старорусский суп на рассоле "калья" с тофу\nПирожки "кибинай" с растительным мясом и салат с яблоком, морковью и орехами\nРулет с отрубного бисквита с шоколадным кремом ', NULL, 1, 0),
	(79, 60.00, 0.00, 0.00, 700, 0, 0, 2, 1429650000000, NULL, 8, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 'Ланч 22.04', 'Старорусский суп на рассоле "калья" с тофу\nПирожки "кибинай" с растительным мясом и салат с яблоком, морковью и орехами\nРулет с отрубного бисквита с шоколадным кремом ', NULL, 1, 0),
	(80, 22.50, 0.00, 0.00, 200, 0, 0, 2, 1429563600000, 1430341200000, 62, -1, -1, -1, -1, -1, 15, -1, -1, -1, -1, -1, -1, -1, 'Суп из моркови и чечевицы', 'Состав: чечевица, морковь, лук ', NULL, 1, 1),
	(81, 18.75, 0.00, 0.00, 200, 0, 0, 2, 1429563600000, 1430341200000, 62, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 'Куриный бульон', 'Бульон с курицей ', NULL, 1, 1),
	(82, 60.00, 0.00, 0.00, 700, 0, 0, 1, 1429650000000, 1429650000000, 8, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 'Ланч 22.04', 'Старорусский суп на рассоле "калья" с тофу\nПирожки "кибинай" с растительным мясом и салат с яблоком, морковью и орехами\nРулет с отрубного бисквита с шоколадным кремом ', NULL, 1, 7),
	(83, 60.00, 0.00, 0.00, 700, 0, 0, 1, 1429650000000, 1429650000000, 62, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 'Ланч 22.04', 'Старорусский суп на рассоле "калья" с тофу\nПирожки "кибинай" с растительным мясом и салат с яблоком, морковью и орехами\nРулет с отрубного бисквита с шоколадным кремом ', NULL, 1, 7),
	(84, 60.00, 0.00, 0.00, 700, 0, 0, 2, 1429563600000, 1430341200000, 8, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 'Ланч 22.04', 'Старорусский суп на рассоле "калья" с тофу\nПирожки "кибинай" с растительным мясом и салат с яблоком, морковью и орехами\nРулет с отрубного бисквита с шоколадным кремом ', NULL, 1, 7),
	(85, 60.00, 0.00, 0.00, 700, 0, 0, 1, 1429563600000, 1429736400000, 8, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 'Ланч 22.04', 'Старорусский суп на рассоле "калья" с тофу\nПирожки "кибинай" с растительным мясом и салат с яблоком, морковью и орехами\nРулет с отрубного бисквита с шоколадным кремом ', NULL, 1, 7),
	(86, 60.00, 0.00, 0.00, 660, 0, 0, 1, 1429822800000, NULL, 32, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1, -1, 'Баклажановый суп-пюре с копчёным тофу, Рисовые оладьи с кабачками и салат с чечевицей, Греческая халава с бананом, яблоком и клубникой', 'Нежный суп из баклажанов, лука, моркови с добавлением пряно-копчёного сыра тофу', NULL, 1, 7),
	(87, 22.50, 0.00, 0.00, 200, 0, 0, 1, 1429650000000, 1433106000000, 62, -1, -1, -1, -1, -1, 15, -1, -1, -1, -1, -1, -1, -1, 'Суп из моркови и чечевицы', 'Состав: чечевица, морковь, лук ', NULL, 1, 1),
	(88, 45.00, 0.00, 0.00, 200, 0, 0, 1, 1429650000000, 1430427600000, 62, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1, -1, 'Дорадо по-марокански (с овощами)', 'Дорадо по-марокански (с овощами)', NULL, 1, 0),
	(89, 37.50, 0.00, 0.00, 200, 0, 0, 1, 1429650000000, 1430427600000, 62, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 'Филе хека с грибами', 'Филе хека с грибами', NULL, 1, 2),
	(90, 45.00, 0.00, 0.00, 200, 0, 0, 1, 1429650000000, 1430427600000, 62, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 'Форель запеченная с овощами', 'Форель запеченная с овощами', NULL, 1, 2),
	(91, 33.75, 0.00, 0.00, 180, 0, 0, 1, 1429650000000, 1430427600000, 62, -1, -1, -1, -1, -1, 0, -1, 30, -1, 15, -1, -1, -1, 'Микс салат с креветками', 'Микс салат с креветками', NULL, 1, 5),
	(92, 30.00, 0.00, 0.00, 180, 0, 0, 1, 1429650000000, 1430427600000, 62, -1, -1, -1, -1, -1, 0, -1, 30, -1, -1, -1, -1, -1, 'Беби микс с моцареллой и перепелиным яйцом', 'Беби микс с моцареллой и перепелиным яйцом', NULL, 1, 5),
	(93, 22.50, 0.00, 0.00, 180, 0, 0, 1, 1429650000000, 1430427600000, 62, -1, -1, -1, -1, -1, 0, -1, 30, -1, 15, -1, -1, -1, 'Овощной салат', 'Овощной салат', NULL, 1, 5);
/*!40000 ALTER TABLE `offer` ENABLE KEYS */;


-- Дамп структуры для таблица morkovka.offer_order
CREATE TABLE IF NOT EXISTS `offer_order` (
  `OFFER_ID` int(11) NOT NULL,
  `ORDER_ID` int(11) NOT NULL,
  `AMOUNT` tinyint(4) NOT NULL,
  `SERVING` int(1) NOT NULL,
  KEY `FK_OO_OFFER_ID` (`OFFER_ID`),
  KEY `FK_ORDER_ID` (`ORDER_ID`),
  CONSTRAINT `FK_OO_OFFER_ID` FOREIGN KEY (`OFFER_ID`) REFERENCES `offer` (`OFFER_ID`),
  CONSTRAINT `FK_ORDER_ID` FOREIGN KEY (`ORDER_ID`) REFERENCES `order` (`ORDER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы morkovka.offer_order: ~10 rows (приблизительно)
/*!40000 ALTER TABLE `offer_order` DISABLE KEYS */;
INSERT INTO `offer_order` (`OFFER_ID`, `ORDER_ID`, `AMOUNT`, `SERVING`) VALUES
	(70, 1, 1, 0),
	(74, 1, 1, 0),
	(71, 3, 1, 0),
	(72, 3, 1, 0),
	(85, 2, 1, 0),
	(76, 4, 1, 0),
	(67, 5, 1, 0),
	(87, 5, 1, 0),
	(67, 6, 1, 0),
	(87, 6, 2, 0);
/*!40000 ALTER TABLE `offer_order` ENABLE KEYS */;


-- Дамп структуры для таблица morkovka.order
CREATE TABLE IF NOT EXISTS `order` (
  `ORDER_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CLIENT_ID` int(11) NOT NULL,
  `STATUS` tinyint(4) DEFAULT NULL COMMENT '1 - не подтвержден; 2 - подтвержден; 3 - доставлен и оплачен; 4 - отменен; 5 - доставлен но не оплачен',
  `DATE` bigint(20) NOT NULL,
  `TIME` smallint(6) NOT NULL,
  `COMMENT` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `PRICE` float NOT NULL DEFAULT '0',
  `DISCOUNT` float NOT NULL DEFAULT '0' COMMENT 'абсолютная скидка в текущей валюте. По умолчанию = 0. Значит скидки нет.',
  `RULES` varchar(10000) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'Json строка, которая содержит список правил и скидок и какие предложения заказа в них вовлечены',
  `CODE` varchar(22) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `LOCATION_ID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ORDER_ID`),
  KEY `FK_CLIENT_ID` (`CLIENT_ID`),
  KEY `ORDER_ID` (`ORDER_ID`),
  CONSTRAINT `FK_CLIENT_ID` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`CLIENT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы morkovka.order: ~6 rows (приблизительно)
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` (`ORDER_ID`, `CLIENT_ID`, `STATUS`, `DATE`, `TIME`, `COMMENT`, `PRICE`, `DISCOUNT`, `RULES`, `CODE`, `LOCATION_ID`) VALUES
	(1, 38, 2, 1429660800000, 12, 'Позвоните мне пожалуйста в любом случае, даже если подтверждение придет по email', 48.75, 0, '[]', 'pXm45e6WFo5gpGNDdXKCWL', 1),
	(2, 38, 2, 1429660800000, 13, 'Позвоните пожалуйста за пол часа до приезда курьера', 60, 0, '[]', 'YhrryFoLHVkznsWenIl7mX', 1),
	(3, 43, 2, 1429660800000, 12, '', 48.75, 0, '[]', 'z9xrM5Ocv5JWSJL9TvouA3', 1),
	(4, 65, 1, 1429660800000, 12, 'пробник. Не обращать внимание', 37.5, 0, '[]', 'QW4Kuyc2f9x6QdXbJYRw7o', 1),
	(5, 49, 1, 1429833600000, 12, 'test order IRVA B', 35, 17.5, '[{"countAfterApplyRule":35,"countBeforeApplyRule":52.5,"description":"Два первых блюда за 35 грн","offers":[{"amount":1,"price":22.5,"offer_id":87,"serving":0,"name":"Суп из моркови и чечевицы","sum":0,"type":1},{"amount":1,"price":30,"offer_id":67,"serving":0,"name":"Уха из морепродуктов","sum":0,"type":1}]}]', 'VONYrrOLv5UKARrK83AJmh', 2),
	(6, 66, 1, 1429833600000, 12, 'test order IRVA A', 65, 10, '[{"countAfterApplyRule":35,"countBeforeApplyRule":45,"description":"Два первых блюда за 35 грн","offers":[{"amount":1,"price":22.5,"offer_id":87,"serving":0,"name":"Суп из моркови и чечевицы","sum":0,"type":1},{"amount":1,"price":22.5,"offer_id":87,"serving":0,"name":"Суп из моркови и чечевицы","sum":0,"type":1}]}]', 'oXb0PNQF8s2mOAmZJhUg3N', 1);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;


-- Дамп структуры для таблица morkovka.promotion
CREATE TABLE IF NOT EXISTS `promotion` (
  `PROMOTION_ID` int(11) NOT NULL AUTO_INCREMENT,
  `SUPPLIER_ID` int(11) NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ENABLE` int(1) NOT NULL DEFAULT '0',
  `ENABLE_MOB` int(1) NOT NULL DEFAULT '0',
  `HEADER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HEADER_MOB` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION_MOB` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `START_DATE` bigint(20) DEFAULT NULL,
  `END_DATE` bigint(20) DEFAULT NULL,
  `DAY_OF_WEEK` int(11) DEFAULT NULL,
  `STATUS` int(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`PROMOTION_ID`),
  KEY `SUPPLIER_ID` (`SUPPLIER_ID`),
  CONSTRAINT `FK_SUPPLIER_ID_PROM` FOREIGN KEY (`SUPPLIER_ID`) REFERENCES `supplier` (`SUPPLIER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы morkovka.promotion: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `promotion` DISABLE KEYS */;
/*!40000 ALTER TABLE `promotion` ENABLE KEYS */;


-- Дамп структуры для таблица morkovka.promotion_location
CREATE TABLE IF NOT EXISTS `promotion_location` (
  `PROMOTION_ID` int(11) DEFAULT NULL,
  `LOCATION_ID` int(11) DEFAULT NULL,
  KEY `PROMOTION_ID` (`PROMOTION_ID`,`LOCATION_ID`),
  KEY `LOCATION_ID` (`LOCATION_ID`),
  CONSTRAINT `FK_LOCATION_ID_PL` FOREIGN KEY (`LOCATION_ID`) REFERENCES `location` (`LOCATION_ID`),
  CONSTRAINT `FK_PROMOTION_ID` FOREIGN KEY (`PROMOTION_ID`) REFERENCES `promotion` (`PROMOTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы morkovka.promotion_location: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `promotion_location` DISABLE KEYS */;
/*!40000 ALTER TABLE `promotion_location` ENABLE KEYS */;


-- Дамп структуры для таблица morkovka.supplier
CREATE TABLE IF NOT EXISTS `supplier` (
  `SUPPLIER_ID` int(11) NOT NULL AUTO_INCREMENT,
  `STATUS` int(2) NOT NULL DEFAULT '1' COMMENT '1 - active, 2 - delete',
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `EMAIL` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PHONE` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MIN_ORDER_TIME` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Минимальное время выполнения заказа(минуты)',
  `LAST_HOUR` decimal(10,0) unsigned NOT NULL DEFAULT '17' COMMENT 'Последний час приема заказа на завтра(часы)',
  `TIMEZONE` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'GMT+3',
  PRIMARY KEY (`SUPPLIER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы morkovka.supplier: ~3 rows (приблизительно)
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` (`SUPPLIER_ID`, `STATUS`, `NAME`, `EMAIL`, `PHONE`, `DESCRIPTION`, `MIN_ORDER_TIME`, `LAST_HOUR`, `TIMEZONE`) VALUES
	(1, 1, 'Veganohooligano', 'community@veganohooligano.com.ua', '38098 2940 231', '<p><strong>Вегано Хулігано</strong> - це реальна можливість об\'єднати людей, готових здійснювати реальні вчинки на шляху до зміни нашого Світу на краще.</p>\n<br>\n<p><strong>Вегано Хулігано</strong> - ефективна інформаційна платформа, здатна забезпечити веганів натхненням і мотивацією, а людей, готових зробити спробу змінити свій "хижацький" спосіб життя, - забезпечити необхідними знаннями та методами, що полегшують перехід до адекватного способу життя.</p>\n<br>\n<p><strong>Вегано Хулігано</strong> - спільнота, розвиток якої не мислимий без безпосередньої праці і підтримки її учасників. Якщо ви веган, чи ще ні, але ваші розум і серце бажають змін, і ви готові приєднатися до команди, - ласкаво просимо до групи! Тут ми роздаємо завдання, модеруємо процеси, ділимося ідеями щодо розвитку проекту та веган-руху в Україні в цілому і просто відчуваємо плече друга, що глибоко і ясно усвідомив межу, за якою починається кривава, бездумна і безсердечна жорстокість.</p>\n<br>\n<p><strong>Вегано Хулігано</strong> - за суспільство рівноправності всього живого, за мир, співчуття і діалог. Welcome. Добро пожаловать. Вiтаємо.</p>', 0, 19, 'GMT+3'),
	(4, 1, 'ПолезноЕсть', 'info.poleznost@gmail.com', '38 (093) 703 9 709', '<img src="http://poleznost.com/images/img0001.png" height="90"/>\n<br>\n<p>Команда опытных поваров и диетологов <strong>«ПолезноЕсть»</strong> специально для вас разработала эффективные программы сбалансированного питания, которые способствуют бодрому настроению и поднятию жизненного тонуса.Наши программы рассчитаны как для тех, кто желает похудеть или набрать вес, также, мы помним о вегетарианцах и веганах, мясоедах и любителях морепродуктов.</p>\n<br>\n<p>Питаться с помощью <strong>«ПолезноЕсть»</strong> в большинстве случаев выгоднее, чем питаться самому или нанимать личного повара. Ежедневный комплекс программ обойдется вам дешевле, чем в ресторане, ведь мы предлагаем честную и обоснованную цену.</p>', 1, 19, 'GMT+3'),
	(5, 2, 'Тестовая кухня 3', 'zdorovo@mail.com', '044 456 45 45', 'Тестовая кухня 3 для отработки технических навыков работы с сервисом', 1, 19, 'GMT+3');
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;


-- Дамп структуры для таблица morkovka.users
CREATE TABLE IF NOT EXISTS `users` (
  `user_name` varchar(30) NOT NULL,
  `user_pass` varchar(100) NOT NULL,
  `STATUS` int(11) NOT NULL DEFAULT '1' COMMENT '1 - active, 2 - delete',
  `supplier_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Дамп данных таблицы morkovka.users: 4 rows
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`user_name`, `user_pass`, `STATUS`, `supplier_id`) VALUES
	('admin', '22f256eca1f336a97eef2b260773cb0d81d900c208ff26e94410d292d605fed8', 1, NULL),
	('supplier', '5845803f6d1ca3d0b4037c617bfd8d1e1887f7bd08c9ed1cb19202a521281de7', 1, 1),
	('test2', '3cfc2a0728f888d48a33419fa368a7baa6aeb8351d69c35b22e9993185ff26fb', 1, 4),
	('test1', 'a72db54fa03ae9711c12c485e4b83601edf3c99d15a092e43be6bb30a1f6523f', 1, 1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;


-- Дамп структуры для таблица morkovka.user_roles
CREATE TABLE IF NOT EXISTS `user_roles` (
  `user_name` varchar(30) NOT NULL,
  `role_name` varchar(30) NOT NULL,
  PRIMARY KEY (`user_name`,`role_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Дамп данных таблицы morkovka.user_roles: 4 rows
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` (`user_name`, `role_name`) VALUES
	('admin', 'ROLE_ADMIN'),
	('supplier', 'ROLE_SUPPLIER'),
	('test1', 'ROLE_SUPPLIER'),
	('test2', 'ROLE_SUPPLIER');
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
