-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 21, 2025 at 01:13 AM
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
-- Database: `pahana_edu`
--

-- --------------------------------------------------------

--
-- Table structure for table `addtocard`
--

CREATE TABLE `addtocard` (
  `id` int(11) NOT NULL,
  `bookname` varchar(255) NOT NULL,
  `authorname` varchar(255) DEFAULT NULL,
  `edition` varchar(50) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `price` double NOT NULL,
  `image` varchar(500) DEFAULT NULL,
  `customer_name` varchar(255) NOT NULL,
  `addtocard_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `addtocard`
--

INSERT INTO `addtocard` (`id`, `bookname`, `authorname`, `edition`, `year`, `quantity`, `price`, `image`, `customer_name`, `addtocard_date`) VALUES
(3, 'dd', 'dfsasa', '4', 2002, 10, 1200, 'uploads/image_0.jpg', 'saji', '2025-08-21 03:02:28'),
(4, 'dd', 'dfsasa', '4', 2002, 22, 1200, 'uploads/image_0.jpg', 'saji', '2025-08-21 03:05:57'),
(5, 'dd', 'dfsasa', '4', 2002, 22, 1200, 'uploads/image_0.jpg', 'saji', '2025-08-21 03:07:55');

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `bookname` varchar(255) NOT NULL,
  `authorname` varchar(255) NOT NULL,
  `edition` varchar(100) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`bookname`, `authorname`, `edition`, `year`, `quantity`, `price`, `image`) VALUES
('dsf', 'dfsf', '2', 2000, 20, 0.00, NULL),
('dd', 'dfsasa', '4', 2002, 22, 1200.00, 'uploads/image_0.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `purchase`
--

CREATE TABLE `purchase` (
  `id` int(11) NOT NULL,
  `bookname` varchar(150) NOT NULL,
  `authorname` varchar(100) NOT NULL,
  `edition` varchar(50) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `customer_name` varchar(255) NOT NULL,
  `purchase_date` date NOT NULL,
  `purchase_time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `purchase`
--

INSERT INTO `purchase` (`id`, `bookname`, `authorname`, `edition`, `year`, `quantity`, `price`, `image`, `customer_name`, `purchase_date`, `purchase_time`) VALUES
(1, 'dd', 'dfsasa', '4', 2002, 22, 1200.00, 'uploads/image_0.jpg', '', '2025-08-21', '01:44:47'),
(2, 'dd', 'dfsasa', '4', 2002, 22, 1200.00, 'uploads/image_0.jpg', 'saji', '2025-08-21', '03:40:24');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` int(11) NOT NULL,
  `customerId` varchar(50) NOT NULL,
  `bookName` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `sale_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `customerId`, `bookName`, `price`, `quantity`, `total`, `sale_date`) VALUES
(1, '1', 'dsf', 0.00, 1, 0.00, '2025-08-20 05:13:16'),
(2, '1', 'dsf', 0.00, 2, 0.00, '2025-08-20 06:13:36');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `telephone_number` varchar(20) DEFAULT NULL,
  `roll` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `name`, `address`, `telephone_number`, `roll`) VALUES
(1, 'admin', 'admin123', NULL, NULL, NULL, 'admin'),
(2, 'cashier', 'cashier123', NULL, NULL, NULL, 'cashier'),
(3, 'cashier', 'cashier123', NULL, NULL, NULL, 'cashier'),
(4, 'saji', '123', 'kawsi', 'sdad', '20154141', 'customer'),
(5, 'vijay', '123', 'vijay', 'fddsfdd', '556456', 'customer');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addtocard`
--
ALTER TABLE `addtocard`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase`
--
ALTER TABLE `purchase`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addtocard`
--
ALTER TABLE `addtocard`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `purchase`
--
ALTER TABLE `purchase`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
