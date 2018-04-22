-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.1.30-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win32
-- HeidiSQL Version:             9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for sitefinderrooms
CREATE DATABASE IF NOT EXISTS `sitefinderrooms` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `sitefinderrooms`;

-- Dumping structure for table sitefinderrooms.administrator
CREATE TABLE IF NOT EXISTS `administrator` (
  `AdminID` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` int(11) DEFAULT NULL,
  `RoomID` int(11) DEFAULT NULL,
  `AdminName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`AdminID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table sitefinderrooms.administrator: ~0 rows (approximately)
DELETE FROM `administrator`;
/*!40000 ALTER TABLE `administrator` DISABLE KEYS */;
/*!40000 ALTER TABLE `administrator` ENABLE KEYS */;

-- Dumping structure for table sitefinderrooms.building
CREATE TABLE IF NOT EXISTS `building` (
  `BuildingID` int(11) NOT NULL,
  `BuildingName` varchar(50) DEFAULT NULL,
  `BuildingFaculty` varchar(50) DEFAULT NULL,
  `BuildingCampus` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`BuildingID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table sitefinderrooms.building: ~3 rows (approximately)
DELETE FROM `building`;
/*!40000 ALTER TABLE `building` DISABLE KEYS */;
INSERT INTO `building` (`BuildingID`, `BuildingName`, `BuildingFaculty`, `BuildingCampus`) VALUES
	(1, 'NatSci', 'FST', 'STA'),
	(2, 'TCB2', 'FST', 'STA'),
	(3, 'TCB3', 'FST', 'STA');
/*!40000 ALTER TABLE `building` ENABLE KEYS */;

-- Dumping structure for table sitefinderrooms.buildingentrance
CREATE TABLE IF NOT EXISTS `buildingentrance` (
  `GateName` int(11) NOT NULL,
  `BuldingID` int(11) NOT NULL,
  `EntranceImg` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`GateName`,`BuldingID`),
  KEY `FK_buildingentrance_building` (`BuldingID`),
  CONSTRAINT `FK_buildingentrance_building` FOREIGN KEY (`BuldingID`) REFERENCES `building` (`BuildingID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table sitefinderrooms.buildingentrance: ~0 rows (approximately)
DELETE FROM `buildingentrance`;
/*!40000 ALTER TABLE `buildingentrance` DISABLE KEYS */;
/*!40000 ALTER TABLE `buildingentrance` ENABLE KEYS */;

-- Dumping structure for table sitefinderrooms.newroomrequest
CREATE TABLE IF NOT EXISTS `newroomrequest` (
  `RoomID` int(11) NOT NULL AUTO_INCREMENT,
  `newrname` varchar(50) DEFAULT NULL,
  `newrfaculty` varchar(50) DEFAULT NULL,
  `newrcampus` varchar(50) DEFAULT NULL,
  `newrlat` varchar(50) DEFAULT NULL,
  `newrlong` varchar(50) DEFAULT NULL,
  `newrtype` varchar(50) DEFAULT NULL,
  `newrseats` int(11) DEFAULT NULL,
  `newrproj` varchar(50) DEFAULT NULL,
  `newrbuildingname` varchar(50) DEFAULT NULL,
  `newrbuildingcampus` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`RoomID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

-- Dumping data for table sitefinderrooms.newroomrequest: ~2 rows (approximately)
DELETE FROM `newroomrequest`;
/*!40000 ALTER TABLE `newroomrequest` DISABLE KEYS */;
INSERT INTO `newroomrequest` (`RoomID`, `newrname`, `newrfaculty`, `newrcampus`, `newrlat`, `newrlong`, `newrtype`, `newrseats`, `newrproj`, `newrbuildingname`, `newrbuildingcampus`) VALUES
	(14, 'test1', '', '', '', '', '', 0, '', '', ''),
	(15, 'test2', '', '', '', '', '', 0, '', '', '');
/*!40000 ALTER TABLE `newroomrequest` ENABLE KEYS */;

-- Dumping structure for table sitefinderrooms.room
CREATE TABLE IF NOT EXISTS `room` (
  `RoomID` int(11) NOT NULL AUTO_INCREMENT,
  `BuildingID` int(11) DEFAULT NULL,
  `RoomName` varchar(50) DEFAULT NULL,
  `RoomFaculty` varchar(50) DEFAULT NULL,
  `RoomDoorImg` varchar(50) DEFAULT NULL,
  `RoomFloorImg` varchar(50) DEFAULT NULL,
  `RoomCampus` varchar(50) DEFAULT NULL,
  `RoomLatitude` varchar(50) DEFAULT NULL,
  `RoomLongitude` varchar(50) DEFAULT NULL,
  `RoomGeocode` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`RoomID`),
  KEY `FK_room_building` (`BuildingID`),
  CONSTRAINT `FK_room_building` FOREIGN KEY (`BuildingID`) REFERENCES `building` (`BuildingID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

-- Dumping data for table sitefinderrooms.room: ~14 rows (approximately)
DELETE FROM `room`;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` (`RoomID`, `BuildingID`, `RoomName`, `RoomFaculty`, `RoomDoorImg`, `RoomFloorImg`, `RoomCampus`, `RoomLatitude`, `RoomLongitude`, `RoomGeocode`) VALUES
	(2, 1, 'fst114', 'FST', 'fst114d', 'fst114', 'STA', '10.64075', '-61.40025', NULL),
	(3, 1, 'fst113', 'FST', 'fst113d', 'fst113', 'STA', '10.64075', '-61.40025', NULL),
	(4, 2, 'tcb21', 'FST', 'tcb21d', 'tcb21', 'STA', '10.64064', '-61.40022', NULL),
	(5, 2, 'tcb22', 'FST', 'tcb22d', 'tcb22', 'STA', '10.64056', '-61.40020', NULL),
	(6, 2, 'tcb23', 'FST', 'tcb23d', 'tcb23', 'STA', '10.64050', '-61.40017', NULL),
	(7, 3, 'tcb31', 'FST', 'tcb31d', 'tcb31', 'STA', '10.64098', '-61.40111', NULL),
	(8, 3, 'tcb32', 'FST', 'tcb32d', 'tcb32', 'STA', '10.64093', '-61.40119', NULL),
	(9, 3, 'tcb33', 'FST', 'tcb33d', 'tcb33', 'STA', '10.64120', '-61.40100', NULL),
	(10, 1, 'ls1', 'FST', 'ls1', 'ls1', 'STA', '10.64159', '-61.40077', NULL),
	(11, 1, 'ls2', 'FST', 'ls2', 'ls2', 'STA', '10.64158', '-61.40056', NULL),
	(12, 1, 'lifesciences', 'FST', 'lifesciencesd', 'lifesciences', 'STA', '10.64010', '-61.40033', NULL),
	(13, 1, 'naturalsciences', 'FST', 'naturalsciencesd', 'naturalsciences', 'STA', '10.64010', '-61.40033', NULL),
	(14, NULL, 'fstdean', 'FST', 'fstdeand', 'fstdean', 'STA', '10.64182', '-61.40160', NULL),
	(15, 1, 'fstundercroft', 'FST', 'fstundercroftd', 'fstundercroft', 'STA', '10.64075', '-61.40025', NULL);
/*!40000 ALTER TABLE `room` ENABLE KEYS */;

-- Dumping structure for table sitefinderrooms.roomfeatures
CREATE TABLE IF NOT EXISTS `roomfeatures` (
  `RoomID` int(11) NOT NULL,
  `RoomType` varchar(50) DEFAULT NULL,
  `RoomSeats` int(11) DEFAULT NULL,
  `RoomProjector` tinyint(4) DEFAULT NULL,
  `NewFeature1` varchar(50) DEFAULT NULL,
  `MiscellaneousFeatures` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`RoomID`),
  CONSTRAINT `FK_RoomFeatures_room` FOREIGN KEY (`RoomID`) REFERENCES `room` (`RoomID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table sitefinderrooms.roomfeatures: ~14 rows (approximately)
DELETE FROM `roomfeatures`;
/*!40000 ALTER TABLE `roomfeatures` DISABLE KEYS */;
INSERT INTO `roomfeatures` (`RoomID`, `RoomType`, `RoomSeats`, `RoomProjector`, `NewFeature1`, `MiscellaneousFeatures`) VALUES
	(2, 'Classroom', 88, 1, 'Projector', NULL),
	(3, 'Classroom', 150, 1, 'Projector', NULL),
	(4, 'Classroom', 100, 1, 'Projector', NULL),
	(5, 'Classroom', 100, 1, 'Projector', NULL),
	(6, 'Classroom', 100, 1, 'Projector', NULL),
	(7, 'Classroom', 100, 1, 'Projector', NULL),
	(8, 'Classroom', 100, 1, 'Projector', NULL),
	(9, 'Classroom', 100, 1, 'Projector', NULL),
	(10, 'Lab', NULL, NULL, NULL, NULL),
	(11, 'Lab', NULL, NULL, NULL, NULL),
	(12, 'Department', NULL, NULL, NULL, NULL),
	(13, 'Department', NULL, NULL, NULL, NULL),
	(14, 'Dean', NULL, NULL, NULL, NULL),
	(15, 'Undercroft', NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `roomfeatures` ENABLE KEYS */;

-- Dumping structure for table sitefinderrooms.user
CREATE TABLE IF NOT EXISTS `user` (
  `UserID` int(11) NOT NULL AUTO_INCREMENT,
  `AdminID` int(11) DEFAULT NULL,
  `RoomID` int(11) DEFAULT NULL,
  `UserName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table sitefinderrooms.user: ~0 rows (approximately)
DELETE FROM `user`;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
