-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 19, 2023 lúc 04:39 PM
-- Phiên bản máy phục vụ: 10.4.22-MariaDB
-- Phiên bản PHP: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `shopbanruou`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `level` int(11) NOT NULL,
  `created` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `admin`
--

INSERT INTO `admin` (`id`, `name`, `email`, `password`, `level`, `created`) VALUES
(1, 'Goo', 'admin@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 0, 2147483647);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `catalog`
--

CREATE TABLE `catalog` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_id` int(11) NOT NULL,
  `sort_order` tinyint(4) NOT NULL,
  `created` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `catalog`
--

INSERT INTO `catalog` (`id`, `name`, `description`, `parent_id`, `sort_order`, `created`) VALUES
(7, 'Rượu vang', '', 1, 1, '2017-04-22 05:37:23'),
(8, 'Rượu mạnh', '', 1, 2, '2017-04-22 05:37:36'),
(9, 'Rượu pha chế', '', 1, 3, '2017-04-22 05:37:50'),
(10, 'Rượu vang Đỏ', '', 7, 1, '2017-04-22 09:08:19'),
(11, 'Rượu vang Trắng', '', 7, 2, '2017-04-22 09:08:36'),
(12, 'Rượu vang Hồng', '', 7, 3, '2017-04-22 09:09:01'),
(13, 'Whisky', '', 8, 1, '2017-04-22 09:09:14'),
(14, 'Rượu Vodka', '', 8, 2, '2017-04-22 09:09:31'),
(15, 'Rượu thảo mộc', '', 9, 1, '2017-04-22 09:09:46'),
(16, 'Rượu sữa', '', 9, 2, '2017-04-22 09:10:10'),
(17, 'Rượu trái cây', '', 9, 3, '2017-04-22 09:23:39');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `transaction_id` int(100) NOT NULL,
  `product_id` int(100) NOT NULL,
  `qty` int(100) NOT NULL DEFAULT 0,
  `amount` decimal(15,2) NOT NULL DEFAULT 0.00,
  `status` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `order`
--

INSERT INTO `order` (`id`, `transaction_id`, `product_id`, `qty`, `amount`, `status`) VALUES
(25, 19, 49, 2, '6800000.00', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `id` int(255) NOT NULL,
  `catalog_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `price` decimal(15,2) NOT NULL DEFAULT 0.00,
  `discount` int(11) DEFAULT 0,
  `image_link` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `image_list` text COLLATE utf8_unicode_ci NOT NULL,
  `view` int(11) NOT NULL DEFAULT 0,
  `buyed` int(255) NOT NULL,
  `rate_total` int(255) NOT NULL DEFAULT 4,
  `rate_count` int(255) NOT NULL DEFAULT 1,
  `created` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`id`, `catalog_id`, `name`, `content`, `price`, `discount`, `image_link`, `image_list`, `view`, `buyed`, `rate_total`, `rate_count`, `created`) VALUES
(1, 16, 'RƯỢU SỮA BAILEY', '<p>Rượu Baileys l&agrave; 1 trong những loại rượu m&ugrave;i chứa kem sữa Ailen đầu ti&ecirc;n tr&ecirc;n thế giới. Sự phối hợp kh&aacute;c biệt giữa whisky Ailen với rượu m&ugrave;i kem độc đ&aacute;o v&agrave; kh&aacute;c biệt độc nhất v&ocirc; nhị. Với phi&ecirc;n bản Baileys Strawberries Cream: Sự kết hợp ngọt ng&agrave;o giữa rượu &ndash; d&acirc;u t&acirc;y v&agrave; kem sữa.</p>\r\n\r\n<p>Họa tiết thiết kế chai rượu Baileys Strawberries Cream n&agrave;y l&agrave; sự phối hợp những h&igrave;nh minh họa d&acirc;u t&acirc;y đầy m&ugrave;i vị c&ugrave;ng theo với nhiều chủng loại hoa theo m&ugrave;a kh&aacute;c. Tạo n&ecirc;n một h&igrave;nh minh họa bất đối xứng v&agrave; tr&agrave;n đầy năng lượng.</p>\r\n\r\n<p>Sữa v&agrave; c&aacute;c d&ograve;ng sản phẩm từ sữa (bao gồm lactose) l&agrave; th&agrave;nh phần ch&iacute;nh trong loại rượu n&agrave;y. C&ugrave;ng với đ&oacute; l&agrave; hương liệu d&acirc;u t&acirc;y tự nhi&ecirc;n. Bằng c&aacute;ch phối hợp d&acirc;u t&acirc;y tươi ngon ngọt với kem sữa Ailen nguy&ecirc;n chất v&agrave; tinh thần Baileys rất dị.</p>\r\n\r\n<p>M&ugrave;i vị mơ m&agrave;ng của d&acirc;u ch&iacute;n mọng &amp; vani. H&ograve;a quyện với hương vị Kem Baileys Original Ailen tuyệt hảo ở chỗ n&agrave;y. Quyện trộn c&ugrave;ng những th&agrave;nh phần v&agrave; m&ugrave;i vị kh&aacute;c. Rượu m&ugrave;i kem d&acirc;u t&acirc;y l&agrave; một trong ngọt ng&agrave;o v&agrave; lắng đọng, mọng gợi với m&agrave;u hồng kem &amp; m&ugrave;i vị l&ocirc;i cuốn.</p>\r\n', '1000000.00', 200000, 'bd-Web-4-300x300.jpg', '[\"bd-Web-4-300x3001.jpg\",\"bailey-Web-4-300x300.jpg\",\"RPC_03-300x300.png\"]', 27, 2, 19, 4, 1493983674),
(9, 15, 'RƯỢU ĐỨC JAGERMEISTER', '<p>Rượu Jagermeister ra đời năm 1934, bởi Curt Mast t&igrave;m ra v&agrave; ho&agrave;n thiện c&ocirc;ng thức của sản phẩm v&agrave; đ&acirc;y cũng l&agrave; sản phẩm chủ lực của Mast-J&auml;germeister SE, nh&agrave; sản xuất c&oacute; trụ sở tại Wolfenb&uuml;ttel, ph&iacute;a nam Braunschweig, Hạ Sachsen, Đức.</p>\r\n\r\n<p>Lịch sử ra đời của thương hiệu rượu Mast J&auml;germeister bắt đầu từ Wilhelm Mast, cha của Curt Mast, l&agrave; một nh&agrave; bu&ocirc;n b&aacute;n rượu vang v&agrave; sản xuất giấm tại th&agrave;nh phố Wolfenb&uuml;ttel, Đức. Con trai của &ocirc;ng, Curt Mast (1897-1970), c&oacute; niềm đam m&ecirc; to lớn với ngh&agrave;nh sản xuất rượu mạnh v&agrave; rượu m&ugrave;i, Đến khi Curt Mast 37 tuổi, khi &ocirc;ng tiếp thay cha m&igrave;nh điều h&agrave;nh c&ocirc;ng việc kinh doanh, v&agrave; l&uacute;c n&agrave;y Curt Mast đ&atilde; t&igrave;m ra c&ocirc;ng thức sản xuất cho loại rượu m&ugrave;i thảo mộc mới m&agrave; &ocirc;ng gọi l&agrave; &ldquo;Jagermeister&rdquo; &ndash;&nbsp; v&agrave;o năm 1934.</p>\r\n\r\n<p>J&auml;germeister sử dụng phổ biến l&agrave;m qu&agrave; tặng cho kh&aacute;ch h&agrave;ng vip trong tiếng Đức c&oacute; nghĩa l&agrave; &ldquo;master hunter&rdquo; &ndash; thợ săn bậc thầy. C&oacute; thể hiểu đơn giản l&agrave; thợ săn, l&agrave; người l&agrave;m chủ cuộc săn l&ugrave;ng. Danh từ n&agrave;y được d&ugrave;ng như một chức danh d&agrave;nh cho quan chức cấp cao phụ tr&aacute;ch những việc li&ecirc;n quan đến săn bắn đ&atilde; tồn tại nhiều thế kỉ.</p>\r\n', '2800000.00', 100000, 'RPC_10-300x300.png', '[\"RPC_10-300x3001.png\",\"RPC_01-300x300.png\"]', 3, 1, 4, 1, 1493983674),
(15, 17, 'RƯỢU SENAC NHO', '<p><strong>Rượu vang nổ T&acirc;y Ban Nha Fogoso Azul</strong>&nbsp;l&agrave; loại rượu Sparkling Wine sử dụng cho m&ugrave;a h&egrave; tại T&acirc;y Ban Nha , n&oacute; l&agrave; loại rượu hương vị tr&aacute;i c&acirc;y nhẹ nh&agrave;ng v&agrave; l&agrave; loại ph&ugrave; hợp cho c&aacute;c sự kiện x&atilde; hội v&agrave; tiệc cưới, mọi người tr&ecirc;n khắp thế giới coi n&oacute; như l&agrave; một m&oacute;n đồ uống cho c&aacute;c bữa tr&aacute;ng miệng (Dessert Wines)</p>\r\n\r\n<p><strong>Hương</strong>: loại rượu vang cho ph&eacute;p ch&uacute;ng ta cảm nhận được sự thu h&uacute;t của m&ugrave;i hoa trắng T&acirc;y Ban Nha tới c&aacute;c cảm nhận về cam chanh v&agrave; đ&agrave;o</p>\r\n\r\n<p><strong>Vị</strong>: khi bạn nếm trong hợp đầu ti&ecirc;n th&igrave; dường như rượu vang đưa tới sự ngọt ng&agrave;o, rồi ph&aacute;t triển từ từ độ chua nhẹ trong v&ograve;m miệng sau đ&oacute; l&agrave; cảm gi&aacute;c tươi mới v&agrave; h&agrave;i h&agrave;o đối với rượu vang</p>\r\n\r\n<p><strong>Hậu vị</strong>: l&acirc;ng l&acirc;ng , k&eacute;o d&agrave;i</p>\r\n', '1500000.00', 180000, 'RPC_57-300x300.png', '[\"RPC_57-300x3001.png\",\"RV_33-300x300.png\",\"RV_31-300x300.png\",\"RV_32-300x300.png\"]', 5, 1, 4, 1, 1493983674),
(24, 10, 'RƯỢU ĐỎ ARGENTINA', '<ul>\r\n	<li>ĐẶC ĐIỂM:</li>\r\n	<li>Xuất Xứ: Argentina</li>\r\n	<li>Giống nho: Malbec</li>\r\n	<li>Nồng Độ:14.5%</li>\r\n	<li>Dung t&iacute;ch: 750ml</li>\r\n	<li>TH&Ocirc;NG TIN CHI TIẾT:</li>\r\n	<li>Rượu vang Trapiche Manos Malbec&nbsp;l&agrave; d&ograve;ng rượu thương hiệu của Trapiche, thương hiệu đi đầu trong lĩnh vực sản xuất rượu vang ở Argentina, lu&ocirc;n cống hiến tạo n&ecirc;n những chai rượu vang thượng hạng thể hiện trọn vẹn sự phong ph&uacute; v&agrave; gi&agrave;u c&oacute; của thi&ecirc;n nhi&ecirc;n v&agrave; con người Argentina.</li>\r\n	<li>Nho Malbec để l&agrave;m n&ecirc;n chai rượu vang Argentina&nbsp;Trapiche Manos Malbec tuyệt vời được trồng tại thung lũng Uco, v&ugrave;ng trồng nho Malbec tuyệt vời nhất ở Mendoza, Argentina. Nho được thu hoạch bằng tay v&agrave; được chia v&agrave;o c&aacute;c th&ugrave;ng gỗ nhỏ chuyển tới nh&agrave; m&aacute;y để đảm bảo chất lượng tốt nhất.</li>\r\n	<li>Vang c&oacute; hương vị hoa quả đậm đ&agrave;, m&ugrave;i thơm nồng n&agrave;n của c&aacute;c quả anh đ&agrave;o, mận, nho kh&ocirc;, d&acirc;u đen v&agrave; vani, ti&ecirc;u đen, thuốc l&aacute; v&agrave; da thuộc. Khi d&ugrave;ng k&egrave;m c&aacute;c m&oacute;n b&iacute;t tết, gan ngỗng v&agrave; thịt nướng sẽ l&agrave; một sự lựa chọn tuyệt vời.</li>\r\n</ul>\r\n', '3200000.00', 0, 'RV_373-300x300.png', '[\"RV_382-300x300.png\",\"RV_380-300x300.png\",\"RV_373-300x3001.png\"]', 39, 1, 9, 2, 1493983674),
(25, 11, 'RƯỢU PHÁP BOUCHARD', '<p>Rượu xuất hiện với m&agrave;u v&agrave;ng xanh l&aacute; c&acirc;y nổi bật. Mở rượu lan toả hương thơm tinh tế của bạc h&agrave; c&ugrave;ng m&ugrave;i hương của tr&aacute;i c&acirc;y trắng. Thưởng thức rượu cảm nhận hương vị h&agrave;i ho&agrave; của vị kho&aacute;ng v&agrave; vị kh&oacute;i. Hậu vị tươi mới v&agrave; rất quyến rũ</p>\r\n\r\n<p>C&oacute; thể kết hợp với thức ăn: Thịt g&agrave;, thịt ba chỉ kho kiểu Nhật (Kakuni), g&agrave; nướng với c&agrave; chua v&agrave; mật ong, hải sản vỏ cứng (t&ocirc;m, cua, ghẹ&hellip;), ph&ocirc; mai Reblochon&hellip;</p>\r\n', '1500000.00', 150000, 'RV_189-300x300.png', '[\"Hinh-Chuan-Logo-Web-1-Recovered-10-300x300.jpg\",\"Hinh-Chuan-Logo-Web-1-2-300x300.jpg\",\"RV_189-300x3001.png\"]', 5, 2, 9, 2, 1493983674),
(26, 12, 'RƯỢU HỒNG SPARKING', '<p>Tosti1820 sản xuất vang v&agrave; vang sủi từ năm 1820, với 200 năm lịch sử l&agrave;m rượu vang đ&atilde; tạo danh tiếng chất lượng của gia đ&igrave;nh 7 thế hệ Bosca. Di sản n&agrave;y được tạo n&ecirc;n bởi truyền thống l&acirc;u đời v&agrave; văn h&oacute;a trong sản xuất rượu vang với việc c&aacute;c vườn nho được trồng ở những khu vực tốt nhất v&agrave; những phương ph&aacute;p sản xuất ph&ugrave; hợp nhất. Với kinh nghiệm l&acirc;u năm đ&atilde; gi&uacute;p Tosti1820 sản xuất c&aacute;c loại vang sủi với sự đặc trưng kh&aacute;c biệt.</p>\r\n', '500000.00', 0, 'pink-Web-4-300x300.jpg', '[\"veuve-rose-Web-4-300x300.jpg\",\"jeio-hoongf-Web-4-300x300.jpg\",\"pink-Web-4-300x3001.jpg\"]', 8, 1, 9, 2, 1493983674),
(27, 14, 'RƯỢU VODKA BELUGA', '<p>Rượu Beluga Gold Line l&agrave; d&ograve;ng rượu cao cấp nhất của h&atilde;ng&nbsp;Synergy, được ra đời v&agrave;o năm 2004. Với phong c&aacute;ch đẹp độc lạ, cao cấp, sang trọng</p>\r\n\r\n<p>Th&agrave;nh phần ch&iacute;nh của rượu l&agrave; l&uacute;a mạch v&agrave; nguồn nước tinh khiết trong v&ugrave;ng, thuộc d&ograve;ng vodka đầu ti&ecirc;n tr&ecirc;n thế giới được ủ d&ograve;ng trong 90 ng&agrave;y. Ch&iacute;nh v&igrave; thế đ&atilde; tạo l&ecirc;n m&ugrave;i vị ri&ecirc;ng biệt.</p>\r\n\r\n<p>Một trong những yếu tố đặc trưng ti&ecirc;u biểu của Beluga l&agrave; c&ocirc;ng thức sử dụng nước tinh khiết từ d&ograve;ng Siberian v&agrave; tinh dầu mạch nha được l&agrave;m từ c&aacute;c enzim mạch nha đ&atilde; qua tinh luyện tạo n&ecirc;n vị ngon đặc trưng cho Beluga.</p>\r\n\r\n<p>M&ugrave;i vị: tươi m&aacute;t, thanh khiết với hương thơm tinh tế của l&uacute;a mạch, mạch nha, thảo dược n&uacute;i đồi.</p>\r\n\r\n<p>Hương vị: nhẹ nh&agrave;ng, thanh mượt với kết cấu h&agrave;i h&ograve;a v&agrave; sự ngọt ng&agrave;o tinh khiết</p>\r\n\r\n<p>Hậu vị: k&eacute;o d&agrave;i</p>\r\n', '3000000.00', 400000, 'RM_234-300x300.png', '[\"RM_231-300x300.png\",\"RM_230-300x300.png\",\"RM_234-300x3001.png\",\"RM_232-300x300.png\"]', 8, 3, 9, 2, 1493983674),
(49, 13, 'RƯỢU CHIVAS 18', '<p>Rượu&nbsp;<em><strong>Chivas Regal 18 Year Old Mizunara Cask Finish</strong></em>&nbsp;l&agrave; sự pha trộn tuyệt vời của rượu whisky từ c&aacute;c nh&agrave; m&aacute;y chưng cất tốt nhất của Scotland. N&oacute; được ủ trong suốt 18 năm, bao gồm cả giai đoạn ho&agrave;n thiện trong những chiếc th&ugrave;ng Mizunara được chế t&aacute;c cẩn thận. Kết quả l&agrave; một loại rượu whisky mượt m&agrave;, tr&aacute;i c&acirc;y v&agrave; cay nồng mang đến m&ugrave;i quế, vani, mật ong v&agrave; c&aacute;c loại gia vị tinh tế tr&ecirc;n mũi, tiếp theo l&agrave; s&ocirc; c&ocirc; la đen, mứt mơ v&agrave; nhiều quế hơn tr&ecirc;n v&ograve;m miệng. Gia vị gừng nhẹ nh&agrave;ng v&agrave; tổ ong đọng lại sau khi kết th&uacute;c. Đ&acirc;y l&agrave; bản ph&aacute;t h&agrave;nh ho&agrave;n to&agrave;n mới hiện chỉ c&oacute; ở Nhật Bản.</p>\r\n', '2000000.00', 600000, 'chivas-18-Web-4.jpg', '[\"RM_110-300x300.png\",\"RM_112-300x300.png\",\"chivas-18-Web-41.jpg\"]', 5, 1, 14, 3, 1610102077);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `slider`
--

CREATE TABLE `slider` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `image_link` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `link` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `sort_order` int(11) NOT NULL,
  `created` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `slider`
--

INSERT INTO `slider` (`id`, `name`, `image_link`, `link`, `sort_order`, `created`) VALUES
(1, '1', 'b.jpg', '#', 1, '2023-02-10 15:24:43'),
(4, '2', 'vangchuan-vn-banner-1.jpg', '#', 4, '2023-02-10 15:24:43');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `transaction`
--

CREATE TABLE `transaction` (
  `id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `user_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_phone` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_address` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `message` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `amount` decimal(15,2) NOT NULL DEFAULT 0.00,
  `payment` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `created` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `catalog`
--
ALTER TABLE `catalog`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `slider`
--
ALTER TABLE `slider`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `catalog`
--
ALTER TABLE `catalog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT cho bảng `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT cho bảng `slider`
--
ALTER TABLE `slider`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `transaction`
--
ALTER TABLE `transaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
