-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 22, 2024 at 04:55 AM
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
-- Database: `imobile`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_user`
--

CREATE TABLE `admin_user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_user`
--

INSERT INTO `admin_user` (`id`, `username`, `password`) VALUES
(1, 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `banner`
--

CREATE TABLE `banner` (
  `id` int(11) NOT NULL,
  `heading1` varchar(255) NOT NULL,
  `heading2` varchar(255) NOT NULL,
  `btn_txt` varchar(55) DEFAULT NULL,
  `btn_link` varchar(55) DEFAULT NULL,
  `image` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `order_no` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `banner`
--

INSERT INTO `banner` (`id`, `heading1`, `heading2`, `btn_txt`, `btn_link`, `image`, `status`, `order_no`) VALUES
(6, 'We Are Live Now', 'Welcome', '', '', '376150440_imobile_shop.jpg', 1, 1),
(7, 'Available', 'Iphone 14 Pro', '', '', '758292426_iphone_14_pro_advertise.jpg', 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `categories` varchar(255) NOT NULL,
  `status` tinyint(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `categories`, `status`) VALUES
(4, 'Realme', 1),
(7, 'Iphone', 1),
(8, 'Samsung', 1),
(9, 'OnePlus', 1);

-- --------------------------------------------------------

--
-- Table structure for table `contact_us`
--

CREATE TABLE `contact_us` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `comment` text NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contact_us`
--

INSERT INTO `contact_us` (`id`, `name`, `email`, `mobile`, `comment`, `added_on`) VALUES
(0, 'Rana Mohit', 'rmohit21264@gmail.com', '7621048017', 'We Are Happy', '2024-03-21 14:23:51');

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(50) NOT NULL,
  `pincode` int(11) NOT NULL,
  `payment_type` varchar(50) NOT NULL,
  `total_price` float NOT NULL,
  `payment_status` varchar(200) NOT NULL,
  `order_status` int(200) NOT NULL,
  `added_on` date NOT NULL,
  `txnid` varchar(20) NOT NULL,
  `mihpayid` varchar(20) NOT NULL,
  `payu_status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`id`, `user_id`, `address`, `city`, `pincode`, `payment_type`, `total_price`, `payment_status`, `order_status`, `added_on`, `txnid`, `mihpayid`, `payu_status`) VALUES
(1, 3, 'Raipur chakleshwar mahadev, sakdi sheri , khijda ni pole, 1006, mangal bhuvan', 'Ahemdabad', 380001, 'COD', 15000, 'Success', 5, '2024-03-16', '3704c61b455c24141d7a', '', ''),
(2, 1, 'Raipur chakleshwar mahadev, sakdi sheri , khijda ni pole, 1006, mangal bhuvan', 'Ahemdabad', 380001, 'COD', 150000, 'pending', 1, '2024-03-19', 'd51787c5211803e44c54', '', ''),
(3, 4, 'Satelite', 'Mumbai', 3800017, 'COD', 46799, 'Success', 5, '2024-03-20', '96c4b66cd835d8531ef2', '', ''),
(4, 1, '1006/8 / MANGAL BHUVAN CITY HIGH SCHOOL', 'Select', 380001, 'COD', 50000, 'pending', 1, '2024-03-20', 'f99c735422dd9936e321', '', ''),
(5, 1, 'Raipur chakleshwar mahadev, sakdi sheri , khijda ni pole, 1006, mangal bhuvan', 'Ahemdabad', 380001, 'COD', 150000, 'pending', 1, '2024-03-20', 'ac0c08534e7e26615f11', '', ''),
(6, 5, 'Apna Guav', 'DholakPoor', 12356, 'COD', 138999, 'pending', 1, '2024-03-21', 'b4faea52ad5e58d47ae5', '', ''),
(7, 1, 'Raipur chakleshwar mahadev, sakdi sheri , khijda ni pole, 1006, mangal bhuvan', 'Ahemdabad', 380001, 'COD', 28999, 'pending', 1, '2024-03-22', '011af8ddaccb11520328', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE `order_detail` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_detail`
--

INSERT INTO `order_detail` (`id`, `order_id`, `product_id`, `qty`, `price`) VALUES
(1, 3, 8, 1, 150000),
(2, 4, 7, 1, 150000),
(3, 5, 9, 1, 15000),
(4, 6, 9, 1, 15000),
(5, 8, 7, 1, 150000),
(6, 9, 9, 1, 15000),
(7, 11, 9, 1, 15000),
(8, 12, 7, 1, 150000),
(9, 13, 9, 1, 15000),
(10, 13, 7, 1, 150000),
(11, 15, 7, 1, 150000),
(12, 1, 9, 1, 15000),
(13, 2, 10, 1, 150000),
(14, 3, 1, 1, 46799),
(15, 4, 6, 1, 50000),
(16, 5, 6, 1, 150000),
(17, 6, 44, 1, 138999),
(18, 7, 43, 1, 28999);

-- --------------------------------------------------------

--
-- Table structure for table `order_status`
--

CREATE TABLE `order_status` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_status`
--

INSERT INTO `order_status` (`id`, `name`) VALUES
(1, 'Pending'),
(2, 'Processing'),
(3, 'Shipped'),
(4, 'Canceled'),
(5, 'Complete');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `categories_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `mrp` float NOT NULL,
  `price` float NOT NULL,
  `qty` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `short_desc` varchar(2000) NOT NULL,
  `description` text NOT NULL,
  `meta_desc` varchar(2000) NOT NULL,
  `meta_title` text NOT NULL,
  `status` tinyint(4) NOT NULL,
  `meta_keyword` varchar(200) NOT NULL,
  `best_seller` int(11) NOT NULL,
  `sub_categories_id` int(11) NOT NULL,
  `added_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `categories_id`, `name`, `mrp`, `price`, `qty`, `image`, `short_desc`, `description`, `meta_desc`, `meta_title`, `status`, `meta_keyword`, `best_seller`, `sub_categories_id`, `added_by`) VALUES
(8, 7, 'Apple iPhone 15 (128 GB Storage, Black)', 79900, 70490, 20, '222861752_iphone15.jpg', 'test1', 'test2', 'test3', 'Apple iPhone 15', 1, 'Iphone', 1, 8, 1),
(9, 7, 'Apple iPhone 15 Plus (128 GB Storage, Pink)', 89900, 79820, 20, '175151672_iphone15 Plus.jpg', 'test', 'test1', 'test2', 'Apple iPhone 15 Plus', 1, 'Iphone', 0, 8, 1),
(10, 7, 'Apple iPhone 15 Pro (128 GB Storage, Natural Titanium)', 134900, 125900, 20, '134882889_iphone15 Pro.jpg', 'test', 'test2', 'test3', 'Apple iPhone 15 Pro', 1, 'Iphone', 1, 8, 1),
(11, 7, 'Apple iPhone 15 Pro Max (256 GB Storage, Blue Titanium)', 159900, 149900, 20, '515001649_iphone15 Pro Max.jpg', 'test', 'test2', 'test4', 'Apple iPhone 15 Pro Max', 1, 'Iphone', 0, 8, 1),
(12, 7, 'Apple iPhone 14 (128 GB, Blue)', 69900, 61900, 20, '556702775_iphone14.jpg', 'test2', 'test3', 'test4', 'Apple iPhone 14', 1, 'Iphone', 0, 10, 1),
(13, 7, 'Apple iPhone 14 Plus (128 GB, Purple)', 79900, 70900, 20, '838292564_iphone14 Plus.jpg', 'test3', 'tgest3', 'te2ws', 'Apple iPhone 14 Plus', 1, 'Iphone', 0, 10, 1),
(14, 7, 'Apple iPhone 13 (256 GB Storage, Red)', 69900, 61900, 20, '329613482_iphone13.jpg', 'test2', 'test3', 'test2', 'Apple iPhone 13', 1, 'Iphone', 0, 11, 1),
(15, 4, 'Realme 12 5G Dual Sim Smartphone (8GB RAM, 128GB Storage, Twilight Purple)', 20000, 17999, 20, '314137206_realme12.jpg', 'test12', 'tebdx', 'tegvd', 'Realme 12 5G', 1, 'Realme', 0, 12, 1),
(16, 4, 'Realme 12+ 5G Dual Sim Smartphone (8GB RAM, 256GB Storage, Pioneer Green)', 25999, 21999, 20, '531026754_realme12+.jpg', 'test1', 'test2', 'test2', 'Realme 12+ 5G', 1, 'Realme', 0, 12, 1),
(17, 4, 'Realme 12 Pro 5G Dual Sim Smartphone (8GB RAM, 256GB Storage , Navigator Beige)', 31999, 25999, 20, '204821303_realme12 Pro.jpg', 'test1', 'test3', 'test1', 'Realme 12 Pro 5G', 1, 'Realme', 0, 12, 1),
(18, 4, 'Realme 12 Pro+ 5G Dual Sim Smartphone (8GB RAM, 128GB Storage , Submarine Blue)', 34999, 24999, 20, '949861641_realme12 Pro+.jpg', 'test2', 'test1', 'test1', 'Realme 12 Pro+ 5G', 1, 'Realme', 0, 12, 1),
(19, 4, 'Realme 11 5G (8 GB RAM, 256 GB ROM, Glory Gold)', 22999, 18999, 20, '679202816_realme11.jpg', 'test', 'test2', 'test1', 'Realme 11 5G', 1, 'Realme', 0, 13, 1),
(20, 4, 'Realme 11 Pro Plus 5G (12 GB RAM, 256 GB ROM, Astral Black)', 32999, 29999, 20, '453760625_realme11 Pro+.jpg', 'test', 'tests', 'test1', 'Realme 11 Pro Plus 5G', 1, 'Realme', 0, 12, 1),
(21, 4, 'Realme C51 4G Dual Sim Smartphone (4GB RAM, 64GB Storage , Mint Green)', 10999, 7999, 20, '394417429_realmeC51.jpg', 'test2', 'test1', 'test12', 'Realme C51 4G', 1, 'Realme', 0, 14, 1),
(22, 4, 'Realme C53 4G Dual Sim Smartphone (6GB RAM, 64GB Storage , Champion Black)', 12999, 10999, 20, '251942495_realmeC53.jpg', 'test2', 'test3', 'test2', 'Realme C53 4G', 1, 'Realme', 0, 14, 1),
(23, 4, 'Realme C55 4G Dual Sim Smartphone (8GB RAM, 128GB Storage , Sunshower)', 15999, 13999, 20, '266306783_realmeC55.jpg', 'test1', 'test2', 'ttes2', 'Realme C55 4G', 1, 'Realme', 0, 14, 1),
(24, 4, 'Realme C67 5G Dual Sim Smartphone (6GB RAM, 128GB Storage , Sunny Oasis)', 17999, 13999, 20, '886475163_realmeC67.jpg', 'test2', 'test2', 'test3', 'Realme C67 5G', 1, 'Realme', 0, 14, 1),
(25, 8, 'Samsung Galaxy Z Series Z Flip 4 5G Dual Sim Smartphone (8GB RAM,128 Storage , Gold)', 89999, 79999, 20, '533995611_SG Z filp4.jpg', 'test2', 'test2', 'test3', 'Samsung Galaxy  Z Flip 4', 1, 'Samsung', 0, 15, 1),
(26, 8, 'Samsung Galaxy Z Series Flip 5 5G Dual Sim Smartphone (8GB RAM,256GB Storage , Grey)', 102999, 99999, 20, '783931280_SG Z filp5.jpg', 'test2', 'test3', 'test3', 'Samsung Galaxy Z Flip 5 5G', 1, 'Samsung', 0, 15, 1),
(27, 8, 'Samsung Galaxy Z Series Foldable5 5G Dual Sim Smartphone (12GB RAM,256GB Storage , Blue)', 159999, 154999, 20, '443882167_SG Z fold5.jpg', 'test', 'test2', 'tets2', 'Samsung Galaxy Z  Foldable5 5G', 1, 'Samsung', 0, 15, 1),
(28, 8, 'Samsung Galaxy A Series A55 5G Dual Sim Smartphone (8GB RAM,256GB Storage , Awesome Iceblue)', 42999, 39999, 20, '948324084_SG A55.jpg', 'test2', 'test3', 'tets3', 'Samsung Galaxy  A55', 1, 'test5', 0, 17, 1),
(29, 8, 'Samsung Galaxy A Series A35 5G Dual Sim Smartphone (8GB RAM, 256GB Storage , Awesome Lilac)', 35999, 32999, 20, '368924734_SG A35.jpg', 'test3', 'test3', 'tetsf3', 'Samsung Galaxy A35 5G', 1, 'Samsung', 0, 17, 1),
(30, 8, 'Samsung Galaxy S Series S23 FE 5G Dual Sim Smartphone (8GB RAM,128GB Storage,  Black)', 79999, 68999, 20, '820885025_SG S23 FE.jpg', 'tets2', 'test3', 'trest2', 'Samsung Galaxy  S23 FE 5G', 1, 'Samsung', 0, 16, 1),
(31, 8, 'Samsung Galaxy S Series S23 5G Dual Sim Smartphone (8GB RAM,256GB Storage , Beige)', 95999, 79999, 20, '472066842_SG S23.jpg', 'test2', 'test3', 'test3', 'Samsung Galaxy S23 5G', 1, 'Samsung', 0, 16, 1),
(32, 8, 'Samsung Galaxy S Series S23 Ultra 5G Dual Sim Smartphone (12GB RAM,256 Storage, Green)', 149999, 109999, 20, '235522012_SG S23 ultra.jpg', 'test2', 'test2', 'test2', 'Samsung Galaxy S23 Ultra 5G', 1, 'Samsung', 0, 16, 1),
(33, 8, 'Samsung Galaxy S Series S24 5G Dual Sim Smartphone (8GB RAM, 256GB Storage , Marble Grey)', 79999, 73999, 20, '842417260_SG S24.jpg', 'tets3', 'test2', 'test3', 'Samsung Galaxy S24 5G', 1, 'Samsung', 1, 16, 1),
(34, 8, 'Samsung Galaxy S Series S24 Plus 5G Dual Sim Smartphone (12GB RAM, 256GB Storage , Cobalt Violet)', 99999, 88999, 20, '680722425_SG S24+.jpg', 'test3', 'tets2', 'test3', 'Samsung Galaxy S24 Plus 5G', 1, 'Samsung', 0, 16, 1),
(35, 8, 'Samsung Galaxy S Series S24 Ultra 5G Dual Sim Smartphone (12GB RAM,256GB Storage , Titanium Black)', 134999, 129999, 20, '182269851_SG S24 ultra.jpg', 'tets2', 'test3', 'test23', 'Samsung Galaxy S24 Ultra 5G', 1, 'Samsung', 1, 16, 1),
(36, 8, 'Samsung Galaxy S Series S21 FE 5G Dual Sim Smartphone (8GB RAM,256GB Storage , Blue)', 74999, 69999, 20, '689362898_SG S21 FE.jpg', 'test2', 'tetst2', 'testt2', 'Samsung Galaxy S21 FE 5G', 1, 'Samsung', 0, 17, 1),
(37, 9, 'OnePlus 12 5G Dual Sim Smartphone (12GB RAM, 256GB Storage , Silky Black)', 67999, 64999, 20, '646502282_Oneplus 12.jpg', 'test2', 'tets3', 'tecsd3', 'OnePlus 12 5G', 1, 'OnePlus', 0, 18, 1),
(38, 9, 'OnePlus 12R 5G Dual Sim Smartphone (8GB RAM, 128GB Storage , Cool Blue)', 69999, 64999, 20, '434340153_Oneplus 12R.jpg', 'test3', 'yetr3', 'tetw2', 'OnePlus 12R 5G', 1, 'OnePlus', 0, 18, 1),
(39, 9, 'OnePlus 11 5G (16 GB RAM, 256 GB ROM, Titan Black)', 61999, 55599, 20, '459527243_Oneplus 11.jpg', 'test3', 'test4', 'test3', 'OnePlus 11 5G', 1, 'OnePlus', 0, 19, 1),
(40, 9, 'OnePlus 11R 5G Dual Sim Smartphone (16GB RAM, 256GB Storage , Sonic Black)', 49999, 44999, 20, '882304328_Oneplus 11R.jpg', 'test3', 'tetst3', 'ttss3', 'OnePlus 11R 5G', 1, 'OnePlus', 1, 19, 1),
(41, 9, 'OnePlus Nord Series Nord CE 3 Lite Dual Sim Smartphone (8GB RAM, 256GB Storage , Pastel Lime)', 21999, 17999, 20, '224015568_Oneplus Nord CE3Lite.jpg', 'test3', 'test4', 'yeyte', 'OnePlus Nord CE 3 Lite', 1, 'OnePlus', 0, 20, 1),
(42, 9, 'OnePlus Nord Series Nord CE3 Dual Sim Smartphone (8GB RAM, 128GB Storage , Aqua Surge)', 26999, 24999, 20, '935779395_Oneplus Nord CE3.jpg', 'hdbhd', 'test3', 'ygyddOn', 'OnePlus Nord CE3', 1, 'OnePlus', 0, 20, 1),
(43, 9, 'OnePlus Nord 3 5G (8 GB RAM, 128 GB ROM, Misty Green)', 33999, 28999, 20, '621153945_Oneplus Nord3.jpg', 'tetd', 'yggydd', 'dhbuhee', 'OnePlus Nord 3 5G', 1, 'OnePlus', 0, 20, 1),
(44, 9, 'OnePlus Open 5G Dual Sim Foldable Smartphone (16GB RAM, 512GB Storage , Emerald Dusk)', 139999, 138999, 20, '609800140_Oneplus Open.jpg', 'teste', 'test', 'suheb', 'OnePlus Open 5G', 1, 'OnePlus', 0, 21, 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_images` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `product_images`) VALUES
(3, 1, '547665390_shopping.jpg'),
(4, 1, '801051501_shopping (3).jpg'),
(5, 1, '146759759_shopping (2).jpg'),
(6, 1, '716906536_shopping (5).jpg'),
(7, 1, '808298265_shopping (1).jpg'),
(8, 2, '825169621_1676887106_Xyp.jpg'),
(9, 2, '463956846_1676887106_UM1.jpg'),
(10, 2, '888319533_1676887106_Xyp.jpg'),
(11, 2, '251802239_1676887106_oL2.jpg'),
(12, 2, '556724182_Samsung_Galaxy_s231.jpg'),
(13, 3, '866728746_1676887106_UM1.jpg'),
(14, 4, '884536971_15 pro 1.jpg'),
(15, 4, '418998697_15 pro 2.jpg'),
(16, 4, '828854224_15 pro 3.jpg'),
(17, 4, '788954786_15 pro 4.jpg'),
(18, 5, '531644940_iphone(2).jpg'),
(19, 5, '358057855_iphone(3).jpg'),
(21, 5, '654224746_Iphone(4).jpg'),
(22, 5, '500172851_iphone 12.jpg'),
(24, 6, '494890605_iphone-14-pro-finish-select-202209-6-1inch-gold.jpeg'),
(25, 6, '325465224_iphone-14-pro-finish-select-202209-6-1inch-spaceblack.jpeg'),
(26, 7, '122220804_cb95b193-414c-468c-ab35-6aec291a55b524300615.jpg'),
(27, 7, '799352172_63bf8d95-3c08-4a51-93ce-591dd08e0ad824300615.jpg'),
(28, 7, '783523951_1e7cc34c-97fe-4d62-8c41-39a279df962324300615.jpg'),
(29, 8, '749916829_iphone15(2).jpg'),
(30, 8, '944818669_iphone15(5).jpg'),
(31, 8, '361521561_iphone15(4).jpg'),
(32, 9, '127234655_iphone15 Plus(2).jpg'),
(33, 9, '750713729_iphone15(4).jpg'),
(34, 9, '604893692_iphone15(3).jpg'),
(35, 9, '451067122_iphone15(5).jpg'),
(36, 10, '460564179_iphone15 Pro(2).jpg'),
(38, 10, '904538023_iphone15 Pro(4).jpg'),
(39, 10, '919210022_iphone15 Pro(5).jpg'),
(40, 10, '169737552_iphone15 Pro(3).jpg'),
(41, 11, '135274151_iphone15 Pro Max(2).jpg'),
(42, 11, '310092688_iphone15 Pro Max(4).jpg'),
(43, 11, '696649650_iphone15 Pro Max(5).jpg'),
(44, 11, '786022684_iphone15 Pro Max(3).jpg'),
(45, 12, '409126747_iphone14(2).jpg'),
(46, 12, '766627231_iphone14(4).jpg'),
(47, 12, '683363975_iphone14(3).jpg'),
(48, 12, '364531056_iphone14.jpg'),
(49, 13, '340955858_iphone14 Plus(2).jpg'),
(50, 13, '732164589_iphone14 Plus(3).jpg'),
(51, 13, '398394209_iphone14 Plus.jpg'),
(52, 13, '703140732_iphone14 Plus(2).jpg'),
(53, 14, '115902758_iphone13(2).jpg'),
(55, 14, '917940214_iphone13(4).jpg'),
(56, 14, '811085261_iphone13(5).jpg'),
(57, 14, '932135130_iphone13(3).jpg'),
(58, 15, '803163370_realme12(2).jpg'),
(59, 15, '200774194_realme12(3).jpg'),
(60, 15, '411355537_realme12(4).jpg'),
(61, 15, '293371685_realme12.jpg'),
(62, 16, '449486625_realme12+(2).jpg'),
(63, 16, '135115280_realme12+(3).jpg'),
(64, 16, '392862464_realme12+(2).jpg'),
(65, 16, '501303346_realme12+.jpg'),
(66, 17, '972378320_realme12 Pro(2).jpg'),
(67, 17, '681595396_realme12 Pro(3).jpg'),
(68, 17, '605953992_realme12 Pro(4).jpg'),
(69, 17, '767056322_realme12 Pro(5).jpg'),
(70, 18, '285152547_realme12 Pro+(2).jpg'),
(71, 18, '178570368_realme12 Pro+(3).jpg'),
(72, 18, '168274559_realme12 Pro+(4).jpg'),
(73, 18, '220853298_realme12 Pro+(6).jpg'),
(74, 19, '791592345_realme11(2).jpg'),
(75, 19, '340347050_realme11(3).jpg'),
(76, 19, '592990908_realme11(4).jpg'),
(77, 19, '526237877_realme11.jpg'),
(78, 20, '824005378_realme11 Pro+(2).jpg'),
(79, 20, '723253858_realme11 Pro+(3).jpg'),
(80, 20, '469322607_realme11 Pro+(4).jpg'),
(81, 20, '563360915_realme11 Pro+.jpg'),
(82, 21, '468342544_realmeC51(2).jpg'),
(83, 21, '369959488_realmeC51(3).jpg'),
(84, 21, '215012608_realmeC51(4).jpg'),
(85, 21, '582384369_realmeC51.jpg'),
(86, 22, '874980615_realmeC53(2).jpg'),
(87, 22, '721137879_realmeC53(3).jpg'),
(88, 22, '187448066_realmeC53(4).jpg'),
(89, 22, '281135509_realmeC53.jpg'),
(90, 23, '731485388_realmeC55(2).jpg'),
(91, 23, '177667024_realmeC55(4).jpg'),
(92, 23, '381208591_realmeC55(5).jpg'),
(93, 23, '427360924_realmeC55(6).jpg'),
(94, 24, '337493277_realmeC67(2).jpg'),
(95, 24, '314603970_realmeC67(3).jpg'),
(96, 24, '368736955_realmeC67(4).jpg'),
(97, 24, '663434741_realmeC67.jpg'),
(98, 25, '118935577_SG Z filp4(2).jpg'),
(99, 25, '188023027_SG Z filp4(3).jpg'),
(100, 25, '693341784_SG Z filp4(4).jpg'),
(101, 25, '326608691_SG Z filp4(5).jpg'),
(102, 26, '815100585_SG Z filp5(2).jpg'),
(103, 26, '479943873_SG Z filp5(4).jpg'),
(104, 26, '322848984_SG Z filp5(6).jpg'),
(105, 26, '664842912_SG Z filp5(7).jpg'),
(106, 27, '428416403_SG Z fold5(2).jpg'),
(107, 27, '223658201_SG Z fold5(3).jpg'),
(108, 27, '931934570_SG Z fold5(4).jpg'),
(109, 27, '770932222_SG Z fold5.jpg'),
(110, 28, '830416098_SG A55(2).jpg'),
(111, 28, '213986589_SG A55(3).jpg'),
(112, 28, '136481977_SG A55(4).jpg'),
(113, 28, '610855716_SG A55(5).jpg'),
(114, 29, '728746242_SG A35(2).jpg'),
(115, 29, '963091273_SG A35(3).jpg'),
(116, 29, '344138780_SG A35(4).jpg'),
(117, 29, '224100816_SG A35(5).jpg'),
(118, 30, '370446124_SG S23 FE(2).jpg'),
(119, 30, '808228574_SG S23 FE(3).jpg'),
(120, 30, '354898899_SG S23 FE(4).jpg'),
(121, 30, '766319109_SG S23 FE(5).jpg'),
(122, 31, '487710407_SG S23(2).jpg'),
(123, 31, '136026313_SG S23(3).jpg'),
(124, 31, '793630143_SG S23.jpg'),
(125, 32, '479552239_SG S23 ultra(2).jpg'),
(126, 32, '764885235_SG S23 ultra(3).jpg'),
(127, 32, '349743228_SG S23 ultra.jpg'),
(128, 33, '360198014_SG S24(2).jpg'),
(129, 33, '326474521_SG S24(3).jpg'),
(130, 33, '498466129_SG S24(4).jpg'),
(131, 33, '506579423_SG S24(5).jpg'),
(132, 34, '898559557_SG S24+(2).jpg'),
(133, 34, '707417781_SG S24+(3).jpg'),
(134, 34, '178970763_SG S24+(4).jpg'),
(135, 34, '940069393_SG S24+(5).jpg'),
(136, 35, '463280088_SG S24 ultra(2).jpg'),
(137, 35, '863631095_SG S24 ultra(3).jpg'),
(138, 35, '875763162_SG S24 ultra(4).jpg'),
(139, 35, '191768241_SG S24 ultra(5).jpg'),
(140, 36, '398504204_SG S23 FE(2).jpg'),
(141, 36, '842433737_SG S21 FE(3).jpg'),
(142, 36, '335523851_SG S21 FE(4).jpg'),
(143, 36, '773707860_SG S21 FE(5).jpg'),
(144, 37, '263555702_Oneplus 12(2).jpg'),
(145, 37, '449191805_Oneplus 12(3).jpg'),
(146, 37, '680428709_Oneplus 12(4).jpg'),
(147, 37, '183675458_Oneplus 12(5).jpg'),
(148, 38, '525261228_Oneplus 12R(2).jpg'),
(149, 38, '172945975_Oneplus 12R(3).jpg'),
(150, 38, '615201677_Oneplus 12R(4).jpg'),
(151, 38, '349759872_Oneplus 12R(5).jpg'),
(152, 39, '219090846_Oneplus 11(2).jpg'),
(153, 39, '762232996_Oneplus 11(3).jpg'),
(154, 39, '943000878_Oneplus 11(4).jpg'),
(155, 39, '728976733_Oneplus 11(5).jpg'),
(156, 40, '844951623_Oneplus 11R(2).jpg'),
(157, 40, '901658729_Oneplus 11R(3).jpg'),
(158, 40, '989817595_Oneplus 11R(4).jpg'),
(159, 40, '576158815_Oneplus 11R(5).jpg'),
(160, 41, '919616131_Oneplus Nord CE3Lite(2).jpg'),
(161, 41, '843116921_Oneplus Nord CE3Lite(3).jpg'),
(162, 41, '196159246_Oneplus Nord CE3Lite(4).jpg'),
(163, 41, '621851830_Oneplus Nord CE3Lite(5).jpg'),
(164, 42, '195208001_Oneplus Nord CE3(4).jpg'),
(165, 42, '744454956_Oneplus Nord CE3(2).jpg'),
(166, 42, '633707127_Oneplus Nord CE3(3).jpg'),
(167, 42, '855008837_Oneplus Nord CE3.jpg'),
(168, 43, '596037339_Oneplus Nord3(2).jpg'),
(169, 43, '468193732_Oneplus Nord3(4).jpg'),
(170, 43, '492133521_Oneplus Nord3(3).jpg'),
(171, 43, '207748936_Oneplus Nord3.jpg'),
(172, 44, '317655452_Oneplus Open(2).jpg'),
(173, 44, '190948199_Oneplus Open(3).jpg'),
(174, 44, '311010545_Oneplus Open(4).jpg'),
(175, 44, '904711528_Oneplus Open(5).jpg'),
(176, 10, '894532172_134882889_iphone15 Pro.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` int(10) NOT NULL,
  `categories_id` int(10) NOT NULL,
  `sub_categories` varchar(100) NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `categories_id`, `sub_categories`, `status`) VALUES
(1, 1, 'Iphone 12', 1),
(2, 3, 'Iphone 12', 1),
(3, 3, 'mi 12', 1),
(8, 7, 'Iphone 15', 1),
(10, 7, 'Iphone 14', 1),
(11, 7, 'Iphone 13', 1),
(12, 4, 'Realme 12', 1),
(13, 4, 'Realme 11', 1),
(14, 4, 'Realme C Series', 1),
(15, 8, 'Galaxy Z Series', 1),
(16, 8, 'Galaxy S Series', 1),
(17, 8, 'Galaxy A Series', 1),
(18, 9, 'OnePlus 12', 1),
(19, 9, 'OnePlus 11', 1),
(20, 9, 'OnePlus Nord', 1),
(21, 9, 'OnePlus Foldable', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `added_on` datetime NOT NULL,
  `mobile` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `added_on`, `mobile`) VALUES
(1, 'Mohit Rana', 'test1@gmail.com', '123456', '2024-03-13 05:36:57', '7621048017'),
(4, 'user1', 'user123@gmail.com', '123456', '2024-03-20 03:15:04', '7621048017'),
(5, 'Krish', 'rkrish21@gmail.com', '123456', '2024-03-21 02:06:53', '9327100644');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`id`, `user_id`, `product_id`, `added_on`) VALUES
(16, 7, 7, '2024-03-12 07:20:46'),
(18, 2, 7, '2024-03-13 05:55:32'),
(21, 4, 1, '2024-03-20 03:51:58'),
(23, 1, 6, '2024-03-20 08:30:48'),
(24, 1, 6, '2024-03-20 08:33:56'),
(25, 5, 43, '2024-03-21 02:16:29'),
(26, 5, 42, '2024-03-21 02:16:31');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_user`
--
ALTER TABLE `admin_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banner`
--
ALTER TABLE `banner`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_status`
--
ALTER TABLE `order_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_user`
--
ALTER TABLE `admin_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `banner`
--
ALTER TABLE `banner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `order_status`
--
ALTER TABLE `order_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=177;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
