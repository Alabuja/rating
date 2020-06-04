-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 04, 2020 at 08:09 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rating`
--

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(2, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(3, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(4, '2016_06_01_000004_create_oauth_clients_table', 1),
(5, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(6, '2020_06_01_043448_create_users_table', 1),
(7, '2020_06_01_044728_create_ratings_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('4415750f705f4169af6b1320148c472ab4c9a14b34644b5f98c89f1fe109961d3816be14c7d56763', 3, 1, 'bearer_token', '[]', 0, '2020-06-04 05:54:54', '2020-06-04 05:54:54', '2021-06-04 05:54:54'),
('a578760f54a628c78f00d2ee250a4d878e06775edb6a3c067ffaf0612b057dae128927b8437a55ab', 2, 1, 'bearer_token', '[]', 0, '2020-06-04 05:51:22', '2020-06-04 05:51:22', '2021-06-04 05:51:22');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Lumen Personal Access Client', '47ixc8Aqc68666Ddm9reHzhcm6wB7GWkBl9jMpR3', NULL, 'http://localhost', 1, 0, 0, '2020-06-04 05:50:50', '2020-06-04 05:50:50'),
(2, NULL, 'Lumen Password Grant Client', 'zfOcPq8yGsmTwrho1hl1LLQnVyUboKoOwjj0T65Q', 'users', 'http://localhost', 0, 1, 0, '2020-06-04 05:50:50', '2020-06-04 05:50:50');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2020-06-04 05:50:50', '2020-06-04 05:50:50');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

CREATE TABLE `ratings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `rating_score` int(11) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `user_rater_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ratings`
--

INSERT INTO `ratings` (`id`, `rating_score`, `user_id`, `user_rater_id`, `created_at`, `updated_at`) VALUES
(1, 10, 2, 3, '2020-06-04 05:55:58', '2020-06-04 05:55:58');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `api_token` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `api_token`, `created_at`, `updated_at`) VALUES
(2, 'Ogunfiditimi Aarinola', 'me@alabuja.com', '$2y$10$TDadEpT19c5nCpQRS8chnOjSkH92IeNf3zQ0XJuKM2a2/3QjqAFFS', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiYTU3ODc2MGY1NGE2MjhjNzhmMDBkMmVlMjUwYTRkODc4ZTA2Nzc1ZWRiNmEzYzA2N2ZmYWYwNjEyYjA1N2RhZTEyODkyN2I4NDM3YTU1YWIiLCJpYXQiOjE1OTEyNDk4ODIsIm5iZiI6MTU5MTI0OTg4MiwiZXhwIjoxNjIyNzg1ODgyLCJzdWIiOiIyIiwic2NvcGVzIjpbXX0.YLSOmmszkZvYmtnMHiWYbSpw6rshk58s3nDyUbiwsgGgHcZacmi6Z3g0L4Skhdr4jbsWn4ohn5uNThv1v5XPh0-B0ySnGzz43eNv-15TsqDGmGKCNZ4ceN-Jc-xm9eUvcKur2NTefYaiKjga2K_YUWkxW7bm5xLSlV1r8rhs9ind8wt-yr25ZP8rnK4JeGzspqqGko9QnIuM6HznFcg3Rzxgz9kNTvvQy0-4jr-Fad7lF0ufcDMK5QVDm2cRuPvyFA1zoT6rHNOMq998lnREsaq1TlerEzUWHCOOdLDbGMY2h9g-e3kQbPFoJr48wUQAZmLhIr6qYShztnWRk8TIQykvGABPL3fYsJUy3w-KIX1OrsWyMwX5fG3jL6kgrEfSHbfFilIZ--g_lLCWKpnroGiyRSUwWZ8hb8CMj238wWbFnc0TL55J5SOweiOM96a7FDfEdA36OYXYpByZUQOGOlFvDyBr1GFY53kz07-LzMjLT42Uyfc4TUjpM0NLu8aMDkzIdyaJzTlfT2kdNAM0mQ43zxyjoYNBXeTczI35bDa8rJacjPI2IKvSy053Uwk8tDLKlK-w_23ZYbKdnUotzYpFrysl76YL01RV4pYmkPwx9OtVnhH3s-lDwZj9-MvKG-S4xtfIOmvxge0IaBRE8RywJ4egcXkTOF70cZXB-8U', '2020-06-04 05:51:22', '2020-06-04 05:51:22'),
(3, 'Ogunfiditimi Daniel', 'aarinola@alabuja.com', '$2y$10$Wr5D5J8OB7mrz5aTg6hlhOGrm4WM3Ud/yRR8rc9BmDEfHX7rEyZjS', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiNDQxNTc1MGY3MDVmNDE2OWFmNmIxMzIwMTQ4YzQ3MmFiNGM5YTE0YjM0NjQ0YjVmOThjODlmMWZlMTA5OTYxZDM4MTZiZTE0YzdkNTY3NjMiLCJpYXQiOjE1OTEyNTAwOTQsIm5iZiI6MTU5MTI1MDA5NCwiZXhwIjoxNjIyNzg2MDk0LCJzdWIiOiIzIiwic2NvcGVzIjpbXX0.elilxS6gFwCFMMZOAr-lH7bA7jZw_qIo0s6mkicjJsZpdfGNT0LTxgmxVol6ZCGWO2BttX66pEu4MrMKx8EQKjb8zrxtFRX2ZCtBTFPNDdFLM3uP4RC4Jcq2SmoG3s53_x-kjCG_aNf7W7KiSWrttxuq9UlqwnaWZwB7Qaru8AncWGL503R3RMvfMgq0jkVR8dMf7SEDNKYg71xIl4bQinKTqOR9y1M6F1kpDR3EqMH48uC13La7NyQQTS3rk0ExqxJOlRpOjBQMHdABx-eMokjG214rez9gppt2sZSJiwTD3TFY80gfuLSvV0tPj62Xg-kjbjASWmIYi5_ysaQkjY8yyVfG2DmdqY_G2tqCOhDEVwBTa6mkKQ9_Da7eXAaEwu_4X9BPbkjMFSS18ciixHsDekpq_bXJpPCOzQDsxPPzP8nVEWZVuopkrHrxaReQHmvKfzrzenl4JC1t3RBaxUmieGTsKSjTYSTVzsZAq3_5sSbJj-zb-P5GDJYQkRuxUB4_Dk1jg3ZQZUn_xNS-eFnFr_ET3ow0J-6oiGpJAvjRV9UzM8eTKIYaWvZkFJ8naj7cSgk-5t9SQBYCbrzdmQcg-J6rtM0f657XgdYhP3zhn6A7yUBaS2prPmKZlsTIrDtUT7tXRix4PLRNsynayUCVFCEtRHztt8NTtzfrTWY', '2020-06-04 05:54:54', '2020-06-04 05:54:54');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ratings_user_id_foreign` (`user_id`),
  ADD KEY `ratings_user_rater_id_foreign` (`user_rater_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ratings`
--
ALTER TABLE `ratings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ratings`
--
ALTER TABLE `ratings`
  ADD CONSTRAINT `ratings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ratings_user_rater_id_foreign` FOREIGN KEY (`user_rater_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
