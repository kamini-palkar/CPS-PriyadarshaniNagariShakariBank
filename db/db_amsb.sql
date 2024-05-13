-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 09, 2024 at 12:34 PM
-- Server version: 5.7.31
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_amsb`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_accountholdermaster`
--

DROP TABLE IF EXISTS `tb_accountholdermaster`;
CREATE TABLE IF NOT EXISTS `tb_accountholdermaster` (
  `ach_Id` int(11) NOT NULL AUTO_INCREMENT,
  `ach_account_No` int(12) NOT NULL,
  `ach_account_Name` varchar(40) NOT NULL,
  `ach_Bearer_Order` int(1) NOT NULL,
  `ach_Transaction_Code` int(15) NOT NULL,
  `ach_At_Par` int(1) NOT NULL,
  `ach_Joint_Name1` varchar(40) NOT NULL,
  `ach_Joint_Name2` varchar(40) NOT NULL,
  `ach_Authorized_Signatory1` varchar(25) NOT NULL,
  `ach_Authorized_Signatory2` varchar(25) NOT NULL,
  `ach_Authorized_Signatory3` varchar(25) NOT NULL,
  `ach_Address1` varchar(200) NOT NULL,
  `ach_Address2` varchar(200) NOT NULL,
  `ach_Suburb` int(10) NOT NULL,
  `ach_City` int(10) NOT NULL,
  `ach_State` int(6) NOT NULL,
  `ach_Country` int(3) NOT NULL,
  `ach_Pincode` int(12) NOT NULL,
  `ach_Telephone_Residence` int(12) NOT NULL,
  `ach_Telephone_Office` int(12) NOT NULL,
  `ach_Mobile_No` int(12) NOT NULL,
  `ach_Branch` int(11) NOT NULL,
  `ach_emailId` varchar(30) NOT NULL,
  PRIMARY KEY (`ach_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_accountholdermaster`
--

INSERT INTO `tb_accountholdermaster` (`ach_Id`, `ach_account_No`, `ach_account_Name`, `ach_Bearer_Order`, `ach_Transaction_Code`, `ach_At_Par`, `ach_Joint_Name1`, `ach_Joint_Name2`, `ach_Authorized_Signatory1`, `ach_Authorized_Signatory2`, `ach_Authorized_Signatory3`, `ach_Address1`, `ach_Address2`, `ach_Suburb`, `ach_City`, `ach_State`, `ach_Country`, `ach_Pincode`, `ach_Telephone_Residence`, `ach_Telephone_Office`, `ach_Mobile_No`, `ach_Branch`, `ach_emailId`) VALUES
(1, 1001223322, 'RAKESH SHAH', 0, 1, 0, 'RAKESH LUCKY', '', 'SIGN 1', '', '', 'VIKRILI', 'VIKRILI', 3, 1, 1, 105, 400030, 2147483647, 2147483647, 2147483647, 2, 'ach@gmail.com'),
(2, 1001223311, 'LIJESH SHARMA', 0, 1, 0, 'RAKESH LUCKY', '', 'SIGN 1', '', '', 'VIKRILI', 'VIKRILI', 3, 1, 1, 105, 400030, 2147483647, 2147483647, 2147483647, 5, 'lig@gmail.com'),
(5, 1001223344, 'RAKESH SHAHP', 0, 1, 0, 'RAKESH LUCKY', '', 'SIGN 1', '', '', 'VIKRILI', 'VIKRILI', 3, 1, 1, 105, 400030, 2147483647, 2147483647, 2147483647, 0, ''),
(6, 1001223341, 'HSDF', 0, 1, 0, '', '', 'SIGN 1', '', '', 'VIKRILI', 'VIKRILI', 3, 1, 1, 105, 400030, 2147483647, 2147483647, 2147483647, 0, 'ach@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `tb_bankdetails`
--

DROP TABLE IF EXISTS `tb_bankdetails`;
CREATE TABLE IF NOT EXISTS `tb_bankdetails` (
  `bank_id` int(4) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `bank_name` varchar(100) NOT NULL,
  `bank_code` int(3) UNSIGNED ZEROFILL NOT NULL,
  `bank_address1` text NOT NULL,
  `bank_address2` varchar(36) NOT NULL,
  `bank_address3` varchar(36) NOT NULL,
  `bank_country_id` int(3) NOT NULL,
  `bank_state_id` int(3) NOT NULL,
  `bank_city_id` int(3) NOT NULL,
  `bank_suburb_id` int(3) NOT NULL,
  `bank_pin` varchar(15) NOT NULL,
  `bank_contact_no1` varchar(15) NOT NULL,
  `bank_contact_no2` varchar(15) NOT NULL,
  `bank_contact_per1` varchar(40) NOT NULL,
  `bank_contact_per2` varchar(40) NOT NULL,
  `bank_contact_per_LL1` int(12) NOT NULL,
  `bank_contact_per_LL2` int(12) NOT NULL,
  `bank_emailid2` varchar(30) NOT NULL,
  `bank_emailid` varchar(40) NOT NULL,
  `bank_website` varchar(40) NOT NULL,
  `bank_printers` text NOT NULL,
  PRIMARY KEY (`bank_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_bankdetails`
--

INSERT INTO `tb_bankdetails` (`bank_id`, `bank_name`, `bank_code`, `bank_address1`, `bank_address2`, `bank_address3`, `bank_country_id`, `bank_state_id`, `bank_city_id`, `bank_suburb_id`, `bank_pin`, `bank_contact_no1`, `bank_contact_no2`, `bank_contact_per1`, `bank_contact_per2`, `bank_contact_per_LL1`, `bank_contact_per_LL2`, `bank_emailid2`, `bank_emailid`, `bank_website`, `bank_printers`) VALUES
(0001, 'AMBIKA MAHILA SAHAKARI BANK', 804, 'HEAD OFFICE,MONDHA MARKET,', 'AT. PO. TAL. - PARLI VAIJNATH', 'DIST - BEED 431515', 1, 2, 1, 1, '414001', '', '', 'KIRAN BHANDARE', 'SACHIN GUTTE', 2147483647, 2147483647, '', '', '', 'a:1:{i:0;a:3:{i:0;s:30:\"NPIA705BA (HPf LaserJet M403n)\";i:1;s:4:\"try1\";i:2;s:4:\"try2\";}}');

-- --------------------------------------------------------

--
-- Table structure for table `tb_branchdetails`
--

DROP TABLE IF EXISTS `tb_branchdetails`;
CREATE TABLE IF NOT EXISTS `tb_branchdetails` (
  `branch_id` int(200) NOT NULL AUTO_INCREMENT,
  `branch_code` varchar(10) NOT NULL,
  `branch_name` varchar(100) NOT NULL,
  `branch_micr` varchar(20) NOT NULL,
  `branch_atparmicrcode` varchar(20) NOT NULL,
  `branch_address1` varchar(85) NOT NULL,
  `branch_address2` varchar(65) NOT NULL,
  `branch_address3` varchar(85) NOT NULL,
  `branch_country_id` int(3) NOT NULL DEFAULT '0',
  `branch_state_id` int(11) NOT NULL,
  `branch_city_id` int(11) NOT NULL,
  `branch_suburb_id` int(4) NOT NULL,
  `branch_pin` int(15) NOT NULL,
  `branch_telephone1` varchar(12) NOT NULL,
  `branch_telephone2` varchar(12) NOT NULL,
  `branch_contactperson1` varchar(50) NOT NULL,
  `branch_contactperson2` varchar(50) NOT NULL,
  `branch_contactpersonmobile1` varchar(50) NOT NULL,
  `branch_contactpersonmobile2` varchar(50) NOT NULL,
  `branch_email1` varchar(30) NOT NULL,
  `branch_email2` varchar(30) NOT NULL,
  `branch_holiday` varchar(20) DEFAULT NULL,
  `branch_neftifsccode` varchar(20) NOT NULL,
  `branch_printers` text,
  `branch_working_hours` float DEFAULT NULL,
  `branch_clearingthrough` tinyint(1) NOT NULL DEFAULT '0',
  `branch_clearingcenter` tinyint(1) NOT NULL DEFAULT '0',
  `clr_bank_code` varchar(15) NOT NULL,
  `clr_bank_city` int(5) NOT NULL,
  `branch_City_Code` int(3) UNSIGNED ZEROFILL NOT NULL,
  `branch_Services` varchar(100) NOT NULL,
  `branch_reg_busi_hrs` varchar(100) NOT NULL,
  `branch_half_busi_hrs` varchar(100) NOT NULL,
  `branch_sunday_working` varchar(100) NOT NULL,
  `branch_tollfree_no` varchar(20) NOT NULL,
  `branch_sub_code` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`branch_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_branchdetails`
--

INSERT INTO `tb_branchdetails` (`branch_id`, `branch_code`, `branch_name`, `branch_micr`, `branch_atparmicrcode`, `branch_address1`, `branch_address2`, `branch_address3`, `branch_country_id`, `branch_state_id`, `branch_city_id`, `branch_suburb_id`, `branch_pin`, `branch_telephone1`, `branch_telephone2`, `branch_contactperson1`, `branch_contactperson2`, `branch_contactpersonmobile1`, `branch_contactpersonmobile2`, `branch_email1`, `branch_email2`, `branch_holiday`, `branch_neftifsccode`, `branch_printers`, `branch_working_hours`, `branch_clearingthrough`, `branch_clearingcenter`, `clr_bank_code`, `clr_bank_city`, `branch_City_Code`, `branch_Services`, `branch_reg_busi_hrs`, `branch_half_busi_hrs`, `branch_sunday_working`, `branch_tollfree_no`, `branch_sub_code`) VALUES
(1, '002', 'MAIN BRANCH', '414804001', '', 'H.NO. 4638, PANCHPIR CHAWADI', ' MALIWADA, AHMEDNAGAR', '', 1, 2, 1, 1, 414001, '0241-2359855', '', '', '', '9075020969 ', '', '', '', NULL, 'SVCB0054002', NULL, NULL, 0, 0, '', 0, 414, '', '', '', '', '', '002'),
(2, '004', 'PIPLINE ROAD', '414804002', '', 'SRV. NO. 24/1B/2B/1A7, PLOT NO -28, BHISTBAUGH, PIPELINE RAOD', 'SAVEDI, AHMEDNAGAR', '', 1, 2, 1, 2, 431007, '0241-2425794', '', '', '', '9075020970', '', '', '', NULL, 'SVCB0054004', NULL, NULL, 0, 0, '', 0, 414, '', '', '', '', '', '004'),
(3, '003', 'BALIKASHRAM ROAD', '431804003', '', 'SRV. NO. 145/2/3, NEAR POLICE COLONY', 'BALIKASHRAN ROAD. AHMEDNAGAR', '', 1, 2, 1, 1, 413512, '0241-2323696', '', '', '', '9075020974 ', '', '', '', NULL, 'SVCB0054003', NULL, NULL, 0, 0, '', 0, 431, '', '', '', '', '', '003'),
(4, '005', 'SARAS NAGAR', '431804005', '', 'PLOT NO-93, BEHIND MARKET YARD, NEXT TO OLD BRIDGE', ' SARAS NAGAR, AHMEDNAGAR', '', 1, 2, 1, 2, 431517, '', '', '', '', '', '', '', '', NULL, 'SVCB0054005', NULL, NULL, 0, 0, '', 0, 431, '', '', '', '', '', '005'),
(5, '006', 'NAGAPUR BRANCH', '431804006', '', 'SRV NO 8/1, KAKASAHEB MHASKE COLLAGE ROAD', 'CLASSIC HOTEL BACK SIDE, NAGARPUR, AHMEDNAGAR', '', 1, 2, 1, 3, 414003, '', '', '', '', '', '', '', '', NULL, 'SVCB0054006', NULL, NULL, 0, 0, '', 0, 431, '', '', '', '', '', '006');

-- --------------------------------------------------------

--
-- Table structure for table `tb_citymaster`
--

DROP TABLE IF EXISTS `tb_citymaster`;
CREATE TABLE IF NOT EXISTS `tb_citymaster` (
  `city_id` int(3) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `city_code` varchar(7) NOT NULL,
  `city_place` varchar(30) NOT NULL,
  `city_name_al` varchar(4) NOT NULL,
  `country_id` int(200) NOT NULL,
  `state_id` int(200) NOT NULL,
  `is_delete` int(2) NOT NULL,
  PRIMARY KEY (`city_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_citymaster`
--

INSERT INTO `tb_citymaster` (`city_id`, `city_code`, `city_place`, `city_name_al`, `country_id`, `state_id`, `is_delete`) VALUES
(001, 'AHM001', 'AHMEDNAGAR', 'AHM', 1, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tb_countrymaster`
--

DROP TABLE IF EXISTS `tb_countrymaster`;
CREATE TABLE IF NOT EXISTS `tb_countrymaster` (
  `country_id` int(250) NOT NULL AUTO_INCREMENT,
  `country_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `country_code` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `country_isdelete` int(2) NOT NULL,
  PRIMARY KEY (`country_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tb_countrymaster`
--

INSERT INTO `tb_countrymaster` (`country_id`, `country_name`, `country_code`, `country_isdelete`) VALUES
(1, 'INDIA', 'IND', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tb_cps_adminpasswords`
--

DROP TABLE IF EXISTS `tb_cps_adminpasswords`;
CREATE TABLE IF NOT EXISTS `tb_cps_adminpasswords` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adminid` int(11) NOT NULL,
  `password` int(11) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_cps_adminpasswords`
--

INSERT INTO `tb_cps_adminpasswords` (`id`, `adminid`, `password`, `date`) VALUES
(1, 0, 0, '2012-09-28'),
(2, 0, 192023, '2012-09-28'),
(3, 0, 466, '2013-04-10'),
(4, 0, 1, '2013-04-10'),
(5, 0, 0, '2013-04-10'),
(6, 0, 16, '2013-04-10'),
(7, 0, 192023, '2013-09-25'),
(8, 0, 0, '2013-09-25'),
(9, 0, 192023, '2014-01-02'),
(10, 0, 21232, '2014-01-02'),
(11, 0, 192023, '2014-01-03'),
(12, 0, 0, '2014-01-03'),
(13, 0, 0, '2014-01-08'),
(14, 0, 7, '2014-01-08'),
(15, 0, 9, '2014-01-28'),
(16, 0, 0, '2014-01-28'),
(17, 0, 3407936, '2014-01-28'),
(18, 0, 192023, '2014-02-03'),
(19, 0, 14, '2014-02-03'),
(20, 0, 192023, '2014-02-05'),
(21, 0, 0, '2014-02-05'),
(22, 0, 1, '2014-02-15'),
(23, 0, 8, '2014-02-15'),
(24, 0, 192023, '2015-02-14'),
(25, 0, 0, '2015-02-14'),
(26, 2079, 192023, '2015-06-02'),
(27, 0, 1, '2016-01-13'),
(28, 0, 25, '2016-01-18'),
(29, 0, 192023, '2016-01-18'),
(30, 0, 0, '2016-01-18'),
(31, 0, 202, '2016-01-19'),
(32, 0, 250, '2016-01-19'),
(33, 0, 192023, '2016-01-19'),
(34, 0, 0, '2016-01-19'),
(35, 0, 1, '2016-01-19'),
(36, 0, 7113, '2016-01-29'),
(37, 0, 0, '2023-01-21'),
(38, 0, 0, '2023-01-21'),
(39, 0, 6835, '2023-01-21'),
(40, 0, 6444, '2023-01-21'),
(41, 0, 2, '2023-05-06'),
(42, 0, 9, '2023-05-06');

-- --------------------------------------------------------

--
-- Table structure for table `tb_cps_chequeseries`
--

DROP TABLE IF EXISTS `tb_cps_chequeseries`;
CREATE TABLE IF NOT EXISTS `tb_cps_chequeseries` (
  `series_id` int(11) NOT NULL AUTO_INCREMENT,
  `series_transationcode` int(2) NOT NULL,
  `series_branchcode` int(3) NOT NULL,
  `serise_branchcode_branch` int(11) NOT NULL,
  `series_from` int(6) UNSIGNED ZEROFILL NOT NULL,
  `series_to` int(6) UNSIGNED ZEROFILL NOT NULL,
  `series_lastno` int(6) UNSIGNED ZEROFILL NOT NULL,
  `serise_Bank` int(3) NOT NULL,
  `branch_sub_code` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`series_id`)
) ENGINE=MyISAM AUTO_INCREMENT=194 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tb_cps_chequeseries`
--

INSERT INTO `tb_cps_chequeseries` (`series_id`, `series_transationcode`, `series_branchcode`, `serise_branchcode_branch`, `series_from`, `series_to`, `series_lastno`, `serise_Bank`, `branch_sub_code`) VALUES
(180, 13, 2, 4, 000001, 555555, 000562, 1, '004'),
(181, 11, 35, 152, 000001, 555555, 001857, 1, '003'),
(183, 10, 4, 152, 111111, 999999, 116529, 1, '050'),
(184, 13, 1, 2, 111111, 333333, 222962, 1, '002'),
(185, 12, 4, 152, 111111, 444444, 222372, 1, '050'),
(186, 13, 4, 152, 111111, 444444, 222372, 1, '050'),
(187, 11, 1, 1, 000001, 999999, 002166, 1, '001'),
(188, 11, 2, 2, 000001, 999999, 002341, 1, '002'),
(189, 10, 1, 2, 000001, 999999, 000649, 1, '002'),
(190, 11, 5, 6, 000000, 999999, 000007, 1, '006'),
(191, 10, 5, 6, 000000, 999999, 000427, 1, '006'),
(192, 13, 5, 6, 000001, 999999, 000004, 1, '006'),
(193, 12, 5, 6, 000001, 999999, 000004, 1, '006');

-- --------------------------------------------------------

--
-- Table structure for table `tb_cps_grouppermissions`
--

DROP TABLE IF EXISTS `tb_cps_grouppermissions`;
CREATE TABLE IF NOT EXISTS `tb_cps_grouppermissions` (
  `permission_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `page_accessible` varchar(150) NOT NULL,
  `page_read` varchar(2) NOT NULL,
  `page_write` varchar(2) NOT NULL,
  `page_edit` varchar(2) NOT NULL,
  PRIMARY KEY (`permission_id`)
) ENGINE=MyISAM AUTO_INCREMENT=60 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_cps_groups`
--

DROP TABLE IF EXISTS `tb_cps_groups`;
CREATE TABLE IF NOT EXISTS `tb_cps_groups` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(100) NOT NULL,
  `group_createddate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_cps_groups`
--

INSERT INTO `tb_cps_groups` (`group_id`, `group_name`, `group_createddate`) VALUES
(30, 'ADMINISTRATOR', '2013-02-10 18:28:24');

-- --------------------------------------------------------

--
-- Table structure for table `tb_cps_halfdays`
--

DROP TABLE IF EXISTS `tb_cps_halfdays`;
CREATE TABLE IF NOT EXISTS `tb_cps_halfdays` (
  `branch_halfday_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `branch_id` int(11) NOT NULL,
  `monday` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `tuesday` tinyint(4) NOT NULL DEFAULT '0',
  `wednesday` tinyint(4) NOT NULL DEFAULT '0',
  `thursday` tinyint(4) NOT NULL DEFAULT '0',
  `friday` tinyint(4) NOT NULL DEFAULT '0',
  `saturday` tinyint(4) NOT NULL DEFAULT '0',
  `sunday` tinyint(4) NOT NULL DEFAULT '0',
  `opening_time` varchar(7) NOT NULL,
  `closing_time` varchar(7) NOT NULL,
  PRIMARY KEY (`branch_halfday_id`)
) ENGINE=MyISAM AUTO_INCREMENT=57 DEFAULT CHARSET=ucs2;

--
-- Dumping data for table `tb_cps_halfdays`
--

INSERT INTO `tb_cps_halfdays` (`branch_halfday_id`, `branch_id`, `monday`, `tuesday`, `wednesday`, `thursday`, `friday`, `saturday`, `sunday`, `opening_time`, `closing_time`) VALUES
(53, 3, 0, 0, 0, 0, 0, 1, 0, '9:00am', '1:00pm'),
(52, 2, 0, 0, 0, 0, 0, 1, 0, '9:00am', '1:00pm'),
(54, 4, 0, 0, 0, 0, 0, 1, 0, '9:00am', '1:00pm'),
(55, 5, 0, 0, 0, 0, 0, 1, 0, '10:00am', '2:00pm'),
(56, 6, 0, 0, 0, 0, 0, 1, 0, '9:30am', '1:30pm');

-- --------------------------------------------------------

--
-- Table structure for table `tb_cps_holidays`
--

DROP TABLE IF EXISTS `tb_cps_holidays`;
CREATE TABLE IF NOT EXISTS `tb_cps_holidays` (
  `branch_holiday_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `branch_id` int(11) NOT NULL,
  `monday` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `tuesday` tinyint(4) NOT NULL DEFAULT '0',
  `wednesday` tinyint(4) NOT NULL DEFAULT '0',
  `thursday` tinyint(4) NOT NULL DEFAULT '0',
  `friday` tinyint(4) NOT NULL DEFAULT '0',
  `saturday` tinyint(4) NOT NULL DEFAULT '0',
  `sunday` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`branch_holiday_id`)
) ENGINE=MyISAM AUTO_INCREMENT=74 DEFAULT CHARSET=ucs2;

--
-- Dumping data for table `tb_cps_holidays`
--

INSERT INTO `tb_cps_holidays` (`branch_holiday_id`, `branch_id`, `monday`, `tuesday`, `wednesday`, `thursday`, `friday`, `saturday`, `sunday`) VALUES
(63, 3, 0, 0, 0, 0, 0, 0, 1),
(62, 2, 0, 0, 0, 0, 0, 0, 1),
(61, 3, 0, 0, 0, 0, 0, 0, 1),
(60, 2, 0, 0, 0, 0, 0, 0, 1),
(59, 3, 0, 0, 0, 0, 0, 0, 1),
(58, 3, 0, 0, 0, 0, 0, 0, 1),
(57, 2, 0, 0, 0, 0, 0, 0, 1),
(64, 4, 0, 0, 0, 0, 0, 0, 1),
(65, 5, 0, 0, 0, 0, 0, 0, 1),
(66, 6, 0, 0, 0, 0, 0, 0, 1),
(67, 6, 0, 0, 0, 0, 0, 0, 1),
(68, 2, 0, 0, 0, 0, 0, 0, 1),
(69, 2, 0, 0, 0, 0, 0, 0, 1),
(70, 2, 0, 0, 0, 0, 0, 0, 1),
(71, 2, 0, 0, 0, 0, 0, 0, 1),
(72, 2, 0, 0, 0, 0, 0, 0, 1),
(73, 7, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tb_cps_mapbankfields`
--

DROP TABLE IF EXISTS `tb_cps_mapbankfields`;
CREATE TABLE IF NOT EXISTS `tb_cps_mapbankfields` (
  `field_id` int(11) NOT NULL AUTO_INCREMENT,
  `field_name` varchar(50) NOT NULL,
  `bank_field_name` varchar(50) NOT NULL,
  `field_min_length` int(11) NOT NULL,
  `field_max_length` int(11) NOT NULL,
  `bank_field_length` int(11) NOT NULL,
  `field_data_type` varchar(50) NOT NULL,
  `field_format` varchar(50) NOT NULL,
  PRIMARY KEY (`field_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_cps_mapbankfields`
--

INSERT INTO `tb_cps_mapbankfields` (`field_id`, `field_name`, `bank_field_name`, `field_min_length`, `field_max_length`, `bank_field_length`, `field_data_type`, `field_format`) VALUES
(1, 'cps_unique_req', 'cps_unique_req', 10, 15, 15, 'Numeric', ''),
(2, 'cps_micr_code', 'cps_micr_code', 9, 9, 9, 'Numeric', ''),
(3, 'cps_branchmicr_code', 'cps_branchmicr_code', 3, 3, 3, 'Numeric', ''),
(4, 'cps_account_no', 'cps_account_no', 15, 15, 15, 'Numeric', ''),
(5, 'cps_act_name', 'cps_act_name', 1, 35, 35, 'Varchar', ''),
(6, 'cps_book_size', 'cps_book_size', 1, 3, 3, 'Numeric', ''),
(7, 'cps_no_of_books', 'cps_no_of_books', 1, 2, 2, 'Numeric', ''),
(8, 'cps_dly_bearer_order', 'cps_dly_bearer_order', 1, 1, 1, 'Varchar', ''),
(9, 'cps_tr_code', 'cps_tr_code', 2, 2, 2, 'Numeric', ''),
(10, 'cps_atpar', 'cps_atpar', 1, 1, 1, 'Numeric', ''),
(11, 'cps_act_jointname1', 'cps_act_jointname1', 0, 35, 35, 'Varchar', ''),
(12, 'cps_act_jointname2', 'cps_act_jointname2', 0, 35, 35, 'Varchar', ''),
(13, 'cps_auth_sign1', 'cps_auth_sign1', 0, 35, 35, 'Varchar', ''),
(14, 'cps_auth_sign2', 'cps_auth_sign2', 0, 35, 35, 'Varchar', ''),
(15, 'cps_auth_sign3', 'cps_auth_sign3', 0, 35, 35, 'Varchar', ''),
(16, 'cps_act_address1', 'cps_act_address1', 0, 50, 50, 'Varchar', ''),
(17, 'cps_act_address2', 'cps_act_address2', 0, 50, 50, 'Varchar', ''),
(18, 'cps_act_city', 'cps_act_city', 0, 30, 30, 'Varchar', ''),
(19, 'cps_state', 'cps_state', 0, 30, 30, 'Varchar', ''),
(20, 'cps_country', 'cps_country', 0, 30, 30, 'Varchar', ''),
(21, 'cps_emailid', 'cps_emailid', 0, 50, 50, 'Varchar', ''),
(22, 'cps_act_pin', 'cps_act_pin', 0, 30, 30, 'Varchar', ''),
(23, 'cps_act_telephone_res', 'cps_act_telephone_res', 0, 15, 15, 'Numeric', ''),
(24, 'cps_act_telephone_off', 'cps_act_telephone_off', 0, 15, 15, 'Numeric', ''),
(25, 'cps_act_mobile', 'cps_act_mobile', 0, 15, 15, 'Numeric', ''),
(26, 'cps_chq_no_from', 'cps_chq_no_from', 0, 6, 6, 'Numeric', ''),
(27, 'cps_chq_no_to', 'cps_chq_no_to', 0, 6, 6, 'Numeric', '');

-- --------------------------------------------------------

--
-- Table structure for table `tb_cps_nonworkingdays`
--

DROP TABLE IF EXISTS `tb_cps_nonworkingdays`;
CREATE TABLE IF NOT EXISTS `tb_cps_nonworkingdays` (
  `branch_nonworkingday_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `branch_id` int(11) NOT NULL,
  `monday` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `tuesday` tinyint(4) NOT NULL DEFAULT '0',
  `wednesday` tinyint(4) NOT NULL DEFAULT '0',
  `thursday` tinyint(4) NOT NULL DEFAULT '0',
  `friday` tinyint(4) NOT NULL DEFAULT '0',
  `saturday` tinyint(4) NOT NULL DEFAULT '0',
  `sunday` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`branch_nonworkingday_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=ucs2;

-- --------------------------------------------------------

--
-- Table structure for table `tb_cps_reprintque`
--

DROP TABLE IF EXISTS `tb_cps_reprintque`;
CREATE TABLE IF NOT EXISTS `tb_cps_reprintque` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `cps_unique_req` bigint(8) UNSIGNED ZEROFILL NOT NULL,
  `cps_micr_code` int(3) UNSIGNED ZEROFILL NOT NULL,
  `cps_branchmicr_code` int(3) UNSIGNED ZEROFILL NOT NULL,
  `cps_account_no` varchar(15) NOT NULL,
  `cps_act_name` varchar(128) NOT NULL,
  `cps_no_of_books` int(3) NOT NULL,
  `cps_dly_bearer_order` varchar(1) NOT NULL,
  `cps_book_size` int(3) NOT NULL,
  `cps_tr_code` int(2) UNSIGNED ZEROFILL NOT NULL,
  `cps_atpar` varchar(10) DEFAULT NULL,
  `cps_act_jointname1` varchar(512) NOT NULL,
  `cps_act_jointname2` varchar(512) NOT NULL,
  `cps_auth_sign1` varchar(512) NOT NULL,
  `cps_auth_sign2` varchar(512) NOT NULL,
  `cps_auth_sign3` varchar(512) NOT NULL,
  `cps_act_address1` varchar(50) NOT NULL,
  `cps_act_address2` varchar(50) NOT NULL,
  `cps_act_address3` varchar(35) NOT NULL,
  `cps_act_address4` varchar(35) NOT NULL,
  `cps_act_address5` varchar(35) NOT NULL,
  `cps_act_city` varchar(30) NOT NULL,
  `cps_state` varchar(30) NOT NULL,
  `cps_country` varchar(30) NOT NULL,
  `cps_emailid` varchar(50) NOT NULL,
  `cps_act_pin` int(30) NOT NULL,
  `cps_act_telephone_res` varchar(15) NOT NULL,
  `cps_act_telephone_off` varchar(15) NOT NULL,
  `cps_act_mobile` varchar(15) NOT NULL,
  `cps_ifsc_code` varchar(12) NOT NULL,
  `cps_chq_no_from` bigint(6) UNSIGNED ZEROFILL NOT NULL,
  `cps_chq_no_to` bigint(6) UNSIGNED ZEROFILL NOT NULL,
  `cps_micr_account_no` int(6) UNSIGNED ZEROFILL NOT NULL,
  `cps_date` date NOT NULL,
  `cps_process_user_id` int(6) NOT NULL,
  `cps_bsr_code` varchar(6) DEFAULT NULL,
  `cps_pr_code` varchar(4) DEFAULT NULL,
  `cps_reprint_approved` int(1) NOT NULL DEFAULT '0',
  `cps_short_name` varchar(40) DEFAULT NULL,
  `cps_product_code` varchar(5) DEFAULT NULL,
  `branch_sub_code` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_cps_reprintque`
--

INSERT INTO `tb_cps_reprintque` (`id`, `cps_unique_req`, `cps_micr_code`, `cps_branchmicr_code`, `cps_account_no`, `cps_act_name`, `cps_no_of_books`, `cps_dly_bearer_order`, `cps_book_size`, `cps_tr_code`, `cps_atpar`, `cps_act_jointname1`, `cps_act_jointname2`, `cps_auth_sign1`, `cps_auth_sign2`, `cps_auth_sign3`, `cps_act_address1`, `cps_act_address2`, `cps_act_address3`, `cps_act_address4`, `cps_act_address5`, `cps_act_city`, `cps_state`, `cps_country`, `cps_emailid`, `cps_act_pin`, `cps_act_telephone_res`, `cps_act_telephone_off`, `cps_act_mobile`, `cps_ifsc_code`, `cps_chq_no_from`, `cps_chq_no_to`, `cps_micr_account_no`, `cps_date`, `cps_process_user_id`, `cps_bsr_code`, `cps_pr_code`, `cps_reprint_approved`, `cps_short_name`, `cps_product_code`, `branch_sub_code`) VALUES
(18, 00000001, 414804001, 001, '34555', 'ABCDEFG HIJKLMN OPQRSTU VWXYZ ABCDEFG HIJKLMN OPQRSTU VWXYZ ABCDE', 50, '0', 40, 11, '', 'ASD', '', '', '', '', 'SDSDSDS', '', '', '', '', 'mum', '', '', '', 454645, '', '', '', 'SVCB0054002', 000001, 002000, 000133, '2024-02-09', 1, NULL, NULL, 0, 'AB', '', '001'),
(19, 00000002, 414804002, 002, '34555', 'ABCDEFG HIJKLMN OPQRSTU VWXYZ ABCDEFG HIJKLMN OPQRSTU VWXYZ ABCDE', 50, '0', 40, 11, '', 'ASD', '', '', '', '', 'SDSDSDS', '', '', '', '', 'mum', '', '', '', 454645, '', '', '', 'SVCB0054004', 000001, 002000, 000133, '2024-02-09', 1, NULL, NULL, 0, 'AB', '', '002'),
(20, 00000003, 414804001, 001, '2388788557', 'ABCEDER4', 5, '0', 3, 11, '', '', '', '', '', '', 'SDSDSDS', '', '', '', '', 'fdrge', '', '', '', 454645, '', '', '', 'SVCB0054002', 002001, 002015, 454857, '2024-02-09', 1, NULL, NULL, 0, '', '', '001'),
(21, 00000004, 414804001, 001, '23887885574', 'ABCEDER', 5, '0', 30, 11, '', '', '', '', '', '', 'FDGFDG', '', '', '', '', 'than', '', '', '', 454645, '', '', '', 'SVCB0054002', 002016, 002165, 454857, '2024-02-09', 1, NULL, NULL, 0, 'AB', '', '001'),
(22, 00000005, 414804002, 002, '23887885574', 'ABCEDER', 5, '0', 30, 11, '', '', '', '', '', '', 'FDGFDG', '', '', '', '', 'than', '', '', '', 454645, '', '', '', 'SVCB0054004', 002001, 002150, 454857, '2024-02-09', 1, NULL, NULL, 0, 'AB', '', '002'),
(23, 00000006, 414804002, 002, '2388788557', 'TEST5', 1, '0', 30, 11, '', 'ASD', '', '', '', '', 'SDSDSDS', '', '', '', '', 'than', '', '', '', 37467, '', '', '', 'SVCB0054004', 002151, 002180, 454857, '2024-02-09', 1, NULL, NULL, 0, 'AB', '', '002'),
(24, 00000007, 414804002, 002, '2388788557', 'ABCEDER4', 4, '1', 40, 11, '', 'ASD', 'ASSDSFDGDFGFGTGRT VFGFG', '', '', '', 'SDSDSDS', '', '', '', '', 'fdrge', '', '', '', 454645, '', '', '', 'SVCB0054004', 002181, 002340, 442853, '2024-02-09', 1, NULL, NULL, 0, 'AB', '', '002'),
(25, 00000008, 414804001, 002, '2388788557', 'ABCEDER4', 5, '0', 30, 10, '', 'ASD', 'ASSDSFDGDFGFGTGRT VFGFG', 'AUTHORISED SIGNATORY', '', '', 'SDSDSDS', '', '', '', '', 'fdrge', '', '', '', 454645, '', '', '', 'SVCB0054002', 000001, 000150, 454857, '2024-02-09', 1, NULL, NULL, 0, 'AB', '', '002'),
(26, 00000009, 414804001, 002, '2388788557', 'ABCEDER4', 5, '0', 30, 10, '', 'ASD', 'ASSDSFDGDFGFGTGRT VFGFG', 'AUTHORISED SIGNATORY', '', '', 'SDSDSDS', '', '', '', '', 'fdrge', '', '', '', 454645, '', '', '', 'SVCB0054002', 000151, 000300, 454857, '2024-02-09', 1, NULL, NULL, 0, 'AB', '', '002'),
(27, 00000010, 414804001, 002, '011006200022420', 'ABCEDER4', 5, '0', 30, 10, '', 'ASD', 'DSD', 'AUTHORISED SIGNATORY', 'AUTHORISED SIGNATORY', '', 'SDSDSDS', '', '', '', '', 'sdwa', '', '', '', 37467, '', '', '', 'SVCB0054002', 000301, 000450, 000133, '2024-02-09', 1, NULL, NULL, 0, 'AB', '', '002');

-- --------------------------------------------------------

--
-- Table structure for table `tb_cps_settings`
--

DROP TABLE IF EXISTS `tb_cps_settings`;
CREATE TABLE IF NOT EXISTS `tb_cps_settings` (
  `inputfolderpath` varchar(100) NOT NULL,
  `archivefolderpath` varchar(50) NOT NULL,
  `inputfileformat` varchar(20) NOT NULL,
  `inputfiledelimiter` varchar(15) NOT NULL,
  `outputfolderpath` varchar(100) NOT NULL,
  `outputfileformat` varchar(20) NOT NULL,
  `outputfiledelimiter` varchar(15) NOT NULL,
  `typeofprinter` varchar(20) NOT NULL,
  `printermodel` int(11) NOT NULL,
  `chk_taken_from` int(1) NOT NULL,
  `chk_no_from` int(6) UNSIGNED ZEROFILL NOT NULL,
  `chk_no_to` int(6) UNSIGNED ZEROFILL NOT NULL,
  `nooffailedpasswordattempt` int(11) NOT NULL,
  `password_expiry` int(11) NOT NULL,
  `homescreen_text` varchar(100) NOT NULL,
  `poweredby` varchar(100) NOT NULL,
  `banklogo` varchar(100) NOT NULL,
  `desktop_image` varchar(100) NOT NULL,
  `chq_Image` text NOT NULL,
  `country` varchar(5) NOT NULL,
  `help_employeeid` varchar(20) NOT NULL,
  `help_helplineno1` varchar(30) NOT NULL,
  `help_emailid` varchar(100) NOT NULL,
  `autolockminutes` int(11) NOT NULL,
  `help_contactperson` varchar(200) NOT NULL,
  `help_helplineno2` varchar(20) NOT NULL,
  `license_type` varchar(10) NOT NULL,
  `license_install_date` date NOT NULL,
  `license_period` int(2) NOT NULL,
  `license_end_date` date NOT NULL,
  `license_no_of_users` int(5) NOT NULL,
  `license_cheque_leaves` int(250) NOT NULL,
  `license_users_leaves` int(1) NOT NULL,
  `license_users_leaves_value` int(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_cps_settings`
--

INSERT INTO `tb_cps_settings` (`inputfolderpath`, `archivefolderpath`, `inputfileformat`, `inputfiledelimiter`, `outputfolderpath`, `outputfileformat`, `outputfiledelimiter`, `typeofprinter`, `printermodel`, `chk_taken_from`, `chk_no_from`, `chk_no_to`, `nooffailedpasswordattempt`, `password_expiry`, `homescreen_text`, `poweredby`, `banklogo`, `desktop_image`, `chq_Image`, `country`, `help_employeeid`, `help_helplineno1`, `help_emailid`, `autolockminutes`, `help_contactperson`, `help_helplineno2`, `license_type`, `license_install_date`, `license_period`, `license_end_date`, `license_no_of_users`, `license_cheque_leaves`, `license_users_leaves`, `license_users_leaves_value`) VALUES
('', 'uploads/', 'Excel', '', '', 'Excel', '', '', 0, 1, 000000, 000000, 9, 365, 'THE AMBIKA MAHILA SAHAKARI BANK LTD.,AHMEDNAGAR ', 'DevHarsh Infotech Pvt Ltd', 'thane logo.jpg', 'Penguins.jpg', '', '', '', '', '', 360, '', '', '', '0000-00-00', 0, '0000-00-00', 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tb_cps_transactioncodes`
--

DROP TABLE IF EXISTS `tb_cps_transactioncodes`;
CREATE TABLE IF NOT EXISTS `tb_cps_transactioncodes` (
  `transactioncode_id` int(11) NOT NULL AUTO_INCREMENT,
  `transactioncode` int(2) NOT NULL,
  `transactioncodedescription` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `transactionstatus` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`transactioncode_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tb_cps_transactioncodes`
--

INSERT INTO `tb_cps_transactioncodes` (`transactioncode_id`, `transactioncode`, `transactioncodedescription`, `transactionstatus`) VALUES
(1, 10, 'SAVINGS ACCOUNT', 0),
(2, 11, 'CURRENT', 0),
(3, 12, 'PAY ORDER', 0),
(4, 13, 'CASH CREDIT', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tb_cps_weekdays`
--

DROP TABLE IF EXISTS `tb_cps_weekdays`;
CREATE TABLE IF NOT EXISTS `tb_cps_weekdays` (
  `branch_workingday_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `branch_id` int(11) NOT NULL,
  `monday` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `tuesday` tinyint(4) NOT NULL DEFAULT '0',
  `wednesday` tinyint(4) NOT NULL DEFAULT '0',
  `thursday` tinyint(4) NOT NULL DEFAULT '0',
  `friday` tinyint(4) NOT NULL DEFAULT '0',
  `saturday` tinyint(4) NOT NULL DEFAULT '0',
  `sunday` tinyint(4) NOT NULL DEFAULT '0',
  `opening_time` varchar(7) NOT NULL,
  `closing_time` varchar(7) NOT NULL,
  PRIMARY KEY (`branch_workingday_id`)
) ENGINE=MyISAM AUTO_INCREMENT=58 DEFAULT CHARSET=ucs2;

--
-- Dumping data for table `tb_cps_weekdays`
--

INSERT INTO `tb_cps_weekdays` (`branch_workingday_id`, `branch_id`, `monday`, `tuesday`, `wednesday`, `thursday`, `friday`, `saturday`, `sunday`, `opening_time`, `closing_time`) VALUES
(53, 3, 1, 1, 1, 1, 1, 0, 0, '9:00am', '5:00pm'),
(52, 2, 1, 1, 1, 1, 1, 0, 0, '9:00am', '6:00pm'),
(54, 4, 1, 1, 1, 1, 1, 0, 0, '9:00am', '5:00pm'),
(55, 5, 1, 1, 1, 1, 1, 0, 0, '10:00am', '6:00pm'),
(56, 6, 1, 1, 1, 1, 1, 0, 0, '9:30am', '5:30pm'),
(57, 7, 0, 0, 0, 0, 0, 0, 0, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `tb_customer`
--

DROP TABLE IF EXISTS `tb_customer`;
CREATE TABLE IF NOT EXISTS `tb_customer` (
  `cust_id` int(11) NOT NULL AUTO_INCREMENT,
  `cust_short_name` varchar(30) NOT NULL,
  `cust_name` varchar(50) NOT NULL,
  `cust_address` text NOT NULL,
  `cust_acc_no` varchar(15) NOT NULL,
  KEY `cust_id` (`cust_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_customer`
--

INSERT INTO `tb_customer` (`cust_id`, `cust_short_name`, `cust_name`, `cust_address`, `cust_acc_no`) VALUES
(1, 'AADEEPTA', 'AADEEPTA V.SHETTY & VIIVECK V.SHETTY', '27,4/F,GURU BHAKTI NIWAS,GURU MANDIR RD,DOMBIVLI (EAST)-421 201.', 'H15792102956'),
(2, 'ABHILASHA', 'ABHILASHA OZA', 'SHIV-VASANTI,BLDG.16,H.F.SOCIETY ROAD,  JOGESHWARI(E),MUMBAI 400 060.', 'H15792100857'),
(3, 'ABHISHEK', 'ABHISHEK BHARTIA', 'A-603,KRISHRAJ TWR,CHICKUWADI,BORIVALI-WOPP.OMKAR HIGH COURT SOC,M-92.', 'H15792101900');

-- --------------------------------------------------------

--
-- Table structure for table `tb_manual_print`
--

DROP TABLE IF EXISTS `tb_manual_print`;
CREATE TABLE IF NOT EXISTS `tb_manual_print` (
  `mp_Id` int(11) NOT NULL AUTO_INCREMENT,
  `mp_AccountHolder_Id` int(11) NOT NULL,
  `mp_BookSize` int(4) NOT NULL,
  `mp_NoOfBooks` int(4) NOT NULL,
  `mp_Chk_From` int(7) NOT NULL,
  `mp_Chk_To` int(7) NOT NULL,
  PRIMARY KEY (`mp_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_pending_print_req`
--

DROP TABLE IF EXISTS `tb_pending_print_req`;
CREATE TABLE IF NOT EXISTS `tb_pending_print_req` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `cps_unique_req` bigint(8) UNSIGNED ZEROFILL NOT NULL,
  `cps_micr_code` int(3) UNSIGNED ZEROFILL NOT NULL,
  `cps_branchmicr_code` int(3) UNSIGNED ZEROFILL NOT NULL,
  `cps_account_no` varchar(15) NOT NULL,
  `cps_act_name` varchar(128) NOT NULL,
  `cps_no_of_books` int(2) UNSIGNED ZEROFILL NOT NULL,
  `cps_dly_bearer_order` varchar(1) NOT NULL,
  `cps_book_size` int(3) UNSIGNED ZEROFILL NOT NULL,
  `cps_tr_code` int(2) UNSIGNED ZEROFILL NOT NULL,
  `cps_atpar` varchar(1) DEFAULT NULL,
  `cps_act_jointname1` varchar(512) NOT NULL,
  `cps_act_jointname2` varchar(512) NOT NULL,
  `cps_auth_sign1` varchar(512) NOT NULL,
  `cps_auth_sign2` varchar(512) NOT NULL,
  `cps_auth_sign3` varchar(512) NOT NULL,
  `cps_act_address1` varchar(50) NOT NULL,
  `cps_act_address2` varchar(50) NOT NULL,
  `cps_act_address3` varchar(35) NOT NULL,
  `cps_act_address4` varchar(35) NOT NULL,
  `cps_act_address5` varchar(35) NOT NULL,
  `cps_act_city` varchar(30) NOT NULL,
  `cps_state` varchar(30) DEFAULT NULL,
  `cps_country` varchar(30) DEFAULT NULL,
  `cps_emailid` varchar(50) DEFAULT NULL,
  `cps_act_pin` int(30) NOT NULL,
  `cps_act_telephone_res` varchar(15) NOT NULL,
  `cps_act_telephone_off` varchar(15) NOT NULL,
  `cps_act_mobile` varchar(15) NOT NULL,
  `cps_ifsc_code` varchar(12) DEFAULT NULL,
  `cps_chq_no_from` bigint(6) UNSIGNED ZEROFILL NOT NULL,
  `cps_chq_no_to` bigint(6) UNSIGNED ZEROFILL NOT NULL,
  `cps_micr_account_no` int(6) UNSIGNED ZEROFILL NOT NULL,
  `cps_date` date NOT NULL,
  `cps_process_user_id` int(6) NOT NULL,
  `cps_isprint` int(1) NOT NULL DEFAULT '0',
  `cps_bsr_code` varchar(6) DEFAULT NULL,
  `cps_pr_code` varchar(4) DEFAULT NULL,
  `cps_short_name` varchar(40) DEFAULT NULL,
  `cps_product_code` varchar(5) DEFAULT NULL,
  `branch_sub_code` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_printadmin`
--

DROP TABLE IF EXISTS `tb_printadmin`;
CREATE TABLE IF NOT EXISTS `tb_printadmin` (
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `lastlogintime` datetime NOT NULL,
  `adminid` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(3) NOT NULL,
  `incorrect_attempt` int(11) NOT NULL,
  `password_status` int(11) NOT NULL,
  `user_type` int(11) NOT NULL,
  `userid` varchar(50) NOT NULL,
  `create_date` date NOT NULL,
  `is_temp_password` int(11) NOT NULL,
  PRIMARY KEY (`adminid`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_printadmin`
--

INSERT INTO `tb_printadmin` (`username`, `password`, `lastlogintime`, `adminid`, `group_id`, `incorrect_attempt`, `password_status`, `user_type`, `userid`, `create_date`, `is_temp_password`) VALUES
('admin', '21232f297a57a5a743894a0e4a801fc3', '2012-04-21 00:00:00', 1, 0, 0, 1, 0, 'admin', '2024-01-02', 1),
('reprint', '1babe098befd805689339582881da1d8', '2015-05-31 00:00:00', 16, 0, 0, 1, 1, 'reprint', '2024-01-02', 1),
('BHANDARE', '6835a52b78079d8aa7ca9cd460abf9ba', '2023-01-21 00:00:00', 20, 0, 0, 1, 0, 'BHANDARE', '2023-01-21', 1),
('BHANDARE135', '6444cceafef31a81b3aaf2830389e990', '2023-01-21 00:00:00', 21, 0, 0, 1, 1, 'BHANDARE135', '2023-01-21', 1),
('GUTTE', '9bdeb931332302d14da941feb7415425', '2023-05-06 00:00:00', 22, 0, 0, 1, 0, 'SSG', '2023-05-06', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_printque`
--

DROP TABLE IF EXISTS `tb_printque`;
CREATE TABLE IF NOT EXISTS `tb_printque` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `cps_unique_req` bigint(8) UNSIGNED ZEROFILL NOT NULL,
  `cps_micr_code` int(3) UNSIGNED ZEROFILL NOT NULL,
  `cps_branchmicr_code` int(3) UNSIGNED ZEROFILL NOT NULL,
  `cps_account_no` varchar(15) NOT NULL,
  `cps_act_name` varchar(128) NOT NULL,
  `cps_no_of_books` int(2) UNSIGNED ZEROFILL NOT NULL,
  `cps_dly_bearer_order` varchar(1) NOT NULL,
  `cps_book_size` int(3) UNSIGNED ZEROFILL NOT NULL,
  `cps_tr_code` int(2) UNSIGNED ZEROFILL NOT NULL,
  `cps_atpar` varchar(1) DEFAULT NULL,
  `cps_act_jointname1` varchar(512) NOT NULL,
  `cps_act_jointname2` varchar(512) NOT NULL,
  `cps_auth_sign1` varchar(512) NOT NULL,
  `cps_auth_sign2` varchar(512) NOT NULL,
  `cps_auth_sign3` varchar(512) NOT NULL,
  `cps_act_address1` varchar(50) NOT NULL,
  `cps_act_address2` varchar(50) NOT NULL,
  `cps_act_address3` varchar(35) NOT NULL,
  `cps_act_address4` varchar(35) NOT NULL,
  `cps_act_address5` varchar(35) NOT NULL,
  `cps_act_city` varchar(30) NOT NULL,
  `cps_state` varchar(30) DEFAULT NULL,
  `cps_country` varchar(30) DEFAULT NULL,
  `cps_emailid` varchar(50) DEFAULT NULL,
  `cps_act_pin` int(30) NOT NULL,
  `cps_act_telephone_res` varchar(15) NOT NULL,
  `cps_act_telephone_off` varchar(15) NOT NULL,
  `cps_act_mobile` varchar(15) NOT NULL,
  `cps_ifsc_code` varchar(12) DEFAULT NULL,
  `cps_chq_no_from` bigint(6) UNSIGNED ZEROFILL NOT NULL,
  `cps_chq_no_to` bigint(6) UNSIGNED ZEROFILL NOT NULL,
  `cps_micr_account_no` int(6) UNSIGNED ZEROFILL NOT NULL,
  `cps_date` date NOT NULL,
  `cps_process_user_id` int(6) NOT NULL,
  `cps_bsr_code` varchar(6) DEFAULT NULL,
  `cps_pr_code` varchar(4) DEFAULT NULL,
  `cps_short_name` varchar(40) DEFAULT NULL,
  `cps_product_code` varchar(5) DEFAULT NULL,
  `branch_sub_code` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_print_req_collection`
--

DROP TABLE IF EXISTS `tb_print_req_collection`;
CREATE TABLE IF NOT EXISTS `tb_print_req_collection` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `cps_unique_req` bigint(8) UNSIGNED ZEROFILL NOT NULL,
  `cps_micr_code` int(3) UNSIGNED ZEROFILL NOT NULL,
  `cps_branchmicr_code` int(3) UNSIGNED ZEROFILL NOT NULL,
  `cps_account_no` varchar(15) NOT NULL,
  `cps_act_name` varchar(128) NOT NULL,
  `cps_no_of_books` int(2) UNSIGNED ZEROFILL NOT NULL,
  `cps_dly_bearer_order` varchar(1) NOT NULL,
  `cps_book_size` int(3) UNSIGNED ZEROFILL NOT NULL,
  `cps_tr_code` int(2) UNSIGNED ZEROFILL NOT NULL,
  `cps_atpar` varchar(1) DEFAULT NULL,
  `cps_act_jointname1` varchar(512) NOT NULL,
  `cps_act_jointname2` varchar(512) NOT NULL,
  `cps_auth_sign1` varchar(512) NOT NULL,
  `cps_auth_sign2` varchar(512) NOT NULL,
  `cps_auth_sign3` varchar(512) NOT NULL,
  `cps_act_address1` varchar(50) NOT NULL,
  `cps_act_address2` varchar(50) NOT NULL,
  `cps_act_address3` varchar(35) NOT NULL,
  `cps_act_address4` varchar(35) NOT NULL,
  `cps_act_address5` varchar(35) NOT NULL,
  `cps_act_city` varchar(30) NOT NULL,
  `cps_state` varchar(30) DEFAULT NULL,
  `cps_country` varchar(30) DEFAULT NULL,
  `cps_emailid` varchar(50) DEFAULT NULL,
  `cps_act_pin` int(30) NOT NULL,
  `cps_act_telephone_res` varchar(15) NOT NULL,
  `cps_act_telephone_off` varchar(15) NOT NULL,
  `cps_act_mobile` varchar(15) NOT NULL,
  `cps_ifsc_code` varchar(12) DEFAULT NULL,
  `cps_chq_no_from` bigint(6) UNSIGNED ZEROFILL NOT NULL,
  `cps_chq_no_to` bigint(6) UNSIGNED ZEROFILL NOT NULL,
  `cps_micr_account_no` int(6) UNSIGNED ZEROFILL NOT NULL,
  `cps_date` date NOT NULL,
  `cps_process_user_id` int(6) NOT NULL,
  `cps_is_reprint` int(1) NOT NULL DEFAULT '0',
  `cps_pr_code` varchar(4) DEFAULT NULL,
  `cps_bsr_code` varchar(6) DEFAULT NULL,
  `cps_short_name` varchar(40) DEFAULT NULL,
  `cps_product_code` varchar(5) DEFAULT NULL,
  `branch_sub_code` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_print_req_collection`
--

INSERT INTO `tb_print_req_collection` (`id`, `cps_unique_req`, `cps_micr_code`, `cps_branchmicr_code`, `cps_account_no`, `cps_act_name`, `cps_no_of_books`, `cps_dly_bearer_order`, `cps_book_size`, `cps_tr_code`, `cps_atpar`, `cps_act_jointname1`, `cps_act_jointname2`, `cps_auth_sign1`, `cps_auth_sign2`, `cps_auth_sign3`, `cps_act_address1`, `cps_act_address2`, `cps_act_address3`, `cps_act_address4`, `cps_act_address5`, `cps_act_city`, `cps_state`, `cps_country`, `cps_emailid`, `cps_act_pin`, `cps_act_telephone_res`, `cps_act_telephone_off`, `cps_act_mobile`, `cps_ifsc_code`, `cps_chq_no_from`, `cps_chq_no_to`, `cps_micr_account_no`, `cps_date`, `cps_process_user_id`, `cps_is_reprint`, `cps_pr_code`, `cps_bsr_code`, `cps_short_name`, `cps_product_code`, `branch_sub_code`) VALUES
(1, 00000001, 414804001, 001, '34555', 'ABCDEFG HIJKLMN OPQRSTU VWXYZ ABCDEFG HIJKLMN OPQRSTU VWXYZ ABCDE', 50, '0', 040, 11, '', 'ASD', '', '', '', '', 'SDSDSDS', '', '', '', '', 'mum', '', '', '', 454645, '', '', '', 'SVCB0054002', 000001, 002000, 000133, '2024-02-09', 1, 0, '', '', 'AB', '', '001'),
(2, 00000002, 414804002, 002, '34555', 'ABCDEFG HIJKLMN OPQRSTU VWXYZ ABCDEFG HIJKLMN OPQRSTU VWXYZ ABCDE', 50, '0', 040, 11, '', 'ASD', '', '', '', '', 'SDSDSDS', '', '', '', '', 'mum', '', '', '', 454645, '', '', '', 'SVCB0054004', 000001, 002000, 000133, '2024-02-09', 1, 0, '', '', 'AB', '', '002'),
(3, 00000003, 414804001, 001, '2388788557', 'ABCEDER4', 05, '0', 003, 11, '', '', '', '', '', '', 'SDSDSDS', '', '', '', '', 'fdrge', '', '', '', 454645, '', '', '', 'SVCB0054002', 002001, 002015, 454857, '2024-02-09', 1, 0, '', '', '', '', '001'),
(4, 00000004, 414804001, 001, '23887885574', 'ABCEDER', 05, '0', 030, 11, '', '', '', '', '', '', 'FDGFDG', '', '', '', '', 'than', '', '', '', 454645, '', '', '', 'SVCB0054002', 002016, 002165, 454857, '2024-02-09', 1, 0, '', '', 'AB', '', '001'),
(5, 00000005, 414804002, 002, '23887885574', 'ABCEDER', 05, '0', 030, 11, '', '', '', '', '', '', 'FDGFDG', '', '', '', '', 'than', '', '', '', 454645, '', '', '', 'SVCB0054004', 002001, 002150, 454857, '2024-02-09', 1, 0, '', '', 'AB', '', '002'),
(6, 00000006, 414804002, 002, '2388788557', 'TEST5', 01, '0', 030, 11, '', 'ASD', '', '', '', '', 'SDSDSDS', '', '', '', '', 'than', '', '', '', 37467, '', '', '', 'SVCB0054004', 002151, 002180, 454857, '2024-02-09', 1, 0, '', '', 'AB', '', '002'),
(7, 00000007, 414804002, 002, '2388788557', 'ABCEDER4', 04, '1', 040, 11, '', 'ASD', 'ASSDSFDGDFGFGTGRT VFGFG', '', '', '', 'SDSDSDS', '', '', '', '', 'fdrge', '', '', '', 454645, '', '', '', 'SVCB0054004', 002181, 002340, 442853, '2024-02-09', 1, 0, '', '', 'AB', '', '002'),
(8, 00000008, 414804001, 002, '2388788557', 'ABCEDER4', 05, '0', 030, 10, '', 'ASD', 'ASSDSFDGDFGFGTGRT VFGFG', 'AUTHORISED SIGNATORY', '', '', 'SDSDSDS', '', '', '', '', 'fdrge', '', '', '', 454645, '', '', '', 'SVCB0054002', 000001, 000150, 454857, '2024-02-09', 1, 0, '', '', 'AB', '', '002'),
(9, 00000009, 414804001, 002, '2388788557', 'ABCEDER4', 05, '0', 030, 10, '', 'ASD', 'ASSDSFDGDFGFGTGRT VFGFG', 'AUTHORISED SIGNATORY', '', '', 'SDSDSDS', '', '', '', '', 'fdrge', '', '', '', 454645, '', '', '', 'SVCB0054002', 000151, 000300, 454857, '2024-02-09', 1, 0, '', '', 'AB', '', '002'),
(10, 00000010, 414804001, 002, '011006200022420', 'ABCEDER4', 05, '0', 030, 10, '', 'ASD', 'DSD', 'AUTHORISED SIGNATORY', 'AUTHORISED SIGNATORY', '', 'SDSDSDS', '', '', '', '', 'sdwa', '', '', '', 37467, '', '', '', 'SVCB0054002', 000301, 000450, 000133, '2024-02-09', 1, 0, '', '', 'AB', '', '002'),
(11, 00000011, 414804001, 002, '23887885574', 'ABCEDER', 01, '0', 030, 10, '', '', '', '', '', '', 'FDGFDG', '', '', '', '', 'than', '', '', '', 454645, '', '', '', 'SVCB0054002', 000451, 000480, 454857, '2024-02-09', 1, 0, '', '', '', '', '002'),
(12, 00000012, 414804001, 002, '2388788557', 'ABCEDER4', 01, '0', 003, 10, '', 'ASD', 'ASSDSFDGDFGFGTGRT VFGFG', 'AUTHORISED SIGNATORY', '', '', 'SDSDSDS', '', '', '', '', 'fdrge', '', '', '', 454645, '', '', '', 'SVCB0054002', 000481, 000483, 454857, '2024-02-09', 1, 0, '', '', '', '', '002'),
(13, 00000013, 414804001, 002, '2388788557', 'ABCEDER4', 01, '0', 003, 10, '', 'ASD', 'ASSDSFDGDFGFGTGRT VFGFG', 'AUTHORISED SIGNATORY', '', '', 'SDSDSDS', '', '', '', '', 'fdrge', '', '', '', 454645, '', '', '', 'SVCB0054002', 000484, 000486, 454857, '2024-02-09', 1, 0, '', '', '', '', '002'),
(14, 00000014, 414804001, 002, '23887885574', 'ABCEDER', 01, '0', 003, 10, '', '', '', '', '', '', 'FDGFDG', '', '', '', '', 'than', '', '', '', 454645, '', '', '', 'SVCB0054002', 000487, 000489, 444891, '2024-02-09', 1, 0, '', '', '', '', '002'),
(15, 00000015, 414804001, 002, '2388788557', 'ABCEDER4', 01, '0', 003, 10, '', 'ASD', 'ASSDSFDGDFGFGTGRT VFGFG', 'AUTHORISED SIGNATORY', '', '', 'SDSDSDS', '', '', '', '', 'fdrge', '', '', '', 454645, '', '', '', 'SVCB0054002', 000490, 000492, 454857, '2024-02-09', 1, 0, '', '', '', '', '002'),
(16, 00000016, 414804001, 002, '2388788557', 'ABCEDER4', 05, '0', 030, 10, '', 'ASD', '', '', '', '', 'SDSDSDS', '', '', '', '', 'fdrge', '', '', '', 454645, '', '', '', 'SVCB0054002', 000493, 000642, 454857, '2024-02-09', 1, 0, '', '', '', '', '002'),
(17, 00000017, 414804001, 002, '2388788557', 'ABCEDER4', 01, '0', 003, 10, '', 'ASD', '', '', '', '', 'SDSDSDS', '', '', '', '', 'fdrge', '', '', '', 454645, '', '', '', 'SVCB0054002', 000643, 000645, 000133, '2024-02-09', 1, 0, '', '', '', '', '002'),
(18, 00000018, 431804006, 006, '2388788557', 'ABCEDER4', 01, '0', 003, 10, '', 'ASD', '', '', '', '', 'SDSDSDS', '', '', '', '', 'fdrge', '', '', '', 454645, '', '', '', 'SVCB0054006', 000001, 000003, 454857, '2024-02-09', 1, 0, '', '', 'AB', '', '006'),
(19, 00000019, 431804006, 006, '2388788557', 'ABCEDER4', 01, '0', 003, 10, '', 'ASD', '', '', '', '', 'SDSDSDS', '', '', '', '', 'fdrge', '', '', '', 454645, '', '', '', 'SVCB0054006', 000004, 000006, 454857, '2024-02-09', 1, 0, '', '', '', '', '006'),
(20, 00000020, 414804001, 002, '23887885574', 'ABCEDER', 01, '0', 003, 10, '', '', '', '', '', '', 'FDGFDG', '', '', '', '', 'than', '', '', '', 454645, '', '', '', 'SVCB0054002', 000646, 000648, 444891, '2024-02-09', 1, 0, '', '', '', '', '002'),
(21, 00000021, 431804006, 006, '23887885574', 'ABCEDER4', 01, '0', 003, 10, '', '', '', '', '', '', 'SDSDSDS', '', '', '', '', 'sdwa', '', '', '', 454645, '', '', '', 'SVCB0054006', 000007, 000009, 444891, '2024-02-09', 1, 0, '', '', '', '', '006'),
(22, 00000022, 431804006, 006, '2388788557', 'ABCEDER4', 01, '0', 003, 10, '', 'ASD', '', '', '', '', 'SDSDSDS', '', '', '', '', 'fdrge', '', '', '', 454645, '', '', '', 'SVCB0054006', 000010, 000012, 454857, '2024-02-09', 1, 0, '', '', '', '', '006'),
(23, 00000023, 431804006, 006, '2388788557', 'ABCEDER4', 01, '0', 003, 10, '', '', '', '', '', '', 'SDSDSDS', '', '', '', '', 'fdrge', '', '', '', 454645, '', '', '', 'SVCB0054006', 000013, 000015, 454857, '2024-02-09', 1, 0, '', '', '', '', '006'),
(24, 00000024, 431804006, 006, '2388788557', 'ABCEDER4', 01, '0', 003, 10, '', '', '', '', '', '', 'SDSDSDS', '', '', '', '', 'fdrge', '', '', '', 454645, '', '', '', 'SVCB0054006', 000016, 000018, 454857, '2024-02-09', 1, 0, '', '', '', '', '006'),
(25, 00000025, 431804006, 006, '2388788557', '', 01, '0', 003, 11, '', '', '', '', '', '', 'SDSDSDS', '', '', '', '', 'fdrge', '', '', '', 454645, '', '', '', 'SVCB0054006', 000001, 000003, 454857, '2024-02-09', 1, 0, '', '', '', '', '006'),
(26, 00000026, 431804006, 006, '2388788557', 'ABCEDER4', 01, '0', 003, 10, '', '', '', '', '', '', 'SDSDSDS', '', '', '', '', 'fdrge', '', '', '', 454645, '', '', '', 'SVCB0054006', 000019, 000021, 454857, '2024-02-09', 1, 0, '', '', '', '', '006'),
(27, 00000027, 431804006, 006, '2388788557', 'ABCEDER', 01, '0', 003, 10, '', '', '', '', '', '', 'SDSDSDS', '', '', '', '', 'fdrge', '', '', '', 454645, '', '', '', 'SVCB0054006', 000022, 000024, 454857, '2024-02-09', 1, 0, '', '', '', '', '006'),
(28, 00000029, 431804006, 006, '23887885574', 'ABCEDER4', 01, '0', 003, 10, '', '', '', '', '', '', 'SDSDSDS', '', '', '', '', 'sdwa', '', '', '', 454645, '', '', '', 'SVCB0054006', 000025, 000027, 444891, '2024-02-09', 1, 0, '', '', '', '', '006'),
(29, 00000028, 431804006, 006, '23887885574', 'ABCEDER4', 01, '0', 003, 10, '', '', '', '', '', '', 'SDSDSDS', '', '', '', '', 'sdwa', '', '', '', 454645, '', '', '', 'SVCB0054006', 000028, 000030, 444891, '2024-02-09', 1, 0, '', '', '', '', '006'),
(30, 00000030, 431804006, 006, '01100620002', 'ABCEDER', 08, '0', 030, 10, '', 'ASD', 'ASSDSFDGDFGFG', 'AUTHORISED SIGNATORY', 'AUTHORISED SIGNATORY', 'DFDS', 'AASDSD', 'DVDSF', '', '', '', 'fdrge', '', '', '', 454645, '', '', '', 'SVCB0054006', 000031, 000270, 000133, '2024-02-09', 1, 0, '', '', 'AB', '', '006'),
(31, 00000031, 431804006, 006, '2388788557', 'ABCEDER', 01, '0', 030, 10, '', '', '', 'SDS', 'DFSD', '', 'SDSDSDS', '', '', '', '', 'fdrge', '', '', '', 454645, '', '', '', 'SVCB0054006', 000271, 000300, 454857, '2024-02-09', 1, 0, '', '', 'AB', '', '006'),
(32, 00000032, 431804006, 006, '2388788557', 'ABCEDER', 01, '0', 030, 10, '', '', '', 'SDS', 'DFSD', '', 'SDSDSDS', '', '', '', '', 'fdrge', '', '', '', 454645, '', '', '', 'SVCB0054006', 000301, 000330, 454857, '2024-02-09', 1, 0, '', '', 'AB', '', '006'),
(33, 00000033, 431804006, 006, '2388788557', 'ABCEDER', 01, '0', 030, 10, '', '', '', 'SDS', 'DFSD', '', 'SDSDSDS', '', '', '', '', 'fdrge', '', '', '', 454645, '', '', '', 'SVCB0054006', 000331, 000360, 454857, '2024-02-09', 1, 0, '', '', 'AB', '', '006'),
(34, 00000034, 431804006, 006, '2388788557', 'ABCEDER', 01, '0', 030, 10, '', '', '', 'SDS', 'DFSD', '', 'SDSDSDS', '', '', '', '', 'fdrge', '', '', '', 454645, '', '', '', 'SVCB0054006', 000361, 000390, 454857, '2024-02-09', 1, 0, '', '', 'AB', '', '006'),
(35, 00000035, 431804006, 006, '2388788557', 'ABCEDER', 01, '0', 003, 10, '', '', '', 'SDS', 'DFSD', '', 'SDSDSDS', '', '', '', '', 'fdrge', '', '', '', 454645, '', '', '', 'SVCB0054006', 000391, 000393, 454857, '2024-02-09', 1, 0, '', '', 'AB', '', '006'),
(36, 00000036, 431804006, 006, '2388788557', 'ABCEDER', 01, '0', 030, 10, '', '', '', 'SDS', 'DFSD', '', 'SDSDSDS', '', '', '', '', 'fdrge', '', '', '', 454645, '', '', '', 'SVCB0054006', 000394, 000423, 454857, '2024-02-09', 1, 0, '', '', 'AB', '', '006'),
(37, 00000037, 431804006, 006, '2388788557', 'ABCEDER', 01, '0', 003, 10, '', '', '', 'SDS', 'DFSD', '', 'SDSDSDS', '', '', '', '', 'fdrge', '', '', '', 454645, '', '', '', 'SVCB0054006', 000424, 000426, 454857, '2024-02-09', 1, 0, '', '', 'AB', '', '006'),
(38, 00000038, 431804006, 006, '2388788557', 'ABCEDER', 01, '0', 003, 11, '', '', '', 'SDS', 'DFSD', '', 'SDSDSDS', '', '', '', '', 'fdrge', '', '', '', 454645, '', '', '', 'SVCB0054006', 000004, 000006, 454857, '2024-02-09', 1, 0, '', '', '', '', '006'),
(39, 00000039, 431804006, 006, '2388788557', 'ABCEDER', 01, '0', 003, 13, '', '', '', 'SDS', 'DFSD', '', 'SDSDSDS', '', '', '', '', 'fdrge', '', '', '', 454645, '', '', '', 'SVCB0054006', 000001, 000003, 454857, '2024-02-09', 1, 0, '', '', '', '', '006'),
(40, 00000041, 431804006, 006, '2388788557', 'ABCEDER', 01, '0', 003, 12, '', '', '', 'SDS', 'DFSD', '', 'SDSDSDS', '', '', '', '', 'fdrge', '', '', '', 454645, '', '', '', 'SVCB0054006', 000001, 000003, 454857, '2024-02-09', 1, 0, '', '', '', '', '006');

-- --------------------------------------------------------

--
-- Table structure for table `tb_print_sequence`
--

DROP TABLE IF EXISTS `tb_print_sequence`;
CREATE TABLE IF NOT EXISTS `tb_print_sequence` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `cps_unique_req` bigint(8) UNSIGNED ZEROFILL NOT NULL,
  `cps_micr_code` int(3) NOT NULL,
  `cps_branchmicr_code` varchar(3) NOT NULL,
  `cps_account_no` varchar(15) NOT NULL,
  `cps_act_name` varchar(128) NOT NULL,
  `cps_no_of_books` varchar(2) NOT NULL,
  `cps_dly_bearer_order` varchar(1) NOT NULL,
  `cps_book_size` varchar(3) NOT NULL,
  `cps_tr_code` varchar(2) NOT NULL,
  `cps_atpar` varchar(1) DEFAULT NULL,
  `cps_act_jointname1` varchar(45) NOT NULL,
  `cps_act_jointname2` varchar(45) NOT NULL,
  `cps_auth_sign1` varchar(35) NOT NULL,
  `cps_auth_sign2` varchar(35) NOT NULL,
  `cps_auth_sign3` varchar(35) NOT NULL,
  `cps_act_address1` varchar(50) NOT NULL,
  `cps_act_address2` varchar(50) NOT NULL,
  `cps_act_address3` varchar(35) NOT NULL,
  `cps_act_address4` varchar(35) NOT NULL,
  `cps_act_address5` varchar(35) NOT NULL,
  `cps_act_city` varchar(30) NOT NULL,
  `cps_state` varchar(30) DEFAULT NULL,
  `cps_country` varchar(30) DEFAULT NULL,
  `cps_emailid` varchar(50) DEFAULT NULL,
  `cps_act_pin` int(30) NOT NULL,
  `cps_act_telephone_res` varchar(15) NOT NULL,
  `cps_act_telephone_off` varchar(15) NOT NULL,
  `cps_act_mobile` varchar(15) NOT NULL,
  `cps_ifsc_code` varchar(12) DEFAULT NULL,
  `cps_chq_no_from` varchar(6) NOT NULL,
  `cps_chq_no_to` varchar(6) NOT NULL,
  `cps_micr_account_no` varchar(6) NOT NULL,
  `cps_date` date NOT NULL,
  `cps_process_user_id` varchar(6) NOT NULL,
  `cps_bsr_code` varchar(6) DEFAULT NULL,
  `cps_pr_code` varchar(4) DEFAULT NULL,
  `cps_short_name` varchar(40) DEFAULT NULL,
  `cps_issue_date` varchar(255) DEFAULT NULL,
  `cps_product_code` varchar(5) DEFAULT NULL,
  `branch_sub_code` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=177 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_reprint_req_collection`
--

DROP TABLE IF EXISTS `tb_reprint_req_collection`;
CREATE TABLE IF NOT EXISTS `tb_reprint_req_collection` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `cps_unique_req` bigint(8) UNSIGNED ZEROFILL NOT NULL,
  `cps_micr_code` int(3) UNSIGNED ZEROFILL NOT NULL,
  `cps_branchmicr_code` int(3) UNSIGNED ZEROFILL NOT NULL,
  `cps_account_no` varchar(15) NOT NULL,
  `cps_act_name` varchar(128) NOT NULL,
  `cps_no_of_books` int(2) UNSIGNED ZEROFILL NOT NULL,
  `cps_dly_bearer_order` varchar(1) NOT NULL,
  `cps_book_size` int(3) UNSIGNED ZEROFILL NOT NULL,
  `cps_tr_code` int(2) UNSIGNED ZEROFILL NOT NULL,
  `cps_atpar` varchar(10) NOT NULL,
  `cps_act_jointname1` varchar(512) NOT NULL,
  `cps_act_jointname2` varchar(512) NOT NULL,
  `cps_auth_sign1` varchar(512) NOT NULL,
  `cps_auth_sign2` varchar(512) NOT NULL,
  `cps_auth_sign3` varchar(512) NOT NULL,
  `cps_act_address1` varchar(50) NOT NULL,
  `cps_act_address2` varchar(50) NOT NULL,
  `cps_act_address3` varchar(35) NOT NULL,
  `cps_act_address4` varchar(35) NOT NULL,
  `cps_act_address5` varchar(35) NOT NULL,
  `cps_act_city` varchar(30) NOT NULL,
  `cps_state` varchar(30) NOT NULL,
  `cps_country` varchar(30) NOT NULL,
  `cps_emailid` varchar(50) NOT NULL,
  `cps_act_pin` int(30) NOT NULL,
  `cps_act_telephone_res` varchar(15) NOT NULL,
  `cps_act_telephone_off` varchar(15) NOT NULL,
  `cps_act_mobile` varchar(15) NOT NULL,
  `cps_ifsc_code` varchar(12) NOT NULL,
  `cps_chq_no_from` bigint(6) UNSIGNED ZEROFILL NOT NULL,
  `cps_chq_no_to` bigint(6) UNSIGNED ZEROFILL NOT NULL,
  `cps_micr_account_no` int(6) UNSIGNED ZEROFILL NOT NULL,
  `cps_date` date NOT NULL,
  `cps_process_user_id` int(6) NOT NULL,
  `cps_is_reprint` int(1) NOT NULL DEFAULT '0',
  `cps_pr_code` varchar(4) NOT NULL,
  `cps_bsr_code` varchar(6) NOT NULL,
  `cps_short_name` varchar(40) DEFAULT NULL,
  `cps_product_code` varchar(5) DEFAULT NULL,
  `branch_sub_code` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_reprint_req_collection`
--

INSERT INTO `tb_reprint_req_collection` (`id`, `cps_unique_req`, `cps_micr_code`, `cps_branchmicr_code`, `cps_account_no`, `cps_act_name`, `cps_no_of_books`, `cps_dly_bearer_order`, `cps_book_size`, `cps_tr_code`, `cps_atpar`, `cps_act_jointname1`, `cps_act_jointname2`, `cps_auth_sign1`, `cps_auth_sign2`, `cps_auth_sign3`, `cps_act_address1`, `cps_act_address2`, `cps_act_address3`, `cps_act_address4`, `cps_act_address5`, `cps_act_city`, `cps_state`, `cps_country`, `cps_emailid`, `cps_act_pin`, `cps_act_telephone_res`, `cps_act_telephone_off`, `cps_act_mobile`, `cps_ifsc_code`, `cps_chq_no_from`, `cps_chq_no_to`, `cps_micr_account_no`, `cps_date`, `cps_process_user_id`, `cps_is_reprint`, `cps_pr_code`, `cps_bsr_code`, `cps_short_name`, `cps_product_code`, `branch_sub_code`) VALUES
(2, 00000002, 414804002, 002, '34555', 'ABCDEFG HIJKLMN OPQRSTU VWXYZ ABCDEFG HIJKLMN OPQRSTU VWXYZ ABCDE', 50, '0', 040, 11, '', 'ASD', '', '', '', '', 'SDSDSDS', '', '', '', '', 'mum', '', '', '', 454645, '', '', '', 'SVCB0054004', 000001, 002000, 000133, '2024-02-09', 16, 0, '', '', NULL, '', '002'),
(3, 00000008, 414804001, 002, '2388788557', 'ABCEDER4', 05, '0', 030, 10, '', 'ASD', 'ASSDSFDGDFGFGTGRT VFGFG', 'AUTHORISED SIGNATORY', '', '', 'SDSDSDS', '', '', '', '', 'fdrge', '', '', '', 454645, '', '', '', 'SVCB0054002', 000001, 000150, 454857, '2024-02-09', 16, 0, '', '', NULL, '', '002'),
(4, 00000010, 414804001, 002, '011006200022420', 'ABCEDER4', 05, '0', 030, 10, '', 'ASD', 'DSD', 'AUTHORISED SIGNATORY', 'AUTHORISED SIGNATORY', '', 'SDSDSDS', '', '', '', '', 'sdwa', '', '', '', 37467, '', '', '', 'SVCB0054002', 000301, 000450, 000133, '2024-02-09', 16, 0, '', '', NULL, '', '002'),
(5, 00000009, 414804001, 002, '2388788557', 'ABCEDER4', 05, '0', 030, 10, '', 'ASD', 'ASSDSFDGDFGFGTGRT VFGFG', 'AUTHORISED SIGNATORY', '', '', 'SDSDSDS', '', '', '', '', 'fdrge', '', '', '', 454645, '', '', '', 'SVCB0054002', 000151, 000300, 454857, '2024-02-09', 16, 0, '', '', NULL, '', '002'),
(6, 00000006, 414804002, 002, '2388788557', 'TEST5', 01, '0', 030, 11, '', 'ASD', '', '', '', '', 'SDSDSDS', '', '', '', '', 'than', '', '', '', 37467, '', '', '', 'SVCB0054004', 002151, 002180, 454857, '2024-02-09', 16, 0, '', '', NULL, '', '002'),
(7, 00000007, 414804002, 002, '2388788557', 'ABCEDER4', 04, '1', 040, 11, '', 'ASD', 'ASSDSFDGDFGFGTGRT VFGFG', '', '', '', 'SDSDSDS', '', '', '', '', 'fdrge', '', '', '', 454645, '', '', '', 'SVCB0054004', 002181, 002340, 442853, '2024-02-09', 16, 0, '', '', NULL, '', '002'),
(8, 00000008, 414804001, 002, '2388788557', 'ABCEDER4', 05, '0', 030, 10, '', 'ASD', 'ASSDSFDGDFGFGTGRT VFGFG', 'AUTHORISED SIGNATORY', '', '', 'SDSDSDS', '', '', '', '', 'fdrge', '', '', '', 454645, '', '', '', 'SVCB0054002', 000001, 000150, 454857, '2024-02-09', 16, 0, '', '', NULL, '', '002'),
(9, 00000011, 414804001, 002, '23887885574', 'ABCEDER', 01, '0', 030, 10, '', '', '', '', '', '', 'FDGFDG', '', '', '', '', 'than', '', '', '', 454645, '', '', '', 'SVCB0054002', 000451, 000480, 454857, '2024-02-09', 16, 0, '', '', NULL, '', '002');

-- --------------------------------------------------------

--
-- Table structure for table `tb_statemaster`
--

DROP TABLE IF EXISTS `tb_statemaster`;
CREATE TABLE IF NOT EXISTS `tb_statemaster` (
  `state_id` int(11) NOT NULL AUTO_INCREMENT,
  `state_name` varchar(50) NOT NULL,
  `country_id` int(11) NOT NULL,
  `state_code` varchar(7) NOT NULL,
  `state_name_al` varchar(4) NOT NULL,
  `is_delete` int(2) NOT NULL,
  PRIMARY KEY (`state_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_statemaster`
--

INSERT INTO `tb_statemaster` (`state_id`, `state_name`, `country_id`, `state_code`, `state_name_al`, `is_delete`) VALUES
(1, 'GUJRAT', 1, 'GUJ001', 'GUJ', 1),
(2, 'MAHARASHTRA', 1, 'MAH001', 'MAH', 0),
(3, 'KARNATAKA', 1, 'KAR001', 'KAR', 1),
(4, 'GOA', 1, 'GOA001', 'GOA', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_suburbmaster`
--

DROP TABLE IF EXISTS `tb_suburbmaster`;
CREATE TABLE IF NOT EXISTS `tb_suburbmaster` (
  `suburb_id` int(240) NOT NULL AUTO_INCREMENT,
  `suburb_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `suburb_postal_code` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `suburb_code` varchar(7) COLLATE utf8_unicode_ci NOT NULL,
  `suburb_name_al` varchar(4) COLLATE utf8_unicode_ci NOT NULL,
  `country_id` int(240) NOT NULL,
  `state_id` int(240) NOT NULL,
  `city_id` int(240) NOT NULL,
  `is_delete` int(2) NOT NULL,
  PRIMARY KEY (`suburb_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tb_suburbmaster`
--

INSERT INTO `tb_suburbmaster` (`suburb_id`, `suburb_name`, `suburb_postal_code`, `suburb_code`, `suburb_name_al`, `country_id`, `state_id`, `city_id`, `is_delete`) VALUES
(1, 'MALIWADA', '414001', 'MAL001', 'MAL', 1, 2, 1, 0),
(2, 'SAVEDI', '414002', 'SAV001', 'SAV', 1, 2, 1, 0),
(3, 'NAGARPUR', '414003', 'NAG001', 'NAG', 1, 2, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tb_uploadingdata`
--

DROP TABLE IF EXISTS `tb_uploadingdata`;
CREATE TABLE IF NOT EXISTS `tb_uploadingdata` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `cps_unique_req` bigint(8) UNSIGNED ZEROFILL NOT NULL,
  `cps_micr_code` int(3) NOT NULL,
  `cps_branchmicr_code` varchar(3) NOT NULL,
  `cps_account_no` varchar(15) NOT NULL,
  `cps_act_name` varchar(128) NOT NULL,
  `cps_no_of_books` varchar(2) NOT NULL,
  `cps_dly_bearer_order` varchar(1) NOT NULL,
  `cps_book_size` varchar(3) NOT NULL,
  `cps_tr_code` varchar(2) NOT NULL,
  `cps_atpar` varchar(1) DEFAULT NULL,
  `cps_act_jointname1` varchar(512) NOT NULL,
  `cps_act_jointname2` varchar(512) NOT NULL,
  `cps_auth_sign1` varchar(512) NOT NULL,
  `cps_auth_sign2` varchar(512) NOT NULL,
  `cps_auth_sign3` varchar(512) NOT NULL,
  `cps_act_address1` varchar(50) NOT NULL,
  `cps_act_address2` varchar(50) NOT NULL,
  `cps_act_address3` varchar(35) NOT NULL,
  `cps_act_address4` varchar(35) NOT NULL,
  `cps_act_address5` varchar(35) NOT NULL,
  `cps_act_city` varchar(30) NOT NULL,
  `cps_state` varchar(30) DEFAULT NULL,
  `cps_country` varchar(30) DEFAULT NULL,
  `cps_emailid` varchar(50) DEFAULT NULL,
  `cps_act_pin` int(30) NOT NULL,
  `cps_act_telephone_res` varchar(15) NOT NULL,
  `cps_act_telephone_off` varchar(15) NOT NULL,
  `cps_act_mobile` varchar(15) NOT NULL,
  `cps_ifsc_code` varchar(12) DEFAULT NULL,
  `cps_chq_no_from` varchar(6) NOT NULL,
  `cps_chq_no_to` varchar(6) NOT NULL,
  `cps_micr_account_no` varchar(6) NOT NULL,
  `cps_date` date NOT NULL,
  `cps_process_user_id` varchar(6) NOT NULL,
  `cps_bsr_code` varchar(6) DEFAULT NULL,
  `cps_pr_code` varchar(4) DEFAULT NULL,
  `cps_short_name` varchar(40) DEFAULT NULL,
  `cps_issue_date` varchar(255) DEFAULT NULL,
  `cps_product_code` varchar(5) DEFAULT NULL,
  `branch_sub_code` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_uploadingdata`
--

INSERT INTO `tb_uploadingdata` (`id`, `cps_unique_req`, `cps_micr_code`, `cps_branchmicr_code`, `cps_account_no`, `cps_act_name`, `cps_no_of_books`, `cps_dly_bearer_order`, `cps_book_size`, `cps_tr_code`, `cps_atpar`, `cps_act_jointname1`, `cps_act_jointname2`, `cps_auth_sign1`, `cps_auth_sign2`, `cps_auth_sign3`, `cps_act_address1`, `cps_act_address2`, `cps_act_address3`, `cps_act_address4`, `cps_act_address5`, `cps_act_city`, `cps_state`, `cps_country`, `cps_emailid`, `cps_act_pin`, `cps_act_telephone_res`, `cps_act_telephone_off`, `cps_act_mobile`, `cps_ifsc_code`, `cps_chq_no_from`, `cps_chq_no_to`, `cps_micr_account_no`, `cps_date`, `cps_process_user_id`, `cps_bsr_code`, `cps_pr_code`, `cps_short_name`, `cps_issue_date`, `cps_product_code`, `branch_sub_code`) VALUES
(6, 00000040, 431804006, '006', '2388788557', 'ABCEDER', '1', '0', '3', '12', '', '', '', 'SDS', 'DFSD', '', 'SDSDSDS', '', '', '', '', 'fdrge', '', '', '', 454645, '', '', '', 'SVCB0054006', '0', '0', '454857', '2024-02-09', '1', '', '', '', NULL, NULL, '006');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
