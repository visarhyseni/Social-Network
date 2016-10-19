-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 06, 2015 at 10:34 PM
-- Server version: 5.6.16
-- PHP Version: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `social_network`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `comment_author` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`comment_id`, `post_id`, `user_id`, `comment`, `comment_author`, `date`) VALUES
(1, 5, 2, 'Hi this is really nice post. ', '', '2015-03-05 21:24:08'),
(3, 5, 2, 'hi this is another testing comment!', 'Abdul Wali', '2015-03-05 21:37:08'),
(4, 5, 2, 'Hey, this is one more special comment!', 'Abdul Wali', '2015-03-05 21:45:51'),
(5, 5, 2, 'hi man, what this forum all about. what the hell is going on. ', 'Abdul Wali', '2015-03-05 21:46:57'),
(6, 10, 2, 'hey, this post has no comments why? ', 'Abdul Wali', '2015-03-05 21:56:39'),
(7, 5, 2, 'Hi guys, what is going on here? I want to learn something. ', 'Abdul Wali', '2015-03-05 22:00:53'),
(8, 5, 2, 'Hi wht happened! ', 'Abdul Wali', '2015-03-05 22:28:10'),
(9, 10, 2, 'hi, now see this comment! ', 'Abdul Wali', '2015-03-05 22:29:20'),
(10, 5, 2, 'hey this is a comment from john doe! ', 'John Doe', '2015-03-05 22:38:37'),
(11, 5, 2, 'Hi, this is a new user Jassica!', 'Jassica', '2015-03-05 22:40:42'),
(12, 11, 12, 'hi this is a testing comment!', 'John Doe', '2015-03-07 22:07:49'),
(13, 6, 2, 'this is a comment..', 'Abdul Khan', '2015-04-05 22:52:53');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE IF NOT EXISTS `messages` (
  `msg_id` int(11) NOT NULL AUTO_INCREMENT,
  `sender` int(11) NOT NULL,
  `receiver` int(11) NOT NULL,
  `msg_sub` text NOT NULL,
  `msg_topic` text NOT NULL,
  `reply` text NOT NULL,
  `status` text NOT NULL,
  `msg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`msg_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`msg_id`, `sender`, `receiver`, `msg_sub`, `msg_topic`, `reply`, `status`, `msg_date`) VALUES
(2, 2, 16, 'Hello Tina again', 'Hello Tina againHello Tina againHello Tina againHello Tina again', 'hello Abdul, this is my reply to your message. ', 'read', '2015-04-05 22:31:27'),
(3, 2, 16, 'Hello wali', 'Hello waliHello waliHello wali', 'hey, what are you talking about? ', 'read', '2015-04-05 22:30:25'),
(4, 12, 16, 'hello tina, this is John', 'hello tina, this is John hello tina, this is John hello tina, this is John hello tina, this is John', 'Hello john, how are you? ', 'unread', '2015-04-05 21:05:10'),
(5, 14, 16, 'this is janana', 'this is something more to Tina....', 'hi janana, I am fine, what about you...?', 'read', '2015-04-05 22:30:16'),
(6, 16, 12, 'Hello john, where are you from? ', 'hi this is Tina from USA, I want to be friend with you. ', 'hello tina, I am from Pakistan. thank you!', 'read', '2015-04-05 22:33:05'),
(7, 12, 16, 'Hello tina, I am Khan from Pakistan', 'Hello tina, I am Khan from Pakistan Hello tina, I am Khan from Pakistan Hello tina, I am Khan from Pakistan', 'no_reply', 'read', '2015-04-05 22:34:20');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE IF NOT EXISTS `posts` (
  `post_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL,
  `post_title` text NOT NULL,
  `post_content` text NOT NULL,
  `post_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`post_id`, `user_id`, `topic_id`, `post_title`, `post_content`, `post_date`) VALUES
(2, 2, 2, 'another test', 'another test', '2015-03-03 19:00:00'),
(3, 2, 3, 'this is just another testing', 'this is just another testing....', '2015-03-03 19:00:00'),
(4, 2, 3, 'Hi, I want to get help about jSon', 'Hi, I want to get help about HTMLHi, I want to get help about HTMLHi, I want to get help about HTMLHi, I want to get help about HTMLHi, I want to get help about HTMLHi, I want to get help about HTMLHi, I want to get help about HTMLHi, I want to get help about HTMLHi, I want to get help about HTMLHi, I want to get help about HTML', '2015-03-08 00:31:03'),
(6, 2, 2, 'PHP & MySQLi Web Development for beginners', 'PHP & MySQLi Web Development From Scratch!PHP & MySQLi Web Development From Scratch!PHP & MySQLi Web Development From Scratch!PHP & MySQLi Web Development From Scratch!PHP & MySQLi Web Development From Scratch!', '2015-03-08 00:31:43'),
(11, 12, 2, 'Hi, I want to know something about PHP? ', 'Hi, I want to know something about PHP? Hi, I want to know something about PHP? Hi, I want to know something about PHP? Hi, I want to know something about PHP? Hi, I want to know something about PHP? Hi, I want to know something about PHP? ', '2015-03-07 22:07:31'),
(12, 16, 4, 'I want to get help about AJAX? please help', 'I want to get help about AJAX? please helpI want to get help about AJAX? please helpI want to get help about AJAX? please helpI want to get help about AJAX? please help', '2015-03-07 22:09:04');

-- --------------------------------------------------------

--
-- Table structure for table `topics`
--

CREATE TABLE IF NOT EXISTS `topics` (
  `topic_id` int(11) NOT NULL AUTO_INCREMENT,
  `topic_title` text NOT NULL,
  PRIMARY KEY (`topic_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `topics`
--

INSERT INTO `topics` (`topic_id`, `topic_title`) VALUES
(1, 'HTML & CSS'),
(2, 'PHP & MySQL'),
(3, 'JavaScript'),
(4, 'AJAX');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(100) NOT NULL,
  `user_pass` varchar(100) NOT NULL,
  `user_email` varchar(100) NOT NULL,
  `user_country` varchar(100) NOT NULL,
  `user_gender` varchar(100) NOT NULL,
  `user_b_day` date NOT NULL,
  `user_image` text NOT NULL,
  `register_date` date NOT NULL,
  `last_login` date NOT NULL,
  `status` text NOT NULL,
  `posts` text NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_name`, `user_pass`, `user_email`, `user_country`, `user_gender`, `user_b_day`, `user_image`, `register_date`, `last_login`, `status`, `posts`) VALUES
(1, 'Abdul Wali ', 'walikhan', 'abc@gmail.com', 'Pakistan', 'Male ', '2015-02-11', 'umar farq.jpg', '2015-02-11', '2015-02-19', 'unverified', 'no'),
(2, 'Abdul Khan', 'walikhan123', 'awpareshan@gmail.com', 'Pakistan', 'Male', '2015-02-19', 'abdul-wali-ustaad1.jpg', '2015-02-11', '2015-02-11', 'unverified', 'yes'),
(12, 'John Doe', 'walikhan123', 'john@gmail.com', 'United States', 'Male', '2015-03-17', 'mohsin-shave-papu.jpg', '2015-02-11', '2015-02-11', 'unverified', 'yes'),
(13, 'John ', 'johnkkadfads', 'john@yahoo.com', 'United States', 'Male', '2015-03-17', 'default.jpg', '2015-03-03', '2015-03-03', 'unverified', 'No'),
(14, 'Janana', 'kjlkjlkjkljlkj', 'janan@gmail.com', 'India', 'Female', '2015-03-17', 'default.jpg', '2015-03-03', '2015-03-03', 'unverified', 'No'),
(15, 'Peterson', 'lkjlkkjljds', 'pet@gmail.com', 'India', 'Male', '2015-03-17', 'default.jpg', '2015-03-03', '2015-03-03', 'unverified', 'No'),
(16, 'Tina', 'walikhan', 'jassica@gmail.com', 'United States', 'Female', '2015-03-17', 'adsense-girl.jpg', '2015-03-06', '2015-03-06', 'unverified', 'yes');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
