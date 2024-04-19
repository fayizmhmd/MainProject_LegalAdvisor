/*
SQLyog Community v13.0.1 (64 bit)
MySQL - 8.0.22 : Database - law_system
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/ `law_system` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `law_system`;

/*Table structure for table `auth_group` */

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `auth_group` */

/*Table structure for table `auth_group_permissions` */

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `auth_group_permissions` */

/*Table structure for table `auth_permission` */

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `auth_permission` */

insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values 
(1,'Can add log entry',1,'add_logentry'),
(2,'Can change log entry',1,'change_logentry'),
(3,'Can delete log entry',1,'delete_logentry'),
(4,'Can view log entry',1,'view_logentry'),
(5,'Can add permission',2,'add_permission'),
(6,'Can change permission',2,'change_permission'),
(7,'Can delete permission',2,'delete_permission'),
(8,'Can view permission',2,'view_permission'),
(9,'Can add group',3,'add_group'),
(10,'Can change group',3,'change_group'),
(11,'Can delete group',3,'delete_group'),
(12,'Can view group',3,'view_group'),
(13,'Can add user',4,'add_user'),
(14,'Can change user',4,'change_user'),
(15,'Can delete user',4,'delete_user'),
(16,'Can view user',4,'view_user'),
(17,'Can add content type',5,'add_contenttype'),
(18,'Can change content type',5,'change_contenttype'),
(19,'Can delete content type',5,'delete_contenttype'),
(20,'Can view content type',5,'view_contenttype'),
(21,'Can add session',6,'add_session'),
(22,'Can change session',6,'change_session'),
(23,'Can delete session',6,'delete_session'),
(24,'Can view session',6,'view_session'),
(25,'Can add advocate_table',7,'add_advocate_table'),
(26,'Can change advocate_table',7,'change_advocate_table'),
(27,'Can delete advocate_table',7,'delete_advocate_table'),
(28,'Can view advocate_table',7,'view_advocate_table'),
(29,'Can add booking_table',8,'add_booking_table'),
(30,'Can change booking_table',8,'change_booking_table'),
(31,'Can delete booking_table',8,'delete_booking_table'),
(32,'Can view booking_table',8,'view_booking_table'),
(33,'Can add court_table',9,'add_court_table'),
(34,'Can change court_table',9,'change_court_table'),
(35,'Can delete court_table',9,'delete_court_table'),
(36,'Can view court_table',9,'view_court_table'),
(37,'Can add dataset_table',10,'add_dataset_table'),
(38,'Can change dataset_table',10,'change_dataset_table'),
(39,'Can delete dataset_table',10,'delete_dataset_table'),
(40,'Can view dataset_table',10,'view_dataset_table'),
(41,'Can add login_table',11,'add_login_table'),
(42,'Can change login_table',11,'change_login_table'),
(43,'Can delete login_table',11,'delete_login_table'),
(44,'Can view login_table',11,'view_login_table'),
(45,'Can add section_table',12,'add_section_table'),
(46,'Can change section_table',12,'change_section_table'),
(47,'Can delete section_table',12,'delete_section_table'),
(48,'Can view section_table',12,'view_section_table'),
(49,'Can add user_table',13,'add_user_table'),
(50,'Can change user_table',13,'change_user_table'),
(51,'Can delete user_table',13,'delete_user_table'),
(52,'Can view user_table',13,'view_user_table'),
(53,'Can add section_question_table',14,'add_section_question_table'),
(54,'Can change section_question_table',14,'change_section_question_table'),
(55,'Can delete section_question_table',14,'delete_section_question_table'),
(56,'Can view section_question_table',14,'view_section_question_table'),
(57,'Can add payment',15,'add_payment'),
(58,'Can change payment',15,'change_payment'),
(59,'Can delete payment',15,'delete_payment'),
(60,'Can view payment',15,'view_payment'),
(61,'Can add notification',16,'add_notification'),
(62,'Can change notification',16,'change_notification'),
(63,'Can delete notification',16,'delete_notification'),
(64,'Can view notification',16,'view_notification'),
(65,'Can add hearing_date',17,'add_hearing_date'),
(66,'Can change hearing_date',17,'change_hearing_date'),
(67,'Can delete hearing_date',17,'delete_hearing_date'),
(68,'Can view hearing_date',17,'view_hearing_date'),
(69,'Can add feedback_table',18,'add_feedback_table'),
(70,'Can change feedback_table',18,'change_feedback_table'),
(71,'Can delete feedback_table',18,'delete_feedback_table'),
(72,'Can view feedback_table',18,'view_feedback_table'),
(73,'Can add evidence_table',19,'add_evidence_table'),
(74,'Can change evidence_table',19,'change_evidence_table'),
(75,'Can delete evidence_table',19,'delete_evidence_table'),
(76,'Can view evidence_table',19,'view_evidence_table'),
(77,'Can add complaint_table',20,'add_complaint_table'),
(78,'Can change complaint_table',20,'change_complaint_table'),
(79,'Can delete complaint_table',20,'delete_complaint_table'),
(80,'Can view complaint_table',20,'view_complaint_table'),
(81,'Can add chat',21,'add_chat'),
(82,'Can change chat',21,'change_chat'),
(83,'Can delete chat',21,'delete_chat'),
(84,'Can view chat',21,'view_chat'),
(85,'Can add case_dataset_table',22,'add_case_dataset_table'),
(86,'Can change case_dataset_table',22,'change_case_dataset_table'),
(87,'Can delete case_dataset_table',22,'delete_case_dataset_table'),
(88,'Can view case_dataset_table',22,'view_case_dataset_table'),
(89,'Can add prediction',23,'add_prediction'),
(90,'Can change prediction',23,'change_prediction'),
(91,'Can delete prediction',23,'delete_prediction'),
(92,'Can view prediction',23,'view_prediction');

/*Table structure for table `auth_user` */

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `auth_user` */

insert  into `auth_user`(`id`,`password`,`last_login`,`is_superuser`,`username`,`first_name`,`last_name`,`email`,`is_staff`,`is_active`,`date_joined`) values 
(1,'pbkdf2_sha256$260000$vgsvnQgorPaAex8oNZzlN1$Sw5//bECcuyWi146qiVrUmdK6oUkyFSff63X+mLV8uc=','2024-03-07 03:59:37.392542',1,'00000','','','admin@gmail.com',1,1,'2024-03-02 03:22:17.043683');

/*Table structure for table `auth_user_groups` */

DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `auth_user_groups` */

/*Table structure for table `auth_user_user_permissions` */

DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `auth_user_user_permissions` */

/*Table structure for table `django_admin_log` */

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `django_admin_log` */

/*Table structure for table `django_content_type` */

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `django_content_type` */

insert  into `django_content_type`(`id`,`app_label`,`model`) values 
(1,'admin','logentry'),
(3,'auth','group'),
(2,'auth','permission'),
(4,'auth','user'),
(5,'contenttypes','contenttype'),
(7,'Law','advocate_table'),
(8,'Law','booking_table'),
(22,'Law','case_dataset_table'),
(21,'Law','chat'),
(20,'Law','complaint_table'),
(9,'Law','court_table'),
(10,'Law','dataset_table'),
(19,'Law','evidence_table'),
(18,'Law','feedback_table'),
(17,'Law','hearing_date'),
(11,'Law','login_table'),
(16,'Law','notification'),
(15,'Law','payment'),
(23,'Law','prediction'),
(14,'Law','section_question_table'),
(12,'Law','section_table'),
(13,'Law','user_table'),
(6,'sessions','session');

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `django_migrations` */

insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values 
(1,'Law','0001_initial','2024-03-02 03:03:58.588800'),
(2,'contenttypes','0001_initial','2024-03-02 03:04:02.430566'),
(3,'auth','0001_initial','2024-03-02 03:04:53.745125'),
(4,'admin','0001_initial','2024-03-02 03:05:11.975049'),
(5,'admin','0002_logentry_remove_auto_add','2024-03-02 03:05:12.395742'),
(6,'admin','0003_logentry_add_action_flag_choices','2024-03-02 03:05:12.656489'),
(7,'contenttypes','0002_remove_content_type_name','2024-03-02 03:05:17.591332'),
(8,'auth','0002_alter_permission_name_max_length','2024-03-02 03:05:23.512852'),
(9,'auth','0003_alter_user_email_max_length','2024-03-02 03:05:25.654453'),
(10,'auth','0004_alter_user_username_opts','2024-03-02 03:05:25.967309'),
(11,'auth','0005_alter_user_last_login_null','2024-03-02 03:05:36.223887'),
(12,'auth','0006_require_contenttypes_0002','2024-03-02 03:05:36.638740'),
(13,'auth','0007_alter_validators_add_error_messages','2024-03-02 03:05:36.888732'),
(14,'auth','0008_alter_user_username_max_length','2024-03-02 03:05:44.465283'),
(15,'auth','0009_alter_user_last_name_max_length','2024-03-02 03:05:52.104013'),
(16,'auth','0010_alter_group_name_max_length','2024-03-02 03:05:53.479289'),
(17,'auth','0011_update_proxy_permissions','2024-03-02 03:05:53.686060'),
(18,'auth','0012_alter_user_first_name_max_length','2024-03-02 03:06:00.473886'),
(19,'sessions','0001_initial','2024-03-02 03:06:05.550075'),
(20,'Law','0002_prediction','2024-03-06 03:04:14.940726'),
(21,'Law','0003_prediction_ans','2024-03-06 03:11:19.614104'),
(22,'Law','0004_alter_prediction_qid','2024-03-07 01:39:22.868273');

/*Table structure for table `django_session` */

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `django_session` */

/*Table structure for table `law_advocate_table` */

DROP TABLE IF EXISTS `law_advocate_table`;

CREATE TABLE `law_advocate_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `address` varchar(100) NOT NULL,
  `place` varchar(100) NOT NULL,
  `post` varchar(100) NOT NULL,
  `pincode` int NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` bigint NOT NULL,
  `experience` varchar(20) NOT NULL,
  `qualification` varchar(100) NOT NULL,
  `department` varchar(20) NOT NULL,
  `status` varchar(40) NOT NULL,
  `proof` varchar(100) NOT NULL,
  `LOGIN_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Law_advocate_table_LOGIN_id_11f5448a_fk_Law_login_table_id` (`LOGIN_id`),
  CONSTRAINT `Law_advocate_table_LOGIN_id_11f5448a_fk_Law_login_table_id` FOREIGN KEY (`LOGIN_id`) REFERENCES `law_login_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `law_advocate_table` */

insert  into `law_advocate_table`(`id`,`firstname`,`lastname`,`gender`,`address`,`place`,`post`,`pincode`,`email`,`phone`,`experience`,`qualification`,`department`,`status`,`proof`,`LOGIN_id`) values 
(1,'akshay','p','Male','qrwqreqw','calicut','calicut',607890,'akshay@gmail.com',9090909090,'5','MSC.cs','computer','available','Screenshot (2).png',2),
(2,'agfdgf','7','Male','dfgz','safa','asfd',564,'safa',876897,'3','ghdh','gcdhg','hgf','pnbvnb',5);

/*Table structure for table `law_booking_table` */

DROP TABLE IF EXISTS `law_booking_table`;

CREATE TABLE `law_booking_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `time` time(6) NOT NULL,
  `case_details` varchar(500) NOT NULL,
  `status` varchar(100) NOT NULL,
  `ADVOCATE_id` bigint NOT NULL,
  `USER_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Law_booking_table_USER_id_a580a48b_fk_Law_user_table_id` (`USER_id`),
  KEY `Law_booking_table_ADVOCATE_id_c4302275_fk_Law_advocate_table_id` (`ADVOCATE_id`),
  CONSTRAINT `Law_booking_table_ADVOCATE_id_c4302275_fk_Law_advocate_table_id` FOREIGN KEY (`ADVOCATE_id`) REFERENCES `law_advocate_table` (`id`),
  CONSTRAINT `Law_booking_table_USER_id_a580a48b_fk_Law_user_table_id` FOREIGN KEY (`USER_id`) REFERENCES `law_user_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `law_booking_table` */

insert  into `law_booking_table`(`id`,`date`,`time`,`case_details`,`status`,`ADVOCATE_id`,`USER_id`) values 
(1,'2024-03-01','02:00:00.000000','robbery','given',1,1),
(2,'2024-03-04','03:09:00.000000','murder','pending',1,1),
(3,'2024-03-04','16:20:00.474173','ggdhdhdh','pending',1,1);

/*Table structure for table `law_case_dataset_table` */

DROP TABLE IF EXISTS `law_case_dataset_table`;

CREATE TABLE `law_case_dataset_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `dataset` varchar(1000) NOT NULL,
  `SECTION_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Law_case_dataset_tab_SECTION_id_a3bacc19_fk_Law_secti` (`SECTION_id`),
  CONSTRAINT `Law_case_dataset_tab_SECTION_id_a3bacc19_fk_Law_secti` FOREIGN KEY (`SECTION_id`) REFERENCES `law_section_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `law_case_dataset_table` */

insert  into `law_case_dataset_table`(`id`,`dataset`,`SECTION_id`) values 
(1,'drunk and drive',1),
(2,'Night work',1),
(3,'afraid ?',2),
(4,'smugling',2);

/*Table structure for table `law_chat` */

DROP TABLE IF EXISTS `law_chat`;

CREATE TABLE `law_chat` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `message` varchar(2000) NOT NULL,
  `time` time(6) NOT NULL,
  `date` date NOT NULL,
  `FROM_ID_id` bigint NOT NULL,
  `TO_ID_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Law_chat_FROM_ID_id_7d59b1ac_fk_Law_login_table_id` (`FROM_ID_id`),
  KEY `Law_chat_TO_ID_id_2591432f_fk_Law_login_table_id` (`TO_ID_id`),
  CONSTRAINT `Law_chat_FROM_ID_id_7d59b1ac_fk_Law_login_table_id` FOREIGN KEY (`FROM_ID_id`) REFERENCES `law_login_table` (`id`),
  CONSTRAINT `Law_chat_TO_ID_id_2591432f_fk_Law_login_table_id` FOREIGN KEY (`TO_ID_id`) REFERENCES `law_login_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `law_chat` */

insert  into `law_chat`(`id`,`message`,`time`,`date`,`FROM_ID_id`,`TO_ID_id`) values 
(1,'hi','18:06:29.712289','2024-03-04',3,2),
(2,'heyy','18:07:00.000000','2024-03-04',2,3);

/*Table structure for table `law_complaint_table` */

DROP TABLE IF EXISTS `law_complaint_table`;

CREATE TABLE `law_complaint_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `complaint` varchar(1000) NOT NULL,
  `date` date NOT NULL,
  `reply` varchar(2000) NOT NULL,
  `USER_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Law_complaint_table_USER_id_78b89b1b_fk_Law_user_table_id` (`USER_id`),
  CONSTRAINT `Law_complaint_table_USER_id_78b89b1b_fk_Law_user_table_id` FOREIGN KEY (`USER_id`) REFERENCES `law_user_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `law_complaint_table` */

insert  into `law_complaint_table`(`id`,`complaint`,`date`,`reply`,`USER_id`) values 
(1,'not working','2024-03-04','okk',1);

/*Table structure for table `law_court_table` */

DROP TABLE IF EXISTS `law_court_table`;

CREATE TABLE `law_court_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `court_name` varchar(300) NOT NULL,
  `place` varchar(300) NOT NULL,
  `phone` varchar(300) NOT NULL,
  `email` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `law_court_table` */

/*Table structure for table `law_dataset_table` */

DROP TABLE IF EXISTS `law_dataset_table`;

CREATE TABLE `law_dataset_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `question` varchar(2000) NOT NULL,
  `answer` varchar(2000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `law_dataset_table` */

insert  into `law_dataset_table`(`id`,`question`,`answer`) values 
(1,'abbbbbb','qwwerrttt'),
(2,'qwwwwwew','eeeeeee');

/*Table structure for table `law_evidence_table` */

DROP TABLE IF EXISTS `law_evidence_table`;

CREATE TABLE `law_evidence_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `evidence` varchar(100) NOT NULL,
  `details` varchar(100) NOT NULL,
  `BOOKING_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Law_evidence_table_BOOKING_id_b2ec0331_fk_Law_booking_table_id` (`BOOKING_id`),
  CONSTRAINT `Law_evidence_table_BOOKING_id_b2ec0331_fk_Law_booking_table_id` FOREIGN KEY (`BOOKING_id`) REFERENCES `law_booking_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `law_evidence_table` */

insert  into `law_evidence_table`(`id`,`date`,`evidence`,`details`,`BOOKING_id`) values 
(1,'2024-03-04','Screenshot (1).png','rewqerwqrewqt',1);

/*Table structure for table `law_feedback_table` */

DROP TABLE IF EXISTS `law_feedback_table`;

CREATE TABLE `law_feedback_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `feedback` varchar(1000) NOT NULL,
  `rating` double NOT NULL,
  `date` date NOT NULL,
  `ADVOCATE_id` bigint NOT NULL,
  `USERID_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Law_feedback_table_ADVOCATE_id_d5793b42_fk_Law_advocate_table_id` (`ADVOCATE_id`),
  KEY `Law_feedback_table_USERID_id_b44a4269_fk_Law_user_table_id` (`USERID_id`),
  CONSTRAINT `Law_feedback_table_ADVOCATE_id_d5793b42_fk_Law_advocate_table_id` FOREIGN KEY (`ADVOCATE_id`) REFERENCES `law_advocate_table` (`id`),
  CONSTRAINT `Law_feedback_table_USERID_id_b44a4269_fk_Law_user_table_id` FOREIGN KEY (`USERID_id`) REFERENCES `law_user_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `law_feedback_table` */

insert  into `law_feedback_table`(`id`,`feedback`,`rating`,`date`,`ADVOCATE_id`,`USERID_id`) values 
(1,'good job ',4.5,'2024-03-04',1,1),
(2,'good',3,'2024-03-06',1,2),
(3,'good',5,'2024-03-06',2,2);

/*Table structure for table `law_hearing_date` */

DROP TABLE IF EXISTS `law_hearing_date`;

CREATE TABLE `law_hearing_date` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `time` time(6) NOT NULL,
  `Case_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Law_hearing_date_Case_id_52e54347_fk_Law_booking_table_id` (`Case_id`),
  CONSTRAINT `Law_hearing_date_Case_id_52e54347_fk_Law_booking_table_id` FOREIGN KEY (`Case_id`) REFERENCES `law_booking_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `law_hearing_date` */

insert  into `law_hearing_date`(`id`,`date`,`time`,`Case_id`) values 
(1,'2024-03-21','20:04:00.000000',1);

/*Table structure for table `law_login_table` */

DROP TABLE IF EXISTS `law_login_table`;

CREATE TABLE `law_login_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `law_login_table` */

insert  into `law_login_table`(`id`,`username`,`password`,`type`) values 
(1,'admin','admin','admin'),
(2,'aku','123','advocate'),
(3,'user','123','user'),
(4,'asss','6yuuu','user'),
(5,'abc','123','advocate');

/*Table structure for table `law_notification` */

DROP TABLE IF EXISTS `law_notification`;

CREATE TABLE `law_notification` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `notification` varchar(1000) NOT NULL,
  `date` date NOT NULL,
  `time` time(6) NOT NULL,
  `BOOKING_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Law_notification_BOOKING_id_18aa9315_fk_Law_booking_table_id` (`BOOKING_id`),
  CONSTRAINT `Law_notification_BOOKING_id_18aa9315_fk_Law_booking_table_id` FOREIGN KEY (`BOOKING_id`) REFERENCES `law_booking_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `law_notification` */

insert  into `law_notification`(`id`,`notification`,`date`,`time`,`BOOKING_id`) values 
(1,'weqreqwr','2024-03-01','01:00:00.000000',1),
(2,'qrwqrewqtewtyrewyrey','2024-03-04','09:05:29.129324',1),
(3,'hjfsadhaksfj\r\n','2024-03-04','09:34:04.684221',1);

/*Table structure for table `law_payment` */

DROP TABLE IF EXISTS `law_payment`;

CREATE TABLE `law_payment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `amount` double NOT NULL,
  `date` date NOT NULL,
  `status` varchar(100) NOT NULL,
  `type` varchar(50) NOT NULL,
  `ADVOCATE_id` bigint NOT NULL,
  `USER_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Law_payment_ADVOCATE_id_49e18616_fk_Law_advocate_table_id` (`ADVOCATE_id`),
  KEY `Law_payment_USER_id_34d7c607_fk_Law_user_table_id` (`USER_id`),
  CONSTRAINT `Law_payment_ADVOCATE_id_49e18616_fk_Law_advocate_table_id` FOREIGN KEY (`ADVOCATE_id`) REFERENCES `law_advocate_table` (`id`),
  CONSTRAINT `Law_payment_USER_id_34d7c607_fk_Law_user_table_id` FOREIGN KEY (`USER_id`) REFERENCES `law_user_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `law_payment` */

insert  into `law_payment`(`id`,`amount`,`date`,`status`,`type`,`ADVOCATE_id`,`USER_id`) values 
(1,230,'2024-03-04','PAID','online',1,1);

/*Table structure for table `law_prediction` */

DROP TABLE IF EXISTS `law_prediction`;

CREATE TABLE `law_prediction` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `qid_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `ans` varchar(500) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Law_prediction_user_id_7d60efaa_fk_Law_user_table_id` (`user_id`),
  KEY `Law_prediction_qid_id_98c3f214_fk_Law_section_question_table_id` (`qid_id`),
  CONSTRAINT `Law_prediction_qid_id_98c3f214_fk_Law_section_question_table_id` FOREIGN KEY (`qid_id`) REFERENCES `law_section_question_table` (`id`),
  CONSTRAINT `Law_prediction_user_id_7d60efaa_fk_Law_user_table_id` FOREIGN KEY (`user_id`) REFERENCES `law_user_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `law_prediction` */

insert  into `law_prediction`(`id`,`date`,`qid_id`,`user_id`,`ans`) values 
(1,'2024-03-06',1,1,'yes'),
(2,'2024-03-06',2,1,'no'),
(3,'2024-03-06',3,1,'yes'),
(4,'2024-03-06',4,1,'yes'),
(5,'2024-03-06',1,1,'yes'),
(6,'2024-03-06',2,1,'no'),
(7,'2024-03-06',3,1,'yes'),
(8,'2024-03-06',4,1,'yes'),
(9,'2024-03-06',1,1,'yes'),
(10,'2024-03-06',2,1,'yes'),
(11,'2024-03-06',3,1,'yes'),
(12,'2024-03-06',4,1,'yes');

/*Table structure for table `law_section_question_table` */

DROP TABLE IF EXISTS `law_section_question_table`;

CREATE TABLE `law_section_question_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `question` varchar(1000) NOT NULL,
  `answer` varchar(1000) NOT NULL,
  `section` varchar(100) NOT NULL,
  `punishment` varchar(1000) NOT NULL,
  `SECTION_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Law_section_question_SECTION_id_9ab09ecb_fk_Law_secti` (`SECTION_id`),
  CONSTRAINT `Law_section_question_SECTION_id_9ab09ecb_fk_Law_secti` FOREIGN KEY (`SECTION_id`) REFERENCES `law_section_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `law_section_question_table` */

insert  into `law_section_question_table`(`id`,`question`,`answer`,`section`,`punishment`,`SECTION_id`) values 
(1,'Did you operate a motor vehicle while under the influence of alcohol?','yes','IPC Section: 185','Fine and/or imprisonment up to 6 months (first offense), or both',1),
(2,'Did you cause injury to another person while driving drunk?','yes','IPC 337','Imprisonment up to 3 years and/or fine',1),
(3,'Did you cause the death of another person while driving drunk?','yes','IPC 304A','Imprisonment up to 10 years and/or fine',1),
(4,'Were you involved in an accident while driving under the influence of alcohol?','yes','IPC 555','Imprisonment up to 2 years or fine, or both',1);

/*Table structure for table `law_section_table` */

DROP TABLE IF EXISTS `law_section_table`;

CREATE TABLE `law_section_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `case_type` varchar(1000) NOT NULL,
  `sections` varchar(30) NOT NULL,
  `details` varchar(10000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `law_section_table` */

insert  into `law_section_table`(`id`,`case_type`,`sections`,`details`) values 
(1,'Accident case','IPC 306','YREDYRE'),
(2,'robberry','IPC 305','gfhgdfhgd'),
(5,'wqr','ghfgj','ghf\r\n');

/*Table structure for table `law_user_table` */

DROP TABLE IF EXISTS `law_user_table`;

CREATE TABLE `law_user_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `age` int NOT NULL,
  `gender` varchar(10) NOT NULL,
  `address` varchar(100) NOT NULL,
  `place` varchar(100) NOT NULL,
  `post` varchar(100) NOT NULL,
  `pincode` int NOT NULL,
  `phone` bigint NOT NULL,
  `email` varchar(20) NOT NULL,
  `image` varchar(100) NOT NULL,
  `LOGIN_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Law_user_table_LOGIN_id_c3769e0b_fk_Law_login_table_id` (`LOGIN_id`),
  CONSTRAINT `Law_user_table_LOGIN_id_c3769e0b_fk_Law_login_table_id` FOREIGN KEY (`LOGIN_id`) REFERENCES `law_login_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `law_user_table` */

insert  into `law_user_table`(`id`,`firstname`,`lastname`,`age`,`gender`,`address`,`place`,`post`,`pincode`,`phone`,`email`,`image`,`LOGIN_id`) values 
(1,'qqq','www',22,'m','dd','ee','ee',345678,8908908909,'ww','dd',3),
(2,'adfc','fgv',22,'Female','ffc','ccc','cccv',677,6777,'sdfv','Screenshot_20240302-155039_CASA_CARE.jpg',4);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
