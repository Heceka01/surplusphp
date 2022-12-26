-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 26 Ara 2022, 21:22:10
-- Sunucu sürümü: 8.0.31
-- PHP Sürümü: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `surplus`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `calmalistesi`
--

CREATE TABLE `calmalistesi` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `ad` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_turkish_ci;

--
-- Tablo döküm verisi `calmalistesi`
--

INSERT INTO `calmalistesi` (`id`, `user_id`, `ad`) VALUES
(1, 1, 'yeni çalma listesi 1'),
(2, 1, 'yeni çalma listesi 2'),
(8, 2, 'yeni çalma listesi 1'),
(9, 2, 'yeni çalma listesi 2'),
(13, 1, 'yeni çalma listesi 3'),
(14, 1, 'yeni çalma listesi 4'),
(15, 3, 'yeni çalma listesi 1'),
(20, 3, 'Yeni Çalma Listesi 2');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `calmalistesisarkilar`
--

CREATE TABLE `calmalistesisarkilar` (
  `id` int NOT NULL,
  `sarki_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_turkish_ci;

--
-- Tablo döküm verisi `calmalistesisarkilar`
--

INSERT INTO `calmalistesisarkilar` (`id`, `sarki_id`) VALUES
(1, 1),
(13, 4),
(9, 5),
(2, 1),
(13, 2),
(2, 3),
(14, 5),
(15, 1),
(8, 3),
(9, 3),
(15, 4),
(0, 1),
(0, 2),
(0, 3),
(0, 4),
(0, 5),
(0, 6),
(0, 7),
(0, 8),
(0, 9),
(0, 10),
(0, 11),
(0, 12),
(0, 13),
(0, 14),
(0, 15),
(0, 16),
(0, 17),
(0, 18),
(0, 18),
(0, 19),
(0, 20),
(0, 21),
(0, 22),
(0, 23),
(0, 24),
(0, 25),
(0, 26),
(0, 27),
(0, 28),
(0, 29),
(0, 30),
(0, 31),
(0, 32),
(0, 33),
(0, 34),
(0, 35),
(0, 36),
(0, 37),
(0, 38),
(0, 39),
(0, 40),
(15, 3),
(20, 3);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kategori`
--

CREATE TABLE `kategori` (
  `id` int NOT NULL,
  `ad` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_turkish_ci;

--
-- Tablo döküm verisi `kategori`
--

INSERT INTO `kategori` (`id`, `ad`) VALUES
(1, 'Rap'),
(2, 'Pop'),
(3, 'Rock'),
(4, 'Arabesk');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `sarkilar`
--

CREATE TABLE `sarkilar` (
  `id` int NOT NULL,
  `kategori_id` int NOT NULL,
  `sarkici` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_turkish_ci NOT NULL,
  `sarki_ad` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_turkish_ci NOT NULL,
  `uzunluk` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_turkish_ci NOT NULL,
  `resim_yolu` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_turkish_ci;

--
-- Tablo döküm verisi `sarkilar`
--

INSERT INTO `sarkilar` (`id`, `kategori_id`, `sarkici`, `sarki_ad`, `uzunluk`, `resim_yolu`) VALUES
(1, 4, 'Müslüm Gürses', 'Sensiz Olmaz', '4:34', 'muslumgurses'),
(2, 2, 'Edis', 'Martilar', '2:46', 'edis'),
(3, 1, 'Hidra', 'Akış', '3:18', 'hidra'),
(4, 3, 'Skapova', 'Son Arzum', '3:24', 'skapova'),
(5, 1, 'Şehinşah', 'Karma', '5:13', 'sehinsah'),
(6, 2, 'Serdar Ortaç', 'Poşet', '5:16', 'serdarortac'),
(7, 1, 'Ceza', 'Neyim Var Ki', '3:27', 'ceza'),
(8, 1, 'Joker', 'Problem', '4:38', 'joker'),
(9, 1, 'Ben Fero', 'Demet Akalın', '3:47', 'benfero'),
(10, 1, 'Ceza', 'Holocaust', '3:28', 'ceza'),
(11, 1, 'Uzi', 'Makina', '3:52', 'uzi'),
(12, 1, 'Alizade', 'Anormal', '1:54', 'alizade'),
(13, 1, 'Alizade', 'Kalbin Bana Kaldı', '2:25', 'alizade'),
(14, 1, 'Alizade', 'Beynimi ..', '2:25', 'alizade'),
(15, 4, 'Orhan Gencebay', 'Hatasız Kul Olmaz', '5:09', 'orhangencebay'),
(16, 4, 'Ferdi Tayfur', 'Günaha Girme', '5:57', 'ferditayfur'),
(17, 4, 'Müslüm Gürses', 'Tanrı İstemezse', '5:40', 'muslumgurses'),
(18, 4, 'İbrahim Tatlıses', 'Mutlu Ol Yeter', '4:24', 'ibrahimtatlises'),
(19, 4, 'Cengiz Kurtoğlu', 'Hain Geceler', '5:40', 'cengizkurtoglu'),
(20, 4, 'Kibariye', 'Kim Bilir', '4:07', 'kibariye'),
(21, 4, 'Bergen', 'Acıların Kadını', '3:35', 'bergen'),
(22, 4, 'Bergen', 'Benim İçin Üzülme', '5:04', 'bergen'),
(23, 4, 'Orhan Gencebay', 'Vazgeç Gönlüm', '4:11', 'orhangencebay'),
(24, 2, 'Aleyna Tilki', 'Aşk Ateşi', '3:06', 'aleynatilki'),
(25, 2, 'Zeynep Bastık', 'Ara', '3:21', 'zeynepbastik'),
(26, 2, 'Ziynet Sali', 'Aşk Nerede', '3:22', 'ziynetsali'),
(27, 2, 'Semicenk', 'Unutmak Öyle Kolay Mı Sandın', '2:25', 'semicenk'),
(28, 2, 'KÖFN', 'Bi\' Tek Ben Anlarım', '3:43', 'kofn'),
(29, 2, 'Serdar Ortaç', 'İlaç', '3:52', 'serdarortac'),
(30, 2, 'Semicenk', 'Al Sevgilim', '3:13', 'semicenk'),
(31, 2, 'Edis', 'Yalancı', '2:33', 'edis'),
(32, 3, 'Duman', 'Elleri Ellerime', '4:15', 'duman'),
(33, 3, 'Teoman', 'Renkli Rüyalar Oteli', '6:58', 'teoman'),
(34, 3, 'Can Bonomo', 'Bulunmam Gerek', '4:19', 'canbonomo'),
(35, 3, 'Haluk Levent', 'Yollarda Bulurum Seni', '4:30', 'haluklevent'),
(36, 3, 'Duman', 'Dibine Kadar', '3:49', 'duman'),
(37, 3, 'Athena', 'Kafama Göre', '3:25', 'athena'),
(38, 3, 'Kargo', 'Yıldızların Altında', '3:35', 'kargo'),
(39, 3, 'Yüksek Sadakat', 'Ben Seni Arayamam', '4:38', 'yukseksadakat'),
(40, 3, 'Mor ve Ötesi', 'Oyunbozan', '4:40', 'morveotesi');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `uye`
--

CREATE TABLE `uye` (
  `id` int NOT NULL,
  `ad` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_turkish_ci NOT NULL,
  `soyad` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_turkish_ci NOT NULL,
  `mail` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_turkish_ci NOT NULL,
  `sifre` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_turkish_ci;

--
-- Tablo döküm verisi `uye`
--

INSERT INTO `uye` (`id`, `ad`, `soyad`, `mail`, `sifre`) VALUES
(3, 'Hamza Can', 'Korkmaz', 'hamza@mail', '123');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `calmalistesi`
--
ALTER TABLE `calmalistesi`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `calmalistesisarkilar`
--
ALTER TABLE `calmalistesisarkilar`
  ADD KEY `fk2` (`sarki_id`);

--
-- Tablo için indeksler `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `sarkilar`
--
ALTER TABLE `sarkilar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk` (`kategori_id`);

--
-- Tablo için indeksler `uye`
--
ALTER TABLE `uye`
  ADD PRIMARY KEY (`id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `calmalistesi`
--
ALTER TABLE `calmalistesi`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Tablo için AUTO_INCREMENT değeri `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Tablo için AUTO_INCREMENT değeri `sarkilar`
--
ALTER TABLE `sarkilar`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- Tablo için AUTO_INCREMENT değeri `uye`
--
ALTER TABLE `uye`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `calmalistesisarkilar`
--
ALTER TABLE `calmalistesisarkilar`
  ADD CONSTRAINT `fk2` FOREIGN KEY (`sarki_id`) REFERENCES `sarkilar` (`id`);

--
-- Tablo kısıtlamaları `sarkilar`
--
ALTER TABLE `sarkilar`
  ADD CONSTRAINT `fk` FOREIGN KEY (`kategori_id`) REFERENCES `kategori` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
