-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 11 Jun 2026 pada 12.59
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

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
-- Struktur dari tabel `addresses`
--

CREATE TABLE `addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `locality` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL DEFAULT 'Indonesia',
  `landmark` varchar(255) DEFAULT NULL,
  `zip` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL DEFAULT 'home',
  `isdefault` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `addresses`
--

INSERT INTO `addresses` (`id`, `user_id`, `name`, `phone`, `locality`, `address`, `city`, `state`, `country`, `landmark`, `zip`, `type`, `isdefault`, `created_at`, `updated_at`) VALUES
(1, 2, 'Joseph satrio Budi p', '08121301924794', 'Dadali', 'Manuk Dadali', 'Banyumas', 'Indonesia', 'Indonesia', 'Warung Indah', '20123', 'home', 0, '2026-05-13 13:14:00', '2026-05-13 13:14:00'),
(2, 2, 'Joseph satrio Budi p', '081213019247', 'Dadali', 'Manuk Dadali', 'Banyumas', 'Indonesia', 'Indonesia', 'Warung Indah', '20123', 'home', 1, '2026-05-13 13:16:17', '2026-05-13 13:16:17'),
(3, 3, 'Joe Satrio', '081542104956', 'Dadali', '100', 'Purwokerto, Banyumas', 'Indonesia', 'Indonesia', 'Warung Indah', '12345', 'home', 0, '2026-05-13 22:12:51', '2026-05-13 22:12:51'),
(4, 3, 'Joe Satrio', '081542104956', 'Dadali', '100', 'Purwokerto, Banyumas', 'Indonesia', 'Indonesia', 'Warung Indah', '12345', 'home', 1, '2026-05-13 22:15:42', '2026-05-13 22:15:42'),
(5, 4, 'Joseph', '0812666141351', 'Jln. Gajah Mungkur, Gg. Gajah Mada, No4, Jogjakarta', 'Griya Oslo', 'Purwokerto, Banyumas', 'Indonesia', 'Indonesia', 'Griya Oslo', '20123', 'home', 1, '2026-06-03 23:34:32', '2026-06-03 23:34:32');

-- --------------------------------------------------------

--
-- Struktur dari tabel `auction_winners`
--

CREATE TABLE `auction_winners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `bid_id` bigint(20) UNSIGNED DEFAULT NULL,
  `reserved_until` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `auction_winners`
--

INSERT INTO `auction_winners` (`id`, `product_id`, `user_id`, `bid_id`, `reserved_until`, `created_at`, `updated_at`) VALUES
(1, 6, 3, 30, '2026-06-10 16:27:57', '2026-06-08 16:27:57', '2026-06-08 16:27:57'),
(2, 7, 3, 31, '2026-06-10 16:28:19', '2026-06-08 16:28:19', '2026-06-08 16:28:19'),
(3, 8, 3, 34, '2026-06-10 16:59:15', '2026-06-08 16:59:15', '2026-06-08 16:59:15'),
(4, 15, 3, 35, '2026-06-10 16:59:18', '2026-06-08 16:59:18', '2026-06-08 16:59:18');

-- --------------------------------------------------------

--
-- Struktur dari tabel `bids`
--

CREATE TABLE `bids` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `bid_amount` decimal(15,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `bids`
--

INSERT INTO `bids` (`id`, `product_id`, `user_id`, `bid_amount`, `created_at`, `updated_at`) VALUES
(1, 5, 3, 241000.00, '2026-06-08 05:38:09', '2026-06-08 05:38:09'),
(2, 5, 3, 1000000.00, '2026-06-08 05:42:34', '2026-06-08 05:42:34'),
(3, 12, 3, 252000.00, '2026-06-08 07:09:12', '2026-06-08 07:09:12'),
(4, 12, 4, 254000.00, '2026-06-08 07:10:08', '2026-06-08 07:10:08'),
(5, 12, 4, 254001.00, '2026-06-08 07:13:05', '2026-06-08 07:13:05'),
(6, 12, 4, 254002.00, '2026-06-08 07:14:13', '2026-06-08 07:14:13'),
(7, 12, 3, 254003.00, '2026-06-08 07:16:06', '2026-06-08 07:16:06'),
(8, 12, 3, 254004.00, '2026-06-08 07:20:45', '2026-06-08 07:20:45'),
(9, 12, 3, 254005.00, '2026-06-08 07:36:25', '2026-06-08 07:36:25'),
(10, 5, 3, 1000001.00, '2026-06-08 07:38:10', '2026-06-08 07:38:10'),
(11, 12, 3, 254006.00, '2026-06-08 07:39:37', '2026-06-08 07:39:37'),
(12, 12, 3, 254007.00, '2026-06-08 07:39:43', '2026-06-08 07:39:43'),
(13, 12, 3, 260000.00, '2026-06-08 07:49:57', '2026-06-08 07:49:57'),
(14, 5, 3, 1000002.00, '2026-06-08 08:05:35', '2026-06-08 08:05:35'),
(15, 5, 3, 1000003.00, '2026-06-08 08:14:20', '2026-06-08 08:14:20'),
(16, 11, 3, 251000.00, '2026-06-08 08:20:36', '2026-06-08 08:20:36'),
(17, 11, 4, 255000.00, '2026-06-08 08:21:34', '2026-06-08 08:21:34'),
(18, 11, 3, 255001.00, '2026-06-08 08:25:06', '2026-06-08 08:25:06'),
(19, 11, 3, 255002.00, '2026-06-08 08:37:32', '2026-06-08 08:37:32'),
(20, 11, 3, 265003.00, '2026-06-08 08:37:43', '2026-06-08 08:37:43'),
(21, 11, 3, 265004.00, '2026-06-08 08:38:23', '2026-06-08 08:38:23'),
(22, 9, 3, 215000.00, '2026-06-08 08:45:09', '2026-06-08 08:45:09'),
(23, 9, 3, 220000.00, '2026-06-08 08:45:28', '2026-06-08 08:45:28'),
(24, 9, 3, 220001.00, '2026-06-08 08:49:19', '2026-06-08 08:49:19'),
(25, 9, 3, 220002.00, '2026-06-08 08:54:09', '2026-06-08 08:54:09'),
(26, 9, 3, 230000.00, '2026-06-08 08:56:44', '2026-06-08 08:56:44'),
(27, 9, 3, 235000.00, '2026-06-08 09:01:58', '2026-06-08 09:01:58'),
(28, 9, 3, 238000.00, '2026-06-08 09:13:16', '2026-06-08 09:13:16'),
(29, 9, 3, 238001.00, '2026-06-08 09:14:07', '2026-06-08 09:14:07'),
(30, 6, 3, 240000.00, '2026-06-08 09:18:32', '2026-06-08 09:18:32'),
(31, 7, 3, 215000.00, '2026-06-08 16:22:14', '2026-06-08 16:22:14'),
(32, 7, 3, 216000.00, '2026-06-08 16:31:51', '2026-06-08 16:31:51'),
(33, 7, 3, 216001.00, '2026-06-08 16:32:53', '2026-06-08 16:32:53'),
(34, 8, 3, 250000.00, '2026-06-08 16:37:13', '2026-06-08 16:37:13'),
(35, 15, 3, 250000.00, '2026-06-08 16:53:50', '2026-06-08 16:53:50'),
(36, 15, 3, 255000.00, '2026-06-08 17:02:49', '2026-06-08 17:02:49'),
(37, 15, 3, 259000.00, '2026-06-08 17:14:06', '2026-06-08 17:14:06'),
(38, 11, 4, 270000.00, '2026-06-08 17:19:03', '2026-06-08 17:19:03'),
(39, 17, 4, 250000.00, '2026-06-08 17:38:17', '2026-06-08 17:38:17'),
(40, 17, 3, 260000.00, '2026-06-09 05:25:28', '2026-06-09 05:25:28'),
(41, 17, 3, 265000.00, '2026-06-10 12:46:30', '2026-06-10 12:46:30'),
(42, 17, 3, 265001.00, '2026-06-11 08:30:02', '2026-06-11 08:30:02');

-- --------------------------------------------------------

--
-- Struktur dari tabel `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `brands`
--

INSERT INTO `brands` (`id`, `name`, `slug`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Mini GT', 'mini-gt', '1779044238.jpg', '2026-05-17 11:57:25', '2026-05-17 11:57:25'),
(2, 'POPRACE', 'poprace', '1780940925.jpg', '2026-06-08 17:48:45', '2026-06-08 17:48:45');

-- --------------------------------------------------------

--
-- Struktur dari tabel `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `parent_id` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `image`, `parent_id`, `created_at`, `updated_at`) VALUES
(5, 'JDM', 'jdm', '1779046354.jpg', NULL, '2026-05-17 12:32:34', '2026-06-02 08:20:04'),
(6, 'EUDM', 'eudm', '1781166487.png', NULL, '2026-05-17 12:37:13', '2026-06-11 08:28:14'),
(7, 'USDM', 'usdm', '1779183578.jpg', NULL, '2026-05-19 02:39:38', '2026-05-19 02:39:38');

-- --------------------------------------------------------

--
-- Struktur dari tabel `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `comment` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `email`, `phone`, `comment`, `created_at`, `updated_at`) VALUES
(2, 'Kelompok 4', 'Kelompok4@gmail.com', '081234567890', 'Toko diescast terlengkap di purwokerto, website ini sangat membantu dalam belanja online karena memudahkan kita sebagai pelanggan tidak perlu datang ke toko, dan produk sudah sangat lengkap dan toko ini sangan terpercaya', '2026-06-05 09:03:31', '2026-06-05 09:03:31');

-- --------------------------------------------------------

--
-- Struktur dari tabel `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) NOT NULL,
  `type` enum('fixed','percent') NOT NULL,
  `value` decimal(8,2) NOT NULL,
  `cart_value` decimal(8,2) NOT NULL,
  `expiry_date` date NOT NULL DEFAULT cast(current_timestamp() as date),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `coupons`
--

INSERT INTO `coupons` (`id`, `code`, `type`, `value`, `cart_value`, `expiry_date`, `created_at`, `updated_at`) VALUES
(1, 'HEMAT100', 'fixed', 100000.00, 1.00, '2026-06-30', '2026-05-13 12:38:07', '2026-06-07 00:34:08'),
(2, 'SUPERSALE!!', 'fixed', 200000.00, 100.00, '2026-07-11', '2026-06-05 08:56:48', '2026-06-05 08:56:48'),
(3, 'PASTIDISKON', 'fixed', 200000.00, 100.00, '2026-06-30', '2026-06-08 17:50:47', '2026-06-08 17:50:47');

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_01_30_054616_create_brands_table', 1),
(5, '2025_02_03_030341_create_categories_table', 1),
(6, '2025_02_05_040842_create_products_table', 1),
(7, '2025_03_09_042609_create_coupons_table', 1),
(8, '2025_03_09_160135_create_orders_table', 1),
(9, '2025_03_09_160340_create_order_items_table', 1),
(10, '2025_03_09_160352_create_addresses_table', 1),
(11, '2025_03_09_160411_create_transactions_table', 1),
(12, '2025_03_16_230052_create_slides_table', 1),
(13, '2025_03_21_011932_create_month_names_table', 1),
(14, '2025_03_21_223034_create_contacts_table', 1),
(15, '2025_03_22_055216_add_details_to_transactions_table', 1),
(16, '2025_03_22_070911_add_total_items_to_orders_table', 1),
(17, '2026_05_13_201249_add_default_country_to_addresses_table', 2),
(18, '2026_05_18_update_product_prices_column', 3),
(19, '2026_05_18_change_short_description_type', 4),
(20, '2026_06_08_000000_create_bids_table', 4),
(21, '2026_06_08_000001_add_auction_enabled_to_products_table', 4),
(22, '2026_06_08_121700_update_orders_decimal_precision', 5),
(23, '2026_06_08_000002_add_auction_period_to_products_table', 6),
(24, '2026_06_08_000004_create_auction_winners_table', 7);

-- --------------------------------------------------------

--
-- Struktur dari tabel `month_names`
--

CREATE TABLE `month_names` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `subtotal` decimal(16,2) NOT NULL,
  `discount` decimal(16,2) NOT NULL DEFAULT 0.00,
  `tax` decimal(16,2) NOT NULL,
  `total` decimal(16,2) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `locality` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `landmark` varchar(255) DEFAULT NULL,
  `zip` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL DEFAULT 'home',
  `status` enum('ordered','delivered','canceled') NOT NULL DEFAULT 'ordered',
  `is_shipping_different` tinyint(1) NOT NULL DEFAULT 0,
  `delivered_date` date DEFAULT NULL,
  `canceled_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `total_items` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `subtotal`, `discount`, `tax`, `total`, `name`, `phone`, `locality`, `address`, `city`, `state`, `country`, `landmark`, `zip`, `type`, `status`, `is_shipping_different`, `delivered_date`, `canceled_date`, `created_at`, `updated_at`, `total_items`) VALUES
(1, 2, 700000.00, 100000.00, 70000.00, 770000.00, 'Joseph satrio Budi p', '081213019247', 'Dadali', 'Manuk Dadali', 'Banyumas', 'Indonesia', 'Indonesia', 'Warung Indah', '20123', 'home', 'canceled', 0, '2026-05-13', '2026-05-14', '2026-05-13 13:16:17', '2026-05-13 22:00:43', 1),
(2, 3, 100000.00, 0.00, 10000.00, 110000.00, 'Joe Satrio', '081542104956', 'Dadali', '100', 'Purwokerto, Banyumas', 'Indonesia', 'Indonesia', 'Warung Indah', '12345', 'home', 'delivered', 0, '2026-05-14', NULL, '2026-05-13 22:15:42', '2026-05-13 22:23:58', 1),
(3, 3, 700000.00, 100000.00, 70000.00, 770000.00, 'Joe Satrio', '081542104956', 'Dadali', '100', 'Purwokerto, Banyumas', 'Indonesia', 'Indonesia', 'Warung Indah', '12345', 'home', 'ordered', 0, NULL, NULL, '2026-05-13 22:18:54', '2026-05-13 22:18:54', 2),
(4, 3, 400000.00, 100000.00, 40000.00, 440000.00, 'Joe Satrio', '081542104956', 'Dadali', '100', 'Purwokerto, Banyumas', 'Indonesia', 'Indonesia', 'Warung Indah', '12345', 'home', 'ordered', 0, NULL, NULL, '2026-05-13 22:21:06', '2026-05-13 22:21:06', 2),
(5, 3, 100000.00, 0.00, 10000.00, 110000.00, 'Joe Satrio', '081542104956', 'Dadali', '100', 'Purwokerto, Banyumas', 'Indonesia', 'Indonesia', 'Warung Indah', '12345', 'home', 'canceled', 0, NULL, '2026-05-14', '2026-05-13 22:39:19', '2026-05-13 22:40:14', 1),
(6, 3, 0.00, 100000.00, 0.00, 0.00, 'Joe Satrio', '081542104956', 'Dadali', '100', 'Purwokerto, Banyumas', 'Indonesia', 'Indonesia', 'Warung Indah', '12345', 'home', 'canceled', 0, NULL, '2026-05-14', '2026-05-13 22:45:45', '2026-05-13 22:46:51', 1),
(7, 3, 100000.00, 100000.00, 10000.00, 110000.00, 'Joe Satrio', '081542104956', 'Dadali', '100', 'Purwokerto, Banyumas', 'Indonesia', 'Indonesia', 'Warung Indah', '12345', 'home', 'delivered', 0, '2026-05-14', '2026-05-14', '2026-05-13 22:50:03', '2026-05-13 22:51:07', 2),
(8, 3, 100000.00, 100000.00, 10000.00, 110000.00, 'Joe Satrio', '081542104956', 'Dadali', '100', 'Purwokerto, Banyumas', 'Indonesia', 'Indonesia', 'Warung Indah', '12345', 'home', 'delivered', 0, '2026-05-14', NULL, '2026-05-14 05:21:54', '2026-05-14 05:30:51', 2),
(9, 3, 300000.00, 100000.00, 30000.00, 330000.00, 'Joe Satrio', '081542104956', 'Dadali', '100', 'Purwokerto, Banyumas', 'Indonesia', 'Indonesia', 'Warung Indah', '12345', 'home', 'delivered', 0, '2026-05-14', NULL, '2026-05-14 05:24:31', '2026-05-14 05:29:09', 1),
(10, 3, 300000.00, 100000.00, 30000.00, 330000.00, 'Joe Satrio', '081542104956', 'Dadali', '100', 'Purwokerto, Banyumas', 'Indonesia', 'Indonesia', 'Warung Indah', '12345', 'home', 'ordered', 0, NULL, NULL, '2026-05-14 05:45:30', '2026-05-14 05:45:30', 1),
(11, 3, 140000.00, 100000.00, 14000.00, 154000.00, 'Joe Satrio', '081542104956', 'Dadali', '100', 'Purwokerto, Banyumas', 'Indonesia', 'Indonesia', 'Warung Indah', '12345', 'home', 'ordered', 0, NULL, NULL, '2026-05-17 12:22:19', '2026-05-17 12:22:19', 1),
(12, 3, 240000.00, 0.00, 24000.00, 264000.00, 'Joe Satrio', '081542104956', 'Dadali', '100', 'Purwokerto, Banyumas', 'Indonesia', 'Indonesia', 'Warung Indah', '12345', 'home', 'ordered', 0, NULL, NULL, '2026-05-18 19:22:54', '2026-05-18 19:22:54', 1),
(13, 3, 240000.00, 0.00, 24000.00, 264000.00, 'Joe Satrio', '081542104956', 'Dadali', '100', 'Purwokerto, Banyumas', 'Indonesia', 'Indonesia', 'Warung Indah', '12345', 'home', 'ordered', 0, NULL, NULL, '2026-05-20 22:44:16', '2026-05-20 22:44:16', 1),
(14, 3, 140000.00, 100000.00, 14000.00, 154000.00, 'Joe Satrio', '081542104956', 'Dadali', '100', 'Purwokerto, Banyumas', 'Indonesia', 'Indonesia', 'Warung Indah', '12345', 'home', 'ordered', 0, NULL, NULL, '2026-05-25 23:46:02', '2026-05-25 23:46:02', 1),
(15, 3, 380000.00, 100000.00, 38000.00, 418000.00, 'Joe Satrio', '081542104956', 'Dadali', '100', 'Purwokerto, Banyumas', 'Indonesia', 'Indonesia', 'Warung Indah', '12345', 'home', 'ordered', 0, NULL, NULL, '2026-05-25 23:47:48', '2026-05-25 23:47:48', 2),
(16, 3, 240000.00, 0.00, 24000.00, 264000.00, 'Joe Satrio', '081542104956', 'Dadali', '100', 'Purwokerto, Banyumas', 'Indonesia', 'Indonesia', 'Warung Indah', '12345', 'home', 'ordered', 0, NULL, NULL, '2026-05-26 00:03:07', '2026-05-26 00:03:07', 1),
(17, 3, 720000.00, 0.00, 72000.00, 792000.00, 'Joe Satrio', '081542104956', 'Dadali', '100', 'Purwokerto, Banyumas', 'Indonesia', 'Indonesia', 'Warung Indah', '12345', 'home', 'delivered', 0, '2026-06-03', NULL, '2026-06-03 08:05:20', '2026-06-03 10:42:34', 3),
(18, 4, 720000.00, 0.00, 72000.00, 792000.00, 'Joseph', '0812666141351', 'Jln. Gajah Mungkur, Gg. Gajah Mada, No4, Jogjakarta', 'Griya Oslo', 'Purwokerto, Banyumas', 'Indonesia', 'Indonesia', 'Griya Oslo', '20123', 'home', 'ordered', 0, NULL, NULL, '2026-06-03 23:34:32', '2026-06-03 23:34:32', 3),
(19, 4, 250000.00, 0.00, 25000.00, 275000.00, 'Joseph', '0812666141351', 'Jln. Gajah Mungkur, Gg. Gajah Mada, No4, Jogjakarta', 'Griya Oslo', 'Purwokerto, Banyumas', 'Indonesia', 'Indonesia', 'Griya Oslo', '20123', 'home', 'ordered', 0, NULL, NULL, '2026-06-04 00:41:19', '2026-06-04 00:41:19', 1),
(20, 3, 150000.00, 100000.00, 15000.00, 165000.00, 'Joe Satrio', '081542104956', 'Dadali', '100', 'Purwokerto, Banyumas', 'Indonesia', 'Indonesia', 'Warung Indah', '12345', 'home', 'ordered', 0, NULL, NULL, '2026-06-07 00:35:19', '2026-06-07 00:35:19', 1),
(21, 3, 150000.00, 100000.00, 15000.00, 165000.00, 'Joe Satrio', '081542104956', 'Dadali', '100', 'Purwokerto, Banyumas', 'Indonesia', 'Indonesia', 'Warung Indah', '12345', 'home', 'ordered', 0, NULL, NULL, '2026-06-07 00:39:03', '2026-06-07 00:39:03', 1),
(22, 3, 240000.00, 0.00, 24000.00, 264000.00, 'Joe Satrio', '081542104956', 'Dadali', '100', 'Purwokerto, Banyumas', 'Indonesia', 'Indonesia', 'Warung Indah', '12345', 'home', 'ordered', 0, NULL, NULL, '2026-06-07 03:53:15', '2026-06-07 03:53:15', 1),
(23, 3, 250000.00, 0.00, 25000.00, 275000.00, 'Joe Satrio', '081542104956', 'Dadali', '100', 'Purwokerto, Banyumas', 'Indonesia', 'Indonesia', 'Warung Indah', '12345', 'home', 'ordered', 0, NULL, NULL, '2026-06-07 03:54:05', '2026-06-07 03:54:05', 1),
(24, 3, 241000.00, 0.00, 24100.00, 265100.00, 'Joe Satrio', '081542104956', 'Dadali', '100', 'Purwokerto, Banyumas', 'Indonesia', 'Indonesia', 'Warung Indah', '12345', 'home', 'ordered', 0, NULL, NULL, '2026-06-08 05:38:56', '2026-06-08 05:38:56', 1),
(25, 3, 240000.00, 0.00, 24000.00, 264000.00, 'Joe Satrio', '081542104956', 'Dadali', '100', 'Purwokerto, Banyumas', 'Indonesia', 'Indonesia', 'Warung Indah', '12345', 'home', 'ordered', 0, NULL, NULL, '2026-06-08 05:44:41', '2026-06-08 05:44:41', 1),
(26, 3, 1000000.00, 0.00, 100000.00, 1100000.00, 'Joe Satrio', '081542104956', 'Dadali', '100', 'Purwokerto, Banyumas', 'Indonesia', 'Indonesia', 'Warung Indah', '12345', 'home', 'ordered', 0, NULL, NULL, '2026-06-08 06:52:48', '2026-06-08 06:52:48', 1),
(27, 3, 260000.00, 0.00, 26000.00, 286000.00, 'Joe Satrio', '081542104956', 'Dadali', '100', 'Purwokerto, Banyumas', 'Indonesia', 'Indonesia', 'Warung Indah', '12345', 'home', 'ordered', 0, NULL, NULL, '2026-06-08 07:52:44', '2026-06-08 07:52:44', 1),
(28, 3, 259000.00, 0.00, 25900.00, 284900.00, 'Joe Satrio', '081542104956', 'Dadali', '100', 'Purwokerto, Banyumas', 'Indonesia', 'Indonesia', 'Warung Indah', '12345', 'home', 'ordered', 0, NULL, NULL, '2026-06-08 17:15:44', '2026-06-08 17:15:44', 1),
(29, 4, 270000.00, 0.00, 27000.00, 297000.00, 'Joseph', '0812666141351', 'Jln. Gajah Mungkur, Gg. Gajah Mada, No4, Jogjakarta', 'Griya Oslo', 'Purwokerto, Banyumas', 'Indonesia', 'Indonesia', 'Griya Oslo', '20123', 'home', 'ordered', 0, NULL, NULL, '2026-06-08 17:20:38', '2026-06-08 17:20:38', 1),
(30, 4, 250000.00, 0.00, 25000.00, 275000.00, 'Joseph', '0812666141351', 'Jln. Gajah Mungkur, Gg. Gajah Mada, No4, Jogjakarta', 'Griya Oslo', 'Purwokerto, Banyumas', 'Indonesia', 'Indonesia', 'Griya Oslo', '20123', 'home', 'ordered', 0, NULL, NULL, '2026-06-08 17:40:41', '2026-06-08 17:40:41', 1),
(31, 3, 240000.00, 0.00, 24000.00, 264000.00, 'Joe Satrio', '081542104956', 'Dadali', '100', 'Purwokerto, Banyumas', 'Indonesia', 'Indonesia', 'Warung Indah', '12345', 'home', 'ordered', 0, NULL, NULL, '2026-06-08 17:43:25', '2026-06-08 17:43:25', 1),
(32, 3, 250000.00, 0.00, 25000.00, 275000.00, 'Joe Satrio', '081542104956', 'Dadali', '100', 'Purwokerto, Banyumas', 'Indonesia', 'Indonesia', 'Warung Indah', '12345', 'home', 'ordered', 0, NULL, NULL, '2026-06-08 17:53:21', '2026-06-08 17:53:21', 1),
(33, 3, 260000.00, 0.00, 26000.00, 286000.00, 'Joe Satrio', '081542104956', 'Dadali', '100', 'Purwokerto, Banyumas', 'Indonesia', 'Indonesia', 'Warung Indah', '12345', 'home', 'ordered', 0, NULL, NULL, '2026-06-09 05:28:07', '2026-06-09 05:28:07', 1),
(34, 3, 250000.00, 0.00, 25000.00, 275000.00, 'Joe Satrio', '081542104956', 'Dadali', '100', 'Purwokerto, Banyumas', 'Indonesia', 'Indonesia', 'Warung Indah', '12345', 'home', 'ordered', 0, NULL, NULL, '2026-06-09 11:46:42', '2026-06-09 11:46:42', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `options` longtext DEFAULT NULL,
  `rstatus` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `order_items`
--

INSERT INTO `order_items` (`id`, `product_id`, `order_id`, `price`, `quantity`, `options`, `rstatus`, `created_at`, `updated_at`) VALUES
(13, 6, 12, 240000.00, 1, NULL, 0, '2026-05-18 19:22:55', '2026-05-18 19:22:55'),
(14, 6, 13, 240000.00, 1, NULL, 0, '2026-05-20 22:44:16', '2026-05-20 22:44:16'),
(15, 6, 14, 240000.00, 1, NULL, 0, '2026-05-25 23:46:02', '2026-05-25 23:46:02'),
(16, 6, 15, 240000.00, 1, NULL, 0, '2026-05-25 23:47:48', '2026-05-25 23:47:48'),
(17, 5, 15, 240000.00, 1, NULL, 0, '2026-05-25 23:47:48', '2026-05-25 23:47:48'),
(18, 5, 16, 240000.00, 1, NULL, 0, '2026-05-26 00:03:07', '2026-05-26 00:03:07'),
(19, 11, 17, 250000.00, 2, NULL, 0, '2026-06-03 08:05:20', '2026-06-03 08:05:20'),
(20, 10, 17, 220000.00, 1, NULL, 0, '2026-06-03 08:05:20', '2026-06-03 08:05:20'),
(21, 11, 18, 250000.00, 2, NULL, 0, '2026-06-03 23:34:32', '2026-06-03 23:34:32'),
(22, 10, 18, 220000.00, 1, NULL, 0, '2026-06-03 23:34:32', '2026-06-03 23:34:32'),
(23, 11, 19, 250000.00, 1, NULL, 0, '2026-06-04 00:41:19', '2026-06-04 00:41:19'),
(24, 12, 20, 250000.00, 1, NULL, 0, '2026-06-07 00:35:19', '2026-06-07 00:35:19'),
(25, 11, 21, 250000.00, 1, NULL, 0, '2026-06-07 00:39:03', '2026-06-07 00:39:03'),
(26, 5, 22, 240000.00, 1, NULL, 0, '2026-06-07 03:53:15', '2026-06-07 03:53:15'),
(27, 11, 23, 250000.00, 1, NULL, 0, '2026-06-07 03:54:05', '2026-06-07 03:54:05'),
(28, 5, 24, 241000.00, 1, NULL, 0, '2026-06-08 05:38:56', '2026-06-08 05:38:56'),
(29, 13, 25, 240000.00, 1, NULL, 0, '2026-06-08 05:44:41', '2026-06-08 05:44:41'),
(30, 12, 27, 260000.00, 1, NULL, 0, '2026-06-08 07:52:44', '2026-06-08 07:52:44'),
(31, 15, 28, 259000.00, 1, NULL, 0, '2026-06-08 17:15:44', '2026-06-08 17:15:44'),
(32, 11, 29, 270000.00, 1, NULL, 0, '2026-06-08 17:20:38', '2026-06-08 17:20:38'),
(33, 17, 30, 250000.00, 1, NULL, 0, '2026-06-08 17:40:41', '2026-06-08 17:40:41'),
(34, 17, 31, 240000.00, 1, NULL, 0, '2026-06-08 17:43:25', '2026-06-08 17:43:25'),
(35, 11, 32, 250000.00, 1, NULL, 0, '2026-06-08 17:53:21', '2026-06-08 17:53:21'),
(36, 17, 33, 260000.00, 1, NULL, 0, '2026-06-09 05:28:07', '2026-06-09 05:28:07'),
(37, 11, 34, 250000.00, 1, NULL, 0, '2026-06-09 11:46:42', '2026-06-09 11:46:42');

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `short_description` text DEFAULT NULL,
  `description` text NOT NULL,
  `regular_price` decimal(15,2) NOT NULL,
  `sale_price` decimal(15,2) DEFAULT NULL,
  `SKU` varchar(255) NOT NULL,
  `stock_status` enum('instock','outofstock') NOT NULL,
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `auction_enabled` tinyint(1) NOT NULL DEFAULT 0,
  `auction_start` timestamp NULL DEFAULT NULL,
  `auction_end` timestamp NULL DEFAULT NULL,
  `quantity` int(10) UNSIGNED NOT NULL DEFAULT 10,
  `image` varchar(255) DEFAULT NULL,
  `images` text DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `brand_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `products`
--

INSERT INTO `products` (`id`, `name`, `slug`, `short_description`, `description`, `regular_price`, `sale_price`, `SKU`, `stock_status`, `featured`, `auction_enabled`, `auction_start`, `auction_end`, `quantity`, `image`, `images`, `category_id`, `brand_id`, `created_at`, `updated_at`) VALUES
(5, 'Nissan LB-ER34 Super Silhouette SKYLINE Black', 'nissan-lb-er34-super-silhouette-skyline-black', 'MINI GT Nissan LB-ER34 Super Silhouette SKYLINE Black hadir dengan desain agresif khas Liberty Walk yang terinspirasi dari mobil balap Super Silhouette legendaris Jepang. .', 'MINI GT Nissan LB-ER34 Super Silhouette SKYLINE Black hadir dengan desain agresif khas Liberty Walk yang terinspirasi dari mobil balap Super Silhouette legendaris Jepang. Diecast ini menampilkan detail body kit lebar, spoiler besar, velg sporty, serta finishing warna hitam elegan yang membuat tampilannya semakin premium dan garang.\r\n\r\nDibuat dengan detail presisi tinggi khas MINI GT, model ini sangat cocok untuk kolektor diecast JDM maupun penggemar Nissan Skyline. Cocok dijadikan koleksi display, hadiah, ataupun pelengkap koleksi mobil skala 1:64 Anda.', 250000.00, 240000.00, 'MGT', 'instock', 1, 0, '2026-06-08 07:00:00', '2026-06-08 10:02:00', 100, '1779192941.jpg', '1779046482-1.jpg,1779046482-2.jpg', 5, 1, '2026-05-17 12:34:44', '2026-06-08 08:17:18'),
(6, 'MiniGT #1108 1/64 BMW M4 GT3 #91 FIST Team AAI 2025 China GT Exclusive', 'minigt-1108-164-bmw-m4-gt3-91-fist-team-aai-2025-china-gt-exclusive', 'MiniGT #1108 BMW M4 GT3 #91 FIST Team AAI 2025 diecast 1:64 sporty untuk koleksi.', 'MiniGT #1108 BMW M4 GT3 #91 FIST Team AAI 2025 diecast 1:64 sporty untuk koleksi.\r\n\r\nMiniGT #1108 BMW M4 GT3 #91 FIST Team AAI 2025 China GT Exclusive adalah diecast skala 1:64 dengan desain sporty dan detail khas mobil balap GT3. Cocok untuk koleksi pecinta motorsport dan MINI GT.', 250000.00, 240000.00, 'MGT', 'instock', 1, 0, '2026-06-07 16:17:00', '2026-06-08 16:19:00', 100, '1779192877.jpg', '1779047273-1.jpg', 6, 1, '2026-05-17 12:47:53', '2026-06-08 17:17:20'),
(7, 'Nissan SILVIA (S15) LB-Super Silhouette AMOCULTURE', 'nissan-silvia-s15-lb-super-silhouette-amoculture', 'Nissan SILVIA (S15) LB-Super Silhouette AMOCULTURE', 'Nissan SILVIA (S15) LB-Super Silhouette AMOCULTURE\r\nItem No.MGT01239\r\nScale1:64\r\nMarqueNissan', 230000.00, 210000.00, 'MGT', 'instock', 1, 0, '2026-06-07 16:21:00', '2026-06-08 16:33:00', 2000, '1780384915.jpg', '1780384915-1.jpg', 5, 1, '2026-06-02 00:21:56', '2026-06-08 17:17:27'),
(8, 'Nissan Z Veilside FFZ400 Orange Chrome', 'nissan-z-veilside-ffz400-orange-chrome', 'Nissan Z Veilside FFZ400 Orange Chrome\r\nItem No.MGT01153\r\nScale1:64\r\nMarque : Nissan', 'Nissan Z Veilside FFZ400 Orange Chrome\r\nItem : No.MGT01153\r\nScale : 1:64\r\nColor : Orange Chrome\r\n\r\n[ VeilSide Ltd. 2026 EXCLUSIVE ]', 250000.00, 220000.00, 'MGT', 'instock', 1, 0, '2026-06-07 16:36:00', '2026-06-08 16:38:00', 2000, '1780385368.jpg', '1780385368-1.jpg', 5, 1, '2026-06-02 00:29:28', '2026-06-08 17:17:11'),
(9, 'Minigt 1/64 Diecast BARONG, Bali- Indonesia. LB Silhouette Works Nissan 35RR GT', 'minigt-164-diecast-barong-bali-indonesia-lb-silhouette-works-nissan-35rr-gt', 'Minigt 1/64 Diecast BARONG, Bali- Indonesia. LB Silhouette Works Nissan 35RR GT', 'Minigt\r\nskala 1:64\r\nMGT00651\r\nBarong, Bali - Indonesia\r\nNissan 35RR GT Ver.1\r\nbody Diecast\r\ndetail good / bagus \r\nkemasan segel / seal', 250000.00, 215000.00, 'MGT', 'instock', 1, 0, '2026-06-07 15:44:00', '2026-06-08 16:14:00', 2000, '1780412955.jpg', '1780412955-1.jpg', 5, 1, '2026-06-02 08:09:20', '2026-06-08 09:18:09'),
(10, 'MiniGT 652 LB-Super Silhouette Nissan Silvia S15 Garuda', 'minigt-652-lb-super-silhouette-nissan-silvia-s15-garuda', 'LB-Super Silhouette Nissan SILVIA (S15)\r\n“GARUDA”', 'LB-Super Silhouette Nissan SILVIA (S15)\r\n“GARUDA” \r\nMINI GT x MIZU Diecast\r\nItem No.MGT00652\r\nScale1:64\r\nMarqueLB Works', 260000.00, 220000.00, 'MGT', 'instock', 1, 0, NULL, NULL, 100, '1780413926.jpg', '1780413926-1.jpg', 5, 1, '2026-06-02 08:25:35', '2026-06-02 08:25:35'),
(11, 'LB-Silhouette WORKS GT NISSAN 35GT-RR Ver.2 “PRINCESS RORO” MINI GT x MIZU Diecast', 'lb-silhouette-works-gt-nissan-35gt-rr-ver2-princess-roro-mini-gt-x-mizu-diecast', 'LB-Silhouette WORKS GT NISSAN 35GT-RR Ver.2 “PRINCESS RORO” MINI GT x MIZU Diecast', 'LB-Silhouette WORKS GT NISSAN 35GT-RR Ver.2 \r\n“PRINCESS RORO”  MINI GT x MIZU Diecast\r\nItem No.MGT00650\r\nScale1:64\r\nMarqueLB Works', 260000.00, 250000.00, 'MGT', 'instock', 1, 0, '2026-06-07 15:34:00', '2026-06-08 17:20:00', 100, '1780415662.jpg', '1780414180-1.jpg,1780414180-2.jpg,1780414180-3.jpg', 5, 1, '2026-06-02 08:29:41', '2026-06-08 17:42:09'),
(12, 'MiniGT Ford Mustang GTD America 250 USA Exclusive', 'minigt-ford-mustang-gtd-america-250-usa-exclusive', 'Ford Mustang GTD \r\nAmerica 250 \r\n[ USA Exclusive ]', 'Ford Mustang GTD \r\nAmerica 250 \r\n[ USA Exclusive ]\r\nItem No.MGT01301\r\nScale1:64\r\nMarqueFord', 290000.00, 250000.00, 'MGT', 'instock', 1, 0, '2026-06-07 14:00:00', '2026-06-08 07:52:00', 2000, '1780487692.jpg', '1780487692-1.jpg', 7, 1, '2026-06-03 04:51:22', '2026-06-08 07:55:02'),
(13, 'MiniGT Nissan LB-Super Silhouette S15 SILVIA GARASIDRIFT x LBWK 2025', 'minigt-nissan-lb-super-silhouette-s15-silvia-garasidrift-x-lbwk-2025', 'Nissan LB-Super Silhouette S15 SILVIA', 'Nissan LB-Super Silhouette S15 SILVIA\r\n\r\nGARASIDRIFT x LBWK 2025\r\nItem No.MGT01022\r\nScale1:64\r\nMarqueNissan', 0.00, 240000.00, 'MGT', 'instock', 1, 0, NULL, NULL, 2000, '1780831332.jpg', '1780831332-1.jpg,1780831332-2.jpg', 5, 1, '2026-06-07 04:22:21', '2026-06-07 04:25:40'),
(15, 'test', 'test', 'awa', 'awawa', 250000.00, 240000.00, 'MGT', 'instock', 1, 0, '2026-06-07 16:53:00', '2026-06-08 17:15:00', 2000, '1780937542.jpg', '1780937542-1.jpg', 6, 1, '2026-06-08 16:52:22', '2026-06-08 17:17:02'),
(16, 'testing', 'testing', 'waaw', 'awwa', 250000.00, 240000.00, 'MGT', 'instock', 1, 0, '2026-06-07 17:30:00', '2026-06-08 17:40:00', 100, '1780939882.jpg', '1780939882-1.jpg', 6, 1, '2026-06-08 17:31:26', '2026-06-08 17:41:58'),
(17, 'tes', 'tes', 'waaw', 'awwa', 250000.00, 240000.00, 'MGT', 'instock', 0, 1, '2026-06-09 17:30:00', '2026-06-11 08:33:00', 100, '1780939916.jpg', '1780939916-1.jpg', 5, 1, '2026-06-08 17:31:57', '2026-06-11 08:29:25');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('OpY9YDT1A0MPlYn9ZeuABATONLJ4Y4mstfdyQqMF', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.123.2 Chrome/148.0.7778.97 Electron/42.2.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMVVLOW02WjQwcXdPd3dwYXIwNUFEWGRRNE1HMzRCWUxZVEZ5aTFLVSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1781175346),
('zJGnOsKBB2DBtafPGd8yWv0IyyXgVtWtUmXiRpaw', 3, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiZklNdkY4TGpwSEp5OEhodGhVS0k0eHFObE1XZEVGRGpHelFNazFZdSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9zaG9wL3RlcyI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjM7czo0OiJhdXRoIjthOjE6e3M6MjE6InBhc3N3b3JkX2NvbmZpcm1lZF9hdCI7aToxNzgxMTY2NTg3O319', 1781166603);

-- --------------------------------------------------------

--
-- Struktur dari tabel `slides`
--

CREATE TABLE `slides` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tagline` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `subtitle` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `slides`
--

INSERT INTO `slides` (`id`, `tagline`, `title`, `subtitle`, `link`, `image`, `status`, `created_at`, `updated_at`) VALUES
(3, 'Koleksi Tanpa Batas', 'MINI GT', 'Koleksi Diecast Premium', 'https://minigt.tsm-models.com/', '1779182811.jpg', 1, '2026-05-19 02:24:47', '2026-05-19 02:29:47'),
(4, 'Kecil Tapi Berkelas', 'Surga Kolektor Diecast 1:64', 'Mini Size, Max Detail', 'https://minigt.tsm-models.com/', '1779183163.jpg', 1, '2026-05-19 02:32:44', '2026-05-19 02:32:44'),
(5, 'Kecil Ukurannya, Besar Detailnya', 'MINIGT', 'Mini Size, Max Detail', 'https://minigt.tsm-models.com/', '1779183293.jpg', 1, '2026-05-19 02:34:54', '2026-05-19 02:34:54');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `mode` enum('cod','card','paypal') NOT NULL,
  `status` enum('pending','approved','declined','refunded') NOT NULL DEFAULT 'pending',
  `details` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `transactions`
--

INSERT INTO `transactions` (`id`, `user_id`, `order_id`, `mode`, `status`, `details`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 'paypal', 'approved', NULL, '2026-05-13 13:16:17', '2026-05-13 13:18:07'),
(2, 3, 2, 'paypal', 'approved', NULL, '2026-05-13 22:15:42', '2026-05-13 22:23:58'),
(3, 3, 3, 'paypal', 'pending', NULL, '2026-05-13 22:18:54', '2026-05-13 22:18:54'),
(4, 3, 4, 'paypal', 'pending', NULL, '2026-05-13 22:21:06', '2026-05-13 22:21:06'),
(5, 3, 5, 'paypal', 'pending', NULL, '2026-05-13 22:39:19', '2026-05-13 22:39:19'),
(6, 3, 6, 'paypal', 'pending', NULL, '2026-05-13 22:45:45', '2026-05-13 22:45:45'),
(7, 3, 7, 'paypal', 'approved', NULL, '2026-05-13 22:50:03', '2026-05-13 22:51:07'),
(8, 3, 8, 'paypal', 'approved', NULL, '2026-05-14 05:21:54', '2026-05-14 05:30:51'),
(9, 3, 9, 'paypal', 'approved', NULL, '2026-05-14 05:24:31', '2026-05-14 05:29:09'),
(10, 3, 10, 'paypal', 'pending', NULL, '2026-05-14 05:45:30', '2026-05-14 05:45:30'),
(11, 3, 11, 'paypal', 'pending', NULL, '2026-05-17 12:22:19', '2026-05-17 12:22:19'),
(12, 3, 12, 'paypal', 'pending', NULL, '2026-05-18 19:22:55', '2026-05-18 19:22:55'),
(13, 3, 13, 'paypal', 'pending', NULL, '2026-05-20 22:44:16', '2026-05-20 22:44:16'),
(14, 3, 14, 'paypal', 'pending', NULL, '2026-05-25 23:46:02', '2026-05-25 23:46:02'),
(15, 3, 15, 'paypal', 'pending', NULL, '2026-05-25 23:47:48', '2026-05-25 23:47:48'),
(16, 3, 16, 'paypal', 'pending', NULL, '2026-05-26 00:03:07', '2026-05-26 00:03:07'),
(17, 3, 17, 'paypal', 'approved', NULL, '2026-06-03 08:05:20', '2026-06-03 10:42:34'),
(18, 4, 18, 'paypal', 'pending', NULL, '2026-06-03 23:34:32', '2026-06-03 23:34:32'),
(19, 4, 19, 'paypal', 'pending', NULL, '2026-06-04 00:41:19', '2026-06-04 00:41:19'),
(20, 3, 20, 'paypal', 'pending', NULL, '2026-06-07 00:35:19', '2026-06-07 00:35:19'),
(21, 3, 21, 'paypal', 'pending', NULL, '2026-06-07 00:39:03', '2026-06-07 00:39:03'),
(22, 3, 22, 'paypal', 'pending', NULL, '2026-06-07 03:53:15', '2026-06-07 03:53:15'),
(23, 3, 23, 'paypal', 'pending', NULL, '2026-06-07 03:54:05', '2026-06-07 03:54:05'),
(24, 3, 24, 'paypal', 'pending', NULL, '2026-06-08 05:38:56', '2026-06-08 05:38:56'),
(25, 3, 25, 'paypal', 'pending', NULL, '2026-06-08 05:44:41', '2026-06-08 05:44:41'),
(26, 3, 27, 'paypal', 'pending', NULL, '2026-06-08 07:52:44', '2026-06-08 07:52:44'),
(27, 3, 28, 'paypal', 'pending', NULL, '2026-06-08 17:15:44', '2026-06-08 17:15:44'),
(28, 4, 29, 'paypal', 'pending', NULL, '2026-06-08 17:20:38', '2026-06-08 17:20:38'),
(29, 4, 30, 'paypal', 'pending', NULL, '2026-06-08 17:40:41', '2026-06-08 17:40:41'),
(30, 3, 31, 'paypal', 'pending', NULL, '2026-06-08 17:43:25', '2026-06-08 17:43:25'),
(31, 3, 32, 'paypal', 'pending', NULL, '2026-06-08 17:53:21', '2026-06-08 17:53:21'),
(32, 3, 33, 'paypal', 'pending', NULL, '2026-06-09 05:28:07', '2026-06-09 05:28:07'),
(33, 3, 34, 'paypal', 'pending', NULL, '2026-06-09 11:46:42', '2026-06-09 11:46:42');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `utype` varchar(255) NOT NULL DEFAULT 'USR' COMMENT 'ADM for Admin and USR for User or Customer',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `mobile`, `email_verified_at`, `password`, `utype`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@gmail.com', '01212311', '2026-05-13 18:48:57', '$2y$12$waA0jHnek.FblgtijvmbzeULLZaIOQAm4xx8a72UCHf2vjpuaroHu', 'ADM', NULL, '2026-05-13 18:48:57', '2026-05-13 12:15:27'),
(2, 'joseph', 'joseph@gmail.com', '1234567890', NULL, '$2y$12$fXMVv/qoB2WIWa7p8wCK3.cs64trMReDscKr0isM3PzsaVcteyeVu', 'USR', NULL, '2026-05-13 12:42:25', '2026-05-13 12:42:25'),
(3, 'Jooe Satrio', 'joe@gmail.com', '081542104956', NULL, '$2y$12$xEuueUx1YmAZBFe/0aLRPOXGzehNR9ckn0EWX93vC041i3ZNmOTrO', 'USR', NULL, '2026-05-13 22:11:47', '2026-05-13 22:11:47'),
(4, 'Joseph', 'joseph67@gmail.com', '0812666141351', NULL, '$2y$12$GhvR5QuVrSqZ7dOheH9Pc.dKTUNdgUOO4U0vhq1.oU9fhrdPSpFLW', 'USR', NULL, '2026-06-03 23:30:16', '2026-06-03 23:30:16');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `addresses_user_id_foreign` (`user_id`);

--
-- Indeks untuk tabel `auction_winners`
--
ALTER TABLE `auction_winners`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auction_winners_product_id_unique` (`product_id`),
  ADD KEY `auction_winners_product_id_index` (`product_id`),
  ADD KEY `auction_winners_user_id_index` (`user_id`),
  ADD KEY `auction_winners_bid_id_index` (`bid_id`);

--
-- Indeks untuk tabel `bids`
--
ALTER TABLE `bids`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bids_product_id_foreign` (`product_id`),
  ADD KEY `bids_user_id_foreign` (`user_id`);

--
-- Indeks untuk tabel `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `brands_slug_unique` (`slug`);

--
-- Indeks untuk tabel `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indeks untuk tabel `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indeks untuk tabel `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`);

--
-- Indeks untuk tabel `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupons_code_unique` (`code`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indeks untuk tabel `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `month_names`
--
ALTER TABLE `month_names`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`);

--
-- Indeks untuk tabel `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_product_id_foreign` (`product_id`),
  ADD KEY `order_items_order_id_foreign` (`order_id`);

--
-- Indeks untuk tabel `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indeks untuk tabel `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`),
  ADD KEY `products_category_id_foreign` (`category_id`),
  ADD KEY `products_brand_id_foreign` (`brand_id`);

--
-- Indeks untuk tabel `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indeks untuk tabel `slides`
--
ALTER TABLE `slides`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_user_id_foreign` (`user_id`),
  ADD KEY `transactions_order_id_foreign` (`order_id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_mobile_unique` (`mobile`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `auction_winners`
--
ALTER TABLE `auction_winners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `bids`
--
ALTER TABLE `bids`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT untuk tabel `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT untuk tabel `month_names`
--
ALTER TABLE `month_names`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT untuk tabel `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT untuk tabel `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT untuk tabel `slides`
--
ALTER TABLE `slides`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `addresses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `bids`
--
ALTER TABLE `bids`
  ADD CONSTRAINT `bids_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bids_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
