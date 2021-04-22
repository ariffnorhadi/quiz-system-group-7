-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 29, 2020 at 03:11 PM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cse3999_quiz`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `admin_id` varchar(255) NOT NULL,
  `admin_name` varchar(255) NOT NULL,
  `admin_email` varchar(255) NOT NULL,
  `admin_password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `admin_id`, `admin_name`, `admin_email`, `admin_password`) VALUES
(1, 'AD9001', 'Encik Hidayat bin Saiful', 'hidayatsaiful@gmail.com', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `faculty`
--

CREATE TABLE `faculty` (
  `faculty_id` int(7) NOT NULL,
  `faculty_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `faculty`
--

INSERT INTO `faculty` (`faculty_id`, `faculty_name`) VALUES
(1, 'Faculty of Ocean Engineering Technology and Informatics\r\n'),
(2, 'Faculty of Science'),
(3, 'Faculty of Maritime'),
(4, 'Faculty of Business, Economy and Social Development');

-- --------------------------------------------------------

--
-- Table structure for table `lecturers`
--

CREATE TABLE `lecturers` (
  `id` int(11) NOT NULL,
  `lect_id` varchar(255) NOT NULL,
  `lect_name` varchar(255) NOT NULL,
  `lect_email` varchar(255) NOT NULL,
  `lect_password` varchar(255) NOT NULL,
  `lect_phone` varchar(255) NOT NULL,
  `lect_faculty` int(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `lecturers`
--

INSERT INTO `lecturers` (`id`, `lect_id`, `lect_name`, `lect_email`, `lect_password`, `lect_phone`, `lect_faculty`) VALUES
(7, 'L1007', 'Prof Madya Muhammad Cucumorsed', 'cucumorsed@umx.edu.my', '1234', '01121690286', 2),
(15, 'L1001', 'Prof Madya Dr Shukri bin Ahmad', 'ahmad@gmail.com', '1234', '0112345679', 2),
(16, 'L1002', 'Prof Madya Fauzi bin Yahya', 'fauziyahya@gmail.com', '1234', '01954892329', 2),
(17, 'L1008', 'Dato Dr Sri Ahmad Imran', 'ahmadimran@gmail.com', '1234', '0143293021', 4),
(18, 'L1008', 'Dato Dr Sri Ahmad Imran', 'ahmadimran@gmail.com', '1234', '0143293021', 4);

-- --------------------------------------------------------

--
-- Table structure for table `performance`
--

CREATE TABLE `performance` (
  `id` int(11) NOT NULL,
  `marks` double NOT NULL,
  `stud_id` int(11) NOT NULL,
  `quiz_id` int(11) NOT NULL,
  `percentage` double NOT NULL,
  `totalQuestion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `performance`
--

INSERT INTO `performance` (`id`, `marks`, `stud_id`, `quiz_id`, `percentage`, `totalQuestion`) VALUES
(2, 2, 4, 52, 100, 2),
(3, 5, 4, 53, 100, 5),
(4, 3, 4, 53, 60, 5),
(5, 0, 4, 53, 0, 5),
(6, 0, 4, 52, 0, 2),
(7, 0, 4, 52, 0, 2),
(8, 0, 4, 52, 0, 2),
(9, 1, 4, 52, 50, 2),
(10, 2, 4, 53, 40, 5),
(11, 2, 4, 52, 100, 2),
(12, 4, 4, 53, 80, 5),
(13, 1, 4, 58, 50, 2),
(14, 1, 4, 53, 20, 5),
(15, 3, 4, 53, 60, 5),
(16, 3, 4, 53, 60, 5),
(17, 3, 4, 53, 60, 5),
(18, 1, 4, 52, 50, 2),
(19, 0, 4, 53, 0, 5),
(20, 0, 4, 53, 0, 5),
(21, 1, 4, 53, 20, 5);

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `question_id` int(11) NOT NULL,
  `question_name` varchar(255) NOT NULL,
  `choice_one` varchar(255) NOT NULL,
  `choice_two` varchar(255) NOT NULL,
  `choice_three` varchar(255) NOT NULL,
  `choice_four` varchar(255) NOT NULL,
  `answer` varchar(255) NOT NULL,
  `quiz_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`question_id`, `question_name`, `choice_one`, `choice_two`, `choice_three`, `choice_four`, `answer`, `quiz_id`) VALUES
(72, 'Who founded Flutter?', 'Google', 'Microsoft', 'Apple', 'Amazon', 'A', 52),
(73, 'What can we build with Flutter?', 'iOS ', 'Android', 'Both', 'None', 'C', 52),
(74, 'dsa', 'dsa', 'dsa', 'dsa', 'dsa', 'A', 53),
(75, 'dsa', 'dsa', 'dsa', 'dsa', 'dsa', 'C', 53),
(76, 'dsa', 'dsa', 'dsa', 'dsa', 'da', 'C', 53),
(77, 'asd', 'asd', 'asd', 'asd', 'asd', 'B', 53),
(78, 'dsa', 'dsa', 'dsa', 'dsa', 'das', 'C', 53),
(79, 'dsa', 'dsa', 'dsa', 'dsa', 'dsa', 'A', 58),
(80, 'dsa', 'dsa', 'dsa', 'dsa', 'dsa', 'A', 58);

-- --------------------------------------------------------

--
-- Table structure for table `quizzes`
--

CREATE TABLE `quizzes` (
  `quiz_id` int(11) NOT NULL,
  `quiz_category` varchar(255) NOT NULL,
  `subject_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `quizzes`
--

INSERT INTO `quizzes` (`quiz_id`, `quiz_category`, `subject_id`) VALUES
(52, 'Chapter 1: Flutter', 81),
(53, 'Chapter 2: Spring', 81),
(54, 'Chapter 3: PHP', 81),
(55, 'Chapter 4: Python + Django', 81),
(57, 'Chapter 1: Introduction to CCNA', 83),
(58, 'Chapter 1: Introduction to Chemistry', 86);

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `stud_matrics` varchar(7) NOT NULL,
  `stud_name` varchar(255) NOT NULL,
  `stud_email` varchar(255) NOT NULL,
  `stud_password` varchar(255) NOT NULL,
  `stud_faculty` int(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `stud_matrics`, `stud_name`, `stud_email`, `stud_password`, `stud_faculty`) VALUES
(2, 'S50967', 'Ahmad Afifuddin bin Kamarozaman', 'afifuddin@gmail.com', '1234', 2),
(4, 'S51445', 'Muhammad Ariff bin Norhadi', 'ariffnorhadi@green.umx.edu.mx', '1234', 2),
(5, 'S52014', 'Subashini A/P Kannan', 'subashini@gmail.com', '1234', 1);

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `subject_id` int(11) NOT NULL,
  `subject_code` varchar(255) NOT NULL,
  `subject_name` varchar(255) NOT NULL,
  `faculty_id` int(11) NOT NULL,
  `lect_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`subject_id`, `subject_code`, `subject_name`, `faculty_id`, `lect_id`) VALUES
(81, 'CSE 3999', 'Software Application Development', 2, 7),
(82, 'CSE 3209', 'Web Based Application Development', 2, 7),
(83, 'CSF 3402', 'Networking', 2, 7),
(84, 'CSE 3511', 'Software Testing', 2, 7),
(86, 'KIM 4701', 'Environmental Chemistry', 2, 15);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faculty`
--
ALTER TABLE `faculty`
  ADD PRIMARY KEY (`faculty_id`);

--
-- Indexes for table `lecturers`
--
ALTER TABLE `lecturers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_lecturers_faculty` (`lect_faculty`);

--
-- Indexes for table `performance`
--
ALTER TABLE `performance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_performance_students` (`stud_id`),
  ADD KEY `fk_performance_quizzes` (`quiz_id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`question_id`),
  ADD KEY `fk_questions_quizzes` (`quiz_id`);

--
-- Indexes for table `quizzes`
--
ALTER TABLE `quizzes`
  ADD PRIMARY KEY (`quiz_id`),
  ADD KEY `fk_quizzes_subjects` (`subject_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_students_faculty` (`stud_faculty`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`subject_id`),
  ADD UNIQUE KEY `subject_code` (`subject_code`),
  ADD KEY `fk_subjects_faculty` (`faculty_id`),
  ADD KEY `fk_subjects_lecturers` (`lect_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `faculty`
--
ALTER TABLE `faculty`
  MODIFY `faculty_id` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `lecturers`
--
ALTER TABLE `lecturers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `performance`
--
ALTER TABLE `performance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `question_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `quizzes`
--
ALTER TABLE `quizzes`
  MODIFY `quiz_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `subject_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `lecturers`
--
ALTER TABLE `lecturers`
  ADD CONSTRAINT `fk_lecturers_faculty` FOREIGN KEY (`lect_faculty`) REFERENCES `faculty` (`faculty_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `performance`
--
ALTER TABLE `performance`
  ADD CONSTRAINT `fk_performance_quizzes` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`quiz_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_performance_students` FOREIGN KEY (`stud_id`) REFERENCES `students` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `fk_questions_quizzes` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`quiz_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `quizzes`
--
ALTER TABLE `quizzes`
  ADD CONSTRAINT `fk_quizzes_subjects` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `fk_students_faculty` FOREIGN KEY (`stud_faculty`) REFERENCES `faculty` (`faculty_id`);

--
-- Constraints for table `subjects`
--
ALTER TABLE `subjects`
  ADD CONSTRAINT `fk_subjects_faculty` FOREIGN KEY (`faculty_id`) REFERENCES `faculty` (`faculty_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_subjects_lecturers` FOREIGN KEY (`lect_id`) REFERENCES `lecturers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
