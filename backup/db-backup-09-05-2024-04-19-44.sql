DROP TABLE tb_accountholdermaster;

CREATE TABLE `tb_accountholdermaster` (
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

INSERT INTO tb_accountholdermaster VALUES("1","1001223322","RAKESH SHAH","0","1","0","RAKESH LUCKY","","SIGN 1","","","VIKRILI","VIKRILI","3","1","1","105","400030","2147483647","2147483647","2147483647","2","ach@gmail.com");
INSERT INTO tb_accountholdermaster VALUES("2","1001223311","LIJESH SHARMA","0","1","0","RAKESH LUCKY","","SIGN 1","","","VIKRILI","VIKRILI","3","1","1","105","400030","2147483647","2147483647","2147483647","5","lig@gmail.com");
INSERT INTO tb_accountholdermaster VALUES("5","1001223344","RAKESH SHAHP","0","1","0","RAKESH LUCKY","","SIGN 1","","","VIKRILI","VIKRILI","3","1","1","105","400030","2147483647","2147483647","2147483647","0","");
INSERT INTO tb_accountholdermaster VALUES("6","1001223341","HSDF","0","1","0","","","SIGN 1","","","VIKRILI","VIKRILI","3","1","1","105","400030","2147483647","2147483647","2147483647","0","ach@gmail.com");



DROP TABLE tb_bankdetails;

CREATE TABLE `tb_bankdetails` (
  `bank_id` int(4) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `bank_name` varchar(100) NOT NULL,
  `bank_code` int(3) unsigned zerofill NOT NULL,
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

INSERT INTO tb_bankdetails VALUES("0001","PRIYADARSHANI NAGARI SHAKARI BANK LTD JALNA","812","HEAD OFFICE,MONDHA MARKET,","","","1","2","2","5","431211","","","KIRAN BHANDARE","SACHIN GUTTE","2147483647","2147483647","","","","a:1:{i:0;a:3:{i:0;s:29:\"NPIA705BA (HP LaserJet M403n)\";i:1;s:6:\"tray 1\";i:2;s:6:\"tray 2\";}}");



DROP TABLE tb_branchdetails;

CREATE TABLE `tb_branchdetails` (
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
  `branch_City_Code` int(3) unsigned zerofill NOT NULL,
  `branch_Services` varchar(100) NOT NULL,
  `branch_reg_busi_hrs` varchar(100) NOT NULL,
  `branch_half_busi_hrs` varchar(100) NOT NULL,
  `branch_sunday_working` varchar(100) NOT NULL,
  `branch_tollfree_no` varchar(20) NOT NULL,
  `branch_sub_code` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`branch_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

INSERT INTO tb_branchdetails VALUES("1","052","MAIN BRANCH","431812052","","BRAHMA CHAITANYA DEULGAON RAJA ROAD ","(DIST. JALNA)","","1","2","2","4","431203","02482233346","","","","","","main.br@priyabank.com","","","KKBK0PNSB01","","","0","0","","0","431","","","","","","052");
INSERT INTO tb_branchdetails VALUES("2","502","RAJUR BRANCH","431812502","","MATOSHRI COMPLEX MAIN ROAD RAJUR ","(DIST. JALNA)","","1","2","2","1","431213","","","","","02485252500","","rajur.br@priyabank.com","","","SVCB0054004","","","0","0","","0","431","","","","","","502");
INSERT INTO tb_branchdetails VALUES("3","053","OLD JALNA BRANCH","431812053","","AMBAD ROAD ","(DIST. JALNA)","","1","2","2","1","431213","","","","","02482297807","","Oldjalna.Br@priyabank.com","","","KKBK0PNSB02","","","0","0","","0","431","","","","","","053");
INSERT INTO tb_branchdetails VALUES("4","501","RAMNAGAR BRANCH","431812501","","YASHWANTI COMPLEX MAIN ROAD RAMNAGAR  BRIDGE","(DIST. JALNA)","","1","2","2","2","431214","","","","","","","Ramnagar.Br@priyabank.com","","","KKBK0PNSB04","","","0","0","","0","431","","","","","","501");
INSERT INTO tb_branchdetails VALUES("5","054","SHAHAGAD BRANCH","431812054","","SHAHAGAD","(DIST. JALNA)","","1","2","2","3","431212","","","","","","","","","","KKBK0PNSB03","","","0","0","","0","431","","","","","","054");
INSERT INTO tb_branchdetails VALUES("6","503","KUMBHAR PIPALGAV BRANCH","431812503","","MAULI COMPLEX MAIN ROAD K P ","(DIST. JALNA)","","1","2","2","5","431211","","","","","02383228128","","kp.br@priyabank.com","","","KKBK0PNSB06","","","0","0","","0","431","","","","","","503");
INSERT INTO tb_branchdetails VALUES("7","504","THIRTHPURI BRANCH","431812504","","GANESH COMPLEX SHAHAGAD ROAD TP ","(DIST. JALNA)","","1","2","2","4","431203","","","","","02482277377","","Tirthpuri.Br@priyabank.com","","","KKBK0PNSB07","","","0","0","","0","431","","","","","","504");



DROP TABLE tb_citymaster;

CREATE TABLE `tb_citymaster` (
  `city_id` int(3) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `city_code` varchar(7) NOT NULL,
  `city_place` varchar(30) NOT NULL,
  `city_name_al` varchar(4) NOT NULL,
  `country_id` int(200) NOT NULL,
  `state_id` int(200) NOT NULL,
  `is_delete` int(2) NOT NULL,
  PRIMARY KEY (`city_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

INSERT INTO tb_citymaster VALUES("001","AHM001","AHMEDNAGAR","AHM","1","2","0");
INSERT INTO tb_citymaster VALUES("002","JAL001","JALNA","JAL","1","2","0");



DROP TABLE tb_countrymaster;

CREATE TABLE `tb_countrymaster` (
  `country_id` int(250) NOT NULL AUTO_INCREMENT,
  `country_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `country_code` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `country_isdelete` int(2) NOT NULL,
  PRIMARY KEY (`country_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO tb_countrymaster VALUES("1","INDIA","IND","0");



DROP TABLE tb_cps_adminpasswords;

CREATE TABLE `tb_cps_adminpasswords` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adminid` int(11) NOT NULL,
  `password` int(11) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;

INSERT INTO tb_cps_adminpasswords VALUES("1","0","0","2012-09-28");
INSERT INTO tb_cps_adminpasswords VALUES("2","0","192023","2012-09-28");
INSERT INTO tb_cps_adminpasswords VALUES("3","0","466","2013-04-10");
INSERT INTO tb_cps_adminpasswords VALUES("4","0","1","2013-04-10");
INSERT INTO tb_cps_adminpasswords VALUES("5","0","0","2013-04-10");
INSERT INTO tb_cps_adminpasswords VALUES("6","0","16","2013-04-10");
INSERT INTO tb_cps_adminpasswords VALUES("7","0","192023","2013-09-25");
INSERT INTO tb_cps_adminpasswords VALUES("8","0","0","2013-09-25");
INSERT INTO tb_cps_adminpasswords VALUES("9","0","192023","2014-01-02");
INSERT INTO tb_cps_adminpasswords VALUES("10","0","21232","2014-01-02");
INSERT INTO tb_cps_adminpasswords VALUES("11","0","192023","2014-01-03");
INSERT INTO tb_cps_adminpasswords VALUES("12","0","0","2014-01-03");
INSERT INTO tb_cps_adminpasswords VALUES("13","0","0","2014-01-08");
INSERT INTO tb_cps_adminpasswords VALUES("14","0","7","2014-01-08");
INSERT INTO tb_cps_adminpasswords VALUES("15","0","9","2014-01-28");
INSERT INTO tb_cps_adminpasswords VALUES("16","0","0","2014-01-28");
INSERT INTO tb_cps_adminpasswords VALUES("17","0","3407936","2014-01-28");
INSERT INTO tb_cps_adminpasswords VALUES("18","0","192023","2014-02-03");
INSERT INTO tb_cps_adminpasswords VALUES("19","0","14","2014-02-03");
INSERT INTO tb_cps_adminpasswords VALUES("20","0","192023","2014-02-05");
INSERT INTO tb_cps_adminpasswords VALUES("21","0","0","2014-02-05");
INSERT INTO tb_cps_adminpasswords VALUES("22","0","1","2014-02-15");
INSERT INTO tb_cps_adminpasswords VALUES("23","0","8","2014-02-15");
INSERT INTO tb_cps_adminpasswords VALUES("24","0","192023","2015-02-14");
INSERT INTO tb_cps_adminpasswords VALUES("25","0","0","2015-02-14");
INSERT INTO tb_cps_adminpasswords VALUES("26","2079","192023","2015-06-02");
INSERT INTO tb_cps_adminpasswords VALUES("27","0","1","2016-01-13");
INSERT INTO tb_cps_adminpasswords VALUES("28","0","25","2016-01-18");
INSERT INTO tb_cps_adminpasswords VALUES("29","0","192023","2016-01-18");
INSERT INTO tb_cps_adminpasswords VALUES("30","0","0","2016-01-18");
INSERT INTO tb_cps_adminpasswords VALUES("31","0","202","2016-01-19");
INSERT INTO tb_cps_adminpasswords VALUES("32","0","250","2016-01-19");
INSERT INTO tb_cps_adminpasswords VALUES("33","0","192023","2016-01-19");
INSERT INTO tb_cps_adminpasswords VALUES("34","0","0","2016-01-19");
INSERT INTO tb_cps_adminpasswords VALUES("35","0","1","2016-01-19");
INSERT INTO tb_cps_adminpasswords VALUES("36","0","7113","2016-01-29");
INSERT INTO tb_cps_adminpasswords VALUES("37","0","0","2023-01-21");
INSERT INTO tb_cps_adminpasswords VALUES("38","0","0","2023-01-21");
INSERT INTO tb_cps_adminpasswords VALUES("39","0","6835","2023-01-21");
INSERT INTO tb_cps_adminpasswords VALUES("40","0","6444","2023-01-21");
INSERT INTO tb_cps_adminpasswords VALUES("41","0","2","2023-05-06");
INSERT INTO tb_cps_adminpasswords VALUES("42","0","9","2023-05-06");



DROP TABLE tb_cps_chequeseries;

CREATE TABLE `tb_cps_chequeseries` (
  `series_id` int(11) NOT NULL AUTO_INCREMENT,
  `series_transationcode` int(2) NOT NULL,
  `series_branchcode` int(3) NOT NULL,
  `serise_branchcode_branch` int(11) NOT NULL,
  `series_from` int(6) unsigned zerofill NOT NULL,
  `series_to` int(6) unsigned zerofill NOT NULL,
  `series_lastno` int(6) unsigned zerofill NOT NULL,
  `serise_Bank` int(3) NOT NULL,
  `branch_sub_code` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`series_id`)
) ENGINE=MyISAM AUTO_INCREMENT=195 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO tb_cps_chequeseries VALUES("180","10","2","502","000001","555555","000016","1","502");
INSERT INTO tb_cps_chequeseries VALUES("181","11","35","152","000001","555555","001857","1","003");
INSERT INTO tb_cps_chequeseries VALUES("183","10","4","152","111111","999999","116529","1","050");
INSERT INTO tb_cps_chequeseries VALUES("184","13","1","2","111111","333333","222962","1","002");
INSERT INTO tb_cps_chequeseries VALUES("185","12","4","152","111111","444444","222372","1","050");
INSERT INTO tb_cps_chequeseries VALUES("186","13","4","152","111111","444444","222372","1","050");
INSERT INTO tb_cps_chequeseries VALUES("187","11","1","52","000001","999999","000076","1","052");
INSERT INTO tb_cps_chequeseries VALUES("188","11","2","2","000001","999999","002341","1","002");
INSERT INTO tb_cps_chequeseries VALUES("189","10","1","2","000001","999999","000649","1","002");
INSERT INTO tb_cps_chequeseries VALUES("190","11","5","6","000000","999999","000007","1","006");
INSERT INTO tb_cps_chequeseries VALUES("191","10","5","54","000001","999999","000712","1","054");
INSERT INTO tb_cps_chequeseries VALUES("192","13","5","6","000001","999999","000004","1","006");
INSERT INTO tb_cps_chequeseries VALUES("193","12","5","6","000001","999999","000004","1","006");
INSERT INTO tb_cps_chequeseries VALUES("194","11","7","504","000001","999999","000328","1","504");



DROP TABLE tb_cps_grouppermissions;

CREATE TABLE `tb_cps_grouppermissions` (
  `permission_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `page_accessible` varchar(150) NOT NULL,
  `page_read` varchar(2) NOT NULL,
  `page_write` varchar(2) NOT NULL,
  `page_edit` varchar(2) NOT NULL,
  PRIMARY KEY (`permission_id`)
) ENGINE=MyISAM AUTO_INCREMENT=60 DEFAULT CHARSET=latin1;




DROP TABLE tb_cps_groups;

CREATE TABLE `tb_cps_groups` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(100) NOT NULL,
  `group_createddate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;

INSERT INTO tb_cps_groups VALUES("30","ADMINISTRATOR","2013-02-10 23:58:24");



DROP TABLE tb_cps_halfdays;

CREATE TABLE `tb_cps_halfdays` (
  `branch_halfday_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` int(11) NOT NULL,
  `monday` tinyint(1) unsigned NOT NULL DEFAULT '0',
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

INSERT INTO tb_cps_halfdays VALUES("53","3","0","0","0","0","0","1","0","9:00am","1:00pm");
INSERT INTO tb_cps_halfdays VALUES("52","2","0","0","0","0","0","1","0","9:00am","1:00pm");
INSERT INTO tb_cps_halfdays VALUES("54","4","0","0","0","0","0","1","0","9:00am","1:00pm");
INSERT INTO tb_cps_halfdays VALUES("55","5","0","0","0","0","0","1","0","10:00am","2:00pm");
INSERT INTO tb_cps_halfdays VALUES("56","6","0","0","0","0","0","1","0","9:30am","1:30pm");



DROP TABLE tb_cps_holidays;

CREATE TABLE `tb_cps_holidays` (
  `branch_holiday_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` int(11) NOT NULL,
  `monday` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `tuesday` tinyint(4) NOT NULL DEFAULT '0',
  `wednesday` tinyint(4) NOT NULL DEFAULT '0',
  `thursday` tinyint(4) NOT NULL DEFAULT '0',
  `friday` tinyint(4) NOT NULL DEFAULT '0',
  `saturday` tinyint(4) NOT NULL DEFAULT '0',
  `sunday` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`branch_holiday_id`)
) ENGINE=MyISAM AUTO_INCREMENT=74 DEFAULT CHARSET=ucs2;

INSERT INTO tb_cps_holidays VALUES("63","3","0","0","0","0","0","0","1");
INSERT INTO tb_cps_holidays VALUES("62","2","0","0","0","0","0","0","1");
INSERT INTO tb_cps_holidays VALUES("61","3","0","0","0","0","0","0","1");
INSERT INTO tb_cps_holidays VALUES("60","2","0","0","0","0","0","0","1");
INSERT INTO tb_cps_holidays VALUES("59","3","0","0","0","0","0","0","1");
INSERT INTO tb_cps_holidays VALUES("58","3","0","0","0","0","0","0","1");
INSERT INTO tb_cps_holidays VALUES("57","2","0","0","0","0","0","0","1");
INSERT INTO tb_cps_holidays VALUES("64","4","0","0","0","0","0","0","1");
INSERT INTO tb_cps_holidays VALUES("65","5","0","0","0","0","0","0","1");
INSERT INTO tb_cps_holidays VALUES("66","6","0","0","0","0","0","0","1");
INSERT INTO tb_cps_holidays VALUES("67","6","0","0","0","0","0","0","1");
INSERT INTO tb_cps_holidays VALUES("68","2","0","0","0","0","0","0","1");
INSERT INTO tb_cps_holidays VALUES("69","2","0","0","0","0","0","0","1");
INSERT INTO tb_cps_holidays VALUES("70","2","0","0","0","0","0","0","1");
INSERT INTO tb_cps_holidays VALUES("71","2","0","0","0","0","0","0","1");
INSERT INTO tb_cps_holidays VALUES("72","2","0","0","0","0","0","0","1");
INSERT INTO tb_cps_holidays VALUES("73","7","0","0","0","0","0","0","0");



DROP TABLE tb_cps_mapbankfields;

CREATE TABLE `tb_cps_mapbankfields` (
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

INSERT INTO tb_cps_mapbankfields VALUES("1","cps_unique_req","cps_unique_req","10","15","15","Numeric","");
INSERT INTO tb_cps_mapbankfields VALUES("2","cps_micr_code","cps_micr_code","9","9","9","Numeric","");
INSERT INTO tb_cps_mapbankfields VALUES("3","cps_branchmicr_code","cps_branchmicr_code","3","3","3","Numeric","");
INSERT INTO tb_cps_mapbankfields VALUES("4","cps_account_no","cps_account_no","15","15","15","Numeric","");
INSERT INTO tb_cps_mapbankfields VALUES("5","cps_act_name","cps_act_name","1","35","35","Varchar","");
INSERT INTO tb_cps_mapbankfields VALUES("6","cps_book_size","cps_book_size","1","3","3","Numeric","");
INSERT INTO tb_cps_mapbankfields VALUES("7","cps_no_of_books","cps_no_of_books","1","2","2","Numeric","");
INSERT INTO tb_cps_mapbankfields VALUES("8","cps_dly_bearer_order","cps_dly_bearer_order","1","1","1","Varchar","");
INSERT INTO tb_cps_mapbankfields VALUES("9","cps_tr_code","cps_tr_code","2","2","2","Numeric","");
INSERT INTO tb_cps_mapbankfields VALUES("10","cps_atpar","cps_atpar","1","1","1","Numeric","");
INSERT INTO tb_cps_mapbankfields VALUES("11","cps_act_jointname1","cps_act_jointname1","0","35","35","Varchar","");
INSERT INTO tb_cps_mapbankfields VALUES("12","cps_act_jointname2","cps_act_jointname2","0","35","35","Varchar","");
INSERT INTO tb_cps_mapbankfields VALUES("13","cps_auth_sign1","cps_auth_sign1","0","35","35","Varchar","");
INSERT INTO tb_cps_mapbankfields VALUES("14","cps_auth_sign2","cps_auth_sign2","0","35","35","Varchar","");
INSERT INTO tb_cps_mapbankfields VALUES("15","cps_auth_sign3","cps_auth_sign3","0","35","35","Varchar","");
INSERT INTO tb_cps_mapbankfields VALUES("16","cps_act_address1","cps_act_address1","0","50","50","Varchar","");
INSERT INTO tb_cps_mapbankfields VALUES("17","cps_act_address2","cps_act_address2","0","50","50","Varchar","");
INSERT INTO tb_cps_mapbankfields VALUES("18","cps_act_city","cps_act_city","0","30","30","Varchar","");
INSERT INTO tb_cps_mapbankfields VALUES("19","cps_state","cps_state","0","30","30","Varchar","");
INSERT INTO tb_cps_mapbankfields VALUES("20","cps_country","cps_country","0","30","30","Varchar","");
INSERT INTO tb_cps_mapbankfields VALUES("21","cps_emailid","cps_emailid","0","50","50","Varchar","");
INSERT INTO tb_cps_mapbankfields VALUES("22","cps_act_pin","cps_act_pin","0","30","30","Varchar","");
INSERT INTO tb_cps_mapbankfields VALUES("23","cps_act_telephone_res","cps_act_telephone_res","0","15","15","Numeric","");
INSERT INTO tb_cps_mapbankfields VALUES("24","cps_act_telephone_off","cps_act_telephone_off","0","15","15","Numeric","");
INSERT INTO tb_cps_mapbankfields VALUES("25","cps_act_mobile","cps_act_mobile","0","15","15","Numeric","");
INSERT INTO tb_cps_mapbankfields VALUES("26","cps_chq_no_from","cps_chq_no_from","0","6","6","Numeric","");
INSERT INTO tb_cps_mapbankfields VALUES("27","cps_chq_no_to","cps_chq_no_to","0","6","6","Numeric","");



DROP TABLE tb_cps_nonworkingdays;

CREATE TABLE `tb_cps_nonworkingdays` (
  `branch_nonworkingday_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` int(11) NOT NULL,
  `monday` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `tuesday` tinyint(4) NOT NULL DEFAULT '0',
  `wednesday` tinyint(4) NOT NULL DEFAULT '0',
  `thursday` tinyint(4) NOT NULL DEFAULT '0',
  `friday` tinyint(4) NOT NULL DEFAULT '0',
  `saturday` tinyint(4) NOT NULL DEFAULT '0',
  `sunday` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`branch_nonworkingday_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=ucs2;




DROP TABLE tb_cps_reprintque;

CREATE TABLE `tb_cps_reprintque` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `cps_unique_req` bigint(8) unsigned zerofill NOT NULL,
  `cps_micr_code` int(3) unsigned zerofill NOT NULL,
  `cps_branchmicr_code` int(3) unsigned zerofill NOT NULL,
  `cps_account_no` varchar(15) NOT NULL,
  `cps_act_name` varchar(128) NOT NULL,
  `cps_no_of_books` int(3) NOT NULL,
  `cps_dly_bearer_order` varchar(1) NOT NULL,
  `cps_book_size` int(3) NOT NULL,
  `cps_tr_code` int(2) unsigned zerofill NOT NULL,
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
  `cps_chq_no_from` bigint(6) unsigned zerofill NOT NULL,
  `cps_chq_no_to` bigint(6) unsigned zerofill NOT NULL,
  `cps_micr_account_no` int(6) unsigned zerofill NOT NULL,
  `cps_date` date NOT NULL,
  `cps_process_user_id` int(6) NOT NULL,
  `cps_bsr_code` varchar(6) DEFAULT NULL,
  `cps_pr_code` varchar(4) DEFAULT NULL,
  `cps_reprint_approved` int(1) NOT NULL DEFAULT '0',
  `cps_short_name` varchar(40) DEFAULT NULL,
  `cps_product_code` varchar(5) DEFAULT NULL,
  `branch_sub_code` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

INSERT INTO tb_cps_reprintque VALUES("9","00173041","431812052","052","431001023055575","PAWAR SAVITA SHYAM","1","Y","15","10","","","","","","","BHAGYODAY NAGAR AMBAD ROAD","BHAGYODAY NAGAR AMBAD ROAD","BHAGYODAY NAGAR AMBAD ROAD","JALNA","431203","JALNA","","","","431203","","","","","735241","735255","055575","2024-04-19","1","","","0","","","052");
INSERT INTO tb_cps_reprintque VALUES("10","00173060","431812502","502","431003023010671","RATHOD UJWALA GAJENDRA","1","Y","15","10","","","","","","","AT POST DHAMANGAON ","TQ BADNAPUR DIST JALNA","","DHAMANGAON","431213","DHAMANGAON","","","","431213","","","","","100556","100570","010671","2024-04-19","1","","","0","","","502");
INSERT INTO tb_cps_reprintque VALUES("11","00173058","431812504","504","431005023010778","KOLEKAR RAMKISAN VITTAL","1","Y","15","10","","","","","","","AT POST GHUNGARDE HADGAON","TQ AMBAD","DIST JALNA","GHUNGARDE HADGAON","431212","GHUNGARDE HADGAON","","","","431212","","","","","107806","107820","010778","2024-04-19","1","","","0","","","504");
INSERT INTO tb_cps_reprintque VALUES("12","00173059","431812504","504","431005023010025","SATPUTE MADAN GOVINDRAO","1","Y","15","10","","","","","","","AT SIDDHESHWAR PIMPALGAON ","TQ GHANSAWANGI","DIST JALNA","SIDDHESHWAR PIMPALGAON","431209","SIDDHESHWAR PIMPALGAON","","","","431209","","","","","107821","107835","010025","2024-04-19","1","","","0","","","504");
INSERT INTO tb_cps_reprintque VALUES("13","00173057","431812504","504","431005021000706","RAJMUDRA SWAYAM SAHAYYATA BACHAT GAT RAMASGAON","3","Y","3","11","","","","authorised signatory","","","AT POST RAMASGAON ","TQ GHANSAWANGI ","DIST JALNA ","RAMASGAON","431209","RAMASGAON","","","","431209","","","","","069166","069225","000706","2024-04-19","1","","","0","","","504");



DROP TABLE tb_cps_settings;

CREATE TABLE `tb_cps_settings` (
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
  `chk_no_from` int(6) unsigned zerofill NOT NULL,
  `chk_no_to` int(6) unsigned zerofill NOT NULL,
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

INSERT INTO tb_cps_settings VALUES("","uploads/","Excel","","","Excel","","","0","1","000000","000000","9","365","Priyadarshani Nagari Shakari Bank Ltd Jalna","DevHarsh Infotech Pvt Ltd","thane logo.jpg","Penguins.jpg","","","","","","360","","","","0000-00-00","0","0000-00-00","0","0","0","0");



DROP TABLE tb_cps_transactioncodes;

CREATE TABLE `tb_cps_transactioncodes` (
  `transactioncode_id` int(11) NOT NULL AUTO_INCREMENT,
  `transactioncode` int(2) NOT NULL,
  `transactioncodedescription` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `transactionstatus` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`transactioncode_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO tb_cps_transactioncodes VALUES("1","10","SAVINGS ACCOUNT","0");
INSERT INTO tb_cps_transactioncodes VALUES("2","11","CURRENT","0");
INSERT INTO tb_cps_transactioncodes VALUES("3","12","PAY ORDER","0");
INSERT INTO tb_cps_transactioncodes VALUES("4","13","CASH CREDIT","0");



DROP TABLE tb_cps_weekdays;

CREATE TABLE `tb_cps_weekdays` (
  `branch_workingday_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` int(11) NOT NULL,
  `monday` tinyint(1) unsigned NOT NULL DEFAULT '0',
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

INSERT INTO tb_cps_weekdays VALUES("53","3","1","1","1","1","1","0","0","9:00am","5:00pm");
INSERT INTO tb_cps_weekdays VALUES("52","2","1","1","1","1","1","0","0","9:00am","6:00pm");
INSERT INTO tb_cps_weekdays VALUES("54","4","1","1","1","1","1","0","0","9:00am","5:00pm");
INSERT INTO tb_cps_weekdays VALUES("55","5","1","1","1","1","1","0","0","10:00am","6:00pm");
INSERT INTO tb_cps_weekdays VALUES("56","6","1","1","1","1","1","0","0","9:30am","5:30pm");
INSERT INTO tb_cps_weekdays VALUES("57","7","0","0","0","0","0","0","0","","");



DROP TABLE tb_customer;

CREATE TABLE `tb_customer` (
  `cust_id` int(11) NOT NULL AUTO_INCREMENT,
  `cust_short_name` varchar(30) NOT NULL,
  `cust_name` varchar(50) NOT NULL,
  `cust_address` text NOT NULL,
  `cust_acc_no` varchar(15) NOT NULL,
  KEY `cust_id` (`cust_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

INSERT INTO tb_customer VALUES("1","AADEEPTA","AADEEPTA V.SHETTY & VIIVECK V.SHETTY","27,4/F,GURU BHAKTI NIWAS,GURU MANDIR RD,DOMBIVLI (EAST)-421 201.","H15792102956");
INSERT INTO tb_customer VALUES("2","ABHILASHA","ABHILASHA OZA","SHIV-VASANTI,BLDG.16,H.F.SOCIETY ROAD,  JOGESHWARI(E),MUMBAI 400 060.","H15792100857");
INSERT INTO tb_customer VALUES("3","ABHISHEK","ABHISHEK BHARTIA","A-603,KRISHRAJ TWR,CHICKUWADI,BORIVALI-WOPP.OMKAR HIGH COURT SOC,M-92.","H15792101900");



DROP TABLE tb_manual_print;

CREATE TABLE `tb_manual_print` (
  `mp_Id` int(11) NOT NULL AUTO_INCREMENT,
  `mp_AccountHolder_Id` int(11) NOT NULL,
  `mp_BookSize` int(4) NOT NULL,
  `mp_NoOfBooks` int(4) NOT NULL,
  `mp_Chk_From` int(7) NOT NULL,
  `mp_Chk_To` int(7) NOT NULL,
  PRIMARY KEY (`mp_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;




DROP TABLE tb_pending_print_req;

CREATE TABLE `tb_pending_print_req` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `cps_unique_req` bigint(8) unsigned zerofill NOT NULL,
  `cps_micr_code` int(3) unsigned zerofill NOT NULL,
  `cps_branchmicr_code` int(3) unsigned zerofill NOT NULL,
  `cps_account_no` varchar(15) NOT NULL,
  `cps_act_name` varchar(128) NOT NULL,
  `cps_no_of_books` int(2) unsigned zerofill NOT NULL,
  `cps_dly_bearer_order` varchar(1) NOT NULL,
  `cps_book_size` int(3) unsigned zerofill NOT NULL,
  `cps_tr_code` int(2) unsigned zerofill NOT NULL,
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
  `cps_chq_no_from` bigint(6) unsigned zerofill NOT NULL,
  `cps_chq_no_to` bigint(6) unsigned zerofill NOT NULL,
  `cps_micr_account_no` int(6) unsigned zerofill NOT NULL,
  `cps_date` date NOT NULL,
  `cps_process_user_id` int(6) NOT NULL,
  `cps_isprint` int(1) NOT NULL DEFAULT '0',
  `cps_bsr_code` varchar(6) DEFAULT NULL,
  `cps_pr_code` varchar(4) DEFAULT NULL,
  `cps_short_name` varchar(40) DEFAULT NULL,
  `cps_product_code` varchar(5) DEFAULT NULL,
  `branch_sub_code` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;




DROP TABLE tb_print_req_collection;

CREATE TABLE `tb_print_req_collection` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `cps_unique_req` bigint(8) unsigned zerofill NOT NULL,
  `cps_micr_code` int(3) unsigned zerofill NOT NULL,
  `cps_branchmicr_code` int(3) unsigned zerofill NOT NULL,
  `cps_account_no` varchar(15) NOT NULL,
  `cps_act_name` varchar(128) NOT NULL,
  `cps_no_of_books` int(2) unsigned zerofill NOT NULL,
  `cps_dly_bearer_order` varchar(1) NOT NULL,
  `cps_book_size` int(3) unsigned zerofill NOT NULL,
  `cps_tr_code` int(2) unsigned zerofill NOT NULL,
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
  `cps_chq_no_from` bigint(6) unsigned zerofill NOT NULL,
  `cps_chq_no_to` bigint(6) unsigned zerofill NOT NULL,
  `cps_micr_account_no` int(6) unsigned zerofill NOT NULL,
  `cps_date` date NOT NULL,
  `cps_process_user_id` int(6) NOT NULL,
  `cps_is_reprint` int(1) NOT NULL DEFAULT '0',
  `cps_pr_code` varchar(4) DEFAULT NULL,
  `cps_bsr_code` varchar(6) DEFAULT NULL,
  `cps_short_name` varchar(40) DEFAULT NULL,
  `cps_product_code` varchar(5) DEFAULT NULL,
  `branch_sub_code` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=latin1;

INSERT INTO tb_print_req_collection VALUES("54","00173057","431812504","504","431005021000706","RAJMUDRA SWAYAM SAHAYYATA BACHAT GAT RAMASGAON","03","Y","003","11","","","","authorised signatory","","","AT POST RAMASGAON ","TQ GHANSAWANGI ","DIST JALNA ","RAMASGAON","431209","RAMASGAON","","","","431209","","","","","069166","069225","000706","2024-05-09","1","0","","","","","504");



DROP TABLE tb_print_sequence;

CREATE TABLE `tb_print_sequence` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `cps_unique_req` bigint(8) unsigned zerofill NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;




DROP TABLE tb_printadmin;

CREATE TABLE `tb_printadmin` (
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

INSERT INTO tb_printadmin VALUES("admin","21232f297a57a5a743894a0e4a801fc3","2012-04-21 00:00:00","1","0","0","1","0","admin","2024-01-02","1");
INSERT INTO tb_printadmin VALUES("reprint","1babe098befd805689339582881da1d8","2015-05-31 00:00:00","16","0","0","1","1","reprint","2024-01-02","1");



DROP TABLE tb_printque;

CREATE TABLE `tb_printque` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `cps_unique_req` bigint(8) unsigned zerofill NOT NULL,
  `cps_micr_code` int(3) unsigned zerofill NOT NULL,
  `cps_branchmicr_code` int(3) unsigned zerofill NOT NULL,
  `cps_account_no` varchar(15) NOT NULL,
  `cps_act_name` varchar(128) NOT NULL,
  `cps_no_of_books` int(2) unsigned zerofill NOT NULL,
  `cps_dly_bearer_order` varchar(1) NOT NULL,
  `cps_book_size` int(3) unsigned zerofill NOT NULL,
  `cps_tr_code` int(2) unsigned zerofill NOT NULL,
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
  `cps_chq_no_from` bigint(6) unsigned zerofill NOT NULL,
  `cps_chq_no_to` bigint(6) unsigned zerofill NOT NULL,
  `cps_micr_account_no` int(6) unsigned zerofill NOT NULL,
  `cps_date` date NOT NULL,
  `cps_process_user_id` int(6) NOT NULL,
  `cps_bsr_code` varchar(6) DEFAULT NULL,
  `cps_pr_code` varchar(4) DEFAULT NULL,
  `cps_short_name` varchar(40) DEFAULT NULL,
  `cps_product_code` varchar(5) DEFAULT NULL,
  `branch_sub_code` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;




DROP TABLE tb_reprint_req_collection;

CREATE TABLE `tb_reprint_req_collection` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `cps_unique_req` bigint(8) unsigned zerofill NOT NULL,
  `cps_micr_code` int(3) unsigned zerofill NOT NULL,
  `cps_branchmicr_code` int(3) unsigned zerofill NOT NULL,
  `cps_account_no` varchar(15) NOT NULL,
  `cps_act_name` varchar(128) NOT NULL,
  `cps_no_of_books` int(2) unsigned zerofill NOT NULL,
  `cps_dly_bearer_order` varchar(1) NOT NULL,
  `cps_book_size` int(3) unsigned zerofill NOT NULL,
  `cps_tr_code` int(2) unsigned zerofill NOT NULL,
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
  `cps_chq_no_from` bigint(6) unsigned zerofill NOT NULL,
  `cps_chq_no_to` bigint(6) unsigned zerofill NOT NULL,
  `cps_micr_account_no` int(6) unsigned zerofill NOT NULL,
  `cps_date` date NOT NULL,
  `cps_process_user_id` int(6) NOT NULL,
  `cps_is_reprint` int(1) NOT NULL DEFAULT '0',
  `cps_pr_code` varchar(4) NOT NULL,
  `cps_bsr_code` varchar(6) NOT NULL,
  `cps_short_name` varchar(40) DEFAULT NULL,
  `cps_product_code` varchar(5) DEFAULT NULL,
  `branch_sub_code` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;




DROP TABLE tb_statemaster;

CREATE TABLE `tb_statemaster` (
  `state_id` int(11) NOT NULL AUTO_INCREMENT,
  `state_name` varchar(50) NOT NULL,
  `country_id` int(11) NOT NULL,
  `state_code` varchar(7) NOT NULL,
  `state_name_al` varchar(4) NOT NULL,
  `is_delete` int(2) NOT NULL,
  PRIMARY KEY (`state_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

INSERT INTO tb_statemaster VALUES("1","GUJRAT","1","GUJ001","GUJ","1");
INSERT INTO tb_statemaster VALUES("2","MAHARASHTRA","1","MAH001","MAH","0");
INSERT INTO tb_statemaster VALUES("3","KARNATAKA","1","KAR001","KAR","1");
INSERT INTO tb_statemaster VALUES("4","GOA","1","GOA001","GOA","1");



DROP TABLE tb_suburbmaster;

CREATE TABLE `tb_suburbmaster` (
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
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO tb_suburbmaster VALUES("1","AMBAD ROAD ","431213","AMB001","MAL","1","2","2","0");
INSERT INTO tb_suburbmaster VALUES("2","RAMNAGAR ","431214","RAM001","SAV","1","2","2","0");
INSERT INTO tb_suburbmaster VALUES("3","SHAHAGAD ","431212","SHA001","NAG","1","2","2","0");
INSERT INTO tb_suburbmaster VALUES("4","RAJA ROAD ","431203","RAJ001","RAJ","1","2","2","0");
INSERT INTO tb_suburbmaster VALUES("5","MAIN ROAD","431211","MAI001","MAI","1","2","2","0");



DROP TABLE tb_uploadingdata;

CREATE TABLE `tb_uploadingdata` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `cps_unique_req` bigint(8) unsigned zerofill NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=latin1;

INSERT INTO tb_uploadingdata VALUES("22","00173037","431812052","052","431001023042652","UBALE NITIN SUNIL","1","Y","15","11","","","","","","","NANDAPUR JALNA ","TQ JALNA ","DIST JALNA","JALNA","431203","JALNA","","","","431203","","","","","735031","735045","042652","2024-05-09","1","","","","2024-05-09","","052");
INSERT INTO tb_uploadingdata VALUES("23","00173038","431812052","052","431001023070050","KOLHE VITTHAL JAGANNATH","1","Y","15","11","","","","","","","AT POST JAMWADI","TQ JALNA","DIST JALNA","JALNA","431203","JALNA","","","","431203","","","","","735151","735165","070050","2024-05-09","1","","","","2024-05-09","","052");
INSERT INTO tb_uploadingdata VALUES("24","00173039","431812052","052","431001023059844","THAKAR NIKITA LAHU","1","Y","15","11","","","","","","","INDIRA NAGAR OLD JALNA","TQ JALNA","DIST JALNA","JALNA","431203","JALNA","","","","431203","","","","","735166","735180","059844","2024-05-09","1","","","","2024-05-09","","052");
INSERT INTO tb_uploadingdata VALUES("25","00173040","431812052","052","431001023003224","JAGTAP DATTU GANPAT","1","Y","60","11","","","","","","","AT NIWADUNGA POST DONGAON","TQ JAFRABAD DIST JAL","NA","JALNA","431203","JALNA","","","","431203","","","","","735181","735240","003224","2024-05-09","1","","","","2024-05-09","","052");
INSERT INTO tb_uploadingdata VALUES("26","00173041","431812052","052","431001023055575","PAWAR SAVITA SHYAM","1","Y","15","10","","","","","","","BHAGYODAY NAGAR AMBAD ROAD","BHAGYODAY NAGAR AMBAD ROAD","BHAGYODAY NAGAR AMBAD ROAD","JALNA","431203","JALNA","","","","431203","","","","","735241","735255","055575","2024-05-09","1","","","","2024-05-09","","052");
INSERT INTO tb_uploadingdata VALUES("27","00173042","431812503","503","431004023020367","VAIDYA BHARAT SUDAM","1","Y","15","10","","","","","","","AT HATADI POST KANDARI","TQ GHANSAWANGI","DIST JALNA ","HATADI","431207","HATADI","","","","431207","","","","","206261","206275","020367","2024-05-09","1","","","","2024-05-09","","503");
INSERT INTO tb_uploadingdata VALUES("28","00173043","431812503","503","431004023000794","DHAVALE BHAGWAT TULSHIRAM","1","Y","15","10","","","","","","","AT PO KOKATE HADGAON","TQ PARTUR","DIST JALNA","KOKATE HADGAON","431507","KOKATE HADGAON","","","","431507","","","","","206276","206290","000794","2024-05-09","1","","","","2024-05-09","","503");
INSERT INTO tb_uploadingdata VALUES("29","00173044","431812503","503","431004023005039","RAUT SHIVAJI KARABHARI","1","Y","15","10","","","","","","","AT GHONSI KHURD PO M CHINCHOL ","TQ GHANSAWANGI ","DIST JALNA   ","GHONSI         ","431211","GHONSI         ","","","","431211","","","","","206291","206305","005039","2024-05-09","1","","","","2024-05-09","","503");
INSERT INTO tb_uploadingdata VALUES("30","00173045","431812503","503","431004023013727","ADHE DNYANOBA MOHANDAS","1","Y","15","10","","","","","","","AT PARATWADI POST ASHTI","TQ PARTUR","DIST JALNA","PARATWADI","431507","PARATWADI","","","","431507","","","","","206306","206320","013727","2024-05-09","1","","","","2024-05-09","","503");
INSERT INTO tb_uploadingdata VALUES("31","00173046","431812054","054","431007023000349","TELTUMBADE SANGITA MAHENDRA","1","Y","15","10","","","","","","","AT DEVIPADA ROAD BUDH VIHAR","BHANDUP WEST MUMBAI","MUMBAI","MUMBAI","400078","MUMBAI","","","","400078","","","","","005146","005160","000349","2024-05-09","1","","","","2024-05-09","","054");
INSERT INTO tb_uploadingdata VALUES("32","00173047","431812054","054","431007023000416","DAHIWAL SOPAN BABURAO","1","Y","15","10","","","","","","","AT NEAR MAHALAXMI MANDIR","SASHT PIMPALGAON","TQ AMBAD DIST JALNA","JALNA","431212","JALNA","","","","431212","","","","","005161","005175","000416","2024-05-09","1","","","","2024-05-09","","054");
INSERT INTO tb_uploadingdata VALUES("33","00173048","431812054","054","431007023000417","PACHUNDE YOGESH ABASAHEB","1","Y","15","10","","","","","","","AT PATHARWALA KHURD","POST ANKUSH NAGAR TQ AMBAD","DIST JALNA","PATHARWALA KHURD","431212","PATHARWALA KHURD","","","","431212","","","","","005176","005190","000417","2024-05-09","1","","","","2024-05-09","","054");
INSERT INTO tb_uploadingdata VALUES("34","00173049","431812054","054","431007023000408","GARULE ASHOK KALYANRAO","1","Y","15","10","","","","","","","AT POST DAHAYALA ","TQ AMBAD DIST JALNA","","DAHAYALA","431137","DAHAYALA","","","","431137","","","","","005191","005205","000408","2024-05-09","1","","","","2024-05-09","","054");
INSERT INTO tb_uploadingdata VALUES("35","00173050","431812054","054","431007023000409","WAYBHAT RAMNATH RAGHUNATH","1","Y","15","10","","","","","","","AT GANESH NAGAR CHURMAPURI ","POST SASTH PIMPALGAON ","TQ AMBAD DIST JALNA","CHURMAPURI","431212","CHURMAPURI","","","","431212","","","","","005206","005220","000409","2024-05-09","1","","","","2024-05-09","","054");
INSERT INTO tb_uploadingdata VALUES("36","00173051","431812054","054","431007023000410","LANGOTE BALIRAM SURSHE","1","Y","15","10","","","","","","","AT BHAMBERI POST DAHAYALA","TQ AMBAD DIST JALNA","","BHAMBERI","431204","BHAMBERI","","","","431204","","","","","005221","005235","000410","2024-05-09","1","","","","2024-05-09","","054");
INSERT INTO tb_uploadingdata VALUES("37","00173052","431812054","054","431007023000411","SHINDE SHAHADEV DEVIDAS","1","Y","15","10","","","","","","","AT GANESH NAGAR CHURMAPURI","TQ AMBAD DIST JALNA","","CHURMAPURI","431212","CHURMAPURI","","","","431212","","","","","005236","005250","000411","2024-05-09","1","","","","2024-05-09","","054");
INSERT INTO tb_uploadingdata VALUES("38","00173053","431812054","054","431007023000412","RODI UMESH SARJERAO","1","Y","15","10","","","","","","","AT ANTARWALI SARATI POST NALEW","TQ AMBAD DIST JALNA","","ANTARWALI SARATI","431204","ANTARWALI SARATI","","","","431204","","","","","005251","005265","000412","2024-05-09","1","","","","2024-05-09","","054");
INSERT INTO tb_uploadingdata VALUES("39","00173054","431812054","054","431007023000413","DUCHE DWARKADAS VITTHALRAO","1","Y","15","10","","","","","","","AT POST PITHORI SIRASGAON","TQ AMBAD DIST JALNA","","PITHORI SIRASGAON","431205","PITHORI SIRASGAON","","","","431205","","","","","005266","005280","000413","2024-05-09","1","","","","2024-05-09","","054");
INSERT INTO tb_uploadingdata VALUES("40","00173055","431812054","054","431007023000414","KANKE VIVEK CHANDRABHAN","1","Y","15","10","","","","","","","AT BHAMBERI POST DAHAYALA","TQ AMBAD DIST JALNA","","BHAMBERI ","431204","BHAMBERI ","","","","431204","","","","","005281","005295","000414","2024-05-09","1","","","","2024-05-09","","054");
INSERT INTO tb_uploadingdata VALUES("41","00173056","431812054","054","431007023000415","BARVE BHAGWAT ASHRAJI","1","Y","15","10","","","","","","","AT POST DAHAYALA ","TQAMBAD","DIST JALNA","DAHAYALA","431137","DAHAYALA","","","","431137","","","","","005296","005310","000415","2024-05-09","1","","","","2024-05-09","","054");
INSERT INTO tb_uploadingdata VALUES("43","00173058","431812504","504","431005023010778","KOLEKAR RAMKISAN VITTAL","1","Y","15","10","","","","","","","AT POST GHUNGARDE HADGAON","TQ AMBAD","DIST JALNA","GHUNGARDE HADGAON","431212","GHUNGARDE HADGAON","","","","431212","","","","","107806","107820","010778","2024-05-09","1","","","","2024-05-09","","504");
INSERT INTO tb_uploadingdata VALUES("44","00173059","431812504","504","431005023010025","SATPUTE MADAN GOVINDRAO","1","Y","15","10","","","","","","","AT SIDDHESHWAR PIMPALGAON ","TQ GHANSAWANGI","DIST JALNA","SIDDHESHWAR PIMPALGAON","431209","SIDDHESHWAR PIMPALGAON","","","","431209","","","","","107821","107835","010025","2024-05-09","1","","","","2024-05-09","","504");
INSERT INTO tb_uploadingdata VALUES("45","00173060","431812502","502","431003023010671","RATHOD UJWALA GAJENDRA","1","Y","15","10","","","","","","","AT POST DHAMANGAON ","TQ BADNAPUR DIST JALNA","","DHAMANGAON","431213","DHAMANGAON","","","","431213","","","","","100556","100570","010671","2024-05-09","1","","","","2024-05-09","","502");
INSERT INTO tb_uploadingdata VALUES("46","00173061","431812501","501","431002023009347","PAWAR VIJAY KESU","1","Y","15","10","","","","","","","AT BAJIUMRAD POST WAKHARI","TQ DIST JALNA","","JALNA","431203","JALNA","","","","431203","","","","","134046","134060","009347","2024-05-09","1","","","","2024-05-09","","501");



