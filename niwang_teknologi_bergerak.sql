-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 13, 2020 at 10:37 AM
-- Server version: 5.7.25
-- PHP Version: 7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `udinus_teknologi_bergerak`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity`
--

CREATE TABLE `activity` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `customers_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nominal` int(11) NOT NULL,
  `sisa_saldo` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activity`
--

INSERT INTO `activity` (`id`, `created_at`, `updated_at`, `customers_id`, `name`, `type`, `nominal`, `sisa_saldo`) VALUES
(1, '2020-01-13 07:45:08', '2020-01-13 07:45:08', 1, 'Wahana Halilintar', 'Scan', 25000, 275000),
(2, '2020-01-13 08:14:56', '2020-01-13 08:14:56', 1, 'Top Up', 'Topup', 25000, 300000);

-- --------------------------------------------------------

--
-- Table structure for table `api_logs`
--

CREATE TABLE `api_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `method` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `response` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `duration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `models` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cms_apicustom`
--

CREATE TABLE `cms_apicustom` (
  `id` int(10) UNSIGNED NOT NULL,
  `permalink` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tabel` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `aksi` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kolom` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `orderby` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_query_1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sql_where` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keterangan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameter` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `method_type` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` longtext COLLATE utf8mb4_unicode_ci,
  `responses` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cms_apicustom`
--

INSERT INTO `cms_apicustom` (`id`, `permalink`, `tabel`, `aksi`, `kolom`, `orderby`, `sub_query_1`, `sql_where`, `nama`, `keterangan`, `parameter`, `created_at`, `updated_at`, `method_type`, `parameters`, `responses`) VALUES
(1, 'register', 'customer', 'save_add', NULL, NULL, NULL, NULL, 'Register', NULL, NULL, NULL, NULL, 'post', 'a:0:{}', 'a:0:{}'),
(2, 'login', 'customer', 'detail', NULL, NULL, NULL, NULL, 'Login', NULL, NULL, NULL, NULL, 'post', 'a:0:{}', 'a:0:{}'),
(3, 'forgot_password', 'customer', 'save_edit', NULL, NULL, NULL, NULL, 'Forgot Password', NULL, NULL, NULL, NULL, 'post', 'a:0:{}', 'a:0:{}'),
(4, 'home', 'activity', 'list', NULL, NULL, NULL, NULL, 'Home', NULL, NULL, NULL, NULL, 'get', 'a:0:{}', 'a:0:{}'),
(5, 'activity', 'activity', 'list', NULL, NULL, NULL, NULL, 'Activity', NULL, NULL, NULL, NULL, 'get', 'a:0:{}', 'a:0:{}'),
(6, 'wahana', 'wahana', 'list', NULL, NULL, NULL, NULL, 'Wahana', NULL, NULL, NULL, NULL, 'get', 'a:0:{}', 'a:0:{}'),
(7, 'profile', 'customer', 'detail', NULL, NULL, NULL, NULL, 'Profile', NULL, NULL, NULL, NULL, 'get', 'a:0:{}', 'a:0:{}'),
(8, 'profile_update', 'customer', 'save_edit', NULL, NULL, NULL, NULL, 'Profile Update', NULL, NULL, NULL, NULL, 'post', 'a:0:{}', 'a:0:{}'),
(9, 'change_password', 'customer', 'save_edit', NULL, NULL, NULL, NULL, 'Change Password', NULL, NULL, NULL, NULL, 'post', 'a:0:{}', 'a:0:{}'),
(10, 'change_pin', 'customer', 'save_edit', NULL, NULL, NULL, NULL, 'Change Pin', NULL, NULL, NULL, NULL, 'post', 'a:0:{}', 'a:0:{}'),
(11, 'about', 'cms_settings', 'detail', NULL, NULL, NULL, NULL, 'About', NULL, NULL, NULL, NULL, 'get', 'a:0:{}', 'a:0:{}'),
(12, 'top_up_info', 'cms_settings', 'detail', NULL, NULL, NULL, NULL, 'Top Up Info', NULL, NULL, NULL, NULL, 'get', 'a:0:{}', 'a:0:{}'),
(13, 'login_social_media', 'customer', 'detail', NULL, NULL, NULL, NULL, 'Login Social Media', NULL, NULL, NULL, NULL, 'post', 'a:0:{}', 'a:0:{}'),
(16, 'connect_social_media', 'customer', 'save_edit', NULL, NULL, NULL, NULL, 'Connect Social Media', NULL, NULL, NULL, NULL, 'post', 'a:0:{}', 'a:0:{}'),
(17, 'disconnect_social_media', 'customer', 'save_edit', NULL, NULL, NULL, NULL, 'Disconnect Social Media', NULL, NULL, NULL, NULL, 'post', 'a:0:{}', 'a:0:{}'),
(18, 'scan', 'activity', 'save_add', NULL, NULL, NULL, NULL, 'Scan', NULL, NULL, NULL, NULL, 'post', 'a:0:{}', 'a:0:{}'),
(19, 'wahana_qrcode', 'wahana', 'detail', NULL, NULL, NULL, NULL, 'Wahana Qrcode', NULL, NULL, NULL, NULL, 'get', 'a:0:{}', 'a:0:{}');

-- --------------------------------------------------------

--
-- Table structure for table `cms_apikey`
--

CREATE TABLE `cms_apikey` (
  `id` int(10) UNSIGNED NOT NULL,
  `screetkey` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hit` int(11) DEFAULT NULL,
  `status` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cms_dashboard`
--

CREATE TABLE `cms_dashboard` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_cms_privileges` int(11) DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cms_email_queues`
--

CREATE TABLE `cms_email_queues` (
  `id` int(10) UNSIGNED NOT NULL,
  `send_at` datetime DEFAULT NULL,
  `email_recipient` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_from_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_from_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_cc_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_content` text COLLATE utf8mb4_unicode_ci,
  `email_attachments` text COLLATE utf8mb4_unicode_ci,
  `is_sent` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cms_email_templates`
--

CREATE TABLE `cms_email_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cc_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cms_email_templates`
--

INSERT INTO `cms_email_templates` (`id`, `name`, `slug`, `subject`, `content`, `description`, `from_name`, `from_email`, `cc_email`, `created_at`, `updated_at`) VALUES
(1, 'Email Template Forgot Password Backend', 'forgot_password_backend', NULL, '<p>Hi,</p><p>Someone requested forgot password, here is your new password : </p><p>[password]</p><p><br></p><p>--</p><p>Regards,</p><p>Admin</p>', '[password]', 'System', 'system@crudbooster.com', NULL, '2019-11-28 04:13:09', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cms_logs`
--

CREATE TABLE `cms_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `ipaddress` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `useragent` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci,
  `id_cms_users` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cms_logs`
--

INSERT INTO `cms_logs` (`id`, `ipaddress`, `useragent`, `url`, `description`, `details`, `id_cms_users`, `created_at`, `updated_at`) VALUES
(1, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2019-11-30 02:45:37', NULL),
(2, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 'http://127.0.0.1:8000/admin/logout', 'admin@crudbooster.com logout', '', 1, '2019-11-30 02:49:05', NULL),
(3, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2019-11-30 02:49:10', NULL),
(4, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 'http://127.0.0.1:8000/admin/users/edit-save/1', 'Update data Admin at Users Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>name</td><td>Super Admin</td><td>Admin</td></tr><tr><td>photo</td><td></td><td>uploads/1/2019-11/icon.png</td></tr><tr><td>password</td><td>$2y$10$0mt6CxPUN2xoFrkPzKDxju78lCav547nTFQ7zYkmyzYQSDEIzBpB2</td><td></td></tr><tr><td>id_cms_privileges</td><td>1</td><td></td></tr><tr><td>status</td><td>Active</td><td></td></tr></tbody></table>', 1, '2019-11-30 02:53:41', NULL),
(5, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 'http://127.0.0.1:8000/admin/users/delete-image', 'Delete the image of Admin at Users Management', '', 1, '2019-11-30 02:56:21', NULL),
(6, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 'http://127.0.0.1:8000/admin/logout', 'admin@crudbooster.com logout', '', 1, '2019-11-30 02:56:25', NULL),
(7, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2019-11-30 02:56:28', NULL),
(8, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 'http://127.0.0.1:8000/admin/logout', 'admin@crudbooster.com logout', '', 1, '2019-11-30 02:58:09', NULL),
(9, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2019-11-30 02:58:11', NULL),
(10, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 'http://127.0.0.1:8000/admin/menu_management/add-save', 'Add New Data Report at Menu Management', '', 1, '2019-11-30 03:02:07', NULL),
(11, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 'http://127.0.0.1:8000/admin/menu_management/edit-save/4', 'Update data Report at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>sorting</td><td>4</td><td></td></tr></tbody></table>', 1, '2019-11-30 03:02:21', NULL),
(12, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 'http://127.0.0.1:8000/admin/module_generator/delete/16', 'Delete data Report at Module Generator', '', 1, '2019-11-30 03:03:51', NULL),
(13, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 'http://127.0.0.1:8000/admin/menu_management/edit-save/8', 'Update data Report Activity at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr><tr><td>icon</td><td>fa fa-qrcode</td><td>fa fa-circle-o</td></tr><tr><td>sorting</td><td>7</td><td></td></tr></tbody></table>', 1, '2019-11-30 03:05:27', NULL),
(14, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 'http://127.0.0.1:8000/admin/menu_management/edit-save/7', 'Update data Report Scan at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr><tr><td>icon</td><td>fa fa-file-excel-o</td><td>fa fa-circle-o</td></tr><tr><td>sorting</td><td>6</td><td></td></tr></tbody></table>', 1, '2019-11-30 03:05:35', NULL),
(15, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 'http://127.0.0.1:8000/admin/menu_management/edit-save/5', 'Update data Report Top Up at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr><tr><td>icon</td><td>fa fa-file-excel-o</td><td>fa fa-circle-o</td></tr><tr><td>sorting</td><td>5</td><td></td></tr></tbody></table>', 1, '2019-11-30 03:05:44', NULL),
(16, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 'http://127.0.0.1:8000/admin/users/add-save', 'Add New Data Admin at Users Management', '', 1, '2019-11-30 03:09:02', NULL),
(17, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 'http://127.0.0.1:8000/admin/menu_management/edit-save/9', 'Update data Index at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr></tbody></table>', 1, '2019-11-30 03:20:09', NULL),
(18, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 'http://127.0.0.1:8000/admin/menu_management/edit-save/1', 'Update data Customer at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr><tr><td>sorting</td><td>2</td><td></td></tr></tbody></table>', 1, '2019-11-30 03:20:35', NULL),
(19, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 'http://127.0.0.1:8000/admin/menu_management/edit-save/9', 'Update data Index at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>parent_id</td><td>0</td><td></td></tr><tr><td>is_dashboard</td><td>0</td><td>1</td></tr></tbody></table>', 1, '2019-11-30 03:20:42', NULL),
(20, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 'http://127.0.0.1:8000/admin/menu_management/edit-save/3', 'Update data Top Up at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr><tr><td>sorting</td><td>3</td><td></td></tr></tbody></table>', 1, '2019-11-30 03:20:55', NULL),
(21, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 'http://127.0.0.1:8000/admin/menu_management/edit-save/2', 'Update data Wahana at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr><tr><td>sorting</td><td>4</td><td></td></tr></tbody></table>', 1, '2019-11-30 03:21:12', NULL),
(22, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 'http://127.0.0.1:8000/admin/menu_management/edit-save/4', 'Update data Report at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>sorting</td><td>5</td><td></td></tr></tbody></table>', 1, '2019-11-30 03:21:44', NULL),
(23, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 'http://127.0.0.1:8000/admin/menu_management/edit-save/5', 'Update data Report Top Up at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>parent_id</td><td>4</td><td></td></tr></tbody></table>', 1, '2019-11-30 03:21:56', NULL),
(24, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 'http://127.0.0.1:8000/admin/menu_management/edit-save/7', 'Update data Report Scan at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>parent_id</td><td>4</td><td></td></tr><tr><td>sorting</td><td>2</td><td></td></tr></tbody></table>', 1, '2019-11-30 03:22:10', NULL),
(25, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 'http://127.0.0.1:8000/admin/menu_management/edit-save/8', 'Update data Report Activity at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>parent_id</td><td>4</td><td></td></tr><tr><td>sorting</td><td>3</td><td></td></tr></tbody></table>', 1, '2019-11-30 03:22:20', NULL),
(26, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 'http://127.0.0.1:8000/admin/menu_management/edit-save/8', 'Update data Report Activity at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>parent_id</td><td>4</td><td></td></tr><tr><td>sorting</td><td>3</td><td></td></tr></tbody></table>', 1, '2019-11-30 03:22:21', NULL),
(27, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 'http://127.0.0.1:8000/admin/menu_management/edit-save/7', 'Update data Report Scan at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>parent_id</td><td>4</td><td></td></tr><tr><td>sorting</td><td>2</td><td></td></tr></tbody></table>', 1, '2019-11-30 03:22:43', NULL),
(28, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 'http://127.0.0.1:8000/admin/menu_management/edit-save/8', 'Update data Report Activity at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>parent_id</td><td>4</td><td></td></tr><tr><td>sorting</td><td>3</td><td></td></tr></tbody></table>', 1, '2019-11-30 03:22:54', NULL),
(29, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 'http://127.0.0.1:8000/admin/menu_management/add-save', 'Add New Data Setting at Menu Management', '', 1, '2019-11-30 03:34:59', NULL),
(30, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 'http://127.0.0.1:8000/admin/menu_management/edit-save/10', 'Update data Setting at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>sorting</td><td></td><td></td></tr></tbody></table>', 1, '2019-11-30 03:35:10', NULL),
(31, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 'http://127.0.0.1:8000/admin/menu_management/edit-save/11', 'Update data About at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr><tr><td>icon</td><td>fa fa-gear</td><td>fa fa-circle-o</td></tr><tr><td>sorting</td><td>7</td><td></td></tr></tbody></table>', 1, '2019-11-30 03:37:46', NULL),
(32, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 'http://localhost:8000/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2019-12-03 04:29:44', NULL),
(33, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 'http://localhost:8000/admin/users/add-save', 'Add New Data Anisha Tiarasani at Users Management', '', 1, '2019-12-03 04:31:26', NULL),
(34, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 'http://localhost:8000/admin/users/add-save', 'Add New Data Solehudin at Users Management', '', 1, '2019-12-03 04:32:32', NULL),
(35, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 'http://localhost:8000/admin/users/add-save', 'Add New Data Arif Niwang Djati at Users Management', '', 1, '2019-12-03 04:32:45', NULL),
(36, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 'http://localhost:8000/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2019-12-04 03:24:31', NULL),
(37, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 'http://localhost:8000/admin/customer/edit/1', 'Mencoba mengubah data Arif Niwang Djati pada Customer', '', 1, '2019-12-04 07:19:55', NULL),
(38, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 'http://localhost:8000/admin/customer/edit/1', 'Mencoba mengubah data Arif Niwang Djati pada Customer', '', 1, '2019-12-04 07:19:57', NULL),
(39, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'admin@crudbooster.com login dengan IP Address 127.0.0.1', '', 1, '2019-12-04 07:31:12', NULL),
(40, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'admin@crudbooster.com login dengan IP Address 127.0.0.1', '', 1, '2019-12-04 07:31:15', NULL),
(41, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 'http://localhost:8000/admin/wahana/add-save', 'Tambah data baru Halilintar pada Wahana', '', 1, '2019-12-04 07:35:05', NULL),
(42, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 'http://localhost:8000/admin/wahana/add-save', 'Tambah data baru Halilintar pada Wahana', '', 1, '2019-12-04 07:41:42', NULL),
(43, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 'http://localhost:8000/admin/module_generator/delete/20', 'Menghapus data About pada Module Generator', '', 1, '2019-12-04 07:44:36', NULL),
(44, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 'http://localhost:8000/admin/login', 'admin@crudbooster.com login dengan IP Address 127.0.0.1', '', 1, '2019-12-14 08:25:36', NULL),
(45, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 'http://localhost:8000/admin/merchant/delete/5', 'Menghapus data Arif Niwang Djati pada Merchant', '', 1, '2019-12-14 08:32:07', NULL),
(46, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 'http://localhost:8000/admin/merchant/edit-save/5', 'Memperbaharui data Arif Niwang Djati pada Merchant', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>password</td><td>$2y$10$HmeTVVI0iqKHCrr5zC7gU.SxtK/aQgSBJ7SJJ6oyWWv8G6k1asdeG</td><td></td></tr><tr><td>id_cms_privileges</td><td>3</td><td></td></tr></tbody></table>', 1, '2019-12-14 08:37:16', NULL),
(47, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 'http://localhost:8000/admin/logout', 'admin@crudbooster.com keluar', '', 1, '2019-12-14 08:37:23', NULL),
(48, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 'http://localhost:8000/admin/login', 'niwang@email.com login dengan IP Address 127.0.0.1', '', 5, '2019-12-14 08:37:28', NULL),
(49, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 'http://localhost:8000/admin/index', 'Mencoba melihat data :name pada Index', '', 5, '2019-12-14 08:37:29', NULL),
(50, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 'http://localhost:8000/admin/index', 'Mencoba melihat data :name pada Index', '', 5, '2019-12-14 08:37:29', NULL),
(51, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 'http://localhost:8000/admin/index', 'Mencoba melihat data :name pada Index', '', 5, '2019-12-14 08:37:30', NULL),
(52, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 'http://localhost:8000/admin/index', 'Mencoba melihat data :name pada Index', '', 5, '2019-12-14 08:37:30', NULL),
(53, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 'http://localhost:8000/admin/index', 'Mencoba melihat data :name pada Index', '', 5, '2019-12-14 08:37:31', NULL),
(54, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 'http://localhost:8000/admin/index', 'Mencoba melihat data :name pada Index', '', 5, '2019-12-14 08:37:32', NULL),
(55, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 'http://localhost:8000/admin/index', 'Mencoba melihat data :name pada Index', '', 5, '2019-12-14 08:37:32', NULL),
(56, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 'http://localhost:8000/admin/index', 'Mencoba melihat data :name pada Index', '', 5, '2019-12-14 08:37:33', NULL),
(57, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 'http://localhost:8000/admin/index', 'Mencoba melihat data :name pada Index', '', 5, '2019-12-14 08:37:33', NULL),
(58, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 'http://localhost:8000/admin/index', 'Mencoba melihat data :name pada Index', '', 5, '2019-12-14 08:37:43', NULL),
(59, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 'http://localhost:8000/admin/index', 'Mencoba melihat data :name pada Index', '', 5, '2019-12-14 08:37:44', NULL),
(60, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 'http://localhost:8000/admin/logout', 'niwang@email.com keluar', '', 5, '2019-12-14 08:37:51', NULL),
(61, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 'http://localhost:8000/admin/login', 'admin@crudbooster.com login dengan IP Address 127.0.0.1', '', 1, '2019-12-14 08:37:53', NULL),
(62, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'admin@crudbooster.com login dengan IP Address 127.0.0.1', '', 1, '2019-12-15 05:02:37', NULL),
(63, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'admin@crudbooster.com login dengan IP Address 127.0.0.1', '', 1, '2019-12-17 19:53:56', NULL),
(64, '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 'http://localhost/tiket_wahana_web/public/admin/login', 'admin@crudbooster.com login dengan IP Address ::1', '', 1, '2020-01-13 06:27:38', NULL),
(65, '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 'http://localhost/tiket_wahana_web/public/admin/menu_management/add-save', 'Tambah data baru Transaksi pada Menu Management', '', 1, '2020-01-13 07:47:02', NULL),
(66, '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 'http://localhost/tiket_wahana_web/public/admin/menu_management/edit-save/13', 'Memperbaharui data Transaksi pada Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>sorting</td><td></td><td></td></tr></tbody></table>', 1, '2020-01-13 07:47:11', NULL),
(67, '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 'http://localhost/tiket_wahana_web/public/admin/menu_management/delete/13', 'Menghapus data Transaksi pada Menu Management', '', 1, '2020-01-13 07:47:32', NULL),
(68, '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 'http://localhost/tiket_wahana_web/public/admin/topup/add-save', 'Tambah data baru  pada Top Up', '', 1, '2020-01-13 08:14:56', NULL),
(69, '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 'http://localhost/tiket_wahana_web/public/admin/menu_management/edit-save/12', 'Memperbaharui data Merchant pada Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr><tr><td>sorting</td><td>4</td><td></td></tr></tbody></table>', 1, '2020-01-13 08:24:13', NULL),
(70, '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 'http://localhost/tiket_wahana_web/public/admin/logout', 'admin@crudbooster.com keluar', '', 1, '2020-01-13 08:25:14', NULL),
(71, '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 'http://localhost/tiket_wahana_web/public/admin/login', 'niwang@email.com login dengan IP Address ::1', '', 5, '2020-01-13 08:25:21', NULL),
(72, '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 'http://localhost/tiket_wahana_web/public/admin/logout', 'niwang@email.com keluar', '', 5, '2020-01-13 08:30:32', NULL),
(73, '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 'http://localhost/tiket_wahana_web/public/admin/login', 'admin@email.com login dengan IP Address ::1', '', 2, '2020-01-13 08:30:37', NULL),
(74, '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 'http://localhost/tiket_wahana_web/public/admin/logout', 'admin@email.com keluar', '', 2, '2020-01-13 09:49:36', NULL),
(75, '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 'http://localhost/tiket_wahana_web/public/admin/login', 'admin@crudbooster.com login dengan IP Address ::1', '', 1, '2020-01-13 09:49:41', NULL),
(76, '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 'http://localhost/tiket_wahana_web/public/admin/logout', 'admin@crudbooster.com keluar', '', 1, '2020-01-13 10:08:58', NULL),
(77, '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 'http://localhost/tiket_wahana_web/public/admin/login', 'admin@crudbooster.com login dengan IP Address ::1', '', 1, '2020-01-13 10:10:04', NULL),
(78, '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 'http://localhost/tiket_wahana_web/public/admin/logout', 'admin@crudbooster.com keluar', '', 1, '2020-01-13 10:16:13', NULL),
(79, '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 'http://localhost/tiket_wahana_web/public/admin/login', 'admin@email.com login dengan IP Address ::1', '', 2, '2020-01-13 10:16:18', NULL),
(80, '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 'http://localhost/tiket_wahana_web/public/admin/logout', 'admin@email.com keluar', '', 2, '2020-01-13 10:16:26', NULL),
(81, '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 'http://localhost/tiket_wahana_web/public/admin/login', 'niwang@email.com login dengan IP Address ::1', '', 5, '2020-01-13 10:17:07', NULL),
(82, '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 'http://localhost/tiket_wahana_web/public/admin/logout', 'niwang@email.com keluar', '', 5, '2020-01-13 10:17:48', NULL),
(83, '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 'http://localhost/tiket_wahana_web/public/admin/login', 'niwang@email.com login dengan IP Address ::1', '', 5, '2020-01-13 10:18:11', NULL),
(84, '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 'http://localhost/tiket_wahana_web/public/admin/logout', 'niwang@email.com keluar', '', 5, '2020-01-13 10:19:01', NULL),
(85, '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 'http://localhost/tiket_wahana_web/public/admin/login', 'admin@email.com login dengan IP Address ::1', '', 2, '2020-01-13 10:19:06', NULL),
(86, '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 'http://localhost/tiket_wahana_web/public/admin/wahana/add-save', 'Tambah data baru Bianglala pada Wahana', '', 2, '2020-01-13 10:36:42', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cms_menus`
--

CREATE TABLE `cms_menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'url',
  `path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_dashboard` tinyint(1) NOT NULL DEFAULT '0',
  `id_cms_privileges` int(11) DEFAULT NULL,
  `sorting` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cms_menus`
--

INSERT INTO `cms_menus` (`id`, `name`, `type`, `path`, `color`, `icon`, `parent_id`, `is_active`, `is_dashboard`, `id_cms_privileges`, `sorting`, `created_at`, `updated_at`) VALUES
(1, 'Customer', 'Route', 'AdminCustomerControllerGetIndex', 'normal', 'fa fa-users', 0, 1, 0, 1, 5, '2019-11-30 02:58:26', '2019-11-30 03:20:35'),
(2, 'Wahana', 'Route', 'AdminWahanaControllerGetIndex', 'normal', 'fa fa-bank', 0, 1, 0, 1, 6, '2019-11-30 03:00:51', '2019-11-30 03:21:12'),
(3, 'Top Up', 'Route', 'AdminTopupControllerGetIndex', 'normal', 'fa fa-qrcode', 0, 1, 0, 1, 2, '2019-11-30 03:01:38', '2019-11-30 03:20:55'),
(4, 'Report', 'URL', 'javascript:void(0)', 'normal', 'fa fa-file-excel-o', 0, 1, 0, 1, 7, '2019-11-30 03:02:07', '2019-11-30 03:21:44'),
(5, 'Report Top Up', 'Route', 'AdminReportTopupControllerGetIndex', 'normal', 'fa fa-circle-o', 4, 1, 0, 1, 1, '2019-11-30 03:02:57', '2019-11-30 03:21:56'),
(7, 'Report Scan', 'Route', 'AdminReportScanControllerGetIndex', 'normal', 'fa fa-circle-o', 4, 1, 0, 1, 2, '2019-11-30 03:04:20', '2019-11-30 03:22:43'),
(8, 'Report Activity', 'Route', 'AdminReportActivityControllerGetIndex', 'normal', 'fa fa-circle-o', 4, 1, 0, 1, 3, '2019-11-30 03:04:56', '2019-11-30 03:22:54'),
(9, 'Index', 'Route', 'AdminIndexControllerGetIndex', 'normal', 'fa fa-dashboard', 0, 1, 1, 1, 1, '2019-11-30 03:19:57', '2019-11-30 03:20:42'),
(10, 'Setting', 'URL', 'javascript:void(0)', 'normal', 'fa fa-gears', 0, 0, 0, 1, 1, '2019-11-30 03:34:59', '2019-11-30 03:35:10'),
(12, 'Merchant', 'Route', 'AdminMerchantControllerGetIndex', 'normal', 'fa fa-user-md', 0, 1, 0, 1, 4, '2019-12-03 04:33:26', '2020-01-13 08:24:13');

-- --------------------------------------------------------

--
-- Table structure for table `cms_menus_privileges`
--

CREATE TABLE `cms_menus_privileges` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_cms_menus` int(11) DEFAULT NULL,
  `id_cms_privileges` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cms_menus_privileges`
--

INSERT INTO `cms_menus_privileges` (`id`, `id_cms_menus`, `id_cms_privileges`) VALUES
(7, 6, 1),
(17, 1, 2),
(18, 1, 1),
(19, 9, 2),
(20, 9, 3),
(21, 9, 1),
(22, 3, 3),
(23, 3, 1),
(24, 2, 2),
(25, 2, 1),
(26, 4, 2),
(27, 4, 3),
(28, 4, 1),
(29, 5, 2),
(30, 5, 3),
(31, 5, 1),
(41, 7, 2),
(42, 7, 1),
(43, 8, 2),
(44, 8, 1),
(47, 10, 2),
(48, 10, 1),
(50, 11, 1),
(52, NULL, 2),
(53, NULL, 1),
(54, 13, 2),
(55, 13, 1),
(56, 12, 2),
(57, 12, 1);

-- --------------------------------------------------------

--
-- Table structure for table `cms_moduls`
--

CREATE TABLE `cms_moduls` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_protected` tinyint(1) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cms_moduls`
--

INSERT INTO `cms_moduls` (`id`, `name`, `icon`, `path`, `table_name`, `controller`, `is_protected`, `is_active`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Notifications', 'fa fa-cog', 'notifications', 'cms_notifications', 'NotificationsController', 1, 1, '2019-11-28 04:13:09', NULL, NULL),
(2, 'Privileges', 'fa fa-cog', 'privileges', 'cms_privileges', 'PrivilegesController', 1, 1, '2019-11-28 04:13:09', NULL, NULL),
(3, 'Privileges Roles', 'fa fa-cog', 'privileges_roles', 'cms_privileges_roles', 'PrivilegesRolesController', 1, 1, '2019-11-28 04:13:09', NULL, NULL),
(4, 'Users Management', 'fa fa-users', 'users', 'cms_users', 'AdminCmsUsersController', 0, 1, '2019-11-28 04:13:09', NULL, NULL),
(5, 'Settings', 'fa fa-cog', 'settings', 'cms_settings', 'SettingsController', 1, 1, '2019-11-28 04:13:09', NULL, NULL),
(6, 'Module Generator', 'fa fa-database', 'module_generator', 'cms_moduls', 'ModulsController', 1, 1, '2019-11-28 04:13:09', NULL, NULL),
(7, 'Menu Management', 'fa fa-bars', 'menu_management', 'cms_menus', 'MenusController', 1, 1, '2019-11-28 04:13:09', NULL, NULL),
(8, 'Email Templates', 'fa fa-envelope-o', 'email_templates', 'cms_email_templates', 'EmailTemplatesController', 1, 1, '2019-11-28 04:13:09', NULL, NULL),
(9, 'Statistic Builder', 'fa fa-dashboard', 'statistic_builder', 'cms_statistics', 'StatisticBuilderController', 1, 1, '2019-11-28 04:13:09', NULL, NULL),
(10, 'API Generator', 'fa fa-cloud-download', 'api_generator', '', 'ApiCustomController', 1, 1, '2019-11-28 04:13:09', NULL, NULL),
(11, 'Log User Access', 'fa fa-flag-o', 'logs', 'cms_logs', 'LogsController', 1, 1, '2019-11-28 04:13:09', NULL, NULL),
(12, 'Customer', 'fa fa-users', 'customer', 'customer', 'AdminCustomerController', 0, 0, '2019-11-30 02:58:26', NULL, NULL),
(13, 'Wahana', 'fa fa-bank', 'wahana', 'wahana', 'AdminWahanaController', 0, 0, '2019-11-30 03:00:51', NULL, NULL),
(14, 'Top Up', 'fa fa-qrcode', 'topup', 'topup', 'AdminTopupController', 0, 0, '2019-11-30 03:01:38', NULL, NULL),
(15, 'Report Top Up', 'fa fa-file-excel-o', 'report-topup', 'topup', 'AdminReportTopupController', 0, 0, '2019-11-30 03:02:56', NULL, NULL),
(16, 'Report', 'fa fa-file-excel-o', 'report-scan', 'scan', 'AdminReportScanController', 0, 0, '2019-11-30 03:03:39', NULL, '2019-11-30 03:03:51'),
(17, 'Report Scan', 'fa fa-file-excel-o', 'report-scan', 'scan', 'AdminReportScanController', 0, 0, '2019-11-30 03:04:20', NULL, NULL),
(18, 'Report Activity', 'fa fa-file-excel-o', 'report-activity', 'activity', 'AdminReportActivityController', 0, 0, '2019-11-30 03:04:56', NULL, NULL),
(19, 'Index', 'fa fa-dashboard', 'index', 'cms_users', 'AdminIndexController', 0, 0, '2019-11-30 03:19:57', NULL, NULL),
(20, 'About', 'fa fa-gear', 'about', 'cms_users', 'AdminAboutController', 0, 0, '2019-11-30 03:35:46', NULL, '2019-12-04 07:44:36'),
(21, 'Merchant', 'fa fa-user-md', 'merchant', 'cms_users', 'AdminMerchantController', 0, 0, '2019-12-03 04:33:26', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cms_notifications`
--

CREATE TABLE `cms_notifications` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_cms_users` int(11) DEFAULT NULL,
  `content` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cms_privileges`
--

CREATE TABLE `cms_privileges` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_superadmin` tinyint(1) DEFAULT NULL,
  `theme_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cms_privileges`
--

INSERT INTO `cms_privileges` (`id`, `name`, `is_superadmin`, `theme_color`, `created_at`, `updated_at`) VALUES
(1, 'Super Administrator', 1, 'skin-blue-light', '2019-11-28 04:13:09', NULL),
(2, 'Admin', 0, 'skin-blue-light', NULL, NULL),
(3, 'Merchant', 0, 'skin-green-light', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cms_privileges_roles`
--

CREATE TABLE `cms_privileges_roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `is_visible` tinyint(1) DEFAULT NULL,
  `is_create` tinyint(1) DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT NULL,
  `is_edit` tinyint(1) DEFAULT NULL,
  `is_delete` tinyint(1) DEFAULT NULL,
  `id_cms_privileges` int(11) DEFAULT NULL,
  `id_cms_moduls` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cms_privileges_roles`
--

INSERT INTO `cms_privileges_roles` (`id`, `is_visible`, `is_create`, `is_read`, `is_edit`, `is_delete`, `id_cms_privileges`, `id_cms_moduls`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 1, 1, 1, 4, NULL, NULL),
(2, 1, 1, 1, 1, 1, 1, 12, NULL, NULL),
(3, 1, 1, 1, 1, 1, 1, 13, NULL, NULL),
(4, 1, 1, 1, 1, 1, 1, 14, NULL, NULL),
(5, 1, 1, 1, 1, 1, 1, 15, NULL, NULL),
(6, 1, 1, 1, 1, 1, 1, 16, NULL, NULL),
(7, 1, 1, 1, 1, 1, 1, 17, NULL, NULL),
(8, 1, 1, 1, 1, 1, 1, 18, NULL, NULL),
(19, 1, 1, 1, 1, 1, 1, 19, NULL, NULL),
(20, 1, 1, 1, 1, 1, 1, 20, NULL, NULL),
(21, 1, 1, 1, 1, 1, 1, 21, NULL, NULL),
(22, 1, 1, 1, 1, 1, 3, 19, NULL, NULL),
(23, 1, 1, 1, 1, 1, 3, 15, NULL, NULL),
(24, 1, 1, 1, 1, 1, 3, 14, NULL, NULL),
(25, 1, 0, 1, 1, 0, 3, 4, NULL, NULL),
(26, 1, 1, 1, 1, 1, 2, 12, NULL, NULL),
(27, 1, 1, 1, 1, 1, 2, 19, NULL, NULL),
(28, 1, 1, 1, 1, 1, 2, 21, NULL, NULL),
(29, 1, 1, 1, 1, 1, 2, 18, NULL, NULL),
(30, 1, 1, 1, 1, 1, 2, 17, NULL, NULL),
(31, 1, 1, 1, 1, 1, 2, 15, NULL, NULL),
(32, 1, 1, 1, 1, 1, 2, 4, NULL, NULL),
(33, 1, 1, 1, 1, 1, 2, 13, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cms_settings`
--

CREATE TABLE `cms_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `content_input_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dataenum` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `helper` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `group_setting` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cms_settings`
--

INSERT INTO `cms_settings` (`id`, `name`, `content`, `content_input_type`, `dataenum`, `helper`, `created_at`, `updated_at`, `group_setting`, `label`) VALUES
(1, 'login_background_color', NULL, 'text', NULL, 'Input hexacode', '2019-11-28 04:13:09', NULL, 'Login Register Style', 'Login Background Color'),
(2, 'login_font_color', NULL, 'text', NULL, 'Input hexacode', '2019-11-28 04:13:09', NULL, 'Login Register Style', 'Login Font Color'),
(3, 'login_background_image', 'uploads/2019-11/a747baa2dd35d1611e6f2b1ac1fcf0bc.png', 'upload_image', NULL, NULL, '2019-11-28 04:13:09', NULL, 'Login Register Style', 'Login Background Image'),
(4, 'email_sender', 'support@crudbooster.com', 'text', NULL, NULL, '2019-11-28 04:13:09', NULL, 'Email Setting', 'Email Sender'),
(5, 'smtp_driver', 'mail', 'select', 'smtp,mail,sendmail', NULL, '2019-11-28 04:13:09', NULL, 'Email Setting', 'Mail Driver'),
(6, 'smtp_host', '', 'text', NULL, NULL, '2019-11-28 04:13:09', NULL, 'Email Setting', 'SMTP Host'),
(7, 'smtp_port', '25', 'text', NULL, 'default 25', '2019-11-28 04:13:09', NULL, 'Email Setting', 'SMTP Port'),
(8, 'smtp_username', '', 'text', NULL, NULL, '2019-11-28 04:13:09', NULL, 'Email Setting', 'SMTP Username'),
(9, 'smtp_password', '', 'text', NULL, NULL, '2019-11-28 04:13:09', NULL, 'Email Setting', 'SMTP Password'),
(10, 'appname', 'TiketWahana', 'text', NULL, NULL, '2019-11-28 04:13:09', NULL, 'Application Setting', 'Application Name'),
(11, 'default_paper_size', 'Legal', 'text', NULL, 'Paper size, ex : A4, Legal, etc', '2019-11-28 04:13:09', NULL, 'Application Setting', 'Default Paper Print Size'),
(12, 'logo', 'uploads/2019-11/a31b6ad36711083786cf9e27943d047c.png', 'upload_image', NULL, NULL, '2019-11-28 04:13:09', NULL, 'Application Setting', 'Logo'),
(13, 'favicon', 'uploads/2019-11/15e2921daa4529a879759c515480d9c7.png', 'upload_image', NULL, NULL, '2019-11-28 04:13:09', NULL, 'Application Setting', 'Favicon'),
(14, 'api_debug_mode', 'true', 'select', 'true,false', NULL, '2019-11-28 04:13:09', NULL, 'Application Setting', 'API Debug Mode'),
(15, 'google_api_key', NULL, 'text', NULL, NULL, '2019-11-28 04:13:09', NULL, 'Application Setting', 'Google API Key'),
(16, 'google_fcm_key', NULL, 'text', NULL, NULL, '2019-11-28 04:13:09', NULL, 'Application Setting', 'Google FCM Key');

-- --------------------------------------------------------

--
-- Table structure for table `cms_statistics`
--

CREATE TABLE `cms_statistics` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cms_statistic_components`
--

CREATE TABLE `cms_statistic_components` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_cms_statistics` int(11) DEFAULT NULL,
  `componentID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `component_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `area_name` varchar(55) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sorting` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `config` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cms_users`
--

CREATE TABLE `cms_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_cms_privileges` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cms_users`
--

INSERT INTO `cms_users` (`id`, `name`, `photo`, `email`, `password`, `id_cms_privileges`, `created_at`, `updated_at`, `deleted_at`, `status`) VALUES
(1, 'Admin', NULL, 'admin@crudbooster.com', '$2y$10$0mt6CxPUN2xoFrkPzKDxju78lCav547nTFQ7zYkmyzYQSDEIzBpB2', 1, '2019-11-28 04:13:09', '2019-11-30 02:53:41', NULL, 'Active'),
(2, 'Admin', NULL, 'admin@email.com', '$2y$10$nTS7a1ikMMSlmOXeLJ1X6OHRLNypTvbYYIUUR2utH3w8kX.wDeynK', 2, '2019-11-30 03:09:02', NULL, NULL, 'Active'),
(3, 'Anisha Tiarasani', NULL, 'anisha@email.com', '$2y$10$V2UQZhLckyKI/NdU18LqueSnYKqDRWuLS9rnXCDix8J0pKmV.9Dq2', 3, '2019-12-03 04:31:26', NULL, NULL, 'Active'),
(4, 'Solehudin', NULL, 'solehudin@email.com', '$2y$10$sGH6diX.vqlIK/hI9WaPSeIhk9pFnHSFFOfjTrllcuRUNK7yl00Xu', 3, '2019-12-03 04:32:32', NULL, NULL, 'Active'),
(5, 'Arif Niwang Djati', NULL, 'niwang@email.com', '$2y$10$HmeTVVI0iqKHCrr5zC7gU.SxtK/aQgSBJ7SJJ6oyWWv8G6k1asdeG', 3, '2019-12-14 08:32:07', '2019-12-14 08:37:16', NULL, 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `qrcode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `forgot_password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pin` int(11) DEFAULT NULL,
  `saldo` int(11) DEFAULT '0',
  `facebook_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `google_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `created_at`, `updated_at`, `qrcode`, `name`, `image`, `phone_code`, `phone`, `email`, `password`, `forgot_password`, `pin`, `saldo`, `facebook_id`, `google_id`) VALUES
(1, '2020-01-13 07:45:08', '2020-01-13 07:45:08', 'CS1900004', 'Arif Niwang Djati', 'uploads/0/2020-01/4a7c786eab32aee24249bdde99a0a148.png', '+62', '8123456789', 'niwang@crocodic.com', 'e10adc3949ba59abbe56e057f20f883e', 'LFI5V4', 123456, 275000, NULL, NULL);

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
(1, '2016_08_07_145904_add_table_cms_apicustom', 1),
(2, '2016_08_07_150834_add_table_cms_dashboard', 1),
(3, '2016_08_07_151210_add_table_cms_logs', 1),
(4, '2016_08_07_151211_add_details_cms_logs', 1),
(5, '2016_08_07_152014_add_table_cms_privileges', 1),
(6, '2016_08_07_152214_add_table_cms_privileges_roles', 1),
(7, '2016_08_07_152320_add_table_cms_settings', 1),
(8, '2016_08_07_152421_add_table_cms_users', 1),
(9, '2016_08_07_154624_add_table_cms_menus_privileges', 1),
(10, '2016_08_07_154624_add_table_cms_moduls', 1),
(11, '2016_08_17_225409_add_status_cms_users', 1),
(12, '2016_08_20_125418_add_table_cms_notifications', 1),
(13, '2016_09_04_033706_add_table_cms_email_queues', 1),
(14, '2016_09_16_035347_add_group_setting', 1),
(15, '2016_09_16_045425_add_label_setting', 1),
(16, '2016_09_17_104728_create_nullable_cms_apicustom', 1),
(17, '2016_10_01_141740_add_method_type_apicustom', 1),
(18, '2016_10_01_141846_add_parameters_apicustom', 1),
(19, '2016_10_01_141934_add_responses_apicustom', 1),
(20, '2016_10_01_144826_add_table_apikey', 1),
(21, '2016_11_14_141657_create_cms_menus', 1),
(22, '2016_11_15_132350_create_cms_email_templates', 1),
(23, '2016_11_15_190410_create_cms_statistics', 1),
(24, '2016_11_17_102740_create_cms_statistic_components', 1),
(25, '2017_06_06_164501_add_deleted_at_cms_moduls', 1),
(26, '2019_09_17_051112_create_api_logs_table', 2),
(27, '2019_11_28_173537_create_customers', 3),
(28, '2019_11_28_174339_create_wahana', 3),
(29, '2019_11_28_180646_create_scan', 3),
(30, '2019_11_28_180744_create_topup', 3),
(31, '2019_11_28_180931_create_activity', 3),
(32, '2019_12_04_134827_add_phone_code', 4),
(33, '2019_12_04_140234_create_token', 5),
(35, '2019_12_04_143206_add_image_wahana', 6),
(36, '2019_12_04_144430_create_setting', 7),
(39, '2020_01_13_145449_add_sisa_saldo_activity', 8),
(40, '2020_01_13_150941_add_activity_id_topup', 9);

-- --------------------------------------------------------

--
-- Table structure for table `scan`
--

CREATE TABLE `scan` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `scan_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customers_id` int(11) NOT NULL,
  `activity_id` int(11) NOT NULL,
  `wahana_id` int(11) NOT NULL,
  `nominal` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `scan`
--

INSERT INTO `scan` (`id`, `created_at`, `updated_at`, `scan_code`, `customers_id`, `activity_id`, `wahana_id`, `nominal`) VALUES
(1, '2020-01-13 07:45:08', '2020-01-13 07:45:08', 'FJMvkt', 1, 1, 1, 25000);

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

CREATE TABLE `setting` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `token`
--

CREATE TABLE `token` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  `regid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `platform` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'Android'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `token`
--

INSERT INTO `token` (`id`, `created_at`, `updated_at`, `customer_id`, `regid`, `platform`) VALUES
(1, '2019-12-04 07:14:41', '2019-12-04 07:14:41', 1, 'exampletoken', 'Android'),
(2, '2020-01-08 03:50:23', '2020-01-08 03:50:23', 1, 'sampleredig', 'Android');

-- --------------------------------------------------------

--
-- Table structure for table `topup`
--

CREATE TABLE `topup` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `topup_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customers_id` int(11) NOT NULL,
  `merchant_id` int(11) NOT NULL,
  `nominal` int(11) DEFAULT '0',
  `activity_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `topup`
--

INSERT INTO `topup` (`id`, `created_at`, `updated_at`, `topup_code`, `customers_id`, `merchant_id`, `nominal`, `activity_id`) VALUES
(1, '2020-01-13 08:14:55', NULL, 'TP-130120-lGgqh', 1, 1, 25000, 2);

-- --------------------------------------------------------

--
-- Table structure for table `wahana`
--

CREATE TABLE `wahana` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `qrcode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `nominal` int(11) DEFAULT '0',
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Tutup'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wahana`
--

INSERT INTO `wahana` (`id`, `created_at`, `updated_at`, `qrcode`, `image`, `name`, `description`, `nominal`, `status`) VALUES
(1, '2019-12-04 07:41:42', NULL, 'uploads/qrcode/FJMvkt.png', 'uploads/1/2019-12/halilintar.jpeg', 'Halilintar', 'Menjadi salah satu wahana favorit dan ekstrim di Dufan, wahana Halilintar mampu menguji adrenalin Anda untuk bukan hanya merasakan seluncuran dengan loop 360 °, tapi juga lintasan turunan dan tanjakan yang tinggi dan cukup menikung. Berkapasitas 24 orang, wahana ini mampu membuat Anda serta kerabat dan teman-teman berteriak histeris untuk melupakan segala kejenuhan dari rutinitas sehari-hari.', 25000, 'Buka'),
(2, '2020-01-13 10:36:41', NULL, 'uploads/qrcode/MjtNz0.png', 'uploads/2/2020-01/bianglala.jpeg', 'Bianglala', 'Tak lengkap kunjungan ke Dufan tanpa menikmati wahana Bianglala, sebuah kincir besar yang siap membawa Anda ke ketinggian ± 30 meter dpl. Berkapasitas 180 orang, wahana ini tentunya lebih tepat untuk dinikmati bersama keluarga, teman, dan kerabat. Walaupun dapat dinikmati kapan saja, tetapi banyak pengunjung yang memilih untuk menikmati wahana ini di sore hari karena selain dapat menikmati pemandangan pantai dari ketinggian yang paling atas, mereka juga dapat menikmati romantisme terbenamnya matahari yang silih berganti dengan gemerlap lampu-lampu Ancol Taman Impian.', 10000, 'Buka');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity`
--
ALTER TABLE `activity`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `api_logs`
--
ALTER TABLE `api_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_apicustom`
--
ALTER TABLE `cms_apicustom`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_apikey`
--
ALTER TABLE `cms_apikey`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_dashboard`
--
ALTER TABLE `cms_dashboard`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_email_queues`
--
ALTER TABLE `cms_email_queues`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_email_templates`
--
ALTER TABLE `cms_email_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_logs`
--
ALTER TABLE `cms_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_menus`
--
ALTER TABLE `cms_menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_menus_privileges`
--
ALTER TABLE `cms_menus_privileges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_moduls`
--
ALTER TABLE `cms_moduls`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_notifications`
--
ALTER TABLE `cms_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_privileges`
--
ALTER TABLE `cms_privileges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_privileges_roles`
--
ALTER TABLE `cms_privileges_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_settings`
--
ALTER TABLE `cms_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_statistics`
--
ALTER TABLE `cms_statistics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_statistic_components`
--
ALTER TABLE `cms_statistic_components`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_users`
--
ALTER TABLE `cms_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `scan`
--
ALTER TABLE `scan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `token`
--
ALTER TABLE `token`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `topup`
--
ALTER TABLE `topup`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wahana`
--
ALTER TABLE `wahana`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity`
--
ALTER TABLE `activity`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `api_logs`
--
ALTER TABLE `api_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cms_apicustom`
--
ALTER TABLE `cms_apicustom`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `cms_apikey`
--
ALTER TABLE `cms_apikey`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cms_dashboard`
--
ALTER TABLE `cms_dashboard`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cms_email_queues`
--
ALTER TABLE `cms_email_queues`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cms_email_templates`
--
ALTER TABLE `cms_email_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cms_logs`
--
ALTER TABLE `cms_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT for table `cms_menus`
--
ALTER TABLE `cms_menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `cms_menus_privileges`
--
ALTER TABLE `cms_menus_privileges`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `cms_moduls`
--
ALTER TABLE `cms_moduls`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `cms_notifications`
--
ALTER TABLE `cms_notifications`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cms_privileges`
--
ALTER TABLE `cms_privileges`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `cms_privileges_roles`
--
ALTER TABLE `cms_privileges_roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `cms_settings`
--
ALTER TABLE `cms_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `cms_statistics`
--
ALTER TABLE `cms_statistics`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cms_statistic_components`
--
ALTER TABLE `cms_statistic_components`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cms_users`
--
ALTER TABLE `cms_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `scan`
--
ALTER TABLE `scan`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `setting`
--
ALTER TABLE `setting`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `token`
--
ALTER TABLE `token`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `topup`
--
ALTER TABLE `topup`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `wahana`
--
ALTER TABLE `wahana`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
