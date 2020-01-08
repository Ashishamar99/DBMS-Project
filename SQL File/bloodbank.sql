-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 08, 2020 at 06:37 PM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bloodbank`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `decquan` (IN `rbgname` CHAR(5))  BEGIN
declare rquan int default 350;
declare iquan int default 0;
select quantity into iquan from inventory where bgname=rbgname;
update inventory set quantity=iquan-rquan where bgname=rbgname;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `incquan` (IN `dbgname` CHAR(5))  BEGIN
declare dquan int default 350;
declare iquan int default 0;
select quantity into iquan from inventory where bgname=dbgname;
update inventory set quantity=iquan+dquan where bgname=dbgname;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `id` int(11) NOT NULL,
  `doctorname` char(10) DEFAULT NULL,
  `doctoraddress` char(10) DEFAULT NULL,
  `doctorcontact` char(11) DEFAULT NULL,
  `doctorbg` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `donor`
--

CREATE TABLE `donor` (
  `id` int(11) NOT NULL,
  `name` char(10) DEFAULT NULL,
  `gender` char(10) DEFAULT NULL,
  `address` char(10) DEFAULT NULL,
  `date` char(10) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `contact` char(11) DEFAULT NULL,
  `bg` char(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Triggers `donor`
--
DELIMITER $$
CREATE TRIGGER `updateinvincre` AFTER INSERT ON `donor` FOR EACH ROW BEGIN
DECLARE donbgname char(10) DEFAULT '';
select bg into donbgname from donor WHERE id=new.id;
call incquan(donbgname);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `id` int(11) NOT NULL,
  `bgname` char(10) NOT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `logindetails`
--

CREATE TABLE `logindetails` (
  `username` char(10) DEFAULT NULL,
  `passwd` char(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `receiver`
--

CREATE TABLE `receiver` (
  `id` int(11) NOT NULL,
  `receivername` char(10) DEFAULT NULL,
  `gender` char(10) DEFAULT NULL,
  `address` char(10) DEFAULT NULL,
  `date` char(10) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `contact` char(11) DEFAULT NULL,
  `bg` char(5) DEFAULT NULL,
  `doctorname` char(10) DEFAULT NULL,
  `donorid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Triggers `receiver`
--
DELIMITER $$
CREATE TRIGGER `updateinvdecre` AFTER INSERT ON `receiver` FOR EACH ROW BEGIN
DECLARE recbgname char(10) DEFAULT '';
select bg into recbgname from receiver WHERE id=new.id;
call decquan(recbgname);
END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `donor`
--
ALTER TABLE `donor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `receiver`
--
ALTER TABLE `receiver`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `doctor`
--
ALTER TABLE `doctor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3012;

--
-- AUTO_INCREMENT for table `donor`
--
ALTER TABLE `donor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1044;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4005;

--
-- AUTO_INCREMENT for table `receiver`
--
ALTER TABLE `receiver`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2002;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
