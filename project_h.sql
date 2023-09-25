-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Sep 25, 2023 at 04:37 PM
-- Server version: 5.7.30
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `project_h`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add countries', 1, 'add_countries'),
(2, 'Can change countries', 1, 'change_countries'),
(3, 'Can delete countries', 1, 'delete_countries'),
(4, 'Can view countries', 1, 'view_countries'),
(5, 'Can add hosted_service', 2, 'add_hosted_service'),
(6, 'Can change hosted_service', 2, 'change_hosted_service'),
(7, 'Can delete hosted_service', 2, 'delete_hosted_service'),
(8, 'Can view hosted_service', 2, 'view_hosted_service'),
(9, 'Can add id types', 3, 'add_idtypes'),
(10, 'Can change id types', 3, 'change_idtypes'),
(11, 'Can delete id types', 3, 'delete_idtypes'),
(12, 'Can view id types', 3, 'view_idtypes'),
(13, 'Can add services', 4, 'add_services'),
(14, 'Can change services', 4, 'change_services'),
(15, 'Can delete services', 4, 'delete_services'),
(16, 'Can view services', 4, 'view_services'),
(17, 'Can add service_reviews', 5, 'add_service_reviews'),
(18, 'Can change service_reviews', 5, 'change_service_reviews'),
(19, 'Can delete service_reviews', 5, 'delete_service_reviews'),
(20, 'Can view service_reviews', 5, 'view_service_reviews'),
(21, 'Can add service_images', 6, 'add_service_images'),
(22, 'Can change service_images', 6, 'change_service_images'),
(23, 'Can delete service_images', 6, 'delete_service_images'),
(24, 'Can view service_images', 6, 'view_service_images'),
(25, 'Can add payments', 7, 'add_payments'),
(26, 'Can change payments', 7, 'change_payments'),
(27, 'Can delete payments', 7, 'delete_payments'),
(28, 'Can view payments', 7, 'view_payments'),
(29, 'Can add customers', 8, 'add_customers'),
(30, 'Can change customers', 8, 'change_customers'),
(31, 'Can delete customers', 8, 'delete_customers'),
(32, 'Can view customers', 8, 'view_customers'),
(33, 'Can add log entry', 9, 'add_logentry'),
(34, 'Can change log entry', 9, 'change_logentry'),
(35, 'Can delete log entry', 9, 'delete_logentry'),
(36, 'Can view log entry', 9, 'view_logentry'),
(37, 'Can add permission', 10, 'add_permission'),
(38, 'Can change permission', 10, 'change_permission'),
(39, 'Can delete permission', 10, 'delete_permission'),
(40, 'Can view permission', 10, 'view_permission'),
(41, 'Can add group', 11, 'add_group'),
(42, 'Can change group', 11, 'change_group'),
(43, 'Can delete group', 11, 'delete_group'),
(44, 'Can view group', 11, 'view_group'),
(45, 'Can add user', 12, 'add_user'),
(46, 'Can change user', 12, 'change_user'),
(47, 'Can delete user', 12, 'delete_user'),
(48, 'Can view user', 12, 'view_user'),
(49, 'Can add content type', 13, 'add_contenttype'),
(50, 'Can change content type', 13, 'change_contenttype'),
(51, 'Can delete content type', 13, 'delete_contenttype'),
(52, 'Can view content type', 13, 'view_contenttype'),
(53, 'Can add session', 14, 'add_session'),
(54, 'Can change session', 14, 'change_session'),
(55, 'Can delete session', 14, 'delete_session'),
(56, 'Can view session', 14, 'view_session'),
(57, 'Can add one_time_pin', 15, 'add_one_time_pin'),
(58, 'Can change one_time_pin', 15, 'change_one_time_pin'),
(59, 'Can delete one_time_pin', 15, 'delete_one_time_pin'),
(60, 'Can view one_time_pin', 15, 'view_one_time_pin'),
(61, 'Can add user_payment_methods', 16, 'add_user_payment_methods'),
(62, 'Can change user_payment_methods', 16, 'change_user_payment_methods'),
(63, 'Can delete user_payment_methods', 16, 'delete_user_payment_methods'),
(64, 'Can view user_payment_methods', 16, 'view_user_payment_methods'),
(65, 'Can add payment_methods', 17, 'add_payment_methods'),
(66, 'Can change payment_methods', 17, 'change_payment_methods'),
(67, 'Can delete payment_methods', 17, 'delete_payment_methods'),
(68, 'Can view payment_methods', 17, 'view_payment_methods'),
(69, 'Can add host details', 18, 'add_hostdetails'),
(70, 'Can change host details', 18, 'change_hostdetails'),
(71, 'Can delete host details', 18, 'delete_hostdetails'),
(72, 'Can view host details', 18, 'view_hostdetails'),
(73, 'Can add services_sub_categories', 19, 'add_services_sub_categories'),
(74, 'Can change services_sub_categories', 19, 'change_services_sub_categories'),
(75, 'Can delete services_sub_categories', 19, 'delete_services_sub_categories'),
(76, 'Can view services_sub_categories', 19, 'view_services_sub_categories'),
(77, 'Can add services_sub_category_fields', 20, 'add_services_sub_category_fields'),
(78, 'Can change services_sub_category_fields', 20, 'change_services_sub_category_fields'),
(79, 'Can delete services_sub_category_fields', 20, 'delete_services_sub_category_fields'),
(80, 'Can view services_sub_category_fields', 20, 'view_services_sub_category_fields'),
(81, 'Can add host referrals', 21, 'add_hostreferrals'),
(82, 'Can change host referrals', 21, 'change_hostreferrals'),
(83, 'Can delete host referrals', 21, 'delete_hostreferrals'),
(84, 'Can view host referrals', 21, 'view_hostreferrals'),
(85, 'Can add requests', 22, 'add_requests'),
(86, 'Can change requests', 22, 'change_requests'),
(87, 'Can delete requests', 22, 'delete_requests'),
(88, 'Can view requests', 22, 'view_requests'),
(89, 'Can add cards', 23, 'add_cards'),
(90, 'Can change cards', 23, 'change_cards'),
(91, 'Can delete cards', 23, 'delete_cards'),
(92, 'Can view cards', 23, 'view_cards'),
(93, 'Can add momo', 24, 'add_momo'),
(94, 'Can change momo', 24, 'change_momo'),
(95, 'Can delete momo', 24, 'delete_momo'),
(96, 'Can view momo', 24, 'view_momo'),
(97, 'Can add request notice', 25, 'add_requestnotice'),
(98, 'Can change request notice', 25, 'change_requestnotice'),
(99, 'Can delete request notice', 25, 'delete_requestnotice'),
(100, 'Can view request notice', 25, 'view_requestnotice'),
(101, 'Can add request responses', 26, 'add_requestresponses'),
(102, 'Can change request responses', 26, 'change_requestresponses'),
(103, 'Can delete request responses', 26, 'delete_requestresponses'),
(104, 'Can view request responses', 26, 'view_requestresponses'),
(105, 'Can add request notice responses', 27, 'add_requestnoticeresponses'),
(106, 'Can change request notice responses', 27, 'change_requestnoticeresponses'),
(107, 'Can delete request notice responses', 27, 'delete_requestnoticeresponses'),
(108, 'Can view request notice responses', 27, 'view_requestnoticeresponses'),
(109, 'Can add profile menu', 28, 'add_profilemenu'),
(110, 'Can change profile menu', 28, 'change_profilemenu'),
(111, 'Can delete profile menu', 28, 'delete_profilemenu'),
(112, 'Can view profile menu', 28, 'view_profilemenu'),
(113, 'Can add service categories', 29, 'add_servicecategories'),
(114, 'Can change service categories', 29, 'change_servicecategories'),
(115, 'Can delete service categories', 29, 'delete_servicecategories'),
(116, 'Can view service categories', 29, 'view_servicecategories'),
(117, 'Can add language', 30, 'add_language'),
(118, 'Can change language', 30, 'change_language'),
(119, 'Can delete language', 30, 'delete_language'),
(120, 'Can view language', 30, 'view_language'),
(121, 'Can add application properties', 31, 'add_applicationproperties'),
(122, 'Can change application properties', 31, 'change_applicationproperties'),
(123, 'Can delete application properties', 31, 'delete_applicationproperties'),
(124, 'Can view application properties', 31, 'view_applicationproperties');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(7, 'pbkdf2_sha256$216000$GPIjtwYBLU2J$c0D12olSuvjo7MjWFdGcUasTlbPFnwZAEHA2XNoFpKE=', '2023-09-11 19:19:03.942648', 1, 'admin', '', '', 'admin@gmail.com', 1, 1, '2022-11-14 09:12:09.351353'),
(11, '', '2023-06-14 00:00:00.000000', 0, 'test.test', 'Test', 'tester', 'bede.abbe@gmail.com', 0, 1, '2023-06-14 00:00:00.000000'),
(12, '', '2023-07-11 00:00:00.000000', 0, 'jase.kpodo', 'Jase', 'Kpodo', 'jason@gmail.com', 0, 1, '2023-07-11 00:00:00.000000'),
(13, '', '2023-08-25 00:00:00.000000', 0, 'yoland.basin', 'Yoland', 'Basin', 'yolandebasin@gmail.com', 0, 1, '2023-08-25 00:00:00.000000');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2022-11-14 09:13:04.160901', '1', 'Services object (1)', 1, '[{\"added\": {}}]', 4, 7),
(2, '2022-11-14 09:13:32.099324', '2', 'Services object (2)', 1, '[{\"added\": {}}]', 4, 7),
(3, '2022-11-14 09:20:46.274716', '3', 'Services object (3)', 1, '[{\"added\": {}}]', 4, 7),
(4, '2022-11-14 09:21:19.676920', '4', 'Services object (4)', 1, '[{\"added\": {}}]', 4, 7),
(5, '2022-11-14 09:21:39.933600', '5', 'Services object (5)', 1, '[{\"added\": {}}]', 4, 7),
(6, '2022-11-14 11:32:10.369547', '6', 'Services object (6)', 1, '[{\"added\": {}}]', 4, 7),
(7, '2022-11-14 11:32:24.187819', '7', 'Services object (7)', 1, '[{\"added\": {}}]', 4, 7),
(8, '2022-12-18 15:41:49.584943', '1', 'Payment_methods object (1)', 1, '[{\"added\": {}}]', 17, 7),
(9, '2023-09-11 20:10:09.656375', '2', 'Services object (2)', 2, '[{\"changed\": {\"fields\": [\"Service category name ENGLISH\", \"Service category name FRENCH\", \"Service category description ENGLISH\"]}}]', 4, 7),
(10, '2023-09-11 20:11:19.315914', '3', 'Services object (3)', 2, '[{\"changed\": {\"fields\": [\"Service category name ENGLISH\", \"Service category name FRENCH\", \"Service category description ENGLISH\"]}}]', 4, 7),
(11, '2023-09-11 20:13:52.409388', '4', 'Services object (4)', 2, '[{\"changed\": {\"fields\": [\"Service category name ENGLISH\", \"Service category name FRENCH\", \"Service category description ENGLISH\", \"Service category description FRENCH\"]}}]', 4, 7),
(12, '2023-09-11 20:13:57.283282', '4', 'Services object (4)', 2, '[]', 4, 7),
(13, '2023-09-11 20:14:16.236433', '5', 'Services object (5)', 2, '[{\"changed\": {\"fields\": [\"Service category name ENGLISH\", \"Service category name FRENCH\", \"Service category description ENGLISH\", \"Service category description FRENCH\"]}}]', 4, 7),
(14, '2023-09-11 20:16:25.513094', '6', 'Services object (6)', 2, '[{\"changed\": {\"fields\": [\"Service category name ENGLISH\", \"Service category name FRENCH\", \"Service category description ENGLISH\", \"Service category description FRENCH\"]}}]', 4, 7),
(15, '2023-09-11 20:16:30.710966', '6', 'Services object (6)', 2, '[]', 4, 7),
(16, '2023-09-11 20:16:54.076833', '7', 'Services object (7)', 2, '[{\"changed\": {\"fields\": [\"Service category name ENGLISH\", \"Service category name FRENCH\", \"Service category description ENGLISH\", \"Service category description FRENCH\"]}}]', 4, 7),
(17, '2023-09-11 20:17:25.220704', '9', 'Services object (9)', 2, '[{\"changed\": {\"fields\": [\"Service category name ENGLISH\", \"Service category name FRENCH\", \"Service category description ENGLISH\", \"Service category description FRENCH\"]}}]', 4, 7),
(18, '2023-09-11 20:17:56.396369', '10', 'Services object (10)', 2, '[{\"changed\": {\"fields\": [\"Service category name ENGLISH\", \"Service category name FRENCH\", \"Service category description ENGLISH\", \"Service category description FRENCH\"]}}]', 4, 7),
(19, '2023-09-12 21:38:11.780762', '1', 'ProfileMenu object (1)', 1, '[{\"added\": {}}]', 28, 7),
(20, '2023-09-12 21:39:26.980466', '2', 'ProfileMenu object (2)', 1, '[{\"added\": {}}]', 28, 7),
(21, '2023-09-12 21:40:40.643287', '3', 'ProfileMenu object (3)', 1, '[{\"added\": {}}]', 28, 7),
(22, '2023-09-12 22:10:14.297307', '4', 'ProfileMenu object (4)', 1, '[{\"added\": {}}]', 28, 7),
(23, '2023-09-12 22:30:02.678740', '5', 'ProfileMenu object (5)', 1, '[{\"added\": {}}]', 28, 7),
(24, '2023-09-12 23:13:25.326268', '1', 'Language object (1)', 1, '[{\"added\": {}}]', 30, 7),
(25, '2023-09-12 23:13:30.065388', '2', 'Language object (2)', 1, '[{\"added\": {}}]', 30, 7),
(26, '2023-09-12 23:13:34.076836', '3', 'Language object (3)', 1, '[{\"added\": {}}]', 30, 7),
(27, '2023-09-12 23:13:43.862622', '4', 'Language object (4)', 1, '[{\"added\": {}}]', 30, 7),
(28, '2023-09-12 23:21:38.047507', '5', 'ProfileMenu object (5)', 2, '[]', 28, 7),
(29, '2023-09-13 22:27:02.052418', '1', 'ApplicationProperties object (1)', 1, '[{\"added\": {}}]', 31, 7),
(30, '2023-09-13 22:27:32.355600', '2', 'ApplicationProperties object (2)', 1, '[{\"added\": {}}]', 31, 7),
(31, '2023-09-13 22:28:01.571573', '3', 'ApplicationProperties object (3)', 1, '[{\"added\": {}}]', 31, 7),
(32, '2023-09-13 22:45:12.815221', '1', 'ApplicationProperties object (1)', 2, '[{\"changed\": {\"fields\": [\"Value\"]}}]', 31, 7),
(33, '2023-09-13 22:45:22.871361', '2', 'ApplicationProperties object (2)', 2, '[{\"changed\": {\"fields\": [\"Value\"]}}]', 31, 7),
(34, '2023-09-13 22:45:32.355278', '3', 'ApplicationProperties object (3)', 2, '[{\"changed\": {\"fields\": [\"Value\"]}}]', 31, 7),
(35, '2023-09-13 22:58:52.430625', '1', 'ApplicationProperties object (1)', 2, '[]', 31, 7),
(36, '2023-09-13 23:18:44.521616', '2', 'ApplicationProperties object (2)', 2, '[]', 31, 7),
(37, '2023-09-13 23:20:13.018003', '3', 'ApplicationProperties object (3)', 2, '[]', 31, 7),
(38, '2023-09-13 23:20:48.308609', '4', 'ApplicationProperties object (4)', 1, '[{\"added\": {}}]', 31, 7),
(39, '2023-09-13 23:21:20.848940', '5', 'ApplicationProperties object (5)', 1, '[{\"added\": {}}]', 31, 7),
(40, '2023-09-13 23:22:55.289517', '6', 'ApplicationProperties object (6)', 1, '[{\"added\": {}}]', 31, 7),
(41, '2023-09-13 23:23:22.452250', '7', 'ApplicationProperties object (7)', 1, '[{\"added\": {}}]', 31, 7),
(42, '2023-09-13 23:25:47.785399', '4', 'ApplicationProperties object (4)', 2, '[]', 31, 7),
(43, '2023-09-13 23:26:55.255231', '7', 'ApplicationProperties object (7)', 2, '[]', 31, 7),
(44, '2023-09-13 23:27:20.587648', '8', 'ApplicationProperties object (8)', 1, '[{\"added\": {}}]', 31, 7),
(45, '2023-09-13 23:44:42.116455', '7', 'Services object (7)', 2, '[]', 4, 7),
(46, '2023-09-13 23:44:46.402656', '6', 'Services object (6)', 2, '[]', 4, 7),
(47, '2023-09-13 23:44:50.981498', '5', 'Services object (5)', 2, '[]', 4, 7),
(48, '2023-09-13 23:44:54.973926', '4', 'Services object (4)', 2, '[]', 4, 7),
(49, '2023-09-13 23:45:19.353255', '8', 'Services object (8)', 2, '[{\"changed\": {\"fields\": [\"Service category name ENGLISH\", \"Service category name FRENCH\", \"Service category description ENGLISH\"]}}]', 4, 7),
(50, '2023-09-13 23:45:37.731150', '10', 'Services object (10)', 2, '[]', 4, 7),
(51, '2023-09-13 23:45:51.708447', '1', 'Services object (1)', 2, '[{\"changed\": {\"fields\": [\"Service category name ENGLISH\", \"Service category name FRENCH\", \"Service category description ENGLISH\"]}}]', 4, 7),
(52, '2023-09-13 23:45:55.969844', '8', 'Services object (8)', 2, '[]', 4, 7),
(53, '2023-09-13 23:56:40.061383', '6', 'ApplicationProperties object (6)', 2, '[]', 31, 7),
(54, '2023-09-13 23:56:44.230875', '7', 'ApplicationProperties object (7)', 2, '[]', 31, 7),
(55, '2023-09-14 00:02:05.263781', '9', 'ApplicationProperties object (9)', 1, '[{\"added\": {}}]', 31, 7),
(56, '2023-09-14 00:04:41.897532', '10', 'ApplicationProperties object (10)', 1, '[{\"added\": {}}]', 31, 7),
(57, '2023-09-14 00:06:12.902379', '11', 'ApplicationProperties object (11)', 1, '[{\"added\": {}}]', 31, 7),
(58, '2023-09-14 00:08:02.913078', '11', 'ApplicationProperties object (11)', 2, '[{\"changed\": {\"fields\": [\"Application property name\", \"Application property name ENGLISH\", \"Application property name FRENCH\", \"Value\"]}}]', 31, 7),
(59, '2023-09-14 00:08:58.958886', '12', 'ApplicationProperties object (12)', 1, '[{\"added\": {}}]', 31, 7),
(60, '2023-09-14 00:22:09.183266', '13', 'ApplicationProperties object (13)', 1, '[{\"added\": {}}]', 31, 7),
(61, '2023-09-14 00:22:32.503692', '14', 'ApplicationProperties object (14)', 1, '[{\"added\": {}}]', 31, 7),
(62, '2023-09-14 00:22:53.904603', '15', 'ApplicationProperties object (15)', 1, '[{\"added\": {}}]', 31, 7),
(63, '2023-09-14 00:23:22.077641', '16', 'ApplicationProperties object (16)', 1, '[{\"added\": {}}]', 31, 7),
(64, '2023-09-14 00:24:28.848566', '17', 'ApplicationProperties object (17)', 1, '[{\"added\": {}}]', 31, 7),
(65, '2023-09-14 00:24:33.166512', '16', 'ApplicationProperties object (16)', 2, '[]', 31, 7),
(66, '2023-09-14 00:24:36.762536', '15', 'ApplicationProperties object (15)', 2, '[]', 31, 7),
(67, '2023-09-14 00:25:01.796873', '18', 'ApplicationProperties object (18)', 1, '[{\"added\": {}}]', 31, 7),
(68, '2023-09-14 00:28:06.519494', '19', 'ApplicationProperties object (19)', 1, '[{\"added\": {}}]', 31, 7),
(69, '2023-09-14 11:48:12.578020', '20', 'ApplicationProperties object (20)', 1, '[{\"added\": {}}]', 31, 7),
(70, '2023-09-14 12:02:37.106395', '21', 'ApplicationProperties object (21)', 1, '[{\"added\": {}}]', 31, 7),
(71, '2023-09-14 12:03:20.601683', '22', 'ApplicationProperties object (22)', 1, '[{\"added\": {}}]', 31, 7),
(72, '2023-09-14 12:04:00.812672', '23', 'ApplicationProperties object (23)', 1, '[{\"added\": {}}]', 31, 7),
(73, '2023-09-14 12:04:25.355396', '24', 'ApplicationProperties object (24)', 1, '[{\"added\": {}}]', 31, 7),
(74, '2023-09-14 12:04:43.600037', '25', 'ApplicationProperties object (25)', 1, '[{\"added\": {}}]', 31, 7),
(75, '2023-09-14 12:15:09.750806', '26', 'ApplicationProperties object (26)', 1, '[{\"added\": {}}]', 31, 7),
(76, '2023-09-14 12:15:30.541258', '27', 'ApplicationProperties object (27)', 1, '[{\"added\": {}}]', 31, 7),
(77, '2023-09-14 12:16:01.901024', '28', 'ApplicationProperties object (28)', 1, '[{\"added\": {}}]', 31, 7),
(78, '2023-09-14 12:35:13.405964', '29', 'ApplicationProperties object (29)', 1, '[{\"added\": {}}]', 31, 7),
(79, '2023-09-14 12:37:17.412181', '30', 'ApplicationProperties object (30)', 1, '[{\"added\": {}}]', 31, 7),
(80, '2023-09-14 12:37:43.143267', '31', 'ApplicationProperties object (31)', 1, '[{\"added\": {}}]', 31, 7),
(81, '2023-09-14 12:38:39.708580', '32', 'ApplicationProperties object (32)', 1, '[{\"added\": {}}]', 31, 7),
(82, '2023-09-14 12:39:00.604815', '33', 'ApplicationProperties object (33)', 1, '[{\"added\": {}}]', 31, 7),
(83, '2023-09-14 12:39:26.322166', '34', 'ApplicationProperties object (34)', 1, '[{\"added\": {}}]', 31, 7),
(84, '2023-09-14 12:39:48.543561', '35', 'ApplicationProperties object (35)', 1, '[{\"added\": {}}]', 31, 7),
(85, '2023-09-14 12:40:09.917025', '36', 'ApplicationProperties object (36)', 1, '[{\"added\": {}}]', 31, 7),
(86, '2023-09-14 12:40:33.337373', '37', 'ApplicationProperties object (37)', 1, '[{\"added\": {}}]', 31, 7),
(87, '2023-09-14 12:40:49.568776', '38', 'ApplicationProperties object (38)', 1, '[{\"added\": {}}]', 31, 7),
(88, '2023-09-14 12:41:16.005226', '39', 'ApplicationProperties object (39)', 1, '[{\"added\": {}}]', 31, 7),
(89, '2023-09-14 12:41:33.578792', '40', 'ApplicationProperties object (40)', 1, '[{\"added\": {}}]', 31, 7),
(90, '2023-09-14 12:41:56.804100', '41', 'ApplicationProperties object (41)', 1, '[{\"added\": {}}]', 31, 7),
(91, '2023-09-14 12:42:49.378238', '42', 'ApplicationProperties object (42)', 1, '[{\"added\": {}}]', 31, 7),
(92, '2023-09-14 12:43:09.459382', '43', 'ApplicationProperties object (43)', 1, '[{\"added\": {}}]', 31, 7),
(93, '2023-09-14 13:14:05.186781', '44', 'ApplicationProperties object (44)', 1, '[{\"added\": {}}]', 31, 7),
(94, '2023-09-14 19:20:09.740683', '45', 'ApplicationProperties object (45)', 1, '[{\"added\": {}}]', 31, 7);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(9, 'admin', 'logentry'),
(11, 'auth', 'group'),
(10, 'auth', 'permission'),
(12, 'auth', 'user'),
(13, 'contenttypes', 'contenttype'),
(31, 'project_h_core', 'applicationproperties'),
(23, 'project_h_core', 'cards'),
(1, 'project_h_core', 'countries'),
(8, 'project_h_core', 'customers'),
(18, 'project_h_core', 'hostdetails'),
(2, 'project_h_core', 'hosted_service'),
(21, 'project_h_core', 'hostreferrals'),
(3, 'project_h_core', 'idtypes'),
(30, 'project_h_core', 'language'),
(24, 'project_h_core', 'momo'),
(15, 'project_h_core', 'one_time_pin'),
(7, 'project_h_core', 'payments'),
(17, 'project_h_core', 'payment_methods'),
(28, 'project_h_core', 'profilemenu'),
(25, 'project_h_core', 'requestnotice'),
(27, 'project_h_core', 'requestnoticeresponses'),
(26, 'project_h_core', 'requestresponses'),
(22, 'project_h_core', 'requests'),
(29, 'project_h_core', 'servicecategories'),
(4, 'project_h_core', 'services'),
(19, 'project_h_core', 'services_sub_categories'),
(20, 'project_h_core', 'services_sub_category_fields'),
(6, 'project_h_core', 'service_images'),
(5, 'project_h_core', 'service_reviews'),
(16, 'project_h_core', 'user_payment_methods'),
(14, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2022-11-08 10:25:36.062513'),
(2, 'auth', '0001_initial', '2022-11-08 10:25:36.274632'),
(3, 'admin', '0001_initial', '2022-11-08 10:25:36.633052'),
(4, 'admin', '0002_logentry_remove_auto_add', '2022-11-08 10:25:36.703840'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2022-11-08 10:25:36.711760'),
(6, 'contenttypes', '0002_remove_content_type_name', '2022-11-08 10:25:36.785446'),
(7, 'auth', '0002_alter_permission_name_max_length', '2022-11-08 10:25:36.819919'),
(8, 'auth', '0003_alter_user_email_max_length', '2022-11-08 10:25:36.854393'),
(9, 'auth', '0004_alter_user_username_opts', '2022-11-08 10:25:36.861860'),
(10, 'auth', '0005_alter_user_last_login_null', '2022-11-08 10:25:36.898126'),
(11, 'auth', '0006_require_contenttypes_0002', '2022-11-08 10:25:36.900923'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2022-11-08 10:25:36.909875'),
(13, 'auth', '0008_alter_user_username_max_length', '2022-11-08 10:25:36.944219'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2022-11-08 10:25:36.979619'),
(15, 'auth', '0010_alter_group_name_max_length', '2022-11-08 10:25:37.014391'),
(16, 'auth', '0011_update_proxy_permissions', '2022-11-08 10:25:37.023400'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2022-11-08 10:25:37.060525'),
(18, 'project_h_core', '0001_initial', '2022-11-08 10:25:37.335013'),
(19, 'project_h_core', '0002_auto_20221108_1025', '2022-11-08 10:25:37.640793'),
(20, 'sessions', '0001_initial', '2022-11-08 10:25:37.675511'),
(21, 'project_h_core', '0003_customers_is_host', '2022-11-08 19:16:09.845853'),
(22, 'project_h_core', '0004_auto_20221109_1314', '2022-11-09 13:14:23.552003'),
(23, 'project_h_core', '0005_one_time_pin_otp_type', '2022-11-09 14:54:49.071480'),
(24, 'project_h_core', '0006_services_service_icon', '2022-11-14 17:31:04.315107'),
(25, 'project_h_core', '0007_auto_20221115_2358', '2022-11-15 23:58:40.133318'),
(26, 'project_h_core', '0008_payment_methods_user_payment_methods', '2022-12-18 15:28:29.222863'),
(27, 'project_h_core', '0009_auto_20230319_1356', '2023-03-19 13:58:58.627269'),
(28, 'project_h_core', '0010_hostdetails_customer', '2023-03-19 14:14:17.119491'),
(29, 'project_h_core', '0011_auto_20230321_2239', '2023-03-21 22:39:40.588353'),
(30, 'project_h_core', '0012_services_sub_categories_has_subs', '2023-03-21 22:48:42.303038'),
(31, 'project_h_core', '0013_auto_20230321_2322', '2023-03-21 23:22:35.774338'),
(32, 'project_h_core', '0014_auto_20230321_2341', '2023-03-21 23:41:38.274474'),
(33, 'project_h_core', '0015_auto_20230322_0809', '2023-03-22 08:09:20.706181'),
(34, 'project_h_core', '0016_services_sub_category_fields_subs_display_type', '2023-03-23 11:39:47.181035'),
(35, 'project_h_core', '0017_services_display_type', '2023-03-29 00:49:39.877415'),
(36, 'project_h_core', '0018_requests', '2023-03-29 19:03:29.451228'),
(37, 'project_h_core', '0019_cards_momo', '2023-03-29 19:14:13.807852'),
(38, 'project_h_core', '0020_user_payment_methods_payment_method_table_key', '2023-03-29 22:44:14.531706'),
(39, 'project_h_core', '0021_user_payment_methods_number', '2023-03-30 00:53:21.007333'),
(40, 'project_h_core', '0022_requests_payment_option', '2023-03-30 12:37:00.921357'),
(41, 'project_h_core', '0023_auto_20230405_1659', '2023-04-05 16:59:39.236458'),
(42, 'project_h_core', '0024_auto_20230405_2018', '2023-04-05 20:18:35.765996'),
(43, 'project_h_core', '0025_services_sub_categories_option_for', '2023-05-09 11:59:31.285423'),
(44, 'project_h_core', '0026_requestnotice', '2023-05-14 17:57:54.365656'),
(45, 'project_h_core', '0027_requestnoticeresponses_requestresponses', '2023-06-12 18:39:50.572602'),
(46, 'project_h_core', '0028_requestnoticeresponses_view_count', '2023-06-12 22:38:29.917444'),
(47, 'project_h_core', '0029_requestnotice_view_count', '2023-06-12 23:09:12.069046'),
(48, 'project_h_core', '0030_auto_20230613_0146', '2023-06-13 01:46:28.079528'),
(49, 'project_h_core', '0031_auto_20230823_2336', '2023-08-23 23:36:11.832577'),
(50, 'project_h_core', '0032_auto_20230825_1221', '2023-08-25 12:21:14.666412'),
(51, 'project_h_core', '0033_profilemenu_servicecategories', '2023-09-11 17:33:33.664886'),
(52, 'project_h_core', '0034_auto_20230911_1940', '2023-09-11 19:40:08.139995'),
(53, 'project_h_core', '0035_profilemenu_to_path', '2023-09-11 20:22:11.601395'),
(54, 'project_h_core', '0036_profilemenu_category', '2023-09-12 10:47:04.501257'),
(55, 'project_h_core', '0037_language', '2023-09-12 23:09:16.026621'),
(56, 'project_h_core', '0038_applicationproperties', '2023-09-13 10:38:56.174803');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('jyrf20epjajuvvdvrp2f4942hr1yivos', '.eJxVjMEOwiAQRP-FsyFA6YIevfsNZGG3UjWQlPZk_HdL0oNe5jDz3rxFwG3NYWu8hJnERThx-u0ipieXPtADy73KVMu6zFF2RB5rk7dK_Loe7N9BxpZ324-TV9HjHgOlwRkwDABWs2WiiciAoxG1hqSj8oNKKlmEs1cEXRSfL-KhN6E:1ouVW1:xgVTzi_pnRaCAuDOTX8jJUn57gsqkmLSSV8Wa8EswjA', '2022-11-28 09:12:29.128570'),
('lm0sstqem9u0e9v5mohvsl67r6n45bzs', '.eJxVjMEOwiAQRP-FsyFA6YIevfsNZGG3UjWQlPZk_HdL0oNe5jDz3rxFwG3NYWu8hJnERThx-u0ipieXPtADy73KVMu6zFF2RB5rk7dK_Loe7N9BxpZ324-TV9HjHgOlwRkwDABWs2WiiciAoxG1hqSj8oNKKlmEs1cEXRSfL-KhN6E:1qfmR5:9VBpBrtvyY2CXk1kkYgmcdb1oW0kElQPF6UGEvtLCRQ', '2023-09-25 19:19:03.949721'),
('p1dxspz9aojimxztwhjs6ud2ntasf2gh', '.eJxVjMEOwiAQRP-FsyFA6YIevfsNZGG3UjWQlPZk_HdL0oNe5jDz3rxFwG3NYWu8hJnERThx-u0ipieXPtADy73KVMu6zFF2RB5rk7dK_Loe7N9BxpZ324-TV9HjHgOlwRkwDABWs2WiiciAoxG1hqSj8oNKKlmEs1cEXRSfL-KhN6E:1p6vkx:FthO2BX9KZYUC4R_ZPxK4BOU-5M-lTZAxWBIvTIldX4', '2023-01-01 15:39:15.176531');

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
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_08_09_220916_add_columns_to_users_table', 2),
(6, '2023_08_10_102152_add_columns_to_users_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
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
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project_h_core_applicationproperties`
--

CREATE TABLE `project_h_core_applicationproperties` (
  `application_property_id` int(11) NOT NULL,
  `application_property_name` varchar(150) NOT NULL,
  `application_property_name_ENGLISH` varchar(150) DEFAULT NULL,
  `application_property_name_FRENCH` varchar(150) DEFAULT NULL,
  `application_property_name_SPANISH` varchar(150) DEFAULT NULL,
  `application_property_name_PORTUGUESE` varchar(150) DEFAULT NULL,
  `value` varchar(150) DEFAULT NULL,
  `active` tinyint(1) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `project_h_core_applicationproperties`
--

INSERT INTO `project_h_core_applicationproperties` (`application_property_id`, `application_property_name`, `application_property_name_ENGLISH`, `application_property_name_FRENCH`, `application_property_name_SPANISH`, `application_property_name_PORTUGUESE`, `value`, `active`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'Account settings definition', 'Account settings', 'Paramètres de Compte', NULL, NULL, 'ACCOUNT_SETTINGS', 1, NULL, NULL, '2023-09-13 22:27:02.038889', '2023-09-13 22:58:52.427068'),
(2, 'Personal Information', 'Personal Information', 'Personal Information', NULL, NULL, 'PERSONAL_INFORMATION', 1, NULL, NULL, '2023-09-13 22:27:32.349462', '2023-09-13 23:18:44.517076'),
(3, 'Payments and Payouts definition', 'Payments and Payouts', 'Paiements', NULL, NULL, 'PAYMENTS_AND_PAYOUTS', 1, NULL, NULL, '2023-09-13 22:28:01.570360', '2023-09-13 23:20:13.015861'),
(4, 'Privacy and Sharing definition', 'Privacy and Sharing', 'Confidentialité et Partage', NULL, NULL, 'PRIVACY_AND_SHARING', 1, NULL, NULL, '2023-09-13 23:20:48.304505', '2023-09-13 23:25:47.782633'),
(5, 'Hosting definition', 'Hosting', 'Offre de Service', NULL, NULL, 'HOSTING', 1, NULL, NULL, '2023-09-13 23:21:20.843258', '2023-09-13 23:21:20.843304'),
(6, 'Host a service definition', 'Host a service', 'Fournir un Service', NULL, NULL, 'HOST_SERVICE', 1, NULL, NULL, '2023-09-13 23:22:55.287513', '2023-09-13 23:56:40.058976'),
(7, 'Logout definition', 'Logout', 'Déconnexion', NULL, NULL, 'LOGOUT', 1, NULL, NULL, '2023-09-13 23:23:22.450927', '2023-09-13 23:56:44.229830'),
(8, 'Show profile definition', 'Show profile', 'Afficher le Profil', NULL, NULL, 'SHOW_PROFILE', 1, NULL, NULL, '2023-09-13 23:27:20.585263', '2023-09-13 23:27:20.585297'),
(9, 'Is Host definition', 'Is Host', 'Fournit un Service', NULL, NULL, 'IS_HOST', 1, NULL, NULL, '2023-09-14 00:02:05.253978', '2023-09-14 00:02:05.254023'),
(10, 'Is Verified definition', 'Is Verified', 'Est Vérifié', NULL, NULL, 'IS_VERIFIED', 1, NULL, NULL, '2023-09-14 00:04:41.893616', '2023-09-14 00:04:41.893660'),
(11, 'Delivery Location definition', 'Delivery Location', 'lieu de livraison', NULL, NULL, 'DELIVERY_LOCATION', 1, NULL, NULL, '2023-09-14 00:06:12.900734', '2023-09-14 00:08:02.911320'),
(12, 'Language definition', 'Language', 'Langue', NULL, NULL, 'LANGUAGE', 1, NULL, NULL, '2023-09-14 00:08:58.956433', '2023-09-14 00:08:58.956462'),
(13, 'Description definition', 'Description', 'Description', NULL, NULL, 'DESCRIPTION', 1, NULL, NULL, '2023-09-14 00:22:09.179084', '2023-09-14 00:22:09.179135'),
(14, 'Other features definition', 'Other features', 'Complément d\'Information', NULL, NULL, 'OTHER_FEATURES', 1, NULL, NULL, '2023-09-14 00:22:32.500906', '2023-09-14 00:22:32.500947'),
(15, 'Add review definition', 'Add review', 'Donnez votre Avis', NULL, NULL, 'ADD_REVIEW', 1, NULL, NULL, '2023-09-14 00:22:53.895821', '2023-09-14 00:24:36.761486'),
(16, 'Select payment method definition', 'Select payment method', 'Choisissez votre moyen de Paiement', NULL, NULL, 'SELECT_PAYMENT_METHOD', 1, NULL, NULL, '2023-09-14 00:23:22.076838', '2023-09-14 00:24:33.165268'),
(17, 'Order details definition', 'Order details', 'Détails de la commande', NULL, NULL, 'ORDER_DETAILS', 1, NULL, NULL, '2023-09-14 00:24:28.845789', '2023-09-14 00:24:28.845820'),
(18, 'Order Summary', 'Order Summary', 'Résumé de la Commande', NULL, NULL, 'ORDER_SUMMARY', 1, NULL, NULL, '2023-09-14 00:25:01.796002', '2023-09-14 00:25:01.796042'),
(19, 'Expected Duration definition', 'Expected Duration', 'Délai d\'exécution', NULL, NULL, 'EXPECTED_DURATION', 1, NULL, NULL, '2023-09-14 00:28:06.516144', '2023-09-14 00:28:06.516174'),
(20, 'Review definition', 'Review', 'Avis', NULL, NULL, 'REVIEW', 1, NULL, NULL, '2023-09-14 11:48:12.562260', '2023-09-14 11:48:12.562301'),
(21, 'Reviews definition', 'Reviews', 'Avis', NULL, NULL, 'REVIEWS', 1, NULL, NULL, '2023-09-14 12:02:37.099114', '2023-09-14 12:02:37.099146'),
(22, 'Total Amount definition', 'Total Amount', 'Montant Total', NULL, NULL, 'TOTAL_AMOUNT', 1, NULL, NULL, '2023-09-14 12:03:20.600205', '2023-09-14 12:03:20.600234'),
(23, 'Your Location definition', 'Your Location', 'Votre emplacement', NULL, NULL, 'YOUR_LOCATION', 1, NULL, NULL, '2023-09-14 12:04:00.808540', '2023-09-14 12:04:00.808571'),
(24, 'First name definition', 'First Name', 'Prénom', NULL, NULL, 'FIRST_NAME', 1, NULL, NULL, '2023-09-14 12:04:25.343661', '2023-09-14 12:04:25.343703'),
(25, 'Address definition', 'Address', 'Adresse', NULL, NULL, 'ADDRESS', 1, NULL, NULL, '2023-09-14 12:04:43.589338', '2023-09-14 12:04:43.589385'),
(26, 'Request Service definition', 'Request Service', 'Passer Commande', NULL, NULL, 'REQUEST_SERVICE', 1, NULL, NULL, '2023-09-14 12:15:09.735916', '2023-09-14 12:15:09.735973'),
(27, 'Success definition', 'Success', 'Succès', NULL, NULL, 'SUCCESS', 1, NULL, NULL, '2023-09-14 12:15:30.532454', '2023-09-14 12:15:30.532497'),
(28, 'Failed definition', 'Failed', 'Echec', NULL, NULL, 'FAILED', 1, NULL, NULL, '2023-09-14 12:16:01.897622', '2023-09-14 12:16:01.897666'),
(29, 'Resend definition', 'Resend', 'Renvoyer', NULL, NULL, 'RESEND', 1, NULL, NULL, '2023-09-14 12:35:13.401011', '2023-09-14 12:35:13.401056'),
(30, 'Didn\'t receive the code', 'Didn\'t receive the code', 'Code non Reçu', NULL, NULL, 'DID_NOT_RECEIVE_CODE', 1, NULL, NULL, '2023-09-14 12:37:17.405151', '2023-09-14 12:37:17.405195'),
(31, 'Confirm your number definition', 'Confirm your number', 'Confirmez votre numéro', NULL, NULL, 'CONFIRM_YOUR_NUMBER', 1, NULL, NULL, '2023-09-14 12:37:43.141062', '2023-09-14 12:37:43.141109'),
(32, 'Enter the code sent to your number definition', 'Enter the code sent to your number', 'Saisissez le code que vous avez reçu', NULL, NULL, 'ENTER_CODE_SENT', 1, NULL, NULL, '2023-09-14 12:38:39.704425', '2023-09-14 12:38:39.704456'),
(33, 'Submit definition', 'Submit', 'Soumettre', NULL, NULL, 'SUBMIT', 1, NULL, NULL, '2023-09-14 12:39:00.602955', '2023-09-14 12:39:00.602999'),
(34, 'We will text you to confirm your number definition', 'We will text you to confirm your number', 'Nous vous enverrons un SMS pour vérifier votre numéro', NULL, NULL, 'TEXT_TO_CONFIRM_NUMBER', 1, NULL, NULL, '2023-09-14 12:39:26.320221', '2023-09-14 12:39:26.320259'),
(35, 'Select country definition', 'Select country', 'Choix de Pays', NULL, NULL, 'SELECT_COUNTRY', 1, NULL, NULL, '2023-09-14 12:39:48.541719', '2023-09-14 12:39:48.541789'),
(36, 'Enter a number definition', 'Enter a number', 'Taper un nombre', NULL, NULL, 'ENTER_NUMBER', 1, NULL, NULL, '2023-09-14 12:40:09.915226', '2023-09-14 12:40:09.915270'),
(37, 'Advanced Search definition', 'Advanced Search', 'Recherche Avancée', NULL, NULL, 'ADVANCED_SEARCH', 1, NULL, NULL, '2023-09-14 12:40:33.334908', '2023-09-14 12:40:33.334949'),
(38, 'Search definition', 'Search', 'Chercher', NULL, NULL, 'SEARCH', 1, NULL, NULL, '2023-09-14 12:40:49.563259', '2023-09-14 12:40:49.563348'),
(39, 'Log In definition', 'Log In', 'Connexion', NULL, NULL, 'LOGIN', 1, NULL, NULL, '2023-09-14 12:41:16.003464', '2023-09-14 12:41:16.003508'),
(40, 'Sign Up definition', 'Sign Up', 'Créer un compte', NULL, NULL, 'SIGN_UP', 1, NULL, NULL, '2023-09-14 12:41:33.577380', '2023-09-14 12:41:33.577413'),
(41, 'Open Requests you have made definition', 'Open Requests you have made', 'Vos demandes en cours', NULL, NULL, 'OPEN_REQUESTS_MADE', 1, NULL, NULL, '2023-09-14 12:41:56.799467', '2023-09-14 12:41:56.799507'),
(42, 'Service Requests you have made definition', 'Service Requests you have made', 'Vos demandes de service', NULL, NULL, 'SERVICE_REQUESTS_MADE', 1, NULL, NULL, '2023-09-14 12:42:49.375343', '2023-09-14 12:42:49.375389'),
(43, 'Welcome definition', 'Welcome', 'Bienvenue', NULL, NULL, 'WELCOME', 1, NULL, NULL, '2023-09-14 12:43:09.436007', '2023-09-14 12:43:09.436090'),
(44, 'Request this service definition', 'Request this service', 'Demander ce Service', NULL, NULL, 'REQUEST_THIS_SERVICE', 1, NULL, NULL, '2023-09-14 13:14:05.176555', '2023-09-14 13:14:05.176596'),
(45, 'Requests to you definition', 'Requests to you', 'Requests to you', NULL, NULL, 'REQUESTS_TO_YOU', 1, NULL, NULL, '2023-09-14 19:20:09.695680', '2023-09-14 19:20:09.695719');

-- --------------------------------------------------------

--
-- Table structure for table `project_h_core_cards`
--

CREATE TABLE `project_h_core_cards` (
  `card_id` int(11) NOT NULL,
  `card_number` varchar(100) DEFAULT NULL,
  `expiry_date` varchar(100) DEFAULT NULL,
  `active` tinyint(1) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `user_id_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `project_h_core_countries`
--

CREATE TABLE `project_h_core_countries` (
  `country_id` int(11) NOT NULL,
  `country_name` varchar(50) NOT NULL,
  `can_onboard` smallint(6) DEFAULT NULL,
  `active` smallint(6) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `project_h_core_customers`
--

CREATE TABLE `project_h_core_customers` (
  `customer_id` int(11) NOT NULL,
  `customer_number` varchar(50) NOT NULL,
  `dob` date NOT NULL,
  `active` smallint(6) DEFAULT NULL,
  `is_verified` smallint(6) DEFAULT NULL,
  `ID_number` varchar(50) DEFAULT NULL,
  `language_id` int(11) DEFAULT NULL,
  `profession` varchar(50) DEFAULT NULL,
  `mobile_number` varchar(50) DEFAULT NULL,
  `gender` varchar(6) NOT NULL,
  `picture` varchar(100) DEFAULT NULL,
  `other_names` varchar(80) DEFAULT NULL,
  `address` varchar(80) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `nationality` int(11) DEFAULT NULL,
  `dateTermsAndConditions` datetime(6) DEFAULT NULL,
  `datePrivacyPolicy` datetime(6) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `ID_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `is_host` smallint(6) NOT NULL,
  `delivery_location` varchar(100) DEFAULT NULL,
  `id_image` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `project_h_core_customers`
--

INSERT INTO `project_h_core_customers` (`customer_id`, `customer_number`, `dob`, `active`, `is_verified`, `ID_number`, `language_id`, `profession`, `mobile_number`, `gender`, `picture`, `other_names`, `address`, `location`, `nationality`, `dateTermsAndConditions`, `datePrivacyPolicy`, `created_by`, `updated_by`, `created_at`, `updated_at`, `ID_type_id`, `user_id`, `is_host`, `delivery_location`, `id_image`) VALUES
(4, '2023061411', '2003-12-09', NULL, NULL, '128873', 2, 'Welder', '233557881327', 'm', 'customer_images/1000000033.jpg', NULL, 'FP8 22883', 'Sinsinati', NULL, NULL, NULL, NULL, NULL, '2023-06-14 15:10:42.899820', '2023-09-14 11:49:52.179100', 1, 11, 1, NULL, ''),
(5, '2023071112', '2004-01-01', NULL, NULL, '33992029', NULL, 'Mason', '233269008514', 'm', '', NULL, 'P2 12', 'Accra', NULL, NULL, NULL, NULL, NULL, '2023-07-11 15:08:32.586876', '2023-07-11 16:07:32.176515', 1, 12, 0, NULL, ''),
(6, '2023082513', '2004-01-01', NULL, NULL, 'G1129392', NULL, 'Engineer', '233557881542', 'm', '', NULL, 'Box 12', 'Accra', NULL, NULL, NULL, NULL, NULL, '2023-08-25 12:17:19.593242', '2023-08-25 12:25:12.098336', 1, 13, 0, NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `project_h_core_hostdetails`
--

CREATE TABLE `project_h_core_hostdetails` (
  `host_details_id` int(11) NOT NULL,
  `location_cordinates` varchar(80) DEFAULT NULL,
  `office_address` varchar(80) DEFAULT NULL,
  `service_coverage_zone` varchar(80) DEFAULT NULL,
  `official_certifications` varchar(150) DEFAULT NULL,
  `number_of_years_practice_speciality` varchar(50) DEFAULT NULL,
  `number_of_years_experience` varchar(50) DEFAULT NULL,
  `referrals` varchar(255) DEFAULT NULL,
  `specializations` varchar(255) DEFAULT NULL,
  `audio_video` varchar(100) DEFAULT NULL,
  `languages_spoken` varchar(255) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `host_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `project_h_core_hostdetails`
--

INSERT INTO `project_h_core_hostdetails` (`host_details_id`, `location_cordinates`, `office_address`, `service_coverage_zone`, `official_certifications`, `number_of_years_practice_speciality`, `number_of_years_experience`, `referrals`, `specializations`, `audio_video`, `languages_spoken`, `created_by`, `updated_by`, `created_at`, `updated_at`, `customer_id`, `host_name`) VALUES
(1, 'Sinsinati', 'Box 2778', 'Adabraka and surroundings', 'T26, AZ Certified', '8', '10', 'Kwame', 'Moulding, welding', '', 'English, Twi', NULL, NULL, '2023-06-14 15:22:19.280926', '2023-06-14 15:22:19.281380', 4, 'Terminal Odogo');

-- --------------------------------------------------------

--
-- Table structure for table `project_h_core_hosted_service`
--

CREATE TABLE `project_h_core_hosted_service` (
  `hosted_service_id` int(11) NOT NULL,
  `service_name` varchar(50) NOT NULL,
  `description` longtext,
  `process` longtext,
  `active` smallint(6) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `expected_duration` varchar(20) DEFAULT NULL,
  `price` double NOT NULL,
  `part_payment_allowed` smallint(6) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  `location_cordinates` varchar(100) DEFAULT NULL,
  `service_id` int(11) DEFAULT NULL,
  `service_sub` varchar(50) DEFAULT NULL,
  `service_sub_selected_fields` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `project_h_core_hosted_service`
--

INSERT INTO `project_h_core_hosted_service` (`hosted_service_id`, `service_name`, `description`, `process`, `active`, `location`, `expected_duration`, `price`, `part_payment_allowed`, `created_by`, `updated_by`, `created_at`, `updated_at`, `user_id`, `location_cordinates`, `service_id`, `service_sub`, `service_sub_selected_fields`) VALUES
(1, 'Terminal Odogo', 'I work on pipes and drainages. Your kitchen drainage, bathroom and toilet drainages, please contact me.', 'Drainages,Pipes,Layouts,linking', 1, 'Accra', '4 hours', 400, 0, NULL, NULL, '2023-06-24 16:13:52.304150', '2023-06-24 16:13:52.304339', 11, NULL, 8, NULL, NULL),
(2, 'Terminal Odogo', 'Wardropes', 'Different sizes,Different colors', 1, 'Accra', '6 days', 2300, 0, NULL, NULL, '2023-06-24 17:05:23.872709', '2023-06-24 17:05:23.872886', 11, NULL, 9, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `project_h_core_hostreferrals`
--

CREATE TABLE `project_h_core_hostreferrals` (
  `host_referral_id` int(11) NOT NULL,
  `referral` varchar(50) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `host_details_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `project_h_core_idtypes`
--

CREATE TABLE `project_h_core_idtypes` (
  `IDType_id` int(11) NOT NULL,
  `IDType_name` varchar(40) NOT NULL,
  `active` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `project_h_core_idtypes`
--

INSERT INTO `project_h_core_idtypes` (`IDType_id`, `IDType_name`, `active`) VALUES
(1, 'Passport', 1),
(2, 'National ID', 1);

-- --------------------------------------------------------

--
-- Table structure for table `project_h_core_language`
--

CREATE TABLE `project_h_core_language` (
  `language_id` int(11) NOT NULL,
  `language` varchar(150) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `project_h_core_language`
--

INSERT INTO `project_h_core_language` (`language_id`, `language`, `active`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'English', 1, NULL, NULL, '2023-09-12 23:13:25.323154', '2023-09-12 23:13:25.323195'),
(2, 'French', 1, NULL, NULL, '2023-09-12 23:13:30.064524', '2023-09-12 23:13:30.064564'),
(3, 'Spanish', 1, NULL, NULL, '2023-09-12 23:13:34.076062', '2023-09-12 23:13:34.076092'),
(4, 'Portuguese', 1, NULL, NULL, '2023-09-12 23:13:43.861528', '2023-09-12 23:13:43.861575');

-- --------------------------------------------------------

--
-- Table structure for table `project_h_core_momo`
--

CREATE TABLE `project_h_core_momo` (
  `momo_id` int(11) NOT NULL,
  `number` varchar(30) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `user_id_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `project_h_core_momo`
--

INSERT INTO `project_h_core_momo` (`momo_id`, `number`, `verified`, `active`, `created_by`, `updated_by`, `created_at`, `updated_at`, `user_id_id`) VALUES
(12, '233557881327', 0, 1, 6, NULL, '2023-03-30 02:03:07.067024', '2023-03-30 02:03:07.067181', 6),
(13, '0557881327', 0, 1, 6, NULL, '2023-03-30 04:04:23.553285', '2023-03-30 04:04:23.553401', 6),
(14, '0269008514', 0, 1, 6, NULL, '2023-04-05 20:24:54.209091', '2023-04-05 20:24:54.209131', 6),
(15, '0557881327', 0, 1, 11, NULL, '2023-06-24 19:55:07.627454', '2023-06-24 19:55:07.627501', 11),
(16, '0269008514', 0, 1, 12, NULL, '2023-07-11 15:21:38.765245', '2023-07-11 15:21:38.765339', 12),
(17, '557881542', 0, 1, 13, NULL, '2023-08-25 12:18:12.905171', '2023-08-25 12:18:12.905201', 13);

-- --------------------------------------------------------

--
-- Table structure for table `project_h_core_one_time_pin`
--

CREATE TABLE `project_h_core_one_time_pin` (
  `id` int(11) NOT NULL,
  `mobile_number` varchar(25) NOT NULL,
  `code` varchar(10) NOT NULL,
  `processed` smallint(6) NOT NULL,
  `status` int(11) DEFAULT NULL,
  `active` tinyint(1) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `otp_type` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `project_h_core_one_time_pin`
--

INSERT INTO `project_h_core_one_time_pin` (`id`, `mobile_number`, `code`, `processed`, `status`, `active`, `created_by`, `updated_by`, `created_at`, `updated_at`, `otp_type`) VALUES
(473, '233557881327', '5928', 1, 1, 1, 0, NULL, '2022-12-20 22:25:29.258559', '2022-12-20 22:29:04.620227', 'login'),
(474, '233557881327', '2118', 1, 1, 1, 0, NULL, '2022-12-20 22:54:06.595489', '2022-12-20 22:54:15.167455', 'login'),
(475, '233557881327', '1111', 1, 1, 1, 0, NULL, '2022-12-21 21:25:14.343304', '2022-12-21 21:26:41.350327', 'login'),
(476, '233557881327', '1111', 1, 1, 1, 0, NULL, '2023-01-08 11:27:10.455262', '2023-01-08 11:27:32.353203', 'login'),
(477, '233557881327', '1111', 1, 1, 1, 0, NULL, '2023-01-18 08:31:13.641388', '2023-01-18 08:31:23.686551', 'login'),
(478, '233557881327', '1111', 1, 1, 1, 0, NULL, '2023-01-19 10:08:35.994398', '2023-01-19 10:08:39.719989', 'login'),
(479, '233557881327', '1111', 1, 1, 1, 0, NULL, '2023-01-19 16:08:22.472801', '2023-01-19 16:08:33.765669', 'login'),
(480, '233557881327', '1111', 1, 1, 1, 0, NULL, '2023-01-19 16:27:47.029467', '2023-01-19 16:27:50.664618', 'login'),
(481, '233557881327', '1111', 1, 1, 1, 0, NULL, '2023-01-20 09:25:33.053309', '2023-01-20 09:25:53.898943', 'login'),
(482, '233557881327', '1111', 1, 1, 1, 0, NULL, '2023-01-20 10:16:05.397225', '2023-01-20 10:16:10.833195', 'login'),
(483, '233557881327', '1111', 1, 1, 1, 0, NULL, '2023-01-26 09:00:49.304297', '2023-01-26 09:00:53.378131', 'login'),
(484, '233557881327', '1111', 1, 1, 1, 0, NULL, '2023-01-29 18:30:03.428537', '2023-01-29 18:30:18.033844', 'login'),
(485, '233557881327', '1111', 1, 1, 1, 0, NULL, '2023-01-29 18:40:05.620785', '2023-01-29 18:40:09.226074', 'login'),
(486, '233557881327', '1111', 1, 1, 1, 0, NULL, '2023-02-03 13:55:11.141247', '2023-02-03 13:55:19.802488', 'login'),
(487, '233557881327', '1111', 1, 1, 1, 0, NULL, '2023-02-03 17:48:30.459293', '2023-02-03 17:48:33.768929', 'login'),
(488, '233578876654', '1111', 1, 1, 1, 0, NULL, '2023-02-05 00:34:32.542361', '2023-02-05 00:34:37.155621', 'onboard'),
(489, '233557881327', '1111', 1, 1, 1, 0, NULL, '2023-02-13 23:26:55.789961', '2023-02-13 23:26:59.256873', 'login'),
(490, '233557881327', '1111', 1, 1, 1, 0, NULL, '2023-02-15 16:40:45.578755', '2023-02-15 16:48:09.481383', 'login'),
(491, '233557881327', '1111', 1, 1, 1, 0, NULL, '2023-03-05 14:06:23.526809', '2023-03-05 14:06:26.510763', 'login'),
(492, '233557881327', '1111', 1, 1, 1, 0, NULL, '2023-03-05 22:57:11.020245', '2023-03-05 22:57:15.320795', 'login'),
(493, '233557881327', '1111', 1, 1, 1, 0, NULL, '2023-03-06 00:39:05.200403', '2023-03-06 00:39:08.745153', 'login'),
(494, '233557881327', '1111', 1, 1, 1, 0, NULL, '2023-03-06 00:46:27.542377', '2023-03-06 00:46:31.041063', 'login'),
(495, '233557881327', '1111', 1, 1, 1, 0, NULL, '2023-03-06 07:19:50.022775', '2023-03-06 13:47:04.807468', 'login'),
(496, '233557881327', '1111', 1, 1, 1, 0, NULL, '2023-03-06 07:46:29.471066', '2023-06-13 12:11:24.893658', 'onboard'),
(497, '233557881327', '1111', 1, 1, 1, 0, NULL, '2023-03-06 07:57:04.042662', '2023-03-19 03:06:25.373718', 'login'),
(498, '233557881327', '1111', 1, 1, 1, 0, NULL, '2023-03-06 08:28:17.335130', '2023-06-13 12:22:03.642952', 'onboard'),
(499, '233557881327', '1111', 1, 1, 1, 0, NULL, '2023-03-06 13:38:15.435882', '2023-03-19 03:46:27.747189', 'login'),
(500, '233557881327', '1111', 1, 1, 1, 0, NULL, '2023-03-06 13:46:53.840511', '2023-03-24 09:55:13.038782', 'login'),
(501, '233262180987', '1111', 1, 1, 1, 0, NULL, '2023-03-08 21:41:31.893770', '2023-03-08 21:41:35.080848', 'onboard'),
(502, '233557881327', '1111', 1, 1, 1, 0, NULL, '2023-03-19 03:06:21.529499', '2023-03-26 03:38:01.639451', 'login'),
(503, '233557881327', '1111', 1, 1, 1, 0, NULL, '2023-03-19 03:46:22.829728', '2023-03-26 05:58:51.789032', 'login'),
(504, '233557881327', '1111', 1, 1, 1, 0, NULL, '2023-03-24 09:55:10.270499', '2023-03-26 19:06:01.740100', 'login'),
(505, '233557881327', '1111', 1, 1, 1, 0, NULL, '2023-03-26 03:37:57.006776', '2023-05-14 20:19:16.522699', 'login'),
(506, '233557881327', '1111', 1, 1, 1, 0, NULL, '2023-03-26 05:58:48.109260', '2023-05-22 00:38:22.987403', 'login'),
(507, '233557881327', '1111', 1, 1, 1, 0, NULL, '2023-03-26 19:05:57.981717', '2023-05-22 00:58:17.341780', 'login'),
(508, '233557881327', '1111', 1, 1, 1, 0, NULL, '2023-05-14 20:19:11.784927', '2023-05-22 01:12:24.933853', 'login'),
(509, '233557881327', '1111', 1, 1, 1, 0, NULL, '2023-05-22 00:38:18.418253', '2023-05-22 12:25:39.478949', 'login'),
(510, '233557881327', '1111', 1, 1, 1, 0, NULL, '2023-05-22 00:58:12.499662', '2023-05-22 12:38:10.775221', 'login'),
(511, '233557881327', '1111', 1, 1, 1, 0, NULL, '2023-05-22 01:12:20.444768', '2023-05-22 12:43:49.289662', 'login'),
(512, '233557881327', '1111', 1, 1, 1, 0, NULL, '2023-05-22 12:25:36.597123', '2023-05-22 14:55:27.448388', 'login'),
(513, '233557881327', '1111', 1, 1, 1, 0, NULL, '2023-05-22 12:38:08.317510', '2023-05-22 17:40:45.728039', 'login'),
(514, '233557881327', '1111', 1, 1, 1, 0, NULL, '2023-05-22 12:43:46.661767', '2023-05-22 17:49:30.289429', 'login'),
(515, '233557881327', '1111', 1, 1, 1, 0, NULL, '2023-05-22 14:55:24.104899', '2023-05-22 17:51:55.642638', 'login'),
(516, '233557881327', '1111', 1, 1, 1, 0, NULL, '2023-05-22 17:40:42.836169', '2023-05-22 17:55:17.304157', 'login'),
(517, '233557881327', '1111', 1, 1, 1, 0, NULL, '2023-05-22 17:49:25.497444', '2023-05-22 17:57:59.135288', 'login'),
(518, '233557881327', '1111', 1, 1, 1, 0, NULL, '2023-05-22 17:51:52.518354', '2023-05-22 18:01:54.728925', 'login'),
(519, '233557881327', '1111', 1, 1, 1, 0, NULL, '2023-05-22 17:55:11.349442', '2023-05-22 18:09:48.022487', 'login'),
(520, '233557881327', '1111', 1, 1, 1, 0, NULL, '2023-05-22 17:57:55.327291', '2023-05-22 18:38:26.408235', 'login'),
(521, '233557881327', '1111', 1, 1, 1, 0, NULL, '2023-05-22 18:01:51.628230', '2023-05-23 02:21:22.673068', 'login'),
(522, '233557881327', '1111', 1, 1, 1, 0, NULL, '2023-05-22 18:09:42.851960', '2023-05-23 02:25:13.385042', 'login'),
(523, '233557881327', '1111', 1, 1, 1, 0, NULL, '2023-05-22 18:38:23.711437', '2023-05-23 11:11:19.217316', 'login'),
(524, '233557881327', '1111', 1, 1, 1, 0, NULL, '2023-05-23 02:21:15.524097', '2023-05-23 11:23:13.775855', 'login'),
(525, '233557881327', '1111', 1, 1, 1, 0, NULL, '2023-05-23 02:25:09.495602', '2023-05-23 11:28:13.984844', 'login'),
(526, '233557881327', '1111', 1, 1, 1, 0, NULL, '2023-05-23 11:11:16.236636', '2023-05-23 16:02:40.485837', 'login'),
(527, '233557881327', '1111', 1, 1, 1, 0, NULL, '2023-05-23 11:23:10.248028', '2023-05-23 16:55:59.019059', 'login'),
(528, '233557881327', '1111', 1, 1, 1, 0, NULL, '2023-05-23 11:28:11.075657', '2023-05-23 18:22:13.450893', 'login'),
(529, '233557881327', '1111', 1, 1, 1, 0, NULL, '2023-05-23 16:02:37.884209', '2023-05-24 20:46:26.093945', 'login'),
(530, '233557881327', '1111', 1, 1, 1, 0, NULL, '2023-05-23 16:55:48.791791', '2023-05-24 21:15:08.458383', 'login'),
(531, '233557881327', '1111', 1, 1, 1, 0, NULL, '2023-05-23 18:22:09.111553', '2023-06-13 12:39:54.346468', 'login'),
(532, '233557881327', '1111', 1, 1, 1, 0, NULL, '2023-05-24 20:46:13.735687', '2023-06-13 12:56:38.107126', 'login'),
(533, '233557881327', '1111', 1, 1, 1, 0, NULL, '2023-05-24 21:15:03.392317', '2023-06-13 12:57:44.499024', 'login'),
(534, '233557881327', '1111', 1, 1, 1, 0, NULL, '2023-06-13 12:11:19.933127', '2023-06-14 12:15:34.021209', 'onboard'),
(535, '233557881327', '1111', 1, 1, 1, 0, NULL, '2023-06-13 12:39:48.870159', '2023-06-13 12:58:46.959488', 'login'),
(536, '233557881327', '1111', 1, 1, 1, 0, NULL, '2023-06-13 12:56:33.233837', '2023-06-14 17:03:48.357840', 'login'),
(537, '233557881327', '1111', 1, 1, 1, 0, NULL, '2023-06-13 12:57:40.094290', '2023-06-14 17:19:59.187630', 'login'),
(538, '233557881327', '1111', 1, 1, 1, 0, NULL, '2023-06-13 12:58:42.876153', '2023-06-24 01:27:18.378399', 'login'),
(539, '233557881327', '1111', 1, 1, 1, 0, NULL, '2023-06-14 12:15:27.096613', '2023-06-14 15:00:02.141194', 'onboard'),
(540, '233557881327', '1111', 1, 1, 1, 0, NULL, '2023-06-14 14:59:55.836846', '2023-06-14 15:04:33.067495', 'onboard'),
(541, '233557881327', '1111', 1, 1, 1, 0, NULL, '2023-06-14 15:04:28.661448', '2023-06-14 15:10:12.234056', 'onboard'),
(542, '233557881327', '1111', 0, 0, 1, 0, NULL, '2023-06-14 15:10:08.481933', '2023-06-14 15:10:08.481982', 'onboard'),
(543, '233557881327', '1111', 1, 1, 1, 0, NULL, '2023-06-14 17:03:43.647834', '2023-06-24 14:22:52.683646', 'login'),
(544, '233557881327', '1111', 1, 1, 1, 0, NULL, '2023-06-14 17:19:12.038619', '2023-06-24 14:54:53.640338', 'login'),
(545, '233557881327', '1111', 1, 1, 1, 0, NULL, '2023-06-24 01:27:13.086663', '2023-06-24 15:56:58.378583', 'login'),
(546, '233557881327', '1111', 1, 1, 1, 0, NULL, '2023-06-24 14:22:23.602882', '2023-06-24 19:58:30.502683', 'login'),
(547, '233557881327', '1111', 1, 1, 1, 0, NULL, '2023-06-24 14:54:49.888273', '2023-06-24 20:18:53.346119', 'login'),
(548, '233557881327', '1111', 1, 1, 1, 0, NULL, '2023-06-24 15:54:19.913849', '2023-06-24 20:25:21.740981', 'login'),
(549, '233557881327', '1111', 1, 1, 1, 0, NULL, '2023-06-24 19:58:25.009225', '2023-07-11 16:12:39.733016', 'login'),
(550, '233557881327', '1111', 1, 1, 1, 0, NULL, '2023-06-24 20:18:37.620586', '2023-07-11 16:58:23.139382', 'login'),
(551, '233557881327', '1111', 1, 1, 1, 0, NULL, '2023-06-24 20:25:14.380523', '2023-08-20 23:50:03.690658', 'login'),
(552, '233269008514', '1111', 1, 1, 1, 0, NULL, '2023-07-11 15:07:53.623383', '2023-07-11 15:07:58.258520', 'onboard'),
(553, '233269008514', '1111', 1, 1, 1, 0, NULL, '2023-07-11 15:15:51.311485', '2023-07-11 15:15:56.716995', 'login'),
(554, '233269008514', '1111', 1, 1, 1, 0, NULL, '2023-07-11 15:20:46.420973', '2023-07-11 15:20:51.100617', 'login'),
(555, '233557881327', '1111', 1, 1, 1, 0, NULL, '2023-07-11 16:12:35.486939', '2023-08-22 15:42:55.243432', 'login'),
(556, '233269008514', '1111', 1, 1, 1, 0, NULL, '2023-07-11 16:19:08.191446', '2023-07-11 16:19:12.267136', 'login'),
(557, '233557881327', '1111', 1, 1, 1, 0, NULL, '2023-07-11 16:55:16.312747', '2023-08-24 16:29:50.438336', 'login'),
(558, '233557881327', '1111', 1, 1, 1, 0, NULL, '2023-08-20 23:49:57.296897', '2023-08-24 17:03:11.626904', 'login'),
(559, '233557881327', '1111', 1, 1, 1, 0, NULL, '2023-08-22 15:42:49.178732', '2023-08-25 10:38:41.403422', 'login'),
(560, '233269008514', '1111', 1, 1, 1, 0, NULL, '2023-08-24 13:05:38.256677', '2023-08-24 13:05:42.556875', 'login'),
(561, '233557881327', '1111', 1, 1, 1, 0, NULL, '2023-08-24 16:29:45.364751', '2023-08-25 11:39:11.965631', 'login'),
(562, '233269008514', '1111', 1, 1, 1, 0, NULL, '2023-08-24 16:51:36.764372', '2023-08-24 16:51:41.843489', 'login'),
(563, '233557881327', '1111', 1, 1, 1, 0, NULL, '2023-08-24 17:03:06.221139', '2023-08-25 11:40:50.516024', 'login'),
(564, '233269008514', '1111', 1, 1, 1, 0, NULL, '2023-08-25 10:36:52.096505', '2023-08-25 10:36:56.720784', 'login'),
(565, '233557881327', '1111', 1, 1, 1, 0, NULL, '2023-08-25 10:38:36.262319', '2023-08-25 12:25:59.133695', 'login'),
(566, '233269008514', '1111', 1, 1, 1, 0, NULL, '2023-08-25 11:29:32.640571', '2023-08-25 11:29:46.302839', 'login'),
(567, '233269008514', '1111', 1, 1, 1, 0, NULL, '2023-08-25 11:38:17.864810', '2023-08-25 11:38:21.874375', 'login'),
(568, '233557881327', '1111', 1, 1, 1, 0, NULL, '2023-08-25 11:39:07.848106', '2023-08-25 12:51:37.573538', 'login'),
(569, '233557881327', '1111', 1, 1, 1, 0, NULL, '2023-08-25 11:40:45.410901', '2023-08-25 12:53:01.001586', 'login'),
(570, '233269008514', '1111', 1, 1, 1, 0, NULL, '2023-08-25 11:41:22.751313', '2023-08-25 11:41:26.714077', 'login'),
(571, '233557881542', '1111', 1, 1, 1, 0, NULL, '2023-08-25 12:16:22.962395', '2023-08-25 12:16:28.978329', 'onboard'),
(572, '233557881327', '1111', 1, 1, 1, 0, NULL, '2023-08-25 12:25:54.626215', '2023-08-25 13:03:11.953396', 'login'),
(573, '233269008514', '1111', 1, 1, 1, 0, NULL, '2023-08-25 12:31:56.315232', '2023-08-25 12:32:00.302869', 'login'),
(574, '233269008514', '1111', 1, 1, 1, 0, NULL, '2023-08-25 12:37:58.033334', '2023-08-25 12:38:04.536950', 'login'),
(575, '233269008514', '1111', 1, 1, 1, 0, NULL, '2023-08-25 12:39:01.580301', '2023-08-25 12:39:07.805999', 'login'),
(576, '233269008514', '1111', 1, 1, 1, 0, NULL, '2023-08-25 12:41:35.990002', '2023-08-25 12:41:43.935051', 'login'),
(577, '233557881327', '1111', 1, 1, 1, 0, NULL, '2023-08-25 12:51:33.508214', '2023-08-25 13:04:41.248420', 'login'),
(578, '233557881327', '1111', 1, 1, 1, 0, NULL, '2023-08-25 12:52:57.947186', '2023-08-25 13:11:22.017257', 'login'),
(579, '233557881327', '1111', 1, 1, 1, 0, NULL, '2023-08-25 13:00:23.083735', '2023-08-25 13:15:52.398643', 'login'),
(580, '233557881327', '1111', 1, 1, 1, 0, NULL, '2023-08-25 13:00:50.483458', '2023-09-13 10:15:14.817870', 'login'),
(581, '233557881327', '1111', 1, 1, 1, 0, NULL, '2023-08-25 13:02:32.976477', '2023-09-14 23:37:18.236774', 'login'),
(582, '233557881327', '1111', 0, 0, 1, 0, NULL, '2023-08-25 13:04:34.756006', '2023-08-25 13:04:34.756068', 'login'),
(583, '233557881327', '1111', 0, 0, 1, 0, NULL, '2023-08-25 13:11:18.062958', '2023-08-25 13:11:18.063023', 'login'),
(584, '233557881327', '1111', 0, 0, 1, 0, NULL, '2023-08-25 13:15:28.879928', '2023-08-25 13:15:28.880012', 'login'),
(585, '233269008514', '1111', 1, 1, 1, 0, NULL, '2023-08-25 13:16:14.104982', '2023-08-25 13:16:18.427526', 'login'),
(586, '233557881327', '1111', 0, 0, 1, 0, NULL, '2023-09-13 10:15:08.178137', '2023-09-13 10:15:08.178436', 'login'),
(587, '233557881327', '1111', 0, 0, 1, 0, NULL, '2023-09-14 23:37:12.927360', '2023-09-14 23:37:12.928673', 'login');

-- --------------------------------------------------------

--
-- Table structure for table `project_h_core_payments`
--

CREATE TABLE `project_h_core_payments` (
  `id` int(11) NOT NULL,
  `amount` varchar(12) NOT NULL,
  `amount_paid` varchar(12) NOT NULL,
  `payment_status` varchar(10) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `payment_for_id` int(11) NOT NULL,
  `payment_from_id` int(11) NOT NULL,
  `payment_to_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `project_h_core_payment_methods`
--

CREATE TABLE `project_h_core_payment_methods` (
  `payment_method_id` int(11) NOT NULL,
  `payment_method_name` varchar(100) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `project_h_core_payment_methods`
--

INSERT INTO `project_h_core_payment_methods` (`payment_method_id`, `payment_method_name`, `active`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'Credit Card', 0, 1, 1, '2022-12-18 15:41:49.579624', '2022-12-18 15:41:49.579656'),
(2, 'Mobile Money', 1, NULL, NULL, '2023-01-29 12:02:13.000000', '2023-01-29 12:02:13.000000');

-- --------------------------------------------------------

--
-- Table structure for table `project_h_core_profilemenu`
--

CREATE TABLE `project_h_core_profilemenu` (
  `profile_menu_id` int(11) NOT NULL,
  `menu_number` int(11) NOT NULL,
  `menu_name_ENGLISH` varchar(255) NOT NULL,
  `menu_name_FRENCH` varchar(255) DEFAULT NULL,
  `menu_name_SPANISH` varchar(255) DEFAULT NULL,
  `menu_name_PORTUGAL` varchar(255) DEFAULT NULL,
  `menu_description_ENGLISH` varchar(255) DEFAULT NULL,
  `menu_description_FRENCH` varchar(255) DEFAULT NULL,
  `menu_description_SPANISH` varchar(255) DEFAULT NULL,
  `menu_description_PORTUGAL` varchar(255) DEFAULT NULL,
  `menu_icon` varchar(20) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `to_path` varchar(255) DEFAULT NULL,
  `category` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `project_h_core_profilemenu`
--

INSERT INTO `project_h_core_profilemenu` (`profile_menu_id`, `menu_number`, `menu_name_ENGLISH`, `menu_name_FRENCH`, `menu_name_SPANISH`, `menu_name_PORTUGAL`, `menu_description_ENGLISH`, `menu_description_FRENCH`, `menu_description_SPANISH`, `menu_description_PORTUGAL`, `menu_icon`, `active`, `created_by`, `updated_by`, `created_at`, `updated_at`, `to_path`, `category`) VALUES
(1, 1, 'Personal Information', 'Personal Information', NULL, NULL, 'Personal Information', NULL, NULL, NULL, 'Icons.person', 1, NULL, NULL, '2023-09-12 21:38:11.761281', '2023-09-12 21:38:11.761315', '/personal-information', 'Account settings'),
(2, 2, 'Payments and Payouts', 'Paiements', NULL, NULL, 'Payments and Payouts', NULL, NULL, NULL, 'Icons.money', 1, NULL, NULL, '2023-09-12 21:39:26.975459', '2023-09-12 21:39:26.975502', '/payment-methods', 'Account settings'),
(3, 3, 'Privacy and Sharing', NULL, NULL, NULL, 'Privacy and Sharing', NULL, NULL, NULL, 'Icons.money', 1, NULL, NULL, '2023-09-12 21:40:40.642387', '2023-09-12 21:40:40.642414', '/personal-information', 'Account settings'),
(4, 4, 'Host a service', 'Fournir un Service', NULL, NULL, NULL, NULL, NULL, NULL, 'Icons.add_home_outli', 1, NULL, NULL, '2023-09-12 22:10:14.293826', '2023-09-12 22:10:14.293858', '/edit-personal-information', 'Hosting'),
(5, 5, 'Logout', 'Déconnexion', NULL, NULL, 'Logout', 'Déconnexion', NULL, NULL, 'Icons.logout', 1, NULL, NULL, '2023-09-12 22:30:02.670187', '2023-09-12 23:21:38.043051', '/logout', 'Logout');

-- --------------------------------------------------------

--
-- Table structure for table `project_h_core_requestnotice`
--

CREATE TABLE `project_h_core_requestnotice` (
  `request_notice_id` int(11) NOT NULL,
  `preferences` varchar(255) DEFAULT NULL,
  `key_words` varchar(255) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `served` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `category_id` int(11) NOT NULL,
  `created_by_id` int(11) NOT NULL,
  `view_count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `project_h_core_requestnotice`
--

INSERT INTO `project_h_core_requestnotice` (`request_notice_id`, `preferences`, `key_words`, `location`, `served`, `active`, `updated_by`, `created_at`, `updated_at`, `category_id`, `created_by_id`, `view_count`) VALUES
(1, 'I need someone to assist me do some tiling works. This includes 2 bedrooms and a kitchen.', '', '', 0, 1, NULL, '2023-06-24 19:57:23.130459', '2023-08-24 16:51:58.959415', 7, 11, 13),
(2, 'work needed on a field. We would be mixing mortar for construction.', '', '', 0, 1, NULL, '2023-06-24 20:03:36.452497', '2023-08-25 10:27:28.367840', 2, 11, 4),
(3, 'I am looking for a roofing expect', '', '', 0, 1, NULL, '2023-07-11 16:54:46.466502', '2023-08-21 22:16:30.233276', 5, 12, 1),
(4, 'Looking for a clay molder', '', '', 0, 1, NULL, '2023-08-21 22:09:31.000904', '2023-08-21 22:09:31.000989', 3, 11, 0);

-- --------------------------------------------------------

--
-- Table structure for table `project_h_core_requestnoticeresponses`
--

CREATE TABLE `project_h_core_requestnoticeresponses` (
  `request_response_id` int(11) NOT NULL,
  `accepted` smallint(6) NOT NULL,
  `response` longtext,
  `is_first_response` tinyint(1) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `created_by_id` int(11) NOT NULL,
  `request_notice_id` int(11) NOT NULL,
  `view_count` int(11) NOT NULL,
  `conversation_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `project_h_core_requestnoticeresponses`
--

INSERT INTO `project_h_core_requestnoticeresponses` (`request_response_id`, `accepted`, `response`, `is_first_response`, `active`, `updated_by`, `created_at`, `updated_at`, `created_by_id`, `request_notice_id`, `view_count`, `conversation_id`) VALUES
(7, 0, 'testing 1 2 1 2', 0, 1, NULL, '2023-08-24 16:58:21.845696', '2023-08-24 16:58:21.851843', 12, 1, 0, 'C20230824.165821.7'),
(8, 0, 'test 234 889', 0, 1, NULL, '2023-08-25 10:24:40.768238', '2023-08-25 10:24:40.816612', 11, 1, 0, 'C20230824.165821.7');

-- --------------------------------------------------------

--
-- Table structure for table `project_h_core_requestresponses`
--

CREATE TABLE `project_h_core_requestresponses` (
  `request_response_id` int(11) NOT NULL,
  `response` longtext,
  `accepted` smallint(6) NOT NULL,
  `is_first_response` tinyint(1) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `created_by_id` int(11) NOT NULL,
  `request_id` int(11) NOT NULL,
  `conversation_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `project_h_core_requestresponses`
--

INSERT INTO `project_h_core_requestresponses` (`request_response_id`, `response`, `accepted`, `is_first_response`, `active`, `updated_by`, `created_at`, `updated_at`, `created_by_id`, `request_id`, `conversation_id`) VALUES
(8, 'Thanks for requesting', 0, 0, 1, NULL, '2023-08-25 11:40:18.451437', '2023-08-25 11:40:18.451479', 11, 5, 'C20230825.114018'),
(9, 'I want to work with you too. Lets meet.', 1, 0, 1, NULL, '2023-08-25 12:08:12.519841', '2023-08-25 12:08:12.519891', 12, 5, 'C20230825.120812'),
(10, 'I would serve this request. Let me know atime and day.', 0, 0, 1, NULL, '2023-08-25 12:26:34.134117', '2023-08-25 12:26:34.134165', 11, 4, 'C20230825.122634'),
(12, 'I would be interested in taking n this request. Hit me up.', 1, 0, 1, NULL, '2023-08-25 12:30:18.376447', '2023-08-25 12:30:18.381085', 11, 4, 'C20230825.123018.12');

-- --------------------------------------------------------

--
-- Table structure for table `project_h_core_requests`
--

CREATE TABLE `project_h_core_requests` (
  `request_id` int(11) NOT NULL,
  `choice` varchar(100) DEFAULT NULL,
  `preferences` varchar(255) DEFAULT NULL,
  `active` smallint(6) DEFAULT NULL,
  `charge` double DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `host_id` int(11) NOT NULL,
  `host_service_id` int(11) NOT NULL,
  `payment_method_id` int(11) DEFAULT NULL,
  `requester_id` int(11) NOT NULL,
  `payment_option_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `project_h_core_requests`
--

INSERT INTO `project_h_core_requests` (`request_id`, `choice`, `preferences`, `active`, `charge`, `created_by`, `updated_by`, `created_at`, `updated_at`, `host_id`, `host_service_id`, `payment_method_id`, `requester_id`, `payment_option_id`) VALUES
(4, '', '', 2, 400, 12, NULL, '2023-08-25 10:38:01.806155', '2023-08-25 12:30:18.387095', 11, 1, 2, 12, 13),
(5, '', '', 2, 400, 12, NULL, '2023-08-25 11:38:46.483986', '2023-08-25 12:08:12.526782', 11, 1, 2, 12, 13),
(6, '', '', 1, 2300, 13, NULL, '2023-08-25 12:25:34.065662', '2023-08-25 12:25:34.065706', 11, 2, 2, 13, 13);

-- --------------------------------------------------------

--
-- Table structure for table `project_h_core_servicecategories`
--

CREATE TABLE `project_h_core_servicecategories` (
  `service_category_id` int(11) NOT NULL,
  `service_category_name_ENGLISH` varchar(255) NOT NULL,
  `service_category_name_FRENCH` varchar(255) DEFAULT NULL,
  `service_category_name_SPANISH` varchar(255) DEFAULT NULL,
  `service_category_name_PORTUGAL` varchar(255) DEFAULT NULL,
  `service_category_description_ENGLISH` varchar(255) DEFAULT NULL,
  `service_category_description_FRENCH` varchar(255) DEFAULT NULL,
  `service_category_description_SPANISH` varchar(255) DEFAULT NULL,
  `service_category_description_PORTUGAL` varchar(255) DEFAULT NULL,
  `service_category_icon` varchar(20) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `project_h_core_services`
--

CREATE TABLE `project_h_core_services` (
  `service_id` int(11) NOT NULL,
  `service_name` varchar(50) DEFAULT NULL,
  `description` longtext,
  `active` smallint(6) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `service_icon` varchar(80) DEFAULT NULL,
  `has_form` tinyint(1) NOT NULL,
  `display_type` varchar(50) DEFAULT NULL,
  `service_category_description_ENGLISH` varchar(255) DEFAULT NULL,
  `service_category_description_FRENCH` varchar(255) DEFAULT NULL,
  `service_category_description_PORTUGAL` varchar(255) DEFAULT NULL,
  `service_category_description_SPANISH` varchar(255) DEFAULT NULL,
  `service_category_name_ENGLISH` varchar(255) DEFAULT NULL,
  `service_category_name_FRENCH` varchar(255) DEFAULT NULL,
  `service_category_name_PORTUGAL` varchar(255) DEFAULT NULL,
  `service_category_name_SPANISH` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `project_h_core_services`
--

INSERT INTO `project_h_core_services` (`service_id`, `service_name`, `description`, `active`, `created_by`, `updated_by`, `created_at`, `updated_at`, `service_icon`, `has_form`, `display_type`, `service_category_description_ENGLISH`, `service_category_description_FRENCH`, `service_category_description_PORTUGAL`, `service_category_description_SPANISH`, `service_category_name_ENGLISH`, `service_category_name_FRENCH`, `service_category_name_PORTUGAL`, `service_category_name_SPANISH`) VALUES
(1, 'New', 'All services', 1, NULL, NULL, '2022-11-14 09:13:04.160034', '2023-09-13 23:45:51.706783', '0xe77d,MaterialIcons', 0, NULL, 'New', NULL, NULL, NULL, 'New', 'Nouveau', NULL, NULL),
(2, 'Construction', 'Service for constructions', 1, NULL, NULL, '2022-11-14 09:13:32.097459', '2023-09-11 20:10:09.654827', '0xe886,MaterialIcons', 0, NULL, 'Service for constructions', NULL, NULL, NULL, 'Construction', 'Maconnerie', NULL, NULL),
(3, 'Building Materials', 'Building materials for sale', 1, NULL, NULL, '2022-11-14 09:20:46.272037', '2023-09-11 20:11:19.313689', '0xe116,MaterialIcons', 0, NULL, 'Building materials for sale', NULL, NULL, NULL, 'Building Materials', 'Materiaux de Construction', NULL, NULL),
(4, 'Painting', 'Painting of your buildings', 1, NULL, NULL, '2022-11-14 09:21:19.675771', '2023-09-13 23:44:54.972602', '0xe9b6,MaterialIcons', 0, NULL, 'Painting of your buildings', 'Peinture', NULL, NULL, 'Painting', 'Peinture', NULL, NULL),
(5, 'Roofing', 'Roofing your building', 1, NULL, NULL, '2022-11-14 09:21:39.931058', '2023-09-13 23:44:50.979530', '0xf31d,MaterialIcons', 0, NULL, 'Roofing your building', 'Toiture', NULL, NULL, 'Roofing', 'Toiture', NULL, NULL),
(6, 'Electrical Works', 'Get professionals to wire your building', 1, NULL, NULL, '2022-11-14 11:32:10.364250', '2023-09-13 23:44:46.401283', '0xf016,MaterialIcons', 0, NULL, 'Get professionals to wire your building', 'Electricite', NULL, NULL, 'Electrical Works', 'Electricite', NULL, NULL),
(7, 'Tiling', 'Add tiles to your floor', 1, NULL, NULL, '2022-11-14 11:32:24.186542', '2023-09-13 23:44:42.112921', '0xe97d,MaterialIcons', 1, NULL, 'Add tiles to your floor', 'Carrelage', NULL, NULL, 'Tiling', 'Carrelage', NULL, NULL),
(8, 'Plumbing', 'Pipe works for water flow', 1, NULL, NULL, '2023-03-21 22:50:22.000000', '2023-09-13 23:45:55.968050', '0xe4d5,MaterialIcons', 1, NULL, 'Plumbing', NULL, NULL, NULL, 'Plumbing', 'Plomberie', NULL, NULL),
(9, 'Carpentry', 'Carpentry works', 1, NULL, NULL, '2023-03-21 23:50:10.000000', '2023-09-11 20:17:25.218396', '0xe141,MaterialIcons', 1, NULL, 'Carpentry works', 'Menuliserie', NULL, NULL, 'Carpentry', 'Menuliserie', NULL, NULL),
(10, 'Home Decor', 'Home decorations and beautifications', 1, 1, 1, '2023-06-13 18:01:23.000000', '2023-09-13 23:45:37.729494', '0xe8bd,MaterialIcons', 0, NULL, 'Home decorations and beautifications', 'Decoration', NULL, NULL, 'Home Decor', 'Decoration', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `project_h_core_services_sub_categories`
--

CREATE TABLE `project_h_core_services_sub_categories` (
  `service_sub_category_id` int(11) NOT NULL,
  `service_sub_category` varchar(50) DEFAULT NULL,
  `service_sub_category_fields` longtext,
  `service_sub_category_icon` varchar(80) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `active` smallint(6) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `service_id_id` int(11) DEFAULT NULL,
  `has_subs` tinyint(1) NOT NULL,
  `display_type` varchar(50) DEFAULT NULL,
  `label` varchar(50) DEFAULT NULL,
  `option_for` int(11)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `project_h_core_services_sub_categories`
--

INSERT INTO `project_h_core_services_sub_categories` (`service_sub_category_id`, `service_sub_category`, `service_sub_category_fields`, `service_sub_category_icon`, `description`, `active`, `created_by`, `updated_by`, `created_at`, `updated_at`, `service_id_id`, `has_subs`, `display_type`, `label`, `option_for`) VALUES
(7, 'Position', 'Wall', NULL, NULL, 1, NULL, NULL, '2023-03-23 11:06:26.000000', '2023-03-23 11:06:26.000000', 7, 1, 'dropDown', '0', 0),
(16, 'Position', 'Floor', NULL, 'Floor', 1, 1, 1, '2023-05-09 12:17:41.000000', '2023-05-09 12:17:41.000000', 7, 1, 'dropDown', '0', 0),
(17, 'Position', 'Exterior', NULL, 'Exterior', 1, 1, 1, '2023-05-09 12:30:59.000000', '2023-05-09 12:30:59.000000', 7, 1, 'checkBox', '0', 7),
(18, 'Position', 'Exterior', NULL, 'Exterior', 1, 1, 1, '2023-05-09 12:30:59.000000', '2023-05-09 12:30:59.000000', 7, 1, 'checkBox', '0', 16),
(19, 'Position', 'Interior', NULL, 'Interior', 1, 1, 1, '2023-05-10 12:42:52.000000', '2023-05-10 12:42:52.000000', 7, 1, 'checkBox', '0', 7),
(20, 'Position', 'Interior', NULL, 'Interior', 1, 1, 1, '2023-05-10 12:42:52.000000', '2023-05-10 12:42:52.000000', 7, 1, 'checkBox', '0', 16),
(21, 'Position', 'Room', NULL, 'Rooms', 1, 1, 1, '2023-05-10 12:58:22.000000', '2023-05-10 12:58:22.000000', 7, 1, 'textBox', '0', 19),
(22, 'Position', 'Room', NULL, 'Rooms', 1, 1, 1, '2023-05-10 12:58:22.000000', '2023-05-10 12:58:22.000000', 7, 1, 'textBox', '0', 20),
(23, 'Position', 'Washroom', NULL, 'Washroom', 1, 1, 1, '2023-05-10 13:03:15.000000', '2023-05-10 13:03:15.000000', 7, 1, 'textBox', '0', 19),
(24, 'Position', 'Washroom', NULL, 'Washroom', 1, 1, 1, '2023-05-10 13:04:02.000000', '2023-05-10 13:04:02.000000', 7, 1, 'textBox', '0', 20),
(25, 'Position', 'Kitchen', NULL, 'Kitchen', 1, 1, 1, '2023-05-10 13:04:53.000000', '2023-05-10 13:04:53.000000', 7, 1, 'textBox', '0', 19),
(26, 'Position', 'Kitchen', NULL, 'Kitchen', 1, 1, 1, '2023-05-10 13:05:49.000000', '2023-05-10 13:05:49.000000', 7, 1, 'textBox', '0', 20),
(27, 'Position', 'Number of rooms', NULL, 'Number of rooms', 1, 1, 1, '2023-05-10 13:06:30.000000', '2023-05-10 13:06:30.000000', 7, 0, 'textBox', 'Number of rooms', 21),
(28, 'Position', 'Number of rooms', NULL, 'Number of rooms', 1, 1, 1, '2023-05-10 13:06:30.000000', '2023-05-10 13:06:30.000000', 7, 0, 'textBox', 'Number of rooms', 22),
(29, 'Position', 'Square Meters', NULL, 'Square Meters', 1, 1, 1, '2023-05-10 18:09:18.000000', '2023-05-10 18:09:18.000000', 7, 0, 'textBox', 'Square Meters', 21),
(30, 'Position', 'Square Meters', NULL, 'Square Meters', 1, 1, 1, '2023-05-10 18:10:02.000000', '2023-05-10 18:10:02.000000', 7, 0, 'textBox', 'Square Meters', 22),
(31, 'Position', 'Number of Washrooms', NULL, 'Number of washrooms', 1, 1, 1, '2023-05-10 13:06:30.000000', '2023-05-10 13:06:30.000000', 7, 0, 'textBox', 'Number of washrooms', 23),
(32, 'Position', 'Number of Washrooms', NULL, 'Number of washrooms', 1, 1, 1, '2023-05-10 13:06:30.000000', '2023-05-10 13:06:30.000000', 7, 0, 'textBox', 'Number of washrooms', 24),
(33, 'Position', 'Square Meters', NULL, 'Square Meters', 1, 1, 1, '2023-05-10 18:09:18.000000', '2023-05-10 18:09:18.000000', 7, 0, 'textBox', 'Square Meters', 23),
(34, 'Position', 'Square Meters', NULL, 'Square Meters', 1, 1, 1, '2023-05-10 18:10:02.000000', '2023-05-10 18:10:02.000000', 7, 0, 'textBox', 'Square Meters', 24),
(38, 'Position', 'Number of Kitchens', NULL, 'Number of kitchens', 1, 1, 1, '2023-05-10 13:06:30.000000', '2023-05-10 13:06:30.000000', 7, 0, 'textBox', 'Number of kitchens', 25),
(39, 'Position', 'Number of Kitchens', NULL, 'Number of kitchens', 1, 1, 1, '2023-05-10 13:06:30.000000', '2023-05-10 13:06:30.000000', 7, 0, 'textBox', 'Number of kitchens', 26),
(40, 'Position', 'Square Meters', NULL, 'Square Meters', 1, 1, 1, '2023-05-10 18:09:18.000000', '2023-05-10 18:09:18.000000', 7, 0, 'textBox', 'Square Meters', 25),
(41, 'Position', 'Square Meters', NULL, 'Square Meters', 1, 1, 1, '2023-05-10 18:10:02.000000', '2023-05-10 18:10:02.000000', 7, 0, 'textBox', 'Square Meters', 26),
(45, 'Position', 'Pavement', NULL, 'Pavement works', 1, 1, 1, '2023-05-10 13:06:30.000000', '2023-05-10 13:06:30.000000', 7, 0, 'textBox', 'Pavement', 18),
(46, 'Position', 'Chippings', NULL, 'Chipping works', 1, 1, 1, '2023-05-10 13:06:30.000000', '2023-05-10 13:06:30.000000', 7, 0, 'textBox', 'Chippings', 18),
(47, 'Position', 'Square Meters', NULL, 'Square Meters', 1, 1, 1, '2023-05-10 18:09:18.000000', '2023-05-10 18:09:18.000000', 7, 0, 'textBox', 'Square Meters', 45),
(48, 'Position', 'Square Meters', NULL, 'Square Meters', 1, 1, 1, '2023-05-10 18:10:02.000000', '2023-05-10 18:10:02.000000', 7, 0, 'textBox', 'Square Meters', 46);

-- --------------------------------------------------------

--
-- Table structure for table `project_h_core_services_sub_category_fields`
--

CREATE TABLE `project_h_core_services_sub_category_fields` (
  `service_sub_category_field_id` int(11) NOT NULL,
  `field1` varchar(50) DEFAULT NULL,
  `has_subs` tinyint(1) NOT NULL,
  `field_options` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `active` smallint(6) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `service_sub_category_id` int(11) DEFAULT NULL,
  `display_type` varchar(50) DEFAULT NULL,
  `label` varchar(50) DEFAULT NULL,
  `subs_display_type` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `project_h_core_services_sub_category_fields`
--

INSERT INTO `project_h_core_services_sub_category_fields` (`service_sub_category_field_id`, `field1`, `has_subs`, `field_options`, `description`, `active`, `created_by`, `updated_by`, `created_at`, `updated_at`, `service_sub_category_id`, `display_type`, `label`, `subs_display_type`) VALUES
(5, 'Exterior', 1, 'Pavement;Chippings', NULL, 1, NULL, NULL, '2023-03-23 11:40:27.000000', '2023-03-23 11:40:27.000000', 7, 'label', '1', 'checkBox'),
(6, 'Interior', 1, 'Room;Washroom;Kitchen', 'Room,textBox,Number of rooms; Washroom,textBox, Number of washrooms; Kitchen,textBox, Number of kitchens;', 1, NULL, NULL, '2023-03-23 11:40:27.000000', '2023-03-23 11:40:27.000000', 7, 'label', '1', 'checkBox'),
(7, 'Inlet', 1, 'Kitchen; Washroom Fittings', NULL, 1, NULL, NULL, '2023-03-23 12:34:05.000000', '2023-03-23 12:34:05.000000', 9, 'checkBox', '0', 'checkBox'),
(8, 'Outlet', 0, NULL, NULL, NULL, NULL, NULL, '2023-03-23 12:34:05.000000', '2023-03-23 12:34:05.000000', 9, 'checkBox', '0', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `project_h_core_service_images`
--

CREATE TABLE `project_h_core_service_images` (
  `service_image_id` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `description` longtext,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `hosted_service_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `project_h_core_service_images`
--

INSERT INTO `project_h_core_service_images` (`service_image_id`, `image`, `description`, `created_by`, `updated_by`, `created_at`, `updated_at`, `hosted_service_id`) VALUES
(1, 'images/1000000037.jpg', NULL, NULL, NULL, '2023-06-24 16:13:52.315947', '2023-06-24 16:13:52.316005', 1),
(2, 'images/1000000038.jpg', NULL, NULL, NULL, '2023-06-24 16:13:52.325800', '2023-06-24 16:13:52.325878', 1),
(3, 'images/1000000039.jpg', NULL, NULL, NULL, '2023-06-24 16:13:52.331554', '2023-06-24 16:13:52.331682', 1),
(4, 'images/1000000040.jpg', NULL, NULL, NULL, '2023-06-24 16:13:52.336048', '2023-06-24 16:13:52.336188', 1),
(5, 'images/1000000034.jpg', NULL, NULL, NULL, '2023-06-24 16:13:52.339561', '2023-06-24 16:13:52.339606', 1),
(6, 'images/1000000035.jpg', NULL, NULL, NULL, '2023-06-24 16:13:52.342482', '2023-06-24 16:13:52.342552', 1),
(7, 'images/1000000036.jpg', NULL, NULL, NULL, '2023-06-24 16:13:52.345903', '2023-06-24 16:13:52.345949', 1),
(8, 'images/1000000043.jpg', NULL, NULL, NULL, '2023-06-24 17:05:23.884653', '2023-06-24 17:05:23.884703', 2),
(9, 'images/1000000044.jpg', NULL, NULL, NULL, '2023-06-24 17:05:23.900194', '2023-06-24 17:05:23.900242', 2),
(10, 'images/1000000046.jpg', NULL, NULL, NULL, '2023-06-24 17:05:23.903780', '2023-06-24 17:05:23.903943', 2),
(11, 'images/1000000047.jpg', NULL, NULL, NULL, '2023-06-24 17:05:23.911678', '2023-06-24 17:05:23.911740', 2);

-- --------------------------------------------------------

--
-- Table structure for table `project_h_core_service_reviews`
--

CREATE TABLE `project_h_core_service_reviews` (
  `service_review_id` int(11) NOT NULL,
  `review` longtext NOT NULL,
  `active` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `hosted_service_id` int(11) NOT NULL,
  `review_by_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `project_h_core_user_payment_methods`
--

CREATE TABLE `project_h_core_user_payment_methods` (
  `id` int(11) NOT NULL,
  `expired` datetime(6) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `payment_method_id` int(11) NOT NULL,
  `user_id_id` int(11) NOT NULL,
  `payment_method_table_key` int(11) DEFAULT NULL,
  `number` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `project_h_core_user_payment_methods`
--

INSERT INTO `project_h_core_user_payment_methods` (`id`, `expired`, `active`, `created_by`, `updated_by`, `created_at`, `updated_at`, `payment_method_id`, `user_id_id`, `payment_method_table_key`, `number`) VALUES
(12, '2023-03-30 02:03:07.075134', 1, NULL, NULL, '2023-03-30 02:03:07.075173', '2023-03-30 02:03:07.075184', 2, 6, 12, '233557881327'),
(13, '2023-03-30 04:04:23.562751', 1, NULL, NULL, '2023-03-30 04:04:23.562891', '2023-03-30 04:04:23.562951', 2, 6, 13, '0557881327'),
(14, '2023-04-05 20:24:54.211337', 1, NULL, NULL, '2023-04-05 20:24:54.211394', '2023-04-05 20:24:54.211415', 2, 6, 14, '0269008514'),
(15, '2023-06-24 19:55:07.632690', 1, NULL, NULL, '2023-06-24 19:55:07.632823', '2023-06-24 19:55:07.632883', 2, 11, 15, '0557881327'),
(16, '2023-07-11 15:21:38.770979', 1, NULL, NULL, '2023-07-11 15:21:38.771029', '2023-07-11 15:21:38.771047', 2, 12, 16, '0269008514'),
(17, '2023-08-25 12:18:12.919639', 1, NULL, NULL, '2023-08-25 12:18:12.919706', '2023-08-25 12:18:12.919725', 2, 13, 17, '557881542');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(15, 'Bede Adawe Abbe', 'terminal', 'bede.abbe91@gmail.com', NULL, '$2y$10$4q.qWiaKwsax0JKOVQAqMO5TwJwzm5MnVvpzauopM9tj5Ceo7e2w6', NULL, '2023-08-10 22:11:08', '2023-08-10 22:11:08');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

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
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `project_h_core_applicationproperties`
--
ALTER TABLE `project_h_core_applicationproperties`
  ADD PRIMARY KEY (`application_property_id`);

--
-- Indexes for table `project_h_core_cards`
--
ALTER TABLE `project_h_core_cards`
  ADD PRIMARY KEY (`card_id`),
  ADD KEY `project_h_core_cards_user_id_id_42eac8bb_fk_auth_user_id` (`user_id_id`);

--
-- Indexes for table `project_h_core_countries`
--
ALTER TABLE `project_h_core_countries`
  ADD PRIMARY KEY (`country_id`),
  ADD UNIQUE KEY `country_name` (`country_name`);

--
-- Indexes for table `project_h_core_customers`
--
ALTER TABLE `project_h_core_customers`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `customer_number` (`customer_number`),
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD UNIQUE KEY `mobile_number` (`mobile_number`),
  ADD KEY `project_h_core_custo_ID_type_id_e47386de_fk_project_h` (`ID_type_id`);

--
-- Indexes for table `project_h_core_hostdetails`
--
ALTER TABLE `project_h_core_hostdetails`
  ADD PRIMARY KEY (`host_details_id`),
  ADD UNIQUE KEY `customer_id` (`customer_id`);

--
-- Indexes for table `project_h_core_hosted_service`
--
ALTER TABLE `project_h_core_hosted_service`
  ADD PRIMARY KEY (`hosted_service_id`),
  ADD KEY `project_h_core_hosted_service_user_id_7f1bcf0d_fk_auth_user_id` (`user_id`),
  ADD KEY `project_h_core_hoste_service_id_c6df98bb_fk_project_h` (`service_id`);

--
-- Indexes for table `project_h_core_hostreferrals`
--
ALTER TABLE `project_h_core_hostreferrals`
  ADD PRIMARY KEY (`host_referral_id`),
  ADD KEY `project_h_core_hostr_host_details_id_6ec963a2_fk_project_h` (`host_details_id`);

--
-- Indexes for table `project_h_core_idtypes`
--
ALTER TABLE `project_h_core_idtypes`
  ADD PRIMARY KEY (`IDType_id`);

--
-- Indexes for table `project_h_core_language`
--
ALTER TABLE `project_h_core_language`
  ADD PRIMARY KEY (`language_id`);

--
-- Indexes for table `project_h_core_momo`
--
ALTER TABLE `project_h_core_momo`
  ADD PRIMARY KEY (`momo_id`),
  ADD KEY `project_h_core_momo_user_id_id_3f9ae636_fk_auth_user_id` (`user_id_id`);

--
-- Indexes for table `project_h_core_one_time_pin`
--
ALTER TABLE `project_h_core_one_time_pin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_h_core_payments`
--
ALTER TABLE `project_h_core_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_h_core_payme_payment_for_id_89b938b5_fk_project_h` (`payment_for_id`),
  ADD KEY `project_h_core_payments_payment_from_id_692e7df2_fk_auth_user_id` (`payment_from_id`),
  ADD KEY `project_h_core_payments_payment_to_id_90f9b761_fk_auth_user_id` (`payment_to_id`);

--
-- Indexes for table `project_h_core_payment_methods`
--
ALTER TABLE `project_h_core_payment_methods`
  ADD PRIMARY KEY (`payment_method_id`);

--
-- Indexes for table `project_h_core_profilemenu`
--
ALTER TABLE `project_h_core_profilemenu`
  ADD PRIMARY KEY (`profile_menu_id`);

--
-- Indexes for table `project_h_core_requestnotice`
--
ALTER TABLE `project_h_core_requestnotice`
  ADD PRIMARY KEY (`request_notice_id`),
  ADD KEY `project_h_core_reque_category_id_de461bb0_fk_project_h` (`category_id`),
  ADD KEY `project_h_core_reque_created_by_id_2a9eba85_fk_auth_user` (`created_by_id`);

--
-- Indexes for table `project_h_core_requestnoticeresponses`
--
ALTER TABLE `project_h_core_requestnoticeresponses`
  ADD PRIMARY KEY (`request_response_id`),
  ADD KEY `project_h_core_reque_created_by_id_150b6888_fk_auth_user` (`created_by_id`),
  ADD KEY `project_h_core_reque_request_notice_id_465d81dc_fk_project_h` (`request_notice_id`),
  ADD KEY `project_h_core_requestnot_conversation_id_3d8dfdff_idx` (`conversation_id`);

--
-- Indexes for table `project_h_core_requestresponses`
--
ALTER TABLE `project_h_core_requestresponses`
  ADD PRIMARY KEY (`request_response_id`),
  ADD KEY `project_h_core_reque_created_by_id_0a8092d1_fk_auth_user` (`created_by_id`),
  ADD KEY `project_h_core_reque_request_id_e4943d10_fk_project_h` (`request_id`),
  ADD KEY `project_h_core_requestresponses_conversation_id_e0f19db2_idx` (`conversation_id`);

--
-- Indexes for table `project_h_core_requests`
--
ALTER TABLE `project_h_core_requests`
  ADD PRIMARY KEY (`request_id`),
  ADD KEY `project_h_core_requests_host_id_5a161ead_fk_auth_user_id` (`host_id`),
  ADD KEY `project_h_core_reque_host_service_id_9b9a432b_fk_project_h` (`host_service_id`),
  ADD KEY `project_h_core_requests_requester_id_51aee2dd_fk_auth_user_id` (`requester_id`),
  ADD KEY `project_h_core_reque_payment_option_id_0587bcf2_fk_project_h` (`payment_option_id`),
  ADD KEY `project_h_core_reque_payment_method_id_79ffe6ce_fk_project_h` (`payment_method_id`);

--
-- Indexes for table `project_h_core_servicecategories`
--
ALTER TABLE `project_h_core_servicecategories`
  ADD PRIMARY KEY (`service_category_id`);

--
-- Indexes for table `project_h_core_services`
--
ALTER TABLE `project_h_core_services`
  ADD PRIMARY KEY (`service_id`);

--
-- Indexes for table `project_h_core_services_sub_categories`
--
ALTER TABLE `project_h_core_services_sub_categories`
  ADD PRIMARY KEY (`service_sub_category_id`),
  ADD KEY `project_h_core_servi_service_id_id_9392c9a4_fk_project_h` (`service_id_id`);

--
-- Indexes for table `project_h_core_services_sub_category_fields`
--
ALTER TABLE `project_h_core_services_sub_category_fields`
  ADD PRIMARY KEY (`service_sub_category_field_id`),
  ADD KEY `project_h_core_servi_service_sub_category_3f720cc4_fk_project_h` (`service_sub_category_id`);

--
-- Indexes for table `project_h_core_service_images`
--
ALTER TABLE `project_h_core_service_images`
  ADD PRIMARY KEY (`service_image_id`),
  ADD KEY `project_h_core_servi_hosted_service_id_4aa3ed8d_fk_project_h` (`hosted_service_id`);

--
-- Indexes for table `project_h_core_service_reviews`
--
ALTER TABLE `project_h_core_service_reviews`
  ADD PRIMARY KEY (`service_review_id`),
  ADD KEY `project_h_core_servi_hosted_service_id_3c549ba7_fk_project_h` (`hosted_service_id`),
  ADD KEY `project_h_core_servi_review_by_id_f5cc6699_fk_auth_user` (`review_by_id`);

--
-- Indexes for table `project_h_core_user_payment_methods`
--
ALTER TABLE `project_h_core_user_payment_methods`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_h_core_user__payment_method_id_41adf6e0_fk_project_h` (`payment_method_id`),
  ADD KEY `project_h_core_user__user_id_id_4f007c2d_fk_auth_user` (`user_id_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `project_h_core_applicationproperties`
--
ALTER TABLE `project_h_core_applicationproperties`
  MODIFY `application_property_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `project_h_core_cards`
--
ALTER TABLE `project_h_core_cards`
  MODIFY `card_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `project_h_core_countries`
--
ALTER TABLE `project_h_core_countries`
  MODIFY `country_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `project_h_core_customers`
--
ALTER TABLE `project_h_core_customers`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `project_h_core_hostdetails`
--
ALTER TABLE `project_h_core_hostdetails`
  MODIFY `host_details_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `project_h_core_hosted_service`
--
ALTER TABLE `project_h_core_hosted_service`
  MODIFY `hosted_service_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `project_h_core_hostreferrals`
--
ALTER TABLE `project_h_core_hostreferrals`
  MODIFY `host_referral_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `project_h_core_idtypes`
--
ALTER TABLE `project_h_core_idtypes`
  MODIFY `IDType_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `project_h_core_language`
--
ALTER TABLE `project_h_core_language`
  MODIFY `language_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `project_h_core_momo`
--
ALTER TABLE `project_h_core_momo`
  MODIFY `momo_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `project_h_core_one_time_pin`
--
ALTER TABLE `project_h_core_one_time_pin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=588;

--
-- AUTO_INCREMENT for table `project_h_core_payments`
--
ALTER TABLE `project_h_core_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `project_h_core_payment_methods`
--
ALTER TABLE `project_h_core_payment_methods`
  MODIFY `payment_method_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `project_h_core_profilemenu`
--
ALTER TABLE `project_h_core_profilemenu`
  MODIFY `profile_menu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `project_h_core_requestnotice`
--
ALTER TABLE `project_h_core_requestnotice`
  MODIFY `request_notice_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `project_h_core_requestnoticeresponses`
--
ALTER TABLE `project_h_core_requestnoticeresponses`
  MODIFY `request_response_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `project_h_core_requestresponses`
--
ALTER TABLE `project_h_core_requestresponses`
  MODIFY `request_response_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `project_h_core_requests`
--
ALTER TABLE `project_h_core_requests`
  MODIFY `request_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `project_h_core_servicecategories`
--
ALTER TABLE `project_h_core_servicecategories`
  MODIFY `service_category_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `project_h_core_services`
--
ALTER TABLE `project_h_core_services`
  MODIFY `service_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `project_h_core_services_sub_categories`
--
ALTER TABLE `project_h_core_services_sub_categories`
  MODIFY `service_sub_category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `project_h_core_services_sub_category_fields`
--
ALTER TABLE `project_h_core_services_sub_category_fields`
  MODIFY `service_sub_category_field_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `project_h_core_service_images`
--
ALTER TABLE `project_h_core_service_images`
  MODIFY `service_image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `project_h_core_service_reviews`
--
ALTER TABLE `project_h_core_service_reviews`
  MODIFY `service_review_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `project_h_core_user_payment_methods`
--
ALTER TABLE `project_h_core_user_payment_methods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `project_h_core_cards`
--
ALTER TABLE `project_h_core_cards`
  ADD CONSTRAINT `project_h_core_cards_user_id_id_42eac8bb_fk_auth_user_id` FOREIGN KEY (`user_id_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `project_h_core_customers`
--
ALTER TABLE `project_h_core_customers`
  ADD CONSTRAINT `project_h_core_custo_ID_type_id_e47386de_fk_project_h` FOREIGN KEY (`ID_type_id`) REFERENCES `project_h_core_idtypes` (`IDType_id`),
  ADD CONSTRAINT `project_h_core_customers_user_id_fc8f1cc2_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `project_h_core_hostdetails`
--
ALTER TABLE `project_h_core_hostdetails`
  ADD CONSTRAINT `project_h_core_hostd_customer_id_dc09e1d4_fk_project_h` FOREIGN KEY (`customer_id`) REFERENCES `project_h_core_customers` (`customer_id`);

--
-- Constraints for table `project_h_core_hosted_service`
--
ALTER TABLE `project_h_core_hosted_service`
  ADD CONSTRAINT `project_h_core_hoste_service_id_c6df98bb_fk_project_h` FOREIGN KEY (`service_id`) REFERENCES `project_h_core_services` (`service_id`),
  ADD CONSTRAINT `project_h_core_hosted_service_user_id_7f1bcf0d_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `project_h_core_hostreferrals`
--
ALTER TABLE `project_h_core_hostreferrals`
  ADD CONSTRAINT `project_h_core_hostr_host_details_id_6ec963a2_fk_project_h` FOREIGN KEY (`host_details_id`) REFERENCES `project_h_core_hostdetails` (`host_details_id`);

--
-- Constraints for table `project_h_core_momo`
--
ALTER TABLE `project_h_core_momo`
  ADD CONSTRAINT `project_h_core_momo_user_id_id_3f9ae636_fk_auth_user_id` FOREIGN KEY (`user_id_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `project_h_core_payments`
--
ALTER TABLE `project_h_core_payments`
  ADD CONSTRAINT `project_h_core_payme_payment_for_id_89b938b5_fk_project_h` FOREIGN KEY (`payment_for_id`) REFERENCES `project_h_core_hosted_service` (`hosted_service_id`),
  ADD CONSTRAINT `project_h_core_payments_payment_from_id_692e7df2_fk_auth_user_id` FOREIGN KEY (`payment_from_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `project_h_core_payments_payment_to_id_90f9b761_fk_auth_user_id` FOREIGN KEY (`payment_to_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `project_h_core_requestnotice`
--
ALTER TABLE `project_h_core_requestnotice`
  ADD CONSTRAINT `project_h_core_reque_category_id_de461bb0_fk_project_h` FOREIGN KEY (`category_id`) REFERENCES `project_h_core_services` (`service_id`),
  ADD CONSTRAINT `project_h_core_reque_created_by_id_2a9eba85_fk_auth_user` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `project_h_core_requestnoticeresponses`
--
ALTER TABLE `project_h_core_requestnoticeresponses`
  ADD CONSTRAINT `project_h_core_reque_created_by_id_150b6888_fk_auth_user` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `project_h_core_reque_request_notice_id_465d81dc_fk_project_h` FOREIGN KEY (`request_notice_id`) REFERENCES `project_h_core_requestnotice` (`request_notice_id`);

--
-- Constraints for table `project_h_core_requestresponses`
--
ALTER TABLE `project_h_core_requestresponses`
  ADD CONSTRAINT `project_h_core_reque_created_by_id_0a8092d1_fk_auth_user` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `project_h_core_reque_request_id_e4943d10_fk_project_h` FOREIGN KEY (`request_id`) REFERENCES `project_h_core_requests` (`request_id`);

--
-- Constraints for table `project_h_core_requests`
--
ALTER TABLE `project_h_core_requests`
  ADD CONSTRAINT `project_h_core_reque_host_service_id_9b9a432b_fk_project_h` FOREIGN KEY (`host_service_id`) REFERENCES `project_h_core_hosted_service` (`hosted_service_id`),
  ADD CONSTRAINT `project_h_core_reque_payment_method_id_79ffe6ce_fk_project_h` FOREIGN KEY (`payment_method_id`) REFERENCES `project_h_core_payment_methods` (`payment_method_id`),
  ADD CONSTRAINT `project_h_core_reque_payment_option_id_0587bcf2_fk_project_h` FOREIGN KEY (`payment_option_id`) REFERENCES `project_h_core_user_payment_methods` (`id`),
  ADD CONSTRAINT `project_h_core_requests_host_id_5a161ead_fk_auth_user_id` FOREIGN KEY (`host_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `project_h_core_requests_requester_id_51aee2dd_fk_auth_user_id` FOREIGN KEY (`requester_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `project_h_core_services_sub_categories`
--
ALTER TABLE `project_h_core_services_sub_categories`
  ADD CONSTRAINT `project_h_core_servi_service_id_id_9392c9a4_fk_project_h` FOREIGN KEY (`service_id_id`) REFERENCES `project_h_core_services` (`service_id`);

--
-- Constraints for table `project_h_core_services_sub_category_fields`
--
ALTER TABLE `project_h_core_services_sub_category_fields`
  ADD CONSTRAINT `project_h_core_servi_service_sub_category_3f720cc4_fk_project_h` FOREIGN KEY (`service_sub_category_id`) REFERENCES `project_h_core_services_sub_categories` (`service_sub_category_id`);

--
-- Constraints for table `project_h_core_service_images`
--
ALTER TABLE `project_h_core_service_images`
  ADD CONSTRAINT `project_h_core_servi_hosted_service_id_4aa3ed8d_fk_project_h` FOREIGN KEY (`hosted_service_id`) REFERENCES `project_h_core_hosted_service` (`hosted_service_id`);

--
-- Constraints for table `project_h_core_service_reviews`
--
ALTER TABLE `project_h_core_service_reviews`
  ADD CONSTRAINT `project_h_core_servi_hosted_service_id_3c549ba7_fk_project_h` FOREIGN KEY (`hosted_service_id`) REFERENCES `project_h_core_hosted_service` (`hosted_service_id`),
  ADD CONSTRAINT `project_h_core_servi_review_by_id_f5cc6699_fk_auth_user` FOREIGN KEY (`review_by_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `project_h_core_user_payment_methods`
--
ALTER TABLE `project_h_core_user_payment_methods`
  ADD CONSTRAINT `project_h_core_user__payment_method_id_41adf6e0_fk_project_h` FOREIGN KEY (`payment_method_id`) REFERENCES `project_h_core_payment_methods` (`payment_method_id`),
  ADD CONSTRAINT `project_h_core_user__user_id_id_4f007c2d_fk_auth_user` FOREIGN KEY (`user_id_id`) REFERENCES `auth_user` (`id`);

