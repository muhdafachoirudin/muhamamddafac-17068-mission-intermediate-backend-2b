-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 08, 2025 at 11:48 PM
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
-- Database: `db_movie_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `daftar saya`
--

CREATE TABLE `daftar saya` (
  `daftar_saya_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `series_film_id` int(11) DEFAULT NULL,
  `added_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `episode/movie`
--

CREATE TABLE `episode/movie` (
  `episode_id` int(11) NOT NULL,
  `series_film_id` int(11) DEFAULT NULL,
  `judul_episode` varchar(255) NOT NULL,
  `nomor_episode` int(11) DEFAULT NULL,
  `season` int(11) DEFAULT NULL,
  `durasi` int(11) DEFAULT NULL,
  `url_video` varchar(255) DEFAULT NULL,
  `deskripsi_video` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `genre`
--

CREATE TABLE `genre` (
  `genre_id` int(11) NOT NULL,
  `nama_genre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `paket_id` int(11) DEFAULT NULL,
  `order_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `total_harga` decimal(10,2) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `status_order` varchar(50) DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `paket`
--

CREATE TABLE `paket` (
  `paket_id` int(11) NOT NULL,
  `nama_paket` varchar(100) NOT NULL,
  `harga` decimal(10,2) NOT NULL,
  `periode` varchar(50) DEFAULT NULL,
  `deskripsi_fitur_paket` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `pembayaran_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `payment_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `metode_pembayaran` varchar(50) DEFAULT NULL,
  `status_pembayaran` varchar(50) DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `series/film`
--

CREATE TABLE `series/film` (
  `series_film_id` int(11) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `deskripsi` text DEFAULT NULL,
  `tahun_rilis` int(11) DEFAULT NULL,
  `rating` decimal(3,1) DEFAULT NULL,
  `sutradara` varchar(100) DEFAULT NULL,
  `poster_vertikal` varchar(255) DEFAULT NULL,
  `poster_horizontal` varchar(255) DEFAULT NULL,
  `link_thriller` varchar(255) DEFAULT NULL,
  `tipe_konten` enum('movie','series') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `series/film`
--

INSERT INTO `series/film` (`series_film_id`, `judul`, `deskripsi`, `tahun_rilis`, `rating`, `sutradara`, `poster_vertikal`, `poster_horizontal`, `link_thriller`, `tipe_konten`) VALUES
(1, 'Kormaku bukan Kormamu', 'Ayo dibeli kormaku biar menjadi kormamu', 2025, 9.0, 'MDC', '/korma_panjang.jpg', 'korma_lebar.jpg', 'https://www.youtube.com/watch?v=Fcy7ZsVfLU0', 'series');

-- --------------------------------------------------------

--
-- Table structure for table `series film genre`
--

CREATE TABLE `series film genre` (
  `series_film_genre_id` int(11) NOT NULL,
  `series_film_id` int(11) DEFAULT NULL,
  `genre_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `profile_pic` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `subscription_status` varchar(20) NOT NULL DEFAULT 'inactive'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `daftar saya`
--
ALTER TABLE `daftar saya`
  ADD PRIMARY KEY (`daftar_saya_id`),
  ADD UNIQUE KEY `user_id` (`user_id`,`series_film_id`),
  ADD KEY `series_film_id` (`series_film_id`);

--
-- Indexes for table `episode/movie`
--
ALTER TABLE `episode/movie`
  ADD PRIMARY KEY (`episode_id`),
  ADD KEY `series_film_id` (`series_film_id`);

--
-- Indexes for table `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`genre_id`),
  ADD UNIQUE KEY `nama_genre` (`nama_genre`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `paket_id` (`paket_id`);

--
-- Indexes for table `paket`
--
ALTER TABLE `paket`
  ADD PRIMARY KEY (`paket_id`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`pembayaran_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `series/film`
--
ALTER TABLE `series/film`
  ADD PRIMARY KEY (`series_film_id`);

--
-- Indexes for table `series film genre`
--
ALTER TABLE `series film genre`
  ADD PRIMARY KEY (`series_film_genre_id`),
  ADD KEY `series_film_id` (`series_film_id`),
  ADD KEY `genre_id` (`genre_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `daftar saya`
--
ALTER TABLE `daftar saya`
  MODIFY `daftar_saya_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `episode/movie`
--
ALTER TABLE `episode/movie`
  MODIFY `episode_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `genre`
--
ALTER TABLE `genre`
  MODIFY `genre_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `paket`
--
ALTER TABLE `paket`
  MODIFY `paket_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `pembayaran_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `series/film`
--
ALTER TABLE `series/film`
  MODIFY `series_film_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `series film genre`
--
ALTER TABLE `series film genre`
  MODIFY `series_film_genre_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `daftar saya`
--
ALTER TABLE `daftar saya`
  ADD CONSTRAINT `daftar saya_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `daftar saya_ibfk_2` FOREIGN KEY (`series_film_id`) REFERENCES `series/film` (`series_film_id`) ON DELETE CASCADE;

--
-- Constraints for table `episode/movie`
--
ALTER TABLE `episode/movie`
  ADD CONSTRAINT `episode/movie_ibfk_1` FOREIGN KEY (`series_film_id`) REFERENCES `series/film` (`series_film_id`) ON DELETE CASCADE;

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `order_ibfk_2` FOREIGN KEY (`paket_id`) REFERENCES `paket` (`paket_id`);

--
-- Constraints for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD CONSTRAINT `pembayaran_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`);

--
-- Constraints for table `series film genre`
--
ALTER TABLE `series film genre`
  ADD CONSTRAINT `series film genre_ibfk_1` FOREIGN KEY (`series_film_id`) REFERENCES `series/film` (`series_film_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `series film genre_ibfk_2` FOREIGN KEY (`genre_id`) REFERENCES `genre` (`genre_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
