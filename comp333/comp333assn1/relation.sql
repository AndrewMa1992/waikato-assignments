-- phpMyAdmin SQL Dump
-- version 4.4.10
-- http://www.phpmyadmin.net
--
-- Host: localhost:8889
-- Generation Time: Jan 28, 2016 at 02:47 AM
-- Server version: 5.5.42
-- PHP Version: 5.6.10


--
-- Database: `COMP333`
--

-- --------------------------------------------------------

--
-- Table structure for table `relation`
--

CREATE TABLE `relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `stockid` int(11) NOT NULL,
  `visible` bit DEFAULT 1,
  `notes` varchar(1000),
  PRIMARY KEY (`id`)
);
ALTER TABLE `relation` ADD FOREIGN KEY (uid) REFERENCES `Users` (`uid`);
ALTER TABLE `relation` ADD FOREIGN KEY (stockid) REFERENCES `Stocks` (`id`);

--
-- Dumping data for table `Users`
--

INSERT INTO `relation` (`id`,`uid`, `stockid`,`visible`,`notes`) VALUES
(1, 1, 1,0,''),
(2, 1, 2,1,''),
(3, 1, 3,1,''),
(4, 1, 4,1,''),
(5, 1, 5,1,''),
(6, 1, 6,0,''),
(7, 2, 1,1,''),
(8, 2, 2,1,''),
(9, 2, 3,1,''),
(10, 2, 4,1,''),
(11, 2, 5,1,''),
(12, 2, 6,1,''),
(13, 3, 1,1,''),
(14, 3, 2,1,''),
(15, 3, 3,1,''),
(16, 3, 4,1,''),
(17, 3, 5,1,''),
(18, 3, 6,1,''),
(19, 4, 1,1,''),
(20, 4, 2,1,''),
(21, 4, 3,1,''),
(22, 4, 4,1,''),
(23, 4, 5,1,''),
(24, 4, 6,1,'')


