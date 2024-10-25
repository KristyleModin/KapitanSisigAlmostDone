-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3308
-- Generation Time: Oct 25, 2024 at 02:03 PM
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
-- Database: `db_kapitansisig`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `firstname` varchar(191) NOT NULL,
  `lastname` varchar(191) NOT NULL,
  `username` varchar(191) NOT NULL,
  `password` varchar(191) NOT NULL,
  `is_banned` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=not_banned,1=banned',
  `created_at` date NOT NULL DEFAULT current_timestamp(),
  `position` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `firstname`, `lastname`, `username`, `password`, `is_banned`, `created_at`, `position`) VALUES
(1, 'Kristyle Marie', 'Modin', 'kmgmodin', '$2y$10$Aj1WGyrfovmy5VQA3wXKleP0nrV42X5knV.jfYJI1AStwXaV3kzDK', 0, '2024-10-16', 1),
(2, 'AJ', 'SALCEDO', 'aj', '$2y$10$lFvVO2O0fPcOzTREBoKUGOmLN0VwE6pcFGq40paeTFw9T37uiZc5q', 0, '2024-10-23', 0),
(3, 'Evanica', 'Juarbal', 'errjuarbal', '$2y$10$fySdcVDelpkkz8O9G3kU5uW5lnsgGl50BeRCsYBbZUhQq8gCbTj1m', 0, '2024-10-23', 1);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `status`) VALUES
(1, 'Sisig Meal', 0),
(2, 'Barkada Meals', 0),
(5, 'Shawarma Meals', 0),
(6, 'Meryenda Meals', 0),
(7, 'Extra', 0);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `name` varchar(566) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`) VALUES
(1, 'khim'),
(2, 'Dawn');

-- --------------------------------------------------------

--
-- Table structure for table `ingredients`
--

CREATE TABLE `ingredients` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `category` varchar(191) NOT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `quantity` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ingredients`
--

INSERT INTO `ingredients` (`id`, `name`, `unit_id`, `category`, `price`, `quantity`) VALUES
(6, 'Tuna', NULL, 'Meat & Poultry', 150.00, 5.00),
(7, 'Pork', NULL, 'Meat & Poultry', 250.00, 3.00),
(8, 'Spoon', NULL, 'Cutlery', 10.00, 10.00),
(9, 'Cup', NULL, 'Cutlery', 20.00, 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `ingredients_items`
--

CREATE TABLE `ingredients_items` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `ingredient_id` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ingredients_items`
--

INSERT INTO `ingredients_items` (`id`, `order_id`, `ingredient_id`, `price`, `quantity`) VALUES
(1, 1, 8, 0.00, 7),
(2, 1, 7, 0.00, 1),
(3, 2, 7, 0.00, 1),
(4, 3, 7, 0.00, 1),
(5, 4, 7, 0.00, 1),
(6, 4, 6, 0.00, 2),
(7, 5, 6, 0.00, 3),
(8, 5, 7, 0.00, 1),
(9, 6, 6, 150.00, 5),
(10, 6, 8, 10.00, 4),
(11, 7, 8, 10.00, 1),
(12, 7, 6, 150.00, 3),
(13, 8, 8, 10.00, 1),
(14, 8, 7, 250.00, 1),
(15, 9, 8, 10.00, 1),
(16, 10, 8, 10.00, 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `tracking_no` varchar(100) NOT NULL,
  `invoice_no` varchar(100) NOT NULL,
  `total_amount` varchar(100) NOT NULL,
  `order_date` datetime DEFAULT NULL,
  `order_status` enum('Placed','Preparing','Completed','Cancelled') NOT NULL DEFAULT 'Placed' COMMENT 'placed, preparing, completed, cancelled',
  `payment_mode` varchar(100) NOT NULL COMMENT 'cash,online',
  `order_placed_by_id` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `customer_id`, `tracking_no`, `invoice_no`, `total_amount`, `order_date`, `order_status`, `payment_mode`, `order_placed_by_id`) VALUES
(1, 1, '743987', 'INV-642713', '30', '2024-10-22 13:38:41', 'Preparing', 'Cash Payment', 'Kristyle Marie'),
(2, 1, '317161', 'INV-732094', '100', '2024-10-22 13:42:53', 'Preparing', 'Cash Payment', 'Kristyle Marie'),
(3, 1, '252979', 'INV-680166', '10', '2024-10-22 13:45:20', 'Preparing', 'Online Payment', 'Kristyle Marie'),
(4, 1, '660020', 'INV-123903', '10', '2024-10-22 14:39:12', 'Preparing', 'Cash Payment', 'Kristyle Marie'),
(5, 1, '175056', 'INV-204266', '10', '2024-10-22 14:40:07', 'Preparing', 'Cash Payment', 'Kristyle Marie'),
(6, 1, '125958', 'INV-869389', '50', '2024-10-22 14:57:58', 'Preparing', 'Cash Payment', 'Kristyle Marie'),
(7, 1, '371643', 'INV-402619', '100', '2024-10-22 15:03:48', 'Preparing', 'Cash Payment', 'Kristyle Marie'),
(8, 1, '297355', 'INV-841486', '10', '2024-10-22 15:05:33', 'Preparing', 'Cash Payment', 'Kristyle Marie'),
(9, 1, '866186', 'INV-398654', '10', '2024-10-22 15:08:03', 'Preparing', 'Cash Payment', 'Kristyle Marie'),
(10, 2, '195705', 'INV-307487', '100', '2024-10-22 15:09:24', 'Placed', 'Cash Payment', 'Kristyle Marie'),
(11, 1, '713333', 'INV-818253', '100', '2024-10-22 15:11:25', 'Placed', 'Cash Payment', 'Kristyle Marie'),
(12, 1, '305610', 'INV-672713', '1000', '2024-10-22 15:12:01', 'Placed', 'Cash Payment', 'Kristyle Marie'),
(13, 1, '938131', 'INV-765053', '10', '2024-10-23 15:43:10', 'Completed', 'Cash Payment', 'Kristyle Marie'),
(14, 1, '872348', 'INV-319481', '10', '2024-10-23 15:43:44', 'Completed', 'Online Payment', 'Kristyle Marie'),
(15, 1, '792841', 'INV-228906', '10', '2024-10-23 15:46:54', 'Completed', 'Cash Payment', 'Kristyle Marie'),
(16, 1, '854860', 'INV-285508', '10', '2024-10-23 15:47:59', 'Completed', 'Cash Payment', 'Kristyle Marie'),
(17, 1, '595464', 'INV-640086', '10', '2024-10-23 15:48:19', 'Completed', 'Cash Payment', 'Kristyle Marie'),
(18, 1, '348026', 'INV-981942', '10', '2024-10-23 15:50:02', 'Cancelled', 'Cash Payment', 'Kristyle Marie'),
(19, 1, '594075', 'INV-532362', '10', '2024-10-23 15:50:31', 'Cancelled', 'Cash Payment', 'Kristyle Marie'),
(20, 1, '332552', 'INV-591391', '10', '2024-10-23 15:51:19', 'Cancelled', 'Cash Payment', 'Kristyle Marie'),
(21, 1, '878249', 'INV-787122', '10', '2024-10-23 15:51:41', 'Cancelled', 'Cash Payment', 'Kristyle Marie'),
(22, 1, '345706', 'INV-229872', '10', '2024-10-23 15:53:07', 'Cancelled', 'Cash Payment', 'Kristyle Marie'),
(23, 1, '765970', 'INV-796792', '10', '2024-10-23 15:53:38', 'Placed', 'Online Payment', 'Kristyle Marie'),
(24, 1, '404149', 'INV-208975', '100', '2024-10-23 21:26:57', 'Placed', 'Cash Payment', 'Evanica'),
(25, 2, '324610', 'INV-780134', '10', '2024-10-24 18:21:19', 'Placed', 'Cash Payment', 'Kristyle Marie'),
(26, 1, '625428', 'INV-786946', '100', '2024-10-24 18:21:53', 'Placed', 'Cash Payment', 'Kristyle Marie');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `price` varchar(100) NOT NULL,
  `quantity` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `price`, `quantity`) VALUES
(1, 1, 6, '10.00', '3'),
(2, 2, 6, '10.00', '10'),
(3, 3, 6, '10.00', '1'),
(4, 4, 6, '10.00', '1'),
(5, 5, 6, '10.00', '1'),
(6, 6, 6, '50.00', '1'),
(7, 7, 6, '100.00', '1'),
(8, 8, 6, '10.00', '1'),
(9, 9, 6, '10.00', '1'),
(10, 10, 6, '100.00', '1'),
(11, 11, 6, '100.00', '1'),
(12, 12, 6, '100.00', '10'),
(13, 13, 7, '10.00', '1'),
(14, 14, 7, '10.00', '1'),
(15, 15, 7, '10.00', '1'),
(16, 16, 7, '10.00', '1'),
(17, 17, 7, '10.00', '1'),
(18, 18, 7, '10.00', '1'),
(19, 19, 7, '10.00', '1'),
(20, 20, 7, '10.00', '1'),
(21, 21, 7, '10.00', '1'),
(22, 22, 7, '10.00', '1'),
(23, 23, 7, '10.00', '1'),
(24, 24, 7, '10.00', '10'),
(25, 25, 6, '10.00', '1'),
(26, 26, 6, '10.00', '10');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `productname` varchar(191) NOT NULL,
  `description` varchar(191) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `image` varchar(255) NOT NULL,
  `created_at` date NOT NULL DEFAULT current_timestamp(),
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `productname`, `description`, `price`, `image`, `created_at`, `quantity`) VALUES
(6, 1, 'Pork Sisig', '', 10.00, 'pics/uploads/products/1729764476.jpg', '2024-10-23', 77),
(7, 1, 'Tuna Sisig', '', 120.00, 'pics/uploads/products/1729764558.jpg', '2024-10-24', 100);

-- --------------------------------------------------------

--
-- Table structure for table `purchaseorders`
--

CREATE TABLE `purchaseorders` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `tracking_no` varchar(100) NOT NULL,
  `invoice_no` varchar(100) NOT NULL,
  `total_amount` varchar(100) NOT NULL,
  `order_date` datetime NOT NULL,
  `order_status` enum('Placed','Pending','Delivered','Cancelled') NOT NULL,
  `ingPayment_mode` varchar(100) NOT NULL,
  `order_placed_by_id` varchar(100) NOT NULL,
  `supplierName` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `purchaseorders`
--

INSERT INTO `purchaseorders` (`id`, `customer_id`, `tracking_no`, `invoice_no`, `total_amount`, `order_date`, `order_status`, `ingPayment_mode`, `order_placed_by_id`, `supplierName`) VALUES
(1, 1, '000001', 'INV-417196', '100', '2024-10-24 16:35:17', 'Delivered', 'Cash Payment', 'Admin', '2'),
(2, 1, '000002', 'INV-371933', '50', '2024-10-24 16:41:12', 'Delivered', 'Cash Payment', 'Admin', '2'),
(3, 1, '000003', 'INV-278628', '40', '2024-10-24 16:53:18', 'Cancelled', 'Cash Payment', 'Admin', '2'),
(4, 1, '000004', 'INV-959861', '40', '2024-10-24 17:31:17', 'Placed', 'Online Payment', 'Admin', '2'),
(5, 1, '000005', 'INV-361375', '0', '2024-10-24 18:16:46', 'Placed', 'Cash Payment', 'Admin', '2'),
(6, 1, '000006', 'INV-387340', '790', '2024-10-24 18:19:41', 'Placed', 'Cash Payment', 'Admin', '2'),
(7, 1, '000007', 'INV-601577', '460', '2024-10-24 18:54:50', 'Pending', 'Cash Payment', 'Admin', '2'),
(8, 1, '000008', 'INV-833039', '260', '2024-10-24 18:56:16', 'Delivered', 'Cash Payment', 'Admin', '2'),
(9, 1, '000009', 'INV-807157', '10', '2024-10-24 19:43:18', 'Delivered', 'Cash Payment', 'Admin', '2'),
(10, 1, '000010', 'INV-903195', '10', '2024-10-24 19:44:12', 'Delivered', 'Cash Payment', 'Admin', '2'),
(11, 1, '000011', 'INV-198667', '320', '2024-10-25 09:49:32', 'Placed', 'Cash Payment', 'Admin', '3'),
(12, 1, '000012', 'INV-198667', '320', '2024-10-25 09:49:33', 'Placed', 'Cash Payment', 'Admin', '3'),
(13, 1, '000013', 'INV-198667', '320', '2024-10-25 09:49:34', 'Placed', 'Cash Payment', 'Admin', '3'),
(14, 1, '000014', 'INV-198667', '320', '2024-10-25 09:49:34', 'Placed', 'Cash Payment', 'Admin', '3'),
(15, 1, '000015', 'INV-198667', '320', '2024-10-25 09:49:34', 'Placed', 'Cash Payment', 'Admin', '3'),
(16, 1, '000016', 'INV-198667', '320', '2024-10-25 09:49:34', 'Placed', 'Cash Payment', 'Admin', '3'),
(17, 1, '000017', 'INV-198667', '320', '2024-10-25 09:49:34', 'Placed', 'Cash Payment', 'Admin', '3'),
(18, 1, '000018', 'INV-198667', '320', '2024-10-25 09:49:35', 'Placed', 'Cash Payment', 'Admin', '3'),
(19, 1, '000019', 'INV-198667', '320', '2024-10-25 09:49:35', 'Placed', 'Cash Payment', 'Admin', '3'),
(20, 1, '000020', 'INV-198667', '320', '2024-10-25 09:49:35', 'Placed', 'Cash Payment', 'Admin', '3'),
(21, 1, '000021', 'INV-198667', '320', '2024-10-25 09:50:41', 'Placed', 'Cash Payment', 'Admin', '3'),
(22, 1, '000022', 'INV-198667', '320', '2024-10-25 09:50:42', 'Placed', 'Cash Payment', 'Admin', '3'),
(23, 1, '000023', 'INV-198667', '320', '2024-10-25 09:50:42', 'Placed', 'Cash Payment', 'Admin', '3'),
(24, 1, '000024', 'INV-198667', '320', '2024-10-25 09:50:43', 'Placed', 'Cash Payment', 'Admin', '3'),
(25, 1, '000025', 'INV-198667', '320', '2024-10-25 09:50:52', 'Placed', 'Cash Payment', 'Admin', '3'),
(26, 1, '000026', 'INV-198667', '320', '2024-10-25 09:50:53', 'Placed', 'Cash Payment', 'Admin', '3'),
(27, 1, '000027', 'INV-198667', '320', '2024-10-25 09:50:53', 'Placed', 'Cash Payment', 'Admin', '3'),
(28, 1, '000028', 'INV-198667', '320', '2024-10-25 09:50:57', 'Placed', 'Cash Payment', 'Admin', '3'),
(29, 1, '000029', 'INV-198667', '320', '2024-10-25 09:50:58', 'Placed', 'Cash Payment', 'Admin', '3'),
(30, 1, '000030', 'INV-198667', '320', '2024-10-25 09:50:58', 'Placed', 'Cash Payment', 'Admin', '3');

-- --------------------------------------------------------

--
-- Table structure for table `recipes`
--

CREATE TABLE `recipes` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `recipes`
--

INSERT INTO `recipes` (`id`, `product_id`, `name`, `created_at`) VALUES
(1, 1, '', '2024-10-22 05:38:04'),
(2, 2, '', '2024-10-22 06:57:40'),
(3, 3, '', '2024-10-22 07:03:38'),
(4, 4, '', '2024-10-23 07:42:28'),
(5, 5, '', '2024-10-23 07:42:47'),
(6, 6, '', '2024-10-23 07:52:49'),
(7, 7, '', '2024-10-24 02:05:48');

-- --------------------------------------------------------

--
-- Table structure for table `recipe_ingredients`
--

CREATE TABLE `recipe_ingredients` (
  `id` int(11) NOT NULL,
  `recipe_id` int(11) NOT NULL,
  `ingredient_id` int(11) NOT NULL,
  `quantity` decimal(10,2) NOT NULL,
  `unit_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `recipe_ingredients`
--

INSERT INTO `recipe_ingredients` (`id`, `recipe_id`, `ingredient_id`, `quantity`, `unit_id`) VALUES
(1, 1, 15, 1.00, 16),
(5, 2, 19, 50.00, 13),
(6, 2, 22, 50.00, 18),
(7, 2, 21, 50.00, 13),
(8, 2, 18, 1.00, 14),
(9, 2, 20, 50.00, 13),
(10, 2, 23, 50.00, 18),
(11, 3, 24, 100.00, 13),
(12, 4, 25, 100.00, 13),
(13, 5, 26, 1.00, 16),
(14, 6, 28, 100.00, 13),
(15, 6, 28, 678.00, 14),
(17, 6, 7, 100.00, 13),
(18, 6, 8, 1.00, 14),
(19, 6, 9, 1.00, 14),
(20, 7, 7, 100.00, 13);

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` int(11) NOT NULL,
  `firstname` varchar(191) NOT NULL,
  `lastname` varchar(191) NOT NULL,
  `phonenumber` varchar(191) NOT NULL,
  `address` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `firstname`, `lastname`, `phonenumber`, `address`) VALUES
(2, 'Kristyle Marie', 'Modin', '09094192413', 'Purok Lomboy Coog, Mandug,'),
(3, 'Kassandra Mae', 'Modin', '0987654321', 'Mandug, Coog');

-- --------------------------------------------------------

--
-- Table structure for table `supplier_ingredients`
--

CREATE TABLE `supplier_ingredients` (
  `id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `ingredient_id` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `unit_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `supplier_ingredients`
--

INSERT INTO `supplier_ingredients` (`id`, `supplier_id`, `ingredient_id`, `price`, `unit_id`) VALUES
(19, 2, 29, 1005.00, 16),
(20, 2, 30, 1005.00, 15),
(21, 2, 6, 1005.00, 16),
(22, 3, 6, 700.00, 16),
(23, 3, 7, 1000.00, 13),
(24, 3, 8, 50.00, 15),
(25, 3, 9, 50.00, 15);

-- --------------------------------------------------------

--
-- Table structure for table `units_of_measure`
--

CREATE TABLE `units_of_measure` (
  `id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `uom_name` varchar(255) DEFAULT NULL,
  `type` enum('reference','bigger','smaller') DEFAULT NULL,
  `ratio` decimal(10,5) DEFAULT NULL,
  `active` tinyint(1) DEFAULT 1,
  `rounding_precision` decimal(10,5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `units_of_measure`
--

INSERT INTO `units_of_measure` (`id`, `category_id`, `uom_name`, `type`, `ratio`, `active`, `rounding_precision`) VALUES
(13, 5, 'g', 'reference', 1.00000, 1, 0.01000),
(14, 6, 'Pieces', 'reference', 1.00000, 1, 0.01000),
(15, 6, 'Dozen', 'bigger', 12.00000, 1, 0.01000),
(16, 5, 'kg', 'bigger', 0.00100, 1, 0.01000),
(21, 8, 'ml', 'reference', 1.00000, 1, 0.01000);

-- --------------------------------------------------------

--
-- Table structure for table `unit_categories`
--

CREATE TABLE `unit_categories` (
  `id` int(11) NOT NULL,
  `category_unit_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `unit_categories`
--

INSERT INTO `unit_categories` (`id`, `category_unit_name`) VALUES
(5, 'Weight'),
(6, 'Quantity'),
(8, 'Volume');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ingredients`
--
ALTER TABLE `ingredients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ingredients_ibfk_1` (`unit_id`);

--
-- Indexes for table `ingredients_items`
--
ALTER TABLE `ingredients_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ingredient_id` (`ingredient_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchaseorders`
--
ALTER TABLE `purchaseorders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `recipes`
--
ALTER TABLE `recipes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `recipe_ingredients`
--
ALTER TABLE `recipe_ingredients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recipe_id` (`recipe_id`),
  ADD KEY `ingredient_id` (`ingredient_id`),
  ADD KEY `unit_id` (`unit_id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supplier_ingredients`
--
ALTER TABLE `supplier_ingredients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `supplier_ingredients_ibfk_1` (`supplier_id`),
  ADD KEY `supplier_ingredients_ibfk_2` (`ingredient_id`);

--
-- Indexes for table `units_of_measure`
--
ALTER TABLE `units_of_measure`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `unit_categories`
--
ALTER TABLE `unit_categories`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ingredients`
--
ALTER TABLE `ingredients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `ingredients_items`
--
ALTER TABLE `ingredients_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `purchaseorders`
--
ALTER TABLE `purchaseorders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `recipes`
--
ALTER TABLE `recipes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `recipe_ingredients`
--
ALTER TABLE `recipe_ingredients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `supplier_ingredients`
--
ALTER TABLE `supplier_ingredients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `units_of_measure`
--
ALTER TABLE `units_of_measure`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `unit_categories`
--
ALTER TABLE `unit_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ingredients`
--
ALTER TABLE `ingredients`
  ADD CONSTRAINT `ingredients_ibfk_1` FOREIGN KEY (`unit_id`) REFERENCES `units_of_measure` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `ingredients_items`
--
ALTER TABLE `ingredients_items`
  ADD CONSTRAINT `ingredients_items_ibfk_1` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredients` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `supplier_ingredients`
--
ALTER TABLE `supplier_ingredients`
  ADD CONSTRAINT `supplier_ingredients_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`),
  ADD CONSTRAINT `supplier_ingredients_ibfk_2` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredients` (`id`);

--
-- Constraints for table `units_of_measure`
--
ALTER TABLE `units_of_measure`
  ADD CONSTRAINT `units_of_measure_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `unit_categories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
