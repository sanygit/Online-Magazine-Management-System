-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 27, 2021 at 04:08 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `magazines_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `category_list`
--

CREATE TABLE `category_list` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '0= Inactive, 1 = Active',
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category_list`
--

INSERT INTO `category_list` (`id`, `name`, `description`, `status`, `date_created`) VALUES
(2, 'Art', 'This is an Art Magazines Categories', 1, '2021-11-27 10:21:23'),
(3, 'Business', 'This is a Business Magazine Category', 1, '2021-11-27 10:24:03'),
(4, 'Cooking', 'This is a Cooking Magazines Category', 1, '2021-11-27 10:25:35'),
(5, 'Fashion', 'This is a Fashion Magazines Category', 1, '2021-11-27 10:30:22'),
(6, 'Technology', 'This is a Technology Magazines Category', 1, '2021-11-27 10:30:46'),
(7, 'Riders and Drivers', 'This is a Riders and Drivers Magazines Categories', 1, '2021-11-27 10:31:27'),
(8, 'Wild', 'This is a Wild Magazines Category.', 0, '2021-11-27 10:31:57');

-- --------------------------------------------------------

--
-- Table structure for table `comment_list`
--

CREATE TABLE `comment_list` (
  `id` int(30) NOT NULL,
  `magazine_id` int(30) NOT NULL,
  `comment` text NOT NULL,
  `name` text NOT NULL,
  `user_id` int(30) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 = not verified,1= verified ',
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `comment_list`
--

INSERT INTO `comment_list` (`id`, `magazine_id`, `comment`, `name`, `user_id`, `status`, `date_created`) VALUES
(2, 1, 'Sample Comment of users', 'admin', 1, 1, '2021-11-27 17:08:12'),
(7, 1, 'Sample Comment of non-registered user.', 'John', NULL, 1, '2021-11-27 17:15:14'),
(9, 2, 'This is a sample Comment.', 'admin', 1, 1, '2021-11-27 17:40:35'),
(10, 1, 'Test\r\n', 'Claire', NULL, 1, '2021-11-27 17:52:24');

-- --------------------------------------------------------

--
-- Table structure for table `magazine_list`
--

CREATE TABLE `magazine_list` (
  `id` int(30) NOT NULL,
  `title` text NOT NULL,
  `category_id` int(30) NOT NULL,
  `description` text NOT NULL,
  `banner_path` text NOT NULL,
  `pdf_path` text DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '0 = Not Published, 1= Published',
  `user_id` int(30) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `magazine_list`
--

INSERT INTO `magazine_list` (`id`, `title`, `category_id`, `description`, `banner_path`, `pdf_path`, `status`, `user_id`, `date_created`, `date_updated`) VALUES
(1, 'Sample Art Magazine', 2, '&lt;p style=&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px;&quot;&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam eget lorem ultrices nisi finibus dignissim sit amet ut lectus. Sed tortor dui, luctus vel fermentum ac, pharetra vitae ante. Nunc dictum consequat fermentum. Aenean sit amet malesuada lorem. Fusce eu ultricies nunc. Proin eu lectus ut lacus tempus pretium. Quisque nec turpis metus. Pellentesque sed sapien sagittis, porta tellus vel, consectetur neque. Fusce sodales leo sem, quis consequat metus dignissim non. Nunc rutrum erat in risus vulputate volutpat. Pellentesque id egestas leo, at tempus diam. Etiam venenatis turpis ut efficitur tempus.&lt;/p&gt;&lt;p style=&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px;&quot;&gt;Proin vitae justo magna. Pellentesque sed turpis neque. Maecenas enim sapien, ornare in convallis in, aliquet ullamcorper nisi. Curabitur lacinia elit nec lorem facilisis sagittis. Morbi odio felis, convallis nec turpis a, porta porttitor erat. Nam scelerisque, urna ac faucibus porta, diam lorem rutrum quam, sed tempus neque nulla vel lorem. Cras sed suscipit quam. Donec finibus ut arcu nec bibendum. Mauris non tristique dui, et sagittis odio. Aenean et suscipit nisi. Integer mattis sollicitudin diam ut faucibus. Integer ex odio, vestibulum eu massa vel, rhoncus vehicula mauris.&lt;/p&gt;', 'uploads/banners/magazine-1.png?v=1637998844', 'uploads/pdf/magazine-1.pdf?v=1637985612', 1, 1, '2021-11-27 11:55:49', '2021-11-27 15:40:44'),
(2, 'Sample 101', 7, '&lt;p&gt;This is a sample magazine content created by an Author.&lt;/p&gt;', 'uploads/banners/magazine-.png?v=1637996266', 'uploads/pdf/magazine-.pdf?v=1637996266', 1, 6, '2021-11-27 14:57:46', '2021-11-27 17:49:15');

-- --------------------------------------------------------

--
-- Table structure for table `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'Online Magazine Management System - PHP'),
(6, 'short_name', 'OMMS - PHP'),
(11, 'logo', 'uploads/logo-1637977267.png'),
(13, 'user_avatar', 'uploads/user_avatar.jpg'),
(14, 'cover', 'uploads/cover-1637977267.png'),
(15, 'content', 'Array');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `middlename` text DEFAULT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `status` int(1) NOT NULL DEFAULT 0 COMMENT '0=not verified, 1 = verified',
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `middlename`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `status`, `date_added`, `date_updated`) VALUES
(1, 'Adminstrator', NULL, 'Admin', 'admin', '0192023a7bbd73250516f069df18b500', 'uploads/avatar-1.png?v=1635556826', NULL, 1, 1, '2021-01-20 14:02:37', '2021-11-27 13:39:11'),
(5, 'John', 'D', 'Smith', 'jsmith', '1254737c076cf867dc53d60a0364f38e', NULL, NULL, 2, 1, '2021-11-27 14:24:16', '2021-11-27 14:43:32'),
(6, 'Claire', 'C', 'Blake', 'cblake', '4744ddea876b11dcb1d169fadf494418', NULL, NULL, 2, 1, '2021-11-27 14:25:31', '2021-11-27 14:43:24');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category_list`
--
ALTER TABLE `category_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comment_list`
--
ALTER TABLE `comment_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `magazine_id` (`magazine_id`);

--
-- Indexes for table `magazine_list`
--
ALTER TABLE `magazine_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `system_info`
--
ALTER TABLE `system_info`
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
-- AUTO_INCREMENT for table `category_list`
--
ALTER TABLE `category_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `comment_list`
--
ALTER TABLE `comment_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `magazine_list`
--
ALTER TABLE `magazine_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comment_list`
--
ALTER TABLE `comment_list`
  ADD CONSTRAINT `comment_list_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `comment_list_ibfk_2` FOREIGN KEY (`magazine_id`) REFERENCES `magazine_list` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `magazine_list`
--
ALTER TABLE `magazine_list`
  ADD CONSTRAINT `magazine_list_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `magazine_list_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
