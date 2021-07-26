-- phpMyAdmin SQL Dump
-- version 4.2.0
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 03, 2014 at 07:55 PM
-- Server version: 5.6.17
-- PHP Version: 5.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `si_sik_penjualan`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE IF NOT EXISTS `barang` (
  `kode_barang` varchar(30) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `harga` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`kode_barang`, `nama_barang`, `jumlah`, `harga`) VALUES
('M001', 'Sabun', 15, '2000'),
('K001', 'Keyboard', 55, '55000'),
('M002', 'Spidol', 200, '1300');

-- --------------------------------------------------------

--
-- Table structure for table `detail_jual`
--

CREATE TABLE IF NOT EXISTS `detail_jual` (
  `no_faktur` varchar(25) NOT NULL,
  `kode_barang` varchar(5) NOT NULL,
  `harga` varchar(30) NOT NULL,
  `jumlah` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detail_jual`
--

INSERT INTO `detail_jual` (`no_faktur`, `kode_barang`, `harga`, `jumlah`) VALUES
('PO-20141104-2', 'M001', '2000', 1),
('PO-20141104-3', 'M001', '2000', 20),
('PO-20141104-4', 'K001', '55000', 3),
('PO-20141104-4', 'M002', '1300', 5),
('PO-20141104-4', 'M001', '2000', 2),
('PO-20141104-5', 'K001', '55000', 1),
('PO-20141104-5', 'M001', '2000', 1),
('PO-20141104-5', 'M001', '2000', 1),
('PO-20141104-5', 'M001', '2000', 1);

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE IF NOT EXISTS `pelanggan` (
  `id_pelanggan` varchar(10) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `jk` varchar(15) NOT NULL,
  `alamat` text NOT NULL,
  `notlp` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `nama`, `jk`, `alamat`, `notlp`) VALUES
('P001', 'Jajang', 'pria', 'jl. aceh no 21', '02220120'),
('P002', 'Rudi Bjangan', 'pria', 'Jalan Bojong Soang\nNo. 40\nBandung', '085616541614'),
('P005', 'Haryanti', 'pria', 'Jalan Cicadas Kidul', '089999999');

-- --------------------------------------------------------

--
-- Table structure for table `penjualan`
--

CREATE TABLE IF NOT EXISTS `penjualan` (
  `no_faktur` varchar(25) NOT NULL,
  `tgl_penjualan` date NOT NULL,
  `id_pelanggan` varchar(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `penjualan`
--

INSERT INTO `penjualan` (`no_faktur`, `tgl_penjualan`, `id_pelanggan`) VALUES
('PO-20141104-1', '2014-11-04', 'P001'),
('PO-20141104-2', '2014-11-04', 'P001'),
('PO-20141104-3', '2014-11-04', 'P002'),
('PO-20141104-4', '2014-11-04', 'P004'),
('PO-20141104-5', '2014-11-04', 'P004');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
`id` int(11) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`) VALUES
(1, 'admin', 'admin'),
(2, 'user', 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
