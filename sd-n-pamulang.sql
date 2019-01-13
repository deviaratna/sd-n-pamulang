-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 24 Des 2018 pada 19.02
-- Versi server: 10.1.36-MariaDB
-- Versi PHP: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_sd_bendungan2`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `set_tgl_pendaftaran`
--

CREATE TABLE `set_tgl_pendaftaran` (
  `id` int(11) NOT NULL,
  `id_master` int(11) NOT NULL,
  `tgl_awal` datetime NOT NULL,
  `tgl_akhir` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `set_tgl_pendaftaran`
--

INSERT INTO `set_tgl_pendaftaran` (`id`, `id_master`, `tgl_awal`, `tgl_akhir`) VALUES
(1, 13, '2018-10-01 00:00:00', '2018-10-03 00:00:00'),
(2, 13, '2018-10-29 00:00:00', '2018-10-31 00:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_admin`
--

CREATE TABLE `tb_admin` (
  `kd_admin` varchar(255) NOT NULL,
  `username` varchar(32) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nama` char(50) NOT NULL,
  `akses` varchar(20) NOT NULL,
  `status` varchar(6) NOT NULL,
  `foto` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_admin`
--

INSERT INTO `tb_admin` (`kd_admin`, `username`, `password`, `nama`, `akses`, `status`, `foto`) VALUES
('6cad6963408f4fc09f823314cc81f2aa', 'raisa1996', '$2y$10$jEWTB01cPjAvKyzWvjKuKeiF3qUhEz3v4Eg6B6pqQNaFYEhMRFOU.', 'Raisa Girl', 'Admin', '1', '1540025353251.jpg'),
('8ccf942dc87c425499940376eb3d661a', 'fajar123', '$2y$10$TJbhnwazux4UajR4vtddae29iDnYDjnRGK52Zccao7KchI3IRQ.Oy', 'Fajar Trisnawan', 'Admin', '0', '1540534397710.jpg'),
('f0c1b18ab5df4a4690d959b4bc26838a', 'egysatria', '$2y$10$fk6sqqr1ag27x.HD1FopjOr/.cQfowCKMNX0TlSf/GgDc4CyZ284q', 'Egy Satria Hantoro', 'Admin', '1', '1539508373116.jpg'),
('f693e7e359504d4a8cda88f32ddb50b6', 'siska123', '$2y$10$ZOnpY9wQdAZsPdy8OuYwNeWqNgsweO0w4yjDUrwUZezPRlZ/j5rDq', 'Siska Andriani', 'Admin', '0', '1539510382825.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_alumni`
--

CREATE TABLE `tb_alumni` (
  `kd_alumni` varchar(50) NOT NULL,
  `nm_alumni` char(50) NOT NULL,
  `tp_lahir` varchar(50) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `jk` enum('Laki - Laki','Perempuan') NOT NULL,
  `alamat` text NOT NULL,
  `thn_masuk` varchar(12) NOT NULL,
  `thn_keluar` varchar(12) NOT NULL,
  `no_tlp` int(16) NOT NULL,
  `foto` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_arsip`
--

CREATE TABLE `tb_arsip` (
  `kd_arsip` varchar(25) NOT NULL,
  `judul` text NOT NULL,
  `file` text NOT NULL,
  `tgl_publis` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_bagi_kelas`
--

CREATE TABLE `tb_bagi_kelas` (
  `id_bagi_kelas` int(11) NOT NULL,
  `id_master` int(11) NOT NULL,
  `id_kelas` int(11) NOT NULL,
  `id_siswa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_daftar`
--

CREATE TABLE `tb_daftar` (
  `kd_daftar` varchar(25) NOT NULL,
  `kelas` varchar(5) NOT NULL,
  `nm_pendaftar` char(50) NOT NULL,
  `tp_lahir` varchar(50) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `jk` enum('Laki - Laki','Perempuan') NOT NULL,
  `agama` enum('Islam','Kristen','Khatolik','Hindu','Budha') NOT NULL,
  `alamat` text NOT NULL,
  `nm_ayah` char(50) NOT NULL,
  `nm_ibu` char(50) NOT NULL,
  `alamat_ortu` text NOT NULL,
  `pk_ayah` varchar(50) NOT NULL,
  `pk_ibu` varchar(50) NOT NULL,
  `tlp_ortu` varchar(16) NOT NULL,
  `tgl_daftar` date NOT NULL,
  `status` tinyint(1) NOT NULL,
  `foto` text NOT NULL,
  `kd_master` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_guru`
--

CREATE TABLE `tb_guru` (
  `id_guru` int(11) NOT NULL,
  `nip` varchar(25) NOT NULL,
  `nm_guru` char(50) NOT NULL,
  `tp_lahir` varchar(50) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `jk` enum('L','P') NOT NULL,
  `agama` varchar(20) NOT NULL,
  `jabatan` varchar(35) NOT NULL,
  `alamat` text NOT NULL,
  `golongan` varchar(30) DEFAULT NULL,
  `no_telp` varchar(20) NOT NULL,
  `status` enum('PNS','Honorer') DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `pendidikan` enum('SLTP/SMP','SLTA','D3','D4/S1','S2','S3') NOT NULL,
  `foto` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_guru`
--

INSERT INTO `tb_guru` (`id_guru`, `nip`, `nm_guru`, `tp_lahir`, `tgl_lahir`, `jk`, `agama`, `jabatan`, `alamat`, `golongan`, `no_telp`, `status`, `password`, `pendidikan`, `foto`) VALUES
(3, '197127808635519807', 'Eny sumaryanti, S.pd', 'Tawarsari', '1972-02-01', 'P', 'Islam', 'Guru Kelas', 'Watudalang', 'III A', '087838604666', 'PNS', '$2y$10$0cBYtQYuueP.bxpJDtyIq.FefyYKvbuNZXibmeVxe/4FckXbGujya', 'D4/S1', '1540094749885.jpeg'),
(4, '197223654478009126', 'Sujinah, S.pd', 'Bantul', '1973-06-11', 'P', 'Islam', 'Guru Kelas', 'Watudalng', 'III A', '088654789007', 'PNS', '$2y$10$e2eY0dHim71InYTmTTnE0uYCjX5kGtTWRUjPuXlYVmaKCWVOYm7Uq', 'D4/S1', '1540046120235.jpg'),
(5, '198766235009778122', 'Sriyanto, S.pd', 'Sleman', '1972-06-12', 'L', 'Islam', 'Guru Kelas', 'Wiladeg', 'III B', '088754338098', 'PNS', '$2y$10$LFRTwagsVNAJQj1AmJFRv.iChHu/sJXcsWCFQZ.b0l56nmCf2.fAW', 'S2', '1540139398274.jpeg'),
(6, '198766235009111393', 'Sri Budiarti, S.pd', 'Karangmojo', '1983-09-13', 'P', 'Islam', 'Guru Kelas', 'Grogol, Karangmojo, Gunungkidul, RT05/RW18', 'III A', '088768977409', 'PNS', '$2y$10$ulSvmp78CrZyfHfxzzCFzuN.9VTzyTJyEyq5yFXYsFir1YcstaPKO', 'D4/S1', '1540139136475.jpg'),
(7, '198766235009341444', 'Wiji Kusmini,S.pd', 'Baleharjo', '0000-00-00', 'P', 'Kristen', 'Kepala Sekolah', 'Purwosari, Baleharjo, Gunungkidul, RT03/RW21', 'III B', '088856770012', 'PNS', '$2y$10$xur0n/QIJVTDtPe6KPBONuKGC5FEGUlEJiBFBmZRHdUukE1ix.rv2', 'D4/S1', '1540297600285.jpg'),
(8, '198766235999245001', 'Dr. Didit Purwanto, M.pd', 'Logandeng', '0000-00-00', 'L', 'Islam', 'Guru Olahraga', 'Kepil, Logandeng, Playen, Gunungkidul, RT04/RW11', 'III A', '089765432886', 'Honorer', '$2y$10$7IqM60B4t.Jy/W7q11CPH.CdjEq8L0Q9ESAE7VLWeMQ5eDfz8mepq', 'S3', '1540394162994.jpeg'),
(9, '198766235112889001', 'Sidik Amanah, M.kom', 'Bandung, Jawa Barat', '0000-00-00', 'L', 'Islam', 'Wakil Kepala Sekolah', 'Selang II, Wonosari, Gunungkidul, Yogyakarta, RT10/RW18', 'III B', '089678223009', 'PNS', '$2y$10$/vd9QRAmu43gahSRZJxp2euhBypwahZYYW5say5QwXtXNkY4SlYpu', 'S2', '1540534175394.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_kelas`
--

CREATE TABLE `tb_kelas` (
  `id_kelas` int(11) NOT NULL,
  `kd_kelas` varchar(50) NOT NULL,
  `kelas` char(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_kelas`
--

INSERT INTO `tb_kelas` (`id_kelas`, `kd_kelas`, `kelas`) VALUES
(20, 'H9xX1E9nJSSpu81kMg', 'III'),
(21, 'o5E2HmSEQg5YVm3lGx', 'IV'),
(22, 'EFmNYKfo2wLGgrfsyR', 'V'),
(23, '2NiKWx9OcpWEAQVRNs', 'VI'),
(24, '6JN50s2tHZvKg6LeD2', 'I'),
(25, 'q9awIeE0WYilDLUoTd', 'II');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_mapel`
--

CREATE TABLE `tb_mapel` (
  `id_mapel` int(11) NOT NULL,
  `kd_mapel` varchar(50) NOT NULL,
  `nm_mapel` char(50) NOT NULL,
  `kkm_mapel` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_mapel`
--

INSERT INTO `tb_mapel` (`id_mapel`, `kd_mapel`, `nm_mapel`, `kkm_mapel`) VALUES
(2, '95WMIaZaByQm7qGe', 'Bahasa Indonesia', 75),
(3, 'AqeGEXJgSTWD2RX6', 'Bahasa Inggris', 75),
(4, 'blYfKGhEyBGkPCV0', 'Pendidikan Kewarganegaraan', 70),
(5, '9LhDbM9HJPzdWT67', 'Mulok 1', 70),
(6, 'bPDOTCR2qlAorQCX', 'Ilmu Pengetahuan Sosial', 72),
(9, 'gojgSPuCfbqCuWJL', 'Pendidikan Agama', 72),
(11, 'lrJbBmomWtvXmlOK', 'Bahasa Jawa', 72),
(13, 'exRRVQr0KYok7ExJ', 'Matematika', 75),
(16, 'IfqQxD7i6R8eqs2b', 'Penjasorkes', 72),
(23, 'nQPwGufxwo2SZWfG', 'Karawitan', 70),
(25, 'PhfWXZPotuDFj23b', 'Drumb Marcing Band', 72),
(27, 'QRUYlcTk0tqD45js', 'SBK', 70),
(28, 'fGy4iObG9VCNW0qo', 'Mulok 2', 72),
(29, '24rrjY1G0wrPD4yq', 'TIK II', 75),
(30, '5cIQlBuD8TAc12qi', 'Mulok III', 78),
(31, 'sX7B3YSagS2i36u8', 'MULOK IV', 76),
(33, 'bVVflqY0lbBiPZsp', 'Ilmu Pengetahuan Alam II', 78),
(34, 'KpamBrLLdsVrC0YX', 'Ilmu Pengetahuan Alam II', 78),
(36, 'T6lTKJw8vKJCEAIF', 'Ilmu Pengetahuan Alam II', 78),
(38, 'W74pMQZdW7XAUraq', 'TIK WEB', 75),
(39, 'PNhLDIUtqlHqUc2os6', 'Bahasa Inggris III', 75),
(40, 'tIK16G8mqibhpNRzST', 'Bahasa Indo', 90);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_master`
--

CREATE TABLE `tb_master` (
  `id_master` int(11) NOT NULL,
  `kd_master` varchar(50) NOT NULL,
  `thn_ajaran` varchar(25) NOT NULL,
  `status` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_master`
--

INSERT INTO `tb_master` (`id_master`, `kd_master`, `thn_ajaran`, `status`) VALUES
(1, 'K0jms2HBWC8T5QrD3u', '2016/2017', 0),
(3, 'J84VL-fjuyX6Ve-ITbsr', '2015/2016', 0),
(4, '5w9Da-24FK6lae-GHgA0', '2017/2018', 0),
(5, '1T1n7-KgDQTGCS-G7j5E', '2014/2015', 0),
(6, 'jgd3C-Pbk4f0pc-Y8AqO', '2013/2014', 0),
(7, 'rfLqD-ljupvGIq-qrJY6', '2012/2013', 0),
(8, 'yfIRo-tnUA85Yi-yudrz', '2011/2012', 0),
(9, '5TI5E-hv0EO1RS-Y5JC3', '2010/2011', 0),
(10, 'yWglS-EHQWoL6I-YA8zQ', '2009/2010', 0),
(11, 'YuQby-tMXpFKTC-otKer', '2008/2009', 0),
(12, 's16WH-kBsZtaIc-Wd0Xz', '2007/2008', 0),
(13, 'jZ23g-jiAOdDM5-HLM3K', '2018/2019', 1),
(14, 'KuiaQ-NZQrVpvc-0SAkW', '2006/2005', 0),
(15, 'qCb16-UV6frWOh-DLw9F', '2005/2004', 0),
(16, '1Ql3D-rJYowptQ-nr355', '2004/2003', 0),
(17, 'u86f1-FdNMu8Tq-gekV4', '2003/2002', 0),
(18, 'oxTxR-wG4anflR-PL5ot', '2001/2002', 0),
(19, 'W7rc9-a0w8j3IX-9bY98', '2019/2020', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_nilai`
--

CREATE TABLE `tb_nilai` (
  `id_nilai` int(11) NOT NULL,
  `kd_nilai` varchar(255) NOT NULL,
  `id_siswa` int(11) NOT NULL,
  `id_mapel` int(11) NOT NULL,
  `id_kelas` int(11) NOT NULL,
  `id_master` int(11) NOT NULL,
  `id_wali_kelas` int(11) NOT NULL,
  `semester` float NOT NULL,
  `n_tugas` float NOT NULL,
  `n_uh` float NOT NULL,
  `n_uts` float NOT NULL,
  `n_uas` float NOT NULL,
  `t_nilai` float NOT NULL,
  `n_akhir` float NOT NULL,
  `ket` enum('Tuntas','Tidak Tuntas') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pengampu`
--

CREATE TABLE `tb_pengampu` (
  `id_pengampu` int(11) NOT NULL,
  `kd_pengampu` varchar(100) NOT NULL,
  `id_master` int(11) NOT NULL,
  `id_mapel` int(11) NOT NULL,
  `id_guru` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_pengampu`
--

INSERT INTO `tb_pengampu` (`id_pengampu`, `kd_pengampu`, `id_master`, `id_mapel`, `id_guru`) VALUES
(3, 'M59BoPFqiHTsfkRq1i', 13, 2, 3),
(4, 'nwNgST8SI6kLWnr9uI', 13, 13, 4),
(6, '1cEq0MJBWNPKQp32Vy', 13, 4, 6),
(8, 'sepPU99R41B7kq4bW9', 13, 3, 5),
(11, 'HNlOGu2JPOZcF2p497', 13, 5, 7),
(12, '2W2IRkaieDQxClfakD', 13, 5, 6),
(13, 'qd9wnxjKYf6q0nLJuG', 13, 38, 5),
(14, 'XIBplSjBDbPM63qzdI', 13, 4, 4),
(15, 'Sf4dU9TyccNe3j9urD', 19, 34, 7),
(16, 'JHnZ9aIkZhmN6Ck8Bq', 19, 5, 8),
(17, 'fNt4Uc3dr5AvfiExP2', 19, 3, 6),
(18, 'gfI4RaRCsAXprzwaLi', 19, 31, 8);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_siswa`
--

CREATE TABLE `tb_siswa` (
  `id_siswa` int(11) NOT NULL,
  `nis` varchar(25) NOT NULL,
  `nm_siswa` char(50) NOT NULL,
  `tp_lahir` varchar(50) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `agama` varchar(35) NOT NULL,
  `jk` enum('P','L') NOT NULL,
  `id_master` int(10) NOT NULL,
  `alamat_siswa` text NOT NULL,
  `tahun_ijazah` year(4) DEFAULT NULL,
  `nomer_ijazah` varchar(50) DEFAULT NULL,
  `asal_sekolah` varchar(50) DEFAULT NULL,
  `alamat_asal_sekolah` text NOT NULL,
  `nama_ayah` char(50) NOT NULL,
  `nama_ibu` char(50) NOT NULL,
  `alamat_orangtua` text NOT NULL,
  `pk_ayah` varchar(100) NOT NULL,
  `pk_ibu` varchar(100) NOT NULL,
  `no_telp_ortu` varchar(20) NOT NULL,
  `nama_wali` varchar(20) DEFAULT NULL,
  `alamat_wali` text,
  `pk_wali` varchar(100) DEFAULT NULL,
  `no_telp_wali` varchar(20) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `foto_siswa` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_siswa`
--

INSERT INTO `tb_siswa` (`id_siswa`, `nis`, `nm_siswa`, `tp_lahir`, `tgl_lahir`, `agama`, `jk`, `id_master`, `alamat_siswa`, `tahun_ijazah`, `nomer_ijazah`, `asal_sekolah`, `alamat_asal_sekolah`, `nama_ayah`, `nama_ibu`, `alamat_orangtua`, `pk_ayah`, `pk_ibu`, `no_telp_ortu`, `nama_wali`, `alamat_wali`, `pk_wali`, `no_telp_wali`, `password`, `foto_siswa`) VALUES
(2, '1902', 'Andriani  Sasmita', 'Bandung, Jawa Barat', '2005-06-21', 'Kristen', 'P', 13, 'Gandu III, Wonosari, Gunungkidul', 2006, '', 'TK Kuncup Melati', 'Watudalang, Bendungan, Karangmojo', 'Suparjo', 'Suparni', 'Gandu III, Wonosari, Gunungkidul', 'Wiraswasta', 'Ibu Rumah Tangga', '088990765112', '', '', '', '', '$2y$10$/hqTi1RScR.QTm6Ks1lbI.qqFSfYQnTUwY0baVcoOF4ZG/INyWsLm', '1540696205233.jpg'),
(8, '1901', 'Rudy Baskoro Editan', 'Bandung, Jawa Barat', '2005-10-25', 'Islam', 'L', 13, 'Selang Bendungan, Bendungan, Karangmojo', 2008, 'AB/1290/ZX/1334', 'TK Bina Putra Wonosari', 'Wonosari', 'Suparman', 'Supini', 'Selang Bendungan, Bendungan, Karangmojo', 'Swasta', 'Swasta', '087838556112', '', '', '', '', '$2y$10$OMvX1fA4xa1YvVJEn8WmKuO/VOKLv4KUF4nJAz3/226fKUyrYkPE2', '1540824984667.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_wali_kelas`
--

CREATE TABLE `tb_wali_kelas` (
  `id_wali_kelas` int(11) NOT NULL,
  `id_kelas` int(11) NOT NULL,
  `id_guru` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `thn_ajaran`
--

CREATE TABLE `thn_ajaran` (
  `id_arsip_sekolah` int(11) NOT NULL,
  `id_master` int(11) NOT NULL,
  `id_kelas` int(11) NOT NULL,
  `id_siswa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `set_tgl_pendaftaran`
--
ALTER TABLE `set_tgl_pendaftaran`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tb_admin`
--
ALTER TABLE `tb_admin`
  ADD PRIMARY KEY (`kd_admin`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indeks untuk tabel `tb_alumni`
--
ALTER TABLE `tb_alumni`
  ADD PRIMARY KEY (`kd_alumni`);

--
-- Indeks untuk tabel `tb_arsip`
--
ALTER TABLE `tb_arsip`
  ADD PRIMARY KEY (`kd_arsip`);

--
-- Indeks untuk tabel `tb_bagi_kelas`
--
ALTER TABLE `tb_bagi_kelas`
  ADD PRIMARY KEY (`id_bagi_kelas`);

--
-- Indeks untuk tabel `tb_daftar`
--
ALTER TABLE `tb_daftar`
  ADD PRIMARY KEY (`kd_daftar`);

--
-- Indeks untuk tabel `tb_guru`
--
ALTER TABLE `tb_guru`
  ADD PRIMARY KEY (`id_guru`),
  ADD UNIQUE KEY `nip` (`nip`);

--
-- Indeks untuk tabel `tb_kelas`
--
ALTER TABLE `tb_kelas`
  ADD PRIMARY KEY (`id_kelas`);

--
-- Indeks untuk tabel `tb_mapel`
--
ALTER TABLE `tb_mapel`
  ADD PRIMARY KEY (`id_mapel`);

--
-- Indeks untuk tabel `tb_master`
--
ALTER TABLE `tb_master`
  ADD PRIMARY KEY (`id_master`);

--
-- Indeks untuk tabel `tb_nilai`
--
ALTER TABLE `tb_nilai`
  ADD PRIMARY KEY (`id_nilai`);

--
-- Indeks untuk tabel `tb_pengampu`
--
ALTER TABLE `tb_pengampu`
  ADD PRIMARY KEY (`id_pengampu`);

--
-- Indeks untuk tabel `tb_siswa`
--
ALTER TABLE `tb_siswa`
  ADD PRIMARY KEY (`id_siswa`),
  ADD UNIQUE KEY `nis` (`nis`);

--
-- Indeks untuk tabel `tb_wali_kelas`
--
ALTER TABLE `tb_wali_kelas`
  ADD PRIMARY KEY (`id_wali_kelas`);

--
-- Indeks untuk tabel `thn_ajaran`
--
ALTER TABLE `thn_ajaran`
  ADD PRIMARY KEY (`id_arsip_sekolah`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `set_tgl_pendaftaran`
--
ALTER TABLE `set_tgl_pendaftaran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `tb_bagi_kelas`
--
ALTER TABLE `tb_bagi_kelas`
  MODIFY `id_bagi_kelas` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tb_guru`
--
ALTER TABLE `tb_guru`
  MODIFY `id_guru` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `tb_kelas`
--
ALTER TABLE `tb_kelas`
  MODIFY `id_kelas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT untuk tabel `tb_mapel`
--
ALTER TABLE `tb_mapel`
  MODIFY `id_mapel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT untuk tabel `tb_master`
--
ALTER TABLE `tb_master`
  MODIFY `id_master` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT untuk tabel `tb_nilai`
--
ALTER TABLE `tb_nilai`
  MODIFY `id_nilai` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tb_pengampu`
--
ALTER TABLE `tb_pengampu`
  MODIFY `id_pengampu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT untuk tabel `tb_siswa`
--
ALTER TABLE `tb_siswa`
  MODIFY `id_siswa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `tb_wali_kelas`
--
ALTER TABLE `tb_wali_kelas`
  MODIFY `id_wali_kelas` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `thn_ajaran`
--
ALTER TABLE `thn_ajaran`
  MODIFY `id_arsip_sekolah` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
