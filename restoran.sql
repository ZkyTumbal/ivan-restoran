-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 27, 2024 at 05:03 AM
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
-- Database: `restoran`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_level`
--

CREATE TABLE `tb_level` (
  `id_level` int(11) NOT NULL,
  `nama_level` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tb_level`
--

INSERT INTO `tb_level` (`id_level`, `nama_level`) VALUES
(1, 'Administrator'),
(2, 'Waiter'),
(3, 'Kasir'),
(4, 'Owner'),
(5, 'Pelanggan');

-- --------------------------------------------------------

--
-- Table structure for table `tb_masakan`
--

CREATE TABLE `tb_masakan` (
  `id_masakan` int(11) NOT NULL,
  `nama_masakan` varchar(150) NOT NULL,
  `harga` varchar(150) NOT NULL,
  `stok` int(11) NOT NULL,
  `status_masakan` varchar(150) NOT NULL,
  `gambar_masakan` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tb_masakan`
--

INSERT INTO `tb_masakan` (`id_masakan`, `nama_masakan`, `harga`, `stok`, `status_masakan`, `gambar_masakan`) VALUES
(21, 'Kopi', '3000', 111, 'tersedia', 'Kopi.');

-- --------------------------------------------------------

--
-- Table structure for table `tb_order`
--

CREATE TABLE `tb_order` (
  `id_order` int(11) NOT NULL,
  `id_admin` int(11) DEFAULT NULL,
  `id_pengunjung` int(11) NOT NULL,
  `waktu_pesan` datetime NOT NULL,
  `no_meja` int(11) NOT NULL,
  `total_harga` varchar(150) NOT NULL,
  `uang_bayar` varchar(150) DEFAULT NULL,
  `uang_kembali` varchar(150) DEFAULT NULL,
  `status_order` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tb_order`
--

INSERT INTO `tb_order` (`id_order`, `id_admin`, `id_pengunjung`, `waktu_pesan`, `no_meja`, `total_harga`, `uang_bayar`, `uang_kembali`, `status_order`) VALUES
(26, 1, 1, '2024-02-27 08:54:47', 1, '6000', '10000', '4000', 'sudah bayar'),
(27, 1, 1, '2024-02-27 08:58:33', 1, '3000', '5000', '2000', 'sudah bayar');

-- --------------------------------------------------------

--
-- Table structure for table `tb_pesan`
--

CREATE TABLE `tb_pesan` (
  `id_pesan` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_order` int(11) DEFAULT NULL,
  `id_masakan` int(11) NOT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `status_pesan` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tb_pesan`
--

INSERT INTO `tb_pesan` (`id_pesan`, `id_user`, `id_order`, `id_masakan`, `jumlah`, `status_pesan`) VALUES
(51, 1, 0, 19, 0, 'sudah'),
(52, 1, 0, 18, 0, 'sudah'),
(61, 1, 0, 21, 0, 'sudah'),
(62, 1, 27, 21, 1, 'sudah');

-- --------------------------------------------------------

--
-- Table structure for table `tb_stok`
--

CREATE TABLE `tb_stok` (
  `id_stok` int(11) NOT NULL,
  `id_pesan` int(11) NOT NULL,
  `jumlah_terjual` int(11) DEFAULT NULL,
  `status_cetak` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tb_stok`
--

INSERT INTO `tb_stok` (`id_stok`, `id_pesan`, `jumlah_terjual`, `status_cetak`) VALUES
(1, 46, 1, 'belum cetak'),
(2, 47, 2, 'belum cetak'),
(3, 48, 2, 'belum cetak'),
(4, 49, 1, 'belum cetak'),
(5, 50, 2, 'belum cetak'),
(6, 51, 0, 'belum cetak'),
(7, 52, 0, 'belum cetak'),
(8, 53, 0, 'belum cetak'),
(9, 54, 0, 'belum cetak'),
(10, 55, 0, 'belum cetak'),
(11, 56, 2, 'belum cetak'),
(12, 57, 1, 'belum cetak'),
(13, 58, 6, 'belum cetak'),
(14, 59, 1, 'belum cetak'),
(15, 60, 1, 'belum cetak'),
(16, 61, 0, 'belum cetak'),
(17, 62, 1, 'belum cetak');

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
--

CREATE TABLE `tb_user` (
  `id_user` int(11) NOT NULL,
  `username` varchar(150) NOT NULL,
  `password` varchar(150) NOT NULL,
  `nama_user` varchar(150) NOT NULL,
  `id_level` int(11) NOT NULL,
  `status` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tb_user`
--

INSERT INTO `tb_user` (`id_user`, `username`, `password`, `nama_user`, `id_level`, `status`) VALUES
(1, 'admin', '123', 'Admin', 1, 'aktif'),
(6, 'hendro', '123', 'Hendro', 2, 'aktif'),
(7, 'fitri', '123', 'Fitri', 3, 'aktif'),
(16, 'owner', '123', 'Owner', 4, 'aktif'),
(17, 'pelanggan', '123', 'Pelanggan', 5, 'aktif');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_level`
--
ALTER TABLE `tb_level`
  ADD PRIMARY KEY (`id_level`);

--
-- Indexes for table `tb_masakan`
--
ALTER TABLE `tb_masakan`
  ADD PRIMARY KEY (`id_masakan`);

--
-- Indexes for table `tb_order`
--
ALTER TABLE `tb_order`
  ADD PRIMARY KEY (`id_order`),
  ADD KEY `id_admin` (`id_admin`),
  ADD KEY `id_pengunjung` (`id_pengunjung`);

--
-- Indexes for table `tb_pesan`
--
ALTER TABLE `tb_pesan`
  ADD PRIMARY KEY (`id_pesan`);

--
-- Indexes for table `tb_stok`
--
ALTER TABLE `tb_stok`
  ADD PRIMARY KEY (`id_stok`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `id_level` (`id_level`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_level`
--
ALTER TABLE `tb_level`
  MODIFY `id_level` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tb_masakan`
--
ALTER TABLE `tb_masakan`
  MODIFY `id_masakan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `tb_order`
--
ALTER TABLE `tb_order`
  MODIFY `id_order` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `tb_pesan`
--
ALTER TABLE `tb_pesan`
  MODIFY `id_pesan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `tb_stok`
--
ALTER TABLE `tb_stok`
  MODIFY `id_stok` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD CONSTRAINT `tb_user_ibfk_1` FOREIGN KEY (`id_level`) REFERENCES `tb_level` (`id_level`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
