-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 20, 2020 at 10:12 PM
-- Server version: 5.7.24
-- PHP Version: 7.2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `grades-manager`
--

-- --------------------------------------------------------

--
-- Table structure for table `school_board`
--

CREATE TABLE `school_board` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `output_format` enum('JSON','XML') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `school_board`
--

INSERT INTO `school_board` (`id`, `name`, `output_format`) VALUES
(1, 'CSM', 'JSON'),
(2, 'CSMB', 'XML');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `school_board_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`id`, `first_name`, `last_name`, `school_board_id`) VALUES
(1, 'Jane', 'Doe', 1),
(2, 'John', 'Doe', 2);

-- --------------------------------------------------------

--
-- Table structure for table `student_subject_grade`
--

CREATE TABLE `student_subject_grade` (
  `student_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `grade` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student_subject_grade`
--

INSERT INTO `student_subject_grade` (`student_id`, `subject_id`, `grade`) VALUES
(1, 1, 8),
(1, 2, 6),
(1, 3, 9),
(1, 4, 7),
(2, 1, 7),
(2, 2, 9),
(2, 3, 8),
(2, 4, 10);

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

CREATE TABLE `subject` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subject`
--

INSERT INTO `subject` (`id`, `name`) VALUES
(4, 'Biology'),
(3, 'English'),
(2, 'Mathematics'),
(1, 'Science');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `school_board`
--
ALTER TABLE `school_board`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_school_board_id` (`school_board_id`);

--
-- Indexes for table `student_subject_grade`
--
ALTER TABLE `student_subject_grade`
  ADD KEY `fk_student_id` (`student_id`),
  ADD KEY `fk_subject_id` (`subject_id`);

--
-- Indexes for table `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `school_board`
--
ALTER TABLE `school_board`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `subject`
--
ALTER TABLE `subject`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `fk_school_board_id` FOREIGN KEY (`school_board_id`) REFERENCES `school_board` (`id`);

--
-- Constraints for table `student_subject_grade`
--
ALTER TABLE `student_subject_grade`
  ADD CONSTRAINT `fk_student_id` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`),
  ADD CONSTRAINT `fk_subject_id` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
