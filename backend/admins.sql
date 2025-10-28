-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 23, 2025 at 02:40 AM
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
-- Database: `admins`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` char(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`) VALUES
(1, 'admin', '240be518fabd2724ddb6f04eeb1da5967448d7e831c08c8fa822809f74c720a9'),
(2, 'andes', '754eb57a10ffe2148f31f48e7badb4e7744c153a610b767376c46ee6c27530b0');

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `appointment_id` int(11) NOT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `doctor_id` int(11) DEFAULT NULL,
  `appointment_date` date DEFAULT NULL,
  `appointment_time` time DEFAULT NULL,
  `reason_for_visit` varchar(255) NOT NULL,
  `status` enum('Scheduled','Vitals Done','Completed','Cancelled','No-Show') NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`appointment_id`, `patient_id`, `doctor_id`, `appointment_date`, `appointment_time`, `reason_for_visit`, `status`, `date_created`) VALUES
(1, 1, 35, '2025-10-19', '09:00:00', 'nag kukurso', 'No-Show', '2025-10-19 08:06:41'),
(2, 1, 35, '2025-10-19', '09:00:00', 'aaa', 'Cancelled', '2025-10-19 08:38:50'),
(3, 1, 23, '2025-10-20', '10:00:00', 'Severe headache and fever', 'Cancelled', '2025-10-19 09:28:58'),
(4, 1, 39, '2025-10-19', '09:00:00', 'ss', 'No-Show', '2025-10-19 09:32:35'),
(5, 1, 42, '2025-10-19', '09:00:00', ',,,', 'Cancelled', '2025-10-19 10:29:23'),
(6, 3, 47, '2025-10-19', '09:00:00', 'dd', 'Completed', '2025-10-19 11:37:04'),
(7, 4, 47, '2025-10-19', '09:00:00', 'nag tagas na atot', 'Completed', '2025-10-19 11:44:30'),
(8, 5, 47, '2025-10-19', '09:00:00', 'nagtambay', 'Completed', '2025-10-19 12:13:16'),
(9, 5, 47, '2025-10-19', '09:00:00', 'ddd', 'Completed', '2025-10-19 12:23:11'),
(10, 5, 49, '2025-10-19', '09:00:00', 'ddd', 'No-Show', '2025-10-19 12:24:28'),
(11, 6, 47, '2025-10-19', '21:02:00', 'matambay lang daa', 'Completed', '2025-10-19 14:47:07'),
(12, 6, 47, '2025-10-19', '09:00:00', 'dd', 'Completed', '2025-10-19 14:54:42'),
(13, 5, 23, '2025-10-19', '09:00:00', 'ddd', 'Vitals Done', '2025-10-19 16:00:19'),
(14, 7, 47, '2025-10-19', '09:00:00', 'ss', 'Cancelled', '2025-10-19 16:55:01'),
(15, 8, 47, '2025-10-20', '09:19:00', 'nakitambay\n', 'Completed', '2025-10-20 08:47:27'),
(16, 9, 47, '2025-10-20', '00:00:00', 'dddd', 'Vitals Done', '2025-10-20 13:49:55'),
(17, 12, 47, '2025-10-20', '09:00:00', 'ss', 'Completed', '2025-10-20 14:02:12'),
(18, 2, 47, '2025-10-20', '09:00:00', 'ss2334', 'Vitals Done', '2025-10-20 23:40:18'),
(19, 12, 47, '2025-10-21', '09:00:00', 'nakiwifi', 'Completed', '2025-10-21 11:34:58'),
(20, 14, 47, '2025-09-30', '09:00:00', 'aaa', 'No-Show', '2025-10-21 12:07:00'),
(21, 14, 47, '2025-10-21', '09:00:00', 'ssssss', 'Vitals Done', '2025-10-21 12:07:38'),
(22, 2, 47, '2025-10-21', '09:00:00', 'inda', 'Vitals Done', '2025-10-21 12:21:08'),
(23, 14, 47, '2025-10-21', '09:00:00', 'ddd', 'Vitals Done', '2025-10-21 18:19:50'),
(24, 13, 47, '2025-10-21', '09:00:00', 'dd', 'Scheduled', '2025-10-21 21:08:21'),
(25, 16, 47, '2025-10-21', '09:00:00', 'inda', 'Vitals Done', '2025-10-21 22:33:18'),
(26, 16, 47, '2025-10-22', '09:00:00', 'kulog ang pisot\n', 'Vitals Done', '2025-10-22 09:53:19'),
(27, 1, 47, '2025-10-22', '09:00:00', 'sss', 'Vitals Done', '2025-10-22 11:08:18'),
(28, 17, 47, '2025-10-22', '09:00:00', 'dfdff', 'Scheduled', '2025-10-22 11:25:06'),
(29, 6, 47, '2025-10-22', '09:00:00', 'ssssss', 'Completed', '2025-10-22 13:53:06'),
(30, 17, 47, '2025-10-22', '09:00:00', 'ssssssssss', 'Vitals Done', '2025-10-22 22:49:22'),
(31, 19, 47, '2025-10-22', '09:00:00', 'sssssss', 'Completed', '2025-10-22 23:03:37');

-- --------------------------------------------------------

--
-- Table structure for table `audit_log`
--

CREATE TABLE `audit_log` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `action` varchar(100) NOT NULL,
  `details` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `audit_log`
--

INSERT INTO `audit_log` (`id`, `user_id`, `action`, `details`, `created_at`) VALUES
(1, 1, 'appointment_status_update', '{\"appointment_id\":20,\"status\":\"No-Show\"}', '2025-10-22 22:19:36'),
(2, 47, 'record_create', '{\"appointment_id\":\"17\",\"patient_id\":\"12\"}', '2025-10-22 22:23:32'),
(3, 1, 'appointment_schedule', '{\"patient_id\":\"17\",\"doctor_id\":\"47\",\"date\":\"2025-10-22\",\"time\":\"09:00\"}', '2025-10-22 22:49:22'),
(4, 41, 'vitals_create', '{\"appointment_id\":30,\"bp\":\"101\",\"temp\":\"0.70\"}', '2025-10-22 22:50:21'),
(5, 41, 'vitals_create', '{\"appointment_id\":27,\"bp\":\"101\",\"temp\":\"0.70\"}', '2025-10-22 22:59:55'),
(6, 1, 'patient_register', '{\"patient\":\"andrei andes\"}', '2025-10-22 23:02:06'),
(7, 1, 'patient_register', '{\"patient\":\"andrei2001 andes\"}', '2025-10-22 23:02:57'),
(8, 1, 'appointment_schedule', '{\"patient_id\":\"19\",\"doctor_id\":\"47\",\"date\":\"2025-10-22\",\"time\":\"09:00\"}', '2025-10-22 23:03:37'),
(9, 41, 'vitals_create', '{\"appointment_id\":31,\"bp\":\"101\",\"temp\":\"0.70\"}', '2025-10-22 23:04:23'),
(10, 47, 'record_create', '{\"appointment_id\":\"31\",\"patient_id\":\"19\"}', '2025-10-22 23:05:04');

-- --------------------------------------------------------

--
-- Table structure for table `inventory_items`
--

CREATE TABLE `inventory_items` (
  `item_id` int(11) NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `unit_of_measure` varchar(50) NOT NULL,
  `current_stock` int(11) NOT NULL,
  `reorder_level` int(11) NOT NULL,
  `supplier` varchar(255) DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `medical_records`
--

CREATE TABLE `medical_records` (
  `record_id` int(11) NOT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `doctor_id` int(11) DEFAULT NULL,
  `appointment_id` int(11) DEFAULT NULL,
  `date_of_visit` datetime NOT NULL DEFAULT current_timestamp(),
  `chief_complaint` text NOT NULL,
  `diagnosis` text DEFAULT NULL,
  `treatment_plan` text NOT NULL,
  `prescription` text NOT NULL,
  `follow_up_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `medical_records`
--

INSERT INTO `medical_records` (`record_id`, `patient_id`, `doctor_id`, `appointment_id`, `date_of_visit`, `chief_complaint`, `diagnosis`, `treatment_plan`, `prescription`, `follow_up_date`) VALUES
(1, 3, 47, 6, '2025-10-19 11:39:24', 'dd', 'inda ', 'bigti kana lang', 'inda', '2025-10-30'),
(2, 4, 47, 7, '2025-10-19 11:49:05', 'nag tagas na atot', 'dai talaga maka atot', 'sulbungan ki dildo', 'dildogs', '2025-11-06'),
(3, 5, 47, 8, '2025-10-19 12:16:25', 'nagtambay', 'diputa', 'turog', 'd', '2025-11-06'),
(4, 5, 47, 9, '2025-10-19 12:25:20', 'ddd', 'dd', 'ddd', 'sss', '2025-11-07'),
(5, 6, 47, 11, '2025-10-19 14:48:53', 'matambay lang daa', 's', 's', 's', '2025-10-16'),
(6, 6, 47, 12, '2025-10-19 14:58:22', 'dd', 'dd', 'dd', 'ddd', '2025-10-30'),
(7, 8, 47, 15, '2025-10-20 08:48:56', 'nakitambay\n', 'souiss', 'dkdkodk', 'ijiuiu', '2025-11-05'),
(8, 12, 47, 19, '2025-10-21 11:42:52', 'nakiwifi', 'h', 's', 's', '2025-11-06'),
(9, 6, 47, 29, '2025-10-22 13:54:35', 'ssssss', 'c', 'nn', 'x', '2025-10-17'),
(10, 12, 47, 17, '2025-10-22 22:23:32', 'ss', 'sss', 'sss', 'sss', '2025-10-30'),
(11, 19, 47, 31, '2025-10-22 23:05:04', 'sssssss', 'dd', 'sss', 'ssss', '2025-10-24');

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `patient_id` int(11) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `gender` enum('Male','Female','Other') DEFAULT NULL,
  `contact_number` varchar(20) NOT NULL,
  `address` varchar(255) NOT NULL,
  `hmo_id` varchar(50) NOT NULL,
  `registered_by_staff_id` int(11) NOT NULL,
  `date_registered` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`patient_id`, `first_name`, `last_name`, `birth_date`, `gender`, `contact_number`, `address`, `hmo_id`, `registered_by_staff_id`, `date_registered`) VALUES
(1, 'john', 0, '2025-10-02', 'Male', '9090909090', '', 'aa', 1, '2025-10-19 08:05:55'),
(2, 'cedric', 0, '2025-09-30', 'Male', '9090909090', 'banquerohan', 'hdjdh', 1, '2025-10-19 10:30:03'),
(3, 'roy', 0, '2025-09-30', 'Female', '09090909090', 'john', 'sddd', 1, '2025-10-19 10:41:39'),
(4, 'pauline', 0, '2025-10-28', 'Female', '09090909090', 'banquerohan', 'inda', 1, '2025-10-19 11:43:52'),
(5, 'gemma', 0, '2025-10-01', 'Female', '09090909090', 'banquerohan\n', 'ind', 1, '2025-10-19 12:12:31'),
(6, 'lance ruzzel', 0, '2025-10-07', 'Male', '09090909090', 'banquerohan', 'ind', 1, '2025-10-19 14:45:40'),
(7, 'ian', 0, '2025-10-06', 'Other', '9090909090', 'john', 'dd', 1, '2025-10-19 16:54:48'),
(8, 'jo', 0, '2025-10-06', 'Male', '9090909090', 'banquerohan', 'dd', 1, '2025-10-19 19:39:10'),
(9, 'josss', 0, '2025-10-06', 'Male', '9090909090', 'banquerohan', 'dd', 1, '2025-10-20 08:47:47'),
(10, 'john john', 0, '2025-10-15', 'Female', '9090909090', 'john', 'eer', 1, '2025-10-20 13:50:32'),
(11, 'johnrey', 0, '2001-12-25', 'Male', '9090909090', 'banquerohan\n', '9', 1, '2025-10-20 13:55:17'),
(12, 'johnrey11', 0, '2001-12-25', 'Male', '9090909090', 'ba', '9', 1, '2025-10-20 13:57:41'),
(13, 'johnrey', 0, '2001-12-04', 'Male', '09318938648', 'banquerohan', '9', 1, '2025-10-21 12:03:54'),
(14, 'johnrey333333', 0, '2001-12-04', 'Female', '09318938648', 'banquerohan', '9', 1, '2025-10-21 12:06:01'),
(15, 'johnrey', 0, '2001-12-04', 'Male', '09318938648', 'banquerohan', '9', 1, '2025-10-21 22:12:02'),
(16, 'louie', 0, '2001-12-04', 'Male', '09318938648', 'banquerohan', '9', 1, '2025-10-21 22:32:59'),
(17, 'ssss', 0, '2025-10-28', 'Male', 'wwwww', 'banquerohan', 'ww', 1, '2025-10-22 11:24:42'),
(18, 'andrei', 0, '2025-09-29', 'Male', '09090909090', 'banquerohan', 'lah', 1, '2025-10-22 23:02:06'),
(19, 'andrei2001', 0, '2025-09-29', 'Male', '09090909090', 'banquerohan', 'lah', 1, '2025-10-22 23:02:57');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `id` int(11) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `phone` varchar(20) NOT NULL,
  `address` text NOT NULL,
  `position` enum('Admin','Staff','Doctor','Nurse') NOT NULL DEFAULT 'Staff',
  `date_of_birth` date NOT NULL,
  `gender` enum('Male','Female','Other') NOT NULL,
  `hire_date` date NOT NULL DEFAULT current_timestamp(),
  `status` enum('active','inactive') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`id`, `username`, `password`, `full_name`, `email`, `phone`, `address`, `position`, `date_of_birth`, `gender`, `hire_date`, `status`, `created_at`, `update_at`) VALUES
(26, 'andrei', 'b9352494463399aa6a44ed5e39425b8a0bc39b2fc3d0184ba2583ce9bc4e4c1d', 'andrei', 'andrei@gmail.com', '9090909090', 'andrkeu', 'Nurse', '2025-10-02', 'Male', '2025-09-24', 'active', '2025-09-24 08:00:16', '2025-09-24 08:00:16'),
(27, 'lance', '929df7fc8cdf44855c5c13c8f4d7ef67a27e5a24453fd2974c214e2fde89eb47', 'lance', 'lance@gmail.com', '9090909090', 'john', 'Nurse', '2025-10-04', 'Female', '2025-09-24', 'active', '2025-09-24 08:07:23', '2025-09-24 08:07:23'),
(28, 'audrey', '56f09d7fa9eb77b92c741dd19409c0152ba19b22e0cde3bfa1e66970f8eeec57', 'audrey', 'audrey@gmail.com', '00000000000', 'banquer', 'Staff', '2025-09-11', 'Female', '2025-09-25', 'active', '2025-09-25 06:15:16', '2025-09-25 06:15:16'),
(29, 'louie', '8fa487cc5c1e37f4e92fa5c4dfc72d19f12bda8e30caf8b243a48f367ffcab63', 'louie', 'louie@gmail.com', '9090909090', 'johnlopa', '', '2025-10-03', 'Male', '2025-09-25', 'active', '2025-09-25 09:20:37', '2025-09-25 09:20:37'),
(30, 'pau', '470adaa55fab37a1a00db983fcc022a1dbb13fc7361937f36cdc5f14de19f6ce', 'pau', 'pau@gmail.com', '9090909090', 'john', '', '0111-11-11', 'Female', '2025-09-25', 'active', '2025-09-25 09:27:11', '2025-09-25 09:27:11'),
(32, 'marynel', '0569002f92b21b70d75905b5f0565f006463bab6825bec26e59f67d1f875301a', 'marynel', 'marynel', '9090909090', 'john', '', '2025-10-07', 'Female', '2025-09-25', 'active', '2025-09-25 09:37:41', '2025-09-25 09:37:41'),
(33, 'lalaineandes', '80737d6e287d840d346aa4eb3db6793665a47d96df9f4ae513efbea73a83a3b9', 'position', 'john@gmail.com', '9090909090', 'john', 'Nurse', '2025-08-31', 'Female', '2025-09-26', 'active', '2025-09-26 07:48:21', '2025-09-26 07:48:21'),
(34, 'nata', 'ab304b554c2cb762bc2cbee2c9a959190fc5f7f478abe41340f793367ec3c9d0', 'nata patal', 'nat@gmail.com', '9090909090', 'john', '', '2025-09-29', 'Female', '2025-09-26', 'active', '2025-09-26 08:11:37', '2025-09-26 08:11:37'),
(35, 'nelson', '45d7c42cb65265ae97c298d439c18e5293d6615a66627b382d04491113afd794', 'john john', 'nelson@gmail.com', '9090909090', 'john', 'Doctor', '2025-09-05', 'Male', '2025-09-30', 'active', '2025-09-30 01:45:53', '2025-09-30 01:45:53'),
(39, 'andes11ss', '408f31d86c6bf4a8aff4ea682ad002278f8cb39dc5f37b53d343e63a61f3cc4f', 'johnrey andes', 'pak12232@gmail.com', '9090909090', 'banquerohan', 'Doctor', '2025-09-20', 'Male', '2025-09-30', 'active', '2025-09-30 01:53:45', '2025-09-30 01:53:45'),
(40, 'dante', '16814e8cd706b29de1ba77f011fd96f1b245ca6641b3af63b0f787af54284f90', 'dante gulapa', 'dan@gmail.com', '9090909090', 'john', 'Nurse', '2025-10-02', 'Female', '2025-09-30', 'active', '2025-09-30 05:35:25', '2025-09-30 05:35:25'),
(41, 'jay', 'bfef4adc39f01b033fe749bb5f28f10b581fef319d34445d21a7bc63fe732fa3', 'jay', 'jay@gmail.com', '09090909090', 'banquer', 'Nurse', '2025-11-01', 'Male', '2025-09-30', 'active', '2025-09-30 05:43:21', '2025-09-30 05:43:21'),
(42, 'reynante', 'ab304b554c2cb762bc2cbee2c9a959190fc5f7f478abe41340f793367ec3c9d0', 'reynante', 'rey@gmail.com', '09090909090', 'banquer', 'Doctor', '2001-12-24', 'Male', '2025-10-01', 'active', '2025-10-01 02:55:36', '2025-10-01 02:55:36'),
(43, 'sandybarnedo', 'ed16d55d599e28c2642f2043945d28686809b7c580c8669d3896fe9f9b86921e', 'sandybarnedo', 'sand@gmail.com', '09090909090', 'banquer', 'Nurse', '2025-10-28', 'Male', '2025-10-01', 'active', '2025-10-01 03:24:39', '2025-10-01 03:24:39'),
(46, 'pau1', 'b832c3dd04b833ebeb3c3d3adfd6842ba560bfdba93e04e7eb1324955b212e6c', 'pau1', 'pau111@gmail.com', '9090909090', 'john', 'Nurse', '2025-11-08', 'Male', '2025-10-01', 'active', '2025-10-01 06:57:30', '2025-10-01 06:57:30'),
(47, 'broly', '566b950626ca3bd872cec5b2438c3e3c0fa7e0fee0ef480744d6130768697720', 'broly', 'btory@gmail.com', '9090909090', 'inda lang', 'Doctor', '2025-11-08', 'Male', '2025-10-04', 'active', '2025-10-04 00:24:55', '2025-10-04 00:24:55'),
(48, 'coky', 'fb7e9bbb88c91f2088d0960b9441b30b23a38b7ff2e2441897cc40f2a76c93a1', 'coky', 'ky@gmail.com', '9090909090', 'jo', 'Nurse', '2025-11-08', 'Female', '2025-10-16', 'active', '2025-10-16 00:53:17', '2025-10-16 00:53:17'),
(49, 'louiejayyyy', 'fd21fa778cd4402be4567af588c0aaeed401d90a8a81f0ed41f46f30ed6116e6', 'louiejay', 'louiejay@gmail.com', '9090909091', 'johnajysssss', 'Doctor', '2025-10-16', 'Female', '2025-10-17', 'active', '2025-10-17 03:38:33', '2025-10-17 03:38:33'),
(51, 'lakapau', '06164ad73a9d5db2f6101483c84720708ed3fceaebc693c613123cf600586075', 'mmm', 'andesjohnrey35@gmail.com', '09090909090', 'johnsss', 'Nurse', '2025-10-30', 'Female', '2025-10-19', 'active', '2025-10-19 01:52:00', '2025-10-19 01:52:00');

-- --------------------------------------------------------

--
-- Table structure for table `vitals`
--

CREATE TABLE `vitals` (
  `vitals` int(11) NOT NULL,
  `appointment_id` int(11) DEFAULT NULL,
  `nurse_id` int(11) DEFAULT NULL,
  `blood_pressure` varchar(50) DEFAULT NULL,
  `temperature` decimal(5,2) DEFAULT NULL,
  `weight` decimal(5,2) DEFAULT NULL,
  `height` decimal(5,2) NOT NULL,
  `nurse_notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vitals`
--

INSERT INTO `vitals` (`vitals`, `appointment_id`, `nurse_id`, `blood_pressure`, `temperature`, `weight`, `height`, `nurse_notes`, `created_at`, `updated_at`) VALUES
(1, 13, 41, 'ss', 0.70, -0.60, 2.00, 's', '2025-10-19 11:54:02', '2025-10-19 11:54:02'),
(2, 1, 41, 'ss', 0.10, -0.60, 2.00, 'ee', '2025-10-19 12:00:12', '2025-10-19 13:27:30'),
(3, 10, 41, 'ss', 0.80, 0.10, 2.00, 'ddd', '2025-10-19 12:04:46', '2025-10-19 12:04:46'),
(4, 16, 41, 'ss', 0.10, -0.60, 2.00, 'dddd', '2025-10-20 14:29:16', '2025-10-20 15:36:22'),
(5, 17, 41, 'ss', 0.10, -0.60, 2.00, 'ss', '2025-10-20 15:37:09', '2025-10-20 15:37:09'),
(6, 18, 41, 'ss', 0.10, -0.60, 2.00, '', '2025-10-20 15:48:53', '2025-10-20 15:48:53'),
(7, 21, 41, '90', 1.30, -0.60, 2.00, 'jjjjj', '2025-10-21 04:11:15', '2025-10-21 11:03:56'),
(8, 22, 41, '90', 1.30, -0.60, 2.00, 'dd', '2025-10-21 11:07:14', '2025-10-21 11:07:14'),
(9, 23, 41, '90', 1.30, -0.60, 2.00, 'sssss', '2025-10-21 14:14:31', '2025-10-21 14:14:31'),
(10, 25, 41, '90', 1.30, -0.60, 2.00, 'sss', '2025-10-21 14:34:00', '2025-10-21 14:34:00'),
(11, 26, 41, '101', 0.70, 0.10, 4.00, 'puta ka', '2025-10-22 03:06:32', '2025-10-22 05:52:17'),
(12, 29, 41, '101', 0.70, 0.10, 4.00, 'sssssssss', '2025-10-22 05:53:35', '2025-10-22 05:53:35'),
(13, 30, 41, '101', 0.70, 0.10, 4.00, 'sssssssssssssssssssss', '2025-10-22 14:50:21', '2025-10-22 14:50:21'),
(14, 27, 41, '101', 0.70, 0.10, 4.00, 'assssaaswdxdcecef', '2025-10-22 14:59:55', '2025-10-22 14:59:55'),
(15, 31, 41, '101', 0.70, 0.10, 4.00, 'blahhhhhhhh', '2025-10-22 15:04:23', '2025-10-22 15:04:23');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`appointment_id`);

--
-- Indexes for table `audit_log`
--
ALTER TABLE `audit_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inventory_items`
--
ALTER TABLE `inventory_items`
  ADD PRIMARY KEY (`item_id`);

--
-- Indexes for table `medical_records`
--
ALTER TABLE `medical_records`
  ADD PRIMARY KEY (`record_id`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`patient_id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `vitals`
--
ALTER TABLE `vitals`
  ADD PRIMARY KEY (`vitals`),
  ADD UNIQUE KEY `appointment_id` (`appointment_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `appointment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `audit_log`
--
ALTER TABLE `audit_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `inventory_items`
--
ALTER TABLE `inventory_items`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `medical_records`
--
ALTER TABLE `medical_records`
  MODIFY `record_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `patient_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `vitals`
--
ALTER TABLE `vitals`
  MODIFY `vitals` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
