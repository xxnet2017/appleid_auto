/*
SQLyog Community v13.1.9 (64 bit)
MySQL - 8.0.12 : Database - appleid_auto
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `account` */

CREATE TABLE `account` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `remark` text COLLATE utf8_unicode_ci,
  `username` text COLLATE utf8_unicode_ci NOT NULL,
  `password` text COLLATE utf8_unicode_ci NOT NULL,
  `dob` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `question1` text COLLATE utf8_unicode_ci NOT NULL,
  `answer1` text COLLATE utf8_unicode_ci NOT NULL,
  `question2` text COLLATE utf8_unicode_ci NOT NULL,
  `answer2` text COLLATE utf8_unicode_ci NOT NULL,
  `question3` text COLLATE utf8_unicode_ci NOT NULL,
  `answer3` text COLLATE utf8_unicode_ci NOT NULL,
  `owner` int(10) unsigned NOT NULL,
  `share_link` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `last_check` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  `check_interval` int(10) unsigned NOT NULL DEFAULT '10',
  `frontend_remark` text COLLATE utf8_unicode_ci NOT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `enable_check_password_correct` tinyint(1) NOT NULL,
  `enable_delete_devices` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `owner` (`owner`),
  CONSTRAINT `account_ibfk_1` FOREIGN KEY (`owner`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `account` */

insert  into `account`(`id`,`remark`,`username`,`password`,`dob`,`question1`,`answer1`,`question2`,`answer2`,`question3`,`answer3`,`owner`,`share_link`,`last_check`,`check_interval`,`frontend_remark`,`message`,`enable_check_password_correct`,`enable_delete_devices`) values 
(1,'111111111111111111111111111','test','1212','11111111','1','1','2','2','3','3',1,'M0NV576FC8JE','2023-02-09 23:16:41',10,'','正常',0,0),
(2,'','2222','2222','11111111','12121212','1','1','1','2','2',1,'UPrKc6AjpUuF','2000-01-01 00:00:00',10,'','未执行任务',0,0);

/*Table structure for table `share` */

CREATE TABLE `share` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `share_link` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `account_list` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `owner` int(10) unsigned NOT NULL,
  `password` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `html` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `owner` (`owner`),
  CONSTRAINT `share_ibfk_1` FOREIGN KEY (`owner`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `share` */

/*Table structure for table `user` */

CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `is_admin` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `user` */

insert  into `user`(`id`,`username`,`password`,`is_admin`) values 
(1,'admin','$2y$10$aLTHxzuhUrSyHs6m.qKrEeSqmYMXKoTdpfepO0a8OmEIddeQjDcTG',1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
