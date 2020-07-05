/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50724
Source Host           : localhost:3306
Source Database       : larashop_2

Target Server Type    : MYSQL
Target Server Version : 50724
File Encoding         : 65001

Date: 2020-07-06 06:39:01
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `books`
-- ----------------------------
DROP TABLE IF EXISTS `books`;
CREATE TABLE `books` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `author` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `publisher` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cover` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(8,2) NOT NULL,
  `views` int(10) unsigned NOT NULL DEFAULT '0',
  `stock` int(10) unsigned NOT NULL DEFAULT '0',
  `status` enum('PUBLISH','DRAFT') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of books
-- ----------------------------
INSERT INTO books VALUES ('2', 'How to become great man', 'how-to-become-great-man', 'The book description', 'Noone', 'Nopublisher', 'book-covers/riSvIG5fsoNOCE0OhwIdNh3EewgYuCLAqEPSaV9w.png', '390000.00', '0', '330', 'PUBLISH', '1', '1', null, '2018-07-26 14:20:14', '2018-10-02 15:49:45', '2018-10-02 15:49:45');
INSERT INTO books VALUES ('4', 'How to become ninja Developer', 'how-to-become-ninja-developer', 'Descriptions goes here', 'Muhammad Azamuddin', 'Indie Publisher', 'book-covers/2x9OEHtj57kVp9UZe9Av39TBMNphRw8FrEh4Nium.png', '239000.00', '0', '9', 'PUBLISH', '1', null, null, '2018-10-02 14:06:39', '2018-10-02 15:42:41', null);

-- ----------------------------
-- Table structure for `book_category`
-- ----------------------------
DROP TABLE IF EXISTS `book_category`;
CREATE TABLE `book_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `book_id` int(10) unsigned DEFAULT NULL,
  `category_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `book_category_book_id_foreign` (`book_id`),
  KEY `book_category_category_id_foreign` (`category_id`),
  CONSTRAINT `book_category_book_id_foreign` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`),
  CONSTRAINT `book_category_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of book_category
-- ----------------------------
INSERT INTO book_category VALUES ('2', '2', '5', null, null);
INSERT INTO book_category VALUES ('4', '4', '5', null, null);
INSERT INTO book_category VALUES ('5', '4', '6', null, null);

-- ----------------------------
-- Table structure for `book_order`
-- ----------------------------
DROP TABLE IF EXISTS `book_order`;
CREATE TABLE `book_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL,
  `book_id` int(10) unsigned NOT NULL,
  `quantity` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `book_order_order_id_foreign` (`order_id`),
  KEY `book_order_book_id_foreign` (`book_id`),
  CONSTRAINT `book_order_book_id_foreign` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`),
  CONSTRAINT `book_order_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of book_order
-- ----------------------------
INSERT INTO book_order VALUES ('2', '2', '2', '2', '2018-07-26 07:00:00', '2018-07-26 07:00:00');
INSERT INTO book_order VALUES ('3', '1', '2', '1', '2018-07-26 07:00:00', '2018-07-26 07:00:00');

-- ----------------------------
-- Table structure for `categories`
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'berisi nama file image saja tanpa path',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO categories VALUES ('2', 'Programming', 'programming', 'category_images/xbSTfwqPP6dE8GiTaCXTu9L1MmsFkxVmVRA6N4FE.png', '1', '24', null, null, '2018-07-16 11:04:48', '2020-07-05 09:33:09');
INSERT INTO categories VALUES ('3', 'Hardware', 'hardware', 'category_images/sCYd3L9ZHPUa7bnTWIjaTDO3RWzCwfBPq5qbQL3h.jpeg', '1', '1', null, null, '2018-07-23 10:21:00', '2018-07-26 14:18:13');
INSERT INTO categories VALUES ('4', 'Ilmiiah', 'ilmiiah', 'category_images/ej14L2H7HLHcvCFGZoT9GwTb2rX9nmEUNyKkEXKZ.jpeg', '1', null, null, null, '2018-07-23 10:21:15', '2018-07-23 10:21:15');
INSERT INTO categories VALUES ('5', 'Self Development', 'self-development', 'category_images/nE9xMN84MaKeHyVG1jcwPF1ChOUvaYzGXjSI19Mu.png', '1', null, null, null, '2018-07-26 14:18:50', '2018-07-26 14:18:50');
INSERT INTO categories VALUES ('6', 'Business', 'business', 'category_images/vLhVcc7mSOm5WzdxEifRqbj41KAwrxvB4qfEEkRh.png', '1', null, null, null, '2018-07-26 14:21:27', '2018-07-26 14:21:27');
INSERT INTO categories VALUES ('7', 'Joseph Mueller', 'incidunt-ut-sint-necessitatibus-aut', '/tmp/f22bc6dd11e9659a530ecdf0b594a542.jpg', '1', null, null, '2018-10-02 14:10:14', '2018-08-06 15:29:40', '2018-10-02 14:10:14');
INSERT INTO categories VALUES ('8', 'Alize Jacobs', 'voluptatem-aut-explicabo-voluptatum-est', '/tmp/7eeba2afaad844803b7029f670058def.jpg', '1', null, null, '2018-10-02 14:10:19', '2018-08-06 15:29:40', '2018-10-02 14:10:19');
INSERT INTO categories VALUES ('9', 'Shaniya Collins', 'consequatur-nihil-saepe-facilis-hic', '/tmp/75f3166283222da447dc60d790ba8fec.jpg', '1', null, null, '2018-10-02 14:10:09', '2018-08-06 15:29:40', '2018-10-02 14:10:09');
INSERT INTO categories VALUES ('10', 'Mrs. Magdalena Graham I', 'necessitatibus-ut-assumenda-et-eligendi-aut', '/tmp/96ec46942ad5c6873f7c3e3bedc031bf.jpg', '1', null, null, '2018-10-02 14:10:23', '2018-08-06 15:29:40', '2018-10-02 14:10:23');
INSERT INTO categories VALUES ('12', 'Ronny Emmerich', 'quidem-placeat-cum-et-ducimus-culpa', '/tmp/30d7c88ce5ec62b924e5baed6056ff73.jpg', '1', null, null, '2018-10-02 14:09:59', '2018-08-06 15:29:40', '2018-10-02 14:09:59');
INSERT INTO categories VALUES ('13', 'Maximus Cole', 'et-eum-eum-cupiditate', '/tmp/01c1d77b125096c1231390022fe64f42.jpg', '1', null, null, '2018-10-02 14:10:05', '2018-08-06 15:29:40', '2018-10-02 14:10:05');
INSERT INTO categories VALUES ('14', 'Rosella Mayert', 'omnis-quis-ut-esse-sapiente-ea', '/tmp/7115ee98fbad181ee81a02e7b5273fa1.jpg', '1', null, null, null, '2018-08-06 15:29:40', '2018-08-06 15:29:40');
INSERT INTO categories VALUES ('15', 'Trinity Sawayn', 'dignissimos-facilis-quam-non-fugiat-voluptatibus-inventore-reiciendis', '/tmp/d2d88e81c0661535fd3727813e348507.jpg', '1', null, null, null, '2018-08-06 15:29:40', '2018-08-06 15:29:40');
INSERT INTO categories VALUES ('16', 'Delpha Cruickshank', 'soluta-aperiam-sint-vel-voluptatem-hic-ut', '/tmp/9e46dad5b71f00b2013ea311d77ba0a4.jpg', '1', null, null, null, '2018-08-06 15:29:40', '2018-08-06 15:29:40');
INSERT INTO categories VALUES ('17', 'Dr. Harvey Walsh Sr.', 'qui-dolor-fuga-tenetur', '/tmp/ede39441f7366073b79cf11aab7f5df0.jpg', '1', null, null, null, '2018-08-06 15:30:12', '2018-08-06 15:30:12');
INSERT INTO categories VALUES ('18', 'Andres Douglas Sr.', 'nobis-repellat-vel-voluptate-impedit', '/tmp/0367a691a496b71e08889e98b60b41d6.jpg', '1', null, null, null, '2018-08-06 15:30:12', '2018-08-06 15:30:12');
INSERT INTO categories VALUES ('19', 'Dallin Daugherty', 'pariatur-qui-dolorem-corporis-autem', '/tmp/16cc9d8af2d9ca2bddb5fa6fee6a954b.jpg', '1', null, null, null, '2018-08-06 15:30:12', '2018-08-06 15:30:12');
INSERT INTO categories VALUES ('20', 'Gerald Bosco', 'tenetur-amet-ducimus-sunt-reiciendis-soluta-eaque-quia-voluptatem', '/tmp/9b05f35d08513a902d34a30187b0aad3.jpg', '1', null, null, null, '2018-08-06 15:30:12', '2018-08-06 15:30:12');
INSERT INTO categories VALUES ('21', 'Tiffany Lebsack', 'nesciunt-dignissimos-quam-voluptatem-quaerat-rerum', '/tmp/6b4353696d6a2d3ba7e9342ee4c50c9f.jpg', '1', null, null, null, '2018-08-06 15:30:12', '2018-08-06 15:30:12');
INSERT INTO categories VALUES ('22', 'Myra Durgan', 'voluptas-labore-perspiciatis-facilis-tenetur-laudantium-perferendis', '/tmp/1549161129e9392219930177817cfc0e.jpg', '1', null, null, null, '2018-08-06 15:30:12', '2018-08-06 15:30:12');
INSERT INTO categories VALUES ('23', 'Laila Brekke', 'possimus-sunt-consequuntur-recusandae-similique-nam', '/tmp/332b4ab741b09504c4d19058ec65aef3.jpg', '1', null, null, null, '2018-08-06 15:30:12', '2018-08-06 15:30:12');
INSERT INTO categories VALUES ('24', 'Landen Olson', 'commodi-aut-et-ut-blanditiis', '/tmp/c01fad5a4e7e1281b9d49810692a3a0b.jpg', '1', null, null, null, '2018-08-06 15:30:12', '2018-08-06 15:30:12');
INSERT INTO categories VALUES ('25', 'Prof. Coby Lehner Jr.', 'totam-inventore-placeat-accusamus-adipisci-sunt-minima-sed', '/tmp/f01c4d9b11d50a21adf0a6326b8454cd.jpg', '1', null, null, null, '2018-08-06 15:30:12', '2018-08-06 15:30:12');
INSERT INTO categories VALUES ('26', 'Guillermo Cummerata', 'doloribus-et-reprehenderit-dignissimos-praesentium-nesciunt-iste-repudiandae', '/tmp/70e45be7923b272e15f4caf767a089ac.jpg', '1', null, null, null, '2018-08-06 15:30:12', '2018-08-06 15:30:12');
INSERT INTO categories VALUES ('27', 'Gay Wilkinson', 'repudiandae-maiores-consequatur-consequatur-repudiandae-dolor-facere', 'storage/app/public/category_images/9b69be059332ecdfb0a7f9563c6bb44d.jpg', '1', null, null, null, '2018-08-06 16:14:41', '2018-08-06 16:14:41');
INSERT INTO categories VALUES ('28', 'Miss Carmella Bergstrom Jr.', 'autem-laboriosam-et-adipisci-ducimus-rerum-impedit-et-nisi', 'storage/app/public/category_images/018b48cf42f4763f3c1032619b03056e.jpg', '1', null, null, null, '2018-08-06 16:16:05', '2018-08-06 16:16:05');

-- ----------------------------
-- Table structure for `migrations`
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO migrations VALUES ('1', '2014_10_12_000000_create_users_table', '1');
INSERT INTO migrations VALUES ('2', '2014_10_12_100000_create_password_resets_table', '1');
INSERT INTO migrations VALUES ('6', '2018_07_10_115805_penyesuaian_table_users', '2');
INSERT INTO migrations VALUES ('10', '2018_07_16_020754_create_table_categories', '3');
INSERT INTO migrations VALUES ('25', '2018_07_21_203443_create_books_table', '4');
INSERT INTO migrations VALUES ('26', '2018_07_21_204915_create_book_category_table', '5');
INSERT INTO migrations VALUES ('28', '2018_07_25_075101_create_orders_table', '6');
INSERT INTO migrations VALUES ('29', '2018_07_25_082000_create_book_order_table', '7');

-- ----------------------------
-- Table structure for `orders`
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `total_price` double(8,2) unsigned NOT NULL,
  `invoice_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('SUBMIT','PROCESS','FINISH','CANCEL') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_user_id_foreign` (`user_id`),
  CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO orders VALUES ('1', '7', '390000.00', '201807060001', 'FINISH', '2018-07-06 07:00:00', '2018-07-06 07:00:00');
INSERT INTO orders VALUES ('2', '14', '780000.00', '201807250002', 'PROCESS', '2018-07-26 07:00:00', '2018-10-02 15:50:04');

-- ----------------------------
-- Table structure for `password_resets`
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO users VALUES ('1', 'Muhammad Azamuddin', 'administrator@larashop.test', '$2y$10$CaHcu3RjHs2Yr1c.hgFOVeM77aJ2soN7JUBLyLyL1NZGMY2UqY3Vq', 'JVPtH8RguhTsoHhlnTi9Iv4sHuQL3vV3pWcz0sOSUqc9DAyXlstgmYaG1NPV', '2018-07-11 09:44:43', '2018-10-13 22:11:21', 'administrator', '[\"ADMIN\"]', 'Jalan Harapan Mulya III no 7\r\nKel Harapan Mulya, Kec Kemayoran', '85781107766', 'avatars/wR1CrdcdvXRkqPeF4cOJkjccYjWLQ4YV4Yj41DaQ.jpeg', 'ACTIVE');
INSERT INTO users VALUES ('4', 'Muhammad Azamuddin', 'azamuddin@live.com', 'bismillah', null, '2018-07-12 16:17:37', '2018-07-15 10:25:08', 'azamuddin91', '[\"ADMIN\",\"CUSTOMER\"]', 'Jalan Haji Sarmili', '0871111111', 'avatars/10o6t1i0mRM2BTNHnTYKrh69mSs68li91EDSmoXs.jpeg', 'ACTIVE');
INSERT INTO users VALUES ('7', 'Nadia Nurul Mila', 'nadia@gmail.com', 'bismillah', null, '2018-07-13 14:59:30', '2018-07-15 16:13:02', 'nadia', '[\"STAFF\",\"CUSTOMER\"]', null, null, null, 'INACTIVE');
INSERT INTO users VALUES ('8', 'Muhammad Azamuddin', 'hana@humaira.com', 'bismillah', null, '2018-07-14 09:47:08', '2018-10-02 15:42:05', 'hana', '[\"ADMIN\",\"STAFF\"]', 'Jalan Haji Sarmili 34', '87808490517', null, 'ACTIVE');
INSERT INTO users VALUES ('9', 'User Empat', 'user4@gmail.com', 'bismillah', null, '2018-07-14 09:50:04', '2018-07-14 09:50:04', 'user4', '[\"CUSTOMER\"]', null, null, null, 'ACTIVE');
INSERT INTO users VALUES ('10', 'User Lima', 'user5@gmail.com', 'bismillah', null, '2018-07-14 09:53:48', '2018-07-14 09:53:48', 'user5', '[\"ADMIN\"]', null, null, null, 'ACTIVE');
INSERT INTO users VALUES ('11', 'User Enam', 'user6@gmail.com', 'bismillah', null, '2018-07-14 09:55:38', '2018-07-14 09:55:38', 'user6', '[\"CUSTOMER\"]', null, null, null, 'ACTIVE');
INSERT INTO users VALUES ('12', 'Ridwan Mutaffaq', 'ridwan@gmail.com', 'bismillah', null, '2018-07-14 12:38:30', '2018-07-14 12:38:30', 'ridwan', '[\"STAFF\"]', 'Jalan Harapan Mulya III no 7\r\nKel Harapan Mulya, Kec Kemayoran', '85781107766', null, 'ACTIVE');
INSERT INTO users VALUES ('14', 'Habib Asagaf', 'habib@gmail.com', 'bismillah', null, '2018-07-15 11:09:37', '2018-07-15 11:09:37', 'habib', '[\"ADMIN\",\"STAFF\"]', 'Jalan Harapan Mulya III no 7\r\nKel Harapan Mulya, Kec Kemayoran', '85781107766', 'avatars/wg7lugTyeRLtfjzzqr8vpRklOaOSHY99EdLFjTyy.jpeg', 'ACTIVE');
INSERT INTO users VALUES ('15', 'Iqbal Kholis', 'iqbal@gmail.com', 'bismillah', null, '2018-07-15 11:10:15', '2018-07-15 11:10:15', 'iqbal', '[\"ADMIN\"]', 'Jl Dr Wahidin No 1. Kompleks Kementerian Keuangan. Gedung Djuand\r\nKel Harapan Mulya, Kec Kemayoran', '85781150352', null, 'ACTIVE');
INSERT INTO users VALUES ('17', 'User ABC', 'userabc@gmail.com', 'bismillah', null, '2018-07-15 17:03:19', '2018-07-15 17:03:19', 'userabc', '[\"STAFF\"]', 'Jalan Harapan Mulya III no 7\r\nKel Harapan Mulya, Kec Kemayoran', '85781107766', null, 'ACTIVE');
INSERT INTO users VALUES ('18', 'user def', 'userdef@gmail.com', 'bismillah', null, '2018-07-15 17:03:47', '2018-07-15 17:03:47', 'userdef', '[\"ADMIN\",\"STAFF\"]', 'Jalan Harapan Mulya III no 7\r\nKel Harapan Mulya, Kec Kemayoran', '85781107766', null, 'ACTIVE');
INSERT INTO users VALUES ('19', 'User Sepuluh', 'user10@gmail.com', 'bismillah', null, '2018-07-31 16:29:52', '2018-07-31 16:29:52', 'user10', '[\"STAFF\"]', 'Jalan Harapan Mulya III no 7\r\nKel Harapan Mulya, Kec Kemayoran', '085781107766', 'avatars/7Rsd6DkvGWqyq2pfYqQTDRIRzpLI74nCKynGU64u.png', 'ACTIVE');
INSERT INTO users VALUES ('20', 'User Sebelas', 'user11@gmail.com', '$2y$10$e3uPymGhFeCcv20jzw1gvejgjSbWgMUoByLlV5RmH0lDjNMxD7pMm', '4yNWujTy6VCCXhxFB0SBVMIrHmfzQ44seRgQ0QZbOQedrlHpjmYxqR9qiXxr', '2018-07-31 16:34:57', '2018-07-31 16:34:57', 'user11', '[\"STAFF\"]', 'Jalan Harapan Mulya III no 7\r\nKel Harapan Mulya, Kec Kemayoran', '85781107766', 'avatars/lIjmJvoWLaIOtihHKQjQhzRlwTCvMmSb0B2WNacy.png', 'ACTIVE');
INSERT INTO users VALUES ('21', 'User Biasa', 'userbiasa@gmail.com', '$2y$10$dFe7avNTz6N1aXUWhKUJZ.1HqrrxtCuBKapADehUeQoQpPKYXOkiS', 'A8Ta3nEgHuv135Qc2IeHRPbVaMyPY4f5SoPjWVMngmG0n3MNOLYGHAOfHAJF', '2018-07-31 16:39:11', '2018-07-31 16:39:11', 'userbiasa', '[\"CUSTOMER\"]', 'Jalan Harapan Mulya III no 7\r\nKel Harapan Mulya, Kec Kemayoran', '85781107766', 'avatars/Cvkp78zLjkP7p6uHQCup3a5oU23i64z7ulNHYJYE.png', 'ACTIVE');
INSERT INTO users VALUES ('22', 'Dhermaga Surya Wicaksono', 'dhermaga.s@gmail.com', '$2y$10$xm582xQYnHPsGc/.1Mx5/ua43lVk8NAv.vOh06uHlyMFCUCLzU8tG', null, '2018-10-02 14:05:11', '2018-10-02 14:05:33', 'dhermaga', '[\"STAFF\"]', 'Jalan Haji Sarmili 34', '87808490517', 'avatars/VpaPN4EUezqp6L2U3S5BQkF7IGCuWhosZxoLUNFZ.png', 'ACTIVE');
INSERT INTO users VALUES ('23', 'Danar Gumilang Putera', 'danar.gp@gmail.com', '$2y$10$p56x0qCNOuuYr23XT6PIu.6yWpCdN9nRuw1YTwBDXzyVuUquMicFm', null, '2018-10-02 15:41:34', '2018-10-02 15:41:34', 'danar.gp', '[\"STAFF\"]', 'Jalan Haji Sarmili 34', '87808490517', 'avatars/DGjJ39VhPJkGqdx9M04GX4n9fST18ONduodKFzmK.png', 'ACTIVE');
INSERT INTO users VALUES ('24', 'admin', 'admin@larashop.test', '$2y$10$Wnhhenn2gwW3TAt0T71Gbe6724WqK1W5bEw9XIQUZUe0fBD4l0umK', null, '2018-10-02 15:41:34', '2018-10-02 15:41:34', 'admin', '[\"ADMIN\"]', 'Tiban', '1234567890', null, 'ACTIVE');
INSERT INTO users VALUES ('25', 'Muhamad Sahyudi', 'muhamadsahyudi@gmail.com', '$2y$10$1AE4TiryrBJz1G.7gViIoe6j2kLjjuhDddZ4ueuuMOzZuM9Bb9W9G', null, '2020-07-05 11:51:12', '2020-07-05 11:51:12', 'sahyudi_', '[\"ADMIN\"]', 'tiban masyeba permain tahap 1', '1234567890', 'avatars/n4w4x3xpglNxFZIGxmOzv4T8nj0c5mMqTbLybQIy.jpeg', 'ACTIVE');
