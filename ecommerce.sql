-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 17, 2022 at 11:43 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.3.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `caption` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `image_path`, `caption`, `created_at`, `updated_at`) VALUES
(1, '1798674658nord2.jpg', 'One Plus Nord2', NULL, '2022-01-09 23:23:13'),
(2, '1157638169Dell.jpg', 'Dell Inspiron 7415 AMD R5 5500U 14 inches FHD Touch Display 2 in 1 Business Laptop (8GB/512GB SSD/Intel Integrated Graphics/Windows 10 + MSO/Backlit KB', NULL, NULL),
(3, '920391148noise.jpg', 'Noise ColorFit Ultra Bezel-Less Smart Watch with 1.75\" HD TruView Display, 60 Sports Modes, SpO2, Heart Rate, Stress, REM & Sleep Monitor', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Mobiles', 'Newly Launched', '2022-01-09 23:35:02', '2022-01-09 23:35:02'),
(2, 'Laptop', 'New Features', '2022-01-09 23:35:24', '2022-01-09 23:35:24'),
(3, 'Watch', 'Newly Launched', '2022-01-09 23:40:52', '2022-01-09 23:40:52'),
(4, 'Speakers', 'Newly Launched', '2022-01-10 00:10:25', '2022-01-10 00:10:25'),
(5, 'Shoes', 'Fashion', '2022-01-10 00:36:39', '2022-01-10 00:36:39'),
(6, 'Masks', 'Protective', '2022-01-10 03:02:03', '2022-01-10 03:02:03'),
(7, 'Cameras', 'Newly Launched', '2022-01-10 03:09:56', '2022-01-10 03:09:56'),
(8, 'Headphones', 'newly launched', '2022-01-10 03:13:49', '2022-01-10 03:13:49');

-- --------------------------------------------------------

--
-- Table structure for table `configurations`
--

CREATE TABLE `configurations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notification_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_no` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `configurations`
--

INSERT INTO `configurations` (`id`, `admin_email`, `notification_email`, `phone_no`, `created_at`, `updated_at`) VALUES
(1, 'deveshjadhav982@gmail.com', 'deveshjadhav982@gmail.com', 8975601145, NULL, '2022-01-16 12:20:06');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` bigint(20) NOT NULL,
  `message` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `email`, `phone`, `message`, `created_at`, `updated_at`) VALUES
(1, 'Devesh', 'deveshjadhav982@gmail.com', 8975601145, 'hiiiiiiiiiiiiiiiiiii', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('fixed','percent') COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` decimal(8,2) NOT NULL,
  `cart_value` decimal(8,2) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `code`, `type`, `value`, `cart_value`, `status`, `created_at`, `updated_at`) VALUES
(1, 'd124f6smth', 'fixed', '200.00', '500.00', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `c_m_s_managements`
--

CREATE TABLE `c_m_s_managements` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `c_m_s_managements`
--

INSERT INTO `c_m_s_managements` (`id`, `title`, `image_path`, `description`, `created_at`, `updated_at`) VALUES
(1, 'About Us', '1877186183cm1.jpg', 'This website is operated by E Shopping Mantra. Throughout the site, the terms “we”, “us” and “our” refer to E Shopping Mantra. E Shopping Mantra offers this website, including all information, tools and services available from this site to you, the user, conditioned upon your acceptance of all terms, conditions, policies and notices stated here.\r\n\r\nBy visiting our site and/ or purchasing something from us, you engage in our “Service” and agree to be bound by the following terms and conditions (“Terms of Service”, “Terms”), including those additional terms and conditions and policies referenced herein and/or available by hyperlink. These Terms of Service apply to all users of the site, including without limitation users who are browsers, vendors, customers, merchants, and/ or contributors of content.', NULL, '2022-01-15 14:34:45');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(14, '2014_10_12_000000_create_users_table', 1),
(15, '2014_10_12_100000_create_password_resets_table', 1),
(16, '2019_08_19_000000_create_failed_jobs_table', 1),
(17, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(18, '2021_12_23_170601_create_roles_table', 1),
(19, '2021_12_25_052048_create_categories_table', 1),
(20, '2021_12_26_162615_create_banners_table', 1),
(21, '2021_12_29_075909_create_products_table', 1),
(22, '2021_12_30_040349_create_product_images_table', 1),
(23, '2021_12_30_040749_create_product_attributes_table', 1),
(24, '2021_12_30_041148_create_product_categories_table', 1),
(25, '2022_01_01_041000_create_coupons_table', 1),
(26, '2022_01_05_210529_create_contacts_table', 1),
(27, '2022_01_13_080823_create_wishlists_table', 2),
(28, '2022_01_13_124412_create_wishlists_table', 3),
(29, '2022_01_03_092842_create_order_details_table', 4),
(30, '2022_01_13_192821_create_user_orders_table', 4),
(31, '2022_01_14_115736_create_user_addresses_table', 4),
(32, '2022_01_14_184120_create_c_m_s_managements_table', 4),
(33, '2022_01_15_180701_create_user_orders_table', 5),
(34, '2022_01_15_150744_create_configurations_table', 6);

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_method` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(8,2) DEFAULT NULL,
  `sale_price` decimal(8,2) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `features` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `product_id`, `name`, `quantity`, `price`, `sale_price`, `status`, `features`, `created_at`, `updated_at`) VALUES
(1, 1, 'm0uqnxefiv4w8s', 'OnePlus', 1, '40000.00', '30000.00', 1, 'OnePlus Nord 2 5G (Blue Haze, 8GB RAM, 128GB Storage)', '2022-01-09 23:41:54', '2022-01-15 13:56:21'),
(2, 2, '1de86r81ze3e5', 'Dell Inspiron', 1, '50000.00', '50000.00', 1, 'Dell Inspiron 7415 AMD R5 5500U 14 inches', '2022-01-10 00:11:52', '2022-01-15 13:59:20'),
(3, 3, 'c22etb15s50', 'Noise ColorFit Ultra', 1, '5000.00', '4500.00', 1, 'Noise ColorFit Ultra Bezel-Less Smart Watch with 1.75\" HD TruView Display, 60 Sports Modes, SpO2, Heart Rate, Stress, REM & Sleep Monitor', '2022-01-10 00:14:21', '2022-01-11 00:52:23'),
(4, 4, '1ortth7ks3m8g', 'Sony SA-D40', 1, '40000.00', '35000.00', 1, 'Sony SA-D40 4.1 Channel Multimedia Speaker System with Bluetooth (Black)', '2022-01-10 00:18:45', '2022-01-10 00:18:45'),
(5, 5, 'ysq4d5yd8k08s', 'Nike', 1, '4000.00', '3500.00', 1, 'Nike Men\'s Renew Fusion Training Shoes', '2022-01-10 00:38:32', '2022-01-10 00:38:32'),
(6, 6, 'sm53v38bcfqu', 'Mask', 1, '50.00', '45.00', 1, 'germ protective', '2022-01-10 03:04:27', '2022-01-10 03:04:27'),
(7, 6, '76hnmvhrbs76', 'mask', 1, '100.00', '70.00', 1, 'Comfortable', '2022-01-10 03:05:11', '2022-01-10 03:05:11'),
(8, 7, 'vesxybjy2vpc', 'Nikon', 1, '70000.00', '65000.00', 1, 'Nikon D780 DSLR Body with 24-120mm VR Lens', '2022-01-10 03:11:39', '2022-01-10 03:12:41'),
(9, 8, '1pj79tv6ujnok0', 'Boat Rockerz 550', 1, '1500.00', '1200.00', 1, 'boAt Rockerz 550 Bluetooth Wireless Over Ear Headphone with Mic (Black)', '2022-01-10 03:15:04', '2022-01-10 03:15:04'),
(11, 1, '7feeurqv9x', 'Samsung S21 ultra', 1, '90000.00', '85000.00', 1, 'SAMSUNG Galaxy S21 Ultra (Phantom Black, 256 GB)  (12 GB RAM)', '2022-01-15 14:08:22', '2022-01-15 14:08:22'),
(12, 1, '4yg688r6kuo8w4o', 'Iphone 13', 1, '100000.00', '95000.00', 1, 'Apple iPhone 13 Pro (128GB) - Sierra Blue', '2022-01-15 14:18:07', '2022-01-15 14:18:07');

-- --------------------------------------------------------

--
-- Table structure for table `product_attributes`
--

CREATE TABLE `product_attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `products_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(8,2) DEFAULT NULL,
  `features` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_attributes`
--

INSERT INTO `product_attributes` (`id`, `products_id`, `quantity`, `price`, `features`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '40000.00', 'OnePlus Nord 2 5G (Blue Haze, 8GB RAM, 128GB Storage)', NULL, '2022-01-15 13:56:21'),
(2, 2, 1, '50000.00', 'Dell Inspiron 7415 AMD R5 5500U 14 inches', NULL, '2022-01-15 13:59:20'),
(3, 3, 1, '5000.00', 'Noise ColorFit Ultra Bezel-Less Smart Watch with 1.75\" HD TruView Display, 60 Sports Modes, SpO2, Heart Rate, Stress, REM & Sleep Monitor', NULL, '2022-01-11 00:52:23'),
(4, 4, 1, '40000.00', 'Sony SA-D40 4.1 Channel Multimedia Speaker System with Bluetooth (Black)', NULL, NULL),
(5, 5, 1, '4000.00', 'Nike Men\'s Renew Fusion Training Shoes', NULL, NULL),
(6, 6, 1, '50.00', 'germ protective', NULL, NULL),
(7, 7, 1, '100.00', 'Comfortable', NULL, NULL),
(8, 8, 1, '70000.00', 'Nikon D780 DSLR Body with 24-120mm VR Lens', NULL, '2022-01-10 03:12:41'),
(9, 9, 1, '1500.00', 'boAt Rockerz 550 Bluetooth Wireless Over Ear Headphone with Mic (Black)', NULL, NULL),
(11, 11, 1, '90000.00', 'SAMSUNG Galaxy S21 Ultra (Phantom Black, 256 GB)  (12 GB RAM)', NULL, NULL),
(12, 12, 1, '100000.00', 'Apple iPhone 13 Pro (128GB) - Sierra Blue', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_categories`
--

CREATE TABLE `product_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `products_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_categories`
--

INSERT INTO `product_categories` (`id`, `category_id`, `products_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, '2022-01-15 13:56:21'),
(2, 2, 2, NULL, '2022-01-15 13:59:20'),
(3, 3, 3, NULL, '2022-01-11 00:52:23'),
(4, 4, 4, NULL, NULL),
(5, 5, 5, NULL, NULL),
(6, 6, 6, NULL, NULL),
(7, 6, 7, NULL, NULL),
(8, 7, 8, NULL, '2022-01-10 03:12:41'),
(9, 8, 9, NULL, NULL),
(11, 1, 11, NULL, NULL),
(12, 1, 12, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `products_id` bigint(20) UNSIGNED NOT NULL,
  `image_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `products_id`, `image_path`, `created_at`, `updated_at`) VALUES
(4, 4, '37564758sony.jpg', NULL, NULL),
(5, 5, '1972391360nike.jpg', NULL, NULL),
(6, 6, '915353609mask1.jpg', NULL, NULL),
(7, 7, '1680293312mask2.jpg', NULL, NULL),
(8, 8, '1791947596cam2.jpg', NULL, NULL),
(9, 9, '45125006h1.jpg', NULL, NULL),
(10, 3, '1179969482noise.jpg', NULL, NULL),
(11, 3, '1248735430w1.jpg', NULL, NULL),
(12, 3, '298683774w2.jpg', NULL, NULL),
(13, 1, '1228253858n1.jpg', NULL, NULL),
(14, 1, '693615797n2.jpg', NULL, NULL),
(15, 1, '1867119570nord2.jpg', NULL, NULL),
(16, 2, '2124464821l1.jpg', NULL, NULL),
(17, 2, '1470598418l2.jpg', NULL, NULL),
(18, 2, '1714938097l3.jpg', NULL, NULL),
(22, 11, '24314852s21.jpeg', NULL, NULL),
(23, 11, '1059753098s22.jpeg', NULL, NULL),
(24, 11, '330166698s23.jpeg', NULL, NULL),
(25, 12, '1053148594i1.jpg', NULL, NULL),
(26, 12, '1053001820i2.jpg', NULL, NULL),
(27, 12, '312192990i3.jpg', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `role_type`, `created_at`, `updated_at`) VALUES
(1, 'super admin', NULL, NULL),
(2, 'admin', NULL, NULL),
(3, 'inventory manager', NULL, NULL),
(4, 'order manager', NULL, NULL),
(5, 'customer', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'customer',
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `password`, `role_type`, `status`, `email_verified_at`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin1', 'admin2', 'deveshjadhav982@gmail.com', '$2y$10$JlydsayzAXBXQWdZDuJzXuQeOkp6RgZ4X2EkaxKY6tqoE4PGKs71O', 'admin', 1, NULL, NULL, NULL, NULL),
(2, 'user1', 'user2', 'user@gmail.com', '$2y$10$DAVgmNt98nIPuhWhZDiJFOzRpGAFCa3Hj5n24t9RpuVVCjjw03G.6', 'customer', 1, NULL, NULL, NULL, NULL),
(3, 'nis1', 'nis1', 'nis@gmail.com', '$2y$10$aZO6leXj9bFuXwnMSrqpm.P4vQqnkuraoDq8cwVg88lvBrRCjTdzm', 'customer', 1, NULL, NULL, NULL, '2022-01-17 00:41:17'),
(4, 'prashant', 'mishra', 'prashant.mishra4801@gmail.com', '$2y$10$zCxx4UlFDdAL6tzhpWFQ9Ocgl07TbfLm55yH6ZHwdIsZiV2Yw6/FK', 'customer', 1, NULL, NULL, NULL, NULL),
(6, 'abc', 'abc', 'vyshnavi.devi18@gmail.com', '$2y$10$TclbQrdVzQrv/sItzP96EujFScwTSysP81W0xdtBG8lf4qMzbDdrW', 'customer', 1, NULL, NULL, NULL, NULL),
(7, 'ecom', 'ecom', 'ecom3767@gmail.com', '$2y$10$39QfqXIFH41cR2hXIXFi2.uCzONEiYwZUyeWO6Qd6bv94ipKIgnji', 'customer', 1, NULL, NULL, NULL, NULL),
(8, 'kgce', 'kgce', 'kgcesem78@gmail.com', '$2y$10$ZAooYTeqF7eoAzAR66ljuO9uGvU7dh3/msd9uqp/m8xY.2wKMDHju', 'customer', 1, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_addresses`
--

CREATE TABLE `user_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` bigint(20) NOT NULL,
  `postal` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_addresses`
--

INSERT INTO `user_addresses` (`id`, `user_email`, `name`, `address`, `phone`, `postal`, `created_at`, `updated_at`) VALUES
(1, 'deveshjadhav982@gmail.com', 'Devesh', '203,Ramkrishna APPT,keshav nagar ,Boisar,401501', 8975601145, 401501, NULL, NULL),
(2, 'deveshjadhav982@gmail.com', 'Devesh', '203,Ramkrishna APPT,keshav nagar ,Boisar,401501', 8975601145, 401501, NULL, NULL),
(3, 'deveshjadhav982@gmail.com', 'Devesh', '203,Ramkrishna APPT,keshav nagar ,Boisar,401501', 8975601145, 401501, NULL, NULL),
(4, 'deveshjadhav982@gmail.com', 'Devesh', '203,Ramkrishna APPT,keshav nagar ,Boisar,401501', 8975601145, 401501, NULL, NULL),
(5, 'deveshjadhav982@gmail.com', 'Devesh', '203,Ramkrishna APPT,keshav nagar ,Boisar,401501', 8975601145, 401501, NULL, NULL),
(6, 'deveshjadhav982@gmail.com', 'Devesh', '203,Ramkrishna APPT,keshav nagar ,Boisar,401501', 8975601145, 401501, NULL, NULL),
(7, 'deveshjadhav982@gmail.com', 'Devesh', '203,Ramkrishna APPT,keshav nagar ,Boisar,401501', 8975601145, 401501, NULL, NULL),
(8, 'prashant.mishra4801@gmail.com', 'prashant', '203,Ramkrishna APPT,keshav nagar ,Boisar', 8975601145, 401501, NULL, NULL),
(9, 'prashant.mishra4801@gmail.com', 'prashant', '203,Ramkrishna APPT,keshav nagar ,Boisar,401501', 8975601145, 401501, NULL, NULL),
(10, 'deveshjadhav982@gmail.com', 'Devesh', '203,Ramkrishna APPT,keshav nagar ,Boisar,401501', 8975601145, 401501, NULL, NULL),
(11, 'deveshjadhav982@gmail.com', 'Devesh', '203,Ramkrishna APPT,keshav nagar ,Boisar,401501', 8975601145, 401501, NULL, NULL),
(12, 'deveshjadhav982@gmail.com', 'Devesh', '203,Ramkrishna APPT,keshav nagar ,Boisar,401501', 8975601145, 401501, NULL, NULL),
(13, 'kgcesem78@gmail.com', 'kgce', '203,Ramkrishna APPT,keshav nagar ,Boisar,401501', 8975601145, 401501, NULL, NULL),
(14, 'deveshjadhav982@gmail.com', 'Devesh', '203,Ramkrishna APPT,keshav nagar ,Boisar,401501', 8975601145, 401501, NULL, NULL),
(15, 'deveshjadhav982@gmail.com', 'Devesh', '203,Ramkrishna APPT,keshav nagar ,Boisar,401501', 8975601145, 401501, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_orders`
--

CREATE TABLE `user_orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `orderId` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_price` int(11) NOT NULL,
  `product_quantity` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `coupon_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` int(11) NOT NULL,
  `payment_mode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_orders`
--

INSERT INTO `user_orders` (`id`, `orderId`, `email`, `product_name`, `product_image`, `product_price`, `product_quantity`, `coupon_code`, `amount`, `payment_mode`, `status`, `created_at`, `updated_at`) VALUES
(1, '314484', 'nis@gmail.com', 'Noise ColorFit Ultra', '1179969482noise.jpg', 5000, '1', NULL, 5000, 'COD', 'delivered', NULL, '2022-01-16 12:24:25'),
(2, '355230', 'nis@gmail.com', 'Nike', '1972391360nike.jpg', 4000, '1', 'd124f6smth', 4000, 'COD', 'pending', NULL, NULL),
(3, '225445', 'nis@gmail.com', 'Iphone 13', '1053148594i1.jpg', 100000, '1', NULL, 100000, 'COD', 'pending', NULL, NULL),
(4, '430453', 'nis@gmail.com', 'Sony SA-D40', '37564758sony.jpg', 40000, '1', NULL, 40000, 'COD', 'pending', NULL, NULL),
(5, '508804', 'prashant.mishra4801@gmail.com', 'Noise ColorFit Ultra', '1179969482noise.jpg', 5000, '1', NULL, 5000, 'COD', 'pending', NULL, NULL),
(6, '473842', 'prashant.mishra4801@gmail.com', 'Nike', '1972391360nike.jpg', 4000, '1', NULL, 4000, 'COD', 'pending', NULL, NULL),
(7, '497115', 'deveshjadhav982@gmail.com', 'Noise ColorFit Ultra', '1179969482noise.jpg', 5000, '1', NULL, 5000, 'COD', 'pending', NULL, NULL),
(8, '142586', 'prashant.mishra4801@gmail.com', 'Noise ColorFit Ultra', '1179969482noise.jpg', 5000, '1', NULL, 5000, 'COD', 'pending', NULL, NULL),
(9, '155413', 'vyshnavi.devi18@gmail.com', 'Mask', '915353609mask1.jpg', 50, '10', NULL, 500, 'COD', 'pending', NULL, NULL),
(10, '406333', 'vyshnavi.devi18@gmail.com', 'Noise ColorFit Ultra', '1179969482noise.jpg', 5000, '1', NULL, 5000, 'COD', 'pending', NULL, NULL),
(11, '670142', 'kgcesem78@gmail.com', 'Noise ColorFit Ultra', '1179969482noise.jpg', 5000, '1', 'd124f6smth', 5000, 'COD', 'pending', NULL, NULL),
(12, '452721', 'prashant.mishra4801@gmail.com', 'Noise ColorFit Ultra', '1179969482noise.jpg', 5000, '1', NULL, 5000, 'COD', 'pending', NULL, NULL),
(13, '289909', 'prashant.mishra4801@gmail.com', 'Dell Inspiron', '2124464821l1.jpg', 50000, '1', NULL, 50000, 'COD', 'pending', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pro_id` int(11) NOT NULL,
  `product_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wishlists`
--

INSERT INTO `wishlists` (`id`, `user_email`, `pro_id`, `product_id`, `product_name`, `product_price`, `image_path`, `created_at`, `updated_at`) VALUES
(4, 'deveshjadhav982@gmail.com', 1, 'm0uqnxefiv4w8s', 'OnePlus', '40000.00', 'http://127.0.0.1:8000/uploads/2076862670nord2.jpg', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `configurations`
--
ALTER TABLE `configurations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupons_code_unique` (`code`);

--
-- Indexes for table `c_m_s_managements`
--
ALTER TABLE `c_m_s_managements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_product_id_unique` (`product_id`),
  ADD KEY `products_category_id_foreign` (`category_id`);

--
-- Indexes for table `product_attributes`
--
ALTER TABLE `product_attributes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_attributes_products_id_foreign` (`products_id`);

--
-- Indexes for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_categories_category_id_foreign` (`category_id`),
  ADD KEY `product_categories_products_id_foreign` (`products_id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_images_products_id_foreign` (`products_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_addresses`
--
ALTER TABLE `user_addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_orders`
--
ALTER TABLE `user_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `configurations`
--
ALTER TABLE `configurations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `c_m_s_managements`
--
ALTER TABLE `c_m_s_managements`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `product_attributes`
--
ALTER TABLE `product_attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `user_addresses`
--
ALTER TABLE `user_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `user_orders`
--
ALTER TABLE `user_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_attributes`
--
ALTER TABLE `product_attributes`
  ADD CONSTRAINT `product_attributes_products_id_foreign` FOREIGN KEY (`products_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD CONSTRAINT `product_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_categories_products_id_foreign` FOREIGN KEY (`products_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `product_images_products_id_foreign` FOREIGN KEY (`products_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
