CREATE TABLE `idp_users` (
  `u_id` int(20) NOT NULL AUTO_INCREMENT,
  `u_name` varchar(20) NOT NULL,
  `u_pass` varchar(80) NOT NULL,
  `u_regcode` varchar(80) DEFAULT NULL,
  `u_type` int(11) DEFAULT '0',
  `u_activeflag` int(11) DEFAULT '0',
  `u_banflag` int(11) DEFAULT '0',
  PRIMARY KEY (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `idp_persons` (
  `p_id` int(11) NOT NULL AUTO_INCREMENT,
  `u_name` varchar(20) NOT NULL,
  `p_taxid` varchar(20) NOT NULL,
  `p_title` varchar(20) DEFAULT NULL,
  `p_surname` varchar(20) NOT NULL,
  `p_firstname` varchar(40) NOT NULL,
  `p_gender` int(11) DEFAULT '0',
  `p_birthdate` datetime DEFAULT NULL,
  `p_address` varchar(80) DEFAULT NULL,
  `p_email` varchar(40) DEFAULT NULL,
  `p_phone` varchar(20) DEFAULT NULL,
  `p_description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`p_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `idp_identities` (
  `i_id` int(11) NOT NULL AUTO_INCREMENT,
  `u_name` varchar(20) NOT NULL,
  `i_hash` varchar(80) NOT NULL,
  `i_purpose` varchar(40) DEFAULT NULL,
  `i_pubkey` varchar(100) DEFAULT NULL,
  `i_privkey` varchar(100) DEFAULT NULL,
  `i_mask` int(11) NOT NULL,
  PRIMARY KEY (`i_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `idp_enterprises` (
  `e_id` int(11) NOT NULL AUTO_INCREMENT,
  `u_name` varchar(20) NOT NULL,
  `e_name` varchar(40) NOT NULL,
  `e_manager` varchar(20) NOT NULL,
  `e_website` varchar(40) DEFAULT NULL,
  `e_found` datetime NOT NULL,
  `e_address` varchar(80) DEFAULT NULL,
  `e_email` varchar(40) DEFAULT NULL,
  `e_phone` varchar(20) DEFAULT NULL,
  `e_description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`e_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `idp_log` (
  `l_id` int(11) NOT NULL AUTO_INCREMENT,
  `l_type` int(11) NOT NULL DEFAULT '0',
  `u_name` char(20) NOT NULL,
  `l_date` datetime NOT NULL,
  `l_addr` char(16) NOT NULL,
  `l_mesg` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`l_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `idp_regcode` (
  `r_id` char(20) NOT NULL,
  `r_count` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`r_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

