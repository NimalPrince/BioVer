-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 10, 2023 at 08:22 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vein`
--

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `id` int(11) NOT NULL,
  `uid` varchar(50) NOT NULL,
  `pwd` varchar(50) NOT NULL,
  `typ` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`id`, `uid`, `pwd`, `typ`) VALUES
(1, 'admin', 'admin', 'admin'),
(2, 'person2', 'trinity', 'stf'),
(3, 'person3', 'asd', 'stf');

-- --------------------------------------------------------

--
-- Table structure for table `scan`
--

CREATE TABLE `scan` (
  `id` int(11) NOT NULL,
  `titl` varchar(200) NOT NULL,
  `pic` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `scan`
--

INSERT INTO `scan` (`id`, `titl`, `pic`) VALUES
(1, 'crime no121', 'image_0_252.bmp'),
(2, 'testing 1', 'image_0_832.bmp'),
(3, 'asd', '21__M_Left_middle_finger.BMP'),
(4, 'sdf', '147__M_Left_middle_finger.BMP'),
(5, 'testing 1', '1__M_Right_middle_finger.BMP'),
(6, 'test', 'image_0_913.bmp'),
(7, 'sdf', 'image_0_166.bmp'),
(8, 'asd', '1.bmp');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `id` int(11) NOT NULL,
  `nme` varchar(100) NOT NULL,
  `crid` varchar(10) NOT NULL,
  `crm` text NOT NULL,
  `pic` varchar(50) NOT NULL,
  `f1` varchar(50) NOT NULL,
  `f2` varchar(50) NOT NULL,
  `f3` varchar(50) NOT NULL,
  `f4` varchar(50) NOT NULL,
  `f5` varchar(50) NOT NULL,
  `f6` varchar(50) NOT NULL,
  `f7` varchar(50) NOT NULL,
  `f8` varchar(50) NOT NULL,
  `f9` varchar(50) NOT NULL,
  `f10` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`id`, `nme`, `crid`, `crm`, `pic`, `f1`, `f2`, `f3`, `f4`, `f5`, `f6`, `f7`, `f8`, `f9`, `f10`) VALUES
(1, 'Vineeth', 'v101', 'murder, in criminal law, the unjustified killing o...', '1.png', '1__M_Left_index_finger.BMP', '1__M_Left_little_finger.BMP', '1__M_Left_middle_finger.BMP', '1__M_Left_ring_finger.BMP', '1__M_Left_thumb_finger.BMP', '1__M_Right_index_finger.BMP', '1__M_Right_little_finger.BMP', '1__M_Right_middle_finger.BMP', '1__M_Right_ring_finger.BMP', '1__M_Right_thumb_finger.BMP'),
(2, 'Rajeev', 'cr101', 'murder, in criminal law, the unjustified killing of one person by another, usually distinguished from the crime of manslaughter by the element of malice', '123.jpg', '2__F_Left_index_finger.BMP', '2__F_Left_little_finger.BMP', '2__F_Left_middle_finger.BMP', '2__F_Left_ring_finger.BMP', '2__F_Left_thumb_finger.BMP', '2__F_Right_index_finger.BMP', '2__F_Right_little_finger.BMP', '2__F_Right_middle_finger.BMP', '2__F_Right_ring_finger.BMP', '2__F_Right_thumb_finger.BMP'),
(3, 'Gopan', 'cr102', 'In ordinary language, a crime is an unlawful act punishable by a state ; The notion that acts such as murder ; The state (government) ', '1__M_Left_index_finger.BMP', '3__M_Left_index_finger.BMP', '3__M_Left_little_finger.BMP', '3__M_Left_middle_finger.BMP', '3__M_Left_ring_finger.BMP', '3__M_Left_thumb_finger.BMP', '3__M_Right_index_finger.BMP', '3__M_Right_little_finger.BMP', '3__M_Right_middle_finger.BMP', '3__M_Right_ring_finger.BMP', '3__M_Right_thumb_finger.BMP'),
(4, 'Gopakumar', 'person2', 'trinity\r\ntrivandrum', 'b2.jpg', '1.bmp', '2.bmp', '3.bmp', '4.bmp', '5.bmp', '6.bmp', '7.bmp', '8.bmp', '9.bmp', '10.bmp'),
(5, 'bijukuttan', 'person3', 'tvm', 'bttr.jpg', '1.bmp', '2.bmp', '3.bmp', '4.bmp', '5.bmp', '6.bmp', '7.bmp', '8.bmp', '9.bmp', '10.bmp');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `scan`
--
ALTER TABLE `scan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `scan`
--
ALTER TABLE `scan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
