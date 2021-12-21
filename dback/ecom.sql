-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.33 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table fleet_cart_new.activations
DROP TABLE IF EXISTS `activations`;
CREATE TABLE IF NOT EXISTS `activations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT '0',
  `completed_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activations_user_id_index` (`user_id`),
  CONSTRAINT `activations_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleet_cart_new.activations: ~1 rows (approximately)
DELETE FROM `activations`;
/*!40000 ALTER TABLE `activations` DISABLE KEYS */;
INSERT INTO `activations` (`id`, `user_id`, `code`, `completed`, `completed_at`, `created_at`, `updated_at`) VALUES
	(1, 1, 'hIpENX9UeGxUV5aNfDuUMP7kppKSfzLs', 1, '2021-12-21 10:40:21', '2021-12-21 10:40:21', '2021-12-21 10:40:21');
/*!40000 ALTER TABLE `activations` ENABLE KEYS */;

-- Dumping structure for table fleet_cart_new.attributes
DROP TABLE IF EXISTS `attributes`;
CREATE TABLE IF NOT EXISTS `attributes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_set_id` int(10) unsigned NOT NULL,
  `is_filterable` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `attributes_slug_unique` (`slug`),
  KEY `attributes_attribute_set_id_index` (`attribute_set_id`),
  CONSTRAINT `attributes_attribute_set_id_foreign` FOREIGN KEY (`attribute_set_id`) REFERENCES `attribute_sets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleet_cart_new.attributes: ~0 rows (approximately)
DELETE FROM `attributes`;
/*!40000 ALTER TABLE `attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `attributes` ENABLE KEYS */;

-- Dumping structure for table fleet_cart_new.attribute_categories
DROP TABLE IF EXISTS `attribute_categories`;
CREATE TABLE IF NOT EXISTS `attribute_categories` (
  `attribute_id` int(10) unsigned NOT NULL,
  `category_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`attribute_id`,`category_id`),
  KEY `attribute_categories_category_id_foreign` (`category_id`),
  CONSTRAINT `attribute_categories_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `attribute_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleet_cart_new.attribute_categories: ~0 rows (approximately)
DELETE FROM `attribute_categories`;
/*!40000 ALTER TABLE `attribute_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `attribute_categories` ENABLE KEYS */;

-- Dumping structure for table fleet_cart_new.attribute_sets
DROP TABLE IF EXISTS `attribute_sets`;
CREATE TABLE IF NOT EXISTS `attribute_sets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleet_cart_new.attribute_sets: ~0 rows (approximately)
DELETE FROM `attribute_sets`;
/*!40000 ALTER TABLE `attribute_sets` DISABLE KEYS */;
/*!40000 ALTER TABLE `attribute_sets` ENABLE KEYS */;

-- Dumping structure for table fleet_cart_new.attribute_set_translations
DROP TABLE IF EXISTS `attribute_set_translations`;
CREATE TABLE IF NOT EXISTS `attribute_set_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_set_id` int(10) unsigned NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `attribute_set_translations_attribute_set_id_locale_unique` (`attribute_set_id`,`locale`),
  CONSTRAINT `attribute_set_translations_attribute_set_id_foreign` FOREIGN KEY (`attribute_set_id`) REFERENCES `attribute_sets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleet_cart_new.attribute_set_translations: ~0 rows (approximately)
DELETE FROM `attribute_set_translations`;
/*!40000 ALTER TABLE `attribute_set_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `attribute_set_translations` ENABLE KEYS */;

-- Dumping structure for table fleet_cart_new.attribute_translations
DROP TABLE IF EXISTS `attribute_translations`;
CREATE TABLE IF NOT EXISTS `attribute_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_id` int(10) unsigned NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `attribute_translations_attribute_id_locale_unique` (`attribute_id`,`locale`),
  CONSTRAINT `attribute_translations_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleet_cart_new.attribute_translations: ~0 rows (approximately)
DELETE FROM `attribute_translations`;
/*!40000 ALTER TABLE `attribute_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `attribute_translations` ENABLE KEYS */;

-- Dumping structure for table fleet_cart_new.attribute_values
DROP TABLE IF EXISTS `attribute_values`;
CREATE TABLE IF NOT EXISTS `attribute_values` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_id` int(10) unsigned NOT NULL,
  `position` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `attribute_values_attribute_id_index` (`attribute_id`),
  CONSTRAINT `attribute_values_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleet_cart_new.attribute_values: ~0 rows (approximately)
DELETE FROM `attribute_values`;
/*!40000 ALTER TABLE `attribute_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `attribute_values` ENABLE KEYS */;

-- Dumping structure for table fleet_cart_new.attribute_value_translations
DROP TABLE IF EXISTS `attribute_value_translations`;
CREATE TABLE IF NOT EXISTS `attribute_value_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_value_id` int(10) unsigned NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `attribute_value_translations_attribute_value_id_locale_unique` (`attribute_value_id`,`locale`),
  CONSTRAINT `attribute_value_translations_attribute_value_id_foreign` FOREIGN KEY (`attribute_value_id`) REFERENCES `attribute_values` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleet_cart_new.attribute_value_translations: ~0 rows (approximately)
DELETE FROM `attribute_value_translations`;
/*!40000 ALTER TABLE `attribute_value_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `attribute_value_translations` ENABLE KEYS */;

-- Dumping structure for table fleet_cart_new.brands
DROP TABLE IF EXISTS `brands`;
CREATE TABLE IF NOT EXISTS `brands` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `brands_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleet_cart_new.brands: ~0 rows (approximately)
DELETE FROM `brands`;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
INSERT INTO `brands` (`id`, `slug`, `is_active`, `created_at`, `updated_at`) VALUES
	(1, 'las', 1, '2021-12-21 19:26:12', '2021-12-21 19:26:12');
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;

-- Dumping structure for table fleet_cart_new.brand_translations
DROP TABLE IF EXISTS `brand_translations`;
CREATE TABLE IF NOT EXISTS `brand_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `brand_id` int(11) NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `brand_translations_brand_id_locale_unique` (`brand_id`,`locale`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleet_cart_new.brand_translations: ~0 rows (approximately)
DELETE FROM `brand_translations`;
/*!40000 ALTER TABLE `brand_translations` DISABLE KEYS */;
INSERT INTO `brand_translations` (`id`, `brand_id`, `locale`, `name`) VALUES
	(1, 1, 'en', 'las');
/*!40000 ALTER TABLE `brand_translations` ENABLE KEYS */;

-- Dumping structure for table fleet_cart_new.categories
DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int(10) unsigned DEFAULT NULL,
  `is_searchable` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`),
  KEY `categories_parent_id_foreign` (`parent_id`),
  CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleet_cart_new.categories: ~0 rows (approximately)
DELETE FROM `categories`;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` (`id`, `parent_id`, `slug`, `position`, `is_searchable`, `is_active`, `created_at`, `updated_at`) VALUES
	(2, NULL, 'electronics', NULL, 1, 1, '2021-12-21 19:34:11', '2021-12-21 19:34:11'),
	(3, NULL, 'accessories', NULL, 1, 1, '2021-12-21 19:34:28', '2021-12-21 19:34:28'),
	(4, NULL, 'audio', NULL, 1, 1, '2021-12-21 19:35:07', '2021-12-21 19:35:07'),
	(5, NULL, 'shoes', NULL, 1, 1, '2021-12-21 19:35:24', '2021-12-21 19:35:24'),
	(6, NULL, 'cell-phone', NULL, 1, 1, '2021-12-21 19:35:55', '2021-12-21 19:35:55'),
	(7, NULL, 'computers', NULL, 1, 1, '2021-12-21 19:36:26', '2021-12-21 19:36:26'),
	(8, NULL, 'smart-phones', NULL, 1, 1, '2021-12-21 19:36:42', '2021-12-21 19:36:42');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;

-- Dumping structure for table fleet_cart_new.category_translations
DROP TABLE IF EXISTS `category_translations`;
CREATE TABLE IF NOT EXISTS `category_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `category_translations_category_id_locale_unique` (`category_id`,`locale`),
  CONSTRAINT `category_translations_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleet_cart_new.category_translations: ~0 rows (approximately)
DELETE FROM `category_translations`;
/*!40000 ALTER TABLE `category_translations` DISABLE KEYS */;
INSERT INTO `category_translations` (`id`, `category_id`, `locale`, `name`) VALUES
	(2, 2, 'en', 'Electronics'),
	(3, 3, 'en', 'Accessories'),
	(4, 4, 'en', 'Audio'),
	(5, 5, 'en', 'Shoes'),
	(6, 6, 'en', 'Cell Phone'),
	(7, 7, 'en', 'Computers'),
	(8, 8, 'en', 'Smart Phones');
/*!40000 ALTER TABLE `category_translations` ENABLE KEYS */;

-- Dumping structure for table fleet_cart_new.coupons
DROP TABLE IF EXISTS `coupons`;
CREATE TABLE IF NOT EXISTS `coupons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` decimal(18,4) unsigned DEFAULT NULL,
  `is_percent` tinyint(1) NOT NULL,
  `free_shipping` tinyint(1) NOT NULL,
  `minimum_spend` decimal(18,4) unsigned DEFAULT NULL,
  `maximum_spend` decimal(18,4) unsigned DEFAULT NULL,
  `usage_limit_per_coupon` int(10) unsigned DEFAULT NULL,
  `usage_limit_per_customer` int(10) unsigned DEFAULT NULL,
  `used` int(11) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `coupons_code_index` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleet_cart_new.coupons: ~0 rows (approximately)
DELETE FROM `coupons`;
/*!40000 ALTER TABLE `coupons` DISABLE KEYS */;
/*!40000 ALTER TABLE `coupons` ENABLE KEYS */;

-- Dumping structure for table fleet_cart_new.coupon_categories
DROP TABLE IF EXISTS `coupon_categories`;
CREATE TABLE IF NOT EXISTS `coupon_categories` (
  `coupon_id` int(10) unsigned NOT NULL,
  `category_id` int(10) unsigned NOT NULL,
  `exclude` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`coupon_id`,`category_id`,`exclude`),
  KEY `coupon_categories_category_id_foreign` (`category_id`),
  CONSTRAINT `coupon_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `coupon_categories_coupon_id_foreign` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleet_cart_new.coupon_categories: ~0 rows (approximately)
DELETE FROM `coupon_categories`;
/*!40000 ALTER TABLE `coupon_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `coupon_categories` ENABLE KEYS */;

-- Dumping structure for table fleet_cart_new.coupon_products
DROP TABLE IF EXISTS `coupon_products`;
CREATE TABLE IF NOT EXISTS `coupon_products` (
  `coupon_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `exclude` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`coupon_id`,`product_id`),
  KEY `coupon_products_product_id_foreign` (`product_id`),
  CONSTRAINT `coupon_products_coupon_id_foreign` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`) ON DELETE CASCADE,
  CONSTRAINT `coupon_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleet_cart_new.coupon_products: ~0 rows (approximately)
DELETE FROM `coupon_products`;
/*!40000 ALTER TABLE `coupon_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `coupon_products` ENABLE KEYS */;

-- Dumping structure for table fleet_cart_new.coupon_translations
DROP TABLE IF EXISTS `coupon_translations`;
CREATE TABLE IF NOT EXISTS `coupon_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `coupon_id` int(10) unsigned NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `coupon_translations_coupon_id_locale_unique` (`coupon_id`,`locale`),
  CONSTRAINT `coupon_translations_coupon_id_foreign` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleet_cart_new.coupon_translations: ~0 rows (approximately)
DELETE FROM `coupon_translations`;
/*!40000 ALTER TABLE `coupon_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `coupon_translations` ENABLE KEYS */;

-- Dumping structure for table fleet_cart_new.cross_sell_products
DROP TABLE IF EXISTS `cross_sell_products`;
CREATE TABLE IF NOT EXISTS `cross_sell_products` (
  `product_id` int(10) unsigned NOT NULL,
  `cross_sell_product_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`product_id`,`cross_sell_product_id`),
  KEY `cross_sell_products_cross_sell_product_id_foreign` (`cross_sell_product_id`),
  CONSTRAINT `cross_sell_products_cross_sell_product_id_foreign` FOREIGN KEY (`cross_sell_product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cross_sell_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleet_cart_new.cross_sell_products: ~0 rows (approximately)
DELETE FROM `cross_sell_products`;
/*!40000 ALTER TABLE `cross_sell_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `cross_sell_products` ENABLE KEYS */;

-- Dumping structure for table fleet_cart_new.currency_rates
DROP TABLE IF EXISTS `currency_rates`;
CREATE TABLE IF NOT EXISTS `currency_rates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `currency` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` decimal(8,4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `currency_rates_currency_unique` (`currency`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleet_cart_new.currency_rates: ~0 rows (approximately)
DELETE FROM `currency_rates`;
/*!40000 ALTER TABLE `currency_rates` DISABLE KEYS */;
INSERT INTO `currency_rates` (`id`, `currency`, `rate`, `created_at`, `updated_at`) VALUES
	(1, 'USD', 1.0000, '2021-12-21 10:40:24', '2021-12-21 10:40:24');
/*!40000 ALTER TABLE `currency_rates` ENABLE KEYS */;

-- Dumping structure for table fleet_cart_new.entity_files
DROP TABLE IF EXISTS `entity_files`;
CREATE TABLE IF NOT EXISTS `entity_files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `file_id` int(10) unsigned NOT NULL,
  `entity_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entity_id` bigint(20) unsigned NOT NULL,
  `zone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entity_files_entity_type_entity_id_index` (`entity_type`,`entity_id`),
  KEY `entity_files_file_id_index` (`file_id`),
  KEY `entity_files_zone_index` (`zone`),
  CONSTRAINT `entity_files_file_id_foreign` FOREIGN KEY (`file_id`) REFERENCES `files` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleet_cart_new.entity_files: ~0 rows (approximately)
DELETE FROM `entity_files`;
/*!40000 ALTER TABLE `entity_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `entity_files` ENABLE KEYS */;

-- Dumping structure for table fleet_cart_new.files
DROP TABLE IF EXISTS `files`;
CREATE TABLE IF NOT EXISTS `files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `filename` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `disk` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `extension` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `files_user_id_index` (`user_id`),
  KEY `files_filename_index` (`filename`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleet_cart_new.files: ~9 rows (approximately)
DELETE FROM `files`;
/*!40000 ALTER TABLE `files` DISABLE KEYS */;
INSERT INTO `files` (`id`, `user_id`, `filename`, `disk`, `path`, `extension`, `mime`, `size`, `created_at`, `updated_at`) VALUES
	(1, 1, 'external-content.duckduckgo.com.jpg', 'public_storage', 'media/gw1aXG9QNZJAlHJNoSFA8eaaCZc7wO6YTiQB22Jg.jpeg', 'jpeg', 'image/jpeg', '85472', '2021-12-21 16:44:34', '2021-12-21 16:44:34'),
	(2, 1, 'logo.png', 'public_storage', 'media/qygs5MU80DoBshTWJ848vtzH4lM87hGUuxjoBJkf.png', 'png', 'image/png', '3992', '2021-12-21 16:51:51', '2021-12-21 16:51:51'),
	(3, 1, 'external-content.duckduckgo.com.jpg', 'public_storage', 'media/VZrqFJQvVhthJ0b1S8J4YXrr9ZnXr5x403uUq3bw.jpeg', 'jpeg', 'image/jpeg', '85472', '2021-12-21 17:02:36', '2021-12-21 17:02:36'),
	(4, 1, 'external-content.duckduckgo.com.jpg', 'public_storage', 'media/ezW172YRctX1LcM9dQs7aSj7MDnBZRYp0V2gMoRz.jpeg', 'jpeg', 'image/jpeg', '85472', '2021-12-21 17:05:14', '2021-12-21 17:05:14'),
	(6, 1, 'slide-1.jpg', 'public_storage', 'media/Ao9O9nW1hVhSsxgcH6Ma8skNPNR2aoFCQv1lLcTw.jpeg', 'jpeg', 'image/jpeg', '33288', '2021-12-21 18:06:56', '2021-12-21 18:06:56'),
	(7, 1, 'slide-2.jpg', 'public_storage', 'media/DVXyPceZUE6AM5I41xnhgxCxZNcqYTF7YhvefPO7.jpeg', 'jpeg', 'image/jpeg', '27208', '2021-12-21 18:17:25', '2021-12-21 18:17:25'),
	(8, 1, 'slide-3.jpg', 'public_storage', 'media/RJphZ2jaqGV2nh3bE8fpACQCAkVvWXD4XN8l22QY.jpeg', 'jpeg', 'image/jpeg', '13746', '2021-12-21 18:19:40', '2021-12-21 18:19:40'),
	(9, 1, 'New Project.jpg', 'public_storage', 'media/6SwYbGu3syJ4GJdNkBlfvtOOfb0tRWxWvRIZNU8B.jpeg', 'jpeg', 'image/jpeg', '19785', '2021-12-21 18:24:27', '2021-12-21 18:24:27'),
	(10, 1, 'New Project(1).jpg', 'public_storage', 'media/GzIhjyGqoEnIa7HJP8cPoWwNpSFjMRCP9FNz4Bbb.jpeg', 'jpeg', 'image/jpeg', '9373', '2021-12-21 18:27:01', '2021-12-21 18:27:01');
/*!40000 ALTER TABLE `files` ENABLE KEYS */;

-- Dumping structure for table fleet_cart_new.flash_sales
DROP TABLE IF EXISTS `flash_sales`;
CREATE TABLE IF NOT EXISTS `flash_sales` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleet_cart_new.flash_sales: ~0 rows (approximately)
DELETE FROM `flash_sales`;
/*!40000 ALTER TABLE `flash_sales` DISABLE KEYS */;
/*!40000 ALTER TABLE `flash_sales` ENABLE KEYS */;

-- Dumping structure for table fleet_cart_new.flash_sale_products
DROP TABLE IF EXISTS `flash_sale_products`;
CREATE TABLE IF NOT EXISTS `flash_sale_products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `flash_sale_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `end_date` date NOT NULL,
  `price` decimal(18,4) unsigned NOT NULL,
  `qty` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `flash_sale_products_flash_sale_id_foreign` (`flash_sale_id`),
  KEY `flash_sale_products_product_id_foreign` (`product_id`),
  CONSTRAINT `flash_sale_products_flash_sale_id_foreign` FOREIGN KEY (`flash_sale_id`) REFERENCES `flash_sales` (`id`) ON DELETE CASCADE,
  CONSTRAINT `flash_sale_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleet_cart_new.flash_sale_products: ~0 rows (approximately)
DELETE FROM `flash_sale_products`;
/*!40000 ALTER TABLE `flash_sale_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `flash_sale_products` ENABLE KEYS */;

-- Dumping structure for table fleet_cart_new.flash_sale_product_orders
DROP TABLE IF EXISTS `flash_sale_product_orders`;
CREATE TABLE IF NOT EXISTS `flash_sale_product_orders` (
  `flash_sale_product_id` int(10) unsigned NOT NULL,
  `order_id` int(10) unsigned NOT NULL,
  `qty` int(11) NOT NULL,
  PRIMARY KEY (`flash_sale_product_id`,`order_id`),
  KEY `flash_sale_product_orders_order_id_foreign` (`order_id`),
  CONSTRAINT `flash_sale_product_orders_flash_sale_product_id_foreign` FOREIGN KEY (`flash_sale_product_id`) REFERENCES `flash_sale_products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `flash_sale_product_orders_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleet_cart_new.flash_sale_product_orders: ~0 rows (approximately)
DELETE FROM `flash_sale_product_orders`;
/*!40000 ALTER TABLE `flash_sale_product_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `flash_sale_product_orders` ENABLE KEYS */;

-- Dumping structure for table fleet_cart_new.flash_sale_translations
DROP TABLE IF EXISTS `flash_sale_translations`;
CREATE TABLE IF NOT EXISTS `flash_sale_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `flash_sale_id` int(10) unsigned NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `campaign_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `flash_sale_translations_flash_sale_id_locale_unique` (`flash_sale_id`,`locale`),
  CONSTRAINT `flash_sale_translations_flash_sale_id_foreign` FOREIGN KEY (`flash_sale_id`) REFERENCES `flash_sales` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleet_cart_new.flash_sale_translations: ~0 rows (approximately)
DELETE FROM `flash_sale_translations`;
/*!40000 ALTER TABLE `flash_sale_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `flash_sale_translations` ENABLE KEYS */;

-- Dumping structure for table fleet_cart_new.menus
DROP TABLE IF EXISTS `menus`;
CREATE TABLE IF NOT EXISTS `menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleet_cart_new.menus: ~2 rows (approximately)
DELETE FROM `menus`;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` (`id`, `is_active`, `created_at`, `updated_at`) VALUES
	(2, 1, '2021-12-21 17:41:59', '2021-12-21 17:41:59'),
	(3, 1, '2021-12-21 17:47:31', '2021-12-21 17:47:44');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;

-- Dumping structure for table fleet_cart_new.menu_items
DROP TABLE IF EXISTS `menu_items`;
CREATE TABLE IF NOT EXISTS `menu_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int(10) unsigned NOT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `category_id` int(10) unsigned DEFAULT NULL,
  `page_id` int(10) unsigned DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int(10) unsigned DEFAULT NULL,
  `is_root` tinyint(1) NOT NULL DEFAULT '0',
  `is_fluid` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_items_parent_id_foreign` (`parent_id`),
  KEY `menu_items_category_id_foreign` (`category_id`),
  KEY `menu_items_page_id_foreign` (`page_id`),
  KEY `menu_items_menu_id_index` (`menu_id`),
  CONSTRAINT `menu_items_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE,
  CONSTRAINT `menu_items_page_id_foreign` FOREIGN KEY (`page_id`) REFERENCES `pages` (`id`) ON DELETE CASCADE,
  CONSTRAINT `menu_items_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `menu_items` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleet_cart_new.menu_items: ~15 rows (approximately)
DELETE FROM `menu_items`;
/*!40000 ALTER TABLE `menu_items` DISABLE KEYS */;
INSERT INTO `menu_items` (`id`, `menu_id`, `parent_id`, `category_id`, `page_id`, `type`, `url`, `icon`, `target`, `position`, `is_root`, `is_fluid`, `is_active`, `created_at`, `updated_at`) VALUES
	(4, 2, NULL, NULL, NULL, 'URL', NULL, NULL, '_self', 0, 1, 0, 1, '2021-12-21 17:41:59', '2021-12-21 17:41:59'),
	(5, 2, 4, NULL, NULL, 'url', '#', NULL, '_self', 0, 0, 0, 1, '2021-12-21 17:42:38', '2021-12-21 17:44:15'),
	(6, 2, 4, NULL, NULL, 'url', '#', NULL, '_self', 1, 0, 0, 1, '2021-12-21 17:43:57', '2021-12-21 17:44:02'),
	(7, 2, 4, NULL, NULL, 'url', '#', NULL, '_self', 2, 0, 0, 1, '2021-12-21 17:44:46', '2021-12-21 17:46:45'),
	(8, 2, 4, NULL, NULL, 'url', '#', NULL, '_self', 3, 0, 0, 1, '2021-12-21 17:45:32', '2021-12-21 17:46:45'),
	(9, 2, 4, NULL, NULL, 'url', '#', NULL, '_self', 4, 0, 0, 1, '2021-12-21 17:45:56', '2021-12-21 17:46:45'),
	(10, 2, 4, NULL, NULL, 'url', '#', NULL, '_self', NULL, 0, 0, 1, '2021-12-21 17:46:23', '2021-12-21 17:46:49'),
	(11, 3, NULL, NULL, NULL, 'URL', NULL, NULL, '_self', 0, 1, 0, 1, '2021-12-21 17:47:31', '2021-12-21 17:47:31'),
	(12, 3, 11, NULL, NULL, 'url', '#', NULL, '_self', 0, 0, 0, 1, '2021-12-21 17:48:50', '2021-12-21 18:27:47'),
	(13, 3, 11, NULL, NULL, 'url', '#', NULL, '_self', 1, 0, 0, 1, '2021-12-21 17:49:57', '2021-12-21 18:27:47'),
	(14, 3, 11, NULL, NULL, 'url', '#', NULL, '_self', 2, 0, 0, 1, '2021-12-21 17:51:31', '2021-12-21 18:27:47'),
	(15, 3, 11, NULL, NULL, 'url', '#', NULL, '_self', 3, 0, 0, 1, '2021-12-21 17:51:53', '2021-12-21 18:27:47'),
	(16, 3, 11, NULL, NULL, 'url', '#', NULL, '_self', 4, 0, 0, 1, '2021-12-21 17:52:29', '2021-12-21 18:27:47'),
	(17, 3, 11, NULL, NULL, 'url', '#', NULL, '_self', 5, 0, 0, 1, '2021-12-21 17:53:02', '2021-12-21 18:27:47'),
	(18, 3, 11, NULL, NULL, 'url', '#', NULL, '_self', 6, 0, 0, 1, '2021-12-21 17:53:16', '2021-12-21 18:27:47');
/*!40000 ALTER TABLE `menu_items` ENABLE KEYS */;

-- Dumping structure for table fleet_cart_new.menu_item_translations
DROP TABLE IF EXISTS `menu_item_translations`;
CREATE TABLE IF NOT EXISTS `menu_item_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menu_item_id` int(10) unsigned NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menu_item_translations_menu_item_id_locale_unique` (`menu_item_id`,`locale`),
  CONSTRAINT `menu_item_translations_menu_item_id_foreign` FOREIGN KEY (`menu_item_id`) REFERENCES `menu_items` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleet_cart_new.menu_item_translations: ~16 rows (approximately)
DELETE FROM `menu_item_translations`;
/*!40000 ALTER TABLE `menu_item_translations` DISABLE KEYS */;
INSERT INTO `menu_item_translations` (`id`, `menu_item_id`, `locale`, `name`) VALUES
	(4, 4, 'en', 'root'),
	(5, 5, 'en', 'Home'),
	(6, 6, 'en', 'Shop'),
	(7, 7, 'en', 'Product'),
	(8, 8, 'en', 'Pages'),
	(9, 9, 'en', 'Blog'),
	(10, 10, 'en', 'Elements'),
	(11, 11, 'en', 'root'),
	(12, 12, 'en', 'Electronics'),
	(13, 13, 'en', 'Furniture'),
	(14, 14, 'en', 'Cooking'),
	(15, 15, 'en', 'Clothing'),
	(16, 16, 'en', 'Home Appliances'),
	(17, 17, 'en', 'Healthy & Beauty'),
	(18, 18, 'en', 'Shoes & Boots');
/*!40000 ALTER TABLE `menu_item_translations` ENABLE KEYS */;

-- Dumping structure for table fleet_cart_new.menu_translations
DROP TABLE IF EXISTS `menu_translations`;
CREATE TABLE IF NOT EXISTS `menu_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int(10) unsigned NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menu_translations_menu_id_locale_unique` (`menu_id`,`locale`),
  CONSTRAINT `menu_translations_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleet_cart_new.menu_translations: ~2 rows (approximately)
DELETE FROM `menu_translations`;
/*!40000 ALTER TABLE `menu_translations` DISABLE KEYS */;
INSERT INTO `menu_translations` (`id`, `menu_id`, `locale`, `name`) VALUES
	(2, 2, 'en', 'main-menu'),
	(3, 3, 'en', 'category-menu');
/*!40000 ALTER TABLE `menu_translations` ENABLE KEYS */;

-- Dumping structure for table fleet_cart_new.meta_data
DROP TABLE IF EXISTS `meta_data`;
CREATE TABLE IF NOT EXISTS `meta_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entity_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `meta_data_entity_type_entity_id_index` (`entity_type`,`entity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleet_cart_new.meta_data: ~0 rows (approximately)
DELETE FROM `meta_data`;
/*!40000 ALTER TABLE `meta_data` DISABLE KEYS */;
INSERT INTO `meta_data` (`id`, `entity_type`, `entity_id`, `created_at`, `updated_at`) VALUES
	(1, 'Modules\\Page\\Entities\\Page', 1, '2021-12-21 17:20:01', '2021-12-21 17:20:01'),
	(2, 'Modules\\Brand\\Entities\\Brand', 1, '2021-12-21 19:26:12', '2021-12-21 19:26:12'),
	(3, 'Modules\\Product\\Entities\\Product', 1, '2021-12-21 19:27:51', '2021-12-21 19:27:51');
/*!40000 ALTER TABLE `meta_data` ENABLE KEYS */;

-- Dumping structure for table fleet_cart_new.meta_data_translations
DROP TABLE IF EXISTS `meta_data_translations`;
CREATE TABLE IF NOT EXISTS `meta_data_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `meta_data_id` int(10) unsigned NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `meta_data_translations_meta_data_id_locale_unique` (`meta_data_id`,`locale`),
  CONSTRAINT `meta_data_translations_meta_data_id_foreign` FOREIGN KEY (`meta_data_id`) REFERENCES `meta_data` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleet_cart_new.meta_data_translations: ~0 rows (approximately)
DELETE FROM `meta_data_translations`;
/*!40000 ALTER TABLE `meta_data_translations` DISABLE KEYS */;
INSERT INTO `meta_data_translations` (`id`, `meta_data_id`, `locale`, `meta_title`, `meta_description`) VALUES
	(1, 1, 'en', NULL, NULL),
	(2, 2, 'en', NULL, NULL),
	(3, 3, 'en', NULL, NULL);
/*!40000 ALTER TABLE `meta_data_translations` ENABLE KEYS */;

-- Dumping structure for table fleet_cart_new.migrations
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleet_cart_new.migrations: ~80 rows (approximately)
DELETE FROM `migrations`;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_07_02_230147_migration_cartalyst_sentinel', 1),
	(2, '2014_10_14_200250_create_settings_table', 1),
	(3, '2014_10_26_162751_create_files_table', 1),
	(4, '2014_10_30_191858_create_pages_table', 1),
	(5, '2014_11_31_125848_create_page_translations_table', 1),
	(6, '2015_02_27_105241_create_entity_files_table', 1),
	(7, '2015_11_20_184604486385_create_translations_table', 1),
	(8, '2015_11_20_184604743083_create_translation_translations_table', 1),
	(9, '2017_05_29_155126144426_create_products_table', 1),
	(10, '2017_05_30_155126416338_create_product_translations_table', 1),
	(11, '2017_08_02_153217_create_options_table', 1),
	(12, '2017_08_02_153348_create_option_translations_table', 1),
	(13, '2017_08_02_153406_create_option_values_table', 1),
	(14, '2017_08_02_153736_create_option_value_translations_table', 1),
	(15, '2017_08_03_156576_create_product_options_table', 1),
	(16, '2017_08_17_170128_create_related_products_table', 1),
	(17, '2017_08_17_175236_create_up_sell_products_table', 1),
	(18, '2017_08_17_175828_create_cross_sell_products_table', 1),
	(19, '2017_11_09_141332910964_create_categories_table', 1),
	(20, '2017_11_09_141332931539_create_category_translations_table', 1),
	(21, '2017_11_26_083614526622_create_meta_data_table', 1),
	(22, '2017_11_26_083614526828_create_meta_data_translations_table', 1),
	(23, '2018_01_24_125642_create_product_categories_table', 1),
	(24, '2018_02_04_150917488267_create_coupons_table', 1),
	(25, '2018_02_04_150917488698_create_coupon_translations_table', 1),
	(26, '2018_03_11_181317_create_coupon_products_table', 1),
	(27, '2018_03_15_091937_create_coupon_categories_table', 1),
	(28, '2018_04_18_154028776225_create_reviews_table', 1),
	(29, '2018_05_17_115822452977_create_currency_rates_table', 1),
	(30, '2018_07_03_124153537506_create_sliders_table', 1),
	(31, '2018_07_03_124153537695_create_slider_translations_table', 1),
	(32, '2018_07_03_133107770172_create_slider_slides_table', 1),
	(33, '2018_07_03_133107770486_create_slider_slide_translations_table', 1),
	(34, '2018_07_28_190524758357_create_attribute_sets_table', 1),
	(35, '2018_07_28_190524758497_create_attribute_set_translations_table', 1),
	(36, '2018_07_28_190524758646_create_attributes_table', 1),
	(37, '2018_07_28_190524758877_create_attribute_translations_table', 1),
	(38, '2018_07_28_190524759461_create_product_attributes_table', 1),
	(39, '2018_08_01_001919718631_create_tax_classes_table', 1),
	(40, '2018_08_01_001919718935_create_tax_class_translations_table', 1),
	(41, '2018_08_01_001919723551_create_tax_rates_table', 1),
	(42, '2018_08_01_001919723781_create_tax_rate_translations_table', 1),
	(43, '2018_08_03_195922206748_create_attribute_values_table', 1),
	(44, '2018_08_03_195922207019_create_attribute_value_translations_table', 1),
	(45, '2018_08_04_190524764275_create_product_attribute_values_table', 1),
	(46, '2018_08_07_135631306565_create_orders_table', 1),
	(47, '2018_08_07_135631309451_create_order_products_table', 1),
	(48, '2018_08_07_135631309512_create_order_product_options_table', 1),
	(49, '2018_08_07_135631309624_create_order_product_option_values_table', 1),
	(50, '2018_09_11_213926106353_create_transactions_table', 1),
	(51, '2018_09_19_081602135631_create_order_taxes_table', 1),
	(52, '2018_09_19_103745_create_setting_translations_table', 1),
	(53, '2018_10_01_224852175056_create_wish_lists_table', 1),
	(54, '2018_10_04_185608_create_search_terms_table', 1),
	(55, '2018_11_03_160015_create_menus_table', 1),
	(56, '2018_11_03_160138_create_menu_translations_table', 1),
	(57, '2018_11_03_160753_create_menu_items_table', 1),
	(58, '2018_11_03_160804_create_menu_item_translation_table', 1),
	(59, '2019_02_05_162605_add_position_to_slider_slides_table', 1),
	(60, '2019_02_09_164343_remove_file_id_from_slider_slides_table', 1),
	(61, '2019_02_09_164434_add_file_id_to_slider_slide_translations_table', 1),
	(62, '2019_02_14_103408_create_attribute_categories_table', 1),
	(63, '2019_08_09_164759_add_slug_column_to_attributes_table', 1),
	(64, '2019_11_01_201511_add_special_price_type_column_to_products_table', 1),
	(65, '2019_11_23_193101_add_value_column_to_order_product_options_table', 1),
	(66, '2020_01_04_211424_add_icon_column_to_menu_items_table', 1),
	(67, '2020_01_05_160502_add_direction_column_to_slider_slide_translations_table', 1),
	(68, '2020_01_05_234014_add_speed_column_to_sliders_table', 1),
	(69, '2020_01_05_235014_add_fade_column_to_sliders_table', 1),
	(70, '2020_01_15_000346259038_create_flash_sales_table', 1),
	(71, '2020_01_15_000346259349_create_flash_sale_translations_table', 1),
	(72, '2020_01_23_011234_create_flash_sale_products_table', 1),
	(73, '2020_01_30_015722_create_flash_sale_product_orders_table', 1),
	(74, '2020_02_22_215943_delete_meta_keywords_column_from_meta_data_translations_table', 1),
	(75, '2020_03_05_214602901973_create_brands_table', 1),
	(76, '2020_03_05_214602902369_create_brand_translations_table', 1),
	(77, '2020_03_06_234605_add_brand_id_column_to_products_table', 1),
	(78, '2020_04_06_211526_add_note_column_to_orders_table', 1),
	(79, '2020_04_28_034118164376_create_tags_table', 1),
	(80, '2020_04_28_034118164618_create_tag_translations_table', 1),
	(81, '2020_04_28_225657_create_product_tags_table', 1),
	(82, '2020_05_10_041616_create_updater_scripts_table', 1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Dumping structure for table fleet_cart_new.options
DROP TABLE IF EXISTS `options`;
CREATE TABLE IF NOT EXISTS `options` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_required` tinyint(1) NOT NULL,
  `is_global` tinyint(1) NOT NULL DEFAULT '1',
  `position` int(10) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleet_cart_new.options: ~0 rows (approximately)
DELETE FROM `options`;
/*!40000 ALTER TABLE `options` DISABLE KEYS */;
/*!40000 ALTER TABLE `options` ENABLE KEYS */;

-- Dumping structure for table fleet_cart_new.option_translations
DROP TABLE IF EXISTS `option_translations`;
CREATE TABLE IF NOT EXISTS `option_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `option_id` int(10) unsigned NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `option_translations_option_id_locale_unique` (`option_id`,`locale`),
  CONSTRAINT `option_translations_option_id_foreign` FOREIGN KEY (`option_id`) REFERENCES `options` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleet_cart_new.option_translations: ~0 rows (approximately)
DELETE FROM `option_translations`;
/*!40000 ALTER TABLE `option_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `option_translations` ENABLE KEYS */;

-- Dumping structure for table fleet_cart_new.option_values
DROP TABLE IF EXISTS `option_values`;
CREATE TABLE IF NOT EXISTS `option_values` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `option_id` int(10) unsigned NOT NULL,
  `price` decimal(18,4) unsigned DEFAULT NULL,
  `price_type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `option_values_option_id_index` (`option_id`),
  CONSTRAINT `option_values_option_id_foreign` FOREIGN KEY (`option_id`) REFERENCES `options` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleet_cart_new.option_values: ~0 rows (approximately)
DELETE FROM `option_values`;
/*!40000 ALTER TABLE `option_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `option_values` ENABLE KEYS */;

-- Dumping structure for table fleet_cart_new.option_value_translations
DROP TABLE IF EXISTS `option_value_translations`;
CREATE TABLE IF NOT EXISTS `option_value_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `option_value_id` int(10) unsigned NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `option_value_translations_option_value_id_locale_unique` (`option_value_id`,`locale`),
  CONSTRAINT `option_value_translations_option_value_id_foreign` FOREIGN KEY (`option_value_id`) REFERENCES `option_values` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleet_cart_new.option_value_translations: ~0 rows (approximately)
DELETE FROM `option_value_translations`;
/*!40000 ALTER TABLE `option_value_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `option_value_translations` ENABLE KEYS */;

-- Dumping structure for table fleet_cart_new.orders
DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT NULL,
  `customer_email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_address_1` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_address_2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_state` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_zip` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_country` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_address_1` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_address_2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_state` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_zip` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_country` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_total` decimal(18,4) unsigned NOT NULL,
  `shipping_method` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_cost` decimal(18,4) unsigned NOT NULL,
  `coupon_id` int(11) DEFAULT NULL,
  `discount` decimal(18,4) unsigned NOT NULL,
  `total` decimal(18,4) unsigned NOT NULL,
  `payment_method` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_rate` decimal(18,4) NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_customer_id_index` (`customer_id`),
  KEY `orders_coupon_id_index` (`coupon_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleet_cart_new.orders: ~0 rows (approximately)
DELETE FROM `orders`;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;

-- Dumping structure for table fleet_cart_new.order_products
DROP TABLE IF EXISTS `order_products`;
CREATE TABLE IF NOT EXISTS `order_products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `unit_price` decimal(18,4) unsigned NOT NULL,
  `qty` int(11) NOT NULL,
  `line_total` decimal(18,4) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_products_order_id_foreign` (`order_id`),
  KEY `order_products_product_id_foreign` (`product_id`),
  CONSTRAINT `order_products_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleet_cart_new.order_products: ~0 rows (approximately)
DELETE FROM `order_products`;
/*!40000 ALTER TABLE `order_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_products` ENABLE KEYS */;

-- Dumping structure for table fleet_cart_new.order_product_options
DROP TABLE IF EXISTS `order_product_options`;
CREATE TABLE IF NOT EXISTS `order_product_options` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_product_id` int(10) unsigned NOT NULL,
  `option_id` int(10) unsigned NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_product_options_order_product_id_option_id_unique` (`order_product_id`,`option_id`),
  KEY `order_product_options_option_id_foreign` (`option_id`),
  CONSTRAINT `order_product_options_option_id_foreign` FOREIGN KEY (`option_id`) REFERENCES `options` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_product_options_order_product_id_foreign` FOREIGN KEY (`order_product_id`) REFERENCES `order_products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleet_cart_new.order_product_options: ~0 rows (approximately)
DELETE FROM `order_product_options`;
/*!40000 ALTER TABLE `order_product_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_product_options` ENABLE KEYS */;

-- Dumping structure for table fleet_cart_new.order_product_option_values
DROP TABLE IF EXISTS `order_product_option_values`;
CREATE TABLE IF NOT EXISTS `order_product_option_values` (
  `order_product_option_id` int(10) unsigned NOT NULL,
  `option_value_id` int(10) unsigned NOT NULL,
  `price` decimal(18,4) unsigned DEFAULT NULL,
  PRIMARY KEY (`order_product_option_id`,`option_value_id`),
  KEY `order_product_option_values_option_value_id_foreign` (`option_value_id`),
  CONSTRAINT `order_product_option_values_option_value_id_foreign` FOREIGN KEY (`option_value_id`) REFERENCES `option_values` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_product_option_values_order_product_option_id_foreign` FOREIGN KEY (`order_product_option_id`) REFERENCES `order_product_options` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleet_cart_new.order_product_option_values: ~0 rows (approximately)
DELETE FROM `order_product_option_values`;
/*!40000 ALTER TABLE `order_product_option_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_product_option_values` ENABLE KEYS */;

-- Dumping structure for table fleet_cart_new.order_taxes
DROP TABLE IF EXISTS `order_taxes`;
CREATE TABLE IF NOT EXISTS `order_taxes` (
  `order_id` int(10) unsigned NOT NULL,
  `tax_rate_id` int(10) unsigned NOT NULL,
  `amount` decimal(15,4) unsigned NOT NULL,
  PRIMARY KEY (`order_id`,`tax_rate_id`),
  KEY `order_taxes_tax_rate_id_foreign` (`tax_rate_id`),
  CONSTRAINT `order_taxes_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_taxes_tax_rate_id_foreign` FOREIGN KEY (`tax_rate_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleet_cart_new.order_taxes: ~0 rows (approximately)
DELETE FROM `order_taxes`;
/*!40000 ALTER TABLE `order_taxes` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_taxes` ENABLE KEYS */;

-- Dumping structure for table fleet_cart_new.pages
DROP TABLE IF EXISTS `pages`;
CREATE TABLE IF NOT EXISTS `pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pages_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleet_cart_new.pages: ~0 rows (approximately)
DELETE FROM `pages`;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` (`id`, `slug`, `is_active`, `created_at`, `updated_at`) VALUES
	(1, 'sample', 1, '2021-12-21 17:20:01', '2021-12-21 17:20:01');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;

-- Dumping structure for table fleet_cart_new.page_translations
DROP TABLE IF EXISTS `page_translations`;
CREATE TABLE IF NOT EXISTS `page_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `page_id` int(10) unsigned NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `page_translations_page_id_locale_unique` (`page_id`,`locale`),
  CONSTRAINT `page_translations_page_id_foreign` FOREIGN KEY (`page_id`) REFERENCES `pages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleet_cart_new.page_translations: ~0 rows (approximately)
DELETE FROM `page_translations`;
/*!40000 ALTER TABLE `page_translations` DISABLE KEYS */;
INSERT INTO `page_translations` (`id`, `page_id`, `locale`, `name`, `body`) VALUES
	(1, 1, 'en', 'Sample', '<p>This is our sample page. where we check page.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>');
/*!40000 ALTER TABLE `page_translations` ENABLE KEYS */;

-- Dumping structure for table fleet_cart_new.persistences
DROP TABLE IF EXISTS `persistences`;
CREATE TABLE IF NOT EXISTS `persistences` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `persistences_code_unique` (`code`),
  KEY `persistences_user_id_foreign` (`user_id`),
  CONSTRAINT `persistences_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleet_cart_new.persistences: ~2 rows (approximately)
DELETE FROM `persistences`;
/*!40000 ALTER TABLE `persistences` DISABLE KEYS */;
INSERT INTO `persistences` (`id`, `user_id`, `code`, `created_at`, `updated_at`) VALUES
	(1, 1, 'kpqrFV2ZUE6hhdE6Lr6bgc4auxei56BX', '2021-12-21 16:43:52', '2021-12-21 16:43:52'),
	(2, 1, 'S8HJ1rOWKXe0jlmwRT47z8YDJCzsgOMR', '2021-12-21 17:01:11', '2021-12-21 17:01:11');
/*!40000 ALTER TABLE `persistences` ENABLE KEYS */;

-- Dumping structure for table fleet_cart_new.products
DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `brand_id` int(10) unsigned DEFAULT NULL,
  `tax_class_id` int(10) unsigned DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(18,4) unsigned NOT NULL,
  `special_price` decimal(18,4) unsigned DEFAULT NULL,
  `special_price_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `special_price_start` date DEFAULT NULL,
  `special_price_end` date DEFAULT NULL,
  `selling_price` decimal(18,4) unsigned DEFAULT NULL,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `manage_stock` tinyint(1) NOT NULL,
  `qty` int(11) DEFAULT NULL,
  `in_stock` tinyint(1) NOT NULL,
  `viewed` int(10) unsigned NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL,
  `new_from` datetime DEFAULT NULL,
  `new_to` datetime DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_slug_unique` (`slug`),
  KEY `products_brand_id_foreign` (`brand_id`),
  CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleet_cart_new.products: ~0 rows (approximately)
DELETE FROM `products`;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` (`id`, `brand_id`, `tax_class_id`, `slug`, `price`, `special_price`, `special_price_type`, `special_price_start`, `special_price_end`, `selling_price`, `sku`, `manage_stock`, `qty`, `in_stock`, `viewed`, `is_active`, `new_from`, `new_to`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(1, 1, NULL, 'book', 1500.0000, NULL, 'fixed', NULL, NULL, 1500.0000, NULL, 0, NULL, 1, 1, 1, NULL, NULL, '2021-12-21 19:33:32', '2021-12-21 19:27:51', '2021-12-21 19:33:32');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;

-- Dumping structure for table fleet_cart_new.product_attributes
DROP TABLE IF EXISTS `product_attributes`;
CREATE TABLE IF NOT EXISTS `product_attributes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `attribute_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_attributes_product_id_index` (`product_id`),
  KEY `product_attributes_attribute_id_index` (`attribute_id`),
  CONSTRAINT `product_attributes_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_attributes_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleet_cart_new.product_attributes: ~0 rows (approximately)
DELETE FROM `product_attributes`;
/*!40000 ALTER TABLE `product_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_attributes` ENABLE KEYS */;

-- Dumping structure for table fleet_cart_new.product_attribute_values
DROP TABLE IF EXISTS `product_attribute_values`;
CREATE TABLE IF NOT EXISTS `product_attribute_values` (
  `product_attribute_id` int(10) unsigned NOT NULL,
  `attribute_value_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`product_attribute_id`,`attribute_value_id`),
  KEY `product_attribute_values_attribute_value_id_foreign` (`attribute_value_id`),
  CONSTRAINT `product_attribute_values_attribute_value_id_foreign` FOREIGN KEY (`attribute_value_id`) REFERENCES `attribute_values` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_attribute_values_product_attribute_id_foreign` FOREIGN KEY (`product_attribute_id`) REFERENCES `product_attributes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleet_cart_new.product_attribute_values: ~0 rows (approximately)
DELETE FROM `product_attribute_values`;
/*!40000 ALTER TABLE `product_attribute_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_attribute_values` ENABLE KEYS */;

-- Dumping structure for table fleet_cart_new.product_categories
DROP TABLE IF EXISTS `product_categories`;
CREATE TABLE IF NOT EXISTS `product_categories` (
  `product_id` int(10) unsigned NOT NULL,
  `category_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`product_id`,`category_id`),
  KEY `product_categories_category_id_foreign` (`category_id`),
  CONSTRAINT `product_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_categories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleet_cart_new.product_categories: ~0 rows (approximately)
DELETE FROM `product_categories`;
/*!40000 ALTER TABLE `product_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_categories` ENABLE KEYS */;

-- Dumping structure for table fleet_cart_new.product_options
DROP TABLE IF EXISTS `product_options`;
CREATE TABLE IF NOT EXISTS `product_options` (
  `product_id` int(10) unsigned NOT NULL,
  `option_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`product_id`,`option_id`),
  KEY `product_options_option_id_foreign` (`option_id`),
  CONSTRAINT `product_options_option_id_foreign` FOREIGN KEY (`option_id`) REFERENCES `options` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_options_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleet_cart_new.product_options: ~0 rows (approximately)
DELETE FROM `product_options`;
/*!40000 ALTER TABLE `product_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_options` ENABLE KEYS */;

-- Dumping structure for table fleet_cart_new.product_tags
DROP TABLE IF EXISTS `product_tags`;
CREATE TABLE IF NOT EXISTS `product_tags` (
  `product_id` int(10) unsigned NOT NULL,
  `tag_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`product_id`,`tag_id`),
  KEY `product_tags_tag_id_foreign` (`tag_id`),
  CONSTRAINT `product_tags_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_tags_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleet_cart_new.product_tags: ~0 rows (approximately)
DELETE FROM `product_tags`;
/*!40000 ALTER TABLE `product_tags` DISABLE KEYS */;
INSERT INTO `product_tags` (`product_id`, `tag_id`) VALUES
	(1, 1);
/*!40000 ALTER TABLE `product_tags` ENABLE KEYS */;

-- Dumping structure for table fleet_cart_new.product_translations
DROP TABLE IF EXISTS `product_translations`;
CREATE TABLE IF NOT EXISTS `product_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_translations_product_id_locale_unique` (`product_id`,`locale`),
  FULLTEXT KEY `name` (`name`),
  CONSTRAINT `product_translations_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleet_cart_new.product_translations: ~0 rows (approximately)
DELETE FROM `product_translations`;
/*!40000 ALTER TABLE `product_translations` DISABLE KEYS */;
INSERT INTO `product_translations` (`id`, `product_id`, `locale`, `name`, `description`, `short_description`) VALUES
	(1, 1, 'en', 'Book', '<p>this is book</p>', NULL);
/*!40000 ALTER TABLE `product_translations` ENABLE KEYS */;

-- Dumping structure for table fleet_cart_new.related_products
DROP TABLE IF EXISTS `related_products`;
CREATE TABLE IF NOT EXISTS `related_products` (
  `product_id` int(10) unsigned NOT NULL,
  `related_product_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`product_id`,`related_product_id`),
  KEY `related_products_related_product_id_foreign` (`related_product_id`),
  CONSTRAINT `related_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `related_products_related_product_id_foreign` FOREIGN KEY (`related_product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleet_cart_new.related_products: ~0 rows (approximately)
DELETE FROM `related_products`;
/*!40000 ALTER TABLE `related_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `related_products` ENABLE KEYS */;

-- Dumping structure for table fleet_cart_new.reminders
DROP TABLE IF EXISTS `reminders`;
CREATE TABLE IF NOT EXISTS `reminders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT '0',
  `completed_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reminders_user_id_foreign` (`user_id`),
  CONSTRAINT `reminders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleet_cart_new.reminders: ~0 rows (approximately)
DELETE FROM `reminders`;
/*!40000 ALTER TABLE `reminders` DISABLE KEYS */;
/*!40000 ALTER TABLE `reminders` ENABLE KEYS */;

-- Dumping structure for table fleet_cart_new.reviews
DROP TABLE IF EXISTS `reviews`;
CREATE TABLE IF NOT EXISTS `reviews` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reviewer_id` int(10) unsigned DEFAULT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `rating` int(11) NOT NULL,
  `reviewer_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_approved` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reviews_reviewer_id_index` (`reviewer_id`),
  KEY `reviews_product_id_index` (`product_id`),
  CONSTRAINT `reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleet_cart_new.reviews: ~0 rows (approximately)
DELETE FROM `reviews`;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;

-- Dumping structure for table fleet_cart_new.roles
DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleet_cart_new.roles: ~2 rows (approximately)
DELETE FROM `roles`;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`id`, `permissions`, `created_at`, `updated_at`) VALUES
	(1, '{"admin.users.index":true,"admin.users.create":true,"admin.users.edit":true,"admin.users.destroy":true,"admin.roles.index":true,"admin.roles.create":true,"admin.roles.edit":true,"admin.roles.destroy":true,"admin.products.index":true,"admin.products.create":true,"admin.products.edit":true,"admin.products.destroy":true,"admin.brands.index":true,"admin.brands.create":true,"admin.brands.edit":true,"admin.brands.destroy":true,"admin.attributes.index":true,"admin.attributes.create":true,"admin.attributes.edit":true,"admin.attributes.destroy":true,"admin.attribute_sets.index":true,"admin.attribute_sets.create":true,"admin.attribute_sets.edit":true,"admin.attribute_sets.destroy":true,"admin.options.index":true,"admin.options.create":true,"admin.options.edit":true,"admin.options.destroy":true,"admin.filters.index":true,"admin.filters.create":true,"admin.filters.edit":true,"admin.filters.destroy":true,"admin.reviews.index":true,"admin.reviews.create":true,"admin.reviews.edit":true,"admin.reviews.destroy":true,"admin.categories.index":true,"admin.categories.create":true,"admin.categories.edit":true,"admin.categories.destroy":true,"admin.tags.index":true,"admin.tags.create":true,"admin.tags.edit":true,"admin.tags.destroy":true,"admin.orders.index":true,"admin.orders.show":true,"admin.orders.edit":true,"admin.flash_sales.index":true,"admin.flash_sales.create":true,"admin.flash_sales.edit":true,"admin.flash_sales.destroy":true,"admin.transactions.index":true,"admin.coupons.index":true,"admin.coupons.create":true,"admin.coupons.edit":true,"admin.coupons.destroy":true,"admin.menus.index":true,"admin.menus.create":true,"admin.menus.edit":true,"admin.menus.destroy":true,"admin.menu_items.index":true,"admin.menu_items.create":true,"admin.menu_items.edit":true,"admin.menu_items.destroy":true,"admin.media.index":true,"admin.media.create":true,"admin.media.destroy":true,"admin.pages.index":true,"admin.pages.create":true,"admin.pages.edit":true,"admin.pages.destroy":true,"admin.currency_rates.index":true,"admin.currency_rates.edit":true,"admin.taxes.index":true,"admin.taxes.create":true,"admin.taxes.edit":true,"admin.taxes.destroy":true,"admin.translations.index":true,"admin.translations.edit":true,"admin.sliders.index":true,"admin.sliders.create":true,"admin.sliders.edit":true,"admin.sliders.destroy":true,"admin.importer.index":true,"admin.importer.create":true,"admin.reports.index":true,"admin.settings.edit":true,"admin.storefront.edit":true}', '2021-12-21 10:40:21', '2021-12-21 10:40:21'),
	(2, NULL, '2021-12-21 10:40:22', '2021-12-21 10:40:22');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;

-- Dumping structure for table fleet_cart_new.role_translations
DROP TABLE IF EXISTS `role_translations`;
CREATE TABLE IF NOT EXISTS `role_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `role_translations_role_id_locale_unique` (`role_id`,`locale`),
  CONSTRAINT `role_translations_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleet_cart_new.role_translations: ~2 rows (approximately)
DELETE FROM `role_translations`;
/*!40000 ALTER TABLE `role_translations` DISABLE KEYS */;
INSERT INTO `role_translations` (`id`, `role_id`, `locale`, `name`) VALUES
	(1, 1, 'en', 'Admin'),
	(2, 2, 'en', 'Customer');
/*!40000 ALTER TABLE `role_translations` ENABLE KEYS */;

-- Dumping structure for table fleet_cart_new.search_terms
DROP TABLE IF EXISTS `search_terms`;
CREATE TABLE IF NOT EXISTS `search_terms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `term` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `results` int(10) unsigned NOT NULL,
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `search_terms_term_unique` (`term`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleet_cart_new.search_terms: ~0 rows (approximately)
DELETE FROM `search_terms`;
/*!40000 ALTER TABLE `search_terms` DISABLE KEYS */;
/*!40000 ALTER TABLE `search_terms` ENABLE KEYS */;

-- Dumping structure for table fleet_cart_new.settings
DROP TABLE IF EXISTS `settings`;
CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_translatable` tinyint(1) NOT NULL DEFAULT '0',
  `plain_value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=229 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleet_cart_new.settings: ~228 rows (approximately)
DELETE FROM `settings`;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` (`id`, `key`, `is_translatable`, `plain_value`, `created_at`, `updated_at`) VALUES
	(1, 'store_name', 1, NULL, '2021-12-21 10:40:21', '2021-12-21 10:40:21'),
	(2, 'store_email', 0, 's:20:"admin@fleetcart.test";', '2021-12-21 10:40:21', '2021-12-21 10:40:22'),
	(3, 'search_engine', 0, 's:5:"mysql";', '2021-12-21 10:40:21', '2021-12-21 10:40:21'),
	(4, 'algolia_app_id', 0, 'N;', '2021-12-21 10:40:21', '2021-12-21 10:40:21'),
	(5, 'algolia_secret', 0, 'N;', '2021-12-21 10:40:21', '2021-12-21 10:40:21'),
	(6, 'active_theme', 0, 's:10:"Storefront";', '2021-12-21 10:40:22', '2021-12-21 10:40:22'),
	(7, 'supported_countries', 0, 'a:1:{i:0;s:2:"BD";}', '2021-12-21 10:40:22', '2021-12-21 10:40:22'),
	(8, 'default_country', 0, 's:2:"BD";', '2021-12-21 10:40:22', '2021-12-21 10:40:22'),
	(9, 'supported_locales', 0, 'a:1:{i:0;s:2:"en";}', '2021-12-21 10:40:22', '2021-12-21 10:40:22'),
	(10, 'default_locale', 0, 's:2:"en";', '2021-12-21 10:40:22', '2021-12-21 10:40:22'),
	(11, 'default_timezone', 0, 's:10:"Asia/Dhaka";', '2021-12-21 10:40:22', '2021-12-21 10:40:22'),
	(12, 'customer_role', 0, 'i:2;', '2021-12-21 10:40:22', '2021-12-21 10:40:22'),
	(13, 'reviews_enabled', 0, 'b:1;', '2021-12-21 10:40:22', '2021-12-21 10:40:22'),
	(14, 'auto_approve_reviews', 0, 'b:1;', '2021-12-21 10:40:22', '2021-12-21 10:40:22'),
	(15, 'cookie_bar_enabled', 0, 'b:1;', '2021-12-21 10:40:22', '2021-12-21 10:40:22'),
	(16, 'supported_currencies', 0, 'a:1:{i:0;s:3:"USD";}', '2021-12-21 10:40:22', '2021-12-21 10:40:22'),
	(17, 'default_currency', 0, 's:3:"USD";', '2021-12-21 10:40:22', '2021-12-21 10:40:22'),
	(18, 'send_order_invoice_email', 0, 'b:0;', '2021-12-21 10:40:22', '2021-12-21 10:40:22'),
	(19, 'newsletter_enabled', 0, 'b:0;', '2021-12-21 10:40:22', '2021-12-21 10:40:22'),
	(20, 'local_pickup_cost', 0, 'i:0;', '2021-12-21 10:40:23', '2021-12-21 10:40:23'),
	(21, 'flat_rate_cost', 0, 'i:0;', '2021-12-21 10:40:23', '2021-12-21 10:40:23'),
	(22, 'free_shipping_label', 1, NULL, '2021-12-21 10:40:23', '2021-12-21 10:40:23'),
	(23, 'local_pickup_label', 1, NULL, '2021-12-21 10:40:23', '2021-12-21 10:40:23'),
	(24, 'flat_rate_label', 1, NULL, '2021-12-21 10:40:23', '2021-12-21 10:40:23'),
	(25, 'paypal_label', 1, NULL, '2021-12-21 10:40:23', '2021-12-21 10:40:23'),
	(26, 'paypal_description', 1, NULL, '2021-12-21 10:40:23', '2021-12-21 10:40:23'),
	(27, 'stripe_label', 1, NULL, '2021-12-21 10:40:23', '2021-12-21 10:40:23'),
	(28, 'stripe_description', 1, NULL, '2021-12-21 10:40:23', '2021-12-21 10:40:23'),
	(29, 'razorpay_label', 1, NULL, '2021-12-21 10:40:23', '2021-12-21 10:40:23'),
	(30, 'razorpay_description', 1, NULL, '2021-12-21 10:40:23', '2021-12-21 10:40:23'),
	(31, 'instamojo_label', 1, NULL, '2021-12-21 10:40:24', '2021-12-21 10:40:24'),
	(32, 'instamojo_description', 1, NULL, '2021-12-21 10:40:24', '2021-12-21 10:40:24'),
	(33, 'cod_label', 1, NULL, '2021-12-21 10:40:24', '2021-12-21 10:40:24'),
	(34, 'cod_description', 1, NULL, '2021-12-21 10:40:24', '2021-12-21 10:40:24'),
	(35, 'bank_transfer_label', 1, NULL, '2021-12-21 10:40:24', '2021-12-21 10:40:24'),
	(36, 'bank_transfer_description', 1, NULL, '2021-12-21 10:40:24', '2021-12-21 10:40:24'),
	(37, 'check_payment_label', 1, NULL, '2021-12-21 10:40:24', '2021-12-21 10:40:24'),
	(38, 'check_payment_description', 1, NULL, '2021-12-21 10:40:24', '2021-12-21 10:40:24'),
	(39, 'storefront_copyright_text', 1, 's:92:"Copyright © <a href="{{ store_url }}">{{ store_name }}</a> {{ year }}. All rights reserved.";', '2021-12-21 10:40:24', '2021-12-21 16:50:04'),
	(40, 'storefront_welcome_text', 1, NULL, '2021-12-21 16:50:04', '2021-12-21 16:50:04'),
	(41, 'storefront_address', 1, NULL, '2021-12-21 16:50:04', '2021-12-21 16:50:04'),
	(42, 'storefront_navbar_text', 1, NULL, '2021-12-21 16:50:04', '2021-12-21 16:50:04'),
	(43, 'storefront_footer_menu_one_title', 1, NULL, '2021-12-21 16:50:04', '2021-12-21 16:50:04'),
	(44, 'storefront_footer_menu_two_title', 1, NULL, '2021-12-21 16:50:04', '2021-12-21 16:50:04'),
	(45, 'storefront_feature_1_title', 1, NULL, '2021-12-21 16:50:05', '2021-12-21 16:50:05'),
	(46, 'storefront_feature_1_subtitle', 1, NULL, '2021-12-21 16:50:05', '2021-12-21 16:50:05'),
	(47, 'storefront_feature_2_title', 1, NULL, '2021-12-21 16:50:05', '2021-12-21 16:50:05'),
	(48, 'storefront_feature_2_subtitle', 1, NULL, '2021-12-21 16:50:05', '2021-12-21 16:50:05'),
	(49, 'storefront_feature_3_title', 1, NULL, '2021-12-21 16:50:05', '2021-12-21 16:50:05'),
	(50, 'storefront_feature_3_subtitle', 1, NULL, '2021-12-21 16:50:05', '2021-12-21 16:50:05'),
	(51, 'storefront_feature_4_title', 1, NULL, '2021-12-21 16:50:05', '2021-12-21 16:50:05'),
	(52, 'storefront_feature_4_subtitle', 1, NULL, '2021-12-21 16:50:05', '2021-12-21 16:50:05'),
	(53, 'storefront_feature_5_title', 1, NULL, '2021-12-21 16:50:05', '2021-12-21 16:50:05'),
	(54, 'storefront_feature_5_subtitle', 1, NULL, '2021-12-21 16:50:05', '2021-12-21 16:50:05'),
	(55, 'storefront_product_page_banner_file_id', 1, NULL, '2021-12-21 16:50:06', '2021-12-21 16:50:06'),
	(56, 'storefront_slider_banner_1_file_id', 1, NULL, '2021-12-21 16:50:06', '2021-12-21 16:50:06'),
	(57, 'storefront_slider_banner_2_file_id', 1, NULL, '2021-12-21 16:50:06', '2021-12-21 16:50:06'),
	(58, 'storefront_three_column_full_width_banners_1_file_id', 1, NULL, '2021-12-21 16:50:06', '2021-12-21 16:50:06'),
	(59, 'storefront_three_column_full_width_banners_2_file_id', 1, NULL, '2021-12-21 16:50:06', '2021-12-21 16:50:06'),
	(60, 'storefront_three_column_full_width_banners_3_file_id', 1, NULL, '2021-12-21 16:50:06', '2021-12-21 16:50:06'),
	(61, 'storefront_featured_categories_section_title', 1, NULL, '2021-12-21 16:50:06', '2021-12-21 16:50:06'),
	(62, 'storefront_featured_categories_section_subtitle', 1, NULL, '2021-12-21 16:50:06', '2021-12-21 16:50:06'),
	(63, 'storefront_product_tabs_1_section_tab_1_title', 1, NULL, '2021-12-21 16:50:06', '2021-12-21 16:50:06'),
	(64, 'storefront_product_tabs_1_section_tab_2_title', 1, NULL, '2021-12-21 16:50:06', '2021-12-21 16:50:06'),
	(65, 'storefront_product_tabs_1_section_tab_3_title', 1, NULL, '2021-12-21 16:50:06', '2021-12-21 16:50:06'),
	(66, 'storefront_product_tabs_1_section_tab_4_title', 1, NULL, '2021-12-21 16:50:06', '2021-12-21 16:50:06'),
	(67, 'storefront_two_column_banners_1_file_id', 1, NULL, '2021-12-21 16:50:06', '2021-12-21 16:50:06'),
	(68, 'storefront_two_column_banners_2_file_id', 1, NULL, '2021-12-21 16:50:06', '2021-12-21 16:50:06'),
	(69, 'storefront_product_grid_section_tab_1_title', 1, NULL, '2021-12-21 16:50:07', '2021-12-21 16:50:07'),
	(70, 'storefront_product_grid_section_tab_2_title', 1, NULL, '2021-12-21 16:50:07', '2021-12-21 16:50:07'),
	(71, 'storefront_product_grid_section_tab_3_title', 1, NULL, '2021-12-21 16:50:07', '2021-12-21 16:50:07'),
	(72, 'storefront_product_grid_section_tab_4_title', 1, NULL, '2021-12-21 16:50:07', '2021-12-21 16:50:07'),
	(73, 'storefront_three_column_banners_1_file_id', 1, NULL, '2021-12-21 16:50:07', '2021-12-21 16:50:07'),
	(74, 'storefront_three_column_banners_2_file_id', 1, NULL, '2021-12-21 16:50:07', '2021-12-21 16:50:07'),
	(75, 'storefront_three_column_banners_3_file_id', 1, NULL, '2021-12-21 16:50:07', '2021-12-21 16:50:07'),
	(76, 'storefront_product_tabs_2_section_title', 1, NULL, '2021-12-21 16:50:07', '2021-12-21 16:50:07'),
	(77, 'storefront_product_tabs_2_section_tab_1_title', 1, NULL, '2021-12-21 16:50:07', '2021-12-21 16:50:07'),
	(78, 'storefront_product_tabs_2_section_tab_2_title', 1, NULL, '2021-12-21 16:50:07', '2021-12-21 16:50:07'),
	(79, 'storefront_product_tabs_2_section_tab_3_title', 1, NULL, '2021-12-21 16:50:07', '2021-12-21 16:50:07'),
	(80, 'storefront_product_tabs_2_section_tab_4_title', 1, NULL, '2021-12-21 16:50:07', '2021-12-21 16:50:07'),
	(81, 'storefront_one_column_banner_file_id', 1, NULL, '2021-12-21 16:50:08', '2021-12-21 16:50:08'),
	(82, 'storefront_theme_color', 0, 's:4:"blue";', '2021-12-21 16:50:08', '2021-12-21 16:50:08'),
	(83, 'storefront_custom_theme_color', 0, 's:7:"#000000";', '2021-12-21 16:50:08', '2021-12-21 16:50:08'),
	(84, 'storefront_mail_theme_color', 0, 's:4:"blue";', '2021-12-21 16:50:08', '2021-12-21 16:50:08'),
	(85, 'storefront_custom_mail_theme_color', 0, 's:7:"#000000";', '2021-12-21 16:50:08', '2021-12-21 16:50:08'),
	(86, 'storefront_slider', 0, 's:1:"1";', '2021-12-21 16:50:08', '2021-12-21 16:50:08'),
	(87, 'storefront_terms_page', 0, 'N;', '2021-12-21 16:50:08', '2021-12-21 16:50:08'),
	(88, 'storefront_privacy_page', 0, 'N;', '2021-12-21 16:50:08', '2021-12-21 16:50:08'),
	(89, 'storefront_primary_menu', 0, 's:1:"2";', '2021-12-21 16:50:08', '2021-12-21 17:42:54'),
	(90, 'storefront_category_menu', 0, 's:1:"3";', '2021-12-21 16:50:08', '2021-12-21 18:25:18'),
	(91, 'storefront_footer_menu_one', 0, 'N;', '2021-12-21 16:50:08', '2021-12-21 16:50:08'),
	(92, 'storefront_footer_menu_two', 0, 'N;', '2021-12-21 16:50:08', '2021-12-21 16:50:08'),
	(93, 'storefront_features_section_enabled', 0, 's:1:"1";', '2021-12-21 16:50:08', '2021-12-21 18:36:58'),
	(94, 'storefront_feature_1_icon', 0, 's:12:"las la-truck";', '2021-12-21 16:50:08', '2021-12-21 18:49:20'),
	(95, 'storefront_feature_2_icon', 0, 's:14:"las la-spinner";', '2021-12-21 16:50:08', '2021-12-21 18:52:56'),
	(96, 'storefront_feature_3_icon', 0, 's:16:"las la-life-ring";', '2021-12-21 16:50:08', '2021-12-21 18:52:56'),
	(97, 'storefront_feature_4_icon', 0, 's:15:"las la-envelope";', '2021-12-21 16:50:08', '2021-12-21 18:52:56'),
	(98, 'storefront_feature_5_icon', 0, 's:12:"las la-truck";', '2021-12-21 16:50:08', '2021-12-21 18:59:13'),
	(99, 'storefront_product_page_banner_call_to_action_url', 0, 'N;', '2021-12-21 16:50:08', '2021-12-21 16:50:08'),
	(100, 'storefront_product_page_banner_open_in_new_window', 0, 's:1:"0";', '2021-12-21 16:50:09', '2021-12-21 16:50:09'),
	(101, 'storefront_facebook_link', 0, 'N;', '2021-12-21 16:50:09', '2021-12-21 16:50:09'),
	(102, 'storefront_twitter_link', 0, 'N;', '2021-12-21 16:50:09', '2021-12-21 16:50:09'),
	(103, 'storefront_instagram_link', 0, 'N;', '2021-12-21 16:50:09', '2021-12-21 16:50:09'),
	(104, 'storefront_youtube_link', 0, 'N;', '2021-12-21 16:50:09', '2021-12-21 16:50:09'),
	(105, 'storefront_slider_banner_1_call_to_action_url', 0, 'N;', '2021-12-21 16:50:09', '2021-12-21 16:50:09'),
	(106, 'storefront_slider_banner_1_open_in_new_window', 0, 's:1:"0";', '2021-12-21 16:50:09', '2021-12-21 16:50:09'),
	(107, 'storefront_slider_banner_2_call_to_action_url', 0, 'N;', '2021-12-21 16:50:09', '2021-12-21 16:50:09'),
	(108, 'storefront_slider_banner_2_open_in_new_window', 0, 's:1:"0";', '2021-12-21 16:50:09', '2021-12-21 16:50:09'),
	(109, 'storefront_three_column_full_width_banners_enabled', 0, 's:1:"0";', '2021-12-21 16:50:09', '2021-12-21 18:34:01'),
	(110, 'storefront_three_column_full_width_banners_1_call_to_action_url', 0, 'N;', '2021-12-21 16:50:09', '2021-12-21 16:50:09'),
	(111, 'storefront_three_column_full_width_banners_1_open_in_new_window', 0, 's:1:"0";', '2021-12-21 16:50:09', '2021-12-21 16:50:09'),
	(112, 'storefront_three_column_full_width_banners_2_call_to_action_url', 0, 'N;', '2021-12-21 16:50:09', '2021-12-21 16:50:09'),
	(113, 'storefront_three_column_full_width_banners_2_open_in_new_window', 0, 's:1:"0";', '2021-12-21 16:50:09', '2021-12-21 16:50:09'),
	(114, 'storefront_three_column_full_width_banners_3_call_to_action_url', 0, 'N;', '2021-12-21 16:50:09', '2021-12-21 16:50:09'),
	(115, 'storefront_three_column_full_width_banners_3_open_in_new_window', 0, 's:1:"0";', '2021-12-21 16:50:09', '2021-12-21 16:50:09'),
	(116, 'storefront_featured_categories_section_enabled', 0, 's:1:"0";', '2021-12-21 16:50:09', '2021-12-21 19:04:35'),
	(117, 'storefront_featured_categories_section_category_1_category_id', 0, 'N;', '2021-12-21 16:50:09', '2021-12-21 16:50:09'),
	(118, 'storefront_featured_categories_section_category_1_product_type', 0, 'N;', '2021-12-21 16:50:09', '2021-12-21 16:50:09'),
	(119, 'storefront_featured_categories_section_category_1_products_limit', 0, 'N;', '2021-12-21 16:50:09', '2021-12-21 16:50:09'),
	(120, 'storefront_featured_categories_section_category_2_category_id', 0, 'N;', '2021-12-21 16:50:10', '2021-12-21 16:50:10'),
	(121, 'storefront_featured_categories_section_category_2_product_type', 0, 'N;', '2021-12-21 16:50:10', '2021-12-21 16:50:10'),
	(122, 'storefront_featured_categories_section_category_2_products_limit', 0, 'N;', '2021-12-21 16:50:10', '2021-12-21 16:50:10'),
	(123, 'storefront_featured_categories_section_category_3_category_id', 0, 'N;', '2021-12-21 16:50:10', '2021-12-21 16:50:10'),
	(124, 'storefront_featured_categories_section_category_3_product_type', 0, 'N;', '2021-12-21 16:50:10', '2021-12-21 16:50:10'),
	(125, 'storefront_featured_categories_section_category_3_products_limit', 0, 'N;', '2021-12-21 16:50:10', '2021-12-21 16:50:10'),
	(126, 'storefront_featured_categories_section_category_4_category_id', 0, 'N;', '2021-12-21 16:50:10', '2021-12-21 16:50:10'),
	(127, 'storefront_featured_categories_section_category_4_product_type', 0, 'N;', '2021-12-21 16:50:10', '2021-12-21 16:50:10'),
	(128, 'storefront_featured_categories_section_category_4_products_limit', 0, 'N;', '2021-12-21 16:50:10', '2021-12-21 16:50:10'),
	(129, 'storefront_featured_categories_section_category_5_category_id', 0, 'N;', '2021-12-21 16:50:10', '2021-12-21 16:50:10'),
	(130, 'storefront_featured_categories_section_category_5_product_type', 0, 'N;', '2021-12-21 16:50:10', '2021-12-21 16:50:10'),
	(131, 'storefront_featured_categories_section_category_5_products_limit', 0, 'N;', '2021-12-21 16:50:10', '2021-12-21 16:50:10'),
	(132, 'storefront_featured_categories_section_category_6_category_id', 0, 'N;', '2021-12-21 16:50:10', '2021-12-21 16:50:10'),
	(133, 'storefront_featured_categories_section_category_6_product_type', 0, 'N;', '2021-12-21 16:50:10', '2021-12-21 16:50:10'),
	(134, 'storefront_featured_categories_section_category_6_products_limit', 0, 'N;', '2021-12-21 16:50:10', '2021-12-21 16:50:10'),
	(135, 'storefront_product_tabs_1_section_enabled', 0, 's:1:"1";', '2021-12-21 16:50:10', '2021-12-21 19:29:50'),
	(136, 'storefront_product_tabs_1_section_tab_1_product_type', 0, 's:17:"category_products";', '2021-12-21 16:50:10', '2021-12-21 19:29:50'),
	(137, 'storefront_product_tabs_1_section_tab_1_category_id', 0, 's:1:"1";', '2021-12-21 16:50:10', '2021-12-21 19:29:50'),
	(138, 'storefront_product_tabs_1_section_tab_1_products_limit', 0, 'N;', '2021-12-21 16:50:10', '2021-12-21 16:50:10'),
	(139, 'storefront_product_tabs_1_section_tab_2_product_type', 0, 'N;', '2021-12-21 16:50:10', '2021-12-21 16:50:10'),
	(140, 'storefront_product_tabs_1_section_tab_2_category_id', 0, 'N;', '2021-12-21 16:50:11', '2021-12-21 16:50:11'),
	(141, 'storefront_product_tabs_1_section_tab_2_products_limit', 0, 'N;', '2021-12-21 16:50:11', '2021-12-21 16:50:11'),
	(142, 'storefront_product_tabs_1_section_tab_3_product_type', 0, 'N;', '2021-12-21 16:50:11', '2021-12-21 16:50:11'),
	(143, 'storefront_product_tabs_1_section_tab_3_category_id', 0, 'N;', '2021-12-21 16:50:11', '2021-12-21 16:50:11'),
	(144, 'storefront_product_tabs_1_section_tab_3_products_limit', 0, 'N;', '2021-12-21 16:50:11', '2021-12-21 16:50:11'),
	(145, 'storefront_product_tabs_1_section_tab_4_product_type', 0, 'N;', '2021-12-21 16:50:11', '2021-12-21 16:50:11'),
	(146, 'storefront_product_tabs_1_section_tab_4_category_id', 0, 'N;', '2021-12-21 16:50:11', '2021-12-21 16:50:11'),
	(147, 'storefront_product_tabs_1_section_tab_4_products_limit', 0, 'N;', '2021-12-21 16:50:11', '2021-12-21 16:50:11'),
	(148, 'storefront_top_brands_section_enabled', 0, 's:1:"0";', '2021-12-21 16:50:11', '2021-12-21 16:50:11'),
	(149, 'storefront_flash_sale_and_vertical_products_section_enabled', 0, 's:1:"0";', '2021-12-21 16:50:11', '2021-12-21 16:50:11'),
	(150, 'storefront_flash_sale_title', 0, 'N;', '2021-12-21 16:50:11', '2021-12-21 16:50:11'),
	(151, 'storefront_active_flash_sale_campaign', 0, 'N;', '2021-12-21 16:50:11', '2021-12-21 16:50:11'),
	(152, 'storefront_vertical_products_1_title', 0, 'N;', '2021-12-21 16:50:11', '2021-12-21 16:50:11'),
	(153, 'storefront_vertical_products_1_product_type', 0, 'N;', '2021-12-21 16:50:11', '2021-12-21 16:50:11'),
	(154, 'storefront_vertical_products_1_category_id', 0, 'N;', '2021-12-21 16:50:11', '2021-12-21 16:50:11'),
	(155, 'storefront_vertical_products_1_products_limit', 0, 'N;', '2021-12-21 16:50:11', '2021-12-21 16:50:11'),
	(156, 'storefront_vertical_products_2_title', 0, 'N;', '2021-12-21 16:50:11', '2021-12-21 16:50:11'),
	(157, 'storefront_vertical_products_2_product_type', 0, 'N;', '2021-12-21 16:50:11', '2021-12-21 16:50:11'),
	(158, 'storefront_vertical_products_2_category_id', 0, 'N;', '2021-12-21 16:50:11', '2021-12-21 16:50:11'),
	(159, 'storefront_vertical_products_2_products_limit', 0, 'N;', '2021-12-21 16:50:11', '2021-12-21 16:50:11'),
	(160, 'storefront_vertical_products_3_title', 0, 'N;', '2021-12-21 16:50:11', '2021-12-21 16:50:11'),
	(161, 'storefront_vertical_products_3_product_type', 0, 'N;', '2021-12-21 16:50:12', '2021-12-21 16:50:12'),
	(162, 'storefront_vertical_products_3_category_id', 0, 'N;', '2021-12-21 16:50:12', '2021-12-21 16:50:12'),
	(163, 'storefront_vertical_products_3_products_limit', 0, 'N;', '2021-12-21 16:50:12', '2021-12-21 16:50:12'),
	(164, 'storefront_two_column_banners_enabled', 0, 's:1:"0";', '2021-12-21 16:50:12', '2021-12-21 16:50:12'),
	(165, 'storefront_two_column_banners_1_call_to_action_url', 0, 'N;', '2021-12-21 16:50:12', '2021-12-21 16:50:12'),
	(166, 'storefront_two_column_banners_1_open_in_new_window', 0, 's:1:"0";', '2021-12-21 16:50:12', '2021-12-21 16:50:12'),
	(167, 'storefront_two_column_banners_2_call_to_action_url', 0, 'N;', '2021-12-21 16:50:12', '2021-12-21 16:50:12'),
	(168, 'storefront_two_column_banners_2_open_in_new_window', 0, 's:1:"0";', '2021-12-21 16:50:12', '2021-12-21 16:50:12'),
	(169, 'storefront_product_grid_section_enabled', 0, 's:1:"0";', '2021-12-21 16:50:12', '2021-12-21 16:50:12'),
	(170, 'storefront_product_grid_section_tab_1_product_type', 0, 'N;', '2021-12-21 16:50:12', '2021-12-21 16:50:12'),
	(171, 'storefront_product_grid_section_tab_1_category_id', 0, 'N;', '2021-12-21 16:50:12', '2021-12-21 16:50:12'),
	(172, 'storefront_product_grid_section_tab_1_products_limit', 0, 'N;', '2021-12-21 16:50:12', '2021-12-21 16:50:12'),
	(173, 'storefront_product_grid_section_tab_2_product_type', 0, 'N;', '2021-12-21 16:50:12', '2021-12-21 16:50:12'),
	(174, 'storefront_product_grid_section_tab_2_category_id', 0, 'N;', '2021-12-21 16:50:12', '2021-12-21 16:50:12'),
	(175, 'storefront_product_grid_section_tab_2_products_limit', 0, 'N;', '2021-12-21 16:50:12', '2021-12-21 16:50:12'),
	(176, 'storefront_product_grid_section_tab_3_product_type', 0, 'N;', '2021-12-21 16:50:13', '2021-12-21 16:50:13'),
	(177, 'storefront_product_grid_section_tab_3_category_id', 0, 'N;', '2021-12-21 16:50:13', '2021-12-21 16:50:13'),
	(178, 'storefront_product_grid_section_tab_3_products_limit', 0, 'N;', '2021-12-21 16:50:13', '2021-12-21 16:50:13'),
	(179, 'storefront_product_grid_section_tab_4_product_type', 0, 'N;', '2021-12-21 16:50:13', '2021-12-21 16:50:13'),
	(180, 'storefront_product_grid_section_tab_4_category_id', 0, 'N;', '2021-12-21 16:50:13', '2021-12-21 16:50:13'),
	(181, 'storefront_product_grid_section_tab_4_products_limit', 0, 'N;', '2021-12-21 16:50:13', '2021-12-21 16:50:13'),
	(182, 'storefront_three_column_banners_enabled', 0, 's:1:"0";', '2021-12-21 16:50:13', '2021-12-21 16:50:13'),
	(183, 'storefront_three_column_banners_1_call_to_action_url', 0, 'N;', '2021-12-21 16:50:13', '2021-12-21 16:50:13'),
	(184, 'storefront_three_column_banners_1_open_in_new_window', 0, 's:1:"0";', '2021-12-21 16:50:13', '2021-12-21 16:50:13'),
	(185, 'storefront_three_column_banners_2_call_to_action_url', 0, 'N;', '2021-12-21 16:50:13', '2021-12-21 16:50:13'),
	(186, 'storefront_three_column_banners_2_open_in_new_window', 0, 's:1:"0";', '2021-12-21 16:50:13', '2021-12-21 16:50:13'),
	(187, 'storefront_three_column_banners_3_call_to_action_url', 0, 'N;', '2021-12-21 16:50:13', '2021-12-21 16:50:13'),
	(188, 'storefront_three_column_banners_3_open_in_new_window', 0, 's:1:"0";', '2021-12-21 16:50:13', '2021-12-21 16:50:13'),
	(189, 'storefront_product_tabs_2_section_enabled', 0, 's:1:"0";', '2021-12-21 16:50:13', '2021-12-21 16:50:13'),
	(190, 'storefront_product_tabs_2_section_tab_1_product_type', 0, 'N;', '2021-12-21 16:50:13', '2021-12-21 16:50:13'),
	(191, 'storefront_product_tabs_2_section_tab_1_category_id', 0, 'N;', '2021-12-21 16:50:13', '2021-12-21 16:50:13'),
	(192, 'storefront_product_tabs_2_section_tab_1_products_limit', 0, 'N;', '2021-12-21 16:50:13', '2021-12-21 16:50:13'),
	(193, 'storefront_product_tabs_2_section_tab_2_product_type', 0, 'N;', '2021-12-21 16:50:13', '2021-12-21 16:50:13'),
	(194, 'storefront_product_tabs_2_section_tab_2_category_id', 0, 'N;', '2021-12-21 16:50:13', '2021-12-21 16:50:13'),
	(195, 'storefront_product_tabs_2_section_tab_2_products_limit', 0, 'N;', '2021-12-21 16:50:13', '2021-12-21 16:50:13'),
	(196, 'storefront_product_tabs_2_section_tab_3_product_type', 0, 'N;', '2021-12-21 16:50:13', '2021-12-21 16:50:13'),
	(197, 'storefront_product_tabs_2_section_tab_3_category_id', 0, 'N;', '2021-12-21 16:50:14', '2021-12-21 16:50:14'),
	(198, 'storefront_product_tabs_2_section_tab_3_products_limit', 0, 'N;', '2021-12-21 16:50:14', '2021-12-21 16:50:14'),
	(199, 'storefront_product_tabs_2_section_tab_4_product_type', 0, 'N;', '2021-12-21 16:50:14', '2021-12-21 16:50:14'),
	(200, 'storefront_product_tabs_2_section_tab_4_category_id', 0, 'N;', '2021-12-21 16:50:14', '2021-12-21 16:50:14'),
	(201, 'storefront_product_tabs_2_section_tab_4_products_limit', 0, 'N;', '2021-12-21 16:50:14', '2021-12-21 16:50:14'),
	(202, 'storefront_one_column_banner_enabled', 0, 's:1:"0";', '2021-12-21 16:50:14', '2021-12-21 16:50:14'),
	(203, 'storefront_one_column_banner_call_to_action_url', 0, 'N;', '2021-12-21 16:50:14', '2021-12-21 16:50:14'),
	(204, 'storefront_one_column_banner_open_in_new_window', 0, 's:1:"0";', '2021-12-21 16:50:14', '2021-12-21 16:50:14'),
	(205, 'storefront_footer_tags', 0, 'N;', '2021-12-21 16:50:14', '2021-12-21 16:50:14'),
	(206, 'storefront_featured_categories_section_category_1_products', 0, 'N;', '2021-12-21 16:50:14', '2021-12-21 16:50:14'),
	(207, 'storefront_featured_categories_section_category_2_products', 0, 'N;', '2021-12-21 16:50:14', '2021-12-21 16:50:14'),
	(208, 'storefront_featured_categories_section_category_3_products', 0, 'N;', '2021-12-21 16:50:14', '2021-12-21 16:50:14'),
	(209, 'storefront_featured_categories_section_category_4_products', 0, 'N;', '2021-12-21 16:50:14', '2021-12-21 16:50:14'),
	(210, 'storefront_featured_categories_section_category_5_products', 0, 'N;', '2021-12-21 16:50:14', '2021-12-21 16:50:14'),
	(211, 'storefront_featured_categories_section_category_6_products', 0, 'N;', '2021-12-21 16:50:14', '2021-12-21 16:50:14'),
	(212, 'storefront_product_tabs_1_section_tab_1_products', 0, 'N;', '2021-12-21 16:50:14', '2021-12-21 16:50:14'),
	(213, 'storefront_product_tabs_1_section_tab_2_products', 0, 'N;', '2021-12-21 16:50:14', '2021-12-21 16:50:14'),
	(214, 'storefront_product_tabs_1_section_tab_3_products', 0, 'N;', '2021-12-21 16:50:14', '2021-12-21 16:50:14'),
	(215, 'storefront_product_tabs_1_section_tab_4_products', 0, 'N;', '2021-12-21 16:50:14', '2021-12-21 16:50:14'),
	(216, 'storefront_top_brands', 0, 'N;', '2021-12-21 16:50:14', '2021-12-21 16:50:14'),
	(217, 'storefront_vertical_products_1_products', 0, 'N;', '2021-12-21 16:50:15', '2021-12-21 16:50:15'),
	(218, 'storefront_vertical_products_2_products', 0, 'N;', '2021-12-21 16:50:15', '2021-12-21 16:50:15'),
	(219, 'storefront_vertical_products_3_products', 0, 'N;', '2021-12-21 16:50:15', '2021-12-21 16:50:15'),
	(220, 'storefront_product_grid_section_tab_1_products', 0, 'N;', '2021-12-21 16:50:15', '2021-12-21 16:50:15'),
	(221, 'storefront_product_grid_section_tab_2_products', 0, 'N;', '2021-12-21 16:50:15', '2021-12-21 16:50:15'),
	(222, 'storefront_product_grid_section_tab_3_products', 0, 'N;', '2021-12-21 16:50:15', '2021-12-21 16:50:15'),
	(223, 'storefront_product_grid_section_tab_4_products', 0, 'N;', '2021-12-21 16:50:15', '2021-12-21 16:50:15'),
	(224, 'storefront_product_tabs_2_section_tab_1_products', 0, 'N;', '2021-12-21 16:50:15', '2021-12-21 16:50:15'),
	(225, 'storefront_product_tabs_2_section_tab_2_products', 0, 'N;', '2021-12-21 16:50:15', '2021-12-21 16:50:15'),
	(226, 'storefront_product_tabs_2_section_tab_3_products', 0, 'N;', '2021-12-21 16:50:15', '2021-12-21 16:50:15'),
	(227, 'storefront_product_tabs_2_section_tab_4_products', 0, 'N;', '2021-12-21 16:50:15', '2021-12-21 16:50:15'),
	(228, 'storefront_header_logo', 1, NULL, '2021-12-21 16:52:49', '2021-12-21 16:52:49');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;

-- Dumping structure for table fleet_cart_new.setting_translations
DROP TABLE IF EXISTS `setting_translations`;
CREATE TABLE IF NOT EXISTS `setting_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `setting_id` int(10) unsigned NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `setting_translations_setting_id_locale_unique` (`setting_id`,`locale`),
  CONSTRAINT `setting_translations_setting_id_foreign` FOREIGN KEY (`setting_id`) REFERENCES `settings` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleet_cart_new.setting_translations: ~62 rows (approximately)
DELETE FROM `setting_translations`;
/*!40000 ALTER TABLE `setting_translations` DISABLE KEYS */;
INSERT INTO `setting_translations` (`id`, `setting_id`, `locale`, `value`) VALUES
	(1, 1, 'en', 's:9:"FleetCart";'),
	(2, 22, 'en', 's:13:"Free Shipping";'),
	(3, 23, 'en', 's:12:"Local Pickup";'),
	(4, 24, 'en', 's:9:"Flat Rate";'),
	(5, 25, 'en', 's:6:"PayPal";'),
	(6, 26, 'en', 's:28:"Pay via your PayPal account.";'),
	(7, 27, 'en', 's:6:"Stripe";'),
	(8, 28, 'en', 's:29:"Pay via credit or debit card.";'),
	(9, 29, 'en', 's:8:"Razorpay";'),
	(10, 30, 'en', 's:74:"Pay securely by Credit or Debit card or Internet Banking through Razorpay.";'),
	(11, 31, 'en', 's:9:"Instamojo";'),
	(12, 32, 'en', 's:16:"CC/DB/NB/Wallets";'),
	(13, 33, 'en', 's:16:"Cash On Delivery";'),
	(14, 34, 'en', 's:28:"Pay with cash upon delivery.";'),
	(15, 35, 'en', 's:13:"Bank Transfer";'),
	(16, 36, 'en', 's:100:"Make your payment directly into our bank account. Please use your Order ID as the payment reference.";'),
	(17, 37, 'en', 's:19:"Check / Money Order";'),
	(18, 38, 'en', 's:33:"Please send a check to our store.";'),
	(19, 40, 'en', 'N;'),
	(20, 41, 'en', 'N;'),
	(21, 42, 'en', 'N;'),
	(22, 43, 'en', 'N;'),
	(23, 44, 'en', 'N;'),
	(24, 39, 'en', 's:92:"Copyright © <a href="{{ store_url }}">{{ store_name }}</a> {{ year }}. All rights reserved.";'),
	(25, 45, 'en', 's:18:"Payment & Delivery";'),
	(26, 46, 'en', 's:33:"Free shipping for orders over $50";'),
	(27, 47, 'en', 's:15:"Return & Refund";'),
	(28, 48, 'en', 's:30:"Free 100% money back guarantee";'),
	(29, 49, 'en', 's:15:"Quality Support";'),
	(30, 50, 'en', 's:26:"Alway online feedback 24/7";'),
	(31, 51, 'en', 's:19:"JOIN OUR NEWSLETTER";'),
	(32, 52, 'en', 's:40:"10% off by subscribing to our newsletter";'),
	(33, 53, 'en', 's:18:"Payment & Delivery";'),
	(34, 54, 'en', 's:33:"Free shipping for orders over $50";'),
	(35, 55, 'en', 'N;'),
	(36, 56, 'en', 's:1:"9";'),
	(37, 57, 'en', 's:1:"9";'),
	(38, 58, 'en', 's:1:"1";'),
	(39, 59, 'en', 'N;'),
	(40, 60, 'en', 'N;'),
	(41, 61, 'en', 'N;'),
	(42, 62, 'en', 'N;'),
	(43, 63, 'en', 's:7:"product";'),
	(44, 64, 'en', 'N;'),
	(45, 65, 'en', 'N;'),
	(46, 66, 'en', 'N;'),
	(47, 67, 'en', 'N;'),
	(48, 68, 'en', 'N;'),
	(49, 69, 'en', 'N;'),
	(50, 70, 'en', 'N;'),
	(51, 71, 'en', 'N;'),
	(52, 72, 'en', 'N;'),
	(53, 73, 'en', 'N;'),
	(54, 74, 'en', 'N;'),
	(55, 75, 'en', 'N;'),
	(56, 76, 'en', 'N;'),
	(57, 77, 'en', 'N;'),
	(58, 78, 'en', 'N;'),
	(59, 79, 'en', 'N;'),
	(60, 80, 'en', 'N;'),
	(61, 81, 'en', 'N;'),
	(62, 228, 'en', 's:1:"2";');
/*!40000 ALTER TABLE `setting_translations` ENABLE KEYS */;

-- Dumping structure for table fleet_cart_new.sliders
DROP TABLE IF EXISTS `sliders`;
CREATE TABLE IF NOT EXISTS `sliders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `speed` int(11) DEFAULT NULL,
  `autoplay` tinyint(1) DEFAULT NULL,
  `autoplay_speed` int(11) DEFAULT NULL,
  `fade` tinyint(1) NOT NULL DEFAULT '0',
  `dots` tinyint(1) DEFAULT NULL,
  `arrows` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleet_cart_new.sliders: ~0 rows (approximately)
DELETE FROM `sliders`;
/*!40000 ALTER TABLE `sliders` DISABLE KEYS */;
INSERT INTO `sliders` (`id`, `speed`, `autoplay`, `autoplay_speed`, `fade`, `dots`, `arrows`, `created_at`, `updated_at`) VALUES
	(1, NULL, 1, 3000, 0, 1, 1, '2021-12-21 16:46:11', '2021-12-21 16:46:11');
/*!40000 ALTER TABLE `sliders` ENABLE KEYS */;

-- Dumping structure for table fleet_cart_new.slider_slides
DROP TABLE IF EXISTS `slider_slides`;
CREATE TABLE IF NOT EXISTS `slider_slides` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `slider_id` int(10) unsigned NOT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `call_to_action_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `open_in_new_window` tinyint(1) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `slider_slides_slider_id_foreign` (`slider_id`),
  CONSTRAINT `slider_slides_slider_id_foreign` FOREIGN KEY (`slider_id`) REFERENCES `sliders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleet_cart_new.slider_slides: ~3 rows (approximately)
DELETE FROM `slider_slides`;
/*!40000 ALTER TABLE `slider_slides` DISABLE KEYS */;
INSERT INTO `slider_slides` (`id`, `slider_id`, `options`, `call_to_action_url`, `open_in_new_window`, `position`, `created_at`, `updated_at`) VALUES
	(1, 1, '{"caption_1":{"delay":null,"effect":"fadeInUp"},"caption_2":{"delay":null,"effect":"fadeInUp"},"call_to_action":{"delay":null,"effect":"fadeInUp"}}', '#', 0, 0, '2021-12-21 16:46:11', '2021-12-21 18:15:08'),
	(2, 1, '{"caption_1":{"delay":null,"effect":"fadeInUp"},"caption_2":{"delay":null,"effect":"fadeInUp"},"call_to_action":{"delay":null,"effect":"fadeInUp"}}', '#', 0, 1, '2021-12-21 18:18:15', '2021-12-21 18:18:15'),
	(3, 1, '{"caption_1":{"delay":null,"effect":"fadeInUp"},"caption_2":{"delay":null,"effect":"fadeInUp"},"call_to_action":{"delay":null,"effect":"fadeInUp"}}', '#', 0, 2, '2021-12-21 18:19:55', '2021-12-21 18:19:55');
/*!40000 ALTER TABLE `slider_slides` ENABLE KEYS */;

-- Dumping structure for table fleet_cart_new.slider_slide_translations
DROP TABLE IF EXISTS `slider_slide_translations`;
CREATE TABLE IF NOT EXISTS `slider_slide_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `slider_slide_id` int(10) unsigned NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_id` int(10) unsigned DEFAULT NULL,
  `caption_1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `caption_2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `call_to_action_text` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `direction` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slider_slide_translations_slider_slide_id_locale_unique` (`slider_slide_id`,`locale`),
  CONSTRAINT `slider_slide_translations_slider_slide_id_foreign` FOREIGN KEY (`slider_slide_id`) REFERENCES `slider_slides` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleet_cart_new.slider_slide_translations: ~3 rows (approximately)
DELETE FROM `slider_slide_translations`;
/*!40000 ALTER TABLE `slider_slide_translations` DISABLE KEYS */;
INSERT INTO `slider_slide_translations` (`id`, `slider_slide_id`, `locale`, `file_id`, `caption_1`, `caption_2`, `call_to_action_text`, `direction`) VALUES
	(1, 1, 'en', 6, 'Multi-motion Food Processor', 'Trade-In Offer', 'Shop Now', 'left'),
	(2, 2, 'en', 7, 'New Collection! Air More Uptempo', 'New Arrivals', 'Shop Now', 'left'),
	(3, 3, 'en', 8, 'Lamps Made Of Natural Materials', 'Design special', 'Shop Now', 'left');
/*!40000 ALTER TABLE `slider_slide_translations` ENABLE KEYS */;

-- Dumping structure for table fleet_cart_new.slider_translations
DROP TABLE IF EXISTS `slider_translations`;
CREATE TABLE IF NOT EXISTS `slider_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `slider_id` int(10) unsigned NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slider_translations_slider_id_locale_unique` (`slider_id`,`locale`),
  CONSTRAINT `slider_translations_slider_id_foreign` FOREIGN KEY (`slider_id`) REFERENCES `sliders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleet_cart_new.slider_translations: ~0 rows (approximately)
DELETE FROM `slider_translations`;
/*!40000 ALTER TABLE `slider_translations` DISABLE KEYS */;
INSERT INTO `slider_translations` (`id`, `slider_id`, `locale`, `name`) VALUES
	(1, 1, 'en', 'main-slider');
/*!40000 ALTER TABLE `slider_translations` ENABLE KEYS */;

-- Dumping structure for table fleet_cart_new.tags
DROP TABLE IF EXISTS `tags`;
CREATE TABLE IF NOT EXISTS `tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tags_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleet_cart_new.tags: ~0 rows (approximately)
DELETE FROM `tags`;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` (`id`, `slug`, `created_at`, `updated_at`) VALUES
	(1, 'book', '2021-12-21 19:26:37', '2021-12-21 19:26:37');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;

-- Dumping structure for table fleet_cart_new.tag_translations
DROP TABLE IF EXISTS `tag_translations`;
CREATE TABLE IF NOT EXISTS `tag_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tag_id` int(10) unsigned NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tag_translations_tag_id_locale_unique` (`tag_id`,`locale`),
  CONSTRAINT `tag_translations_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleet_cart_new.tag_translations: ~0 rows (approximately)
DELETE FROM `tag_translations`;
/*!40000 ALTER TABLE `tag_translations` DISABLE KEYS */;
INSERT INTO `tag_translations` (`id`, `tag_id`, `locale`, `name`) VALUES
	(1, 1, 'en', 'book');
/*!40000 ALTER TABLE `tag_translations` ENABLE KEYS */;

-- Dumping structure for table fleet_cart_new.tax_classes
DROP TABLE IF EXISTS `tax_classes`;
CREATE TABLE IF NOT EXISTS `tax_classes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `based_on` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleet_cart_new.tax_classes: ~0 rows (approximately)
DELETE FROM `tax_classes`;
/*!40000 ALTER TABLE `tax_classes` DISABLE KEYS */;
/*!40000 ALTER TABLE `tax_classes` ENABLE KEYS */;

-- Dumping structure for table fleet_cart_new.tax_class_translations
DROP TABLE IF EXISTS `tax_class_translations`;
CREATE TABLE IF NOT EXISTS `tax_class_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tax_class_id` int(10) unsigned NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tax_class_translations_tax_class_id_locale_unique` (`tax_class_id`,`locale`),
  CONSTRAINT `tax_class_translations_tax_class_id_foreign` FOREIGN KEY (`tax_class_id`) REFERENCES `tax_classes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleet_cart_new.tax_class_translations: ~0 rows (approximately)
DELETE FROM `tax_class_translations`;
/*!40000 ALTER TABLE `tax_class_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `tax_class_translations` ENABLE KEYS */;

-- Dumping structure for table fleet_cart_new.tax_rates
DROP TABLE IF EXISTS `tax_rates`;
CREATE TABLE IF NOT EXISTS `tax_rates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tax_class_id` int(10) unsigned NOT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zip` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` decimal(8,4) unsigned NOT NULL,
  `position` int(10) unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tax_rates_tax_class_id_index` (`tax_class_id`),
  CONSTRAINT `tax_rates_tax_class_id_foreign` FOREIGN KEY (`tax_class_id`) REFERENCES `tax_classes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleet_cart_new.tax_rates: ~0 rows (approximately)
DELETE FROM `tax_rates`;
/*!40000 ALTER TABLE `tax_rates` DISABLE KEYS */;
/*!40000 ALTER TABLE `tax_rates` ENABLE KEYS */;

-- Dumping structure for table fleet_cart_new.tax_rate_translations
DROP TABLE IF EXISTS `tax_rate_translations`;
CREATE TABLE IF NOT EXISTS `tax_rate_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tax_rate_id` int(10) unsigned NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tax_rate_translations_tax_rate_id_locale_unique` (`tax_rate_id`,`locale`),
  CONSTRAINT `tax_rate_translations_tax_rate_id_foreign` FOREIGN KEY (`tax_rate_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleet_cart_new.tax_rate_translations: ~0 rows (approximately)
DELETE FROM `tax_rate_translations`;
/*!40000 ALTER TABLE `tax_rate_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `tax_rate_translations` ENABLE KEYS */;

-- Dumping structure for table fleet_cart_new.throttle
DROP TABLE IF EXISTS `throttle`;
CREATE TABLE IF NOT EXISTS `throttle` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `throttle_user_id_foreign` (`user_id`),
  CONSTRAINT `throttle_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleet_cart_new.throttle: ~0 rows (approximately)
DELETE FROM `throttle`;
/*!40000 ALTER TABLE `throttle` DISABLE KEYS */;
/*!40000 ALTER TABLE `throttle` ENABLE KEYS */;

-- Dumping structure for table fleet_cart_new.transactions
DROP TABLE IF EXISTS `transactions`;
CREATE TABLE IF NOT EXISTS `transactions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL,
  `transaction_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_method` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `transactions_order_id_unique` (`order_id`),
  CONSTRAINT `transactions_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleet_cart_new.transactions: ~0 rows (approximately)
DELETE FROM `transactions`;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;

-- Dumping structure for table fleet_cart_new.translations
DROP TABLE IF EXISTS `translations`;
CREATE TABLE IF NOT EXISTS `translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `translations_key_index` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleet_cart_new.translations: ~0 rows (approximately)
DELETE FROM `translations`;
/*!40000 ALTER TABLE `translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `translations` ENABLE KEYS */;

-- Dumping structure for table fleet_cart_new.translation_translations
DROP TABLE IF EXISTS `translation_translations`;
CREATE TABLE IF NOT EXISTS `translation_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `translation_id` int(10) unsigned NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `translation_translations_translation_id_locale_unique` (`translation_id`,`locale`),
  CONSTRAINT `translation_translations_translation_id_foreign` FOREIGN KEY (`translation_id`) REFERENCES `translations` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleet_cart_new.translation_translations: ~0 rows (approximately)
DELETE FROM `translation_translations`;
/*!40000 ALTER TABLE `translation_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `translation_translations` ENABLE KEYS */;

-- Dumping structure for table fleet_cart_new.updater_scripts
DROP TABLE IF EXISTS `updater_scripts`;
CREATE TABLE IF NOT EXISTS `updater_scripts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `script` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleet_cart_new.updater_scripts: ~0 rows (approximately)
DELETE FROM `updater_scripts`;
/*!40000 ALTER TABLE `updater_scripts` DISABLE KEYS */;
INSERT INTO `updater_scripts` (`id`, `script`) VALUES
	(1, 'V2_0_0');
/*!40000 ALTER TABLE `updater_scripts` ENABLE KEYS */;

-- Dumping structure for table fleet_cart_new.up_sell_products
DROP TABLE IF EXISTS `up_sell_products`;
CREATE TABLE IF NOT EXISTS `up_sell_products` (
  `product_id` int(10) unsigned NOT NULL,
  `up_sell_product_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`product_id`,`up_sell_product_id`),
  KEY `up_sell_products_up_sell_product_id_foreign` (`up_sell_product_id`),
  CONSTRAINT `up_sell_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `up_sell_products_up_sell_product_id_foreign` FOREIGN KEY (`up_sell_product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleet_cart_new.up_sell_products: ~0 rows (approximately)
DELETE FROM `up_sell_products`;
/*!40000 ALTER TABLE `up_sell_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `up_sell_products` ENABLE KEYS */;

-- Dumping structure for table fleet_cart_new.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `last_login` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleet_cart_new.users: ~1 rows (approximately)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `password`, `permissions`, `last_login`, `created_at`, `updated_at`) VALUES
	(1, 'admin', 'admin', 'admin@admin.com', '$2y$10$KHncyNKTb41/GTch8b0DxOwu76SidFe87xZvRc.mofvvV5iCTacRa', NULL, '2021-12-21 17:01:11', '2021-12-21 10:40:21', '2021-12-21 17:01:11');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumping structure for table fleet_cart_new.user_roles
DROP TABLE IF EXISTS `user_roles`;
CREATE TABLE IF NOT EXISTS `user_roles` (
  `user_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `user_roles_role_id_foreign` (`role_id`),
  CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleet_cart_new.user_roles: ~1 rows (approximately)
DELETE FROM `user_roles`;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` (`user_id`, `role_id`, `created_at`, `updated_at`) VALUES
	(1, 1, '2021-12-21 10:40:21', '2021-12-21 10:40:21');
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;

-- Dumping structure for table fleet_cart_new.wish_lists
DROP TABLE IF EXISTS `wish_lists`;
CREATE TABLE IF NOT EXISTS `wish_lists` (
  `user_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`,`product_id`),
  KEY `wish_lists_product_id_foreign` (`product_id`),
  CONSTRAINT `wish_lists_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `wish_lists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleet_cart_new.wish_lists: ~0 rows (approximately)
DELETE FROM `wish_lists`;
/*!40000 ALTER TABLE `wish_lists` DISABLE KEYS */;
/*!40000 ALTER TABLE `wish_lists` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
