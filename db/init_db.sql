-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : ven. 31 mars 2023 à 10:58
-- Version du serveur : 8.0.32-0ubuntu0.22.04.2
-- Version de PHP : 8.1.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `les_gorgones`
--

-- --------------------------------------------------------

--
-- Structure de la table `documents`
--

CREATE TABLE `documents` (
  `id` smallint UNSIGNED NOT NULL,
  `document_category_id` tinyint UNSIGNED NOT NULL,
  `user_id` smallint UNSIGNED DEFAULT NULL,
  `title` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `extension` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `documents`
--

INSERT INTO `documents` (`id`, `document_category_id`, `user_id`, `title`, `name`, `extension`, `created_at`, `updated_at`) VALUES
(3, 3, 8, 'attestation assurance', 'V4M7gFhif8s1mIDwOIxvSnz2VSNcrruzUCRzDeT2.pdf', '.pdf', '2022-05-07 14:39:18', '2022-06-16 14:27:18'),
(4, 1, 1, 'contrat attestation assurance', 'wdUTGGcqVgeiEzKbiEBFD94Cu9jcU8MNVYdu3Qjn.pdf', '.pdf', '2022-05-07 14:39:18', '2022-06-16 14:28:12'),
(5, 5, 4, 'attestation vaccination covid', '4B3renxrYlipcoLIzNt22ZVGPgtDeDeBhOEe2e5Q.pdf', '.pdf', '2022-05-07 14:39:18', '2022-06-16 14:28:43'),
(10, 1, 10, 'document de user n°5', '8bCaXAoPog49IJYjEdeeTNkXSmWbVUTtFV0PyFbm.pdf', '.pdf', '2022-05-07 14:53:19', '2022-05-07 15:22:47'),
(11, 4, NULL, 'livret d\'accueil', 'LtcE5blXz8FAu84UMyYHC7HupOTFB0LQF58JhBfg.pdf', '.pdf', '2022-05-10 09:47:07', '2022-06-16 14:02:14'),
(12, 2, NULL, 'document test', 'lcgblEGmG64QeTbWmLr732xilR14uDLDteMmzUui.pdf', '.pdf', '2022-05-21 16:15:17', '2022-05-21 16:15:17'),
(16, 2, 1, 'test uuid timesheet', 'X3v6l0IkU4BwchxzJTvy2LonO9EqfLioSzHmbgiu.odt', '.odt', '2022-06-16 12:43:07', '2022-06-16 12:43:07'),
(17, 1, 1, 'test contrat', 'RaJqi9y0bW6sw0TdvhEvfcNcyakmHjCE6Aq8I2rP.pdf', '.pdf', '2022-06-16 12:57:28', '2022-06-16 12:57:28'),
(24, 5, NULL, 'test décharge', 'VRyde8sfvVsknQvROxNoX0q72e7AeOGtd64KjHdt.pdf', '.pdf', '2022-06-16 13:42:36', '2022-06-16 13:42:36');

-- --------------------------------------------------------

--
-- Structure de la table `document_categories`
--

CREATE TABLE `document_categories` (
  `id` tinyint UNSIGNED NOT NULL,
  `name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_private` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `document_categories`
--

INSERT INTO `document_categories` (`id`, `name`, `is_private`, `created_at`, `updated_at`) VALUES
(1, 'Contrat', 1, '2022-05-07 14:38:58', '2022-05-10 09:52:27'),
(2, 'Facture', 1, '2022-05-07 14:38:58', '2022-05-10 09:54:21'),
(3, 'Carte de visite', 1, '2022-05-07 14:38:58', '2022-06-08 18:02:27'),
(4, 'Livret d\'accueil', 0, '2022-05-07 14:38:58', '2022-05-10 09:55:43'),
(5, 'Décharge', 0, '2022-05-07 14:38:58', '2022-05-10 09:55:55'),
(8, 'RIB', 1, '2022-06-08 17:50:48', '2022-06-08 17:50:48');

-- --------------------------------------------------------

--
-- Structure de la table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_100000_create_password_resets_table', 1),
(2, '2019_08_19_000000_create_failed_jobs_table', 1),
(3, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(4, '2022_04_30_122148_create_tattooists_table', 1),
(5, '2022_04_30_122301_create_pictures_table', 1),
(6, '2022_04_30_122506_create_social_networks_table', 1),
(7, '2022_04_30_122556_create_social_network_tattooist_table', 1),
(8, '2022_04_30_123922_create_workplaces_table', 1),
(9, '2022_04_30_124003_create_tattooist_workplace_table', 1),
(10, '2022_04_30_124214_create_users_table', 1),
(11, '2022_04_30_124313_create_document_categories_table', 1),
(12, '2022_04_30_124359_create_documents_table', 1),
(13, '2022_04_30_124451_create_subscribers_table', 1);

-- --------------------------------------------------------

--
-- Structure de la table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(8, 'App\\Models\\User', 1, 'user_1_token', '0e9ccc308c01af61f0aa2b212ccaefe8c0f7348b307982dfb6ebcf56e93c2b92', '[\"*\"]', NULL, '2022-05-18 14:48:14', '2022-05-18 14:48:14'),
(9, 'App\\Models\\User', 1, 'user_1_token', 'fa2d09ee2c180d500b8fed1b7c01e09333725582685ee3e47144ed2419a9e704', '[\"*\"]', NULL, '2022-05-18 14:50:41', '2022-05-18 14:50:41'),
(10, 'App\\Models\\User', 1, 'user_1_token', '367b62188b6048d18d4888864b11f2c9b9ec83a0e758e5ee13ac56d4efacf99e', '[\"*\"]', NULL, '2022-05-18 14:51:06', '2022-05-18 14:51:06'),
(11, 'App\\Models\\User', 1, 'user_1_token', 'e32048f8b975add9015eb9bf9ab56fff048bc5dedeb551394ded0b9c7292c790', '[\"*\"]', NULL, '2022-05-18 14:53:16', '2022-05-18 14:53:16'),
(12, 'App\\Models\\User', 1, 'user_1_token', '8b9d878685003b6c749bf15201a004d065af1fe15e16c8c3e4c5b22e9c8cad03', '[\"*\"]', NULL, '2022-05-18 15:02:49', '2022-05-18 15:02:49'),
(13, 'App\\Models\\User', 1, 'user_1_token', '178020c1b24ae2288940943c49876311a1b38a30adc5d60f50a86d8835fef137', '[\"*\"]', NULL, '2022-05-18 15:04:40', '2022-05-18 15:04:40'),
(14, 'App\\Models\\User', 1, 'user_1_token', '3e7d164d63feb23d4289712c489bf47bcea078eef3c3f37c60d74c99e334a602', '[\"*\"]', NULL, '2022-05-18 15:04:55', '2022-05-18 15:04:55'),
(15, 'App\\Models\\User', 1, 'user_1_token', 'cfb02fc43d2ee35ce0d061f95272095363a69da245fd2c2610f32262c92341f9', '[\"*\"]', NULL, '2022-05-18 15:07:06', '2022-05-18 15:07:06'),
(16, 'App\\Models\\User', 1, 'user_1_token', 'bed0681dddc11d012959f07f0f5b37b3e8c45997558495d15b9ef2555c034c47', '[\"*\"]', NULL, '2022-05-18 15:07:55', '2022-05-18 15:07:55'),
(17, 'App\\Models\\User', 1, 'user_1_token', 'ecc87b654b58124dd169e9cd56ae8de76157fec3c2abf216a2817dab98e50e86', '[\"*\"]', NULL, '2022-05-19 08:42:48', '2022-05-19 08:42:48'),
(18, 'App\\Models\\User', 1, 'user_1_token', '287460e07a1b666212f01fbc9594e482da2a4f50be9148a99a074b65cf479bbd', '[\"*\"]', NULL, '2022-05-19 13:24:41', '2022-05-19 13:24:41'),
(19, 'App\\Models\\User', 1, 'user_1_token', '2f938a8170dd1364b1be7e7c98795c231aa200ca6b574e996a0b01c22b9b9f58', '[\"*\"]', NULL, '2022-05-19 13:40:25', '2022-05-19 13:40:25'),
(20, 'App\\Models\\User', 1, 'user_1_token', '363119d7708377dafb95bf548bfe85376406aa4e7b10b57f663708a5eb3edeab', '[\"*\"]', NULL, '2022-05-19 13:40:56', '2022-05-19 13:40:56'),
(21, 'App\\Models\\User', 1, 'user_1_token', 'b38fe7ebe9ffba959f4bf39f0b7485628d06e7aae2445269c6c7596925e0c1dd', '[\"*\"]', NULL, '2022-05-19 13:41:50', '2022-05-19 13:41:50'),
(22, 'App\\Models\\User', 1, 'user_1_token', '5dc6ec801b3e2803223b570fa69b0105ebde7fe852fd3ecd3c7a2a363104c80c', '[\"*\"]', NULL, '2022-05-19 13:42:25', '2022-05-19 13:42:25'),
(23, 'App\\Models\\User', 1, 'user_1_token', '4c27eafce8bf2c03672ab1e747f442806a2ea73ba6df29857e472bf4c7f79c31', '[\"*\"]', NULL, '2022-05-19 13:51:51', '2022-05-19 13:51:51'),
(24, 'App\\Models\\User', 1, 'user_1_token', 'bea4f98a0efc8066528f9a2f891fb66d781ce8a1e38100db3d37f1f810d18fec', '[\"*\"]', NULL, '2022-05-19 13:52:00', '2022-05-19 13:52:00'),
(26, 'App\\Models\\User', 1, 'user_1_token', '294d9dcde698c24714be8741418d1c77255f0aaaa01da1e6c3b8c02667dbd568', '[\"*\"]', NULL, '2022-05-19 13:56:14', '2022-05-19 13:56:14'),
(27, 'App\\Models\\User', 1, 'user_1_token', '9d0f0f37dd3b22c6710fd66fcdaf3201bedbbefe1cafaead73968291ce44f6ac', '[\"*\"]', NULL, '2022-05-19 14:08:17', '2022-05-19 14:08:17'),
(28, 'App\\Models\\User', 1, 'user_1_token', 'e1b85de80df720518717eb88235ef4b30bda8cdd5aca0831f7856ebeab57c8b3', '[\"*\"]', NULL, '2022-05-19 14:40:30', '2022-05-19 14:40:30'),
(30, 'App\\Models\\User', 1, 'user_1_token', 'aaac4e547b8e3d264d1b8ad69b0af0499c031d567167f8b294c9b670ceeae638', '[\"*\"]', NULL, '2022-05-20 08:00:37', '2022-05-20 08:00:37'),
(32, 'App\\Models\\User', 1, 'user_1_token', '97e7aa666cfbbd6562103014caf30e8c92190c256c49f1cc9727ebbec65652d8', '[\"*\"]', '2022-05-20 09:05:45', '2022-05-20 08:02:04', '2022-05-20 09:05:45'),
(33, 'App\\Models\\User', 1, 'user_1_token', '1de002088256f8fc11ea66b287f05682330536ecad370540266985fa3574b533', '[\"*\"]', NULL, '2022-05-20 09:06:05', '2022-05-20 09:06:05'),
(36, 'App\\Models\\User', 1, 'user_1_token', '0cbf2ee1268f5bd5cd988dc65f43c83c37f6998a82a0c1ac4b2d899ff6825e6e', '[\"*\"]', NULL, '2022-05-20 09:16:54', '2022-05-20 09:16:54'),
(37, 'App\\Models\\User', 1, 'user_1_token', '2d9f2d58ec677306f6c8eb5af56a26f852ad805278e957a47ad1805d1f874da4', '[\"*\"]', NULL, '2022-05-20 09:24:24', '2022-05-20 09:24:24'),
(38, 'App\\Models\\User', 1, 'user_1_token', '12c0cee8c8f6b3ff0174f742dc28c03989cf69daaa38de1bbdef5aaff8bd2e62', '[\"*\"]', NULL, '2022-05-20 09:25:35', '2022-05-20 09:25:35'),
(40, 'App\\Models\\User', 1, 'user_1_token', '8f787c95c33283db46ceb4809fc13927a5c32b93a5d52745a348e4ea65436e9a', '[\"*\"]', '2022-05-20 11:44:21', '2022-05-20 11:44:03', '2022-05-20 11:44:21'),
(41, 'App\\Models\\User', 1, 'user_1_token', '0eb1a5a6b8a782d40d246029c30cbee15a56965273388cdaa839fa55d8b8ad4d', '[\"*\"]', '2022-05-21 13:39:19', '2022-05-20 11:44:32', '2022-05-21 13:39:19'),
(43, 'App\\Models\\User', 1, 'user_1_token', '6330c065e31d83635fb05023738fc96bf6b012fbf4f98327ce755826869e392f', '[\"*\"]', '2022-05-25 14:30:03', '2022-05-21 16:10:17', '2022-05-25 14:30:03'),
(44, 'App\\Models\\User', 1, 'user_1_token', '540dbbdca8b01c84c9c28979e3df45e90ea6f00abd86912c8dfdfab991956890', '[\"*\"]', NULL, '2022-05-21 17:50:55', '2022-05-21 17:50:55'),
(46, 'App\\Models\\User', 1, 'user_1_token', '72c2cc7d1bd59723f24531b76ad4b2a351da96d2679f1ce92feb1da806de4883', '[\"*\"]', NULL, '2022-05-25 14:31:48', '2022-05-25 14:31:48'),
(47, 'App\\Models\\User', 1, 'user_1_token', 'be6a65b08b4ef5258d6135cd562e37b6652ae65653811ff3075cc2fcc7e447ce', '[\"*\"]', NULL, '2022-05-25 14:31:50', '2022-05-25 14:31:50'),
(48, 'App\\Models\\User', 1, 'user_1_token', '26c7440c337a7f2c73b227671e150243779a50ce11d834f70cdfbdf69d3b329b', '[\"*\"]', NULL, '2022-05-25 14:39:44', '2022-05-25 14:39:44'),
(49, 'App\\Models\\User', 1, 'user_1_token', '5fce019715906aef9273b13cef17ba0a942200b5bdf7455d54621b678c57068b', '[\"*\"]', NULL, '2022-05-25 14:39:46', '2022-05-25 14:39:46'),
(50, 'App\\Models\\User', 1, 'user_1_token', '021bdabbd25aa046ca1038b55ed9ea6888c16c7aef2c1250f4899eba78ddaf8c', '[\"*\"]', NULL, '2022-05-25 14:39:47', '2022-05-25 14:39:47'),
(51, 'App\\Models\\User', 1, 'user_1_token', 'ae4922af9eeaeb0d8afe191d052c7718e52249483586d4f2b42f4ca8fee5c0c9', '[\"*\"]', NULL, '2022-05-25 14:40:19', '2022-05-25 14:40:19'),
(53, 'App\\Models\\User', 1, 'user_1_token', '488f40f4b70ab421d6827764616e6db0599999ac606e9331319e7427add09268', '[\"*\"]', '2022-05-25 15:00:07', '2022-05-25 14:56:39', '2022-05-25 15:00:07'),
(54, 'App\\Models\\User', 1, 'user_1_token', '25827776b3172478088d869ba3998d4fcca153b24b61499cd0f1c9df45ed37a8', '[\"*\"]', '2022-05-26 09:58:13', '2022-05-26 09:58:09', '2022-05-26 09:58:13'),
(55, 'App\\Models\\User', 1, 'user_1_token', 'e79a693efc056627c93d2c0168ed342922af546fec518c16cb5046702d7d3080', '[\"*\"]', '2022-05-26 10:00:01', '2022-05-26 09:58:32', '2022-05-26 10:00:01'),
(56, 'App\\Models\\User', 1, 'user_1_token', 'de11b29963d0843c6b9be867eb036ebfed18dc6214e52991f9b7aae4715e47ce', '[\"*\"]', '2022-05-26 10:05:29', '2022-05-26 10:01:12', '2022-05-26 10:05:29'),
(58, 'App\\Models\\User', 1, 'user_1_token', 'deb9190714ef6bd9211f6855df5b16906316e5e25c4d4626273a78877e216abd', '[\"*\"]', NULL, '2022-05-26 10:47:07', '2022-05-26 10:47:07'),
(59, 'App\\Models\\User', 1, 'user_1_token', 'a09a3be8795cf24d9055b7cb10ee0e2a02cce106496c82719dca52f24759c3fd', '[\"*\"]', NULL, '2022-05-26 10:47:10', '2022-05-26 10:47:10'),
(60, 'App\\Models\\User', 1, 'user_1_token', '75ae2f50d92ec3b8ab0b5b76295b9f5ee86d33aa452525e7470be31ce6047471', '[\"*\"]', NULL, '2022-05-26 10:47:10', '2022-05-26 10:47:10'),
(61, 'App\\Models\\User', 1, 'user_1_token', 'beaa0a24237a01c1766861d8635629f23fcff4ef584f73c8c22347a2e1577bf9', '[\"*\"]', NULL, '2022-05-26 10:47:10', '2022-05-26 10:47:10'),
(62, 'App\\Models\\User', 1, 'user_1_token', 'e434dcd36e7f931b91813cb3a3b6cbd12fd98486ddf8e777010764fa026f4ce9', '[\"*\"]', NULL, '2022-05-26 10:47:11', '2022-05-26 10:47:11'),
(63, 'App\\Models\\User', 1, 'user_1_token', '09cd0b01845b81b40011690de2ffa0d3c7ed8eb2492c343ce9395aa4f7377ccf', '[\"*\"]', NULL, '2022-05-26 10:48:30', '2022-05-26 10:48:30'),
(64, 'App\\Models\\User', 1, 'user_1_token', '1026943df623dd14362d36bf0dffe79fa6138093204ff8ccc7c682e6fd76c92d', '[\"*\"]', NULL, '2022-05-26 10:48:31', '2022-05-26 10:48:31'),
(65, 'App\\Models\\User', 1, 'user_1_token', '0a68fc1ac0c760970d61e124fb2c132052f28ebc30e7c2e8ca653edb933c9920', '[\"*\"]', NULL, '2022-05-26 10:48:32', '2022-05-26 10:48:32'),
(66, 'App\\Models\\User', 1, 'user_1_token', '577ccf68282ac315241cf8739971d1432fe10b1a5be2b63e6916c9866f5ad27c', '[\"*\"]', NULL, '2022-05-26 10:48:32', '2022-05-26 10:48:32'),
(67, 'App\\Models\\User', 1, 'user_1_token', '81470b04aafe76262985d8e5b3c2af2f4ad4f79f7f4b02f1b97b0b2ae0b5633a', '[\"*\"]', NULL, '2022-05-26 10:48:32', '2022-05-26 10:48:32'),
(68, 'App\\Models\\User', 1, 'user_1_token', '1fff5dc78fa060e2b98395dccad93d5bfa80e7044e21bf6c13da26070cfd2e1f', '[\"*\"]', NULL, '2022-05-26 10:50:17', '2022-05-26 10:50:17'),
(69, 'App\\Models\\User', 1, 'user_1_token', '46a4c81423074060d300506e558b6a782ed6172115d056cfd02df4ec48eed005', '[\"*\"]', NULL, '2022-05-26 10:50:17', '2022-05-26 10:50:17'),
(70, 'App\\Models\\User', 1, 'user_1_token', '55a50559d60b9ab911a5a5d752ae710b5b1546559328c1a9aff6504a26983a59', '[\"*\"]', NULL, '2022-05-26 10:50:17', '2022-05-26 10:50:17'),
(71, 'App\\Models\\User', 1, 'user_1_token', '42321a1aba8a5c4c1e27ef32cce4dfc25d21b5911c6db6fad27bb483ca65541e', '[\"*\"]', NULL, '2022-05-26 10:50:18', '2022-05-26 10:50:18'),
(72, 'App\\Models\\User', 1, 'user_1_token', '53b1a5bf52b0ddb615065d56be29e8ad5eec3fbc96bd1bfbdf17843d41031fd0', '[\"*\"]', NULL, '2022-05-26 10:50:18', '2022-05-26 10:50:18'),
(73, 'App\\Models\\User', 1, 'user_1_token', 'd5265cf7d7ff1b10791d117bb8d4a50951e304bc96f95a971cc721bcc479d4fb', '[\"*\"]', NULL, '2022-05-26 10:50:18', '2022-05-26 10:50:18'),
(74, 'App\\Models\\User', 1, 'user_1_token', '66dae9e917fb63ff07abf1cc379f8a4f2143a248b755f25d7a48fe7feabe16d8', '[\"*\"]', NULL, '2022-05-26 10:51:13', '2022-05-26 10:51:13'),
(75, 'App\\Models\\User', 1, 'user_1_token', '03a1f8c9b82f26a7eaead5799ae660b3834dfa2a24b048a6b020c60089cd9803', '[\"*\"]', NULL, '2022-05-26 10:51:14', '2022-05-26 10:51:14'),
(76, 'App\\Models\\User', 1, 'user_1_token', 'e2e884bb1f5c0646b5dadb4e5a7646121f6bc1e740d3d528578c0798b3aa09a3', '[\"*\"]', NULL, '2022-05-26 10:51:14', '2022-05-26 10:51:14'),
(77, 'App\\Models\\User', 1, 'user_1_token', '1d1b108ea7f0d6279b64e7933a215dae86a6c734554f0f951481de0549cf25a6', '[\"*\"]', '2022-05-26 10:51:46', '2022-05-26 10:51:38', '2022-05-26 10:51:46'),
(78, 'App\\Models\\User', 1, 'user_1_token', 'b31b04103b9094a8fb17852eae3fdef580d7fa6922d573c2ad9e5987b4015125', '[\"*\"]', NULL, '2022-05-26 10:53:58', '2022-05-26 10:53:58'),
(79, 'App\\Models\\User', 1, 'user_1_token', 'cc1c695569dd517502210c17e0eb7e4b7f7d8cbb321c12c1a446ede268ed2cb3', '[\"*\"]', '2022-05-26 10:56:33', '2022-05-26 10:55:09', '2022-05-26 10:56:33'),
(80, 'App\\Models\\User', 1, 'user_1_token', 'c512dc50f8937db904d435b9b17844c8cc53c141b0dd3c23619cbc4b9073d9d7', '[\"*\"]', NULL, '2022-05-26 10:59:50', '2022-05-26 10:59:50'),
(81, 'App\\Models\\User', 1, 'user_1_token', '66980b0edcb4649d3ee8e9e0068ae2ad762e05037e9e913a2689e111dd9c3ac7', '[\"*\"]', '2022-05-26 11:12:37', '2022-05-26 11:06:54', '2022-05-26 11:12:37'),
(82, 'App\\Models\\User', 1, 'user_1_token', '7e1c8a71e95776cff987076f5bb8a8fd86094f787986fd6469d2857b1590c8fa', '[\"*\"]', NULL, '2022-05-26 11:14:53', '2022-05-26 11:14:53'),
(83, 'App\\Models\\User', 1, 'user_1_token', 'ef8f16ef063587fd12a941bf59470cbfd420269a2c6a5d95e6e97dfa5496ddcb', '[\"*\"]', NULL, '2022-05-26 11:19:24', '2022-05-26 11:19:24'),
(84, 'App\\Models\\User', 1, 'user_1_token', '93eaa14b51ed7112eae380d3e9fb817e399e93426a78a64c80aceae5898fca8d', '[\"*\"]', NULL, '2022-05-26 11:20:37', '2022-05-26 11:20:37'),
(85, 'App\\Models\\User', 1, 'user_1_token', '2211be55610958d8b5c7bfbe6c47cc80f86126e0e678c643f984c2787bb2a832', '[\"*\"]', NULL, '2022-05-26 11:27:24', '2022-05-26 11:27:24'),
(86, 'App\\Models\\User', 1, 'user_1_token', 'e7eb3ea901733bba036f0d273accf08122cca3a77dcd056c47654268c0fc9e9c', '[\"*\"]', NULL, '2022-05-26 11:29:00', '2022-05-26 11:29:00'),
(87, 'App\\Models\\User', 1, 'user_1_token', '39f05a2014ff5e09e20e551fbd8019d5690780703e95f7e2dcb0b8dd83f9eb27', '[\"*\"]', NULL, '2022-05-26 11:32:26', '2022-05-26 11:32:26'),
(88, 'App\\Models\\User', 1, 'user_1_token', 'd2355d7e405e54c4e3266c0455807afef26185ab6822d2adf69d36ec30e99324', '[\"*\"]', '2022-05-26 11:49:12', '2022-05-26 11:43:48', '2022-05-26 11:49:12'),
(89, 'App\\Models\\User', 1, 'user_1_token', 'b03a428ae73c91e8abd0d7403027b66b2c3da90e7c8848736030def829e19344', '[\"*\"]', '2022-05-26 12:03:03', '2022-05-26 11:59:50', '2022-05-26 12:03:03'),
(90, 'App\\Models\\User', 1, 'user_1_token', '241b346c8f597d4cc397a33a52373b9ce66066df70724d95767577a48dc6c0e8', '[\"*\"]', '2022-05-26 12:04:51', '2022-05-26 12:03:14', '2022-05-26 12:04:51'),
(91, 'App\\Models\\User', 1, 'user_1_token', 'edc82afe6348a2ebe0d9cbd634ec853f95bc71b2423de9fb1b1482ba03eaa58d', '[\"*\"]', '2022-05-30 13:37:55', '2022-05-26 12:05:51', '2022-05-30 13:37:55'),
(94, 'App\\Models\\User', 1, 'user_1_token', '859035dd2a1b3e5b58c18d487c2bb78cd2f40c0c2f4c14131810d10b0c9467a0', '[\"*\"]', '2022-06-09 13:30:03', '2022-06-09 13:29:59', '2022-06-09 13:30:03'),
(95, 'App\\Models\\User', 1, 'user_1_token', '81040c394aa73687d61f88d6b7b87add2b04b15439ad0a29f6a9e0588a13ef3e', '[\"*\"]', NULL, '2022-06-09 13:30:23', '2022-06-09 13:30:23'),
(96, 'App\\Models\\User', 1, 'user_1_token', '217799abecac9243251dc94c8cf4d34fb0f9788e04279e2a137e52779c7e388a', '[\"*\"]', '2022-06-09 13:30:57', '2022-06-09 13:30:56', '2022-06-09 13:30:57'),
(99, 'App\\Models\\User', 1, 'user_1_token', '2372971a86b88036412cd075d6cf8dab4917c00422fb338140c156c7ec7cb15d', '[\"*\"]', NULL, '2022-06-09 13:36:23', '2022-06-09 13:36:23'),
(101, 'App\\Models\\User', 1, 'user_1_token', 'ba269e7b49db7fbfec1c4489e9c8cbc97fdca4c75a98738d081de993f086c7b2', '[\"*\"]', '2022-06-10 14:36:03', '2022-06-09 18:21:33', '2022-06-10 14:36:03'),
(102, 'App\\Models\\User', 1, 'user_1_token', '4bd90ebb6b184ca27babf02102390f84753f11da68afb86d2415f409019b0ea3', '[\"*\"]', '2022-06-13 11:23:12', '2022-06-10 14:36:56', '2022-06-13 11:23:12'),
(103, 'App\\Models\\User', 1, 'user_1_token', '2357239a9473e57e056d9443aabc4c637e7130f9ac1fe5e313f91d4e38460b88', '[\"*\"]', '2022-07-02 12:55:36', '2022-06-11 16:26:13', '2022-07-02 12:55:36'),
(108, 'App\\Models\\User', 1, 'user_1_token', '7b4ee726a909e3cf84e882c1531be23630fc0f074107fbf7247b586d782bd1d9', '[\"*\"]', '2022-06-13 09:28:39', '2022-06-13 09:27:19', '2022-06-13 09:28:39'),
(110, 'App\\Models\\User', 1, 'user_1_token', '7375c25b256a4ef6852dd519ad456de568b2397644ce2983a1699e3f082ab14e', '[\"*\"]', '2022-06-13 09:30:11', '2022-06-13 09:29:39', '2022-06-13 09:30:11'),
(111, 'App\\Models\\User', 1, 'user_1_token', 'b9662d86ca942de7522c6ea453cdba9ba69d9db99bf96884a2445a63458e7f8f', '[\"*\"]', '2022-06-22 07:16:11', '2022-06-13 09:30:12', '2022-06-22 07:16:11'),
(112, 'App\\Models\\User', 1, 'user_1_token', '0f2e1f54e61d32bcfdcd4fa77f26f147b35d6659efaa5c9e28b9b6b083f43960', '[\"*\"]', '2022-06-24 14:24:59', '2022-06-13 13:38:57', '2022-06-24 14:24:59'),
(113, 'App\\Models\\User', 1, 'user_1_token', 'ca5cc56f86a8b43857645aedf664a6dc2f458b0290a93eca8ecb322888f52e30', '[\"*\"]', '2022-06-22 07:54:13', '2022-06-22 07:51:52', '2022-06-22 07:54:13'),
(114, 'App\\Models\\User', 4, 'user_4_token', '0f9fe73a2b3cf68cc01f8a53a307079d9e7c5b5a9afb28f4ffcc7a64c4b16a27', '[\"*\"]', '2022-06-22 07:55:22', '2022-06-22 07:54:32', '2022-06-22 07:55:22'),
(115, 'App\\Models\\User', 1, 'user_1_token', '3b23b1b59d96a9c98032716a1c1f41cb302c0d478e1f6660ef92eec39e7c14c4', '[\"*\"]', '2022-06-24 09:11:01', '2022-06-24 08:27:22', '2022-06-24 09:11:01'),
(117, 'App\\Models\\User', 4, 'user_4_token', '2d8c979de220faf99c2fabd7566a72ec02440e309308e7967e4d203a77726951', '[\"*\"]', '2022-06-24 09:12:24', '2022-06-24 08:59:50', '2022-06-24 09:12:24'),
(119, 'App\\Models\\User', 4, 'user_4_token', 'b65de0407d9e212d51f9fa5cc67520b3e79d00bc83c758075521fa18a1b9da98', '[\"*\"]', '2022-06-28 09:09:37', '2022-06-24 11:31:03', '2022-06-28 09:09:37'),
(120, 'App\\Models\\User', 4, 'user_4_token', '0031b22ccfc9ee8c25e87c3f9e186f57d5de1b6daf685a73624a8b9e80abe6d9', '[\"*\"]', '2022-07-02 13:10:22', '2022-06-24 14:25:09', '2022-07-02 13:10:22'),
(121, 'App\\Models\\User', 1, 'user_1_token', '49a1f109ba697481e76c12e5e8a21f8e9e7f5fc355118e7a1d73071fb11b3f77', '[\"*\"]', '2022-06-28 14:53:24', '2022-06-28 09:10:38', '2022-06-28 14:53:24'),
(122, 'App\\Models\\User', 1, 'user_1_token', '9538ad2245666f2cfeba5b54b8975b8b50d9df7fefb10d046d26756bb7896e39', '[\"*\"]', '2022-06-30 12:55:44', '2022-06-30 12:55:21', '2022-06-30 12:55:44'),
(123, 'App\\Models\\User', 4, 'user_4_token', '3f8c28987dc9cf491145b75d4260f610876671fdde74c3da202effce062e438f', '[\"*\"]', '2022-06-30 12:56:46', '2022-06-30 12:55:53', '2022-06-30 12:56:46'),
(124, 'App\\Models\\User', 1, 'user_1_token', 'a155ea8f1fc2a2712c811bda4c708994a8cc812ec44ff7715a9f77dc4f5a7a49', '[\"*\"]', '2022-06-30 12:58:20', '2022-06-30 12:56:57', '2022-06-30 12:58:20'),
(125, 'App\\Models\\User', 4, 'user_4_token', '01b21643d9e6c75a46786e6c1f824dd22a7dafba6e3d679f98b3e27406f981b9', '[\"*\"]', '2022-06-30 12:58:31', '2022-06-30 12:58:29', '2022-06-30 12:58:31'),
(126, 'App\\Models\\User', 1, 'user_1_token', '63c018a520b4a03ba894ef79cbb10b8eedb05b06b973ffd018fe4d1d76c34f8f', '[\"*\"]', '2022-07-02 12:57:11', '2022-07-02 12:56:41', '2022-07-02 12:57:11'),
(127, 'App\\Models\\User', 4, 'user_4_token', '75a08d18c5b76996f13b72aaf1a05bc1af8c5d2404910df5d701c4f52c3aaf09', '[\"*\"]', '2022-07-02 12:58:22', '2022-07-02 12:57:22', '2022-07-02 12:58:22'),
(129, 'App\\Models\\User', 1, 'user_1_token', '5a7bf9accec0223ecb1fed05139aab9bc73c09c87831359f62756d1c5c899dab', '[\"*\"]', '2022-07-05 10:13:43', '2022-07-02 13:13:32', '2022-07-05 10:13:43'),
(132, 'App\\Models\\User', 1, 'user_1_token', '843faf1db6aff5438c8592dbd5cf4a9f36e8b62d0cb0be8536315e5eb9e8f7e8', '[\"*\"]', '2022-07-05 18:56:34', '2022-07-05 18:54:11', '2022-07-05 18:56:34');

-- --------------------------------------------------------

--
-- Structure de la table `pictures`
--

CREATE TABLE `pictures` (
  `id` smallint UNSIGNED NOT NULL,
  `tattooist_id` smallint UNSIGNED NOT NULL,
  `picture_id` smallint UNSIGNED NOT NULL,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_main` tinyint(1) NOT NULL DEFAULT '0',
  `is_visible` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `pictures`
--

INSERT INTO `pictures` (`id`, `tattooist_id`, `picture_id`, `name`, `is_main`, `is_visible`, `created_at`, `updated_at`) VALUES
(4, 2, 92, 'cwzXquKV4D2vaS9CACRSpYZtQkl05hgEN41XYj9G.png', 1, 1, '2022-05-07 14:38:58', '2022-06-12 18:47:19'),
(5, 2, 24, 'nIZ3NGU8kZmAF0YpUkiP6jtHqdWSL15Ynt4HfVas.png', 0, 1, '2022-05-07 14:38:58', '2022-06-12 18:47:57'),
(6, 2, 15, 'sTJsWwR8M39Jx16ejRNKrxadTQsxjQLa3au9s45A.png', 0, 1, '2022-05-07 14:38:58', '2022-06-12 18:47:47'),
(7, 3, 57, '8dc896ad-8b74-371e-8536-c5a5b01efc23.application', 1, 0, '2022-05-07 14:38:58', '2022-05-07 17:04:35'),
(8, 3, 8, '36ad4865-8ebd-3042-81e2-98b0625e4d5d.pls', 0, 0, '2022-05-07 14:38:58', '2022-05-07 17:18:04'),
(9, 3, 62, 'a6bfa130-a60e-3ca9-b36b-09d3f789e7f3.yin', 0, 1, '2022-05-07 14:38:58', '2022-05-07 14:38:58'),
(10, 4, 1, 'YkHdZ2A36Zxgb94EGEInOohjJSSFUetuBVbfCGzq.png', 1, 1, '2022-05-07 14:38:58', '2022-06-13 07:35:43'),
(12, 4, 2, '8ef8150d-9680-38b2-a4fe-49eb0106fa5a.otc', 1, 1, '2022-05-07 14:38:58', '2022-05-07 14:38:58'),
(13, 5, 70, '0616f70d-32c7-3868-854d-5be357308141.psd', 0, 1, '2022-05-07 14:38:58', '2022-05-07 14:38:58'),
(14, 5, 89, '37e31462-07d7-38d6-a3cb-d2db45233eb4.wax', 0, 1, '2022-05-07 14:38:58', '2022-05-07 14:38:58'),
(15, 5, 4, '6f42a594-725b-3cf3-8598-dc46a4e9763e.ustar', 1, 1, '2022-05-07 14:38:58', '2022-05-07 14:38:58'),
(16, 6, 0, '6db55aed-6300-3246-94f8-74a6e67f629e.uvm', 0, 1, '2022-05-07 14:38:58', '2022-05-07 14:38:58'),
(17, 6, 18, 'c89d26b2-1bd5-31df-a3fe-8aacaaf445ae.oth', 1, 1, '2022-05-07 14:38:58', '2022-05-07 14:38:58'),
(18, 6, 94, '6538cbba-7b1a-304f-b2f9-f39f9c0c9662.itp', 0, 1, '2022-05-07 14:38:58', '2022-05-07 14:38:58'),
(19, 7, 45, '6429d09b-154e-35dd-b834-6ef804f706e7.in', 0, 1, '2022-05-07 14:38:58', '2022-05-07 14:38:58'),
(20, 7, 91, '2bc44ec9-5a9b-3552-8c26-10e8083215c2.oth', 0, 1, '2022-05-07 14:38:58', '2022-05-07 14:38:58'),
(21, 7, 22, '475dbb7c-38c0-35b2-8605-83e042edf891.btif', 1, 1, '2022-05-07 14:38:58', '2022-05-07 14:38:58'),
(22, 8, 84, '863a047e-b915-32c3-8e04-67b0b0b4051e.gif', 0, 0, '2022-05-07 14:38:58', '2022-05-07 14:38:58'),
(23, 8, 33, '5aec33e3-531e-3a65-be8e-3d8c98375332.mxl', 1, 1, '2022-05-07 14:38:58', '2022-05-07 14:38:58'),
(24, 8, 82, '84e2153b-b572-3f17-bd77-2188a8f4e232.s', 1, 1, '2022-05-07 14:38:58', '2022-05-07 14:38:58'),
(25, 9, 67, '6a8848bb-6866-3992-b7cb-2325dc3f783e.3ds', 0, 1, '2022-05-07 14:38:58', '2022-05-07 14:38:58'),
(26, 9, 39, '1d1479b9-99cf-3542-bf19-ae02e0c939d6.gdl', 1, 1, '2022-05-07 14:38:58', '2022-05-07 14:38:58'),
(27, 9, 69, 'a2720c2b-119f-3302-9744-07d8487ebba6.sm', 1, 1, '2022-05-07 14:38:58', '2022-05-07 14:38:58'),
(28, 10, 88, '87e3f8c4-0d90-3806-b9be-6437abeeae88.kia', 1, 1, '2022-05-07 14:38:58', '2022-05-07 14:38:58'),
(29, 10, 77, '9bedade1-5346-3784-bac6-3e9d89843be7.mk3d', 0, 1, '2022-05-07 14:38:58', '2022-05-07 14:38:58'),
(30, 10, 52, '6624d676-b727-33a8-8ad0-20f2957eb6e2.pot', 1, 1, '2022-05-07 14:38:58', '2022-05-07 14:38:58'),
(36, 1, 1, 'yXNKw4Qxgqo6WKxnL0x6fdpRbM83WDSpQswhoSC7.png', 0, 0, '2022-05-07 17:40:28', '2022-06-13 07:57:30'),
(37, 1, 2, '1jFb3vTrxR8VGHdw8e5OQXK2WXY8vulqUDf31O5A.png', 0, 1, '2022-05-07 17:40:29', '2022-06-11 17:03:29'),
(39, 1, 3, '5EnMY7OWp1Sy5n0UtPPQUrSEHqwiort71QXr0Weq.png', 0, 0, '2022-05-07 18:40:56', '2022-06-11 17:04:34'),
(40, 1, 4, 'OKA0a01p57ftykbglXHV80wUAMGCctUbF10Kvgn2.png', 1, 1, '2022-06-11 11:17:52', '2022-06-12 18:43:36'),
(41, 1, 5, 'KkNYCuV8TSNziwFqWB87v39iWLympiRNFiBVTJZw.png', 0, 1, '2022-06-11 11:55:57', '2022-06-12 17:46:29'),
(42, 1, 6, 'HRyyc1hUv8fwIqaIBp9mvKuycFTSSgp2MI8zG08P.png', 0, 1, '2022-06-11 16:27:41', '2022-06-11 17:06:04'),
(46, 1, 7, 'lvp0HLVVU9tbyTayQfv1jJ8nypFqlWMy2JjO02IZ.jpg', 0, 1, '2022-06-11 16:53:40', '2022-06-12 17:46:11'),
(48, 1, 8, 'l4s3EoH3y7HjCVx5yimk376FrwfR2CYRbYH50a2q.jpg', 0, 1, '2022-06-11 17:08:46', '2022-06-12 17:46:11'),
(49, 4, 3, '9ayu2RGSYTbCbYAdU1RbjgLPO4aQpSEN9e1oziVB.png', 0, 1, '2022-06-11 17:12:00', '2022-07-05 18:52:21'),
(50, 4, 4, 'UWpqMupLp7ZihjZSKPlAMsZHdlgqSA4T2V3O8zFF.png', 0, 1, '2022-06-11 17:18:33', '2022-06-11 17:18:33'),
(51, 1, 9, 'ysvHukCGJH7TII1KcbadD7bWwsbC0U1t6msS7lPD.png', 0, 1, '2022-06-12 17:31:07', '2022-06-12 17:46:11'),
(52, 1, 10, '5TvVE3GkfnOsRp3yIw91bI9Xfs79pbOsPbQLUmu9.png', 0, 1, '2022-06-12 17:45:48', '2022-06-12 17:46:11'),
(53, 31, 1, 'Hko22BZmivrwaUKt9VQKLGahRidZUEZiU693AOt1.jpg', 1, 1, '2022-06-12 18:56:14', '2022-06-12 18:56:56'),
(54, 1, 11, 'nwhJaKK4XXuaGApKZcfWLmwmSgp7FUTvpzUlUf5N.jpg', 0, 1, '2022-06-13 07:31:54', '2022-06-13 07:31:54'),
(58, 4, 5, 'TSac41RIHdYfHV6SiWgX94agFMXn3QY6saYBAunL.png', 0, 1, '2022-07-05 18:52:07', '2022-07-05 18:52:07'),
(60, 4, 6, 'QeB0tNEEDNCZ79cUYmhNiRL0ECrtOke2NqwPswEd.jpg', 0, 1, '2022-07-05 18:56:34', '2022-07-05 18:56:34');

-- --------------------------------------------------------

--
-- Structure de la table `social_networks`
--

CREATE TABLE `social_networks` (
  `id` tinyint UNSIGNED NOT NULL,
  `name` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `social_networks`
--

INSERT INTO `social_networks` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Discord', '2022-05-07 14:38:58', '2022-05-10 10:07:10'),
(2, 'Etsy', '2022-05-07 14:38:58', '2022-05-10 10:07:26'),
(3, 'Facebook', '2022-05-07 14:38:58', '2022-05-10 10:07:33'),
(4, 'Flickr', '2022-05-07 14:38:58', '2022-05-10 10:07:47'),
(5, 'Instagram', '2022-05-07 14:38:58', '2022-05-10 10:08:08'),
(6, 'LinkedIn', '2022-05-07 14:38:58', '2022-05-10 10:08:23'),
(7, 'Messenger', '2022-05-07 14:38:58', '2022-05-10 10:08:32'),
(8, 'Pinterest', '2022-05-07 14:38:58', '2022-05-10 10:08:46'),
(9, 'RedBubble', '2022-05-07 14:38:58', '2022-05-10 10:08:55'),
(10, 'Reddit', '2022-05-07 14:38:58', '2022-05-10 10:09:03'),
(11, 'Skype', '2022-05-10 10:10:30', '2022-05-10 10:10:30'),
(12, 'Snapchat', '2022-05-10 10:10:53', '2022-05-10 10:10:53'),
(13, 'Teams', '2022-05-10 10:10:53', NULL),
(14, 'Telegram', '2022-05-10 10:11:05', '2022-05-10 10:11:05'),
(15, 'TikTok', '2022-05-10 10:11:11', '2022-05-10 10:11:11'),
(16, 'Tumblr', '2022-05-10 10:11:16', '2022-05-10 10:11:16'),
(18, 'Twitter', '2022-05-10 10:11:31', '2022-05-10 10:11:31'),
(19, 'Viber', '2022-05-10 10:11:36', '2022-05-10 10:11:36'),
(20, 'Whatsapp', '2022-05-10 10:11:43', '2022-05-10 10:11:43'),
(21, 'Youtube', '2022-05-10 10:11:52', '2022-05-10 10:11:52');

-- --------------------------------------------------------

--
-- Structure de la table `social_network_tattooist`
--

CREATE TABLE `social_network_tattooist` (
  `id` smallint UNSIGNED NOT NULL,
  `tattooist_id` smallint UNSIGNED NOT NULL,
  `social_network_id` tinyint UNSIGNED NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `social_network_tattooist`
--

INSERT INTO `social_network_tattooist` (`id`, `tattooist_id`, `social_network_id`, `url`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'https://github.com/themsaid/laravel-langman', '2022-05-07 14:38:58', '2022-05-10 10:33:42'),
(4, 4, 9, 'http://martinez.fr/', '2022-05-07 14:38:58', '2022-05-07 14:38:58'),
(8, 1, 5, 'https://www.instagram.com/', '2022-06-09 18:28:29', '2022-06-09 18:28:29'),
(12, 1, 7, 'http://dolline.com', '2022-07-05 11:24:44', '2022-07-05 11:24:44'),
(14, 1, 3, 'http://localhost:3000/tattooist-profile/social-networks/new', '2022-07-05 11:26:14', '2022-07-05 11:26:14'),
(17, 4, 6, 'https://www.instagram.com', '2022-07-05 16:09:59', '2022-07-05 16:09:59');

-- --------------------------------------------------------

--
-- Structure de la table `subscribers`
--

CREATE TABLE `subscribers` (
  `id` smallint UNSIGNED NOT NULL,
  `email` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `subscribers`
--

INSERT INTO `subscribers` (`id`, `email`, `created_at`, `updated_at`) VALUES
(3, 'valentine57@dbmail.com', '2022-05-07 14:39:18', '2022-05-07 14:39:18'),
(4, 'richard.gaillard@noos.fr', '2022-05-07 14:39:18', '2022-05-07 14:39:18'),
(7, 'simone70@live.com', '2022-05-07 14:39:18', '2022-05-07 14:39:18'),
(8, 'benoit03@dbmail.com', '2022-05-07 14:39:18', '2022-05-07 14:39:18'),
(9, 'anais.peltier@sfr.fr', '2022-05-07 14:39:18', '2022-05-07 14:39:18'),
(10, 'astrid11@hotmail.fr', '2022-05-07 14:39:18', '2022-05-07 14:39:18'),
(12, 'bleblanc@sfr.fr', '2022-05-07 14:39:18', '2022-05-07 14:39:18'),
(13, 'gilles.lombard@orange.fr', '2022-05-07 14:39:18', '2022-05-07 14:39:18'),
(14, 'elefevre@gmail.com', '2022-05-07 14:39:18', '2022-05-07 14:39:18'),
(16, 'noemi79@live.com', '2022-05-07 14:39:18', '2022-05-07 14:39:18'),
(17, 'gautier.camille@tele2.fr', '2022-05-07 14:39:18', '2022-05-07 14:39:18'),
(18, 'cmahe@tele2.fr', '2022-05-07 14:39:18', '2022-05-07 14:39:18'),
(19, 'langlois.laure@gmail.com', '2022-05-07 14:39:18', '2022-05-07 14:39:18'),
(20, 'nmary@orange.fr', '2022-05-07 14:39:18', '2022-05-07 14:39:18'),
(21, 'm.delabre@exemple.fr', '2022-05-10 10:21:34', '2022-05-10 10:21:34');

-- --------------------------------------------------------

--
-- Structure de la table `tattooists`
--

CREATE TABLE `tattooists` (
  `id` smallint UNSIGNED NOT NULL,
  `is_resident` tinyint(1) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `tattooists`
--

INSERT INTO `tattooists` (`id`, `is_resident`, `is_active`, `name`, `email`, `description`, `created_at`, `updated_at`) VALUES
(1, 0, 1, 'Guillaume Le Barre', 'cohen.auguste@example.com', 'Bonjour je m\'appelle Guillaume et j\'aime les chats', '2022-05-07 14:38:58', '2022-06-12 17:20:14'),
(2, 0, 1, 'Gérard Lemaitre-Faivre', 'hnguyen@example.org', 'Félicité sanglotait: -- Ah! encore, dit Rodolphe. Ne partons pas! Restez! Il l\'entraîna plus loin, essoufflée, près de l\'autre, ils virent entrer par la bouffissure de ses deux nourrissons et son.', '2022-05-07 14:38:58', '2022-06-12 18:47:19'),
(3, 0, 1, 'Constance-Océane Blanchard', 'daniel83@example.net', 'Elle se rappela toutes les fois que Félicité nommait quelqu\'un, Emma répliquait: -- Est-ce que cela l\'avait saisie tout à coup, comme à celle d\'Amiens, et sert quelquefois aux rouliers allant de.', '2022-05-07 14:38:58', '2022-06-12 19:06:52'),
(4, 1, 1, 'Jean Micheline', 'jean-micheline@example.org', 'Y songes-tu? Est-ce possible? Il me semble pourtant, dit Emma, que vous le morceau qu\'on choisissait. Sur le mur de plâtre. Léon se mit à fumer. Il fumait en avançant les lèvres, crachant à toute.', '2022-05-07 14:38:58', '2022-07-05 15:58:42'),
(5, 1, 1, 'Marc Letellier', 'virginie.teixeira@example.net', 'Quelquefois, il apparaissait tout à coup illuminé les airs. On eût dit qu\'un artiste habile en corruptions avait disposé sur sa poitrine; et son âme l\'abandonner par ce souvenir, comme les mille.', '2022-05-07 14:38:58', '2022-05-07 14:38:58'),
(6, 0, 0, 'Océane Buisson-Mace', 'olivier.ramos@example.org', NULL, '2022-05-07 14:38:58', '2022-06-12 19:11:27'),
(7, 1, 1, 'Guillaume Perrot', 'hbaron@example.net', 'Tous les habitants, ce jour-là, elle allait donc posséder enfin ces joies de l\'amour, cette fièvre du bonheur dont elle allait tout à coup, Edgar- Lagardy parut. Il avait vu Tamburini, Rubini.', '2022-05-07 14:38:58', '2022-05-07 14:38:58'),
(8, 1, 1, 'Alexandre Maillard', 'victoire.leroy@example.net', 'C\'est donc pour cela, cependant, que ses chevaux au lieu d\'une, quantité d\'autres choses lui déplurent: d\'abord Charles n\'avait point les affaires, ils causaient sous un rayon de soleil, étalait des.', '2022-05-07 14:38:58', '2022-05-07 14:38:58'),
(9, 0, 1, 'Élise de la Nguyen', 'pchartier@example.org', 'Charles, tout à coup. Des militaires, s\'étant approchés du tribunal de la prairie semblait vide. C\'était l\'heure du banquet. Mais c\'était lui, le fardeau de vos yeux, de votre casque, dit le.', '2022-05-07 14:38:58', '2022-05-07 14:38:58'),
(10, 0, 1, 'Thibault de la Rodriguez', 'guichard.jacqueline@example.net', NULL, '2022-05-07 14:38:58', '2022-06-12 19:11:19'),
(11, 1, 0, 'Martin Matin', 'martin.matin@exemple.fr', NULL, '2022-05-10 12:12:19', '2022-05-10 12:17:03'),
(12, 0, 0, 'Pims orange', 'pims.orange@test.fr', NULL, '2022-05-10 12:18:56', '2022-05-10 12:18:56'),
(15, 1, 0, 'Mother of Medusa', 'test@test.com', NULL, '2022-06-10 09:44:19', '2022-06-10 09:44:19'),
(16, 1, 0, 'Lou Inspace Tattoo', 'test@exemple.com', NULL, '2022-06-10 09:45:20', '2022-06-10 09:45:20'),
(17, 1, 0, 'Peony', 'example@test.com', NULL, '2022-06-10 09:46:47', '2022-06-10 09:46:47'),
(18, 1, 0, 'Mona Purple Pony', 'exemple@exemple.com', NULL, '2022-06-10 09:52:00', '2022-06-10 09:52:00'),
(31, 0, 0, 'Francis Cabrel', 'francis.cabrel@gmail.com', NULL, '2022-06-12 18:56:14', '2022-06-12 19:04:14');

-- --------------------------------------------------------

--
-- Structure de la table `tattooist_workplace`
--

CREATE TABLE `tattooist_workplace` (
  `id` smallint UNSIGNED NOT NULL,
  `workplace_id` tinyint UNSIGNED NOT NULL,
  `tattooist_id` smallint UNSIGNED NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `tattooist_workplace`
--

INSERT INTO `tattooist_workplace` (`id`, `workplace_id`, `tattooist_id`, `start_date`, `end_date`, `created_at`, `updated_at`) VALUES
(1, 3, 3, '2004-07-10', '1998-05-15', '2022-05-07 14:38:58', '2022-05-07 14:38:58'),
(2, 5, 7, '1971-05-24', '2011-10-03', '2022-05-07 14:38:58', '2022-05-07 14:38:58'),
(3, 2, 4, '2002-12-22', '1975-03-03', '2022-05-07 14:38:58', '2022-05-07 14:38:58'),
(4, 5, 3, '2013-02-02', '2000-09-14', '2022-05-07 14:38:58', '2022-05-07 14:38:58'),
(5, 3, 8, '1988-04-18', '1978-01-10', '2022-05-07 14:38:58', '2022-05-07 14:38:58'),
(6, 1, 1, '2022-06-10', '2022-06-15', '2022-05-10 12:25:48', '2022-05-10 12:25:48'),
(8, 4, 8, '2022-06-13', '2022-06-19', '2022-06-15 11:43:43', '2022-06-15 11:59:50'),
(9, 2, 6, '2022-06-15', '2022-06-15', '2022-06-15 11:45:07', '2022-06-15 11:45:07'),
(10, 5, 3, '2022-06-18', '2022-06-19', '2022-06-15 11:45:56', '2022-06-15 11:59:58'),
(11, 5, 12, '2022-06-20', '2022-06-26', '2022-06-15 11:46:12', '2022-06-15 11:46:12'),
(12, 3, 1, '2022-06-01', '2022-06-05', '2022-06-15 11:57:44', '2022-06-15 11:57:44'),
(16, 5, 4, '2022-06-13', '2022-06-17', '2022-06-30 12:58:20', '2022-06-30 12:58:20'),
(18, 1, 4, '2022-07-12', '2022-07-16', '2022-07-05 18:54:56', '2022-07-05 18:54:56'),
(19, 2, 15, '2022-07-18', '2022-07-23', '2022-07-05 18:55:15', '2022-07-05 18:55:15'),
(20, 2, 15, '2022-07-11', '2022-07-16', '2022-07-05 18:55:26', '2022-07-05 18:55:32');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` smallint UNSIGNED NOT NULL,
  `tattooist_id` smallint UNSIGNED DEFAULT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT '0',
  `first_name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `tattooist_id`, `is_admin`, `first_name`, `last_name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Pauline', 'Maudet', 'paulinemaudet@yahoo.fr', '2022-05-07 14:38:58', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'sL733x83FG', '2022-05-07 14:39:18', '2022-06-24 08:59:27'),
(4, 4, 0, 'Margot', 'Dubois', 'margot57@example.org', '2022-05-07 14:38:59', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '6JmqUr0quh', '2022-05-07 14:39:18', '2022-07-05 15:54:58'),
(5, 9, 0, 'Gilles', 'Carre', 'zpons@example.org', '2022-05-07 14:38:59', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'zN8qfgGYjE', '2022-05-07 14:39:18', '2022-05-07 14:39:18'),
(8, NULL, 0, 'Louis', 'Raymond', 'ccordier@example.com', '2022-05-07 14:39:03', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'pABifUlikY', '2022-05-07 14:39:18', '2022-05-07 14:39:18'),
(10, 6, 0, 'Paul', 'Gomes', 'julien30@example.com', '2022-05-07 14:39:18', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'QVtqQwOVE9', '2022-05-07 14:39:18', '2022-05-07 14:39:18'),
(18, NULL, 0, 'yth', 'jnfh', 'testtgf@gfserrdg', NULL, '$2y$10$HlaHaXvPxzKTJ8n5cs4VjexqhO1aElpuvrmYF.pIJ.VMCzypkviFG', NULL, '2022-05-30 12:08:48', '2022-05-30 12:08:48'),
(19, NULL, 0, 'Fabien', 'Lecouve', 'fabien.lecouve@gmail.com', NULL, '$2y$10$gxjHcLBM4bf8j17Dd3hIfel6LrpBxX/tj6e0AS8NMYeb7DK.Fw/Pm', NULL, '2022-06-08 17:37:39', '2022-06-08 17:37:39'),
(20, 7, 0, 'Victor', 'Emilio', 'victor.emilio@gmail.com', NULL, '$2y$10$FREPH9ZqsFk1iicOkec.HeaGISlV8pLUEOHouqJPCeCP4ufE7keya', NULL, '2022-06-08 17:40:59', '2022-06-08 17:40:59');

-- --------------------------------------------------------

--
-- Structure de la table `workplaces`
--

CREATE TABLE `workplaces` (
  `id` tinyint UNSIGNED NOT NULL,
  `number` tinyint UNSIGNED NOT NULL,
  `is_pmr` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `workplaces`
--

INSERT INTO `workplaces` (`id`, `number`, `is_pmr`, `created_at`, `updated_at`) VALUES
(1, 7, 1, '2022-05-07 14:38:58', '2022-05-07 14:38:58'),
(2, 6, 0, '2022-05-07 14:38:58', '2022-06-09 18:22:36'),
(3, 4, 0, '2022-05-07 14:38:58', '2022-05-07 14:38:58'),
(4, 5, 1, '2022-05-07 14:38:58', '2022-06-12 19:10:22'),
(5, 3, 0, '2022-05-07 14:38:58', '2022-05-07 14:38:58');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `documents_title_unique` (`title`),
  ADD UNIQUE KEY `documents_name_unique` (`name`),
  ADD KEY `documents_document_category_id_foreign` (`document_category_id`),
  ADD KEY `documents_user_id_foreign` (`user_id`);

--
-- Index pour la table `document_categories`
--
ALTER TABLE `document_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `document_categories_name_unique` (`name`);

--
-- Index pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Index pour la table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Index pour la table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Index pour la table `pictures`
--
ALTER TABLE `pictures`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pictures_tattooist_id_picture_id_unique` (`tattooist_id`,`picture_id`),
  ADD UNIQUE KEY `pictures_name_unique` (`name`);

--
-- Index pour la table `social_networks`
--
ALTER TABLE `social_networks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `social_networks_name_unique` (`name`);

--
-- Index pour la table `social_network_tattooist`
--
ALTER TABLE `social_network_tattooist`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `social_network_tattooist_tattooist_id_social_network_id_unique` (`tattooist_id`,`social_network_id`),
  ADD UNIQUE KEY `social_network_tattooist_url_unique` (`url`),
  ADD KEY `social_network_tattooist_social_network_id_foreign` (`social_network_id`);

--
-- Index pour la table `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subscribers_email_unique` (`email`);

--
-- Index pour la table `tattooists`
--
ALTER TABLE `tattooists`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tattooists_name_unique` (`name`),
  ADD UNIQUE KEY `tattooists_email_unique` (`email`);

--
-- Index pour la table `tattooist_workplace`
--
ALTER TABLE `tattooist_workplace`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tattooist_workplace_tattooist_id_workplace_id_start_date_unique` (`tattooist_id`,`workplace_id`,`start_date`),
  ADD KEY `tattooist_workplace_workplace_id_foreign` (`workplace_id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_tattooist_id_unique` (`tattooist_id`);

--
-- Index pour la table `workplaces`
--
ALTER TABLE `workplaces`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `workplaces_number_unique` (`number`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `documents`
--
ALTER TABLE `documents`
  MODIFY `id` smallint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT pour la table `document_categories`
--
ALTER TABLE `document_categories`
  MODIFY `id` tinyint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pour la table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=133;

--
-- AUTO_INCREMENT pour la table `pictures`
--
ALTER TABLE `pictures`
  MODIFY `id` smallint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT pour la table `social_networks`
--
ALTER TABLE `social_networks`
  MODIFY `id` tinyint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT pour la table `social_network_tattooist`
--
ALTER TABLE `social_network_tattooist`
  MODIFY `id` smallint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT pour la table `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` smallint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT pour la table `tattooists`
--
ALTER TABLE `tattooists`
  MODIFY `id` smallint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT pour la table `tattooist_workplace`
--
ALTER TABLE `tattooist_workplace`
  MODIFY `id` smallint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` smallint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT pour la table `workplaces`
--
ALTER TABLE `workplaces`
  MODIFY `id` tinyint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `documents`
--
ALTER TABLE `documents`
  ADD CONSTRAINT `documents_document_category_id_foreign` FOREIGN KEY (`document_category_id`) REFERENCES `document_categories` (`id`),
  ADD CONSTRAINT `documents_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Contraintes pour la table `pictures`
--
ALTER TABLE `pictures`
  ADD CONSTRAINT `pictures_tattooist_id_foreign` FOREIGN KEY (`tattooist_id`) REFERENCES `tattooists` (`id`);

--
-- Contraintes pour la table `social_network_tattooist`
--
ALTER TABLE `social_network_tattooist`
  ADD CONSTRAINT `social_network_tattooist_social_network_id_foreign` FOREIGN KEY (`social_network_id`) REFERENCES `social_networks` (`id`),
  ADD CONSTRAINT `social_network_tattooist_tattooist_id_foreign` FOREIGN KEY (`tattooist_id`) REFERENCES `tattooists` (`id`);

--
-- Contraintes pour la table `tattooist_workplace`
--
ALTER TABLE `tattooist_workplace`
  ADD CONSTRAINT `tattooist_workplace_tattooist_id_foreign` FOREIGN KEY (`tattooist_id`) REFERENCES `tattooists` (`id`),
  ADD CONSTRAINT `tattooist_workplace_workplace_id_foreign` FOREIGN KEY (`workplace_id`) REFERENCES `workplaces` (`id`);

--
-- Contraintes pour la table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_tattooist_id_foreign` FOREIGN KEY (`tattooist_id`) REFERENCES `tattooists` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
