-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 26, 2026 at 08:14 AM
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
-- Database: `absensi_qr`
--

-- --------------------------------------------------------

--
-- Table structure for table `absensi`
--

CREATE TABLE `absensi` (
  `id` int(11) NOT NULL,
  `siswa_id` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `waktu` time NOT NULL,
  `telat` int(11) DEFAULT 0,
  `kategori_telat` varchar(20) DEFAULT NULL,
  `poin` int(11) DEFAULT 0,
  `status` enum('hadir','izin','sakit','alfa') DEFAULT 'hadir',
  `waktu_pulang` time DEFAULT NULL,
  `status_pulang` enum('belum','sudah') DEFAULT 'belum',
  `keterangan` text DEFAULT NULL,
  `bukti_file` varchar(255) DEFAULT NULL,
  `status_verifikasi` enum('pending','disetujui','ditolak') DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hukuman`
--

CREATE TABLE `hukuman` (
  `id` int(11) NOT NULL,
  `siswa_id` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `pelanggaran` varchar(100) DEFAULT NULL,
  `hukuman` text DEFAULT NULL,
  `status` enum('pending','selesai') DEFAULT 'pending',
  `diberikan_oleh` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pengaturan`
--

CREATE TABLE `pengaturan` (
  `id` int(11) NOT NULL,
  `key_setting` varchar(50) NOT NULL,
  `value_setting` varchar(100) NOT NULL,
  `deskripsi` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pengaturan`
--

INSERT INTO `pengaturan` (`id`, `key_setting`, `value_setting`, `deskripsi`) VALUES
(1, 'jam_masuk', '07:00:00', 'Jam masuk sekolah'),
(2, 'batas_telat_ringan', '15', 'Batas telat ringan (menit)'),
(3, 'batas_telat_sedang', '30', 'Batas telat sedang (menit)'),
(4, 'poin_telat_ringan', '1', 'Poin untuk telat ringan'),
(5, 'poin_telat_sedang', '2', 'Poin untuk telat sedang'),
(6, 'poin_telat_berat', '3', 'Poin untuk telat berat'),
(7, 'batas_tonitrus_7', '7', 'Batas Tonitrus untuk peringatan'),
(8, 'batas_tonitrus_8', '8', 'Batas Tonitrus untuk blokir'),
(9, 'batas_imperial_scholar', '8', 'Batas Stella untuk Imperial Scholar'),
(10, 'batas_stella', '10', 'Batas Stella untuk reward'),
(11, 'sanksi_tonitrus', 'Panggilan orang tua', 'Sanksi jika Tonitrus melebihi batas'),
(12, 'reward_stella', 'Piagam penghargaan', 'Reward jika Stella melebihi batas'),
(13, 'wa_api_key', '', 'API Key untuk WhatsApp Gateway'),
(14, 'wa_enabled', 'false', 'Status notifikasi WhatsApp'),
(15, 'wa_group_id', '', 'ID Grup WhatsApp untuk notifikasi');

-- --------------------------------------------------------

--
-- Table structure for table `riwayat_poin`
--

CREATE TABLE `riwayat_poin` (
  `id` int(11) NOT NULL,
  `siswa_id` int(11) NOT NULL,
  `jenis` enum('stella','tonitrus') NOT NULL,
  `jumlah` int(11) NOT NULL,
  `alasan` text DEFAULT NULL,
  `tanggal` date NOT NULL,
  `waktu` time NOT NULL,
  `diberikan_oleh` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `siswa`
--

CREATE TABLE `siswa` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `kelas` varchar(20) DEFAULT NULL,
  `qr_code` text DEFAULT NULL,
  `poin` int(11) DEFAULT 0,
  `stella` int(11) DEFAULT 0,
  `tonitrus` int(11) DEFAULT 0,
  `total_poin` int(11) DEFAULT 0,
  `gelar` varchar(50) DEFAULT '',
  `status_blokir` enum('aktif','peringatan','diblokir') DEFAULT 'aktif',
  `alasan_blokir` text DEFAULT NULL,
  `sertifikat_diberikan` enum('0','1') DEFAULT '0',
  `sertifikat_file` varchar(255) DEFAULT NULL,
  `nomor_ortu` varchar(20) DEFAULT NULL,
  `tanggal_imperial` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `siswa`
--

INSERT INTO `siswa` (`id`, `user_id`, `nama`, `kelas`) VALUES
(1, 2, 'Siswa Demo 1', 'X RPL 1');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `role` enum('guru','siswa','developer') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `role`) VALUES
(1, 'demo_guru', 'GANTI_DENGAN_HASH_PASSWORD', 'guru'),
(2, 'demo_siswa', 'GANTI_DENGAN_HASH_PASSWORD', 'siswa'),
(3, 'demo_developer', 'GANTI_DENGAN_HASH_PASSWORD', 'developer');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `absensi`
--
ALTER TABLE `absensi`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_absensi` (`siswa_id`,`tanggal`);

--
-- Indexes for table `hukuman`
--
ALTER TABLE `hukuman`
  ADD PRIMARY KEY (`id`),
  ADD KEY `siswa_id` (`siswa_id`);

--
-- Indexes for table `pengaturan`
--
ALTER TABLE `pengaturan`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key_setting` (`key_setting`);

--
-- Indexes for table `riwayat_poin`
--
ALTER TABLE `riwayat_poin`
  ADD PRIMARY KEY (`id`),
  ADD KEY `siswa_id` (`siswa_id`);

--
-- Indexes for table `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `absensi`
--
ALTER TABLE `absensi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hukuman`
--
ALTER TABLE `hukuman`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pengaturan`
--
ALTER TABLE `pengaturan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `riwayat_poin`
--
ALTER TABLE `riwayat_poin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `siswa`
--
ALTER TABLE `siswa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `absensi`
--
ALTER TABLE `absensi`
  ADD CONSTRAINT `absensi_ibfk_1` FOREIGN KEY (`siswa_id`) REFERENCES `siswa` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `hukuman`
--
ALTER TABLE `hukuman`
  ADD CONSTRAINT `hukuman_ibfk_1` FOREIGN KEY (`siswa_id`) REFERENCES `siswa` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `riwayat_poin`
--
ALTER TABLE `riwayat_poin`
  ADD CONSTRAINT `riwayat_poin_ibfk_1` FOREIGN KEY (`siswa_id`) REFERENCES `siswa` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `siswa`
--
ALTER TABLE `siswa`
  ADD CONSTRAINT `siswa_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
