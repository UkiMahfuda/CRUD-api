/*
SQLyog Enterprise v13.1.1 (64 bit)
MySQL - 10.4.27-MariaDB : Database - db_peminjaman
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_peminjaman` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `db_peminjaman`;

/*Table structure for table `tbl_brg` */

DROP TABLE IF EXISTS `tbl_brg`;

CREATE TABLE `tbl_brg` (
  `id_brg` int(11) NOT NULL,
  `nama_brg` varchar(255) DEFAULT NULL,
  `jumlah_ketersediaan` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_brg`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tbl_brg` */

insert  into `tbl_brg`(`id_brg`,`nama_brg`,`jumlah_ketersediaan`) values 
(0,'Meja','2'),
(1,'Sound System','5'),
(2,'Kursi','4'),
(3,'Keyboard','5'),
(4,'Spidol','2');

/*Table structure for table `tbl_peminjaman` */

DROP TABLE IF EXISTS `tbl_peminjaman`;

CREATE TABLE `tbl_peminjaman` (
  `id` int(11) NOT NULL,
  `id_ruang` int(11) DEFAULT NULL,
  `id_brg` int(11) DEFAULT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `npm` int(8) DEFAULT NULL,
  `lama_pinjam` varchar(8) DEFAULT NULL,
  `alasan` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_ruang` (`id_ruang`),
  KEY `id_brg` (`id_brg`),
  CONSTRAINT `tbl_peminjaman_ibfk_1` FOREIGN KEY (`id_ruang`) REFERENCES `tbl_ruangan` (`id_ruang`),
  CONSTRAINT `tbl_peminjaman_ibfk_2` FOREIGN KEY (`id_brg`) REFERENCES `tbl_brg` (`id_brg`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tbl_peminjaman` */

insert  into `tbl_peminjaman`(`id`,`id_ruang`,`id_brg`,`nama`,`npm`,`lama_pinjam`,`alasan`) values 
(21,11,1,'Akhfee Lauki',21312109,'2','Seminar'),
(22,13,3,'Uki Mahfuda',21312111,'3','Seminar');

/*Table structure for table `tbl_ruangan` */

DROP TABLE IF EXISTS `tbl_ruangan`;

CREATE TABLE `tbl_ruangan` (
  `id_ruang` int(11) NOT NULL,
  `nama_ruang` varchar(255) DEFAULT NULL,
  `kap_ruangan` varchar(255) DEFAULT NULL,
  `gedung` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_ruang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tbl_ruangan` */

insert  into `tbl_ruangan`(`id_ruang`,`nama_ruang`,`kap_ruangan`,`gedung`) values 
(11,'Lab 1 GSG','40','Ged GSG'),
(12,'Lab 2 GSG','40','Ged GSG'),
(13,'Lab 3 GSG','45','Ged GSG'),
(14,'Lab 4 GSG','45','Ged GSG');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
