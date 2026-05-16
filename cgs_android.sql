-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 29, 2025 at 09:35 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cgs_android`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_logs`
--

CREATE TABLE `activity_logs` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `activity` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `activity_logs`
--

INSERT INTO `activity_logs` (`id`, `student_id`, `activity`, `created_at`) VALUES
(1, 3, 'User logged out', '2025-09-29 17:46:05'),
(2, 3, 'User logged in', '2025-09-29 17:56:29'),
(3, 3, 'Appointment ID 1 has been rejected.', '2025-09-29 17:56:39'),
(4, 3, 'Appointment ID 1 has been rejected.', '2025-09-29 17:56:42'),
(5, 3, 'Appointment ID 1 has been rejected.', '2025-09-29 17:56:43'),
(6, 3, 'Appointment ID 1 has been rejected.', '2025-09-29 17:56:46'),
(7, 3, 'Appointment ID 1 has been rejected.', '2025-09-29 17:57:27'),
(8, 3, 'Appointment ID 1 has been rejected.', '2025-09-29 18:05:11'),
(9, 3, 'Appointment ID 10 has been accepted.', '2025-09-29 18:41:40'),
(10, 3, 'Appointment ID 10 has been rejected.', '2025-09-29 18:42:25'),
(11, 3, 'Appointment ID 10 has been accepted.', '2025-09-29 18:42:56'),
(12, 3, 'Appointment ID 13 has been accepted.', '2025-09-29 18:55:55'),
(13, 3, 'Appointment ID 13 has been accepted.', '2025-09-29 19:02:02'),
(14, 3, 'Appointment ID 14 has been accepted.', '2025-09-29 19:13:49'),
(15, 3, 'User logged out', '2025-09-29 19:15:39');

-- --------------------------------------------------------

--
-- Table structure for table `admin_activity_logs`
--

CREATE TABLE `admin_activity_logs` (
  `id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `activity` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `appointment_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `nickname` varchar(50) NOT NULL,
  `consent_agreement` tinyint(1) DEFAULT NULL,
  `program_yr_sec` varchar(50) DEFAULT NULL,
  `contact_no` varchar(20) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `date_of_birth` varchar(100) NOT NULL,
  `religion` varchar(50) DEFAULT NULL,
  `civil_status` varchar(50) DEFAULT NULL,
  `par_address` varchar(100) NOT NULL,
  `current_address` varchar(255) DEFAULT NULL,
  `staying_at` varchar(100) DEFAULT NULL,
  `staying_with` varchar(100) DEFAULT NULL,
  `parent_guardian_name` varchar(100) DEFAULT NULL,
  `parent_guardian_contact` varchar(20) DEFAULT NULL,
  `referred_by` varchar(100) DEFAULT NULL,
  `taking_med` varchar(50) NOT NULL,
  `med_specify` varchar(50) NOT NULL,
  `experienced_counseling` varchar(255) DEFAULT NULL,
  `counseling_places` varchar(255) DEFAULT NULL,
  `type_of_concern` varchar(255) DEFAULT NULL,
  `reasons` text DEFAULT NULL,
  `goals` text DEFAULT NULL,
  `schedule_day` date DEFAULT NULL,
  `schedule_time` time DEFAULT NULL,
  `admin_notes` text DEFAULT NULL,
  `privacy_consent` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` enum('Pending','Approved','Rejected') NOT NULL DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`appointment_id`, `student_id`, `first_name`, `last_name`, `nickname`, `consent_agreement`, `program_yr_sec`, `contact_no`, `age`, `gender`, `date_of_birth`, `religion`, `civil_status`, `par_address`, `current_address`, `staying_at`, `staying_with`, `parent_guardian_name`, `parent_guardian_contact`, `referred_by`, `taking_med`, `med_specify`, `experienced_counseling`, `counseling_places`, `type_of_concern`, `reasons`, `goals`, `schedule_day`, `schedule_time`, `admin_notes`, `privacy_consent`, `created_at`, `updated_at`, `status`) VALUES
(1, 3, 'Robert Daniel', 'Ignacio', 'bugv', 1, 'bigvuv', '383838', 6838388, 'Male', '', 'vhvuvuv', 'Single', '', 'vuvuv', 'Relative\'s', 'Parents', 'vuv', '868683', 'Friend', '', '', 'No', '', 'Academic Concerns', '', '', '2025-09-29', '22:50:00', NULL, 1, '2025-09-24 09:20:44', '2025-09-29 17:56:39', 'Rejected'),
(2, 3, 'Robert Daniel', 'Ignacio', 'ycycyc', 1, 'cghud', '868686', 575727, 'Male', '', 'gxgxdyc', 'Single', '', 'xtxtxdx', 'Select Option', 'Select Option', 'hxgdd', '3868', 'Select Option', '', '', 'No', '', 'Academic Concerns', '', '', '2025-09-24', '21:34:00', NULL, 1, '2025-09-24 13:34:09', '2025-09-29 14:45:08', 'Approved'),
(3, 3, 'Robert', 'Ignacio', 'Robert', 1, '', '09516046605', 22, 'Male', '', 'INC', 'Single', '', '', 'Relative\'s', 'Parents', 'Jhoan', '09459831502', '', 'No', '', 'No', '', 'Academic', '', '', '0000-00-00', '00:00:00', NULL, 1, '2025-09-28 13:20:41', '2025-09-29 14:34:31', 'Rejected'),
(4, 3, 'Robert', 'Ignacio', 'Robert', 1, '', '09516046605', 22, 'Male', '', 'INC', 'Single', '', '', 'Relative\'s', 'Parents', 'Jhoan', '09459831502', '', 'No', '', 'No', '', 'Academic', '', '', '0000-00-00', '00:00:00', NULL, 1, '2025-09-28 13:26:01', '2025-09-29 13:41:03', 'Rejected'),
(5, 3, 'Robert', 'Ignacio', 'Robert', 1, '', '09516046605', 22, 'Male', '', 'INC', 'Single', '', '', 'Relative\'s', 'Parents', 'Jhoan', '09459831502', '', 'No', '', 'No', '', 'Academic', '', '', '0000-00-00', '00:00:00', NULL, 1, '2025-09-28 13:26:21', '2025-09-29 13:41:02', 'Rejected'),
(6, 3, 'Robert Daniel', 'Ignacio', 'berto', 1, 'BSIT', '09459831502', 22, 'Male', '', 'INC', 'Single', 'purok tagumpay', 'purok tagumpay', 'Relative\'s', 'Parents', 'Jhoan', '0976451234551', '', 'No', '', 'No', '', 'Academic', 'aadasd', 'dasdada', '0000-00-00', '00:00:00', NULL, 1, '2025-09-29 13:09:28', '2025-09-29 13:41:02', 'Rejected'),
(7, 3, 'Robert Daniel', 'Ignacio', 'berto', 1, 'BSIT', '09459831502', 22, 'Male', '', 'INC', 'Single', 'purok tagumpay', 'purok tagumpay', 'Relative\'s', 'Parents', 'Jhoan', '0976451234551', '', 'No', '', 'No', '', 'Academic', 'aadasd', 'dasdada', '0000-00-00', '00:00:00', NULL, 1, '2025-09-29 13:09:52', '2025-09-29 13:41:02', 'Rejected'),
(8, 3, 'Robert Daniel', 'Ignacio', 'berto', 1, 'BSIT', '09459831502', 22, 'Male', '', 'INC', 'Single', 'purok tagumpay', 'purok tagumpay', 'Relative\'s', 'Parents', 'Jhoan', '0976451234551', '', 'No', '', 'No', '', 'Academic', 'aadasd', 'dasdada', '0000-00-00', '00:00:00', NULL, 1, '2025-09-29 13:10:07', '2025-09-29 13:41:01', 'Rejected'),
(9, 3, 'Robert Daniel', 'Ignacio', 'berto', 1, 'BSIT', '09459831502', 22, 'Male', '', 'INC', 'Single', 'purok tagumpay', 'purok tagumpay', 'Relative\'s', 'Parents', 'Jhoan', '0976451234551', '', 'No', '', 'No', '', 'Academic', '', '', '0000-00-00', '00:00:00', NULL, 1, '2025-09-29 13:25:16', '2025-09-29 13:40:59', 'Rejected'),
(10, 3, 'Robert Daniel', 'Ignacio', 'berto', 1, 'BSIT', '09459831502', 22, 'Male', '', 'INC', 'Single', 'purok tagumpay', 'purok tagumpay', 'Relative\'s', 'Parents', 'Jhoan', '0976451234551', '', 'No', '', 'No', '', 'Academic', '', '', '2025-09-30', '02:42:00', NULL, 1, '2025-09-29 18:11:26', '2025-09-29 18:42:56', 'Approved'),
(11, 3, 'Robert Daniel', 'Ignacio', 'berto', 1, 'BSIT', '09459831502', 22, 'Male', '', 'INC', 'Single', 'purok tagumpay', 'purok tagumpay', 'Relative\'s', 'Parents', 'Jhoan', '0976451234551', '', 'No', '', 'No', '', 'Academic', '', '', '0000-00-00', '00:00:00', NULL, 1, '2025-09-29 18:15:08', '2025-09-29 18:41:22', 'Approved'),
(12, 3, 'Robert Daniel', 'Ignacio', 'berto', 1, 'BSIT', '09459831502', 22, 'Male', '', 'INC', 'Single', 'purok tagumpay', 'purok tagumpay', 'Relative\'s', 'Parents', 'Jhoan', '0976451234551', '', 'No', '', 'No', '', 'Academic', '', '', '0000-00-00', '00:00:00', NULL, 1, '2025-09-29 18:16:46', '2025-09-29 18:41:07', 'Rejected'),
(13, 3, 'Robert Daniel', 'Ignacio', 'berto', 1, 'BSIT', '09459831502', 22, 'Male', '', 'INC', 'Single', 'purok tagumpay', 'purok tagumpay', 'Relative\'s', 'Parents', 'Jhoan', '0976451234551', '', 'No', '', 'No', '', 'Academic', '', '', '2025-09-30', '04:52:00', NULL, 1, '2025-09-29 18:52:06', '2025-09-29 18:55:55', 'Approved'),
(14, 3, 'Robert Daniel', 'Ignacio', 'berto', 1, 'BSIT', '09459831502', 22, 'Male', '', 'INC', 'Single', 'purok tagumpay', 'purok tagumpay', 'Relative\'s', 'Parents', 'Jhoan', '0976451234551', '', 'No', '', 'No', '', 'Academic', '', '', '2025-09-30', '03:02:00', NULL, 1, '2025-09-29 19:02:16', '2025-09-29 19:13:49', 'Approved');

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `authors` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`authors`)),
  `coverUrl` varchar(500) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `isStarter` tinyint(1) DEFAULT 0,
  `viewCount` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `type` varchar(50) NOT NULL,
  `title` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `related_appointment_id` int(11) DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `student_id`, `type`, `title`, `message`, `related_appointment_id`, `is_read`, `created_at`, `updated_at`) VALUES
(1, 3, '', '', 'Your appointment (ID: 3) has been rejected.', NULL, 0, '2025-09-29 14:34:31', '2025-09-29 14:34:31'),
(13, 3, '', '', 'Your appointment has been rejected. Note: ddfd', 12, 0, '2025-09-29 18:41:07', '2025-09-29 18:41:07'),
(14, 3, '', '', 'Your appointment has been approved. Note: ', 11, 0, '2025-09-29 18:41:22', '2025-09-29 18:41:22'),
(16, 3, '', '', 'You have accepted the adjusted schedule for appointment ID 10.', 10, 0, '2025-09-29 18:41:40', '2025-09-29 18:41:40'),
(19, 3, '', '', 'You have rejected the adjusted schedule for appointment ID 10.', 10, 0, '2025-09-29 18:42:25', '2025-09-29 18:42:25'),
(21, 3, '', '', 'You have accepted the adjusted schedule for appointment ID 10.', 10, 0, '2025-09-29 18:42:56', '2025-09-29 18:42:56'),
(23, 3, '', '', 'You have accepted the adjusted schedule for appointment ID 13.', 13, 0, '2025-09-29 18:55:55', '2025-09-29 18:55:55'),
(24, 3, '', '', 'You have accepted the adjusted schedule for appointment ID 13.', 13, 0, '2025-09-29 19:02:02', '2025-09-29 19:02:02'),
(26, 3, '', '', 'You have accepted the adjusted schedule for appointment ID 14.', 14, 0, '2025-09-29 19:13:49', '2025-09-29 19:13:49');

-- --------------------------------------------------------

--
-- Table structure for table `schedule_slots`
--

CREATE TABLE `schedule_slots` (
  `id` int(11) NOT NULL,
  `schedule_date` date NOT NULL,
  `time_slot` varchar(20) NOT NULL,
  `is_booked` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `student_number` varchar(12) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(255) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `account_status` enum('Enabled','Disabled') NOT NULL DEFAULT 'Enabled',
  `account_type` enum('Students') NOT NULL DEFAULT 'Students',
  `account_activation_hash` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `student_number`, `username`, `email`, `password`, `first_name`, `last_name`, `created_at`, `account_status`, `account_type`, `account_activation_hash`) VALUES
(3, '03210003379', 'berto', 'rbignacio3379ant@student.fatima.edu.ph', '$2y$10$TWtMmS2xFt0/FGODbKQnveO.jMuyea/bOE36i.0adWfwHwA2kEymK', 'Robert Daniel', 'Ignacio', '2025-09-17 20:30:02', 'Enabled', 'Students', NULL),
(10, '03200003379', 'vert', 'rbignacio33ant@student.fatima.edu.ph', '$2y$10$NnLQLTE5PF4qV8Tm0moVIe0iVdaP1yzMX865GHUKW7cRQyd9sIPF2', 'Robert', 'Ignacio', '2025-09-29 08:23:55', 'Enabled', 'Students', '72171dd051e5a6ad4e936a07a3600f6face1a87c97fef32d57e58b957e40df85');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `admin_activity_logs`
--
ALTER TABLE `admin_activity_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_id` (`admin_id`);

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`appointment_id`),
  ADD KEY `fk_appointments_students` (`student_id`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_student_id` (`student_id`),
  ADD KEY `idx_type` (`type`),
  ADD KEY `idx_is_read` (`is_read`),
  ADD KEY `idx_created_at` (`created_at`);

--
-- Indexes for table `schedule_slots`
--
ALTER TABLE `schedule_slots`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `unique_student_number` (`student_number`),
  ADD UNIQUE KEY `account_activation_hash` (`account_activation_hash`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_logs`
--
ALTER TABLE `activity_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `admin_activity_logs`
--
ALTER TABLE `admin_activity_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `appointment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `schedule_slots`
--
ALTER TABLE `schedule_slots`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD CONSTRAINT `activity_logs_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `admin_activity_logs`
--
ALTER TABLE `admin_activity_logs`
  ADD CONSTRAINT `admin_activity_logs_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `fk_appointments_students` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
