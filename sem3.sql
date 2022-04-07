-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 12, 2021 at 09:13 AM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tnt`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add category', 7, 'add_category'),
(26, 'Can change category', 7, 'change_category'),
(27, 'Can delete category', 7, 'delete_category'),
(28, 'Can view category', 7, 'view_category'),
(29, 'Can add customer', 8, 'add_customer'),
(30, 'Can change customer', 8, 'change_customer'),
(31, 'Can delete customer', 8, 'delete_customer'),
(32, 'Can view customer', 8, 'view_customer'),
(33, 'Can add product', 9, 'add_product'),
(34, 'Can change product', 9, 'change_product'),
(35, 'Can delete product', 9, 'delete_product'),
(36, 'Can view product', 9, 'view_product'),
(37, 'Can add order', 10, 'add_order'),
(38, 'Can change order', 10, 'change_order'),
(39, 'Can delete order', 10, 'delete_order'),
(40, 'Can view order', 10, 'view_order'),
(41, 'Can add contact', 11, 'add_contact'),
(42, 'Can change contact', 11, 'change_contact'),
(43, 'Can delete contact', 11, 'delete_contact'),
(44, 'Can view contact', 11, 'view_contact'),
(45, 'Can add city', 12, 'add_city'),
(46, 'Can change city', 12, 'change_city'),
(47, 'Can delete city', 12, 'delete_city'),
(48, 'Can view city', 12, 'view_city'),
(49, 'Can add state', 13, 'add_state'),
(50, 'Can change state', 13, 'change_state'),
(51, 'Can delete state', 13, 'delete_state'),
(52, 'Can view state', 13, 'view_state'),
(53, 'Can add image_slider', 14, 'add_image_slider'),
(54, 'Can change image_slider', 14, 'change_image_slider'),
(55, 'Can delete image_slider', 14, 'delete_image_slider'),
(56, 'Can view image_slider', 14, 'view_image_slider'),
(57, 'Can add vlogs', 15, 'add_vlogs'),
(58, 'Can change vlogs', 15, 'change_vlogs'),
(59, 'Can delete vlogs', 15, 'delete_vlogs'),
(60, 'Can view vlogs', 15, 'view_vlogs'),
(61, 'Can add about_us', 16, 'add_about_us'),
(62, 'Can change about_us', 16, 'change_about_us'),
(63, 'Can delete about_us', 16, 'delete_about_us'),
(64, 'Can view about_us', 16, 'view_about_us');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$260000$e2hqhmWVBUi1hXDIzxJHcD$qmOCuQ3WAkn50TdvT/69XeT1PUekuXmF7NMcR8bgCDA=', '2021-09-05 07:01:39.881353', 1, 'samrat', '', '', 'virtualsamrat@gmail.com', 1, 1, '2021-09-04 11:13:39.441843'),
(2, 'pbkdf2_sha256$260000$ljfEs4DBMYd4HnYMqlQqzR$LKylScU8AqWFRYPNfKjY+nc8EcgMGjWB/EI4GjwOmwU=', '2021-10-12 07:05:43.415046', 1, 'admin', '', '', 'virtualsamrat@gmail.com', 1, 1, '2021-10-12 04:03:17.108384');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `dashboard_about_us`
--

CREATE TABLE `dashboard_about_us` (
  `id` bigint(20) NOT NULL,
  `title` varchar(150) NOT NULL,
  `date` date NOT NULL,
  `desc` longtext NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dashboard_about_us`
--

INSERT INTO `dashboard_about_us` (`id`, `title`, `date`, `desc`, `image`) VALUES
(1, 'This Is Who we are', '2021-10-12', 'Our Organization is also Engaged in Manufacturing, Supplying and Export a Wide Range Of Ladies Wear Such as Kurti,Designer Sarees, Casual Sarees, Bridal Lehenga, Party Wear Suits, Salwar Kameez, Designer Suits, Print Suits, Casual Kurtis, Silk Sarees, Embroidery Sarees, Party Wear Sarees, Dupatta,Party Wear Kurtis, Bottom wear,Top', 'Image_Slider/2.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `dashboard_image_slider`
--

CREATE TABLE `dashboard_image_slider` (
  `id` bigint(20) NOT NULL,
  `title` varchar(100) NOT NULL,
  `img` varchar(100) NOT NULL,
  `desc` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dashboard_image_slider`
--

INSERT INTO `dashboard_image_slider` (`id`, `title`, `img`, `desc`) VALUES
(1, 'first', 'Image_Slider/2.jpg', 'sdfasdf'),
(2, '2', 'Image_Slider/3.jpg', 'dsfasd'),
(3, '4', 'Image_Slider/4.jpg', 'dfsd'),
(4, '5', 'Image_Slider/6.jpg', 'fsaf');

-- --------------------------------------------------------

--
-- Table structure for table `dashboard_vlogs`
--

CREATE TABLE `dashboard_vlogs` (
  `id` bigint(20) NOT NULL,
  `title` varchar(150) NOT NULL,
  `urls` varchar(200) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dashboard_vlogs`
--

INSERT INTO `dashboard_vlogs` (`id`, `title`, `urls`, `date`) VALUES
(1, 'Sari for party', 'https://www.youtube.com/embed/vYGiWvyim6M', '2021-10-12'),
(2, 'Kurti collection', 'https://www.youtube.com/embed/WaLfpDAGj7s', '2021-10-12'),
(3, 'Lehenga ', 'https://www.youtube.com/embed/CjAmTkAeqrU', '2021-10-12'),
(4, 'Gown collection', 'https://www.youtube.com/embed/WJ7GqRF9N90', '2021-10-12');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(16, 'dashboard', 'about_us'),
(14, 'dashboard', 'image_slider'),
(15, 'dashboard', 'vlogs'),
(6, 'sessions', 'session'),
(7, 'store', 'category'),
(12, 'store', 'city'),
(11, 'store', 'contact'),
(8, 'store', 'customer'),
(10, 'store', 'order'),
(9, 'store', 'product'),
(13, 'store', 'state');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2021-09-04 11:11:16.157549'),
(2, 'auth', '0001_initial', '2021-09-04 11:11:16.992470'),
(3, 'admin', '0001_initial', '2021-09-04 11:11:17.235884'),
(4, 'admin', '0002_logentry_remove_auto_add', '2021-09-04 11:11:17.254384'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2021-09-04 11:11:17.274367'),
(6, 'contenttypes', '0002_remove_content_type_name', '2021-09-04 11:11:17.405773'),
(7, 'auth', '0002_alter_permission_name_max_length', '2021-09-04 11:11:17.495223'),
(8, 'auth', '0003_alter_user_email_max_length', '2021-09-04 11:11:17.531199'),
(9, 'auth', '0004_alter_user_username_opts', '2021-09-04 11:11:17.546192'),
(10, 'auth', '0005_alter_user_last_login_null', '2021-09-04 11:11:17.639132'),
(11, 'auth', '0006_require_contenttypes_0002', '2021-09-04 11:11:17.644389'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2021-09-04 11:11:17.658380'),
(13, 'auth', '0008_alter_user_username_max_length', '2021-09-04 11:11:17.689361'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2021-09-04 11:11:17.726336'),
(15, 'auth', '0010_alter_group_name_max_length', '2021-09-04 11:11:17.763314'),
(16, 'auth', '0011_update_proxy_permissions', '2021-09-04 11:11:17.783301'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2021-09-04 11:11:17.815281'),
(18, 'dashboard', '0001_initial', '2021-09-04 11:11:17.858256'),
(19, 'dashboard', '0002_vlogs', '2021-09-04 11:11:17.907226'),
(20, 'dashboard', '0003_about_us', '2021-09-04 11:11:17.964191'),
(21, 'sessions', '0001_initial', '2021-09-04 11:11:18.029561'),
(22, 'store', '0001_initial', '2021-09-04 11:11:18.527525'),
(23, 'store', '0002_auto_20210625_0951', '2021-09-04 11:11:18.604896'),
(24, 'store', '0003_contact', '2021-09-04 11:11:18.658394'),
(25, 'store', '0004_auto_20210724_1110', '2021-09-04 11:11:19.788262'),
(26, 'store', '0005_city_state', '2021-09-04 11:11:19.884170'),
(27, 'store', '0006_auto_20210802_0906', '2021-09-04 11:11:20.063139');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('abva2w2gizkabb8wv4uhuwx2jb54qrlt', '.eJxVjMsOgyAQRf9l1obICBVcdt9vMMMA1T4kAVwZ_701ceP2nnPuBky5wrDtDfBaavqGDINsYKS1TuNaQh5nDwNIuGyO-B2WA_gXLc8kOC01z04cijhpEY_kw-d-upeDicr0r_soCSObGK0z2AVLVlnlgvGEPSrdYWs0W02R0fUKpUQVVcs35z1Fr2H_AWJJP9A:1mMmA8:pXpqmMhFRKXVbcn1iAopX2BZfxh0zNk7Use0-tJshnw', '2021-09-19 07:01:56.678224'),
('fj2crixoc4gbvps5pv5e9owi5t252ovq', '.eJxVjDEOgzAMRe_iuYqISUrC2L1nQI4dF9oKJAIT4u4tEgvrf-_9DZjmBdptv0FH69J3a8lzNwi0YOGyJeJPHg8gbxpfk-FpXOYhmUMxJy3mOUn-Pk73ctBT6f91o5ZQOajGFLDOkaKLLuUghA06X2MVPEdPypgah9aiU1fxPYmQiof9BzUMO4M:1mMTdX:2wrmFBlHV-j5EKSo5wwc7fNg9xfZclurfHoDlvuDyJ4', '2021-09-18 11:15:03.485717'),
('ijv5frwv63dwkg2nosnve2qdclp2hkj9', 'eyJjYXJ0Ijp7fSwiY3VzdG9tZXIiOjF9:1mMm0S:SURftCVDuaMgkHOHcqLEjWv_yuqhrfrNlbrnYr-GFA0', '2021-09-19 06:51:56.853052'),
('qtkgswh4l3kahcabrz8cenfypydvfctm', '.eJxVjDsOgzAQBe-yNbIcfwhQpucMaL27BPLBkm0qxN0TJBraNzNvA8JUoNv2CmjNJX4lQWcqGHAt07BmScPM0IGByxaQ3rIcgF-4PKOiuJQ0B3Uo6qRZ9ZHl8zjdy8GEefrXYQzt6LQjfxdpfCDfBmHdCDPSyB5ra7VDRzWyEHp9q7lBtNIaY422sP8AmfNAqQ:1maBti:95LKRbN4HvzOnYh0AAqNo2GCXrH9kKmxN4dHJLs9_lk', '2021-10-26 07:08:26.998209'),
('t4d7dtc51k65pryzqplxl49emkerkhjs', 'eyJjYXJ0Ijp7fX0:1mMlqI:SkBM0DH5paArQYfcMntrkwUlr6ZbB2Ri0hbW7jza33U', '2021-09-19 06:41:26.490662'),
('wdxrlyj5fsuswlz7mdop0m93n9uith2c', 'eyJjYXJ0Ijp7IjIiOjF9fQ:1mMlov:Tz_a-doL1-xoG-gZuPrsnHS31mRUSvdfIM3uVEhoQCg', '2021-09-19 06:40:01.562052'),
('xb8uq2r8oygodufgsodbjr1okhwzb6zm', '.eJxVjDEOgzAMRe_iuYqISUrC2L1nQI4dF9oKJAIT4u4tEgvrf-_9DZjmBdptv0FH69J3a8lzNwi0YOGyJeJPHg8gbxpfk-FpXOYhmUMxJy3mOUn-Pk73ctBT6f91o5ZQOajGFLDOkaKLLuUghA06X2MVPEdPypgah9aiU1fxPYmQiof9BzUMO4M:1mMTpN:KPvMkQA5_BwbDbbd959QHrfbxnUj45E1bJs8oY77FfU', '2021-09-18 11:27:17.342979');

-- --------------------------------------------------------

--
-- Table structure for table `store_category`
--

CREATE TABLE `store_category` (
  `id` bigint(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `store_category`
--

INSERT INTO `store_category` (`id`, `name`, `description`, `image`) VALUES
(2, 'female dress', 'best female dress', 'uploads/category/2_s37cIFI.jpg'),
(3, 'smart watch', 'alll smart watch here', 'uploads/category/one_plus_watch_zXQCcof.jpg'),
(4, 'Beauty product', 'best beauty products', 'uploads/category/loreal_eyeliner_b56qdXH.jpg'),
(5, 'shoes', 'all types of shoes', 'uploads/category/nike_foot_bY54WQM.jpeg'),
(6, 'kids collection', 'all kids collection', 'uploads/category/unnamed_CexVtfk.jpg'),
(7, 'mens collection', 'all mens collections', 'uploads/category/8_Emhkjch.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `store_city`
--

CREATE TABLE `store_city` (
  `id` bigint(20) NOT NULL,
  `city_name` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `store_contact`
--

CREATE TABLE `store_contact` (
  `id` bigint(20) NOT NULL,
  `name` varchar(35) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(12) NOT NULL,
  `message` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `store_contact`
--

INSERT INTO `store_contact` (`id`, `name`, `subject`, `email`, `phone`, `message`) VALUES
(1, 'krishna', 'for test', 'krishna@gmail.com', '986151331', 'hello samrat i am here to bless you');

-- --------------------------------------------------------

--
-- Table structure for table `store_customer`
--

CREATE TABLE `store_customer` (
  `id` bigint(20) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `phone` varchar(12) NOT NULL,
  `email` varchar(254) NOT NULL,
  `password` varchar(500) NOT NULL,
  `address` varchar(500) DEFAULT NULL,
  `city` varchar(25) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `pincode` varchar(10) DEFAULT NULL,
  `state` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `store_customer`
--

INSERT INTO `store_customer` (`id`, `first_name`, `last_name`, `phone`, `email`, `password`, `address`, `city`, `gender`, `image`, `pincode`, `state`) VALUES
(1, 'samrat', 'shah', '9861251331', 'samrat@gmail.com', 'pbkdf2_sha256$260000$negiGVMJJqo3isjKngnO08$U68Zl9HwF+XpxDT1vcZXaUjKUv+Kz7uCVJYUB0gEtt4=', 'None', 'None', 'None', 'user_profile_img/sam.jpg', '', 'None'),
(2, 'samrat', 'shah', '9861251331', 'jenisha@gmail.com', 'pbkdf2_sha256$260000$YPUFrG40K49NPVJhbcassu$KAMffHa0gHg/y34lWFo4RzabpfUzcf6Q3HEOs96YhEw=', 'None', 'None', 'None', 'user_profile_img/092-radha-krishna-painting-1-1.jpg', '', 'None');

-- --------------------------------------------------------

--
-- Table structure for table `store_order`
--

CREATE TABLE `store_order` (
  `id` bigint(20) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `address` varchar(200) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `status` tinyint(1) NOT NULL,
  `customer_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `country` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `postal` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `store_order`
--

INSERT INTO `store_order` (`id`, `quantity`, `price`, `address`, `phone`, `date`, `status`, `customer_id`, `product_id`, `country`, `email`, `first_name`, `last_name`, `postal`) VALUES
(2, 2, 24000, 'sdfasdfasdf', '9861251331', '2021-10-12', 1, 2, 4, 'India', 'jenisha@gmail.com', 'jenisha', 'shaihi', '395009'),
(3, 2, 3000, 'a28 khodiyar nagar society', '986125131', '2021-10-12', 1, 2, 3, 'India', 'samrat@gmail.com', 'samrat', 'shah', '395009');

-- --------------------------------------------------------

--
-- Table structure for table `store_product`
--

CREATE TABLE `store_product` (
  `id` bigint(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `price` int(11) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `image` varchar(100) NOT NULL,
  `category_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `store_product`
--

INSERT INTO `store_product` (`id`, `name`, `price`, `description`, `image`, `category_id`) VALUES
(3, 'Mens shirts', 1500, 'white mens collection shirts for all sizes are here', 'uploads/products/3_0cjfE4K.jpeg', 7),
(4, 'Mens black shirt', 12000, 'Mens black shirt is for here to increase your look', 'uploads/products/71aQIPEiPwL._UL1500__nQFhhIn.jpg', 7),
(5, 'Mens suits', 1600, 'Blue suits for weeding and party collection for all sizes', 'uploads/products/9_wrqgYQu.jpg', 7),
(6, 'shoes', 2500, 'shoes is here for you', 'uploads/products/7_pPKDVzP_fbLHhGd.jpg', 5),
(7, 'gown ', 2500, 'red gown for your choices', 'uploads/products/5_q95GPz3_FZQZeFP.jpg', 2),
(8, 'female dress black', 980, 'female black dress for all', 'uploads/products/81Aa5RlufHL._UL1500__jItWIQ4.jpg', 2),
(9, 'female black shirt', 690, 'female black shirt for casual ', 'uploads/products/81AuMZrtlXL._UL1500__giJfAS2.jpg', 2),
(10, 'check shirt', 999, 'female check shirt for female all size available', 'uploads/products/gfg_kDdxwa4.jpeg', 2),
(11, 'multi color', 2100, 'female multi color shirt for all size', 'uploads/products/gdfgdfg_YKpX1yh.jpeg', 2),
(12, 'Apple watch ', 45000, 'apple watch series 5 with sqo2', 'uploads/products/apple_watch_OIDlDVa.jpg', 3),
(13, 'samsung galaxy weare', 22000, 'samsung galaxy weare for smart person', 'uploads/products/samsung_galaxy_active2_r39DaK5.jpg', 3),
(14, 'childreen shirt', 1100, 'child shirt and pants for casual collection', 'uploads/products/kljl_43fKYov.png', 6);

-- --------------------------------------------------------

--
-- Table structure for table `store_state`
--

CREATE TABLE `store_state` (
  `id` bigint(20) NOT NULL,
  `state_name` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `store_state`
--

INSERT INTO `store_state` (`id`, `state_name`) VALUES
(1, 'Gujarat'),
(2, 'UP'),
(3, 'Uttarkhand'),
(4, 'Goa'),
(5, 'Madhya Pardesh');

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
-- Indexes for table `dashboard_about_us`
--
ALTER TABLE `dashboard_about_us`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dashboard_image_slider`
--
ALTER TABLE `dashboard_image_slider`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dashboard_vlogs`
--
ALTER TABLE `dashboard_vlogs`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `store_category`
--
ALTER TABLE `store_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `store_city`
--
ALTER TABLE `store_city`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `store_contact`
--
ALTER TABLE `store_contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `store_customer`
--
ALTER TABLE `store_customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `store_order`
--
ALTER TABLE `store_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_order_customer_id_13d6d43e_fk` (`customer_id`),
  ADD KEY `store_order_product_id_11796f0f_fk` (`product_id`);

--
-- Indexes for table `store_product`
--
ALTER TABLE `store_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_product_category_id_574bae65_fk` (`category_id`);

--
-- Indexes for table `store_state`
--
ALTER TABLE `store_state`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dashboard_about_us`
--
ALTER TABLE `dashboard_about_us`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `dashboard_image_slider`
--
ALTER TABLE `dashboard_image_slider`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `dashboard_vlogs`
--
ALTER TABLE `dashboard_vlogs`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `store_category`
--
ALTER TABLE `store_category`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `store_city`
--
ALTER TABLE `store_city`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `store_contact`
--
ALTER TABLE `store_contact`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `store_customer`
--
ALTER TABLE `store_customer`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `store_order`
--
ALTER TABLE `store_order`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `store_product`
--
ALTER TABLE `store_product`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `store_state`
--
ALTER TABLE `store_state`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
-- Constraints for table `store_order`
--
ALTER TABLE `store_order`
  ADD CONSTRAINT `store_order_customer_id_13d6d43e_fk` FOREIGN KEY (`customer_id`) REFERENCES `store_customer` (`id`),
  ADD CONSTRAINT `store_order_product_id_11796f0f_fk` FOREIGN KEY (`product_id`) REFERENCES `store_product` (`id`);

--
-- Constraints for table `store_product`
--
ALTER TABLE `store_product`
  ADD CONSTRAINT `store_product_category_id_574bae65_fk` FOREIGN KEY (`category_id`) REFERENCES `store_category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
