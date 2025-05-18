-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Waktu pembuatan: 18 Bulan Mei 2025 pada 07.49
-- Versi server: 8.0.30
-- Versi PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `admin`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `alat_laboratorium`
--

CREATE TABLE `alat_laboratorium` (
  `id_alat` int NOT NULL,
  `nama_alat` varchar(100) NOT NULL,
  `kode_alat` varchar(50) NOT NULL,
  `kondisi` enum('Baik','Rusak','Dalam Perbaikan') DEFAULT 'Baik',
  `lokasi` varchar(100) DEFAULT NULL,
  `status` enum('Tersedia','Dipinjam','Tidak Tersedia') DEFAULT 'Tersedia',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `alat_laboratorium`
--

INSERT INTO `alat_laboratorium` (`id_alat`, `nama_alat`, `kode_alat`, `kondisi`, `lokasi`, `status`, `created_at`) VALUES
(11, 'iqbal ganteng', 'BE123LA', 'Rusak', 'Papua Selatan', 'Tersedia', '2025-05-03 13:30:27'),
(15, 'mikroskop', '001', 'Baik', 'tarbiyah', 'Tersedia', '2025-05-11 07:30:18'),
(16, 'cawan', '002', 'Dalam Perbaikan', 'Lab tarbiyah', 'Tersedia', '2025-05-13 12:31:30');

-- --------------------------------------------------------

--
-- Struktur dari tabel `durasi_peminjaman`
--

CREATE TABLE `durasi_peminjaman` (
  `id_durasi` int NOT NULL,
  `durasi_hari` int NOT NULL,
  `tanggal_diubah` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `diubah_oleh` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `durasi_peminjaman`
--

INSERT INTO `durasi_peminjaman` (`id_durasi`, `durasi_hari`, `tanggal_diubah`, `diubah_oleh`) VALUES
(1, 3, '2025-05-11 07:41:54', 'admin1');

-- --------------------------------------------------------

--
-- Struktur dari tabel `laporan_riwayat`
--

CREATE TABLE `laporan_riwayat` (
  `id_laporan` int NOT NULL,
  `tanggal` date NOT NULL,
  `rentang_waktu` varchar(255) NOT NULL,
  `format_laporan` enum('pdf','excel') NOT NULL,
  `file_path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `id_mahasiswa` int NOT NULL,
  `npm` varchar(20) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `PASSWORD` varchar(255) NOT NULL,
  `peran` enum('Admin','Laboran','Dosen','Mahasiswa') NOT NULL,
  `fakultas_departemen` varchar(100) NOT NULL,
  `status` enum('aktif','nonaktif') DEFAULT 'aktif',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `mahasiswa`
--

INSERT INTO `mahasiswa` (`id_mahasiswa`, `npm`, `nama`, `email`, `PASSWORD`, `peran`, `fakultas_departemen`, `status`, `created_at`) VALUES
(1, '2271020110', 'iqbal ganteng', '', '123', 'Mahasiswa', '', 'aktif', '2025-05-13 11:46:06'),
(2, '2271020110', 'iqbal pratama', 'iqbalpratama010304@gmail.com', '$2y$10$5F1EXUNhhfbk0dxAcCyODOF09Pbz24irvfUy.raLkq9vxO2Xp5cMW', 'Mahasiswa', 'Fakultas MIPA', 'aktif', '2025-05-13 12:00:54'),
(3, '2271020108', 'hanipurrahman', 'hanipurrahman@gmail.com', '$2y$10$59riatb/K3rD/xKINZruduGBfV.JmFxHquwhCThRBPQHJUKOw9ki.', 'Mahasiswa', 'Fakultas Kedokteran', 'aktif', '2025-05-13 12:34:40');

-- --------------------------------------------------------

--
-- Struktur dari tabel `peminjaman`
--

CREATE TABLE `peminjaman` (
  `id_pinjam` int NOT NULL,
  `id_mahasiswa` int NOT NULL,
  `id_alat` int NOT NULL,
  `tanggal_peminjaman` date NOT NULL,
  `tanggal_pengembalian` date DEFAULT NULL,
  `durasi_hari` int NOT NULL,
  `status` enum('pending','disetujui','ditolak') DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `peminjaman`
--

INSERT INTO `peminjaman` (`id_pinjam`, `id_mahasiswa`, `id_alat`, `tanggal_peminjaman`, `tanggal_pengembalian`, `durasi_hari`, `status`) VALUES
(8, 1, 11, '2025-05-01', '2025-05-05', 4, 'pending');

-- --------------------------------------------------------

--
-- Struktur dari tabel `riwayat_durasi`
--

CREATE TABLE `riwayat_durasi` (
  `id_riwayat` int NOT NULL,
  `tanggal_diubah` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `durasi_baru` int NOT NULL,
  `diubah_oleh` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `riwayat_durasi`
--

INSERT INTO `riwayat_durasi` (`id_riwayat`, `tanggal_diubah`, `durasi_baru`, `diubah_oleh`) VALUES
(1, '2025-05-11 07:41:59', 3, 'admin1'),
(2, '2025-05-11 07:42:04', 2, 'admin2');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id_user` int NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','user') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'admin'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id_user`, `username`, `password`, `role`) VALUES
(13, 'admin', 'admin123', 'admin'),
(14, 'admin', '12345678', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `alat_laboratorium`
--
ALTER TABLE `alat_laboratorium`
  ADD PRIMARY KEY (`id_alat`) USING BTREE,
  ADD UNIQUE KEY `kode_alat` (`kode_alat`);

--
-- Indeks untuk tabel `durasi_peminjaman`
--
ALTER TABLE `durasi_peminjaman`
  ADD PRIMARY KEY (`id_durasi`) USING BTREE;

--
-- Indeks untuk tabel `laporan_riwayat`
--
ALTER TABLE `laporan_riwayat`
  ADD PRIMARY KEY (`id_laporan`) USING BTREE;

--
-- Indeks untuk tabel `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`id_mahasiswa`) USING BTREE;

--
-- Indeks untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`id_pinjam`) USING BTREE,
  ADD KEY `id_mahasiswa` (`id_mahasiswa`),
  ADD KEY `id_alat` (`id_alat`);

--
-- Indeks untuk tabel `riwayat_durasi`
--
ALTER TABLE `riwayat_durasi`
  ADD PRIMARY KEY (`id_riwayat`) USING BTREE;

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `alat_laboratorium`
--
ALTER TABLE `alat_laboratorium`
  MODIFY `id_alat` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `durasi_peminjaman`
--
ALTER TABLE `durasi_peminjaman`
  MODIFY `id_durasi` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `laporan_riwayat`
--
ALTER TABLE `laporan_riwayat`
  MODIFY `id_laporan` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `mahasiswa`
--
ALTER TABLE `mahasiswa`
  MODIFY `id_mahasiswa` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  MODIFY `id_pinjam` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `riwayat_durasi`
--
ALTER TABLE `riwayat_durasi`
  MODIFY `id_riwayat` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD CONSTRAINT `peminjaman_ibfk_1` FOREIGN KEY (`id_mahasiswa`) REFERENCES `mahasiswa` (`id_mahasiswa`),
  ADD CONSTRAINT `peminjaman_ibfk_2` FOREIGN KEY (`id_alat`) REFERENCES `alat_laboratorium` (`id_alat`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
