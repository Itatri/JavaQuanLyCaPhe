-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th6 07, 2024 lúc 09:21 AM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `cafe`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ban`
--

CREATE TABLE `ban` (
  `MaBan` int(11) NOT NULL,
  `Ten` varchar(50) DEFAULT NULL,
  `TrangThai` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `ban`
--

INSERT INTO `ban` (`MaBan`, `Ten`, `TrangThai`) VALUES
(1, 'Bàn 1', 'Trống'),
(2, 'Bàn 2', 'Có người');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chitietdonhang`
--

CREATE TABLE `chitietdonhang` (
  `MaChiTietDonHang` int(11) NOT NULL,
  `MaSanPham` int(11) DEFAULT NULL,
  `SoLuong` int(11) DEFAULT NULL,
  `TongTienCongLai` decimal(18,2) DEFAULT NULL,
  `MaDonHang` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `chitietdonhang`
--

INSERT INTO `chitietdonhang` (`MaChiTietDonHang`, `MaSanPham`, `SoLuong`, `TongTienCongLai`, `MaDonHang`) VALUES
(95, 7, 1, 122220.00, 149),
(96, 7, 1, 122220.00, 149),
(97, 8, 1, 2222.00, 149),
(101, 7, 1, 122220.00, 150),
(102, 8, 1, 2222.00, 150),
(103, 2, 2, 222.00, 150),
(104, 7, 1, 122220.00, 150),
(105, 2, 2, 222.00, 150),
(107, 2, 2, 222.00, 151),
(108, 2, 1, 111.00, 151),
(109, 8, 1, 2222.00, 151),
(110, 1, 1, 50000.00, 151),
(111, 2, 1, 111.00, 152),
(112, 8, 1, 2222.00, 152),
(113, 1, 1, 50000.00, 152);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `datcho`
--

CREATE TABLE `datcho` (
  `MaDatCho` int(11) NOT NULL,
  `MaKhachHang` int(11) DEFAULT NULL,
  `MaBan` int(11) DEFAULT NULL,
  `ThoiGianDat` datetime DEFAULT NULL,
  `SoLuongKhach` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `datcho`
--

INSERT INTO `datcho` (`MaDatCho`, `MaKhachHang`, `MaBan`, `ThoiGianDat`, `SoLuongKhach`) VALUES
(1, 1, 1, '2024-05-20 08:00:00', 2),
(2, 2, 2, '2024-05-21 09:00:00', 4);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `donhang`
--

CREATE TABLE `donhang` (
  `MaDonHang` int(11) NOT NULL,
  `MaKhachHang` int(11) DEFAULT NULL,
  `MaNhanVien` int(11) DEFAULT NULL,
  `NgayDatHang` date DEFAULT NULL,
  `TongTien` decimal(18,2) DEFAULT NULL,
  `PhuongThucThanhToan` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `donhang`
--

INSERT INTO `donhang` (`MaDonHang`, `MaKhachHang`, `MaNhanVien`, `NgayDatHang`, `TongTien`, `PhuongThucThanhToan`) VALUES
(105, 4, 1, '2024-06-02', 111.00, NULL),
(106, 8, 1, '2024-06-02', 2222.00, NULL),
(107, 16, 1, '2024-06-02', 50000.00, NULL),
(108, 17, 1, '2024-06-02', 50000.00, NULL),
(109, 4, 1, '2024-06-02', 172220.00, NULL),
(110, 4, 1, '2024-06-02', 294440.00, NULL),
(111, 18, 1, '2024-06-02', 172331.00, NULL),
(112, 19, 1, '2024-06-02', 172331.00, NULL),
(113, 20, 1, '2024-06-02', 172331.00, NULL),
(114, 21, 1, '2024-06-02', 172331.00, NULL),
(115, 22, 1, '2024-06-02', 111.00, NULL),
(116, 23, 1, '2024-06-02', 222331.00, NULL),
(117, 23, 1, '2024-06-02', 222331.00, NULL),
(118, 24, 1, '2024-06-02', 322331.00, 'Tiền mặt'),
(119, 25, 1, '2024-06-02', 496773.00, 'Tiền mặt'),
(120, 4, 1, '2024-06-03', 0.00, 'Tiền mặt'),
(121, 26, 1, '2024-06-03', 424553.00, 'Tiền mặt'),
(122, 26, 1, '2024-06-03', 424553.00, 'Tiền mặt'),
(123, 4, 1, '2024-06-03', 526775.00, 'Tiền mặt'),
(124, 28, 1, '2024-06-03', 674553.00, 'Tiền mặt'),
(125, 31, 1, '2024-06-03', 674553.00, 'Tiền mặt'),
(141, 1, 1, '2024-06-04', 0.00, 'Tiền mặt'),
(142, 1, 1, '2024-06-04', 0.00, 'Tiền mặt'),
(143, 1, 1, '2024-06-04', 946773.00, 'Tiền mặt'),
(144, 34, 1, '2024-06-04', 0.00, 'Tiền mặt'),
(145, 35, 1, '2024-06-04', 974775.00, 'Tiền mặt'),
(146, 36, 1, '2024-06-05', 1348995.00, 'Tiền mặt'),
(147, 37, 1, '2024-06-05', 50111.00, 'Tiền mặt'),
(148, 38, 1, '2024-06-05', 50111.00, 'Tiền mặt'),
(149, 39, 1, '2024-06-05', 50111.00, 'Tiền mặt'),
(150, 40, 1, '2024-06-05', 124442.00, 'Tiền mặt'),
(151, 41, 1, '2024-06-06', 222.00, 'Tiền mặt'),
(152, 42, 1, '2024-06-06', 52333.00, 'Tiền mặt');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `giaodich`
--

CREATE TABLE `giaodich` (
  `MaGiaoDich` int(11) NOT NULL,
  `ThoiGianGiaoDich` datetime DEFAULT NULL,
  `TongTien` decimal(10,2) DEFAULT NULL,
  `PhuongThucThanhToan` varchar(50) DEFAULT NULL,
  `MaNhanVien` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `giaodich`
--

INSERT INTO `giaodich` (`MaGiaoDich`, `ThoiGianGiaoDich`, `TongTien`, `PhuongThucThanhToan`, `MaNhanVien`) VALUES
(1, '2024-05-21 10:00:00', 500000.00, 'Thẻ', 2),
(2, '2024-05-22 11:00:00', 200000.00, 'Tiền mặt', 2),
(3, '2024-06-02 21:08:40', 322331.00, 'Tiền mặt', 1),
(4, '2024-06-03 11:21:20', 0.00, 'Tiền mặt', 1),
(5, '2024-06-03 11:22:10', 424553.00, 'Tiền mặt', 1),
(6, '2024-06-03 11:22:15', 424553.00, 'Tiền mặt', 1),
(7, '2024-06-03 11:54:39', 526775.00, 'Tiền mặt', 1),
(8, '2024-06-03 14:34:29', 674553.00, 'Tiền mặt', 1),
(9, '2024-06-03 14:53:11', 674553.00, 'Tiền mặt', 1),
(10, '2024-06-04 08:57:52', 0.00, 'Tiền mặt', 1),
(11, '2024-06-04 08:58:18', 0.00, 'Tiền mặt', 1),
(12, '2024-06-04 08:58:59', 946773.00, 'Tiền mặt', 1),
(13, '2024-06-04 09:27:54', 0.00, 'Tiền mặt', 1),
(14, '2024-06-04 12:29:52', 974775.00, 'Tiền mặt', 1),
(15, '2024-06-05 18:43:58', 1348995.00, 'Tiền mặt', 1),
(16, '2024-06-05 18:46:27', 50111.00, 'Tiền mặt', 1),
(17, '2024-06-05 19:18:37', 50111.00, 'Tiền mặt', 1),
(18, '2024-06-05 21:09:10', 50111.00, 'Tiền mặt', 1),
(19, '2024-06-05 21:20:19', 124442.00, 'Tiền mặt', 1),
(20, '2024-06-06 21:59:17', 222.00, 'Tiền mặt', 1),
(21, '2024-06-06 22:00:00', 52333.00, 'Tiền mặt', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `khachhang`
--

CREATE TABLE `khachhang` (
  `MaKhachHang` int(11) NOT NULL,
  `Ten` varchar(100) DEFAULT NULL,
  `DienThoai` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `khachhang`
--

INSERT INTO `khachhang` (`MaKhachHang`, `Ten`, `DienThoai`) VALUES
(1, 'Teo', '0123456'),
(2, 'Nguyen Van A', '0909123456'),
(3, 'Tran Thi B', '0909876543'),
(4, 'Thai', NULL),
(5, 'Quoc Thai', '060963145'),
(6, 'Hiaaa', NULL),
(7, 'Thaaa', '0906793600'),
(8, 'Hello', NULL),
(9, 'Thaa00', NULL),
(10, 'Tqqq', NULL),
(11, 'Tqqqnnd', NULL),
(12, 'SSS', NULL),
(13, 'Tha111', NULL),
(14, 'Thái444', NULL),
(15, 'Tháisssss', NULL),
(16, 'Ha', NULL),
(17, 'Tháa', NULL),
(18, '111223', NULL),
(19, '1111', NULL),
(20, 'Helqq', NULL),
(21, '2222', NULL),
(22, 'Nguyễn Quốc Thái', NULL),
(23, 'Khách ', NULL),
(24, '1234', NULL),
(25, 'Nguyễn', NULL),
(26, 'Thái11111', NULL),
(27, 'Thái2345566', '012345687902'),
(28, NULL, '01233456790'),
(29, 'T', '0937441027'),
(30, 'Thai', '1234554321'),
(31, 'Tqư', '123678940441'),
(32, 'Khách vãng lai', '0000000000'),
(33, 'Khách vãng lai', '0000000000'),
(34, 'Khách vãng lai', '0000000000'),
(35, 'Khách vãng lai', '0000000000'),
(36, 'Khách vãng lai', '0000000000'),
(37, 'Khách vãng lai', '0000000000'),
(38, 'Khách vãng lai', '0000000000'),
(39, 'Khách vãng lai', '0000000000'),
(40, 'Khách vãng lai', '0000000000'),
(41, 'Khách vãng lai', '0000000000'),
(42, 'Khách vãng lai', '0000000000');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `khohang`
--

CREATE TABLE `khohang` (
  `MaKhoHang` int(11) NOT NULL,
  `MaSanPham` int(11) DEFAULT NULL,
  `SoLuong` int(11) DEFAULT NULL,
  `NgayNhapHang` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhanvien`
--

CREATE TABLE `nhanvien` (
  `MaNhanVien` int(11) NOT NULL,
  `Ten` varchar(100) DEFAULT NULL,
  `DienThoai` varchar(20) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `ChucVu` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `nhanvien`
--

INSERT INTO `nhanvien` (`MaNhanVien`, `Ten`, `DienThoai`, `Email`, `ChucVu`) VALUES
(1, 'Quản lý', '0987654321', 'quanly@.com', 'Quản lý'),
(2, 'Nhân viên', '0123456789', 'nhanvien@.com', 'Nhân viên');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sanpham`
--

CREATE TABLE `sanpham` (
  `MaSanPham` int(11) NOT NULL,
  `Ten` varchar(100) DEFAULT NULL,
  `Gia` decimal(18,2) DEFAULT NULL,
  `LinkSP` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `sanpham`
--

INSERT INTO `sanpham` (`MaSanPham`, `Ten`, `Gia`, `LinkSP`) VALUES
(1, 'Burger', 50000.00, NULL),
(2, 'Thái', 111.00, NULL),
(7, 'saaa', 122220.00, 'C:\\Users\\Admin\\OneDrive\\Hình ảnh\\Screenshots\\2024-05-31 (1).png'),
(8, 'dgdfgd', 2222.00, 'C:\\Users\\Admin\\OneDrive\\Hình ảnh\\Screenshots\\2024-05-31 (1).png');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `taikhoan`
--

CREATE TABLE `taikhoan` (
  `MaTaiKhoan` int(11) NOT NULL,
  `TenDangNhap` varchar(50) DEFAULT NULL,
  `MatKhau` varchar(50) DEFAULT NULL,
  `LoaiTaiKhoan` varchar(20) DEFAULT NULL,
  `MaNhanVien` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `taikhoan`
--

INSERT INTO `taikhoan` (`MaTaiKhoan`, `TenDangNhap`, `MatKhau`, `LoaiTaiKhoan`, `MaNhanVien`) VALUES
(1, 'quanly', '123456', 'Quản lý', 1),
(2, 'nhanvien', '123456', 'Nhân viên', 2);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `ban`
--
ALTER TABLE `ban`
  ADD PRIMARY KEY (`MaBan`);

--
-- Chỉ mục cho bảng `chitietdonhang`
--
ALTER TABLE `chitietdonhang`
  ADD PRIMARY KEY (`MaChiTietDonHang`),
  ADD KEY `MaSanPham` (`MaSanPham`),
  ADD KEY `fk_chitietdonhang_donhang` (`MaDonHang`);

--
-- Chỉ mục cho bảng `datcho`
--
ALTER TABLE `datcho`
  ADD PRIMARY KEY (`MaDatCho`),
  ADD KEY `MaKhachHang` (`MaKhachHang`),
  ADD KEY `MaBan` (`MaBan`);

--
-- Chỉ mục cho bảng `donhang`
--
ALTER TABLE `donhang`
  ADD PRIMARY KEY (`MaDonHang`),
  ADD KEY `MaKhachHang` (`MaKhachHang`),
  ADD KEY `MaNhanVien` (`MaNhanVien`);

--
-- Chỉ mục cho bảng `giaodich`
--
ALTER TABLE `giaodich`
  ADD PRIMARY KEY (`MaGiaoDich`),
  ADD KEY `MaNhanVien` (`MaNhanVien`);

--
-- Chỉ mục cho bảng `khachhang`
--
ALTER TABLE `khachhang`
  ADD PRIMARY KEY (`MaKhachHang`);

--
-- Chỉ mục cho bảng `khohang`
--
ALTER TABLE `khohang`
  ADD PRIMARY KEY (`MaKhoHang`),
  ADD KEY `MaSanPham` (`MaSanPham`);

--
-- Chỉ mục cho bảng `nhanvien`
--
ALTER TABLE `nhanvien`
  ADD PRIMARY KEY (`MaNhanVien`);

--
-- Chỉ mục cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  ADD PRIMARY KEY (`MaSanPham`);

--
-- Chỉ mục cho bảng `taikhoan`
--
ALTER TABLE `taikhoan`
  ADD PRIMARY KEY (`MaTaiKhoan`),
  ADD UNIQUE KEY `TenDangNhap` (`TenDangNhap`),
  ADD KEY `MaNhanVien` (`MaNhanVien`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `ban`
--
ALTER TABLE `ban`
  MODIFY `MaBan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `chitietdonhang`
--
ALTER TABLE `chitietdonhang`
  MODIFY `MaChiTietDonHang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- AUTO_INCREMENT cho bảng `datcho`
--
ALTER TABLE `datcho`
  MODIFY `MaDatCho` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `donhang`
--
ALTER TABLE `donhang`
  MODIFY `MaDonHang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=153;

--
-- AUTO_INCREMENT cho bảng `giaodich`
--
ALTER TABLE `giaodich`
  MODIFY `MaGiaoDich` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT cho bảng `khachhang`
--
ALTER TABLE `khachhang`
  MODIFY `MaKhachHang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT cho bảng `khohang`
--
ALTER TABLE `khohang`
  MODIFY `MaKhoHang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `nhanvien`
--
ALTER TABLE `nhanvien`
  MODIFY `MaNhanVien` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  MODIFY `MaSanPham` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `taikhoan`
--
ALTER TABLE `taikhoan`
  MODIFY `MaTaiKhoan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `chitietdonhang`
--
ALTER TABLE `chitietdonhang`
  ADD CONSTRAINT `chitietdonhang_ibfk_2` FOREIGN KEY (`MaSanPham`) REFERENCES `sanpham` (`MaSanPham`),
  ADD CONSTRAINT `fk_chitietdonhang_donhang` FOREIGN KEY (`MaDonHang`) REFERENCES `donhang` (`MaDonHang`),
  ADD CONSTRAINT `fk_chitietdonhang_sanpham` FOREIGN KEY (`MaSanPham`) REFERENCES `sanpham` (`MaSanPham`),
  ADD CONSTRAINT `fk_donhang` FOREIGN KEY (`MaDonHang`) REFERENCES `donhang` (`MaDonHang`);

--
-- Các ràng buộc cho bảng `datcho`
--
ALTER TABLE `datcho`
  ADD CONSTRAINT `datcho_ibfk_1` FOREIGN KEY (`MaKhachHang`) REFERENCES `khachhang` (`MaKhachHang`),
  ADD CONSTRAINT `datcho_ibfk_2` FOREIGN KEY (`MaBan`) REFERENCES `ban` (`MaBan`),
  ADD CONSTRAINT `fk_datcho_ban` FOREIGN KEY (`MaBan`) REFERENCES `ban` (`MaBan`),
  ADD CONSTRAINT `fk_datcho_khachhang` FOREIGN KEY (`MaKhachHang`) REFERENCES `khachhang` (`MaKhachHang`);

--
-- Các ràng buộc cho bảng `donhang`
--
ALTER TABLE `donhang`
  ADD CONSTRAINT `donhang_ibfk_1` FOREIGN KEY (`MaKhachHang`) REFERENCES `khachhang` (`MaKhachHang`),
  ADD CONSTRAINT `donhang_ibfk_2` FOREIGN KEY (`MaNhanVien`) REFERENCES `nhanvien` (`MaNhanVien`),
  ADD CONSTRAINT `fk_donhang_khachhang` FOREIGN KEY (`MaKhachHang`) REFERENCES `khachhang` (`MaKhachHang`),
  ADD CONSTRAINT `fk_donhang_nhanvien` FOREIGN KEY (`MaNhanVien`) REFERENCES `nhanvien` (`MaNhanVien`);

--
-- Các ràng buộc cho bảng `giaodich`
--
ALTER TABLE `giaodich`
  ADD CONSTRAINT `fk_giaodich_nhanvien` FOREIGN KEY (`MaNhanVien`) REFERENCES `nhanvien` (`MaNhanVien`),
  ADD CONSTRAINT `giaodich_ibfk_1` FOREIGN KEY (`MaNhanVien`) REFERENCES `nhanvien` (`MaNhanVien`);

--
-- Các ràng buộc cho bảng `khohang`
--
ALTER TABLE `khohang`
  ADD CONSTRAINT `fk_khohang_sanpham` FOREIGN KEY (`MaSanPham`) REFERENCES `sanpham` (`MaSanPham`),
  ADD CONSTRAINT `khohang_ibfk_1` FOREIGN KEY (`MaSanPham`) REFERENCES `sanpham` (`MaSanPham`);

--
-- Các ràng buộc cho bảng `taikhoan`
--
ALTER TABLE `taikhoan`
  ADD CONSTRAINT `fk_taikhoan_nhanvien` FOREIGN KEY (`MaNhanVien`) REFERENCES `nhanvien` (`MaNhanVien`),
  ADD CONSTRAINT `taikhoan_ibfk_1` FOREIGN KEY (`MaNhanVien`) REFERENCES `nhanvien` (`MaNhanVien`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
