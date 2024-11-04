-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 14, 2024 at 01:47 PM
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
-- Database: `cafe`
--

-- --------------------------------------------------------

--
-- Table structure for table `ban`
--

CREATE TABLE `ban` (
  `MaBan` int(11) NOT NULL,
  `Ten` varchar(50) DEFAULT NULL,
  `TrangThai` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ban`
--

INSERT INTO `ban` (`MaBan`, `Ten`, `TrangThai`) VALUES
(1, 'Bàn 1', 'Trống'),
(2, 'Bàn 2', 'Trống'),
(3, 'Bàn 3', 'Trống'),
(4, 'Bàn 4', 'Trống'),
(5, 'Bàn 5', 'Trống');

-- --------------------------------------------------------

--
-- Table structure for table `chitietdonhang`
--

CREATE TABLE `chitietdonhang` (
  `MaChiTietDonHang` int(11) NOT NULL,
  `MaSanPham` int(11) DEFAULT NULL,
  `SoLuong` int(11) DEFAULT NULL,
  `TongTienCongLai` decimal(18,2) DEFAULT NULL,
  `MaDonHang` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `chitietdonhang`
--

INSERT INTO `chitietdonhang` (`MaChiTietDonHang`, `MaSanPham`, `SoLuong`, `TongTienCongLai`, `MaDonHang`) VALUES
(293, 11, 1, 30000.00, 198),
(294, 11, 1, 30000.00, 200),
(295, 12, 1, 500000.00, 200),
(296, 11, 1, 30000.00, 200),
(297, 11, 3, 90000.00, 201),
(298, 12, 1, 500000.00, 201),
(299, 12, 2, 1000000.00, 202),
(301, 13, 1, 10000.00, 202),
(302, 13, 3, 30000.00, 203),
(309, 15, 1, 50000.00, 204),
(314, 16, 1, 15000.00, 205),
(325, 19, 1, 30000.00, 207),
(326, 19, 3, 90000.00, 208);

-- --------------------------------------------------------

--
-- Table structure for table `datcho`
--

CREATE TABLE `datcho` (
  `MaDatCho` int(11) NOT NULL,
  `MaKhachHang` int(11) DEFAULT NULL,
  `MaBan` int(11) DEFAULT NULL,
  `ThoiGianDat` datetime DEFAULT NULL,
  `SoLuongKhach` int(11) DEFAULT NULL,
  `GhiChu` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `datcho`
--

INSERT INTO `datcho` (`MaDatCho`, `MaKhachHang`, `MaBan`, `ThoiGianDat`, `SoLuongKhach`, `GhiChu`) VALUES
(28, 111, 1, '2024-06-12 10:00:00', 6, 'Tâsss'),
(29, 112, 2, '2024-06-12 20:48:12', 1, ''),
(30, 113, 2, '2024-06-14 11:52:09', 1, ''),
(31, 114, 3, '2024-06-14 13:13:32', 1, ''),
(32, 115, 5, '2024-06-14 00:00:00', 5, 'Dat ban'),
(33, 116, 4, '2024-06-14 13:24:29', 1, ''),
(34, 117, 4, '2024-06-14 05:00:00', 3, 'Dat ban cafe'),
(35, 110, 5, '2024-06-14 04:00:00', 3, 'Dat ban hom nay'),
(36, 120, 4, '2024-06-15 05:00:00', 4, 'Khach dat ban'),
(37, 122, 4, '2024-06-14 12:00:00', 3, 'Khach dat ban'),
(38, 110, 4, '2024-06-15 08:00:00', 3, 'Khach dat ban'),
(39, 123, 1, '2024-06-14 07:00:00', 2, 'Khong co'),
(40, 124, 4, '2024-06-14 07:00:00', 3, 'Khach dat ban'),
(41, 124, 1, '2024-06-14 05:00:00', 5, 'Test'),
(42, 125, 5, '2024-06-14 05:00:00', 3, 'Ok'),
(43, 126, 3, '2024-06-14 07:00:00', 5, 'Khach dat ban '),
(44, 127, 1, '2024-06-15 14:00:00', 3, 'Dat ban ngay mai'),
(45, 128, 2, '2024-06-15 14:00:00', 2, 'Khach dat ban ngay mai'),
(46, 129, 2, '2024-06-15 07:00:00', 3, 'Khach moi dat ban'),
(47, 130, 1, '2024-06-16 14:00:00', 2, 'Khac moi dat ban');

-- --------------------------------------------------------

--
-- Table structure for table `donhang`
--

CREATE TABLE `donhang` (
  `MaDonHang` int(11) NOT NULL,
  `MaKhachHang` int(11) DEFAULT NULL,
  `MaNhanVien` int(11) DEFAULT NULL,
  `NgayDatHang` date DEFAULT NULL,
  `TongTien` decimal(18,2) DEFAULT NULL,
  `PhuongThucThanhToan` varchar(255) DEFAULT NULL,
  `MuaMangVe` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `donhang`
--

INSERT INTO `donhang` (`MaDonHang`, `MaKhachHang`, `MaNhanVien`, `NgayDatHang`, `TongTien`, `PhuongThucThanhToan`, `MuaMangVe`) VALUES
(198, 107, 1, '2024-06-12', 30000.00, 'Tiền mặt', 0),
(200, 109, 1, '2024-06-12', 30000.00, 'Tiền mặt', 0),
(201, 110, 1, '2024-06-12', 90000.00, 'Tiền mặt', 1),
(202, 112, 1, '2024-06-12', 1000000.00, 'Tiền mặt', 0),
(203, 113, 1, '2024-06-14', 30000.00, 'Tiền mặt', 1),
(204, 114, 1, '2024-06-14', 40000.00, 'Tiền mặt', 1),
(205, 116, 1, '2024-06-14', 150000.00, 'Tiền mặt', 1),
(206, 118, 1, '2024-06-14', 45000.00, 'Tiền mặt', 1),
(207, 119, 1, '2024-06-14', 300000.00, 'Tiền mặt', 1),
(208, 121, 1, '2024-06-14', 90000.00, 'Tiền mặt', 1);

-- --------------------------------------------------------

--
-- Table structure for table `giaodich`
--

CREATE TABLE `giaodich` (
  `MaGiaoDich` int(11) NOT NULL,
  `ThoiGianGiaoDich` datetime DEFAULT NULL,
  `TongTien` decimal(10,2) DEFAULT NULL,
  `PhuongThucThanhToan` varchar(50) DEFAULT NULL,
  `MaNhanVien` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `giaodich`
--

INSERT INTO `giaodich` (`MaGiaoDich`, `ThoiGianGiaoDich`, `TongTien`, `PhuongThucThanhToan`, `MaNhanVien`) VALUES
(59, '2024-06-10 19:20:09', 30000.00, 'Tiền mặt', 1),
(60, '2024-06-11 20:29:10', 30000.00, 'Tiền mặt', 1),
(61, '2024-06-12 20:45:19', 90000.00, 'Tiền mặt', 1),
(62, '2024-06-13 20:48:16', 1000000.00, 'Tiền mặt', 1),
(63, '2024-06-14 11:52:12', 30000.00, 'Tiền mặt', 1),
(64, '2024-06-14 13:13:34', 40000.00, 'Tiền mặt', 1),
(65, '2024-06-14 13:24:31', 150000.00, 'Tiền mặt', 1),
(66, '2024-06-14 13:36:54', 45000.00, 'Tiền mặt', 1),
(67, '2024-06-14 13:50:34', 300000.00, 'Tiền mặt', 1),
(68, '2024-06-14 14:59:29', 90000.00, 'Tiền mặt', 1);

-- --------------------------------------------------------

--
-- Table structure for table `khachhang`
--

CREATE TABLE `khachhang` (
  `MaKhachHang` int(11) NOT NULL,
  `Ten` varchar(100) DEFAULT NULL,
  `DienThoai` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `khachhang`
--

INSERT INTO `khachhang` (`MaKhachHang`, `Ten`, `DienThoai`) VALUES
(107, 'Khách vãng lai', '0000000000'),
(108, 'Khách vãng lai', '0000000000'),
(109, 'Khách vãng lai', '0000000000'),
(110, 'Thái', '123456789'),
(111, 'Thao', '0987654321'),
(112, 'Khách vãng lai', '0000000000'),
(113, 'Khách vãng lai', '0000000000'),
(114, 'Khách vãng lai', '0000000000'),
(115, 'Tri', '0123456789'),
(116, 'Khách vãng lai', '0000000000'),
(117, 'Nhan', '0121218768'),
(118, 'Khách vãng lai', '0000000000'),
(119, 'Khách vãng lai', '0000000000'),
(120, 'Le Trong Tan', '0123456788'),
(121, 'Khách vãng lai', '0000000000'),
(122, 'Tri Van', '123456782'),
(123, 'Le Anh', '01234321'),
(124, 'KhachHangMoi', '01234567899'),
(125, 'Teo', '01234567892'),
(126, 'Van Tri', '0123456782'),
(127, 'Test Dat Ban', '012345678967'),
(128, 'Test Dat Ban 2', '01234567898'),
(129, 'TestKHM', '01234567893'),
(130, 'KhachDatBanMoi', '01234567896');

-- --------------------------------------------------------

--
-- Table structure for table `khohang`
--

CREATE TABLE `khohang` (
  `MaKhoHang` int(11) NOT NULL,
  `MaSanPham` int(11) DEFAULT NULL,
  `SoLuong` int(11) DEFAULT NULL,
  `NgayNhapHang` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `khohang`
--

INSERT INTO `khohang` (`MaKhoHang`, `MaSanPham`, `SoLuong`, `NgayNhapHang`) VALUES
(5, 10, 50, '2024-06-12'),
(6, 11, 6, '2024-06-12'),
(7, 12, 10, '2024-06-12'),
(8, 13, 10, '2024-06-14'),
(9, 14, 20, '2024-06-14'),
(10, 15, 47, '2024-06-14'),
(11, 16, 47, '2024-06-14'),
(12, 17, 17, '2024-06-14'),
(13, 18, 50, '2024-06-14'),
(14, 19, 7, '2024-06-14');

-- --------------------------------------------------------

--
-- Table structure for table `nhanvien`
--

CREATE TABLE `nhanvien` (
  `MaNhanVien` int(11) NOT NULL,
  `Ten` varchar(100) DEFAULT NULL,
  `DienThoai` varchar(20) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `ChucVu` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `nhanvien`
--

INSERT INTO `nhanvien` (`MaNhanVien`, `Ten`, `DienThoai`, `Email`, `ChucVu`) VALUES
(1, 'Quản lý', '0987654321', 'quanly@.com', 'Quản lý'),
(2, 'Nhân viên', '0123456789', 'nhanvien@.com', 'Nhân viên'),
(3, 'Nhan vien moi', '01234567898', 'nvm@gmail.com', 'Nhân viên');

-- --------------------------------------------------------

--
-- Table structure for table `sanpham`
--

CREATE TABLE `sanpham` (
  `MaSanPham` int(11) NOT NULL,
  `Ten` varchar(100) DEFAULT NULL,
  `Gia` decimal(18,2) DEFAULT NULL,
  `LinkSP` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sanpham`
--

INSERT INTO `sanpham` (`MaSanPham`, `Ten`, `Gia`, `LinkSP`) VALUES
(10, 'Bánh Mì', 15000.00, 'D:\\CongViecHocTap\\TailieuCNTT\\MonHoc\\CongNgheJava\\DoAnJava\\DoAnJavaBanDoAn\\DoAnJava_Nhom12\\JavaPMQLCafe\\frmQLCafe\\src\\icon\\BanhMi.jpg'),
(11, 'Hamburger', 30000.00, 'D:\\CongViecHocTap\\TailieuCNTT\\MonHoc\\CongNgheJava\\DoAnJava\\DoAnJavaBanDoAn\\DoAnJava_Nhom12\\JavaPMQLCafe\\frmQLCafe\\src\\icon\\burger_.jpg'),
(12, 'Chicken', 500000.00, 'D:\\CongViecHocTap\\TailieuCNTT\\MonHoc\\CongNgheJava\\DoAnJava\\DoAnJavaBanDoAn\\DoAnJava_Nhom12\\JavaPMQLCafe\\frmQLCafe\\src\\icon\\chikenfri_.jpg'),
(13, 'Trà Đá', 10000.00, 'D:\\CongViecHocTap\\TailieuCNTT\\MonHoc\\CongNgheJava\\DoAnJava\\DoAnJavaBanDoAn\\DoAnJava_Nhom12\\JavaPMQLCafe\\frmQLCafe\\src\\icon\\icetea_.jpg'),
(14, 'Cà phê', 20000.00, 'D:\\CongViecHocTap\\TailieuCNTT\\MonHoc\\CongNgheJava\\DoAnJava\\DoAnJavaBanDoAn\\DoAnJava_Nhom12\\JavaPMQLCafe\\frmQLCafe\\src\\icon\\coldcof_.jpg'),
(15, 'Cabona', 50000.00, 'D:\\CongViecHocTap\\TailieuCNTT\\MonHoc\\CongNgheJava\\DoAnJava\\DoAnJavaBanDoAn\\DoAnJava_Nhom12\\JavaPMQLCafe\\frmQLCafe\\src\\icon\\cabona_.jpg'),
(16, 'Cocacola', 15000.00, 'D:\\CongViecHocTap\\TailieuCNTT\\MonHoc\\CongNgheJava\\DoAnJava\\DoAnJavaBanDoAn\\DoAnJava_Nhom12\\JavaPMQLCafe\\frmQLCafe\\src\\icon\\coke_.jpg'),
(17, 'Steak Bur', 100000.00, 'D:\\CongViecHocTap\\TailieuCNTT\\MonHoc\\CongNgheJava\\DoAnJava\\DoAnJavaBanDoAn\\DoAnJava_Nhom12\\JavaPMQLCafe\\frmQLCafe\\src\\icon\\bursteak_.jpg'),
(18, 'Spaghetti', 40000.00, 'D:\\CongViecHocTap\\TailieuCNTT\\MonHoc\\CongNgheJava\\DoAnJava\\DoAnJavaBanDoAn\\DoAnJava_Nhom12\\JavaPMQLCafe\\frmQLCafe\\src\\icon\\spaget__.jpg'),
(19, 'Trà Sữa Trân Châu ', 30000.00, 'D:\\CongViecHocTap\\TailieuCNTT\\MonHoc\\CongNgheJava\\DoAnJava\\DoAnJavaBanDoAn\\DoAnJava_Nhom12\\JavaPMQLCafe\\frmQLCafe\\src\\icon\\TraSua.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `taikhoan`
--

CREATE TABLE `taikhoan` (
  `MaTaiKhoan` int(11) NOT NULL,
  `TenDangNhap` varchar(50) DEFAULT NULL,
  `MatKhau` varchar(50) DEFAULT NULL,
  `LoaiTaiKhoan` varchar(20) DEFAULT NULL,
  `MaNhanVien` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `taikhoan`
--

INSERT INTO `taikhoan` (`MaTaiKhoan`, `TenDangNhap`, `MatKhau`, `LoaiTaiKhoan`, `MaNhanVien`) VALUES
(1, 'quanly', '123456', 'Quản lý', 1),
(2, 'nhanvien', '123456', 'Nhân viên', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ban`
--
ALTER TABLE `ban`
  ADD PRIMARY KEY (`MaBan`);

--
-- Indexes for table `chitietdonhang`
--
ALTER TABLE `chitietdonhang`
  ADD PRIMARY KEY (`MaChiTietDonHang`),
  ADD KEY `MaSanPham` (`MaSanPham`),
  ADD KEY `fk_chitietdonhang_donhang` (`MaDonHang`);

--
-- Indexes for table `datcho`
--
ALTER TABLE `datcho`
  ADD PRIMARY KEY (`MaDatCho`),
  ADD KEY `MaKhachHang` (`MaKhachHang`),
  ADD KEY `MaBan` (`MaBan`);

--
-- Indexes for table `donhang`
--
ALTER TABLE `donhang`
  ADD PRIMARY KEY (`MaDonHang`),
  ADD KEY `MaKhachHang` (`MaKhachHang`),
  ADD KEY `MaNhanVien` (`MaNhanVien`);

--
-- Indexes for table `giaodich`
--
ALTER TABLE `giaodich`
  ADD PRIMARY KEY (`MaGiaoDich`),
  ADD KEY `MaNhanVien` (`MaNhanVien`);

--
-- Indexes for table `khachhang`
--
ALTER TABLE `khachhang`
  ADD PRIMARY KEY (`MaKhachHang`);

--
-- Indexes for table `khohang`
--
ALTER TABLE `khohang`
  ADD PRIMARY KEY (`MaKhoHang`),
  ADD KEY `MaSanPham` (`MaSanPham`);

--
-- Indexes for table `nhanvien`
--
ALTER TABLE `nhanvien`
  ADD PRIMARY KEY (`MaNhanVien`);

--
-- Indexes for table `sanpham`
--
ALTER TABLE `sanpham`
  ADD PRIMARY KEY (`MaSanPham`);

--
-- Indexes for table `taikhoan`
--
ALTER TABLE `taikhoan`
  ADD PRIMARY KEY (`MaTaiKhoan`),
  ADD UNIQUE KEY `TenDangNhap` (`TenDangNhap`),
  ADD KEY `MaNhanVien` (`MaNhanVien`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ban`
--
ALTER TABLE `ban`
  MODIFY `MaBan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `chitietdonhang`
--
ALTER TABLE `chitietdonhang`
  MODIFY `MaChiTietDonHang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=327;

--
-- AUTO_INCREMENT for table `datcho`
--
ALTER TABLE `datcho`
  MODIFY `MaDatCho` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `donhang`
--
ALTER TABLE `donhang`
  MODIFY `MaDonHang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=209;

--
-- AUTO_INCREMENT for table `giaodich`
--
ALTER TABLE `giaodich`
  MODIFY `MaGiaoDich` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `khachhang`
--
ALTER TABLE `khachhang`
  MODIFY `MaKhachHang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=131;

--
-- AUTO_INCREMENT for table `khohang`
--
ALTER TABLE `khohang`
  MODIFY `MaKhoHang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `nhanvien`
--
ALTER TABLE `nhanvien`
  MODIFY `MaNhanVien` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sanpham`
--
ALTER TABLE `sanpham`
  MODIFY `MaSanPham` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `taikhoan`
--
ALTER TABLE `taikhoan`
  MODIFY `MaTaiKhoan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `chitietdonhang`
--
ALTER TABLE `chitietdonhang`
  ADD CONSTRAINT `chitietdonhang_ibfk_2` FOREIGN KEY (`MaSanPham`) REFERENCES `sanpham` (`MaSanPham`),
  ADD CONSTRAINT `fk_chitietdonhang_donhang` FOREIGN KEY (`MaDonHang`) REFERENCES `donhang` (`MaDonHang`),
  ADD CONSTRAINT `fk_chitietdonhang_sanpham` FOREIGN KEY (`MaSanPham`) REFERENCES `sanpham` (`MaSanPham`),
  ADD CONSTRAINT `fk_donhang` FOREIGN KEY (`MaDonHang`) REFERENCES `donhang` (`MaDonHang`);

--
-- Constraints for table `datcho`
--
ALTER TABLE `datcho`
  ADD CONSTRAINT `datcho_ibfk_1` FOREIGN KEY (`MaKhachHang`) REFERENCES `khachhang` (`MaKhachHang`),
  ADD CONSTRAINT `datcho_ibfk_2` FOREIGN KEY (`MaBan`) REFERENCES `ban` (`MaBan`),
  ADD CONSTRAINT `fk_datcho_ban` FOREIGN KEY (`MaBan`) REFERENCES `ban` (`MaBan`),
  ADD CONSTRAINT `fk_datcho_khachhang` FOREIGN KEY (`MaKhachHang`) REFERENCES `khachhang` (`MaKhachHang`);

--
-- Constraints for table `donhang`
--
ALTER TABLE `donhang`
  ADD CONSTRAINT `donhang_ibfk_1` FOREIGN KEY (`MaKhachHang`) REFERENCES `khachhang` (`MaKhachHang`),
  ADD CONSTRAINT `donhang_ibfk_2` FOREIGN KEY (`MaNhanVien`) REFERENCES `nhanvien` (`MaNhanVien`),
  ADD CONSTRAINT `fk_donhang_khachhang` FOREIGN KEY (`MaKhachHang`) REFERENCES `khachhang` (`MaKhachHang`),
  ADD CONSTRAINT `fk_donhang_nhanvien` FOREIGN KEY (`MaNhanVien`) REFERENCES `nhanvien` (`MaNhanVien`);

--
-- Constraints for table `giaodich`
--
ALTER TABLE `giaodich`
  ADD CONSTRAINT `fk_giaodich_nhanvien` FOREIGN KEY (`MaNhanVien`) REFERENCES `nhanvien` (`MaNhanVien`),
  ADD CONSTRAINT `giaodich_ibfk_1` FOREIGN KEY (`MaNhanVien`) REFERENCES `nhanvien` (`MaNhanVien`);

--
-- Constraints for table `khohang`
--
ALTER TABLE `khohang`
  ADD CONSTRAINT `fk_khohang_sanpham` FOREIGN KEY (`MaSanPham`) REFERENCES `sanpham` (`MaSanPham`),
  ADD CONSTRAINT `khohang_ibfk_1` FOREIGN KEY (`MaSanPham`) REFERENCES `sanpham` (`MaSanPham`);

--
-- Constraints for table `taikhoan`
--
ALTER TABLE `taikhoan`
  ADD CONSTRAINT `fk_taikhoan_nhanvien` FOREIGN KEY (`MaNhanVien`) REFERENCES `nhanvien` (`MaNhanVien`),
  ADD CONSTRAINT `taikhoan_ibfk_1` FOREIGN KEY (`MaNhanVien`) REFERENCES `nhanvien` (`MaNhanVien`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
