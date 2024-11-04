-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th6 12, 2024 lúc 07:32 AM
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
(1, 'Bàn 1', 'Có người'),
(2, 'Bàn 2', 'Đã đặt'),
(3, 'Bàn 3', 'Trống'),
(4, 'Bàn 4', 'Trống'),
(5, 'Bàn 5', 'Trống');

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
(97, 8, 1, 2222.00, 149),
(102, 8, 1, 2222.00, 150),
(109, 8, 1, 2222.00, 151),
(112, 8, 1, 2222.00, 152),
(127, 7, 1, 122220.00, 162),
(129, 7, 1, 122220.00, 163),
(132, 7, 1, 122220.00, 163),
(134, 2, 1, 111.00, 163),
(135, 2, 1, 111.00, 163),
(138, 2, 1, 111.00, 163),
(140, 7, 1, 122220.00, 163),
(142, 7, 1, 122220.00, 163),
(144, 7, 1, 122220.00, 164),
(148, 7, 1, 122220.00, 165),
(149, 2, 1, 111.00, 165),
(151, 2, 1, 111.00, 165),
(153, 2, 1, 111.00, 166),
(155, 2, 1, 111.00, 167),
(157, 2, 1, 111.00, 167),
(159, 2, 1, 111.00, 167),
(160, 7, 1, 122220.00, 167),
(161, 2, 1, 111.00, 167),
(162, 7, 1, 122220.00, 167),
(163, 7, 1, 122220.00, 167),
(164, 7, 1, 122220.00, 167),
(165, 2, 1, 111.00, 167),
(167, 2, 1, 111.00, 167),
(186, 1, 1, 50000.00, 168),
(187, 7, 1, 122220.00, 168),
(188, 2, 1, 111.00, 168),
(189, 7, 1, 122220.00, 168),
(190, 2, 2, 222.00, 169),
(191, 7, 1, 122220.00, 169),
(192, 1, 1, 50000.00, 169),
(193, 2, 1, 111.00, 169),
(194, 1, 1, 50000.00, 170),
(195, 2, 1, 111.00, 170),
(196, 2, 1, 111.00, 170),
(197, 2, 1, 111.00, 171),
(198, 2, 1, 111.00, 171),
(199, 7, 1, 122220.00, 171),
(200, 2, 1, 111.00, 172),
(201, 7, 1, 122220.00, 172),
(202, 2, 1, 111.00, 172),
(203, 7, 1, 122220.00, 172),
(204, 2, 1, 111.00, 173),
(205, 7, 1, 122220.00, 173),
(206, 2, 1, 111.00, 173),
(207, 8, 1, 2222.00, 173),
(208, 2, 1, 111.00, 174),
(209, 8, 1, 2222.00, 174),
(210, 2, 1, 111.00, 174),
(211, 7, 1, 122220.00, 174),
(212, 2, 1, 111.00, 174),
(213, 7, 1, 122220.00, 174),
(214, 2, 1, 111.00, 175),
(215, 7, 1, 122220.00, 175),
(216, 7, 1, 122220.00, 175),
(217, 8, 1, 2222.00, 175),
(218, 7, 1, 122220.00, 176),
(219, 8, 1, 2222.00, 176),
(220, 7, 1, 122220.00, 176),
(221, 2, 1, 111.00, 176),
(222, 7, 1, 122220.00, 177),
(223, 2, 1, 111.00, 177),
(224, 7, 1, 122220.00, 177),
(225, 2, 1, 111.00, 177),
(226, 7, 1, 122220.00, 178),
(227, 2, 1, 111.00, 178),
(228, 2, 1, 111.00, 178),
(229, 2, 1, 111.00, 179),
(230, 1, 1, 50000.00, 179),
(231, 2, 1, 111.00, 179),
(232, 1, 1, 50000.00, 180),
(233, 2, 1, 111.00, 180),
(234, 7, 1, 122220.00, 180),
(235, 2, 1, 111.00, 180),
(236, 7, 1, 122220.00, 181),
(237, 2, 1, 111.00, 181),
(238, 1, 1, 50000.00, 181),
(239, 8, 1, 2222.00, 181),
(240, 1, 1, 50000.00, 182),
(241, 8, 1, 2222.00, 182),
(242, 1, 1, 50000.00, 182),
(243, 2, 1, 111.00, 182),
(244, 1, 1, 50000.00, 183),
(245, 2, 1, 111.00, 183),
(246, 2, 1, 111.00, 183),
(247, 1, 1, 50000.00, 183),
(248, 2, 1, 111.00, 184),
(249, 1, 1, 50000.00, 184),
(250, 1, 1, 50000.00, 184),
(251, 2, 1, 111.00, 184),
(252, 1, 1, 50000.00, 185),
(253, 2, 1, 111.00, 185),
(254, 1, 1, 50000.00, 185),
(255, 8, 1, 2222.00, 185),
(256, 1, 1, 50000.00, 186),
(257, 8, 1, 2222.00, 186),
(258, 1, 1, 50000.00, 186),
(259, 2, 1, 111.00, 186),
(260, 1, 1, 50000.00, 187),
(261, 2, 1, 111.00, 187),
(262, 1, 1, 50000.00, 187),
(263, 2, 1, 111.00, 187),
(264, 1, 1, 50000.00, 188),
(265, 2, 1, 111.00, 188),
(266, 2, 1, 111.00, 188),
(267, 2, 1, 111.00, 189),
(268, 2, 1, 111.00, 189),
(269, 8, 1, 2222.00, 189),
(270, 1, 1, 50000.00, 189),
(271, 2, 1, 111.00, 190),
(272, 8, 1, 2222.00, 190),
(273, 1, 1, 50000.00, 190);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `datcho`
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
-- Đang đổ dữ liệu cho bảng `datcho`
--

INSERT INTO `datcho` (`MaDatCho`, `MaKhachHang`, `MaBan`, `ThoiGianDat`, `SoLuongKhach`, `GhiChu`) VALUES
(1, 1, 1, '2024-05-20 08:00:00', 2, NULL),
(2, 2, 2, '2024-05-21 09:00:00', 4, NULL),
(4, 44, 1, '2024-06-08 14:00:00', 111111, '785'),
(5, 45, 2, '2024-06-08 00:00:00', 10, '100000'),
(6, 46, 2, '2024-06-08 04:00:00', 1, 'Taa'),
(7, 46, 2, '2024-06-08 21:00:00', 1, 'Taa'),
(8, 47, 1, '2024-06-08 05:00:00', 5, 'qqqqq'),
(9, 48, 1, '2024-06-08 04:00:00', 2, '1112'),
(10, 50, 1, '2024-06-08 00:00:00', 5, '10'),
(11, 1, 4, '2024-06-08 00:00:00', 4, 'Hello'),
(12, 44, 5, '2024-06-08 00:00:00', 4, '55'),
(13, 44, 3, '2024-06-08 00:00:00', 5, 'fffww'),
(14, 44, 1, '2024-06-08 06:00:00', 5, 'ewqa'),
(15, 70, 1, NULL, NULL, NULL),
(16, 72, 2, NULL, NULL, NULL),
(17, 73, 3, NULL, NULL, NULL),
(18, 7, 5, '2024-06-14 14:00:00', 5, 'Thaisss'),
(19, 96, 1, '2024-06-12 11:33:17', 1, ''),
(20, 44, 2, '2024-06-12 03:00:00', 5, 'quứod'),
(21, 44, 2, '2024-06-12 05:00:00', 6, 'tháad');

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
  `PhuongThucThanhToan` varchar(255) DEFAULT NULL,
  `MuaMangVe` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `donhang`
--

INSERT INTO `donhang` (`MaDonHang`, `MaKhachHang`, `MaNhanVien`, `NgayDatHang`, `TongTien`, `PhuongThucThanhToan`, `MuaMangVe`) VALUES
(105, 4, 1, '2024-06-02', 111.00, NULL, 0),
(106, 8, 1, '2024-06-02', 2222.00, NULL, 0),
(108, 17, 1, '2024-06-02', 50000.00, NULL, 0),
(109, 4, 1, '2024-06-02', 172220.00, NULL, 0),
(110, 4, 1, '2024-06-02', 294440.00, NULL, 0),
(111, 18, 1, '2024-06-02', 172331.00, NULL, 0),
(112, 19, 1, '2024-06-02', 172331.00, NULL, 0),
(113, 20, 1, '2024-06-02', 172331.00, NULL, 0),
(114, 21, 1, '2024-06-02', 172331.00, NULL, 0),
(115, 22, 1, '2024-06-02', 111.00, NULL, 0),
(116, 23, 1, '2024-06-02', 222331.00, NULL, 0),
(117, 23, 1, '2024-06-02', 222331.00, NULL, 0),
(118, 24, 1, '2024-06-02', 322331.00, 'Tiền mặt', 0),
(119, 25, 1, '2024-06-02', 496773.00, 'Tiền mặt', 0),
(120, 4, 1, '2024-06-03', 0.00, 'Tiền mặt', 0),
(121, 26, 1, '2024-06-03', 424553.00, 'Tiền mặt', 0),
(122, 26, 1, '2024-06-03', 424553.00, 'Tiền mặt', 0),
(123, 4, 1, '2024-06-03', 526775.00, 'Tiền mặt', 0),
(124, 28, 1, '2024-06-03', 674553.00, 'Tiền mặt', 0),
(125, 31, 1, '2024-06-03', 674553.00, 'Tiền mặt', 0),
(141, 1, 1, '2024-06-04', 0.00, 'Tiền mặt', 0),
(142, 1, 1, '2024-06-04', 0.00, 'Tiền mặt', 0),
(143, 1, 1, '2024-06-04', 946773.00, 'Tiền mặt', 0),
(144, 34, 1, '2024-06-04', 0.00, 'Tiền mặt', 0),
(145, 35, 1, '2024-06-04', 974775.00, 'Tiền mặt', 0),
(146, 36, 1, '2024-06-05', 1348995.00, 'Tiền mặt', 0),
(147, 37, 1, '2024-06-05', 50111.00, 'Tiền mặt', 0),
(148, 38, 1, '2024-06-05', 50111.00, 'Tiền mặt', 0),
(149, 39, 1, '2024-06-05', 50111.00, 'Tiền mặt', 0),
(150, 40, 1, '2024-06-05', 124442.00, 'Tiền mặt', 0),
(151, 41, 1, '2024-06-06', 222.00, 'Tiền mặt', 0),
(152, 42, 1, '2024-06-06', 52333.00, 'Tiền mặt', 0),
(159, 61, 1, '2024-06-08', 172220.00, 'Tiền mặt', 0),
(162, 62, 1, '2024-06-08', 50111.00, 'Tiền mặt', 0),
(163, 63, 1, '2024-06-08', 172220.00, 'Tiền mặt', 0),
(164, 64, 1, '2024-06-08', 172220.00, 'Tiền mặt', 0),
(165, 65, 1, '2024-06-09', 50000.00, 'Tiền mặt', 0),
(166, 66, 1, '2024-06-09', 50111.00, 'Tiền mặt', 1),
(167, 67, 1, '2024-06-09', 50111.00, 'Tiền mặt', 1),
(168, 44, 1, '2024-06-09', 50111.00, 'Tiền mặt', 0),
(169, 68, 1, '2024-06-12', 122442.00, 'Tiền mặt', 0),
(170, 69, 1, '2024-06-12', 50111.00, 'Tiền mặt', 0),
(171, 71, 1, '2024-06-12', 111.00, 'Tiền mặt', 0),
(172, 74, 1, '2024-06-12', 122331.00, 'Tiền mặt', 0),
(173, 75, 1, '2024-06-12', 122331.00, 'Tiền mặt', 0),
(174, 76, 1, '2024-06-12', 2333.00, 'Tiền mặt', 0),
(175, 77, 1, '2024-06-12', 122331.00, 'Tiền mặt', 0),
(176, 79, 1, '2024-06-12', 124442.00, 'Tiền mặt', 0),
(177, 81, 1, '2024-06-12', 122331.00, 'Tiền mặt', 0),
(178, 83, 1, '2024-06-12', 122331.00, 'Tiền mặt', 0),
(179, 84, 1, '2024-06-12', 111.00, 'Tiền mặt', 1),
(180, 86, 1, '2024-06-12', 50111.00, 'Tiền mặt', 0),
(181, 87, 1, '2024-06-12', 122331.00, 'Tiền mặt', 0),
(182, 88, 1, '2024-06-12', 52222.00, 'Tiền mặt', 0),
(183, 89, 1, '2024-06-12', 50111.00, 'Tiền mặt', 0),
(184, 90, 1, '2024-06-12', 50111.00, 'Tiền mặt', 0),
(185, 91, 1, '2024-06-12', 50111.00, 'Tiền mặt', 0),
(186, 92, 1, '2024-06-12', 52222.00, 'Tiền mặt', 0),
(187, 93, 1, '2024-06-12', 50111.00, 'Tiền mặt', 0),
(188, 94, 1, '2024-06-12', 50111.00, 'Tiền mặt', 0),
(189, 95, 1, '2024-06-12', 111.00, 'Tiền mặt', 0),
(190, 96, 1, '2024-06-12', 52333.00, 'Tiền mặt', 0);

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
(21, '2024-06-06 22:00:00', 52333.00, 'Tiền mặt', 1),
(22, '2024-06-08 15:01:14', 172220.00, 'Tiền mặt', 1),
(23, '2024-06-08 16:56:34', 50111.00, 'Tiền mặt', 1),
(24, '2024-06-08 21:26:27', 172220.00, 'Tiền mặt', 1),
(25, '2024-06-08 22:42:31', 172220.00, 'Tiền mặt', 1),
(26, '2024-06-09 09:16:23', 50000.00, 'Tiền mặt', 1),
(27, '2024-06-09 09:52:59', 50111.00, 'Tiền mặt', 1),
(28, '2024-06-09 09:53:08', 50111.00, 'Tiền mặt', 1),
(29, '2024-06-09 18:02:58', 50111.00, 'Tiền mặt', 1),
(30, '2024-06-12 08:01:23', 122442.00, 'Tiền mặt', 1),
(31, '2024-06-12 08:08:12', 50111.00, 'Tiền mặt', 1),
(32, '2024-06-12 08:14:43', 111.00, 'Tiền mặt', 1),
(33, '2024-06-12 08:27:02', 122331.00, 'Tiền mặt', 1),
(34, '2024-06-12 08:48:08', 122331.00, 'Tiền mặt', 1),
(35, '2024-06-12 09:13:36', 2333.00, 'Tiền mặt', 1),
(36, '2024-06-12 09:51:52', 122331.00, 'Tiền mặt', 1),
(37, '2024-06-12 09:59:56', 124442.00, 'Tiền mặt', 1),
(38, '2024-06-12 10:05:44', 122331.00, 'Tiền mặt', 1),
(39, '2024-06-12 10:14:38', 122331.00, 'Tiền mặt', 1),
(40, '2024-06-12 10:17:00', 111.00, 'Tiền mặt', 1),
(41, '2024-06-12 10:26:46', 50111.00, 'Tiền mặt', 1),
(42, '2024-06-12 10:54:06', 122331.00, 'Tiền mặt', 1),
(43, '2024-06-12 10:55:04', 52222.00, 'Tiền mặt', 1),
(44, '2024-06-12 10:59:57', 50111.00, 'Tiền mặt', 1),
(45, '2024-06-12 11:03:14', 50111.00, 'Tiền mặt', 1),
(46, '2024-06-12 11:09:36', 50111.00, 'Tiền mặt', 1),
(47, '2024-06-12 11:12:32', 52222.00, 'Tiền mặt', 1),
(48, '2024-06-12 11:13:38', 50111.00, 'Tiền mặt', 1),
(49, '2024-06-12 11:16:58', 50111.00, 'Tiền mặt', 1),
(50, '2024-06-12 11:18:29', 111.00, 'Tiền mặt', 1),
(51, '2024-06-12 11:33:19', 52333.00, 'Tiền mặt', 1);

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
(7, 'Thaaa', '0906793600'),
(8, 'Hello', NULL),
(9, 'Thaa00', NULL),
(10, 'Tqqq', NULL),
(13, 'Tha111', NULL),
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
(42, 'Khách vãng lai', '0000000000'),
(43, 'Taaa', '1223'),
(44, 'Tq', '111111'),
(45, 'Thai', '0905555'),
(46, 'Thai11111111111', '1111111111'),
(47, 'He1111', '0904111123'),
(48, '111111', '066633314'),
(49, 'Vasuka', '012789632'),
(50, 'Thãmnak', '0954640217'),
(51, 'Tđa', '1334567890'),
(55, 'Khách vãng lai', '0000000000'),
(56, 'Khách vãng lai', '0000000000'),
(57, 'Khách vãng lai', '0000000000'),
(58, 'Khách vãng lai', '0000000000'),
(59, 'Khách vãng lai', '0000000000'),
(60, 'Khách vãng lai', '0000000000'),
(61, 'Khách vãng lai', '0000000000'),
(62, 'Khách vãng lai', '0000000000'),
(63, 'Khách vãng lai', '0000000000'),
(64, 'Khách vãng lai', '0000000000'),
(65, 'Khách vãng lai', '0000000000'),
(66, 'Khách vãng lai', '0000000000'),
(67, 'Khách vãng lai', '0000000000'),
(68, 'Khách vãng lai', '0000000000'),
(69, 'Khách vãng lai', '0000000000'),
(70, NULL, NULL),
(71, 'Khách vãng lai', '0000000000'),
(72, NULL, NULL),
(73, NULL, NULL),
(74, 'Khách vãng lai', '0000000000'),
(75, 'Khách vãng lai', '0000000000'),
(76, 'Khách vãng lai', '0000000000'),
(77, 'Khách vãng lai', '0000000000'),
(78, 'Tên khách hàng mới', 'Số điện thoại mới'),
(79, 'Khách vãng lai', '0000000000'),
(80, 'Tên khách hàng mới', 'Số điện thoại mới'),
(81, 'Khách vãng lai', '0000000000'),
(82, 'Tên khách hàng mới', 'Số điện thoại mới'),
(83, 'Khách vãng lai', '0000000000'),
(84, 'Khách vãng lai', '0000000000'),
(85, 'Tên khách hàng mới', 'Số điện thoại mới'),
(86, 'Khách vãng lai', '0000000000'),
(87, 'Khách vãng lai', '0000000000'),
(88, 'Khách vãng lai', '0000000000'),
(89, 'Khách vãng lai', '0000000000'),
(90, 'Khách vãng lai', '0000000000'),
(91, 'Khách vãng lai', '0000000000'),
(92, 'Khách vãng lai', '0000000000'),
(93, 'Khách vãng lai', '0000000000'),
(94, 'Khách vãng lai', '0000000000'),
(95, 'Khách vãng lai', '0000000000'),
(96, 'Khách vãng lai', '0000000000');

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
  MODIFY `MaBan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `chitietdonhang`
--
ALTER TABLE `chitietdonhang`
  MODIFY `MaChiTietDonHang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=274;

--
-- AUTO_INCREMENT cho bảng `datcho`
--
ALTER TABLE `datcho`
  MODIFY `MaDatCho` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT cho bảng `donhang`
--
ALTER TABLE `donhang`
  MODIFY `MaDonHang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=191;

--
-- AUTO_INCREMENT cho bảng `giaodich`
--
ALTER TABLE `giaodich`
  MODIFY `MaGiaoDich` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT cho bảng `khachhang`
--
ALTER TABLE `khachhang`
  MODIFY `MaKhachHang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

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
