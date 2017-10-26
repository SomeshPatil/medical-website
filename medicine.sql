-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 25, 2017 at 05:18 PM
-- Server version: 5.7.19-log
-- PHP Version: 7.1.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `medicine`
--
CREATE SCHEMA `medicine`;

USE `medicine`;

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `C_ID` int(11) NOT NULL,
  `Name` varchar(45) NOT NULL,
  `PIN` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`C_ID`, `Name`, `PIN`) VALUES
(1, 'Phzfer', 700100),
(2, 'Ranbaxy', 450405),
(3, 'Mankind', 100100),
(4, 'GlaxoSmithKline', 394270),
(5, 'Novartis', 700745),
(6, 'Alkem', 700745),
(7, 'Johnson&Johnson', 100100);

-- --------------------------------------------------------

--
-- Table structure for table `components`
--

CREATE TABLE `components` (
  `C_ID` int(11) NOT NULL,
  `cname` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `components`
--

INSERT INTO `components` (`C_ID`, `cname`) VALUES
(1, 'Paracetamol'),
(2, 'Oxymetazoline'),
(3, 'Pantaprazole'),
(4, 'Domperidone'),
(5, 'Rantidine'),
(6, 'Fluticasone Furoate'),
(7, 'Methyl Salicylate'),
(8, 'Menthol'),
(9, 'Ketokonazole'),
(10, 'Sodium Benzoate');

-- --------------------------------------------------------

--
-- Table structure for table `composition`
--

CREATE TABLE `composition` (
  `M_ID` int(11) NOT NULL,
  `C_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `composition`
--

INSERT INTO `composition` (`M_ID`, `C_ID`) VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 2),
(5, 3),
(5, 4),
(6, 5),
(7, 6),
(8, 7),
(9, 7),
(8, 8),
(9, 8),
(10, 9),
(3, 10),
(4, 10),
(7, 10);

-- --------------------------------------------------------

--
-- Table structure for table `contraindication`
--

CREATE TABLE `contraindication` (
  `C_ID1` int(11) NOT NULL,
  `C_ID2` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `contraindication`
--

INSERT INTO `contraindication` (`C_ID1`, `C_ID2`) VALUES
(6, 9);

--
-- Triggers `contraindication`
--
DELIMITER $$
CREATE TRIGGER `contraindication_BEFORE_INSERT` BEFORE INSERT ON `contraindication` FOR EACH ROW BEGIN
	IF (NEW.C_ID1 = NEW.C_ID2) THEN
		SIGNAL sqlstate '45000' SET MESSAGE_TEXT='Medication cannot contraindicate itself';
	END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `contraindication_BEFORE_UPDATE` BEFORE UPDATE ON `contraindication` FOR EACH ROW BEGIN
	IF (NEW.C_ID1 = NEW.C_ID2) THEN
		SIGNAL sqlstate '45000' SET MESSAGE_TEXT='Medication cannot contraindicate itself';
	END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `manufacturer`
--

CREATE TABLE `manufacturer` (
  `M_ID` int(11) NOT NULL,
  `C_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `manufacturer`
--

INSERT INTO `manufacturer` (`M_ID`, `C_ID`) VALUES
(7, 1),
(8, 2),
(9, 2),
(6, 3),
(1, 4),
(2, 4),
(4, 4),
(3, 5),
(5, 6),
(10, 7);

-- --------------------------------------------------------

--
-- Table structure for table `medicine`
--

CREATE TABLE `medicine` (
  `M_ID` int(11) NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Dosage` varchar(45) DEFAULT NULL,
  `Price` float DEFAULT NULL,
  `Info` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `medicine`
--

INSERT INTO `medicine` (`M_ID`, `Name`, `Dosage`, `Price`, `Info`) VALUES
(1, 'Crocin', '1 Tablet per 4-6 hrs. Max 3 Times a Day', 60, 'Crocin is an Analgesic and Antipyretic Agent that causes relieves pain. It has also shown to reduce fever by blocking pathways to brain that regulates temperature.'),
(2, 'Crocin - Fast Relief', '1 Tablet per 4-6 hrs. Max 3 Times a Day', 70, 'Crocin is an Analgesic and Antipyretic Agent that causes relieves pain. It has also shown to reduce fever by blocking pathways to brain that regulates temperature.'),
(3, 'Otrivin', '1-2 Drops per Nostril', 60.5, 'Otrivin works by constricting the blood vessels and reducing the mucus lining inside the nasal pathway allowing for more airflow.'),
(4, 'Nasivion', '1-2 Drops per Nostril', 50.5, 'Nasivion works by constricting the blood vessels and reducing the mucus lining inside the nasal pathway allowing for more airflow.'),
(5, 'PAN-D', '1 Capsule per Day before Food.', 90, 'PAN-D is a proton pump inhibitor that blocks the secretion of gastric juices relieving the symptoms. Domperidone is also known for reducing vomiting fits.'),
(6, 'Rantac', '1 Tablet before Food. Max twice daily.', 75.83, 'Rantac is a anti-histamine that blocks the secretion of excess gastric juices relieving symptoms.'),
(7, 'Fluticon-FT', '2 Sprays per Nostril twice a day', 120.33, 'Fluticon-FT [LSD]  is a topical Steroid that reduces inflamation of inner lining of nasal passage. '),
(8, 'Volini', 'Spray a thin layer over affected region', 95, 'Volini causes the muscles to relax thus relieving muscle pains.'),
(9, 'Volini - Cream', 'Apply a thin layer over affected region', 100.5, 'Volini causes the muscles to relax thus relieving muscle pains.'),
(10, 'Ketosol-2%', 'Wash Affected Area with solution twice a day.', 150, 'Ketoconazole is used by treating various skin disease like dermatitis and versicolor.');

-- --------------------------------------------------------

--
-- Table structure for table `med_type`
--

CREATE TABLE `med_type` (
  `M_ID` int(11) NOT NULL,
  `type` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `med_type`
--

INSERT INTO `med_type` (`M_ID`, `type`) VALUES
(1, 'Tablet'),
(2, 'Tablet'),
(3, 'Spray'),
(4, 'Spray'),
(5, 'Capsule'),
(6, 'Tablet'),
(7, 'Spray'),
(8, 'Spray'),
(9, 'Cream/Gel'),
(10, 'Cream/Gel');

--
-- Triggers `med_type`
--
DELIMITER $$
CREATE TRIGGER `med_type_BEFORE_INSERT` BEFORE INSERT ON `med_type` FOR EACH ROW BEGIN
	IF ((NEW.type != 'Tablet')AND(NEW.type != 'Capsule')AND
		(NEW.type != 'Syrup')AND(NEW.type != 'Powder') AND
        (NEW.type != 'Spray') AND
        (NEW.type != 'Cream/Gel')) THEN
        SIGNAL sqlstate '45000' SET MESSAGE_TEXT='Medicine Must be of Tablet/Capsule/Syrup/Powder or Cream/Gel only';
	END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `med_type_BEFORE_UPDATE` BEFORE UPDATE ON `med_type` FOR EACH ROW BEGIN
	IF ((NEW.type != 'Tablet')AND(NEW.type != 'Capsule')AND
		(NEW.type != 'Syrup')AND(NEW.type != 'Powder') AND
        (NEW.type != 'Spray') AND
        (NEW.type != 'Cream/Gel')) THEN
        SIGNAL sqlstate '45000' SET MESSAGE_TEXT='Medicine Must be of Tablet/Capsule/Syrup/Powder or Cream/Gel only';
	END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `O_ID` int(11) NOT NULL,
  `T_ID` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` varchar(45) NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Triggers `order`
--
DELIMITER $$
CREATE TRIGGER `order_BEFORE_INSERT` BEFORE INSERT ON `order` FOR EACH ROW BEGIN
	IF ((NEW.status != 'Delivered')AND
	   (NEW.status != 'Pending') AND
       (NEW.status != 'Cancelled')) THEN
       SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='Invalid Status!';
	END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `order_BEFORE_UPDATE` BEFORE UPDATE ON `order` FOR EACH ROW BEGIN
	IF ((NEW.status != 'Delivered')AND
	   (NEW.status != 'Pending') AND
       (NEW.status != 'Cancelled')) THEN
       SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='Invalid Status!';
	END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `order_company`
--

CREATE TABLE `order_company` (
  `M_ID` int(11) NOT NULL,
  `status` varchar(45) DEFAULT NULL,
  `payment` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Triggers `order_company`
--
DELIMITER $$
CREATE TRIGGER `order_company_BEFORE_INSERT` BEFORE INSERT ON `order_company` FOR EACH ROW BEGIN
	IF (NEW.status != 'Pending')AND
	   (NEW.status != 'Delivered') THEN
       SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='Invalid Status';
	END IF;
	IF (NEW.quantity <= 0) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='Quantity should be greater than 0';
	END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `order_company_BEFORE_UPDATE` BEFORE UPDATE ON `order_company` FOR EACH ROW BEGIN
	IF (NEW.status != 'Pending')AND
	   (NEW.status != 'Delivered') THEN
       SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='Invalid Status';
	END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `order_medicine`
--

CREATE TABLE `order_medicine` (
  `O_ID` int(11) NOT NULL,
  `M_ID` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Triggers `order_medicine`
--
DELIMITER $$
CREATE TRIGGER `order_medicine_BEFORE_INSERT` BEFORE INSERT ON `order_medicine` FOR EACH ROW BEGIN
	IF (NEW.quantity <= 0) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='Quantity must be Greater than 0';
	END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `order_medicine_BEFORE_UPDATE` BEFORE UPDATE ON `order_medicine` FOR EACH ROW BEGIN
	IF (NEW.quantity <= 0) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='Quantity must be Greater than 0';
	END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `order_user`
--

CREATE TABLE `order_user` (
  `O_ID` int(11) NOT NULL,
  `U_ID` int(11) NOT NULL,
  `transaction_id` int(11) NOT NULL,
  `time_transact` timestamp NULL DEFAULT NULL,
  `mode_pay` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Triggers `order_user`
--
DELIMITER $$
CREATE TRIGGER `order_user_BEFORE_INSERT` BEFORE INSERT ON `order_user` FOR EACH ROW BEGIN
	IF ((NEW.mode_pay != 'Cash on Delivery') AND (NEW.mode_pay != 'Online Banking')) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='Invalid Mode of Payment!';
	END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `pin_address`
--

CREATE TABLE `pin_address` (
  `PIN` int(11) NOT NULL,
  `Area` varchar(45) DEFAULT NULL,
  `City` varchar(45) DEFAULT NULL,
  `State` varchar(45) DEFAULT NULL,
  `Country` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pin_address`
--

INSERT INTO `pin_address` (`PIN`, `Area`, `City`, `State`, `Country`) VALUES
(100100, 'New Found', 'DreamCity', 'North', 'Inda'),
(394270, 'Hazira', 'Surat', 'Gujarat', 'India'),
(450405, 'Simrol', 'Indore', 'Madhya Pradesh', 'India'),
(700100, 'Green Avenue', 'Kolkata', 'West Bengal', 'India'),
(700745, 'Patia', 'Bhubaneswar', 'Odisha', 'India');

-- --------------------------------------------------------

--
-- Table structure for table `side_effects`
--

CREATE TABLE `side_effects` (
  `M_ID` int(11) NOT NULL,
  `S_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `side_effects`
--

INSERT INTO `side_effects` (`M_ID`, `S_ID`) VALUES
(1, 3),
(2, 3),
(3, 5),
(4, 5),
(3, 6),
(4, 6),
(5, 12),
(7, 15),
(10, 15),
(7, 16);

--
-- Triggers `side_effects`
--
DELIMITER $$
CREATE TRIGGER `side_effects_BEFORE_INSERT` BEFORE INSERT ON `side_effects` FOR EACH ROW BEGIN
	IF (EXISTS(SELECT * FROM treats t WHERE (t.M_ID=NEW.M_ID) AND (t.S_ID = NEW.S_ID))) THEN
		SIGNAL sqlstate '45000' SET MESSAGE_TEXT='Medicine cannot cause same Side Effect as the Treatment!';
	END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `side_effects_BEFORE_UPDATE` BEFORE UPDATE ON `side_effects` FOR EACH ROW BEGIN
	IF (EXISTS(SELECT * FROM treats t WHERE (t.M_ID=NEW.M_ID) AND (t.S_ID = NEW.S_ID))) THEN
		SIGNAL sqlstate '45000' SET MESSAGE_TEXT='Medicine cannot cause same Side Effect as the Treatment!';
	END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `stock`
--

CREATE TABLE `stock` (
  `M_ID` int(11) NOT NULL,
  `W_ID` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `expdate` date NOT NULL,
  `mandate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `stockreserve`
--

CREATE TABLE `stockreserve` (
  `W_ID` int(11) NOT NULL,
  `city` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `symptoms`
--

CREATE TABLE `symptoms` (
  `S_ID` int(11) NOT NULL,
  `sname` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `symptoms`
--

INSERT INTO `symptoms` (`S_ID`, `sname`) VALUES
(1, 'Fever'),
(2, 'Pain Relief'),
(3, 'Liver Damage'),
(4, 'Nasal Constriction'),
(5, 'Dizziness'),
(6, 'Blurred Vision'),
(7, 'Gastroenteritis'),
(8, 'Acidity'),
(9, 'Heartburn'),
(10, 'Nausea'),
(11, 'Vomiting'),
(12, 'Dry Mouth'),
(13, 'Nasal Rhinitis'),
(14, 'Pollen Allergy'),
(15, 'Increased Ketokonazole Concentration'),
(16, 'Increased Adrenaline bioavailability'),
(17, 'BackPain'),
(18, 'Sprain'),
(19, 'Muscle Pain'),
(20, 'Dermatitis'),
(21, 'Versicolor');

-- --------------------------------------------------------

--
-- Table structure for table `treats`
--

CREATE TABLE `treats` (
  `M_ID` int(11) NOT NULL,
  `S_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `treats`
--

INSERT INTO `treats` (`M_ID`, `S_ID`) VALUES
(1, 1),
(2, 1),
(1, 2),
(2, 2),
(3, 4),
(4, 4),
(5, 7),
(5, 8),
(6, 8),
(5, 9),
(6, 9),
(5, 10),
(5, 11),
(7, 13),
(7, 14),
(8, 17),
(9, 17),
(8, 18),
(9, 18),
(8, 19),
(9, 19),
(10, 20),
(10, 21);

--
-- Triggers `treats`
--
DELIMITER $$
CREATE TRIGGER `treats_BEFORE_INSERT` BEFORE INSERT ON `treats` FOR EACH ROW BEGIN
	IF (EXISTS(SELECT * FROM side_effects s WHERE (s.M_ID=NEW.M_ID) AND (s.S_ID = NEW.S_ID))) THEN
		SIGNAL sqlstate '45000' SET MESSAGE_TEXT='Medicine cannot cause same Side Effect as the Treatment!';
	END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `treats_BEFORE_UPDATE` BEFORE UPDATE ON `treats` FOR EACH ROW BEGIN
	IF (EXISTS(SELECT * FROM side_effects s WHERE (s.M_ID=NEW.M_ID) AND (s.S_ID = NEW.S_ID))) THEN
		SIGNAL sqlstate '45000' SET MESSAGE_TEXT='Medicine cannot cause same Side Effect as the Treatment!';
	END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `U_ID` int(11) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `phone_no` int(15) NOT NULL,
  `DOB` date NOT NULL,
  `type` varchar(45) NOT NULL DEFAULT 'normal',
  `gender` varchar(45) DEFAULT NULL,
  `PIN` int(11) NOT NULL,
  `house_no` varchar(45) NOT NULL,
  `walletamt` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`U_ID`, `email`, `password`, `first_name`, `last_name`, `phone_no`, `DOB`, `type`, `gender`, `PIN`, `house_no`, `walletamt`) VALUES
(1, 'goku@gmail.com', '7815696ecbf1c96e6894b779456d330e', 'Recoder', 'Super', 7134, '1998-10-13', 'Admin', 'M', 100100, 'C2-13', 1000);

--
-- Triggers `user`
--
DELIMITER $$
CREATE TRIGGER `user_BEFORE_INSERT` BEFORE INSERT ON `user` FOR EACH ROW BEGIN
	IF (timestampdiff(year, NEW.DOB, curdate()) < '13' ) THEN
		Signal sqlstate '45000' set message_text='You Must be Over 13 Years of Age!';
	END IF;
    IF (NEW.walletamt < 0) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='Wallet Amount cannot be less than 0';
	END IF;
    IF ((NEW.type != 'normal')AND(NEW.type != 'admin')AND(NEW.type != 'dbm')) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='Invalid User Type';
	END IF;
    IF ((NEW.gender != 'M')AND(NEW.gender != 'F')AND(NEW.gender != 'O')) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='Invalid Gender';
	END IF;
    IF (NEW.email NOT LIKE '_%@_%.com') THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='Invalid Email';
	END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `user_BEFORE_UPDATE` BEFORE UPDATE ON `user` FOR EACH ROW BEGIN
    IF (NEW.walletamt < 0) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='Wallet Amount cannot be less than 0';
	END IF;
END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`C_ID`),
  ADD UNIQUE KEY `Name_UNIQUE` (`Name`),
  ADD UNIQUE KEY `C_ID_UNIQUE` (`C_ID`),
  ADD KEY `checkPIN_idx` (`PIN`);

--
-- Indexes for table `components`
--
ALTER TABLE `components`
  ADD PRIMARY KEY (`C_ID`),
  ADD UNIQUE KEY `C_ID_UNIQUE` (`C_ID`);

--
-- Indexes for table `composition`
--
ALTER TABLE `composition`
  ADD PRIMARY KEY (`M_ID`,`C_ID`),
  ADD KEY `Check CID_idx` (`C_ID`);

--
-- Indexes for table `contraindication`
--
ALTER TABLE `contraindication`
  ADD PRIMARY KEY (`C_ID1`,`C_ID2`);

--
-- Indexes for table `manufacturer`
--
ALTER TABLE `manufacturer`
  ADD PRIMARY KEY (`M_ID`,`C_ID`),
  ADD KEY `checkCID2_idx` (`C_ID`);

--
-- Indexes for table `medicine`
--
ALTER TABLE `medicine`
  ADD PRIMARY KEY (`M_ID`),
  ADD UNIQUE KEY `M_ID_UNIQUE` (`M_ID`);

--
-- Indexes for table `med_type`
--
ALTER TABLE `med_type`
  ADD PRIMARY KEY (`M_ID`,`type`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`O_ID`),
  ADD UNIQUE KEY `O_ID_UNIQUE` (`O_ID`),
  ADD UNIQUE KEY `T_ID_UNIQUE` (`T_ID`);

--
-- Indexes for table `order_company`
--
ALTER TABLE `order_company`
  ADD PRIMARY KEY (`M_ID`);

--
-- Indexes for table `order_medicine`
--
ALTER TABLE `order_medicine`
  ADD PRIMARY KEY (`O_ID`,`M_ID`),
  ADD KEY `checkMID6_idx` (`M_ID`);

--
-- Indexes for table `order_user`
--
ALTER TABLE `order_user`
  ADD PRIMARY KEY (`U_ID`,`O_ID`),
  ADD UNIQUE KEY `U_ID_UNIQUE` (`U_ID`),
  ADD UNIQUE KEY `O_ID_UNIQUE` (`O_ID`),
  ADD UNIQUE KEY `transaction_id_UNIQUE` (`transaction_id`);

--
-- Indexes for table `pin_address`
--
ALTER TABLE `pin_address`
  ADD PRIMARY KEY (`PIN`),
  ADD UNIQUE KEY `PIN_UNIQUE` (`PIN`);

--
-- Indexes for table `side_effects`
--
ALTER TABLE `side_effects`
  ADD PRIMARY KEY (`M_ID`,`S_ID`),
  ADD KEY `Check SID2_idx` (`S_ID`);

--
-- Indexes for table `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`M_ID`,`W_ID`),
  ADD KEY `checkWID1_idx` (`W_ID`);

--
-- Indexes for table `stockreserve`
--
ALTER TABLE `stockreserve`
  ADD PRIMARY KEY (`W_ID`),
  ADD UNIQUE KEY `W_ID_UNIQUE` (`W_ID`);

--
-- Indexes for table `symptoms`
--
ALTER TABLE `symptoms`
  ADD PRIMARY KEY (`S_ID`),
  ADD UNIQUE KEY `S_ID_UNIQUE` (`S_ID`);

--
-- Indexes for table `treats`
--
ALTER TABLE `treats`
  ADD PRIMARY KEY (`M_ID`,`S_ID`),
  ADD KEY `Check SID1_idx` (`S_ID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`U_ID`),
  ADD UNIQUE KEY `U_ID_UNIQUE` (`U_ID`),
  ADD UNIQUE KEY `email_UNIQUE` (`email`),
  ADD KEY `checkPIN2_idx` (`PIN`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `C_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `medicine`
--
ALTER TABLE `medicine`
  MODIFY `M_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `O_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `symptoms`
--
ALTER TABLE `symptoms`
  MODIFY `S_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `U_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `company`
--
ALTER TABLE `company`
  ADD CONSTRAINT `checkPIN` FOREIGN KEY (`PIN`) REFERENCES `pin_address` (`PIN`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `composition`
--
ALTER TABLE `composition`
  ADD CONSTRAINT `Check CID` FOREIGN KEY (`C_ID`) REFERENCES `components` (`C_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `Check MID` FOREIGN KEY (`M_ID`) REFERENCES `medicine` (`M_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `manufacturer`
--
ALTER TABLE `manufacturer`
  ADD CONSTRAINT `checkCID2` FOREIGN KEY (`C_ID`) REFERENCES `company` (`C_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `checkMID3` FOREIGN KEY (`M_ID`) REFERENCES `medicine` (`M_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `med_type`
--
ALTER TABLE `med_type`
  ADD CONSTRAINT `M_ID` FOREIGN KEY (`M_ID`) REFERENCES `medicine` (`M_ID`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `order_company`
--
ALTER TABLE `order_company`
  ADD CONSTRAINT `checkMID4` FOREIGN KEY (`M_ID`) REFERENCES `medicine` (`M_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `order_medicine`
--
ALTER TABLE `order_medicine`
  ADD CONSTRAINT `checkMID6` FOREIGN KEY (`M_ID`) REFERENCES `medicine` (`M_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `checkOID4` FOREIGN KEY (`O_ID`) REFERENCES `order` (`O_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `order_user`
--
ALTER TABLE `order_user`
  ADD CONSTRAINT `checkOID` FOREIGN KEY (`O_ID`) REFERENCES `order` (`O_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `checkUID3` FOREIGN KEY (`U_ID`) REFERENCES `user` (`U_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `side_effects`
--
ALTER TABLE `side_effects`
  ADD CONSTRAINT `Check MID2` FOREIGN KEY (`M_ID`) REFERENCES `medicine` (`M_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `Check SID2` FOREIGN KEY (`S_ID`) REFERENCES `symptoms` (`S_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stock`
--
ALTER TABLE `stock`
  ADD CONSTRAINT `checkMID5` FOREIGN KEY (`M_ID`) REFERENCES `medicine` (`M_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `checkWID1` FOREIGN KEY (`W_ID`) REFERENCES `stockreserve` (`W_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `treats`
--
ALTER TABLE `treats`
  ADD CONSTRAINT `Check MID1` FOREIGN KEY (`M_ID`) REFERENCES `medicine` (`M_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `Check SID1` FOREIGN KEY (`S_ID`) REFERENCES `symptoms` (`S_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `checkPIN2` FOREIGN KEY (`PIN`) REFERENCES `pin_address` (`PIN`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
