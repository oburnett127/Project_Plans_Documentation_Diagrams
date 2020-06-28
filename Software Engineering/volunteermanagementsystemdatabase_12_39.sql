-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 05, 2012 at 06:38 PM
-- Server version: 5.5.24-log
-- PHP Version: 5.4.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `volunteermanagementsystemdatabase`
--

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE IF NOT EXISTS `event` (
  `eventid` int(7) NOT NULL,
  `name` varchar(60) NOT NULL,
  `date` date NOT NULL,
  `starttime` time NOT NULL,
  `endtime` time NOT NULL,
  `locations` varchar(60) NOT NULL,
  `requestedskills` varchar(60) NOT NULL,
  `description` longtext NOT NULL,
  PRIMARY KEY (`eventid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`eventid`, `name`, `date`, `starttime`, `endtime`, `locations`, `requestedskills`, `description`) VALUES
(1, 'Homeless Meal', '2013-01-20', '13:00:00', '15:00:00', 'Oklahoma City Community Center', 'cook', 'Help homeless members of the community who are affected by difficult economic times by cooking or serving food at the 20th annual homeless meal.'),
(2, 'Oklahoma City Improvement Initiative', '2013-08-30', '08:00:00', '17:00:00', 'All Over Oklahoma City', 'gardening, painting', 'Make improvements to parks, neighborhoods, and schools in your community.'),
(3, 'Senior Appreciation Day', '2013-02-19', '13:00:00', '16:00:00', '1500 N Lincoln, 3452 NW 85th Street, 4723 W Hefner Road', 'arts and crafts, musical talent, story telling', 'A very rewarding opportunity to bring happiness to senior citizens.  Go to one of three nursing homes for three hours.  Help senior citizens complete simple craft projects. You can also tell a story or play a musical instrument.');

-- --------------------------------------------------------

--
-- Table structure for table `manage`
--

CREATE TABLE IF NOT EXISTS `manage` (
  `userid` int(6) NOT NULL,
  `eventid` int(7) NOT NULL,
  PRIMARY KEY (`userid`,`eventid`),
  KEY `eventid` (`eventid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `manage`
--

INSERT INTO `manage` (`userid`, `eventid`) VALUES
(1, 1),
(2, 2),
(3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `timeslot`
--

CREATE TABLE IF NOT EXISTS `timeslot` (
  `eventid` int(7) NOT NULL,
  `starttime` time NOT NULL,
  `endtime` time NOT NULL,
  `userid` int(6) NOT NULL,
  PRIMARY KEY (`eventid`,`starttime`,`endtime`,`userid`),
  KEY `userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `timeslot`
--

INSERT INTO `timeslot` (`eventid`, `starttime`, `endtime`, `userid`) VALUES
(1, '13:00:00', '15:00:00', 1),
(2, '08:00:00', '12:00:00', 2),
(2, '08:00:00', '17:00:00', 3),
(2, '12:00:00', '17:00:00', 4);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `username` varchar(60) NOT NULL,
  `userid` int(6) NOT NULL,
  `password` varchar(20) NOT NULL,
  `usertype` tinyint(1) NOT NULL DEFAULT '1',
  `fname` varchar(15) NOT NULL,
  `lname` varchar(30) NOT NULL,
  `email` varchar(60) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `mailingaddress` varchar(60) NOT NULL,
  `gender` tinyint(1) NOT NULL DEFAULT '1',
  `skills` varchar(500) NOT NULL,
  `availabletimeslots` varchar(500) NOT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`username`, `userid`, `password`, `usertype`, `fname`, `lname`, `email`, `phone`, `mailingaddress`, `gender`, `skills`, `availabletimeslots`) VALUES
('', 1, 'abc', 0, 'Sally', 'Brown', 'volunteer73425@gmail.com', '1234567890', '123 Main Street', 1, '', '08:00:00 - 17:00:00 2013-01-20'),
('', 2, 'abc', 0, 'Susan', 'Saunders', 'stakeholder85948@gmail.com', '1234567890', '123 Main Street', 1, '', '2013-02-19 13:00:00-16:00:00'),
('', 3, 'abc', 1, 'John', 'Smith', 'volunteer32576@gmail.com', '1234567890', '123 Main Street', 0, 'cooking, story telling, singing', '15:00:00 - 17:00:00 2013-01-20'),
('', 4, 'abc', 1, 'Steve', 'Green', 'volunteer86574@gmail.com', '1234567890', '123 Main Street', 0, 'musical talent, arts and crafts, cooking', '2013-02-19 13:00:00-16:00:00'),
('', 5, 'abc', 1, 'Mary', 'Robbins', 'volunteer85328@gmail.com', '1234567890', '123 Main Street', 1, 'musical talent, painting, cooking', '2013-02-19 13:00:00-16:00:00');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `manage`
--
ALTER TABLE `manage`
  ADD CONSTRAINT `manage_ibfk_3` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`),
  ADD CONSTRAINT `manage_ibfk_2` FOREIGN KEY (`eventid`) REFERENCES `event` (`eventid`);

--
-- Constraints for table `timeslot`
--
ALTER TABLE `timeslot`
  ADD CONSTRAINT `timeslot_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`),
  ADD CONSTRAINT `timeslot_ibfk_1` FOREIGN KEY (`eventid`) REFERENCES `event` (`eventid`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
