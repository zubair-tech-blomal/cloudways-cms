-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 07, 2023 at 04:59 PM
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
(1, 'Home', 'home', 'Build Wealth with Real Estate Crowdfunding', 'بناء الثروة من خلال التمويل الجماعي العقاري', 'Get access to high-quality commercial real estate deals whether you’re a retail or institutional investor', 'احصل على إمكانية الوصول إلى صفقات عقارية تجارية عالية الجودة سواء كنت مستثمرًا بالتجزئة أو مستثمرًا مؤسسيًا', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Blomal Financial LLC is a Saudi company licensed by the Ministry of Commerce, under license number 4030443697 under the procedures for obtaining a permit from the Capital Market Authority.', 'Blomal Financial LLC هي شركة سعودية مرخصة من قبل وزارة التجارة ، بموجب ترخيص رقم 4030443697 بموجب إجراءات الحصول على تصريح من هيئة السوق المالية.', NULL, NULL, NULL, NULL, 1, NULL, 1, 4, NULL, '2023-05-29 09:05:02', '2023-06-07 10:16:11'),
(2, 'About Us', 'about-us', 'Blomal Story', 'قصة بلومال', 'We’re here to help demystify the real estate investment process with an in-house team of experts that handle the portfolio through each phase.', 'نحن هنا للمساعدة في إزالة الغموض عن عملية الاستثمار العقاري من خلال فريق داخلي من الخبراء يتعامل مع المحفظة خلال كل مرحلة', 'We’re here to help demystify the real estate investment process with an in-house team of experts that handle the portfolio through each phase.', NULL, 'نحن هنا للمساعدة في إزالة الغموض عن عملية الاستثمار العقاري من خلال فريق داخلي من الخبراء يتعامل مع المحفظة خلال كل مرحلة', 'based in Jeddah, Saudi Arabia. Established in 2021, the firm invests in various portfolios in stock funds, Sukuk, and various real estate funds. The assets of the firm are managed by the executive management team.', 'مقرها في جدة ، المملكة العربية السعودية. تأسست الشركة عام 2021 ، وتستثمر في محافظ مختلفة في صناديق الأسهم والصكوك والصناديق العقارية المختلفة. يتم إدارة أصول الشركة من قبل فريق الإدارة التنفيذية.', 'based in Jeddah, Saudi Arabia. Established in 2021, the firm invests in various portfolios in stock funds, Sukuk, and various real estate funds. The assets of the firm are managed by the executive management team.', 'مقرها في جدة ، المملكة العربية السعودية. تأسست الشركة عام 2021 ، وتستثمر في محافظ مختلفة في صناديق الأسهم والصكوك والصناديق العقارية المختلفة. يتم إدارة أصول الشركة من قبل فريق الإدارة التنفيذية.', NULL, NULL, NULL, NULL, NULL, NULL, 'Blomal Financial LLC is a Saudi company licensed by the Ministry of Commerce, under license number 4030443697 under the procedures for obtaining a permit from the Capital Market Authority.', 'Blomal Financial LLC هي شركة سعودية مرخصة من قبل وزارة التجارة ، بموجب ترخيص رقم 4030443697 بموجب إجراءات الحصول على تصريح من هيئة السوق المالية.', 'About Us-1684919652-logo.png', NULL, NULL, NULL, 1, NULL, NULL, 1, NULL, '2023-05-23 07:07:28', '2023-06-05 09:14:37'),
(3, 'Investment', 'investment', 'Investment Opportunities', 'فرص الاستثمار', 'We’re here to help demystify the real estate investment process with an in-house team of experts that handle the portfolio through each phase', 'نحن هنا للمساعدة في إزالة الغموض عن عملية الاستثمار العقاري من خلال فريق داخلي من الخبراء يتعامل مع المحفظة خلال كل مرحلة', 'investment opportunity that matches your priorities.', 'فرصة استثمارية تتناسب مع أولوياتك', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Blomal Financial LLC is a Saudi company licensed by the Ministry of Commerce, under license number 4030443697 under the procedures for obtaining a permit from the Capital Market Authority.', 'Blomal Financial LLC هي شركة سعودية مرخصة من قبل وزارة التجارة ، بموجب ترخيص رقم 4030443697 بموجب إجراءات الحصول على تصريح من هيئة السوق المالية.', NULL, NULL, NULL, NULL, 1, NULL, 1, 1, NULL, '2023-05-29 09:05:02', '2023-06-05 09:39:07'),
(4, 'Faqs', 'faqs', 'Frequently Asked Questions', 'أسئلة مكررة', 'We’re here to help demystify the real estate investment process with an in-house team of experts that handle the portfolio through each phase.', 'نحن هنا للمساعدة في إزالة الغموض عن عملية الاستثمار العقاري من خلال فريق داخلي من الخبراء يتعامل مع المحفظة خلال كل مرحلة', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Blomal Financial LLC is a Saudi company licensed by the Ministry of Commerce, under license number 4030443697 under the procedures for obtaining a permit from the Capital Market Authority.', 'Blomal Financial LLC هي شركة سعودية مرخصة من قبل وزارة التجارة ، بموجب ترخيص رقم 4030443697 بموجب إجراءات الحصول على تصريح من هيئة السوق المالية.', NULL, NULL, NULL, NULL, 1, NULL, 1, 1, NULL, '2023-05-29 09:05:02', '2023-06-05 10:21:38'),
(20, 'Terms & Conditions', 'terms', 'TERMS & CONDITIONS en11', 'TERMS & CONDITIONS ar1111', 'TERMS & CONDITIONS desc en1', '1TERMS & CONDITIONS desc ar', '', NULL, NULL, NULL, NULL, NULL, NULL, '<p>term en1</p>', '<p><strong>صفحة الاختبار الخاصة بي</strong></p>\r\n<p></p>\r\n<p>صفحة الاختبار الخاصة بي</p>\r\n<ul>\r\n<li>صفحة الاختبار الخاصة بي</li>\r\n<li>صفحة الاختبار الخاصة بي</li>\r\n</ul>', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, 1, NULL, '2023-05-29 09:05:02', '2023-06-07 10:59:05');

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
(184, 'Terms & Conditions', 'Page has been updated successfully !!', NULL, 1, NULL, NULL, '2023-06-07 10:59:05', '2023-06-07 10:59:05');

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=185;

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
