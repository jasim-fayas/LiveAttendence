-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 04, 2024 at 03:07 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_liveattendence`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_add_on`
--

CREATE TABLE `tbl_add_on` (
  `add_on_id` int(100) NOT NULL,
  `add_on_name` varchar(100) NOT NULL,
  `course_id` int(100) NOT NULL,
  `add_on_photo` varchar(250) NOT NULL,
  `add_on_title` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_add_on`
--

INSERT INTO `tbl_add_on` (`add_on_id`, `add_on_name`, `course_id`, `add_on_photo`, `add_on_title`) VALUES
(4, 'Cyber Security', 12, 'AddOnPhoto_1701.avif', 'Cybersecurity is the practice of protecting internet-connected systems such as hardware, software and data from cyberthreats'),
(5, 'Cloud Computing', 12, 'AddOnPhoto_1754.jpg', '               Cloud computing is the delivery of computing services over the internet, including storage, servers, networking, software, databases, analytics, and intelligence. Users dont need to directly manage the resources, and only pay for what they use.          '),
(6, 'Gst', 28, 'AddOnPhoto_1184.jpg', '                    The Goods and Services Tax is a successor to VAT used in India on the supply of goods and services. Both VAT and GST have the same taxation slabs.    ');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `admin_id` int(11) NOT NULL,
  `admin_name` varchar(100) NOT NULL,
  `admin_email` varchar(100) NOT NULL,
  `admin_password` varchar(100) NOT NULL,
  `admin_status` int(100) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_admin`
--

INSERT INTO `tbl_admin` (`admin_id`, `admin_name`, `admin_email`, `admin_password`, `admin_status`) VALUES
(1, 'Abhishek Rames', 'abhisheknr201@gmail.com', '1234', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_assign`
--

CREATE TABLE `tbl_assign` (
  `assign_id` int(100) NOT NULL,
  `faculty_id` int(100) NOT NULL,
  `subject_id` int(100) NOT NULL,
  `semester_id` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_assign`
--

INSERT INTO `tbl_assign` (`assign_id`, `faculty_id`, `subject_id`, `semester_id`) VALUES
(1, 6, 9, 7),
(6, 6, 14, 7);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_attendance`
--

CREATE TABLE `tbl_attendance` (
  `attendance_id` int(100) NOT NULL,
  `attendance_date` varchar(100) NOT NULL,
  `attendance_hour` varchar(100) NOT NULL,
  `student_id` int(100) NOT NULL,
  `faculty_id` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_attendance`
--

INSERT INTO `tbl_attendance` (`attendance_id`, `attendance_date`, `attendance_hour`, `student_id`, `faculty_id`) VALUES
(56, '2024-03-19', '3', 20, 19),
(57, '2024-03-19', '5', 20, 19),
(58, '2024-03-19', '4', 20, 19),
(75, '2024-03-21', '1', 20, 19);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_course`
--

CREATE TABLE `tbl_course` (
  `course_id` int(11) NOT NULL,
  `course_name` varchar(100) NOT NULL,
  `department_id` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_course`
--

INSERT INTO `tbl_course` (`course_id`, `course_name`, `department_id`) VALUES
(12, 'Bca', 19),
(13, 'Bcs', 19),
(14, 'Bsc Cyber Forensic', 19),
(28, 'Bcom', 21);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_department`
--

CREATE TABLE `tbl_department` (
  `department_id` int(11) NOT NULL,
  `department_type_id` int(11) NOT NULL,
  `department_email` varchar(100) NOT NULL,
  `department_contact` varchar(100) NOT NULL,
  `department_photo` varchar(100) NOT NULL,
  `department_landmark` varchar(100) NOT NULL,
  `department_password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_department`
--

INSERT INTO `tbl_department` (`department_id`, `department_type_id`, `department_email`, `department_contact`, `department_photo`, `department_landmark`, `department_password`) VALUES
(19, 2, 'cs55@gmail.com', '9961294695', 'DepartmentPhoto_1322.png', 'opposite to mb', '1234'),
(21, 9, 'ba@gmail.com', '9961294690', 'DepartmentPhoto_1686.jpg', 'opposite to mb', '111');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_department_type`
--

CREATE TABLE `tbl_department_type` (
  `department_type_id` int(11) NOT NULL,
  `department_type_name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_department_type`
--

INSERT INTO `tbl_department_type` (`department_type_id`, `department_type_name`) VALUES
(2, 'Computer Science'),
(9, 'Bussiness Admibistration');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_district`
--

CREATE TABLE `tbl_district` (
  `district_id` int(11) NOT NULL,
  `district_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_district`
--

INSERT INTO `tbl_district` (`district_id`, `district_name`) VALUES
(1, 'Thrissur'),
(2, 'Ernakulam');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_faculty`
--

CREATE TABLE `tbl_faculty` (
  `faculty_id` int(100) NOT NULL,
  `faculty_name` varchar(200) NOT NULL,
  `faculty_contact` varchar(100) NOT NULL,
  `faculty_address` varchar(500) NOT NULL,
  `faculty_photo` varchar(200) NOT NULL,
  `faculty_email` varchar(100) NOT NULL,
  `faculty_password` varchar(100) NOT NULL,
  `place_id` int(100) NOT NULL,
  `faculty_gender` varchar(100) NOT NULL,
  `department_id` int(100) NOT NULL,
  `faculty_dob` varchar(100) NOT NULL,
  `faculty_about` varchar(500) NOT NULL,
  `faculty_status` int(100) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_faculty`
--

INSERT INTO `tbl_faculty` (`faculty_id`, `faculty_name`, `faculty_contact`, `faculty_address`, `faculty_photo`, `faculty_email`, `faculty_password`, `place_id`, `faculty_gender`, `department_id`, `faculty_dob`, `faculty_about`, `faculty_status`) VALUES
(6, 'midhulaj', '\n9961294690', 'Vattaparambil(H)chammanur', 'TeacherPhoto_1475.png', 'mid15@gmail.com', '123', 4, 'male', 19, '2024-01-11', 'asdf', 1),
(7, 'sureshh', '9961294690', 'mukkam', 'TeacherPhoto_1372.jpg', 'surrr@gmail.com', '1212', 4, 'male', 21, '2024-03-05', 'hjhj', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_feedback`
--

CREATE TABLE `tbl_feedback` (
  `feedback_id` int(100) NOT NULL,
  `feedback_date` varchar(100) NOT NULL,
  `feedback_title` varchar(100) NOT NULL,
  `feedback_content` varchar(500) NOT NULL,
  `feedback_status` int(100) NOT NULL DEFAULT 0,
  `student_id` int(100) NOT NULL DEFAULT 0,
  `feedback_a_status` int(100) NOT NULL DEFAULT 0,
  `parent_id` int(50) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_feedback`
--

INSERT INTO `tbl_feedback` (`feedback_id`, `feedback_date`, `feedback_title`, `feedback_content`, `feedback_status`, `student_id`, `feedback_a_status`, `parent_id`) VALUES
(11, '2024-03-02', 'poor education', 'you guys really sucks', 0, 19, 0, 0),
(12, '2024-03-02', 'Fuck overpricing', 'WTFFF', 1, 19, 1, 0),
(13, '2024-03-06', 'Igc Institutions excellence', 'Academic excellence', 0, 0, 0, 6);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_feedback_reply`
--

CREATE TABLE `tbl_feedback_reply` (
  `feedback_reply_id` int(100) NOT NULL,
  `feedback_id` int(100) NOT NULL,
  `feedback_reply` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_feedback_reply`
--

INSERT INTO `tbl_feedback_reply` (`feedback_reply_id`, `feedback_id`, `feedback_reply`) VALUES
(6, 12, 'will be solved\n');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_internalmark`
--

CREATE TABLE `tbl_internalmark` (
  `internalmark_id` int(100) NOT NULL,
  `internalmark_date` varchar(100) NOT NULL,
  `internalmark_mark` varchar(100) NOT NULL,
  `subject_id` int(100) NOT NULL,
  `student_id` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_internalmark`
--

INSERT INTO `tbl_internalmark` (`internalmark_id`, `internalmark_date`, `internalmark_mark`, `subject_id`, `student_id`) VALUES
(1, '2024-03-18', '18', 9, 8),
(2, '2024-03-18', '20', 9, 9),
(3, '2024-04-04', '8', 9, 12),
(4, '2024-04-04', '9', 9, 14),
(5, '2024-04-04', '15', 9, 14),
(6, '2024-04-04', '16', 9, 13),
(7, '2024-04-04', '19', 9, 14),
(8, '2024-04-04', '8', 9, 12),
(9, '2024-04-04', '9', 9, 14),
(10, '2024-04-04', '15', 9, 14),
(11, '2024-04-04', '16', 9, 13),
(12, '2024-04-04', '19', 9, 14);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_leave`
--

CREATE TABLE `tbl_leave` (
  `leave_id` int(50) NOT NULL,
  `leave_title` varchar(200) NOT NULL,
  `leave_content` varchar(200) NOT NULL,
  `student_id` int(20) NOT NULL,
  `parent_id` int(20) NOT NULL DEFAULT 0,
  `leave_date` date NOT NULL,
  `parent_status` int(100) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_leave`
--

INSERT INTO `tbl_leave` (`leave_id`, `leave_title`, `leave_content`, `student_id`, `parent_id`, `leave_date`, `parent_status`) VALUES
(2, 'Family Function', '       I hAve Family function please grand me leave                 ', 13, 0, '2024-03-20', 2);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_parent`
--

CREATE TABLE `tbl_parent` (
  `parent_id` int(11) NOT NULL,
  `parent_name` varchar(100) NOT NULL,
  `parent_email` varchar(100) NOT NULL,
  `parent_password` varchar(100) NOT NULL,
  `parent_contact` varchar(100) NOT NULL,
  `parent_address` varchar(500) NOT NULL,
  `department_id` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_parent`
--

INSERT INTO `tbl_parent` (`parent_id`, `parent_name`, `parent_email`, `parent_password`, `parent_contact`, `parent_address`, `department_id`) VALUES
(6, 'Gopi', 'joyal@gmail.com', '12345', '9961294690', 'hello', 19),
(7, 'jobi', 'he@gmail.com', '123', '9961294691', 'hello', 19),
(10, 'Suraj', 'suuu@gmail.com', '111', 'Santhosh', 'mukkam', 21);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_place`
--

CREATE TABLE `tbl_place` (
  `place_id` int(11) NOT NULL,
  `place_name` varchar(100) NOT NULL,
  `district_id` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_place`
--

INSERT INTO `tbl_place` (`place_id`, `place_name`, `district_id`) VALUES
(4, 'Kodungallur', 1),
(6, 'Kakkanad', 2);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_semester`
--

CREATE TABLE `tbl_semester` (
  `semester_id` int(11) NOT NULL,
  `semester_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_semester`
--

INSERT INTO `tbl_semester` (`semester_id`, `semester_name`) VALUES
(7, 'semester one'),
(8, 'semester two');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_student`
--

CREATE TABLE `tbl_student` (
  `student_id` int(100) NOT NULL,
  `student_name` varchar(100) NOT NULL,
  `student_contact` varchar(100) NOT NULL,
  `student_address` varchar(500) NOT NULL,
  `student_photo` varchar(300) NOT NULL,
  `student_email` varchar(100) NOT NULL,
  `student_password` varchar(100) NOT NULL,
  `course_id` int(100) NOT NULL,
  `place_id` varchar(100) NOT NULL,
  `student_vstatus` int(100) NOT NULL DEFAULT 0,
  `department_id` int(100) NOT NULL,
  `student_dob` varchar(100) NOT NULL,
  `student_gender` varchar(100) NOT NULL,
  `parent_id` int(100) NOT NULL,
  `semester_id` int(100) NOT NULL,
  `district_id` int(100) NOT NULL,
  `roll_number` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_student`
--

INSERT INTO `tbl_student` (`student_id`, `student_name`, `student_contact`, `student_address`, `student_photo`, `student_email`, `student_password`, `course_id`, `place_id`, `student_vstatus`, `department_id`, `student_dob`, `student_gender`, `parent_id`, `semester_id`, `district_id`, `roll_number`) VALUES
(8, 'joyalo bastin', '9961294690', 'ihergfli', 'StudentPhoto_1228.png', 'joyal@gmail.com', '123', 12, '4', 0, 19, '2024-01-04', 'male', 6, 7, 0, 0),
(9, 'Abhinav Gopi', '9961294690', 'manapattil House', 'StudentPhoto_1373.jpg', 'jazzz70820@gmail.com', '123', 12, '4', 0, 19, '2024-02-20', 'male', 123, 7, 0, 0),
(11, 'Abhishek Ramesh', '9961294690', 'mukkam', 'StudentPhoto_1535.jpg', 'abhisheknr12340@gmail.com', '1112', 13, '1', 0, 19, '2024-02-15', 'female', 7, 7, 0, 0),
(13, 'Aysha', '9961294690', 'mukkam', 'StudentPhoto_2026.png', 'abhisheknr120@gmail.com', '1254', 13, '6', 0, 19, '2024-02-05', 'female', 7, 7, 2, 0),
(14, 'rusna', '9961294690', 'manapattil House', 'StudentPhoto_1060.png', 'azzz7080@gmail.com', '1212', 13, '6', 0, 19, '2024-02-14', 'female', 7, 7, 2, 0),
(15, 'sooraj', '9961294690', 'mukkam', 'StudentPhoto_1128.png', 'cewqius55@gmail.com', '123', 12, '6', 0, 19, '2024-02-14', 'male', 7, 7, 2, 0),
(16, 'Abin', '9961294690', 'mukkam', 'StudentPhoto_1509.png', 'jih@gmail.com', '12345', 12, '', 0, 19, '2024-01-29', 'male', 7, 7, 1, 0),
(19, 'sulthana', '9961294690', 'mukkam', 'StudentPhoto_1296.png', 'sulu@gmail.com', '123', 12, '', 0, 19, '2024-02-05', 'female', 6, 7, 1, 0),
(20, 'hello', '9961294690', 'mukkam', 'StudentPhoto_1216.jpg', 'hellllo@gmail.com', '123', 12, '4', 0, 19, '2024-02-05', 'female', 6, 7, 1, 0),
(21, 'Ajas', '9961294690', 'mukkam', 'StudentPhoto_1716.jpg', 'ajas120@gmail.com', '111', 28, '6', 0, 21, '2024-02-27', 'male', 10, 7, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_subject`
--

CREATE TABLE `tbl_subject` (
  `subject_id` int(11) NOT NULL,
  `department_id` int(100) NOT NULL,
  `course_id` int(100) NOT NULL,
  `semester_id` int(100) NOT NULL,
  `subject_name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_subject`
--

INSERT INTO `tbl_subject` (`subject_id`, `department_id`, `course_id`, `semester_id`, `subject_name`) VALUES
(8, 14, 10, 1, 'Statistics'),
(9, 19, 12, 7, 'Statistics'),
(10, 19, 12, 7, 'English'),
(12, 19, 12, 7, 'Os'),
(14, 19, 12, 7, 'Linux'),
(15, 19, 12, 7, 'C programming'),
(16, 21, 28, 7, 'Tally'),
(17, 21, 28, 7, 'Bussiness Administration');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_timetable`
--

CREATE TABLE `tbl_timetable` (
  `timetable_id` int(100) NOT NULL,
  `timetable_day` varchar(100) NOT NULL,
  `timetable_hour` varchar(100) NOT NULL,
  `subject_id` int(100) NOT NULL,
  `semester_id` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_timetable`
--

INSERT INTO `tbl_timetable` (`timetable_id`, `timetable_day`, `timetable_hour`, `subject_id`, `semester_id`) VALUES
(1, 'Monday', '1', 15, 7),
(2, 'Tuesday', '1', 9, 7),
(3, 'Wednesday', '1', 10, 7),
(4, 'Thursday', '1', 10, 7),
(5, 'Tuesday', '2', 10, 7),
(6, 'Monday', '2', 9, 7),
(7, 'Friday', '1', 15, 7),
(8, 'Friday', '2', 14, 7),
(14, 'Tuesday', '3', 12, 7),
(15, 'Wednesday', '3', 15, 7),
(18, 'Thursday', '3', 9, 7),
(19, 'Monday', '3', 10, 7),
(20, 'Monday', '4', 12, 7),
(21, 'Monday', '5', 14, 7),
(22, 'Tuesday', '4', 10, 7),
(23, 'Tuesday', '5', 14, 7),
(24, 'Wednesday', '2', 12, 7),
(25, 'Wednesday', '4', 9, 7),
(26, 'Wednesday', '5', 14, 7),
(27, 'Thursday', '2', 14, 7),
(28, 'Thursday', '4', 12, 7),
(29, 'Thursday', '5', 15, 7),
(30, 'Friday', '5', 9, 7),
(31, 'Friday', '4', 10, 7),
(32, 'Friday', '3', 12, 7);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_add_on`
--
ALTER TABLE `tbl_add_on`
  ADD PRIMARY KEY (`add_on_id`);

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `tbl_assign`
--
ALTER TABLE `tbl_assign`
  ADD PRIMARY KEY (`assign_id`);

--
-- Indexes for table `tbl_attendance`
--
ALTER TABLE `tbl_attendance`
  ADD PRIMARY KEY (`attendance_id`);

--
-- Indexes for table `tbl_course`
--
ALTER TABLE `tbl_course`
  ADD PRIMARY KEY (`course_id`);

--
-- Indexes for table `tbl_department`
--
ALTER TABLE `tbl_department`
  ADD PRIMARY KEY (`department_id`);

--
-- Indexes for table `tbl_department_type`
--
ALTER TABLE `tbl_department_type`
  ADD PRIMARY KEY (`department_type_id`);

--
-- Indexes for table `tbl_district`
--
ALTER TABLE `tbl_district`
  ADD PRIMARY KEY (`district_id`);

--
-- Indexes for table `tbl_faculty`
--
ALTER TABLE `tbl_faculty`
  ADD PRIMARY KEY (`faculty_id`);

--
-- Indexes for table `tbl_feedback`
--
ALTER TABLE `tbl_feedback`
  ADD PRIMARY KEY (`feedback_id`);

--
-- Indexes for table `tbl_feedback_reply`
--
ALTER TABLE `tbl_feedback_reply`
  ADD PRIMARY KEY (`feedback_reply_id`);

--
-- Indexes for table `tbl_internalmark`
--
ALTER TABLE `tbl_internalmark`
  ADD PRIMARY KEY (`internalmark_id`);

--
-- Indexes for table `tbl_leave`
--
ALTER TABLE `tbl_leave`
  ADD PRIMARY KEY (`leave_id`);

--
-- Indexes for table `tbl_parent`
--
ALTER TABLE `tbl_parent`
  ADD PRIMARY KEY (`parent_id`);

--
-- Indexes for table `tbl_place`
--
ALTER TABLE `tbl_place`
  ADD PRIMARY KEY (`place_id`);

--
-- Indexes for table `tbl_semester`
--
ALTER TABLE `tbl_semester`
  ADD PRIMARY KEY (`semester_id`);

--
-- Indexes for table `tbl_student`
--
ALTER TABLE `tbl_student`
  ADD PRIMARY KEY (`student_id`);

--
-- Indexes for table `tbl_subject`
--
ALTER TABLE `tbl_subject`
  ADD PRIMARY KEY (`subject_id`);

--
-- Indexes for table `tbl_timetable`
--
ALTER TABLE `tbl_timetable`
  ADD PRIMARY KEY (`timetable_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_add_on`
--
ALTER TABLE `tbl_add_on`
  MODIFY `add_on_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_assign`
--
ALTER TABLE `tbl_assign`
  MODIFY `assign_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_attendance`
--
ALTER TABLE `tbl_attendance`
  MODIFY `attendance_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `tbl_course`
--
ALTER TABLE `tbl_course`
  MODIFY `course_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `tbl_department`
--
ALTER TABLE `tbl_department`
  MODIFY `department_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `tbl_department_type`
--
ALTER TABLE `tbl_department_type`
  MODIFY `department_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tbl_district`
--
ALTER TABLE `tbl_district`
  MODIFY `district_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_faculty`
--
ALTER TABLE `tbl_faculty`
  MODIFY `faculty_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_feedback`
--
ALTER TABLE `tbl_feedback`
  MODIFY `feedback_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tbl_feedback_reply`
--
ALTER TABLE `tbl_feedback_reply`
  MODIFY `feedback_reply_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_internalmark`
--
ALTER TABLE `tbl_internalmark`
  MODIFY `internalmark_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tbl_leave`
--
ALTER TABLE `tbl_leave`
  MODIFY `leave_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_parent`
--
ALTER TABLE `tbl_parent`
  MODIFY `parent_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tbl_place`
--
ALTER TABLE `tbl_place`
  MODIFY `place_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_semester`
--
ALTER TABLE `tbl_semester`
  MODIFY `semester_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tbl_student`
--
ALTER TABLE `tbl_student`
  MODIFY `student_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `tbl_subject`
--
ALTER TABLE `tbl_subject`
  MODIFY `subject_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `tbl_timetable`
--
ALTER TABLE `tbl_timetable`
  MODIFY `timetable_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
