-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-03-2021 a las 15:25:30
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
-- Estructura de tabla para la tabla `orders`
--

CREATE TABLE `orders` (
  `id_order` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_status` int(11) NOT NULL DEFAULT 1,
  `id_pay_method` int(11) NOT NULL,
  `total` decimal(10,0) NOT NULL,
  `createdAt` text DEFAULT NULL,
  `updatedAt` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `payment_method`
--

CREATE TABLE `payment_method` (
  `id_pay_method` int(11) NOT NULL,
  `pay_method_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `payment_method`
--

INSERT INTO `payment_method` (`id_pay_method`, `pay_method_name`) VALUES
(1, 'efectivo'),
(2, 'credito'),
(3, 'debito');

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
(1, 'Pizza Muzzarella', 600, 'https://mahatmarice.com/wp-content/uploads/2020/04/Rice-Pizza-Crust.jpg', '2021-03-08 14:20:13', '2021-03-08 14:20:13'),
(2, 'Ensalada', 400, 'https://www.superama.com.mx/views/micrositio/recetas/images/comidasaludable/ensaladamixta/Web_fotoreceta.jpg', '2021-03-08 14:20:51', '2021-03-08 14:20:51'),
(3, 'Hamburguesa', 500, 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fcomputerhoy.com%2Fnoticias%2Flife%2Fhamburguesa-cara-mundo-cuesta-5000-dolares-776715&psig=AOvVaw2kzEY1-fQZPFy2K8TH-Act&ust=1615299674125000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCJj1h6ryoO8CFQAAAAAdAAAAAB', '2021-03-08 14:21:22', '2021-03-08 14:21:22');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product_orders`
--

CREATE TABLE `product_orders` (
  `id_order` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `id_product_order` int(11) NOT NULL,
  `createdAt` text DEFAULT NULL,
  `updatedAt` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `status_order`
--

CREATE TABLE `status_order` (
  `id_status` int(11) NOT NULL,
  `status_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `status_order`
--

INSERT INTO `status_order` (`id_status`, `status_name`) VALUES
(1, 'nuevo'),
(2, 'confirmado'),
(3, 'preparando'),
(4, 'enviando'),
(5, 'entregado');

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
  `address` varchar(100) NOT NULL,
  `phone_number` int(11) DEFAULT NULL,
  `password` varchar(100) NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  `createdAt` text DEFAULT NULL,
  `updatedAt` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id_user`, `username`, `name`, `surname`, `email`, `address`, `phone_number`, `password`, `is_admin`, `createdAt`, `updatedAt`) VALUES
(1, 'john', 'John', 'Doe', 'john@gmail.com', 'Street 123', 1160001234, '$2a$10$6DjnNI5KZ7DwW21u4IEWQuPA5e2EiPZyxt6E5Z.pyqoFCkwnCZegq', 0, '2021-03-08 14:18:25', '2021-03-08 14:18:25'),
(2, 'maria', 'Maria', 'Doe', 'Maria@gmail.com', 'Calle 123', 1160001234, '$2a$10$otDGxKIvU.p5lKk6QY0SYuXZtl64a8kWDCbG3iSAi3zuBpIJcWMzC', 1, '2021-03-08 14:19:23', '2021-03-08 14:19:23');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id_order`),
  ADD KEY `id_status` (`id_status`),
  ADD KEY `id_pay_method` (`id_pay_method`),
  ADD KEY `id_user` (`id_user`);

--
-- Indices de la tabla `payment_method`
--
ALTER TABLE `payment_method`
  ADD PRIMARY KEY (`id_pay_method`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id_product`);

--
-- Indices de la tabla `product_orders`
--
ALTER TABLE `product_orders`
  ADD PRIMARY KEY (`id_product_order`),
  ADD KEY `id_product` (`id_product`) USING BTREE,
  ADD KEY `id_order` (`id_order`) USING BTREE;

--
-- Indices de la tabla `status_order`
--
ALTER TABLE `status_order`
  ADD PRIMARY KEY (`id_status`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `orders`
--
ALTER TABLE `orders`
  MODIFY `id_order` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `payment_method`
--
ALTER TABLE `payment_method`
  MODIFY `id_pay_method` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `id_product` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `product_orders`
--
ALTER TABLE `product_orders`
  MODIFY `id_product_order` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `status_order`
--
ALTER TABLE `status_order`
  MODIFY `id_status` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`id_status`) REFERENCES `status_order` (`id_status`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`id_pay_method`) REFERENCES `payment_method` (`id_pay_method`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE;

--
-- Filtros para la tabla `product_orders`
--
ALTER TABLE `product_orders`
  ADD CONSTRAINT `product_orders_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `products` (`id_product`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_orders_ibfk_2` FOREIGN KEY (`id_order`) REFERENCES `orders` (`id_order`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
