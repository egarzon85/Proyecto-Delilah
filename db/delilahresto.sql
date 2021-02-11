-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-02-2021 a las 20:58:34
-- Versión del servidor: 10.4.17-MariaDB
-- Versión de PHP: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `delilahresto`
--
CREATE DATABASE IF NOT EXISTS `delilahresto` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `delilahresto`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `id_product` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `price` int(11) NOT NULL,
  `img_url` varchar(255) NOT NULL,
  `createdAt` text DEFAULT NULL,
  `updatedAt` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id_product`, `name`, `price`, `img_url`, `createdAt`, `updatedAt`) VALUES
(7, 'Pizza Pepperoni', 600, 'https://mahatmarice.com/wp-content/uploads/2020/04/Rice-Pizza-Crust.jpg', '2021-02-11 19:47:09', '2021-02-11 19:47:09');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `surname` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone_number` int(11) DEFAULT NULL,
  `password` varchar(100) NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  `createdAt` text DEFAULT NULL,
  `updatedAt` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id_user`, `username`, `name`, `surname`, `email`, `phone_number`, `password`, `is_admin`, `createdAt`, `updatedAt`) VALUES
(29, 'Eche77', 'Exequiel', 'Garzon', 'eche85@gmail.com', 1160001234, '$2a$10$qLxMWzDwybh0wzp0cj1IDu6NvMB07XLkMvfBrKYWU1hVjJMfm/QC.', 1, '2021-02-11 19:12:39', '2021-02-11 19:12:39'),
(30, 'Eche777', 'Exequiel', 'Garzon', 'eche851@gmail.com', 1160001234, '$2a$10$6kBnUqazBPcjEmm0IOIwueQBQqDowjKY9OMl0NVIsAnnF8BGC6Rju', 1, '2021-02-11 19:13:56', '2021-02-11 19:13:56'),
(31, 'Eche7777', 'Exequiel', 'Garzon', 'eche8511@gmail.com', 1160001234, '$2a$10$rXI9ZPO6Sk2Xtqo.c27z1uh.2BrLoGqq58HJFHwIgoLRb1SR.zR4K', 1, '2021-02-11 19:46:14', '2021-02-11 19:46:14');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id_product`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `id_product` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
