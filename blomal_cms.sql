-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 08, 2023 at 04:22 PM
-- Server version: 10.6.12-MariaDB-0ubuntu0.22.04.1
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blomal_cms`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(191) NOT NULL,
  `last_name` varchar(191) DEFAULT NULL,
  `username` varchar(191) NOT NULL,
  `phone_no` varchar(191) DEFAULT NULL,
  `email` varchar(191) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) NOT NULL,
  `avatar` varchar(191) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1=active, 0=inactive',
  `visible_in_team` tinyint(1) NOT NULL DEFAULT 0,
  `designation` varchar(100) DEFAULT NULL,
  `social_links` text DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `first_name`, `last_name`, `username`, `phone_no`, `email`, `email_verified_at`, `password`, `avatar`, `status`, `visible_in_team`, `designation`, `social_links`, `remember_token`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', '', 'superadmin', '+966542816280', 'zubair@blomal.com', NULL, '$2y$10$rqfcGKkjFLbrYxYOcuzWfORCGmvJJikyQmzbetPYlSIWJSBLsIWCW', NULL, 1, 0, NULL, NULL, 'tBgCddIx0mzMj3CmQqMEehgmQoaRiQKssopnSeRm6YOZ9LRRhmDO3htdldDG', NULL, NULL, NULL, NULL, '2023-05-23 07:07:28', '2023-05-23 07:07:28'),
(2, 'Admin', '', 'admin', '018XXXXXXXX', 'admin@example.com', NULL, '$2y$10$GFR44B75hahJxq9qd8vhgOQ1kuWWRB9RHLE8RriIcVb9iDdi6n812', NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-23 07:07:28', '2023-05-23 07:07:28'),
(3, 'Editor', NULL, 'editor', '017XXXXXXXX', 'editor@example.com', NULL, '$2y$10$Bd5MejHFsDCmwu.tfAliaOCiCvyBKNMQ82vP1AjgzTxMN1vpB/qDu', NULL, 1, 0, 'test', '{\"facebook\":null,\"twitter\":null,\"linkedin\":null,\"instagram\":null,\"youtube\":null}', NULL, NULL, NULL, 1, NULL, '2023-05-23 07:07:28', '2023-05-23 07:28:37'),
(4, 'Zubair', 'Yousaf', 'zubairbobby', '0542816280', 'zubair_bobby@hotmail.com', NULL, '$2y$10$W3le1aN01NfeGj61QKfileR9Bq8QopR/eKnnSrfVcdl07.B2b5pQm', NULL, 1, 1, 'test', '{\"facebook\":null,\"twitter\":null,\"linkedin\":null,\"instagram\":null,\"youtube\":null}', NULL, NULL, 1, 1, NULL, '2023-06-07 10:11:58', '2023-06-07 10:14:15');

-- --------------------------------------------------------

--
-- Table structure for table `article_types`
--

CREATE TABLE `article_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `billing_information`
--

CREATE TABLE `billing_information` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `booking_request_id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `phone_no` varchar(15) NOT NULL,
  `company_name` varchar(100) DEFAULT NULL,
  `state` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `address` varchar(150) NOT NULL,
  `post_code` int(10) UNSIGNED DEFAULT NULL,
  `billing_message` text DEFAULT NULL,
  `booking_hour` double(8,2) UNSIGNED NOT NULL DEFAULT 1.00,
  `booking_subtotal` double(8,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `booking_gst` double(8,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `grand_total` double(8,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `payment_status` varchar(191) NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `booking_rates`
--

CREATE TABLE `booking_rates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `rate` double(8,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `booking_requests`
--

CREATE TABLE `booking_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone_no` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `service_id` bigint(20) UNSIGNED NOT NULL,
  `service_name` varchar(100) NOT NULL,
  `service_category_id` bigint(20) UNSIGNED NOT NULL,
  `service_category_name` varchar(100) NOT NULL,
  `booking_rate_id` bigint(20) UNSIGNED NOT NULL,
  `booking_rate_name` varchar(100) NOT NULL,
  `booking_rate_value` double(8,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `start_date` date NOT NULL,
  `start_time` time NOT NULL,
  `message` text DEFAULT NULL,
  `status` varchar(191) NOT NULL DEFAULT 'pending',
  `expired_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(191) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `name_ar` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `slug` varchar(191) NOT NULL,
  `banner_image` varchar(191) DEFAULT NULL,
  `logo_image` varchar(191) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `description_ar` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `parent_category_id` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'Null if category is parent, else parent id',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=>active, 0=>inactive',
  `enable_bg` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1=>active, 0=>inactive',
  `bg_color` varchar(20) NOT NULL DEFAULT 'FFFFFF',
  `text_color` varchar(20) NOT NULL DEFAULT '000000',
  `priority` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `name_ar`, `slug`, `banner_image`, `logo_image`, `description`, `description_ar`, `meta_description`, `parent_category_id`, `status`, `enable_bg`, `bg_color`, `text_color`, `priority`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`, `created_at`, `updated_at`) VALUES
(1, 'Why Blomal', 'لماذا بلومال', 'why-blomal', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 'FFFFFF', '000000', 1, NULL, 1, NULL, NULL, '2023-06-04 10:29:03', '2023-06-04 10:29:03'),
(2, 'Hand-Picked', 'تختار بعناية', 'hand-picked', NULL, NULL, 'We carefully select projects and co-invest with you because our success is based on your success in the first place.', 'نختار المشاريع بعناية ونشترك معك في الاستثمار لأن نجاحنا يعتمد على نجاحك في المقام الأول.', NULL, 1, 1, 0, 'FFFFFF', '000000', 1, NULL, 1, NULL, NULL, '2023-06-04 10:30:46', '2023-06-04 10:30:46'),
(3, 'Shariah Compliance', 'التوافق مع أحكام الشريعة الإسلامية', 'shariah-compliance', NULL, NULL, 'the principles of Islamic Sharia in all its various activities. It also works to apply the principles of Islamic Sharia in all its dealings.', 'مبادئ الشريعة الإسلامية في جميع أنشطتها المختلفة. كما تعمل على تطبيق مبادئ الشريعة الإسلامية في جميع تعاملاتها.', NULL, 1, 1, 0, 'FFFFFF', '000000', 1, NULL, 1, NULL, NULL, '2023-06-04 10:32:24', '2023-06-04 10:32:24'),
(4, 'Easily Accessible', 'يمكن الوصول إليها بسهولة', 'easily-accessible', NULL, NULL, 'High-quality real estate projects are open for the retail and accredited investors. who is over 18 years old can invest.', 'المشاريع العقارية عالية الجودة مفتوحة للمستثمرين الأفراد والمعتمدين. من يزيد عمره عن 18 عامًا يمكنه الاستثمار.\nalmasharie', NULL, 1, 1, 0, 'FFFFFF', '000000', 1, NULL, 1, NULL, NULL, '2023-06-04 10:33:34', '2023-06-04 10:33:34'),
(5, 'Rewarding Returns', 'عوائد مجزية', 'rewarding-returns', NULL, NULL, 'Investors collectively fund real estate deals with potential returns of 8-20% a year. Profits are no guaranteed.', 'يقوم المستثمرون بشكل جماعي بتمويل الصفقات العقارية ذات العوائد المحتملة من 8 إلى 20٪ سنويًا. الأرباح ليست مضمونة.', NULL, 1, 1, 0, 'FFFFFF', '000000', 1, NULL, 1, NULL, NULL, '2023-06-04 10:39:14', '2023-06-04 10:39:14'),
(6, 'Simple and easy process', 'عملية بسيطة وسهلة', 'simple-and-easy-process', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 'FFFFFF', '000000', 1, NULL, 1, NULL, NULL, '2023-06-04 10:44:13', '2023-06-04 10:44:13'),
(7, 'REGISTER', 'يسجل', 'register', NULL, NULL, 'Create a new account, get verified and gain access to the full platform’s capabilities.', 'أنشئ حسابًا جديدًا ، وتحقق من صحته ، واحصل على إمكانية الوصول إلى إمكانات النظام الأساسي الكاملة.', NULL, 6, 1, 0, 'FFFFFF', '000000', 1, NULL, 1, NULL, NULL, '2023-06-04 10:45:17', '2023-06-04 10:45:17'),
(8, 'Fund Your Account', 'مول حسابك', 'fund-your-account', NULL, NULL, 'Create a new account, get verified and gain access to the full platform’s capabilities.', 'أنشئ حسابًا جديدًا ، وتحقق من صحته ، واحصل على إمكانية الوصول إلى إمكانات النظام الأساسي الكاملة.', NULL, 6, 1, 0, 'FFFFFF', '000000', 1, NULL, 1, NULL, NULL, '2023-06-04 10:46:06', '2023-06-04 10:46:06'),
(9, 'INVEST OR FUNDRAISE', 'استثمر أو جمع الأموال', 'invest-or-fundraise', NULL, NULL, 'INVEST OR FUNDRAISE', 'استثمر أو جمع الأموال', NULL, 6, 1, 0, 'FFFFFF', '000000', 1, NULL, 1, NULL, NULL, '2023-06-04 10:47:18', '2023-06-04 10:47:18'),
(10, 'REWARD', 'جائزة', 'reward', NULL, NULL, 'جائزة', 'جائزة', NULL, 6, 1, 0, 'FFFFFF', '000000', 1, NULL, 1, NULL, NULL, '2023-06-04 10:48:37', '2023-06-04 10:48:37'),
(11, 'OUR PARTNERS', 'شركاؤنا', 'our-partners', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 'FFFFFF', '000000', 1, NULL, 1, NULL, NULL, '2023-06-04 10:49:02', '2023-06-04 10:49:02'),
(12, 'Capital Market Authority', 'هيئة السوق المالية', 'capital-market-authority', NULL, 'Capital Market Authority1-1685955138-logo.svg', NULL, NULL, NULL, 11, 1, 0, 'FFFFFF', '000000', 1, NULL, 1, 1, NULL, '2023-06-04 10:51:14', '2023-06-05 05:53:19'),
(13, 'Elm', 'علم', 'elm', NULL, 'Elm-1685955186-logo.svg', NULL, NULL, NULL, NULL, 1, 0, 'FFFFFF', '000000', 1, NULL, 1, 1, NULL, '2023-06-05 05:42:34', '2023-06-05 05:53:06'),
(14, 'HyperPay', 'HyperPay', 'hyperpay', NULL, 'HyperPay-1685955079-logo.svg', NULL, NULL, NULL, NULL, 1, 0, 'FFFFFF', '000000', 1, NULL, 1, 1, NULL, '2023-06-05 05:48:07', '2023-06-05 05:51:19'),
(15, 'Mozn', 'Mozn', 'mozn', NULL, 'Mozn-1685955375-logo.svg', NULL, NULL, NULL, NULL, 1, 0, 'FFFFFF', '000000', 1, NULL, 1, 1, NULL, '2023-06-05 05:56:15', '2023-06-05 06:15:58');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `message` varchar(191) NOT NULL,
  `subject` varchar(191) NOT NULL,
  `country` varchar(191) DEFAULT NULL,
  `company` varchar(191) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 = not seen by admin, 1 = seen by admin',
  `admin_id` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `code` varchar(191) NOT NULL,
  `flag` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `name`, `code`, `flag`) VALUES
(1, 'United States of America', 'en', 'en.png'),
(2, 'Finland', 'fi', 'fi.png'),
(3, 'Germany', 'de', 'de.png'),
(4, 'Sweden', 'se', 'se.png'),
(5, 'Norwegian', 'no', 'no.png'),
(6, 'Greenland', 'dk', 'dk.png'),
(7, 'France', 'fr', 'fr.png'),
(8, 'Italy', 'it', 'it.png'),
(9, 'Spain', 'es', 'es.png'),
(10, 'Albanian', 'al', 'al.png'),
(11, 'Bangladesh', 'bn', 'bn.png');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `question_en` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `question_ar` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `answer_en` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `answer_ar` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `slug` text NOT NULL,
  `image` varchar(191) DEFAULT NULL,
  `description` text NOT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_description_ar` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=>active, 0=>inactive',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faqs`
--

INSERT INTO `faqs` (`id`, `title`, `question_en`, `question_ar`, `answer_en`, `answer_ar`, `slug`, `image`, `description`, `meta_description`, `meta_description_ar`, `status`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`, `created_at`, `updated_at`) VALUES
(1, '', 'How to invest in Blomal Platform?', 'كيف تستثمر في منصة بلومال؟', 'Based in Jeddah, Saudi Arabia. Established in 2021, the firm\r\ninvests in various portfolios in stock funds, Sukuk, and various real estate funds. The assets of the firm are managed by the executive management team.', 'مقرها في جدة ، المملكة العربية السعودية. تأسست الشركة عام 2021\r\nيستثمر في محافظ مختلفة في صناديق الأسهم والصكوك والصناديق العقارية المختلفة. يتم إدارة أصول الشركة من قبل فريق الإدارة التنفيذية.', 'howtoinvestinblomalplatform', NULL, '', NULL, NULL, 1, NULL, 1, 1, NULL, '2023-06-07 08:42:51', '2023-06-07 09:26:42'),
(2, '', 'How can I get the investment returns?', 'كيف يمكنني الحصول على عوائد الاستثمار؟', 'blomal capital', 'بلومال كابيتال', 'howcanigettheinvestmentreturns', NULL, '', NULL, NULL, 1, NULL, 1, NULL, NULL, '2023-06-07 08:45:28', '2023-06-07 08:45:28'),
(3, '', 'How can I know the latest updates on the new opportunities?', 'كيف يمكنني معرفة آخر التحديثات حول الفرص الجديدة؟', 'Investors are notified through e-mail and the platform\'s various social media channels.', 'يتم اشعار المستثمرين من خلال البريد الإلكتروني، وقنوات وسائل التواصل الاجتماعي المختلفة للمنصة.', 'howcaniknowthelatestupdatesonthenewopportunities', NULL, '', NULL, NULL, 1, NULL, 1, NULL, NULL, '2023-06-07 08:47:09', '2023-06-07 08:47:09'),
(4, '', 'Are returns guaranteed?', 'هل العوائد مضمونة؟', 'The terms and conditions for each fund indicate the dividend distribution period, please review them before making an investment decision.', 'الشروط والاحكام الخاصة بكل صندوق توضح فترة توزيع الأرباح، يرجى الاطلاع عليها قبل اتخاذ القرار الاستثماري.', 'arereturnsguaranteed', NULL, '', NULL, NULL, 1, NULL, 1, NULL, NULL, '2023-06-07 08:49:21', '2023-06-07 08:49:21'),
(5, '', 'What is the minimum investment?', 'ما هو الحد الأدنى للاستثمار؟', 'The minimum investment is 1,000 Saudi riyals, and sometimes the fund may require a limit that exceeds that.', 'الحد الأدنى للاستثمار هو 1000 ريال سعودي، وفي بعض الأحيان قد يشترط الصندوق حدا يتجاوز ذلك.', 'whatistheminimuminvestment', NULL, '', NULL, NULL, 1, NULL, 1, NULL, NULL, '2023-06-07 09:01:37', '2023-06-07 09:01:37'),
(6, '', 'Are the operations on the platform in accordance with Islamic law?', 'هل العمليات في المنصة مطابقة للشريعة الإسلامية ؟', 'Yes, all transactions carried out through the platform are in compliance with Islamic law.', 'نعم، جميع العمليات التي تتم من خلال المنصة هي مطابقة للشريعة الإسلامية.', 'aretheoperationsontheplatforminaccordancewithislamiclaw', NULL, '', NULL, NULL, 1, NULL, 1, NULL, NULL, '2023-06-07 09:04:02', '2023-06-07 09:04:02');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `short_name` varchar(191) DEFAULT NULL,
  `code` varchar(191) NOT NULL,
  `flag` varchar(191) DEFAULT NULL,
  `banner` varchar(191) DEFAULT NULL,
  `banner_caption` varchar(191) DEFAULT NULL,
  `country` varchar(191) NOT NULL,
  `country_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `short_name`, `code`, `flag`, `banner`, `banner_caption`, `country`, `country_id`) VALUES
(1, 'English', 'Eng', 'en', 'en.png', NULL, NULL, 'United States of America', 1),
(2, 'Finnish', 'Finnish', 'fi', 'fi.png', NULL, NULL, 'Finland', 2),
(3, 'German', 'Deutsch', 'de', 'de.png', NULL, NULL, 'Germany', 3),
(4, 'Svenska', 'Svenska', 'se', 'se.png', NULL, NULL, 'Sweden', 4),
(5, 'Norsk', 'Norsk', 'no', 'no.png', NULL, NULL, 'Norwegian', 5),
(6, 'Dansk', 'Dansk', 'dk', 'dk.png', NULL, NULL, 'Greenland', 6),
(7, 'Francais', 'Francais', 'fr', 'fr.png', NULL, NULL, 'France', 7),
(8, 'English', 'Eng', 'it', 'it.png', NULL, NULL, 'Italy', 8),
(9, 'Italiano', 'Italiano', 'es', 'es.png', NULL, NULL, 'Spain', 9),
(10, 'Spannish', 'Espanol', 'al', 'al.png', NULL, NULL, 'Albanian', 10),
(11, 'Bangla', 'Bangla', 'bn', 'bn.png', NULL, NULL, 'Bangladesh', 11);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(2, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(3, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(4, '2016_06_01_000004_create_oauth_clients_table', 1),
(5, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(6, '2020_05_01_000000_create_admins_table', 1),
(7, '2020_05_01_000010_create_users_table', 1),
(8, '2020_05_01_000020_create_failed_jobs_table', 1),
(9, '2020_05_01_000030_create_password_resets_table', 1),
(10, '2020_05_01_000050_create_categories_table', 1),
(11, '2020_05_01_000060_create_pages_table', 1),
(12, '2020_05_01_000070_create_blogs_table', 1),
(13, '2020_05_01_000080_create_contacts_table', 1),
(14, '2020_05_01_000090_create_tracks_table', 1),
(15, '2021_02_03_061323_create_article_types_table', 1),
(16, '2021_02_27_184353_create_permission_tables', 1),
(17, '2021_02_27_185000_create_countries_table', 1),
(18, '2021_02_27_185728_create_languages_table', 1),
(19, '2021_08_07_071049_create_cache_table', 1),
(20, '2021_08_07_101047_create_services_table', 1),
(21, '2021_09_16_014842_create_booking_requests_table', 1),
(22, '2021_09_20_171606_create_booking_rates_table', 1),
(23, '2021_09_20_193849_create_billing_information_table', 1),
(24, '2022_11_24_143537_delete_old_settings_table', 1),
(25, '2022_11_25_143537_create_settings_table', 1),
(26, '2022_11_25_151900_create_general_settings', 1),
(27, '2022_11_25_152111_create_contact_settings', 1),
(28, '2022_11_25_152117_create_social_settings', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(2, 'App\\Models\\Admin', 1),
(2, 'App\\Models\\Admin', 2),
(2, 'App\\Models\\Admin', 4),
(3, 'App\\Models\\Admin', 3),
(4, 'App\\Models\\Admin', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `secret` varchar(100) DEFAULT NULL,
  `provider` varchar(191) DEFAULT NULL,
  `redirect` text NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) NOT NULL,
  `access_token_id` varchar(100) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `banner_title_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `banner_title_ar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `banner_description_en` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `banner_description_ar` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text NOT NULL,
  `investment_description_ar` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `who_we_are_ar` text DEFAULT NULL,
  `our_mission_en` text DEFAULT NULL,
  `our_mission_ar` text DEFAULT NULL,
  `our_vision_en` text DEFAULT NULL,
  `our_vision_ar` text DEFAULT NULL,
  `terms_en` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `terms_ar` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `privacy_en` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `privacy_ar` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `disclosure_policy_en` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `disclosure_policy_ar` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_description_ar` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `image` varchar(191) DEFAULT NULL,
  `banner_image` varchar(191) DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'Null if page has no category',
  `article_type_id` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'If Article Belongs to a Type',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=>active, 0=>inactive',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `title`, `slug`, `banner_title_en`, `banner_title_ar`, `banner_description_en`, `banner_description_ar`, `description`, `investment_description_ar`, `who_we_are_ar`, `our_mission_en`, `our_mission_ar`, `our_vision_en`, `our_vision_ar`, `terms_en`, `terms_ar`, `privacy_en`, `privacy_ar`, `disclosure_policy_en`, `disclosure_policy_ar`, `meta_description`, `meta_description_ar`, `image`, `banner_image`, `category_id`, `article_type_id`, `status`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`, `created_at`, `updated_at`) VALUES
(1, 'Home', 'index', 'Build Wealth with Real Estate Crowdfunding', 'بناء الثروة من خلال التمويل الجماعي العقاري', 'Get access to high-quality commercial real estate deals whether you’re a retail or institutional investor', 'احصل على إمكانية الوصول إلى صفقات عقارية تجارية عالية الجودة سواء كنت مستثمرًا بالتجزئة أو مستثمرًا مؤسسيًا', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Blomal Financial LLC is a Saudi company licensed by the Ministry of Commerce, under license number 4030443697 under the procedures for obtaining a permit from the Capital Market Authority.', 'Blomal Financial LLC هي شركة سعودية مرخصة من قبل وزارة التجارة ، بموجب ترخيص رقم 4030443697 بموجب إجراءات الحصول على تصريح من هيئة السوق المالية.', NULL, NULL, NULL, NULL, 1, NULL, 1, 1, NULL, '2023-05-29 09:05:02', '2023-06-08 09:17:17'),
(2, 'About Us', 'about', 'Blomal Story', 'قصة بلومال1', 'We’re here to help demystify the real estate investment process with an in-house team of experts that handle the portfolio through each phase.', 'نحن هنا للمساعدة في إزالة الغموض عن عملية الاستثمار العقاري من خلال فريق داخلي من الخبراء يتعامل مع المحفظة خلال كل مرحلة', 'We’re here to help demystify the real estate investment process with an in-house team of experts that handle the portfolio through each phase.', NULL, 'نحن هنا للمساعدة في إزالة الغموض عن عملية الاستثمار العقاري من خلال فريق داخلي من الخبراء يتعامل مع المحفظة خلال كل مرحلة', 'based in Jeddah, Saudi Arabia. Established in 2021, the firm invests in various portfolios in stock funds, Sukuk, and various real estate funds. The assets of the firm are managed by the executive management team.', 'مقرها في جدة ، المملكة العربية السعودية. تأسست الشركة عام 2021 ، وتستثمر في محافظ مختلفة في صناديق الأسهم والصكوك والصناديق العقارية المختلفة. يتم إدارة أصول الشركة من قبل فريق الإدارة التنفيذية.', 'based in Jeddah, Saudi Arabia. Established in 2021, the firm invests in various portfolios in stock funds, Sukuk, and various real estate funds. The assets of the firm are managed by the executive management team.', 'مقرها في جدة ، المملكة العربية السعودية. تأسست الشركة عام 2021 ، وتستثمر في محافظ مختلفة في صناديق الأسهم والصكوك والصناديق العقارية المختلفة. يتم إدارة أصول الشركة من قبل فريق الإدارة التنفيذية.', NULL, NULL, NULL, NULL, NULL, NULL, 'Blomal Financial LLC is a Saudi company licensed by the Ministry of Commerce, under license number 4030443697 under the procedures for obtaining a permit from the Capital Market Authority.', 'Blomal Financial LLC هي شركة سعودية مرخصة من قبل وزارة التجارة ، بموجب ترخيص رقم 4030443697 بموجب إجراءات الحصول على تصريح من هيئة السوق المالية.', 'About Us-1684919652-logo.png', NULL, NULL, NULL, 1, NULL, NULL, 1, NULL, '2023-05-23 07:07:28', '2023-06-08 09:16:49'),
(3, 'Investment', 'investment', 'Investment Opportunities', 'فرص الاستثمار', 'We’re here to help demystify the real estate investment process with an in-house team of experts that handle the portfolio through each phase1', 'نحن هنا للمساعدة في إزالة الغموض عن عملية الاستثمار العقاري من خلال فريق داخلي من الخبراء يتعامل مع المحفظة خلال كل مرحلة', 'investment opportunity that matches your priorities.', 'فرصة استثمارية تتناسب مع أولوياتك', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Blomal Financial LLC is a Saudi company licensed by the Ministry of Commerce, under license number 4030443697 under the procedures for obtaining a permit from the Capital Market Authority.', 'Blomal Financial LLC هي شركة سعودية مرخصة من قبل وزارة التجارة ، بموجب ترخيص رقم 4030443697 بموجب إجراءات الحصول على تصريح من هيئة السوق المالية.', NULL, NULL, NULL, NULL, 1, NULL, 1, 1, NULL, '2023-05-29 09:05:02', '2023-06-08 09:16:11'),
(4, 'Faqs', 'faqs', 'Frequently Asked Questions', 'أسئلة مكررة', 'We’re here to help demystify the real estate investment process with an in-house team of experts that handle the portfolio through each phase.', 'نحن هنا للمساعدة في إزالة الغموض عن عملية الاستثمار العقاري من خلال فريق داخلي من الخبراء يتعامل مع المحفظة خلال كل مرحلة', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Blomal Financial LLC is a Saudi company licensed by the Ministry of Commerce, under license number 4030443697 under the procedures for obtaining a permit from the Capital Market Authority.', 'Blomal Financial LLC هي شركة سعودية مرخصة من قبل وزارة التجارة ، بموجب ترخيص رقم 4030443697 بموجب إجراءات الحصول على تصريح من هيئة السوق المالية.', NULL, NULL, NULL, NULL, 1, NULL, 1, 1, NULL, '2023-05-29 09:05:02', '2023-06-08 09:15:34'),
(5, 'Terms & Conditions', 'terms', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, '<p class=\"desc\">Dear investor, Blomal is an electronic platform that aims to collect the funds of a group of investors, &ldquo;clients of the platform,&rdquo; for the purpose of financing licensed real estate investment funds. Accordingly, Blomal is not responsible for any misconduct or violation of the policies and regulations of the Capital Market Authority made by fund managers or related boards of directors or any of those related to the funds displayed on the platform. To complete the registration process, you must agree to all terms and conditions, which are as follows:</p>\r\n<h4 class=\"title\">Your rights</h4>\r\n<ol>\r\n<li>Referring to all information about investment opportunities published on the platform and all information that assures denial of ignorance about the opportunity.</li>\r\n<li>After your registration, a virtual account with the Arab Bank will be opened for you to deposit the money you wish to invest; you can recover this money &ldquo;from your virtual account&rdquo; at any time through your control panel with ease.</li>\r\n<li>You have the right to periodically obtain a performance evaluation of the investment opportunity as explained in the terms and conditions of the investment opportunity by logging into your control panel.</li>\r\n<li>The amounts due to you in the event of financial distributions according to the times specified in the terms and conditions for each investment opportunity are deposited through your virtual IBAN account on Blomal platform.</li>\r\n<li>You have the right to transfer the amount to your current account defined on the platform or reinvest in any available opportunity.</li>\r\n<li>You have the right to raise any complaint or grievance through any of the communication channels indicated on the official website, and it will be resolved as soon as possible.</li>\r\n<li>Blomal platform complies with all requirements related to protecting personal data for investors, according to what is stated in the platform&rsquo;s privacy policy or the relevant government regulations.</li>\r\n<li>You should know that the decision to invest in Blomal is a contract between you and the fund manager. Therefore, obtaining an updated copy in Arabic from him or her of the fund\'s terms and conditions is one of your rights.</li>\r\n<li>You can see all investments, their status, progression rate, periodic evaluation, liquidation announcement, and disassociation through your control panel.</li>\r\n<li>You will be notified of any substantial change in the board of directors or the terms and conditions of the fund, and a summary of such change will be sent within the period indicated in the investment funds policy or what was mentioned in the terms and conditions via your control panel</li>\r\n<li>Blomal enables you to view the company\'s disclosure policy and your personal data and information privacy policy.</li>\r\n</ol>\r\n<h4 class=\"title\">Your obligations</h4>\r\n<ol>\r\n<li>You should carefully read the terms and conditions of any investment opportunity before making your investment decision.</li>\r\n<li>You are not entitled to trade the units or assign them to others until after the first evaluation of the opportunity by submitting an application in the client\'s control panel on the platform.</li>\r\n<li>Blomal platform charges a subscription fee of no more than 2% of an individual\'s investment value, excluding taxes.</li>\r\n<li>The logos and trademarks on the platform are registered and protected by law, and exposure to any of them may subject you to legal liability.</li>\r\n<li>You should know that once you have paid the investment amount through the platform in exchange for buying units in the offered fund, this amount becomes non-refundable.</li>\r\n<li>Blomal reserves the right to change and update these terms and conditions periodically, so we recommend that you review them regularly.</li>\r\n<li>You are responsible for all information and activities that take place through the platform; you must help protect the confidentiality of your username and password and notify us immediately if you become aware of any disclosure, loss, theft, or unauthorized use.</li>\r\n<li>You should be aware that by registering on the platform, you are authorizing it to create a virtual account in your name with Arab Bank.</li>\r\n<li>Before registering on the platform, you must read and agree to the Privacy Policy and the Disclosure Policy</li>\r\n</ol>', '<p><span>عزيزي المستثمر ، بلومال منصة إلكترونية تهدف إلى جمع أموال مجموعة من المستثمرين \"عملاء المنصة\" لغرض تمويل صناديق الاستثمار العقاري المرخصة.&nbsp;وبناءً على ذلك ، فإن بلومال ليست مسؤولة عن أي سوء سلوك أو انتهاك لسياسات ولوائح هيئة السوق المالية الصادرة عن مديري الصناديق أو مجالس الإدارة ذات الصلة أو أي من تلك المتعلقة بالأموال المعروضة على المنصة.&nbsp;لإكمال عملية التسجيل ، يجب أن توافق على جميع الشروط والأحكام ، وهي كالتالي:</span></p>\r\n<h4 class=\"title\"><span>حقوقك</span></h4>\r\n<ol>\r\n<li><span>الإشارة إلى كافة المعلومات الخاصة بفرص الاستثمار المنشورة على المنصة وجميع المعلومات التي تؤكد إنكار الجهل بالفرصة.</span></li>\r\n<li><span>بعد التسجيل ، سيتم فتح حساب افتراضي لدى البنك العربي لإيداع الأموال التي ترغب في استثمارها ؛&nbsp;يمكنك استرداد هذه الأموال \"من حسابك الافتراضي\" في أي وقت من خلال لوحة التحكم الخاصة بك بكل سهولة.</span></li>\r\n<li><span>يحق لك الحصول بشكل دوري على تقييم أداء لفرصة الاستثمار كما هو موضح في شروط وأحكام فرصة الاستثمار عن طريق تسجيل الدخول إلى لوحة التحكم الخاصة بك.</span></li>\r\n<li><span>يتم إيداع المبالغ المستحقة لك في حالة التوزيعات المالية وفقًا للأوقات المحددة في الشروط والأحكام الخاصة بكل فرصة استثمارية من خلال حساب IBAN الافتراضي الخاص بك على منصة بلومال.</span></li>\r\n<li><span>لديك الحق في تحويل المبلغ إلى حسابك الحالي المحدد على المنصة أو إعادة الاستثمار في أي فرصة متاحة.</span></li>\r\n<li><span>يحق لك رفع أي شكوى أو تظلم عبر أي من قنوات الاتصال الموضحة على الموقع الرسمي وسيتم حلها في أسرع وقت ممكن.</span></li>\r\n<li><span>تلتزم منصة بلومال بجميع المتطلبات المتعلقة بحماية البيانات الشخصية للمستثمرين ، وفقًا لما هو مذكور في سياسة الخصوصية الخاصة بالمنصة أو اللوائح الحكومية ذات الصلة.</span></li>\r\n<li><span>يجب أن تعلم أن قرار الاستثمار في Blomal هو عقد بينك وبين مدير الصندوق.&nbsp;لذلك فإن الحصول على نسخة محدثة باللغة العربية منه أو منها من شروط وأحكام الصندوق هو من حقوقك.</span></li>\r\n<li><span>يمكنك الاطلاع على جميع الاستثمارات وحالتها ومعدل التقدم والتقييم الدوري وإعلان التصفية والفصل من خلال لوحة التحكم الخاصة بك.</span></li>\r\n<li><span>سيتم إخطارك بأي تغيير جوهري في مجلس الإدارة أو شروط وأحكام الصندوق ، وسيتم إرسال ملخص عن هذا التغيير خلال الفترة المحددة في سياسة صناديق الاستثمار أو ما ورد في الشروط والأحكام عبر لوحة التحكم الخاصة بك</span></li>\r\n<li><span>يمكّنك Blomal من عرض سياسة إفشاء الشركة وسياسة خصوصية بياناتك ومعلوماتك الشخصية.</span></li>\r\n</ol>\r\n<h4 class=\"title\"><span>التزاماتك</span></h4>\r\n<ol>\r\n<li><span>يجب عليك قراءة الشروط والأحكام الخاصة بأي فرصة استثمارية بعناية قبل اتخاذ قرارك الاستثماري.</span></li>\r\n<li><span>لا يحق لك تداول الوحدات أو التنازل عنها للآخرين إلا بعد التقييم الأول للفرصة من خلال تقديم طلب في لوحة تحكم العميل على المنصة.</span></li>\r\n<li><span>تفرض منصة بلومال رسوم اشتراك لا تزيد عن 2٪ من قيمة الاستثمار للفرد ، باستثناء الضرائب.</span></li>\r\n<li><span>الشعارات والعلامات التجارية الموجودة على المنصة مسجلة ومحمية بموجب القانون ، والتعرض لأي منها قد يعرضك للمسؤولية القانونية.</span></li>\r\n<li><span>يجب أن تعلم أنه بمجرد دفع مبلغ الاستثمار من خلال المنصة مقابل شراء وحدات في الصندوق المعروض ، يصبح هذا المبلغ غير قابل للاسترداد.</span></li>\r\n<li><span>تحتفظ بلومال بالحق في تغيير وتحديث هذه الشروط والأحكام بشكل دوري ، لذلك نوصي بمراجعتها بانتظام.</span></li>\r\n<li><span>أنت مسؤول عن جميع المعلومات والأنشطة التي تتم من خلال المنصة ؛&nbsp;يجب عليك المساعدة في حماية سرية اسم المستخدم وكلمة المرور الخاصين بك وإخطارنا على الفور إذا علمت بأي إفشاء أو فقدان أو سرقة أو استخدام غير مصرح به.</span></li>\r\n<li><span>يجب أن تدرك أنه بالتسجيل في المنصة ، فإنك تسمح لها بإنشاء حساب افتراضي باسمك لدى البنك العربي.</span></li>\r\n<li><span>قبل التسجيل على المنصة ، يجب أن تقرأ وتوافق على سياسة الخصوصية وسياسة الإفشاء</span></li>\r\n</ol>', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, 1, NULL, '2023-05-29 09:05:02', '2023-06-08 09:57:42'),
(21, 'Privacy policy', 'privacy', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, '', '', '<div class=\"info\">\r\n<h4 class=\"title\">Privacy policy</h4>\r\n<p class=\"desc\">Blomal Capital has created this policy to ensure the highest level of privacy and security of your personal information. It explains the standards and rules we follow when collecting, using, and disclosing your personal information. Please take the time to read this Privacy Policy carefully. Once you create an account on the platform, you agree to our Terms and Conditions and Privacy Policy regarding the use of your data. Blomal is committed to protecting all your rights regarding personal data stored on its system or following its privacy policy.</p>\r\n</div>\r\n<div class=\"info\">\r\n<h4 class=\"title\">what do we mean by your personal information?</h4>\r\n<p class=\"desc\">Personal information includes all details we hold or collect about you, your transactions or financial information, or your interactions, whether directly or indirectly (via cookies or other similar tools), including information from third parties, information gathered through your use of our website.</p>\r\n</div>\r\n<div class=\"info\">\r\n<h4 class=\"title\">limitation of our use of your personal information</h4>\r\n<ol>\r\n<li>To keep you up to date on all platform changes.</li>\r\n<li>Conduct market research and surveys to improve our products and services.</li>\r\n<li>Evaluate customer suitability for products and services.</li>\r\n<li>Know Your Customer (KYC) and Anti-Money Laundering (AML) assessment.</li>\r\n<li>To prevent, detect, investigate, and prosecute criminal activity.</li>\r\n<li>All services related to our relationships with you, such as administration and accounting, billing, and auditing, and other legal purposes.</li>\r\n<li>Create statistics about our users and our website&rsquo;s \'traffic.\' The data is anonymized when doing the statistics, and the user cannot be personally identified.</li>\r\n<li>Unless you unsubscribe, we may also use your information to keep you updated on related products and services.</li>\r\n</ol>\r\n</div>\r\n<div class=\"info\">\r\n<h4 class=\"title\">limitation of our sharing of your personal information</h4>\r\n<ol>\r\n<li>When we need to share your information to provide the requested service.</li>\r\n<li>When we need to send information to parties acting on our behalf to provide a service to you. We will only provide the information they need to deliver the service, and they are prohibited from using that information for any other purpose.</li>\r\n<li>When notifying you of the latest announcements, updates, news, or other information that may be of interest to you or additional information about us, whether via newsletters or the Platform.</li>\r\n<li>When you authorize us to share your information with others.</li>\r\n<li>We also may disclose your personal information if we are required to do so by law in the case of urgent situations to maintain individual or public safety or our site.</li>\r\n<li>To seek professional advice, including any legal process or (potential legal process), obtain legal advice, or establish, practice, or defend legal rights.</li>\r\n</ol>\r\n</div>\r\n<div class=\"info\">\r\n<h4 class=\"title\">Modifying the policy</h4>\r\n<p class=\"desc\">Blomal reserves the right to update this Privacy Policy at any time at its sole discretion. Therefore, it is recommended that you review them regularly.</p>\r\n</div>', '<div class=\"info\">\r\n<h4 class=\"title\"><span>سياسة الخصوصية</span></h4>\r\n<p class=\"desc\"><span>وضعت بلومال كابيتال هذه السياسة لضمان أعلى مستوى من الخصوصية والأمان لمعلوماتك الشخصية.&nbsp;يشرح المعايير والقواعد التي نتبعها عند جمع معلوماتك الشخصية واستخدامها والكشف عنها.&nbsp;يرجى أخذ الوقت الكافي لقراءة سياسة الخصوصية هذه بعناية.&nbsp;بمجرد إنشاء حساب على المنصة ، فإنك توافق على الشروط والأحكام وسياسة الخصوصية الخاصة بنا فيما يتعلق باستخدام بياناتك.&nbsp;تلتزم بلومال بحماية جميع حقوقك فيما يتعلق بالبيانات الشخصية المخزنة على نظامها أو اتباع سياسة الخصوصية الخاصة بها.</span></p>\r\n</div>\r\n<div class=\"info\">\r\n<h4 class=\"title\"><span>ماذا نعني بمعلوماتك الشخصية</span></h4>\r\n<p class=\"desc\"><span>تشمل المعلومات الشخصية جميع التفاصيل التي نحتفظ بها أو نجمعها عنك ، أو معاملاتك أو معلوماتك المالية ، أو تفاعلاتك ، سواء بشكل مباشر أو غير مباشر (عبر ملفات تعريف الارتباط أو غيرها من الأدوات المماثلة) ، بما في ذلك المعلومات من جهات خارجية ، والمعلومات التي تم جمعها من خلال استخدامك لموقعنا الإلكتروني.</span></p>\r\n</div>\r\n<div class=\"info\">\r\n<h4 class=\"title\"><span>تقييد استخدامنا لمعلوماتك الشخصية</span></h4>\r\n<ol>\r\n<li><span>لإبقائك على اطلاع دائم بجميع تغييرات النظام الأساسي.</span></li>\r\n<li><span>إجراء أبحاث السوق واستطلاعات الرأي لتحسين منتجاتنا وخدماتنا.</span></li>\r\n<li><span>تقييم مدى ملاءمة العملاء للمنتجات والخدمات.</span></li>\r\n<li><span>اعرف عميلك (KYC) وتقييم مكافحة غسيل الأموال (AML).</span></li>\r\n<li><span>لمنع النشاط الإجرامي وكشفه والتحقيق فيه ومقاضاته.</span></li>\r\n<li><span>جميع الخدمات المتعلقة بعلاقاتنا معك ، مثل الإدارة والمحاسبة والفواتير والتدقيق والأغراض القانونية الأخرى.</span></li>\r\n<li><span>قم بإنشاء إحصائيات حول مستخدمينا و \"حركة المرور\" على موقعنا.&nbsp;تكون البيانات مجهولة المصدر عند إجراء الإحصائيات ، ولا يمكن تحديد هوية المستخدم بشكل شخصي.</span></li>\r\n<li><span>ما لم تقم بإلغاء الاشتراك ، قد نستخدم معلوماتك أيضًا لإطلاعك على المنتجات والخدمات ذات الصلة.</span></li>\r\n</ol>\r\n</div>\r\n<div class=\"info\">\r\n<h4 class=\"title\"><span>تقييد مشاركتنا لمعلوماتك الشخصية</span></h4>\r\n<ol>\r\n<li><span>عندما نحتاج إلى مشاركة معلوماتك لتقديم الخدمة المطلوبة.</span></li>\r\n<li><span>عندما نحتاج إلى إرسال معلومات إلى الأطراف التي تعمل بالنيابة عنا لتقديم خدمة لك.&nbsp;سنقدم فقط المعلومات التي يحتاجونها لتقديم الخدمة ، ويحظر عليهم استخدام هذه المعلومات لأي غرض آخر.</span></li>\r\n<li><span>عند إخطارك بآخر الإعلانات أو التحديثات أو الأخبار أو المعلومات الأخرى التي قد تهمك أو معلومات إضافية عنا ، سواء عبر الرسائل الإخبارية أو المنصة.</span></li>\r\n<li><span>عندما تأذن لنا بمشاركة معلوماتك مع الآخرين.</span></li>\r\n<li><span>قد نكشف أيضًا عن معلوماتك الشخصية إذا طُلب منا ذلك بموجب القانون في حالة المواقف العاجلة للحفاظ على السلامة الفردية أو العامة أو موقعنا.</span></li>\r\n<li><span>لطلب المشورة المهنية ، بما في ذلك أي إجراء قانوني أو (إجراء قانوني محتمل) ، أو الحصول على مشورة قانونية ، أو إنشاء الحقوق القانونية أو ممارستها أو الدفاع عنها.</span></li>\r\n</ol>\r\n</div>\r\n<div class=\"info\">\r\n<h4 class=\"title\"><span>تعديل السياسة</span></h4>\r\n<p class=\"desc\"><span>تحتفظ شركة Blomal بالحق في تحديث سياسة الخصوصية هذه في أي وقت وفقًا لتقديرها الخاص.&nbsp;لذلك ، يوصى بمراجعتها بانتظام.</span></p>\r\n</div>', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, 1, NULL, '2023-05-29 09:05:02', '2023-06-08 09:27:27'),
(22, 'Disclosure policy', 'disclosure_policy', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '<div class=\"info\">\r\n<h4 class=\"title\">Disclosure Policy and protect clients from conflict of interest</h4>\r\n<p class=\"desc\">Within the responsibilities and duties of Blomal Company is developing a written and transparent policy for dealing with actual or potential conflicts of interest that could affect the performance of the members of the board of directors, the executive management, or other employees of the company when they deal with the company or with other stakeholders. It is required that this policy include the stipulated requirements in the Corporate Governance Regulations issued by the Authority and the Companies Law. In light of this, the board has developed a policy of conflict of interest and potential conflict cases.</p>\r\n</div>\r\n<div class=\"info\">\r\n<h4 class=\"title\">1-The goal of the policy</h4>\r\n<p class=\"desc\">The purpose of this policy is to set out the policies and procedures regulating conflicts of interest for: the company&rsquo;s shareholders, the board of directors, the company&rsquo;s committees, senior executives, employees, auditors, consultants, and other stakeholders as needed (together referred to in this Policy as &ldquo;Concerned Persons&rdquo;). This policy also aims to assist the \'Concerned Persons\' to deal with cases of conflict in accordance with legal requirements and in accordance with the objectives of accountability and transparency that the company applies in its operations.</p>\r\n</div>\r\n<div class=\"info\">\r\n<h4 class=\"title\">2-Overview</h4>\r\n<p class=\"desc\"><i>The purpose of this policy is to set out the policies and procedures regulating conflicts of interest for: the company&rsquo;s shareholders, the board of directors, the company&rsquo;s committees, senior executives, employees, auditors, consultants, and other stakeholders as needed (together referred to in this Policy as &ldquo;Concerned Persons&rdquo;). This policy also aims to assist the \'Concerned Persons\' to deal with cases of conflict in accordance with legal requirements and in accordance with the objectives of accountability and transparency that the company applies in its operations.</i></p>\r\n<ol>\r\n<li>When a concerned person uses his or her position on Blomal platform, information, or business opportunities that he or she obtains while working for the company to obtain personal benefits or to achieve the benefits of a third party.</li>\r\n<li>When a &ldquo;Concerned Person&rdquo; establishes a company that engages in a business similar to that of the company.</li>\r\n<li>When a &ldquo;concerned person&rdquo; such as a member of the board of directors in his field of work makes a decision or enters into a transaction or purchase for the benefit of a company in which he has an interest.</li>\r\n<li>When an employee and/or one of his or her relatives do any business for suppliers, sub-suppliers, or competitors.</li>\r\n<li>When a &ldquo;Concerned Person&rdquo; has a business or interests that may make it difficult for him to perform his work objectively and effectively for the company.</li>\r\n<li>When a Concerned Person, or a member of his or her family, receives illegal personal benefits because of his or her position in Blomal.</li>\r\n<li>Blomal and stakeholders must consider that the company&rsquo;s interest should be given priority in the event of a conflict of interest, according to the best available circumstances. The &ldquo;Concerned Persons&rdquo; shall also refrain from influencing the company&rsquo;s decisions in any action that creates a potential conflict of interest, including abstaining from voting on any decision or order that is subject to a potential conflict of interest, and to disclose any conflict of interest that arises due to their relationship with the company in accordance with the means and methods of disclosure determined by this policy and the relevant regulations in the Kingdom of Saudi Arabia.</li>\r\n<li>Nepotism or cronyism in the employment process in Blomal. In case a family member or a friend applies for a job, the concerned person must not mediate for their employment and must leave matters running according to the procedures and policies set by the company without direct or indirect influence or interference.</li>\r\n</ol>\r\n</div>\r\n<div class=\"info\">\r\n<h4 class=\"title\">3-Application of the policy</h4>\r\n<p class=\"desc\">This policy applies to the stakeholders listed below:</p>\r\n<ol>\r\n<li>Major shareholders of the company who own 5% or more of the company\'s capital.</li>\r\n<li>Members of the company\'s board of directors, committees, and advisors.</li>\r\n<li>Senior executives.</li>\r\n<li>Company employees.</li>\r\n<li>Members of investment committees in funds.</li>\r\n<li>Auditors and company advisors.</li>\r\n<li>Other stakeholders as the case may require.</li>\r\n</ol>\r\n</div>\r\n<div class=\"info\">\r\n<h4 class=\"title\">4-Case of conflict of interest</h4>\r\n<p class=\"desc\"><i>The stakeholders referred to in the above paragraph must refrain from dealing with the company or one of its subsidiaries (which falls within its group) in any business that could create a potential conflict of interest, except for what is in accordance with the rules included in this policy and the regulations and laws in force in the Kingdom. The conflict of interest is represented in the following:</i></p>\r\n</div>\r\n<div class=\"info\">\r\n<h4 class=\"title\">First: conflict of interest associated with major shareholders</h4>\r\n<ol>\r\n<li>All transactions and contracts made with major shareholders and their relatives who own 5% or more of the company&rsquo;s shares, directly or indirectly, or who have a controlling stake in any of its subsidiaries (which fall within its group) are subject to the same conditions as transactions with third parties.</li>\r\n</ol>\r\n</div>\r\n<div class=\"info\">\r\n<h4 class=\"title\">Second: conflict of interest related to the board of directors</h4>\r\n<p class=\"desc\">2- All transactions with major shareholders and their relatives who own 5% or more of the company\'s shares, directly or indirectly, or who own a controlling stake in any of its subsidiaries (which fall within its group) shall be disclosed according to the laws and regulations.</p>\r\n<ol class=\"ps-3\">\r\n<li>A member of the company&rsquo;s board of directors may not have any interest (direct or indirect) in the business and contracts made for the company.</li>\r\n<li>A member of the board of directors shall inform the board of his or her personal interest in the business and contracts that are made for the company. Such notification shall be recorded in the minutes of the meeting, and the interested member may not participate in voting on the decision issued in this regard.</li>\r\n</ol>\r\n</div>\r\n<div class=\"info\">\r\n<h4 class=\"title\">Third: conflicts of interest related to the exact it management and employees of the company</h4>\r\n<ul>\r\n<li>3. The Chairman of the board of directors shall be informed of the business and contracts in which any member of the board of directors has a personal interest. This shall be done after the board of directors has verified that the board member has competed with the company&rsquo;s business or is competing with it in one of the branches of activity that it exercises in accordance with the rules it approves, provided that these businesses are verified on an annual basis, and a special report from the chartered accountant (the external auditor) is attached to this notification.</li>\r\n<li>4. A member of the Board of Directors may not, in accordance with the regulations set by the competent authority, participate in any business that would compete with the company, or trade-in any of the branches of the activity in which he is engaged.</li>\r\n<li>5. When appointing financial and legal advisors, auditors, and members of investment committees in funds, the board should take into account the requirements of independence and cases of conflict of interest in accordance with the regulations issued by the Capital Market Authority. The following are included in the concept of participating in any business that would compete with the company or compete with the company in one of the branches of its activity:</li>\r\n</ul>\r\n<ol class=\"ps-3\">\r\n<li>When a member of the board of directors establishes a company or owns an influential percentage of shares in another company or facility that engages in an activity of the type of the company\'s or any of its groups.</li>\r\n<li>When a member accepts membership in the board of directors of a company competing with the company or its group.</li>\r\n<li>When a member obtains a commercial agency or the like, whether apparent or hidden, for a company or other facility competing with the company.</li>\r\n</ol>\r\n<p class=\"desc\">Any external work activity (related to work) carried out by any executive officer in the administration must be reported to the board of directors, and the board must approve it. It must also be disclosed in accordance with the laws and regulations in this regard. In the event that the executive officer or the employee wants to do this matter, he must submit the matter to the CEO of the company to be studied, evaluated, and make a recommendation regarding it to the company&rsquo;s board of directors in preparation for issuing the appropriate decision in this regard.</p>\r\n</div>\r\n<div class=\"info\">\r\n<h4 class=\"title\">Fourth: conflicts of interest related to external and internal auditors and Consultants</h4>\r\n<ol>\r\n<li>The company\'s external auditors must be independent.</li>\r\n<li>The internal auditor&rsquo;s independence should be maintained, and adequate support should be provided to him or her to carry out the internal audit work, provided that the internal auditor reports functionally to the audit committee and administratively to the company&rsquo;s management.</li>\r\n<li>When appointing any financial or legal advisor or external auditor, consideration should be given to cases of conflict of interest and what is stipulated in the laws issued by the regulatory authorities in this regard.</li>\r\n</ol>\r\n</div>\r\n<div class=\"info\">\r\n<h4 class=\"title\">Fifth: conflict of interest related to other stakeholders</h4>\r\n<p class=\"desc\">All transactions and contracts made with suppliers and other customers of the company are subject to the same conditions as transactions with third parties in terms of evaluation, fairness of implementation, disclosure, or notification.</p>\r\n</div>\r\n<div class=\"info\">\r\n<h4 class=\"title\">Sixth: additional provisions</h4>\r\n<ol>\r\n<li>Members of the board of directors, committees, and employees are prohibited from exploiting or benefiting from any of the company\'s assets, information, or investment opportunities offered to them or to the company to achieve any personal interest or any other purpose that does not fall within the activities of Blomal. That includes investment opportunities that fall within the company\'s activities or which the company wants to benefit from. The prohibition applies to the board member who resigns in order to take advantage of investment opportunities - directly or indirectly - which the company wants to take advantage of and which he or she learned about during his membership in the board of directors.</li>\r\n<li>A member of the board of directors is prohibited from voting on the board of directors&rsquo; resolution in the business and contracts that are done for the company&rsquo;s account if he or she has a direct or indirect interest in them.</li>\r\n<li>It is not permissible for any of the members of the board of directors and senior executives to accept gifts from any person who has commercial dealings with the company if such gifts would lead to a conflict of interest. However, symbolic gifts whose value does not exceed 1000 SAR can be accepted.</li>\r\n<li>When a member of the board of directors or a member of the fund committee raises the possibility of a conflict of interest, that member shall abide by the following:</li>\r\n</ol>\r\n</div>\r\n<div class=\"info\">\r\n<h4 class=\"title\">5-Confidentiality</h4>\r\n<ol>\r\n<li>Not to participate in discussions or listen to the discussions of the board or the committee on the subject in which has an interest, with the exception of answering questions or disclosing essential facts.</li>\r\n<li>Refrain from voting on decisions after notifying the board. In all cases, when the board votes on a topic in which a board member has an interest, the voting process must be conducted in secret.</li>\r\n</ol>\r\n</div>\r\n<div class=\"info\">\r\n<h4 class=\"title\">6-Disclosure of conflict of interest</h4>\r\n<ol>\r\n<li>Maintaining confidentiality of information related to the company and its activities and abstaining from disclosing it to any person or entity.</li>\r\n<li>Members of the board of directors are not allowed to divulge the company\'s secrets they have come across. They may not use what they know by virtue of their membership to achieve an interest for themselves, one of their relatives, or others. Otherwise, they must be isolated and demanded compensation.</li>\r\n</ol>\r\n<p class=\"smallP\">All members of the company\'s board of directors and employees are obligated to disclose and report their following personal interests immediately:</p>\r\n<ol>\r\n<li>Any interest in an investment or ownership in a business or facility that has an interest or provides any service to any of the company&rsquo;s subsidiaries or receives any interest from the company.</li>\r\n<li>A commercial activity or facility that performs a specific service or seeks to perform a service with any of the company\'s subsidiaries, such as banks, media outlets, or others.</li>\r\n<li>Any interest with a customer, client, or any other facility that receives a service or any benefit from the company.</li>\r\n<li>A business, a client, or any other facility that is able to benefit from any actions taken by a member of the board of directors or an employee.</li>\r\n<li>The direct and indirect interests of a member of the board of directors, senior executives, the secretary of the board of directors, and any of their relatives.</li>\r\n<li>Summary of current or proposed employment contracts for board members, CEO, and senior executives with the company.</li>\r\n<li>Full details of any contract or arrangement in which the CEO, a member of the board of directors, or any relative of these parties has a fundamental interest in and is essential to the company\'s business. Otherwise, submission of a statement to negate that is required.</li>\r\n</ol>\r\n</div>\r\n<div class=\"info\">\r\n<h4 class=\"title\">7-Supervision of the applications and cases of policy violation</h4>\r\n<p class=\"desc\">The Audit Committee supervises the implementation of this policy by reviewing cases, transactions, and contracts that take place with stakeholders or that may involve a case of conflict of interest and submitting any recommendations it deems appropriate to the board of directors. In addition, any violation of this policy is reported per the procedures specified in the (whistle-blowing policy), the policy of regulating the relationship with stakeholders, and the grievance policy.</p>\r\n</div>\r\n<div class=\"info\">\r\n<h4 class=\"title\">8-Review and amending this policy</h4>\r\n<p class=\"desc\">This policy shall be implemented as of the date of its approval by the board of directors, and the board shall review this policy periodically as necessary. This policy shall not be modified except with the approval of the board.</p>\r\n</div>\r\n<div class=\"info\">\r\n<h4 class=\"title\">9-Publication</h4>\r\n<p class=\"desc\">This policy is published on the company\'s website in order to enable the relevant parties to view this policy or through any other means of publication deemed by the board of directors.</p>\r\n</div>', '<div class=\"info\">\r\n<h4 class=\"title\"><span>سياسة الإفصاح وحماية العملاء من تضارب المصالح</span></h4>\r\n<p class=\"desc\"><span>ضمن مسؤوليات وواجبات شركة بلومال ، يتم تطوير سياسة مكتوبة وشفافة للتعامل مع تضارب المصالح الفعلي أو المحتمل الذي قد يؤثر على أداء أعضاء مجلس الإدارة أو الإدارة التنفيذية أو غيرهم من موظفي الشركة عندما التعامل مع الشركة أو مع أصحاب المصلحة الآخرين.&nbsp;يشترط أن تتضمن هذه السياسة المتطلبات المنصوص عليها في لائحة حوكمة الشركات الصادرة عن الهيئة وقانون الشركات.&nbsp;في ضوء ذلك ، طور مجلس الإدارة سياسة تضارب المصالح وحالات التعارض المحتملة.</span></p>\r\n</div>\r\n<div class=\"info\">\r\n<h4 class=\"title\"><span>1-الهدف من السياسة</span></h4>\r\n<p class=\"desc\"><span>الغرض من هذه السياسة هو تحديد السياسات والإجراءات التي تنظم تضارب المصالح لكل من: مساهمي الشركة ، ومجلس الإدارة ، ولجان الشركة ، وكبار المسؤولين التنفيذيين ، والموظفين ، والمراجعين ، والاستشاريين ، وأصحاب المصلحة الآخرين حسب الحاجة (يشار إليهم معًا. في هذه السياسة باسم \"الأشخاص المعنيين\").&nbsp;تهدف هذه السياسة أيضًا إلى مساعدة \"الأشخاص المعنيين\" للتعامل مع حالات النزاع وفقًا للمتطلبات القانونية ووفقًا لأهداف المساءلة والشفافية التي تطبقها الشركة في عملياتها.</span></p>\r\n</div>\r\n<div class=\"info\">\r\n<h4 class=\"title\"><span>2-نظرة عامة</span></h4>\r\n<p class=\"desc\"><i><span>الغرض من هذه السياسة هو تحديد السياسات والإجراءات التي تنظم تضارب المصالح لكل من: مساهمي الشركة ، ومجلس الإدارة ، ولجان الشركة ، وكبار المسؤولين التنفيذيين ، والموظفين ، والمراجعين ، والاستشاريين ، وأصحاب المصلحة الآخرين حسب الحاجة (يشار إليهم معًا. في هذه السياسة باسم \"الأشخاص المعنيين\").&nbsp;تهدف هذه السياسة أيضًا إلى مساعدة \"الأشخاص المعنيين\" للتعامل مع حالات النزاع وفقًا للمتطلبات القانونية ووفقًا لأهداف المساءلة والشفافية التي تطبقها الشركة في عملياتها.</span></i></p>\r\n<ol>\r\n<li><span>عندما يستخدم شخص معني منصبه على منصة Blomal أو المعلومات أو الفرص التجارية التي يحصل عليها أثناء العمل في الشركة للحصول على منافع شخصية أو لتحقيق مزايا طرف ثالث.</span></li>\r\n<li><span>عندما يؤسس \"الشخص المعني\" شركة تمارس نشاطًا تجاريًا مشابهًا لأعمال الشركة.</span></li>\r\n<li><span>عندما يتخذ \"شخص معني\" مثل أحد أعضاء مجلس الإدارة في مجال عمله قرارًا أو يدخل في صفقة أو شراء لصالح شركة له مصلحة فيها.</span></li>\r\n<li><span>عندما يقوم موظف و / أو أحد أقاربه أو أقاربه بأي عمل تجاري للموردين أو الموردين الفرعيين أو المنافسين.</span></li>\r\n<li><span>عندما يكون لدى \"الشخص المعني\" عمل أو مصالح قد تجعل من الصعب عليه أداء عمله بموضوعية وفعالية للشركة.</span></li>\r\n<li><span>عندما يتلقى الشخص المعني أو أحد أفراد أسرته مزايا شخصية غير قانونية بسبب منصبه في بلومال.</span></li>\r\n<li><span>يجب أن تأخذ بلومال وأصحاب المصلحة في الاعتبار أنه يجب إعطاء مصلحة الشركة الأولوية في حالة تضارب المصالح ، وفقًا لأفضل الظروف المتاحة.&nbsp;يجب على \"الأشخاص المعنيين\" أيضًا الامتناع عن التأثير على قرارات الشركة في أي إجراء يؤدي إلى تضارب محتمل في المصالح ، بما في ذلك الامتناع عن التصويت على أي قرار أو أمر يخضع لتضارب محتمل في المصالح ، والإفصاح عن أي تضارب في المصالح. التي تنشأ بسبب علاقتهم بالشركة وفقًا لوسائل وطرق الإفصاح التي تحددها هذه السياسة والأنظمة ذات الصلة في المملكة العربية السعودية.</span></li>\r\n<li><span>المحسوبية أو المحسوبية في عملية التوظيف في بلومال.&nbsp;في حالة تقدم أحد أفراد العائلة أو أحد الأصدقاء للحصول على وظيفة ، يجب على الشخص المعني عدم التوسط في توظيفه ويجب أن يترك الأمور تسير وفقًا للإجراءات والسياسات التي تضعها الشركة دون تأثير أو تدخل مباشر أو غير مباشر.</span></li>\r\n</ol>\r\n</div>\r\n<div class=\"info\">\r\n<h4 class=\"title\"><span>3-تطبيق السياسة</span></h4>\r\n<p class=\"desc\"><span>تنطبق هذه السياسة على أصحاب المصلحة المذكورين أدناه:</span></p>\r\n<ol>\r\n<li><span>كبار المساهمين في الشركة الذين يمتلكون 5٪ أو أكثر من رأس مال الشركة.</span></li>\r\n<li><span>أعضاء مجلس إدارة الشركة واللجان والمستشارين.</span></li>\r\n<li><span>كبار المسؤولين التنفذيين.</span></li>\r\n<li><span>موظفين شركه.</span></li>\r\n<li><span>أعضاء لجان الاستثمار في الصناديق.</span></li>\r\n<li><span>المدققون ومستشارو الشركة.</span></li>\r\n<li><span>أصحاب المصلحة الآخرين حسب مقتضى الحال.</span></li>\r\n</ol>\r\n</div>\r\n<div class=\"info\">\r\n<h4 class=\"title\"><span>4-حالة تضارب المصالح</span></h4>\r\n<p class=\"desc\"><i><span>يجب على أصحاب المصلحة المشار إليهم في الفقرة أعلاه الامتناع عن التعامل مع الشركة أو إحدى الشركات التابعة لها (التي تقع ضمن مجموعتها) في أي عمل يمكن أن يؤدي إلى تضارب محتمل في المصالح ، باستثناء ما يتوافق مع القواعد المدرجة في هذه السياسة والأنظمة والقوانين المعمول بها في المملكة.&nbsp;يتمثل تضارب المصالح في الآتي:</span></i></p>\r\n</div>\r\n<div class=\"info\">\r\n<h4 class=\"title\"><span>أولاً: تضارب المصالح المرتبط بكبار المساهمين</span></h4>\r\n<ol>\r\n<li><span>تخضع جميع المعاملات والعقود المبرمة مع كبار المساهمين وأقاربهم الذين يمتلكون 5٪ أو أكثر من أسهم الشركة ، بشكل مباشر أو غير مباشر ، أو الذين لديهم حصة مسيطرة في أي من الشركات التابعة لها (التي تقع ضمن مجموعتها) لنفس الشروط كمعاملات مع أطراف ثالثة.</span></li>\r\n</ol>\r\n</div>\r\n<div class=\"info\">\r\n<h4 class=\"title\"><span>ثانياً: تضارب المصالح المتعلق بمجلس الإدارة</span></h4>\r\n<p class=\"desc\"><span>2- يجب الإفصاح عن جميع المعاملات مع كبار المساهمين وأقاربهم الذين يمتلكون 5٪ أو أكثر من أسهم الشركة ، بشكل مباشر أو غير مباشر ، أو الذين يمتلكون حصة مسيطرة في أي من شركاتها التابعة (التي تقع ضمن مجموعتها) وفقًا للقوانين. واللوائح.</span></p>\r\n<ol class=\"ps-3\">\r\n<li><span>قد لا يكون لعضو مجلس إدارة الشركة أي مصلحة (مباشرة أو غير مباشرة) في الأعمال والعقود المبرمة للشركة.</span></li>\r\n<li><span>يجب على عضو مجلس الإدارة إبلاغ المجلس بمصلحته الشخصية في الأعمال والعقود التي تتم لصالح الشركة.&nbsp;ويدون هذا الإخطار في محضر الاجتماع ، ولا يجوز للعضو المعني المشاركة في التصويت على القرار الصادر بهذا الشأن.</span></li>\r\n</ol>\r\n</div>\r\n<div class=\"info\">\r\n<h4 class=\"title\"><span>ثالثاً: تضارب المصالح المتعلقة بالتحديد بإدارة وموظفي الشركة</span></h4>\r\n<ul>\r\n<li><span>3. يجب إبلاغ رئيس مجلس الإدارة بالأعمال والعقود التي يكون لأي عضو من أعضاء مجلس الإدارة مصلحة شخصية فيها.&nbsp;يتم ذلك بعد أن يتحقق مجلس الإدارة من تنافس عضو مجلس الإدارة مع أعمال الشركة أو منافستها في أحد فروع النشاط التي تمارسها وفقًا للقواعد التي يعتمدها ، بشرط التحقق من هذه الأعمال. على أساس سنوي ، ويرفق بهذا الإخطار تقرير خاص من المحاسب القانوني (المدقق الخارجي).</span></li>\r\n<li><span>4. لا يجوز لعضو مجلس الإدارة ، وفقًا للوائح التي تضعها السلطة المختصة ، المشاركة في أي عمل من شأنه منافسة الشركة ، أو المتاجرة في أي فرع من فروع النشاط الذي يمارسه. .</span></li>\r\n<li><span>5. عند تعيين المستشارين الماليين والقانونيين ومراجعي الحسابات وأعضاء لجان الاستثمار في الصناديق ، يجب على مجلس الإدارة مراعاة متطلبات الاستقلالية وحالات تضارب المصالح وفقاً للأنظمة الصادرة عن هيئة السوق المالية.&nbsp;يتم تضمين ما يلي في مفهوم المشاركة في أي عمل من شأنه منافسة الشركة أو منافسة الشركة في أحد فروع نشاطها:</span></li>\r\n</ul>\r\n<ol class=\"ps-3\">\r\n<li><span>عندما يؤسس عضو مجلس الإدارة شركة أو يمتلك نسبة مؤثرة من الأسهم في شركة أو منشأة أخرى تزاول نشاطًا من نوع الشركة أو أي من مجموعاتها.</span></li>\r\n<li><span>عندما يقبل عضو العضوية في مجلس إدارة شركة تتنافس مع الشركة أو مجموعتها.</span></li>\r\n<li><span>عندما يحصل العضو على وكالة تجارية أو ما في حكمها سواء كانت ظاهرة أو خفية لشركة أو منشأة أخرى منافسة للشركة.</span></li>\r\n</ol>\r\n<p class=\"desc\"><span>يجب إبلاغ مجلس الإدارة بأي نشاط عمل خارجي (متعلق بالعمل) يقوم به أي مسؤول تنفيذي في الإدارة ، ويجب على المجلس الموافقة عليه.&nbsp;كما يجب الإفصاح عنها وفقًا للقوانين والأنظمة الخاصة بهذا الشأن.&nbsp;في حالة رغبة المدير التنفيذي أو الموظف في القيام بهذا الأمر ، يجب عليه رفع الأمر إلى الرئيس التنفيذي للشركة لدراسته وتقييمه وتقديم التوصية بشأنه إلى مجلس إدارة الشركة تمهيدًا لإصداره. القرار المناسب في هذا الصدد.</span></p>\r\n</div>\r\n<div class=\"info\">\r\n<h4 class=\"title\"><span>رابعاً: تضارب المصالح المتعلقة بالمراجعين والمستشارين الخارجيين والداخليين</span></h4>\r\n<ol>\r\n<li><span>يجب أن يكون المدققون الخارجيون للشركة مستقلين.</span></li>\r\n<li><span>يجب الحفاظ على استقلالية المدقق الداخلي ، ويجب تقديم الدعم الكافي له أو لها للقيام بأعمال التدقيق الداخلي ، شريطة أن يقدم المدقق الداخلي تقارير وظيفية إلى لجنة التدقيق وإداريًا إلى إدارة الشركة.</span></li>\r\n<li><span>عند تعيين أي مستشار مالي أو قانوني أو مراجع خارجي ، يجب مراعاة حالات تضارب المصالح وما نصت عليه القوانين الصادرة عن الجهات الرقابية في هذا الشأن.</span></li>\r\n</ol>\r\n</div>\r\n<div class=\"info\">\r\n<h4 class=\"title\"><span>خامساً: تضارب المصالح الخاص بأصحاب المصلحة الآخرين</span></h4>\r\n<p class=\"desc\"><span>تخضع جميع المعاملات والعقود المبرمة مع الموردين والعملاء الآخرين للشركة لنفس الشروط مثل المعاملات مع الأطراف الثالثة من حيث التقييم ، وعدالة التنفيذ ، والإفصاح ، أو الإخطار.</span></p>\r\n</div>\r\n<div class=\"info\">\r\n<h4 class=\"title\"><span>سادساً: أحكام إضافية</span></h4>\r\n<ol>\r\n<li><span>يحظر على أعضاء مجلس الإدارة واللجان والموظفين استغلال أو الاستفادة من أي من أصول الشركة أو معلوماتها أو فرص الاستثمار المعروضة عليهم أو للشركة لتحقيق أي مصلحة شخصية أو أي غرض آخر لا يقع ضمن أنشطة بلومال.&nbsp;ويشمل ذلك الفرص الاستثمارية التي تندرج ضمن أنشطة الشركة أو التي ترغب الشركة في الاستفادة منها.&nbsp;ينطبق الحظر على عضو مجلس الإدارة الذي يستقيل من أجل الاستفادة من فرص الاستثمار - بشكل مباشر أو غير مباشر - التي ترغب الشركة في الاستفادة منها والتي علم بها أثناء عضويته في مجلس الإدارة.</span></li>\r\n<li><span>يحظر على عضو مجلس الإدارة التصويت على قرار مجلس الإدارة في الأعمال والعقود التي تتم لحساب الشركة إذا كانت له مصلحة مباشرة أو غير مباشرة فيها.</span></li>\r\n<li><span>لا يجوز لأي من أعضاء مجلس الإدارة وكبار التنفيذيين قبول الهدايا من أي شخص له تعاملات تجارية مع الشركة إذا كانت هذه الهدايا ستؤدي إلى تضارب في المصالح.&nbsp;ومع ذلك ، يمكن قبول الهدايا الرمزية التي لا تتجاوز قيمتها 1000 ريال سعودي.</span></li>\r\n<li><span>عندما يثير أحد أعضاء مجلس الإدارة أو أحد أعضاء لجنة الصندوق احتمال وجود تضارب في المصالح ، يلتزم ذلك العضو بما يلي:</span></li>\r\n</ol>\r\n</div>\r\n<div class=\"info\">\r\n<h4 class=\"title\"><span>5- السرية</span></h4>\r\n<ol>\r\n<li><span>عدم المشاركة في المناقشات أو الاستماع إلى مناقشات مجلس الإدارة أو اللجنة حول الموضوع الذي له مصلحة ، باستثناء الإجابة على الأسئلة أو الكشف عن الحقائق الأساسية.</span></li>\r\n<li><span>الامتناع عن التصويت على القرارات بعد إخطار المجلس.&nbsp;في جميع الحالات ، عندما يصوت المجلس على موضوع له مصلحة فيه ، يجب أن تتم عملية التصويت في السر.</span></li>\r\n</ol>\r\n</div>\r\n<div class=\"info\">\r\n<h4 class=\"title\"><span>6- الإفصاح عن تضارب المصالح</span></h4>\r\n<ol>\r\n<li><span>المحافظة على سرية المعلومات المتعلقة بالشركة وأنشطتها وعدم إفشاءها لأي شخص أو جهة.</span></li>\r\n<li><span>لا يُسمح لأعضاء مجلس الإدارة بالكشف عن أسرار الشركة التي عثروا عليها.&nbsp;لا يجوز لهم استخدام ما يعرفونه بحكم عضويتهم لتحقيق مصلحة لأنفسهم أو لأحد أقاربهم أو غيرهم.&nbsp;خلاف ذلك ، يجب عزلهم والمطالبة بالتعويض.</span></li>\r\n</ol>\r\n<p class=\"smallP\"><span>يلتزم جميع أعضاء مجلس إدارة الشركة والموظفين بالإفصاح عن مصالحهم الشخصية التالية والإبلاغ عنها على الفور:</span></p>\r\n<ol>\r\n<li><span>أي مصلحة في استثمار أو ملكية في عمل أو منشأة لها مصلحة أو تقدم أي خدمة لأي من الشركات التابعة للشركة أو تتلقى أي مصلحة من الشركة.</span></li>\r\n<li><span>نشاط أو منشأة تجارية تؤدي خدمة معينة أو تسعى إلى أداء خدمة مع أي من الشركات التابعة للشركة مثل البنوك أو وسائل الإعلام أو غيرها.</span></li>\r\n<li><span>أي مصلحة مع عميل أو عميل أو أي منشأة أخرى تتلقى خدمة أو أي منفعة من الشركة.</span></li>\r\n<li><span>شركة أو عميل أو أي منشأة أخرى قادرة على الاستفادة من أي إجراءات يتخذها عضو مجلس الإدارة أو أحد الموظفين.</span></li>\r\n<li><span>المصالح المباشرة وغير المباشرة لعضو مجلس الإدارة وكبار التنفيذيين وأمين سر مجلس الإدارة وأي من أقاربهم.</span></li>\r\n<li><span>ملخص عقود العمل الحالية أو المقترحة لأعضاء مجلس الإدارة والرئيس التنفيذي وكبار المديرين التنفيذيين في الشركة.</span></li>\r\n<li><span>التفاصيل الكاملة لأي عقد أو ترتيب يكون فيه للرئيس التنفيذي أو أحد أعضاء مجلس الإدارة أو أي قريب من هذه الأطراف مصلحة أساسية في أعمال الشركة وهو أمر ضروري.&nbsp;خلاف ذلك ، تقديم بيان لنفي ذلك مطلوب.</span></li>\r\n</ol>\r\n</div>\r\n<div class=\"info\">\r\n<h4 class=\"title\"><span>7- الإشراف على الطلبات وحالات مخالفة السياسة</span></h4>\r\n<p class=\"desc\"><span>تشرف لجنة المراجعة على تنفيذ هذه السياسة من خلال مراجعة الحالات والمعاملات والعقود التي تتم مع أصحاب المصلحة أو التي قد تنطوي على حالة تضارب في المصالح وتقديم أي توصيات تراها مناسبة إلى مجلس الإدارة.&nbsp;بالإضافة إلى ذلك ، يتم الإبلاغ عن أي انتهاك لهذه السياسة وفقًا للإجراءات المحددة في (سياسة الإبلاغ عن المخالفات) ، وسياسة تنظيم العلاقة مع أصحاب المصلحة ، وسياسة التظلم.</span></p>\r\n</div>\r\n<div class=\"info\">\r\n<h4 class=\"title\"><span>8-مراجعة وتعديل هذه السياسة</span></h4>\r\n<p class=\"desc\"><span>يتم تنفيذ هذه السياسة اعتبارًا من تاريخ اعتمادها من قبل مجلس الإدارة ، وعلى المجلس مراجعة هذه السياسة بشكل دوري حسب الضرورة.&nbsp;لا يجوز تعديل هذه السياسة إلا بموافقة المجلس.</span></p>\r\n</div>\r\n<div class=\"info\">\r\n<h4 class=\"title\"><span>9- النشر</span></h4>\r\n<p class=\"desc\"><span>يتم نشر هذه السياسة على موقع الشركة على الإنترنت من أجل تمكين الأطراف ذات الصلة من الاطلاع على هذه السياسة أو من خلال أي وسيلة نشر أخرى يراها مجلس الإدارة.</span></p>\r\n</div>', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, 1, NULL, '2023-05-29 09:05:02', '2023-06-08 10:20:53');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `guard_name` varchar(191) NOT NULL,
  `group_name` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `group_name`, `created_at`, `updated_at`) VALUES
(1, 'dashboard.view', 'admin', 'dashboard', '2023-05-23 07:07:28', '2023-05-23 07:07:28'),
(2, 'settings.view', 'admin', 'settings', '2023-05-23 07:07:28', '2023-05-23 07:07:28'),
(3, 'settings.edit', 'admin', 'settings', '2023-05-23 07:07:28', '2023-05-23 07:07:28'),
(4, 'permission.view', 'admin', 'permission', '2023-05-23 07:07:28', '2023-05-23 07:07:28'),
(5, 'permission.create', 'admin', 'permission', '2023-05-23 07:07:28', '2023-05-23 07:07:28'),
(6, 'permission.edit', 'admin', 'permission', '2023-05-23 07:07:28', '2023-05-23 07:07:28'),
(7, 'permission.delete', 'admin', 'permission', '2023-05-23 07:07:28', '2023-05-23 07:07:28'),
(8, 'admin.view', 'admin', 'admin', '2023-05-23 07:07:28', '2023-05-23 07:07:28'),
(9, 'admin.create', 'admin', 'admin', '2023-05-23 07:07:28', '2023-05-23 07:07:28'),
(10, 'admin.edit', 'admin', 'admin', '2023-05-23 07:07:28', '2023-05-23 07:07:28'),
(11, 'admin.delete', 'admin', 'admin', '2023-05-23 07:07:28', '2023-05-23 07:07:28'),
(12, 'admin_profile.view', 'admin', 'admin_profile', '2023-05-23 07:07:28', '2023-05-23 07:07:28'),
(13, 'admin_profile.edit', 'admin', 'admin_profile', '2023-05-23 07:07:28', '2023-05-23 07:07:28'),
(14, 'role.view', 'admin', 'role_manage', '2023-05-23 07:07:28', '2023-05-23 07:07:28'),
(15, 'role.create', 'admin', 'role_manage', '2023-05-23 07:07:28', '2023-05-23 07:07:28'),
(16, 'role.edit', 'admin', 'role_manage', '2023-05-23 07:07:28', '2023-05-23 07:07:28'),
(17, 'role.delete', 'admin', 'role_manage', '2023-05-23 07:07:28', '2023-05-23 07:07:28'),
(18, 'user.view', 'admin', 'user', '2023-05-23 07:07:28', '2023-05-23 07:07:28'),
(19, 'user.create', 'admin', 'user', '2023-05-23 07:07:28', '2023-05-23 07:07:28'),
(20, 'user.edit', 'admin', 'user', '2023-05-23 07:07:28', '2023-05-23 07:07:28'),
(21, 'user.delete', 'admin', 'user', '2023-05-23 07:07:28', '2023-05-23 07:07:28'),
(22, 'category.view', 'admin', 'category', '2023-05-23 07:07:28', '2023-05-23 07:07:28'),
(23, 'category.create', 'admin', 'category', '2023-05-23 07:07:28', '2023-05-23 07:07:28'),
(24, 'category.edit', 'admin', 'category', '2023-05-23 07:07:28', '2023-05-23 07:07:28'),
(25, 'category.delete', 'admin', 'category', '2023-05-23 07:07:28', '2023-05-23 07:07:28'),
(26, 'page.view', 'admin', 'page', '2023-05-23 07:07:28', '2023-05-23 07:07:28'),
(27, 'page.create', 'admin', 'page', '2023-05-23 07:07:28', '2023-05-23 07:07:28'),
(28, 'page.edit', 'admin', 'page', '2023-05-23 07:07:28', '2023-05-23 07:07:28'),
(29, 'page.delete', 'admin', 'page', '2023-05-23 07:07:28', '2023-05-23 07:07:28'),
(30, 'service.view', 'admin', 'service', '2023-05-23 07:07:28', '2023-05-23 07:07:28'),
(31, 'service.create', 'admin', 'service', '2023-05-23 07:07:28', '2023-05-23 07:07:28'),
(32, 'service.edit', 'admin', 'service', '2023-05-23 07:07:28', '2023-05-23 07:07:28'),
(33, 'service.delete', 'admin', 'service', '2023-05-23 07:07:28', '2023-05-23 07:07:28'),
(34, 'booking_request.view', 'admin', 'booking_request', '2023-05-23 07:07:28', '2023-05-23 07:07:28'),
(35, 'booking_request.edit', 'admin', 'booking_request', '2023-05-23 07:07:28', '2023-05-23 07:07:28'),
(36, 'booking_request.delete', 'admin', 'booking_request', '2023-05-23 07:07:28', '2023-05-23 07:07:28'),
(37, 'faq.view', 'admin', 'faq', '2023-05-23 07:07:28', '2023-05-23 07:07:28'),
(38, 'faq.create', 'admin', 'faq', '2023-05-23 07:07:28', '2023-05-23 07:07:28'),
(39, 'faq.edit', 'admin', 'faq', '2023-05-23 07:07:28', '2023-05-23 07:07:28'),
(40, 'faq.delete', 'admin', 'faq', '2023-05-23 07:07:28', '2023-05-23 07:07:28'),
(41, 'slider.view', 'admin', 'slider', '2023-05-23 07:07:28', '2023-05-23 07:07:28'),
(42, 'slider.create', 'admin', 'slider', '2023-05-23 07:07:28', '2023-05-23 07:07:28'),
(43, 'slider.edit', 'admin', 'slider', '2023-05-23 07:07:28', '2023-05-23 07:07:28'),
(44, 'slider.delete', 'admin', 'slider', '2023-05-23 07:07:28', '2023-05-23 07:07:28'),
(45, 'tracking.view', 'admin', 'tracking', '2023-05-23 07:07:28', '2023-05-23 07:07:28'),
(46, 'tracking.delete', 'admin', 'tracking', '2023-05-23 07:07:28', '2023-05-23 07:07:28'),
(47, 'email_notification.view', 'admin', 'notifications', '2023-05-23 07:07:28', '2023-05-23 07:07:28'),
(48, 'email_notification.edit', 'admin', 'notifications', '2023-05-23 07:07:28', '2023-05-23 07:07:28'),
(49, 'email_message.view', 'admin', 'notifications', '2023-05-23 07:07:28', '2023-05-23 07:07:28'),
(50, 'email_message.edit', 'admin', 'notifications', '2023-05-23 07:07:28', '2023-05-23 07:07:28'),
(51, 'contact.view', 'admin', 'contacts', '2023-05-23 07:07:28', '2023-05-23 07:07:28'),
(52, 'contact.create', 'admin', 'contacts', '2023-05-23 07:07:28', '2023-05-23 07:07:28'),
(53, 'module.view', 'admin', 'module', '2023-05-23 07:07:28', '2023-05-23 07:07:28'),
(54, 'module.create', 'admin', 'module', '2023-05-23 07:07:28', '2023-05-23 07:07:28'),
(55, 'module.edit', 'admin', 'module', '2023-05-23 07:07:28', '2023-05-23 07:07:28'),
(56, 'module.delete', 'admin', 'module', '2023-05-23 07:07:28', '2023-05-23 07:07:28'),
(57, 'module.toggle', 'admin', 'module', '2023-05-23 07:07:28', '2023-05-23 07:07:28');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `guard_name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Subscriber', 'admin', '2023-05-23 07:07:28', '2023-05-23 07:07:28'),
(2, 'Admin', 'admin', '2023-05-23 07:07:28', '2023-05-23 07:07:28'),
(3, 'Editor', 'admin', '2023-05-23 07:07:28', '2023-05-23 07:07:28'),
(4, 'Super Admin', 'admin', '2023-05-23 07:07:28', '2023-05-23 07:07:28');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 2),
(1, 3),
(1, 4),
(2, 4),
(3, 4),
(4, 4),
(5, 4),
(6, 4),
(7, 4),
(8, 4),
(9, 4),
(10, 4),
(11, 4),
(12, 2),
(12, 4),
(13, 2),
(13, 4),
(14, 4),
(15, 4),
(16, 4),
(17, 4),
(18, 2),
(18, 4),
(19, 2),
(19, 4),
(20, 2),
(20, 4),
(21, 2),
(21, 4),
(22, 3),
(22, 4),
(23, 3),
(23, 4),
(24, 3),
(24, 4),
(25, 3),
(25, 4),
(26, 2),
(26, 3),
(26, 4),
(27, 2),
(27, 3),
(27, 4),
(28, 2),
(28, 3),
(28, 4),
(29, 2),
(29, 3),
(29, 4),
(30, 3),
(30, 4),
(31, 3),
(31, 4),
(32, 3),
(32, 4),
(33, 3),
(33, 4),
(34, 3),
(34, 4),
(35, 3),
(35, 4),
(36, 3),
(36, 4),
(37, 2),
(37, 4),
(38, 4),
(39, 4),
(40, 4),
(41, 4),
(42, 4),
(43, 4),
(44, 4),
(45, 4),
(46, 4),
(47, 4),
(48, 4),
(49, 4),
(50, 4),
(51, 4),
(52, 4),
(53, 2),
(53, 4),
(54, 2),
(54, 4),
(55, 2),
(55, 4),
(56, 2),
(56, 4),
(57, 2),
(57, 4);

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `description` text NOT NULL,
  `meta_description` text DEFAULT NULL,
  `image` varchar(191) DEFAULT NULL,
  `banner_image` varchar(191) DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'Null if page has no category',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=>active, 0=>inactive',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `title`, `slug`, `description`, `meta_description`, `image`, `banner_image`, `category_id`, `status`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`, `created_at`, `updated_at`) VALUES
(1, 'Laptop/Macbook Repair', 'laptop-macbook-repair', 'In present day time almost every individual works on the laptop, no matter you are a college student, working professional or a businessman. With technological advancements, there are many new ranges and features of laptops seen coming up on the market, but like any other electronic goods, it too needs maintenance and repair. We brings for you customized solution to repair laptops anytime around the country. Our team has enough experience at the back, and they can help repairing any simple or complex laptop problems at ease.\n                    <br />\n                    We are popular for fast and friendly service, call us anytime, and we will offer laptop services on your doorstep. We are popular because of our customer friendly attitude and quick turnaround time. Apart from that, we offer an affordable solution for all your laptop repairing services. With We, you can find all original and genuine laptop parts and accessories. Our team is reachable around the clock, and we will make sure your device is functioning in quickest possible time.\n                    <br />\n                    Many clients around the country introduce us as \"laptop specialist\" and its all because of our dedication and professional in solving all problems at ease. We are presently reputed and popular laptop repairing and accessories network in the whole of Australia. At We, we make sure that you laptop repairing experience is easy, fast and hassle free. What\'s more interesting about our services is that we have a range of utility, quality and fashionable accessories that makeover and protects your close friend – your laptop.\n                    <br />\n                    Some of our services particularly aimed at for businesses\n                    <br />\n                    <ul>\n                        <li>Desktop support – Maintenance, installation and repair.</li>\n                        <li>Software support including installation, registration and provision.</li>\n                        <li>Hardware support including provision, installation, set up and repair.</li>\n                        <li>Network system set up and configuration.</li>\n                        <li>Application support- Web apps, mobile apps, etc.</li>\n                        <li>Virus prevention, protection and removal.</li>\n                        <li>Server installation and maintenance.</li>\n                        <li>WiFi network system set up.</li>\n                    </ul>', NULL, 'service-laptop-macbook-repair.jpg', 'service-laptop-macbook-repair-banner.jpg', NULL, 1, NULL, NULL, NULL, NULL, '2023-05-23 07:07:28', '2023-05-23 07:07:28'),
(2, 'Computer Repair', 'computer-repair', 'We can repair all models and ranges of computers.\n                Call us now, and our team will provide a great solution for desktops, server, computer, smartphone, game accessories and all peripherals such as cameras, scanners, and printers. Our team responds immediately after getting your call; we will make sure your system is back to work in quickest possible time. Our team is available anytime, and we don\'t charge anything extra for nights and weekends. Our computer repairing services are based in Australia, and our geeks are all certified computer repairing professionals.\n                <br />\n                We understand the importance of computer in your life; our experts will make sure that the device is functional in quickest possible time. We assure you of all repairing services; our geeks will reach your home or business location to fix the problem. We provides a full guarantee on work, and we are known in the market for our fast and flawless computer repairing services.\n                <br />\n                Have full trust on We; our team will never let you down.', NULL, 'service-computer-repair.jpg', 'service-computer-repair-banner.jpg', NULL, 1, NULL, NULL, NULL, NULL, '2023-05-23 07:07:28', '2023-05-23 07:07:28'),
(3, 'Web Application Development', 'web-application-development', 'Services for your future web or mobile applications.\n                <br />\n\n                Our services focuses on the following things -\n                <ul>\n                    <li>Web application development</li>\n                    <li>Mobile application development</li>\n                    <li>Website Design</li>\n                    <li>Mobile App Design</li>\n                    <li>Management of business IT infrastructure.</li>\n                </ul>\n                ', NULL, 'service-web-application.jpg', 'service-web-application-banner.jpg', NULL, 1, NULL, NULL, NULL, NULL, '2023-05-23 07:07:28', '2023-05-23 07:07:28'),
(4, 'Data Backup & Recovery', 'data-backup-recovery', 'We believe in providing the best possible solution for homes as well as businesses. We always believe in meeting the need of our clients and helping them get back to work in quickest possible time. Life is completely dependent on these gadgets these days, and we strive hard to provide an affordable and quality solution for your business and home. All our geeks are skilled and trained to offer top notch services.\n                <br />\n                We believe all important data are stored in computer systems; We will assure you of data recovery, the storage set up and back up in best possible manner. Our customer data recovery and backup services are designed for home and business; call our geeks today to help you provide the best of deals. Our professionals will make sure you lever lose your precious data by backing it up. We takes up every data recovery assignment with utmost proficiency.\n                <br />\n                Here are some of the services on offer with us:\n                <br />\n                We offer data recovery services for all media devices.\n                <br />\n                <ul>\n                    <li>All our data recovery systems are confidential and secure.</li>\n                    <li>We assure you of fastest data recovery services in the country.</li>\n                    <li>Our team uses some of the best and latest technologies for data recovery.</li>\n                    <li>Apart from that our team of geeks will help you by backing up useful files for your home or office.</li>\n                </ul>\n                ', NULL, 'service-data-recovery.jpg', 'service-data-recovery-banner.jpg', NULL, 1, NULL, NULL, NULL, NULL, '2023-05-23 07:07:28', '2023-05-23 07:07:28');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `group` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `locked` tinyint(1) NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `group`, `name`, `locked`, `payload`, `created_at`, `updated_at`) VALUES
(1, 'general', 'name', 0, '\"Blomal CMS\"', '2023-05-23 07:07:28', '2023-06-07 10:24:16'),
(2, 'general', 'logo', 0, '\"logo.png\"', '2023-05-23 07:07:28', '2023-06-07 10:24:16'),
(3, 'general', 'favicon', 0, '\"favicon.ico\"', '2023-05-23 07:07:28', '2023-06-07 10:24:16'),
(4, 'general', 'description', 0, 'null', '2023-05-23 07:07:28', '2023-06-07 10:24:16'),
(5, 'general', 'copyright_text', 0, '\"&copy;2023 all rights reserved.\"', '2023-05-23 07:07:28', '2023-06-07 10:24:16'),
(6, 'general', 'meta_keywords', 0, 'null', '2023-05-23 07:07:28', '2023-06-07 10:24:16'),
(7, 'general', 'meta_description', 0, 'null', '2023-05-23 07:07:28', '2023-06-07 10:24:16'),
(8, 'general', 'meta_author', 0, 'null', '2023-05-23 07:07:28', '2023-06-07 10:24:16'),
(9, 'contact', 'contact_no', 0, '\"+966542816280\"', '2023-05-23 07:07:28', '2023-06-07 10:24:16'),
(10, 'contact', 'phone', 0, '\"+966542816280\"', '2023-05-23 07:07:28', '2023-06-07 10:24:16'),
(11, 'contact', 'email_primary', 0, '\"info@blomal.com\"', '2023-05-23 07:07:28', '2023-06-07 10:24:16'),
(12, 'contact', 'email_secondary', 0, '\"info@blomal.com\"', '2023-05-23 07:07:28', '2023-06-07 10:24:16'),
(13, 'contact', 'address', 0, '\"7917 Abi Tamim Al Musawi St, Ash Sheraa Dist \\r\\n\\r\\nJeddah, 23816\"', '2023-05-23 07:07:28', '2023-06-07 10:24:16'),
(14, 'contact', 'working_day_hours', 0, '\"7917 Abi Tamim Al Musawi St, Ash Sheraa Dist \\r\\n\\r\\nJeddah, 23816\"', '2023-05-23 07:07:28', '2023-06-07 10:24:16'),
(15, 'contact', 'map_lat', 0, 'null', '2023-05-23 07:07:28', '2023-06-07 10:24:16'),
(16, 'contact', 'map_long', 0, 'null', '2023-05-23 07:07:28', '2023-06-07 10:24:16'),
(17, 'contact', 'map_zoom', 0, '\"11\"', '2023-05-23 07:07:28', '2023-06-07 10:24:16'),
(18, 'social', 'facebook', 0, '\"https:\\/\\/facebook.com\\/example\"', '2023-05-23 07:07:28', '2023-06-07 10:24:16'),
(19, 'social', 'twitter', 0, '\"https:\\/\\/twitter.com\\/\"', '2023-05-23 07:07:28', '2023-06-07 10:24:16'),
(20, 'social', 'youtube', 0, '\"https:\\/\\/youtube.com\\/\"', '2023-05-23 07:07:28', '2023-06-07 10:24:16'),
(21, 'social', 'linkedin', 0, '\"https:\\/\\/linkedin.com\\/\"', '2023-05-23 07:07:28', '2023-06-07 10:24:16'),
(22, 'social', 'pinterest', 0, '\"https:\\/\\/pinterest.com\\/\"', '2023-05-23 07:07:28', '2023-06-07 10:24:16'),
(23, 'social', 'instagram', 0, '\"https:\\/\\/instagram.com\\/\"', '2023-05-23 07:07:28', '2023-06-07 10:24:16'),
(24, 'contact', 'contact_us_en', 0, '\"We are here to help demystify the real estate investment process with an in-house team of experts that handle the portfolio through phase\"', '2023-05-23 07:07:28', '2023-06-07 10:24:16'),
(25, 'contact', 'contact_us_ar', 0, '\"\\u0646\\u062d\\u0646 \\u0647\\u0646\\u0627 \\u0644\\u0644\\u0645\\u0633\\u0627\\u0639\\u062f\\u0629 \\u0641\\u064a \\u0625\\u0632\\u0627\\u0644\\u0629 \\u0627\\u0644\\u063a\\u0645\\u0648\\u0636 \\u0639\\u0646 \\u0639\\u0645\\u0644\\u064a\\u0629 \\u0627\\u0644\\u0627\\u0633\\u062a\\u062b\\u0645\\u0627\\u0631 \\u0627\\u0644\\u0639\\u0642\\u0627\\u0631\\u064a \\u0645\\u0646 \\u062e\\u0644\\u0627\\u0644 \\u0641\\u0631\\u064a\\u0642 \\u062f\\u0627\\u062e\\u0644\\u064a \\u0645\\u0646 \\u0627\\u0644\\u062e\\u0628\\u0631\\u0627\\u0621 \\u064a\\u062a\\u0639\\u0627\\u0645\\u0644 \\u0645\\u0639 \\u0627\\u0644\\u0645\\u062d\\u0641\\u0638\\u0629 \\u062e\\u0644\\u0627\\u0644 \\u0627\\u0644\\u0645\\u0631\\u062d\\u0644\\u0629\"', '2023-05-23 07:07:28', '2023-06-07 10:24:16'),
(26, 'general', 'footer_en', 0, '\"Blomnal Financial LLC is a Saudi company licensed by the Ministry of Commerce, Under license number 4030443697 under the procedure s for obtaining a permit from the Capital Market Authority.\"', '2023-05-23 07:07:28', '2023-06-07 10:24:16'),
(27, 'general', 'footer_ar', 0, '\"Blomnal Financial LLC \\u0647\\u064a \\u0634\\u0631\\u0643\\u0629 \\u0633\\u0639\\u0648\\u062f\\u064a\\u0629 \\u0645\\u0631\\u062e\\u0635\\u0629 \\u0645\\u0646 \\u0642\\u0628\\u0644 \\u0648\\u0632\\u0627\\u0631\\u0629 \\u0627\\u0644\\u062a\\u062c\\u0627\\u0631\\u0629 \\u060c \\u0628\\u0645\\u0648\\u062c\\u0628 \\u062a\\u0631\\u062e\\u064a\\u0635 \\u0631\\u0642\\u0645 4030443697 \\u0628\\u0645\\u0648\\u062c\\u0628 \\u0625\\u062c\\u0631\\u0627\\u0621\\u0627\\u062a \\u0627\\u0644\\u062d\\u0635\\u0648\\u0644 \\u0639\\u0644\\u0649 \\u062a\\u0635\\u0631\\u064a\\u062d \\u0645\\u0646 \\u0647\\u064a\\u0626\\u0629 \\u0627\\u0644\\u0633\\u0648\\u0642 \\u0627\\u0644\\u0645\\u0627\\u0644\\u064a\\u0629.\"', '2023-05-23 07:07:28', '2023-06-07 10:24:16');

-- --------------------------------------------------------

--
-- Table structure for table `tracks`
--

CREATE TABLE `tracks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `description` text NOT NULL,
  `reference_link` varchar(191) DEFAULT NULL COMMENT 'If there is possible to keep any reference link',
  `admin_id` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tracks`
--

INSERT INTO `tracks` (`id`, `title`, `description`, `reference_link`, `admin_id`, `deleted_at`, `deleted_by`, `created_at`, `updated_at`) VALUES
(1, 'yesty', 'New Service has been created', NULL, 1, NULL, NULL, '2023-05-23 07:26:33', '2023-05-23 07:26:33'),
(2, 'editor', 'Admin has been updated successfully !!', NULL, 1, NULL, NULL, '2023-05-23 07:28:12', '2023-05-23 07:28:12'),
(3, 'editor', 'Admin has been updated successfully !!', NULL, 1, NULL, NULL, '2023-05-23 07:28:37', '2023-05-23 07:28:37'),
(4, 'Editor', 'Role has been updated successfully !!', NULL, 1, NULL, NULL, '2023-05-23 07:33:39', '2023-05-23 07:33:39'),
(5, 'Editor', 'Role has been updated successfully !!', NULL, 1, NULL, NULL, '2023-05-23 07:35:11', '2023-05-23 07:35:11'),
(6, 'Editor', 'Role has been updated successfully !!', NULL, 1, NULL, NULL, '2023-05-23 07:37:24', '2023-05-23 07:37:24'),
(7, 'Editor', 'Role has been updated successfully !!', NULL, 1, NULL, NULL, '2023-05-23 07:37:57', '2023-05-23 07:37:57'),
(8, 'My test article', 'New Page has been created', NULL, 3, NULL, NULL, '2023-05-23 07:39:11', '2023-05-23 07:39:11'),
(9, 'earning', 'Category has been updated successfully !!', NULL, 1, NULL, NULL, '2023-05-23 08:43:14', '2023-05-23 08:43:14'),
(10, 'Settings', 'Setting was updated.', NULL, 1, NULL, NULL, '2023-05-23 08:50:30', '2023-05-23 08:50:30'),
(11, 'Settings', 'Setting was updated.', NULL, 1, NULL, NULL, '2023-05-24 06:02:03', '2023-05-24 06:02:03'),
(12, 'Settings', 'Setting was updated.', NULL, 1, NULL, NULL, '2023-05-24 06:03:00', '2023-05-24 06:03:00'),
(13, 'About Us', 'Page has been updated successfully !!', NULL, 1, NULL, NULL, '2023-05-24 06:14:12', '2023-05-24 06:14:12'),
(14, 'Settings', 'Setting was updated.', NULL, 1, NULL, NULL, '2023-05-24 06:40:54', '2023-05-24 06:40:54'),
(15, 'Settings', 'Setting was updated.', NULL, 1, NULL, NULL, '2023-05-24 06:41:52', '2023-05-24 06:41:52'),
(16, 'Settings', 'Setting was updated.', NULL, 1, NULL, NULL, '2023-05-24 06:42:10', '2023-05-24 06:42:10'),
(17, 'Settings', 'Setting was updated.', NULL, 1, NULL, NULL, '2023-05-24 08:03:49', '2023-05-24 08:03:49'),
(18, 'Settings', 'Setting was updated.', NULL, 1, NULL, NULL, '2023-05-24 08:31:59', '2023-05-24 08:31:59'),
(19, 'Settings', 'Setting was updated.', NULL, 1, NULL, NULL, '2023-05-24 08:33:04', '2023-05-24 08:33:04'),
(20, 'Settings', 'Setting was updated.', NULL, 1, NULL, NULL, '2023-05-24 08:36:43', '2023-05-24 08:36:43'),
(21, 'Settings', 'Setting was updated.', NULL, 1, NULL, NULL, '2023-05-24 08:37:22', '2023-05-24 08:37:22'),
(22, 'Settings', 'Setting was updated.', NULL, 1, NULL, NULL, '2023-05-24 08:52:21', '2023-05-24 08:52:21'),
(23, 'Settings', 'Setting was updated.', NULL, 1, NULL, NULL, '2023-05-24 08:52:32', '2023-05-24 08:52:32'),
(24, 'Settings', 'Setting was updated.', NULL, 1, NULL, NULL, '2023-05-24 08:53:33', '2023-05-24 08:53:33'),
(25, 'Settings', 'Setting was updated.', NULL, 1, NULL, NULL, '2023-05-24 08:56:32', '2023-05-24 08:56:32'),
(26, 'Settings', 'Setting was updated.', NULL, 1, NULL, NULL, '2023-05-24 08:56:45', '2023-05-24 08:56:45'),
(27, 'Settings', 'Setting was updated.', NULL, 1, NULL, NULL, '2023-05-24 09:00:12', '2023-05-24 09:00:12'),
(28, 'Settings', 'Setting was updated.', NULL, 1, NULL, NULL, '2023-05-24 09:00:39', '2023-05-24 09:00:39'),
(29, 'Settings', 'Setting was updated.', NULL, 1, NULL, NULL, '2023-05-24 09:03:58', '2023-05-24 09:03:58'),
(30, 'Settings', 'Setting was updated.', NULL, 1, NULL, NULL, '2023-05-24 09:04:35', '2023-05-24 09:04:35'),
(31, 'Settings', 'Setting was updated.', NULL, 1, NULL, NULL, '2023-05-24 09:10:04', '2023-05-24 09:10:04'),
(32, 'Settings', 'Setting was updated.', NULL, 1, NULL, NULL, '2023-05-24 09:17:14', '2023-05-24 09:17:14'),
(33, 'Settings', 'Setting was updated.', NULL, 1, NULL, NULL, '2023-05-24 09:21:15', '2023-05-24 09:21:15'),
(34, 'Settings', 'Setting was updated.', NULL, 1, NULL, NULL, '2023-05-24 09:21:32', '2023-05-24 09:21:32'),
(35, 'Settings', 'Setting was updated.', NULL, 1, NULL, NULL, '2023-05-24 09:21:41', '2023-05-24 09:21:41'),
(36, 'Settings', 'Setting was updated.', NULL, 1, NULL, NULL, '2023-05-24 09:53:35', '2023-05-24 09:53:35'),
(37, 'Settings', 'Setting was updated.', NULL, 1, NULL, NULL, '2023-05-24 09:54:18', '2023-05-24 09:54:18'),
(38, 'About us', 'New Page has been created', NULL, 1, NULL, NULL, '2023-05-25 05:17:05', '2023-05-25 05:17:05'),
(39, 'who we are', 'New Page has been created', NULL, 1, NULL, NULL, '2023-05-25 05:26:30', '2023-05-25 05:26:30'),
(40, 'safsafasfd', 'New Page has been created', NULL, 1, NULL, NULL, '2023-05-25 05:46:56', '2023-05-25 05:46:56'),
(41, 'safdsaf', 'New Page has been created', NULL, 1, NULL, NULL, '2023-05-25 05:47:10', '2023-05-25 05:47:10'),
(42, 'my title', 'New Page has been created', NULL, 1, NULL, NULL, '2023-05-25 05:48:10', '2023-05-25 05:48:10'),
(43, 'sfasdf', 'New Page has been created', NULL, 1, NULL, NULL, '2023-05-25 05:48:44', '2023-05-25 05:48:44'),
(44, 'adfadsf', 'New Page has been created', NULL, 1, NULL, NULL, '2023-05-25 05:56:18', '2023-05-25 05:56:18'),
(45, 'nGDp0dtdo4', 'New Page has been created', NULL, 1, NULL, NULL, '2023-05-25 05:57:11', '2023-05-25 05:57:11'),
(46, 'xdUASsmre3', 'New Page has been created', NULL, 1, NULL, NULL, '2023-05-25 06:24:54', '2023-05-25 06:24:54'),
(47, 'MY ABOUT', 'New Page has been created', NULL, 1, NULL, NULL, '2023-05-25 06:51:41', '2023-05-25 06:51:41'),
(48, '0dSvihXYJd', 'New Page has been created', NULL, 1, NULL, NULL, '2023-05-25 07:27:46', '2023-05-25 07:27:46'),
(49, '4FOhdGqNFi', 'New Page has been created', NULL, 1, NULL, NULL, '2023-05-25 07:40:19', '2023-05-25 07:40:19'),
(50, 'Mi4pfQPaFO', 'New Page has been created', NULL, 1, NULL, NULL, '2023-05-25 07:56:09', '2023-05-25 07:56:09'),
(51, 'About Us1', 'Page has been updated successfully !!', NULL, 1, NULL, NULL, '2023-05-29 06:09:24', '2023-05-29 06:09:24'),
(52, 'About Us1', 'Page has been updated successfully !!', NULL, 1, NULL, NULL, '2023-05-29 06:09:43', '2023-05-29 06:09:43'),
(53, 'About Us1', 'Page has been updated successfully !!', NULL, 1, NULL, NULL, '2023-05-29 06:10:02', '2023-05-29 06:10:02'),
(54, 'About Us1', 'Page has been updated successfully !!', NULL, 1, NULL, NULL, '2023-05-29 06:15:11', '2023-05-29 06:15:11'),
(55, 'Home', 'New Page has been created', NULL, 1, NULL, NULL, '2023-05-29 09:05:02', '2023-05-29 09:05:02'),
(56, 'About Us', 'Page has been updated successfully !!', NULL, 1, NULL, NULL, '2023-05-29 09:22:28', '2023-05-29 09:22:28'),
(57, 'About Us1', 'Page has been updated successfully !!', NULL, 1, NULL, NULL, '2023-05-29 09:22:56', '2023-05-29 09:22:56'),
(58, 'About Us1', 'Page has been updated successfully !!', NULL, 1, NULL, NULL, '2023-05-29 09:24:44', '2023-05-29 09:24:44'),
(59, 'About Us1', 'Page has been updated successfully !!', NULL, 1, NULL, NULL, '2023-05-29 09:26:42', '2023-05-29 09:26:42'),
(60, 'About Us1', 'Page has been updated successfully !!', NULL, 1, NULL, NULL, '2023-05-29 09:26:46', '2023-05-29 09:26:46'),
(61, 'About Us1', 'Page has been updated successfully !!', NULL, 1, NULL, NULL, '2023-05-29 09:27:12', '2023-05-29 09:27:12'),
(62, 'About Us111', 'Page has been updated successfully !!', NULL, 1, NULL, NULL, '2023-05-29 09:27:19', '2023-05-29 09:27:19'),
(63, 'About Us111', 'Page has been updated successfully !!', NULL, 1, NULL, NULL, '2023-06-04 07:14:22', '2023-06-04 07:14:22'),
(64, 'About Us111', 'Page has been updated successfully !!', NULL, 1, NULL, NULL, '2023-06-04 09:16:08', '2023-06-04 09:16:08'),
(65, 'why blomal', 'New Category has been created', NULL, 1, NULL, NULL, '2023-06-04 09:21:19', '2023-06-04 09:21:19'),
(66, 'how it works', 'New Category has been created', NULL, 1, NULL, NULL, '2023-06-04 09:22:24', '2023-06-04 09:22:24'),
(67, 'our partners', 'New Category has been created', NULL, 1, NULL, NULL, '2023-06-04 09:23:07', '2023-06-04 09:23:07'),
(68, 'Hand-Picked', 'New Category has been created', NULL, 1, NULL, NULL, '2023-06-04 09:24:00', '2023-06-04 09:24:00'),
(69, 'Sharia Compliance', 'New Category has been created', NULL, 1, NULL, NULL, '2023-06-04 09:24:38', '2023-06-04 09:24:38'),
(70, 'Easily Accessible', 'New Category has been created', NULL, 1, NULL, NULL, '2023-06-04 09:24:57', '2023-06-04 09:24:57'),
(71, 'Rewarding Returns', 'New Category has been created', NULL, 1, NULL, NULL, '2023-06-04 09:25:35', '2023-06-04 09:25:35'),
(72, 'REGISTER', 'New Category has been created', NULL, 1, NULL, NULL, '2023-06-04 09:26:09', '2023-06-04 09:26:09'),
(73, 'Fund Your Account', 'New Category has been created', NULL, 1, NULL, NULL, '2023-06-04 09:26:21', '2023-06-04 09:26:21'),
(74, 'INVEST OR FUNDRAISE', 'New Category has been created', NULL, 1, NULL, NULL, '2023-06-04 09:26:56', '2023-06-04 09:26:56'),
(75, 'REWARD', 'New Category has been created', NULL, 1, NULL, NULL, '2023-06-04 09:27:23', '2023-06-04 09:27:23'),
(76, 'OUR PARTNERS', 'New Category has been created', NULL, 1, NULL, NULL, '2023-06-04 09:29:22', '2023-06-04 09:29:22'),
(77, 'our-partners-1', 'Category has been updated successfully !!', NULL, 1, NULL, NULL, '2023-06-04 09:30:14', '2023-06-04 09:30:14'),
(78, 'our-partners-1', 'Category has been updated successfully !!', NULL, 1, NULL, NULL, '2023-06-04 09:30:53', '2023-06-04 09:30:53'),
(79, 'our-partners-1', 'Category has been updated successfully !!', NULL, 1, NULL, NULL, '2023-06-04 09:42:48', '2023-06-04 09:42:48'),
(80, '1111', 'New Category has been created', NULL, 1, NULL, NULL, '2023-06-04 10:14:16', '2023-06-04 10:14:16'),
(81, 'asfa', 'New Category has been created', NULL, 1, NULL, NULL, '2023-06-04 10:20:18', '2023-06-04 10:20:18'),
(82, 'asdgfa', 'New Category has been created', NULL, 1, NULL, NULL, '2023-06-04 10:24:31', '2023-06-04 10:24:31'),
(83, 'Why Blomal', 'New Category has been created', NULL, 1, NULL, NULL, '2023-06-04 10:29:03', '2023-06-04 10:29:03'),
(84, 'Hand-Picked', 'New Category has been created', NULL, 1, NULL, NULL, '2023-06-04 10:30:47', '2023-06-04 10:30:47'),
(85, 'Shariah Compliance', 'New Category has been created', NULL, 1, NULL, NULL, '2023-06-04 10:32:24', '2023-06-04 10:32:24'),
(86, 'Easily Accessible', 'New Category has been created', NULL, 1, NULL, NULL, '2023-06-04 10:33:34', '2023-06-04 10:33:34'),
(87, 'Rewarding Returns', 'New Category has been created', NULL, 1, NULL, NULL, '2023-06-04 10:39:14', '2023-06-04 10:39:14'),
(88, 'Simple and easy process', 'New Category has been created', NULL, 1, NULL, NULL, '2023-06-04 10:44:13', '2023-06-04 10:44:13'),
(89, 'REGISTER', 'New Category has been created', NULL, 1, NULL, NULL, '2023-06-04 10:45:17', '2023-06-04 10:45:17'),
(90, 'Fund Your Account', 'New Category has been created', NULL, 1, NULL, NULL, '2023-06-04 10:46:06', '2023-06-04 10:46:06'),
(91, 'INVEST OR FUNDRAISE', 'New Category has been created', NULL, 1, NULL, NULL, '2023-06-04 10:47:18', '2023-06-04 10:47:18'),
(92, 'REWARD', 'New Category has been created', NULL, 1, NULL, NULL, '2023-06-04 10:48:37', '2023-06-04 10:48:37'),
(93, 'OUR PARTNERS', 'New Category has been created', NULL, 1, NULL, NULL, '2023-06-04 10:49:02', '2023-06-04 10:49:02'),
(94, 'Capital Market Authority', 'New Category has been created', NULL, 1, NULL, NULL, '2023-06-04 10:51:14', '2023-06-04 10:51:14'),
(95, 'capital-market-authority', 'Category has been updated successfully !!', NULL, 1, NULL, NULL, '2023-06-05 05:27:37', '2023-06-05 05:27:37'),
(96, 'capital-market-authority', 'Category has been updated successfully !!', NULL, 1, NULL, NULL, '2023-06-05 05:27:50', '2023-06-05 05:27:50'),
(97, 'capital-market-authority', 'Category has been updated successfully !!', NULL, 1, NULL, NULL, '2023-06-05 05:34:27', '2023-06-05 05:34:27'),
(98, 'capital-market-authority', 'Category has been updated successfully !!', NULL, 1, NULL, NULL, '2023-06-05 05:34:43', '2023-06-05 05:34:43'),
(99, 'capital-market-authority', 'Category has been updated successfully !!', NULL, 1, NULL, NULL, '2023-06-05 05:34:48', '2023-06-05 05:34:48'),
(100, 'Elm', 'New Category has been created', NULL, 1, NULL, NULL, '2023-06-05 05:42:34', '2023-06-05 05:42:34'),
(101, 'HyperPay', 'New Category has been created', NULL, 1, NULL, NULL, '2023-06-05 05:48:07', '2023-06-05 05:48:07'),
(102, 'hyperpay', 'Category has been updated successfully !!', NULL, 1, NULL, NULL, '2023-06-05 05:51:19', '2023-06-05 05:51:19'),
(103, 'capital-market-authority', 'Category has been updated successfully !!', NULL, 1, NULL, NULL, '2023-06-05 05:52:18', '2023-06-05 05:52:18'),
(104, 'elm', 'Category has been updated successfully !!', NULL, 1, NULL, NULL, '2023-06-05 05:53:06', '2023-06-05 05:53:06'),
(105, 'capital-market-authority', 'Category has been updated successfully !!', NULL, 1, NULL, NULL, '2023-06-05 05:53:19', '2023-06-05 05:53:19'),
(106, 'Mozn', 'New Category has been created', NULL, 1, NULL, NULL, '2023-06-05 05:56:15', '2023-06-05 05:56:15'),
(107, 'mozn', 'Category has been updated successfully !!', NULL, 1, NULL, NULL, '2023-06-05 06:15:58', '2023-06-05 06:15:58'),
(108, 'About Us', 'Page has been updated successfully !!', NULL, 1, NULL, NULL, '2023-06-05 06:22:04', '2023-06-05 06:22:04'),
(109, 'About Us', 'Page has been updated successfully !!', NULL, 1, NULL, NULL, '2023-06-05 06:45:42', '2023-06-05 06:45:42'),
(110, 'About Us', 'Page has been updated successfully !!', NULL, 1, NULL, NULL, '2023-06-05 06:50:56', '2023-06-05 06:50:56'),
(111, 'About Us', 'Page has been updated successfully !!', NULL, 1, NULL, NULL, '2023-06-05 07:32:50', '2023-06-05 07:32:50'),
(112, 'About Us', 'Page has been updated successfully !!', NULL, 1, NULL, NULL, '2023-06-05 07:33:02', '2023-06-05 07:33:02'),
(113, 'About Us', 'Page has been updated successfully !!', NULL, 1, NULL, NULL, '2023-06-05 08:25:28', '2023-06-05 08:25:28'),
(114, 'About Us', 'Page has been updated successfully !!', NULL, 1, NULL, NULL, '2023-06-05 08:28:33', '2023-06-05 08:28:33'),
(115, 'Home', 'Page has been updated successfully !!', NULL, 1, NULL, NULL, '2023-06-05 08:37:09', '2023-06-05 08:37:09'),
(116, 'About Us', 'Page has been updated successfully !!', NULL, 1, NULL, NULL, '2023-06-05 08:37:24', '2023-06-05 08:37:24'),
(117, 'Home', 'Page has been updated successfully !!', NULL, 1, NULL, NULL, '2023-06-05 08:37:43', '2023-06-05 08:37:43'),
(118, 'Home', 'Page has been updated successfully !!', NULL, 1, NULL, NULL, '2023-06-05 08:38:15', '2023-06-05 08:38:15'),
(119, 'Home', 'Page has been updated successfully !!', NULL, 1, NULL, NULL, '2023-06-05 08:38:40', '2023-06-05 08:38:40'),
(120, 'Home', 'Page has been updated successfully !!', NULL, 1, NULL, NULL, '2023-06-05 08:39:09', '2023-06-05 08:39:09'),
(121, 'Home', 'Page has been updated successfully !!', NULL, 1, NULL, NULL, '2023-06-05 08:55:44', '2023-06-05 08:55:44'),
(122, 'About Us', 'Page has been updated successfully !!', NULL, 1, NULL, NULL, '2023-06-05 08:55:50', '2023-06-05 08:55:50'),
(123, 'Home', 'Page has been updated successfully !!', NULL, 1, NULL, NULL, '2023-06-05 09:14:23', '2023-06-05 09:14:23'),
(124, 'About Us1', 'Page has been updated successfully !!', NULL, 1, NULL, NULL, '2023-06-05 09:14:31', '2023-06-05 09:14:31'),
(125, 'About Us', 'Page has been updated successfully !!', NULL, 1, NULL, NULL, '2023-06-05 09:14:37', '2023-06-05 09:14:37'),
(126, 'Investment', 'Page has been updated successfully !!', NULL, 1, NULL, NULL, '2023-06-05 09:21:39', '2023-06-05 09:21:39'),
(127, 'Investment', 'Page has been updated successfully !!', NULL, 1, NULL, NULL, '2023-06-05 09:32:40', '2023-06-05 09:32:40'),
(128, 'Investment', 'Page has been updated successfully !!', NULL, 1, NULL, NULL, '2023-06-05 09:33:33', '2023-06-05 09:33:33'),
(129, 'Investment', 'Page has been updated successfully !!', NULL, 1, NULL, NULL, '2023-06-05 09:39:07', '2023-06-05 09:39:07'),
(130, 'Faqs', 'Page has been updated successfully !!', NULL, 1, NULL, NULL, '2023-06-05 10:18:36', '2023-06-05 10:18:36'),
(131, 'Faqs', 'Page has been updated successfully !!', NULL, 1, NULL, NULL, '2023-06-05 10:19:43', '2023-06-05 10:19:43'),
(132, 'Faqs', 'Page has been updated successfully !!', NULL, 1, NULL, NULL, '2023-06-05 10:19:51', '2023-06-05 10:19:51'),
(133, 'Faqs', 'Page has been updated successfully !!', NULL, 1, NULL, NULL, '2023-06-05 10:21:38', '2023-06-05 10:21:38'),
(134, 'test1', 'New Blog has been created', NULL, 1, NULL, NULL, '2023-06-06 05:21:41', '2023-06-06 05:21:41'),
(135, 'new faq', 'New Blog has been created', NULL, 1, NULL, NULL, '2023-06-06 05:39:07', '2023-06-06 05:39:07'),
(136, 'my test1', 'New Blog has been created', NULL, 1, NULL, NULL, '2023-06-06 05:50:20', '2023-06-06 05:50:20'),
(137, 'my test1222', 'Blog has been updated successfully !!', NULL, 1, NULL, NULL, '2023-06-06 05:55:22', '2023-06-06 05:55:22'),
(138, 'my test1222', 'Faq has been updated successfully !!', NULL, 1, NULL, NULL, '2023-06-06 05:58:19', '2023-06-06 05:58:19'),
(139, 'test question', 'New Faq has been created', NULL, 1, NULL, NULL, '2023-06-06 10:15:33', '2023-06-06 10:15:33'),
(140, 'test question1', 'Faq has been updated successfully !!', NULL, 1, NULL, NULL, '2023-06-06 10:41:07', '2023-06-06 10:41:07'),
(141, 'test question1', 'Faq has been updated successfully !!', NULL, 1, NULL, NULL, '2023-06-06 10:41:39', '2023-06-06 10:41:39'),
(142, 'test question1', 'Faq has been updated successfully !!', NULL, 1, NULL, NULL, '2023-06-06 10:41:51', '2023-06-06 10:41:51'),
(143, 'test question1', 'Faq has been updated successfully !!', NULL, 1, NULL, NULL, '2023-06-06 10:42:30', '2023-06-06 10:42:30'),
(144, 'how to invest', 'New Faq has been created', NULL, 1, NULL, NULL, '2023-06-06 10:50:05', '2023-06-06 10:50:05'),
(145, 'wiv9qJsPCF', 'New Faq has been created', NULL, 1, NULL, NULL, '2023-06-06 10:56:04', '2023-06-06 10:56:04'),
(146, 'wiv9qJsPCF', 'Faq has been updated successfully !!', NULL, 1, NULL, NULL, '2023-06-06 10:56:09', '2023-06-06 10:56:09'),
(147, 'wiv9qJsPCF1', 'Faq has been updated successfully !!', NULL, 1, NULL, NULL, '2023-06-06 10:56:18', '2023-06-06 10:56:18'),
(148, 'wiv9qJsPCF1', 'Faq has been updated successfully !!', NULL, 1, NULL, NULL, '2023-06-06 10:56:25', '2023-06-06 10:56:25'),
(149, 'wiv9qJsPCF1', 'Faq has been updated successfully !!', NULL, 1, NULL, NULL, '2023-06-06 10:56:35', '2023-06-06 10:56:35'),
(150, 'test en', 'Faq has been updated successfully !!', NULL, 1, NULL, NULL, '2023-06-06 10:57:03', '2023-06-06 10:57:03'),
(151, 'test en1', 'Faq has been updated successfully !!', NULL, 1, NULL, NULL, '2023-06-06 10:57:17', '2023-06-06 10:57:17'),
(152, 'my sample question', 'New Faq has been created', NULL, 1, NULL, NULL, '2023-06-06 10:58:42', '2023-06-06 10:58:42'),
(153, 'my sample question1', 'Faq has been updated successfully !!', NULL, 1, NULL, NULL, '2023-06-06 10:59:08', '2023-06-06 10:59:08'),
(154, 'my test question', 'New Faq has been created', NULL, 1, NULL, NULL, '2023-06-07 07:32:29', '2023-06-07 07:32:29'),
(155, 'my test question', 'Faq has been updated successfully !!', NULL, 1, NULL, NULL, '2023-06-07 08:19:14', '2023-06-07 08:19:14'),
(156, 'my test question -aa a', 'Faq has been updated successfully !!', NULL, 1, NULL, NULL, '2023-06-07 08:19:25', '2023-06-07 08:19:25'),
(157, 'my test question -aa a', 'Faq has been updated successfully !!', NULL, 1, NULL, NULL, '2023-06-07 08:30:49', '2023-06-07 08:30:49'),
(158, 'Home', 'Page has been updated successfully !!', NULL, 1, NULL, NULL, '2023-06-07 08:32:44', '2023-06-07 08:32:44'),
(159, 'Home', 'Page has been updated successfully !!', NULL, 1, NULL, NULL, '2023-06-07 08:32:54', '2023-06-07 08:32:54'),
(160, 'How to invest in Blomal Platform?', 'New Faq has been created', NULL, 1, NULL, NULL, '2023-06-07 08:42:51', '2023-06-07 08:42:51'),
(161, 'How can I get the investment returns?', 'New Faq has been created', NULL, 1, NULL, NULL, '2023-06-07 08:45:28', '2023-06-07 08:45:28'),
(162, 'How can I know the latest updates on the new opportunities?', 'New Faq has been created', NULL, 1, NULL, NULL, '2023-06-07 08:47:09', '2023-06-07 08:47:09'),
(163, 'Are returns guaranteed?', 'New Faq has been created', NULL, 1, NULL, NULL, '2023-06-07 08:49:21', '2023-06-07 08:49:21'),
(164, 'What is the minimum investment?', 'New Faq has been created', NULL, 1, NULL, NULL, '2023-06-07 09:01:37', '2023-06-07 09:01:37'),
(165, 'Are the operations on the platform in accordance with Islamic law?', 'New Faq has been created', NULL, 1, NULL, NULL, '2023-06-07 09:04:02', '2023-06-07 09:04:02'),
(166, 'How to invest in Blomal Platform?', 'Faq has been updated successfully !!', NULL, 1, NULL, NULL, '2023-06-07 09:12:44', '2023-06-07 09:12:44'),
(167, 'How to invest in Blomal Platform?', 'Faq has been updated successfully !!', NULL, 1, NULL, NULL, '2023-06-07 09:25:54', '2023-06-07 09:25:54'),
(168, 'How to invest in Blomal Platform?', 'Faq has been updated successfully !!', NULL, 1, NULL, NULL, '2023-06-07 09:26:00', '2023-06-07 09:26:00'),
(169, 'How to invest in Blomal Platform?', 'Faq has been updated successfully !!', NULL, 1, NULL, NULL, '2023-06-07 09:26:18', '2023-06-07 09:26:18'),
(170, 'How to invest in Blomal Platform?', 'Faq has been updated successfully !!', NULL, 1, NULL, NULL, '2023-06-07 09:26:42', '2023-06-07 09:26:42'),
(171, 'zubairbobby', 'New Admin has been created', NULL, 1, NULL, NULL, '2023-06-07 10:11:58', '2023-06-07 10:11:58'),
(172, 'Admin', 'Role has been updated successfully !!', NULL, 1, NULL, NULL, '2023-06-07 10:13:23', '2023-06-07 10:13:23'),
(173, 'Admin', 'Role has been updated successfully !!', NULL, 1, NULL, NULL, '2023-06-07 10:13:59', '2023-06-07 10:13:59'),
(174, 'zubairbobby', 'Admin has been updated successfully !!', NULL, 1, NULL, NULL, '2023-06-07 10:14:15', '2023-06-07 10:14:15'),
(175, 'Admin', 'Role has been updated successfully !!', NULL, 1, NULL, NULL, '2023-06-07 10:15:17', '2023-06-07 10:15:17'),
(176, 'Admin', 'Role has been updated successfully !!', NULL, 1, NULL, NULL, '2023-06-07 10:15:57', '2023-06-07 10:15:57'),
(177, 'Home', 'Page has been updated successfully !!', NULL, 4, NULL, NULL, '2023-06-07 10:16:11', '2023-06-07 10:16:11'),
(178, 'Admin', 'Role has been updated successfully !!', NULL, 1, NULL, NULL, '2023-06-07 10:16:26', '2023-06-07 10:16:26'),
(179, 'Settings', 'Setting was updated.', NULL, 1, NULL, NULL, '2023-06-07 10:24:16', '2023-06-07 10:24:16'),
(180, 'Terms & Conditions', 'Page has been updated successfully !!', NULL, 1, NULL, NULL, '2023-06-07 10:43:59', '2023-06-07 10:43:59'),
(181, 'Terms & Conditions', 'Page has been updated successfully !!', NULL, 1, NULL, NULL, '2023-06-07 10:44:10', '2023-06-07 10:44:10'),
(182, 'Terms & Conditions', 'Page has been updated successfully !!', NULL, 1, NULL, NULL, '2023-06-07 10:44:20', '2023-06-07 10:44:20'),
(183, 'Terms & Conditions', 'Page has been updated successfully !!', NULL, 1, NULL, NULL, '2023-06-07 10:57:44', '2023-06-07 10:57:44'),
(184, 'Terms & Conditions', 'Page has been updated successfully !!', NULL, 1, NULL, NULL, '2023-06-07 10:59:05', '2023-06-07 10:59:05'),
(185, 'Terms & Conditions', 'Page has been updated successfully !!', NULL, 1, NULL, NULL, '2023-06-08 05:20:15', '2023-06-08 05:20:15'),
(186, 'Terms & Conditions', 'Page has been updated successfully !!', NULL, 1, NULL, NULL, '2023-06-08 05:22:24', '2023-06-08 05:22:24'),
(187, 'Home', 'Page has been updated successfully !!', NULL, 1, NULL, NULL, '2023-06-08 05:22:50', '2023-06-08 05:22:50'),
(188, 'Faqs', 'Page has been updated successfully !!', NULL, 1, NULL, NULL, '2023-06-08 05:22:55', '2023-06-08 05:22:55'),
(189, 'Terms & Conditions', 'Page has been updated successfully !!', NULL, 1, NULL, NULL, '2023-06-08 08:44:27', '2023-06-08 08:44:27'),
(190, 'Terms & Conditions', 'Page has been updated successfully !!', NULL, 1, NULL, NULL, '2023-06-08 08:49:44', '2023-06-08 08:49:44'),
(191, 'Terms & Conditions', 'Page has been updated successfully !!', NULL, 1, NULL, NULL, '2023-06-08 09:00:13', '2023-06-08 09:00:13'),
(192, 'Terms & Conditions', 'Page has been updated successfully !!', NULL, 1, NULL, NULL, '2023-06-08 09:08:16', '2023-06-08 09:08:16'),
(193, 'Privacy policy', 'Page has been updated successfully !!', NULL, 1, NULL, NULL, '2023-06-08 09:08:27', '2023-06-08 09:08:27'),
(194, 'Privacy policy', 'Page has been updated successfully !!', NULL, 1, NULL, NULL, '2023-06-08 09:13:26', '2023-06-08 09:13:26'),
(195, 'Disclosure policy', 'Page has been updated successfully !!', NULL, 1, NULL, NULL, '2023-06-08 09:14:53', '2023-06-08 09:14:53'),
(196, 'Faqs1', 'Page has been updated successfully !!', NULL, 1, NULL, NULL, '2023-06-08 09:15:18', '2023-06-08 09:15:18'),
(197, 'Faqs', 'Page has been updated successfully !!', NULL, 1, NULL, NULL, '2023-06-08 09:15:34', '2023-06-08 09:15:34'),
(198, 'Investment1', 'Page has been updated successfully !!', NULL, 1, NULL, NULL, '2023-06-08 09:15:48', '2023-06-08 09:15:48'),
(199, 'Investment', 'Page has been updated successfully !!', NULL, 1, NULL, NULL, '2023-06-08 09:16:11', '2023-06-08 09:16:11'),
(200, 'About Us1', 'Page has been updated successfully !!', NULL, 1, NULL, NULL, '2023-06-08 09:16:30', '2023-06-08 09:16:30'),
(201, 'About Us', 'Page has been updated successfully !!', NULL, 1, NULL, NULL, '2023-06-08 09:16:49', '2023-06-08 09:16:49'),
(202, 'Home1', 'Page has been updated successfully !!', NULL, 1, NULL, NULL, '2023-06-08 09:17:03', '2023-06-08 09:17:03'),
(203, 'Home', 'Page has been updated successfully !!', NULL, 1, NULL, NULL, '2023-06-08 09:17:17', '2023-06-08 09:17:17'),
(204, 'Privacy policy', 'Page has been updated successfully !!', NULL, 1, NULL, NULL, '2023-06-08 09:27:04', '2023-06-08 09:27:04'),
(205, 'Privacy policy', 'Page has been updated successfully !!', NULL, 1, NULL, NULL, '2023-06-08 09:27:27', '2023-06-08 09:27:27'),
(206, 'Disclosure policy', 'Page has been updated successfully !!', NULL, 1, NULL, NULL, '2023-06-08 09:28:45', '2023-06-08 09:28:45'),
(207, 'Terms & Conditions', 'Page has been updated successfully !!', NULL, 1, NULL, NULL, '2023-06-08 09:57:42', '2023-06-08 09:57:42'),
(208, 'Disclosure policy', 'Page has been updated successfully !!', NULL, 1, NULL, NULL, '2023-06-08 10:20:53', '2023-06-08 10:20:53');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(191) NOT NULL,
  `last_name` varchar(191) DEFAULT NULL,
  `username` varchar(191) NOT NULL,
  `phone_no` varchar(191) DEFAULT NULL,
  `email` varchar(191) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) NOT NULL,
  `avatar` varchar(191) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1=active, 0=inactive',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `language_id` bigint(20) UNSIGNED DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_username_unique` (`username`),
  ADD UNIQUE KEY `admins_email_unique` (`email`),
  ADD KEY `admins_created_by_foreign` (`created_by`),
  ADD KEY `admins_updated_by_foreign` (`updated_by`),
  ADD KEY `admins_deleted_by_foreign` (`deleted_by`),
  ADD KEY `admins_first_name_index` (`first_name`),
  ADD KEY `admins_phone_no_index` (`phone_no`);

--
-- Indexes for table `article_types`
--
ALTER TABLE `article_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `billing_information`
--
ALTER TABLE `billing_information`
  ADD PRIMARY KEY (`id`),
  ADD KEY `billing_information_booking_request_id_index` (`booking_request_id`),
  ADD KEY `billing_information_payment_status_index` (`payment_status`);

--
-- Indexes for table `booking_rates`
--
ALTER TABLE `booking_rates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `booking_requests`
--
ALTER TABLE `booking_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `booking_requests_service_id_index` (`service_id`),
  ADD KEY `booking_requests_service_category_id_index` (`service_category_id`),
  ADD KEY `booking_requests_booking_rate_id_index` (`booking_rate_id`),
  ADD KEY `booking_requests_status_index` (`status`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD UNIQUE KEY `cache_key_unique` (`key`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_created_by_foreign` (`created_by`),
  ADD KEY `categories_updated_by_foreign` (`updated_by`),
  ADD KEY `categories_deleted_by_foreign` (`deleted_by`),
  ADD KEY `categories_parent_category_id_foreign` (`parent_category_id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contacts_updated_by_foreign` (`updated_by`),
  ADD KEY `contacts_deleted_by_foreign` (`deleted_by`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `countries_code_unique` (`code`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `blogs_slug_unique` (`slug`) USING HASH,
  ADD KEY `blogs_created_by_foreign` (`created_by`),
  ADD KEY `blogs_updated_by_foreign` (`updated_by`),
  ADD KEY `blogs_deleted_by_foreign` (`deleted_by`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `languages_code_unique` (`code`),
  ADD KEY `languages_country_id_foreign` (`country_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`),
  ADD KEY `pages_created_by_foreign` (`created_by`),
  ADD KEY `pages_updated_by_foreign` (`updated_by`),
  ADD KEY `pages_deleted_by_foreign` (`deleted_by`),
  ADD KEY `pages_category_id_foreign` (`category_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `services_slug_unique` (`slug`),
  ADD KEY `services_created_by_foreign` (`created_by`),
  ADD KEY `services_updated_by_foreign` (`updated_by`),
  ADD KEY `services_deleted_by_foreign` (`deleted_by`),
  ADD KEY `services_category_id_foreign` (`category_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `settings_group_index` (`group`);

--
-- Indexes for table `tracks`
--
ALTER TABLE `tracks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tracks_deleted_by_foreign` (`deleted_by`),
  ADD KEY `tracks_admin_id_foreign` (`admin_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_first_name_index` (`first_name`),
  ADD KEY `users_phone_no_index` (`phone_no`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `article_types`
--
ALTER TABLE `article_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `billing_information`
--
ALTER TABLE `billing_information`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `booking_rates`
--
ALTER TABLE `booking_rates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `booking_requests`
--
ALTER TABLE `booking_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `tracks`
--
ALTER TABLE `tracks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=209;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admins`
--
ALTER TABLE `admins`
  ADD CONSTRAINT `admins_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `admins_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `admins_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `categories_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `categories_parent_category_id_foreign` FOREIGN KEY (`parent_category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `categories_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `contacts`
--
ALTER TABLE `contacts`
  ADD CONSTRAINT `contacts_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `contacts_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `faqs`
--
ALTER TABLE `faqs`
  ADD CONSTRAINT `blogs_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `blogs_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `blogs_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `languages`
--
ALTER TABLE `languages`
  ADD CONSTRAINT `languages_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`);

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `pages`
--
ALTER TABLE `pages`
  ADD CONSTRAINT `pages_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pages_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pages_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pages_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `services`
--
ALTER TABLE `services`
  ADD CONSTRAINT `services_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `services_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `services_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `services_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tracks`
--
ALTER TABLE `tracks`
  ADD CONSTRAINT `tracks_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tracks_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
