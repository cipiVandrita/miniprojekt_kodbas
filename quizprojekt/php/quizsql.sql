/*
SQLyog Community
MySQL - 5.7.36 : Database - quiz
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `options` */

CREATE TABLE `options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `val` varchar(255) COLLATE utf8_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `options_ibfk_1` FOREIGN KEY (`id`) REFERENCES `question` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

/*Data for the table `options` */

insert  into `options`(`id`,`val`) values 
(1,'DUALITY, PINK DDPAT, DRAGON LORE, FEVER DREAM'),
(2,'HEAD SHOT, ELITE BUILD, NIGHTWISH, SAFARI MESH'),
(3,'TRIGGER DICIPLINE, PRINTSTREAM, BLAZE, OCEAN DRIVE'),
(4,'CORTEX, NEO NOIR, THE TRAITOR, STAINLESS'),
(5,'REACTOR, FRANKLIN, VOGUE,WEASEL'),
(6,'POWER LOADER, BRATATAT, LOUDMOUTH, PALM'),
(7,'DETOUR, SLASHED, DRAGONFIRE, PARALLAX'),
(8,'GROTTO, POULTRYGEIST, STORM, CARDIAC'),
(9,'ENTOMED, SEASONS, INCINIGATOR, QUICKSILVER'),
(10,'INDIGO, XIANGLIU, NITRO, HEXANE');

/*Table structure for table `question` */

CREATE TABLE `question` (
  `id` int(11) NOT NULL,
  `fraga` varchar(255) COLLATE utf8_swedish_ci DEFAULT NULL,
  `bild` varchar(255) COLLATE utf8_swedish_ci DEFAULT NULL,
  `ratt` varchar(255) COLLATE utf8_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

/*Data for the table `question` */

insert  into `question`(`id`,`fraga`,`bild`,`ratt`) values 
(1,'What AWP CS:GO skin is this?','bild01.png','pinkddpat'),
(2,'What AK-47 CS:GO skin is this?','bild02.png','nightwish'),
(3,'What DESERT EAGLE CS:GO skin is this?','bild03.png','printstream'),
(4,'What USP-S CS:GO skin is this?','bild04.png','neonoir'),
(5,'What GLOCK-18 CS:GO skin is this?','bild05.png','weasel'),
(6,'What NEGEV CS:GO skin is this','bild06.png','powerloader'),
(7,'What SSG 08 CS:GO skin is this','bild07.png','dragonfire'),
(8,'What SCAR-20 CS:GO skin is this','bild08.png','grotto'),
(9,'What XM1014 CS:GO skin is this','bild09.png','incinigator'),
(10,'What cz75 CS:GO skin is this','bild10.png','xiangliu');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
