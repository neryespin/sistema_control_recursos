-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-05-2025 a las 09:00:16
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_escuela`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_solicitud`
--

CREATE TABLE `detalle_solicitud` (
  `id` int(11) NOT NULL,
  `id_solicitud` int(11) DEFAULT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalle_solicitud`
--

INSERT INTO `detalle_solicitud` (`id`, `id_solicitud`, `id_producto`, `cantidad`) VALUES
(1, 1, 1, 2),
(2, 2, 1, 4),
(3, 3, 3, 2),
(4, 3, 1, 1),
(5, 3, 2, 3),
(6, 4, 1, 1),
(7, 5, 1, 1),
(8, 6, 1, 1),
(9, 7, 2, 1),
(10, 8, 1, 1),
(11, 8, 3, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimientos_stock`
--

CREATE TABLE `movimientos_stock` (
  `id` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `tipo` enum('entrada','salida') DEFAULT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `movimientos_stock`
--

INSERT INTO `movimientos_stock` (`id`, `fecha`, `tipo`, `id_producto`, `cantidad`, `descripcion`, `id_usuario`) VALUES
(1, '2025-05-13 01:49:22', 'entrada', 1, 100, 'Ingreso de 100 unidades – Orden: 1020 – Recibido por: NERY ESPINOZA', NULL),
(2, '2025-05-17 02:51:57', 'entrada', 2, 100, 'Stock inicial', NULL),
(3, '2025-05-17 02:52:21', 'entrada', 3, 80, 'Stock inicial', NULL),
(4, '2025-05-17 13:32:45', 'salida', 1, 1, 'Entrega por solicitud ID 5', NULL),
(5, '2025-05-17 13:32:54', 'salida', 1, 1, 'Entrega por solicitud ID 4', NULL),
(6, '2025-05-17 13:32:59', 'salida', 1, 2, 'Entrega por solicitud ID 1', NULL),
(7, '2025-05-17 15:42:13', 'salida', 1, 1, 'Entrega por solicitud ID 8', NULL),
(8, '2025-05-17 15:42:13', 'salida', 3, 1, 'Entrega por solicitud ID 8', NULL),
(9, '2025-05-17 21:44:10', 'entrada', 4, 50, 'Ingreso de 50 unidades – Orden: 3385 – Recibido por: juan perez', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `marca` varchar(100) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `fuente_financiamiento` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `marca`, `stock`, `fuente_financiamiento`) VALUES
(1, 'CUADERNOS UNIVERSITARIOS', 'TORRES', 95, 'SEP'),
(2, 'GOMA EVA', 'TORRES', 100, 'SEP'),
(3, 'LAPICES  PASTAS', 'BIC', 79, 'SEP'),
(4, 'calculadora', 'casio', 50, 'pie');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `contacto` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro_ingreso`
--

CREATE TABLE `registro_ingreso` (
  `id` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `numero_orden` varchar(50) DEFAULT NULL,
  `proveedor_id` int(11) DEFAULT NULL,
  `marca` varchar(100) DEFAULT NULL,
  `fuente_financiamiento` varchar(100) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `recibido_por` varchar(100) DEFAULT NULL,
  `archivo_orden` varchar(255) DEFAULT NULL,
  `fecha_recepcion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitudes`
--

CREATE TABLE `solicitudes` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `fecha` datetime NOT NULL DEFAULT current_timestamp(),
  `estado` enum('pendiente','aprobada','rechazada') NOT NULL DEFAULT 'pendiente',
  `observacion` text DEFAULT NULL,
  `id_admin_aprueba` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `solicitudes`
--

INSERT INTO `solicitudes` (`id`, `id_usuario`, `fecha`, `estado`, `observacion`, `id_admin_aprueba`) VALUES
(1, 3, '2025-05-17 09:31:00', 'aprobada', NULL, NULL),
(2, 4, '2025-05-17 09:31:00', 'rechazada', NULL, NULL),
(3, 3, '2025-05-17 09:31:00', 'rechazada', NULL, NULL),
(4, 3, '2025-05-17 09:31:00', 'aprobada', NULL, NULL),
(5, 3, '2025-05-17 09:31:00', 'aprobada', NULL, NULL),
(6, 3, '2025-05-17 09:28:08', '', NULL, NULL),
(7, 3, '2025-05-17 09:29:08', '', NULL, NULL),
(8, 5, '2025-05-17 10:47:18', 'aprobada', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `rut` varchar(12) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `rol` enum('funcionario','administrador') NOT NULL,
  `tipo_funcionario` varchar(100) DEFAULT NULL,
  `contrasena` varchar(255) NOT NULL,
  `estado` tinyint(1) DEFAULT 1,
  `solicitud_recuperacion` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `rut`, `nombre`, `correo`, `rol`, `tipo_funcionario`, `contrasena`, `estado`, `solicitud_recuperacion`) VALUES
(2, '13174445-5', 'Administrador', 'admin@colegio.cl', 'administrador', 'Administración', '$2y$10$5F2635jpKvlGSjeU6b8eI.TGg3zJ4DlZLo6FayIsMLBTMcvOnTxXi', 1, 0),
(3, '22689725-9', 'NERY ESPINOZA PALMA', 'N_ESPIN@yahoo.es', 'funcionario', 'ASISTENTE  AULA                         ', '$2y$10$pM.xpQwTnmCUVhGgXro3weGoBOsrr9ijjbWErRVHgVcNmPJS/ufBy', 1, 0),
(4, '18.324.467-1', 'JANETT', 'NNNN@GMAIL.COM', 'funcionario', 'TRABAJADORA SOCIAL', '$2y$10$lX71MeF8Kl1ZvJURx.LdYOyUTsqGuLswEWVHU1UOLqFBMcPRNa9o2', 1, 0),
(5, '13756894-2', 'NICOLAS SOTELO', 'n_espin@yahoo.es', 'funcionario', 'DOCENTE', '$2y$10$31njxGG27GgofaVp/8CGOeNT9ZlU6vJh/0Q4uO6IButczNKoLcIIS', 1, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `detalle_solicitud`
--
ALTER TABLE `detalle_solicitud`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_solicitud` (`id_solicitud`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `movimientos_stock`
--
ALTER TABLE `movimientos_stock`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_producto` (`id_producto`),
  ADD KEY `fk_movimientos_usuario` (`id_usuario`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `registro_ingreso`
--
ALTER TABLE `registro_ingreso`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_producto` (`id_producto`),
  ADD KEY `proveedor_id` (`proveedor_id`);

--
-- Indices de la tabla `solicitudes`
--
ALTER TABLE `solicitudes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_admin_aprueba` (`id_admin_aprueba`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `rut` (`rut`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `detalle_solicitud`
--
ALTER TABLE `detalle_solicitud`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `movimientos_stock`
--
ALTER TABLE `movimientos_stock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `registro_ingreso`
--
ALTER TABLE `registro_ingreso`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `solicitudes`
--
ALTER TABLE `solicitudes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_solicitud`
--
ALTER TABLE `detalle_solicitud`
  ADD CONSTRAINT `detalle_solicitud_ibfk_1` FOREIGN KEY (`id_solicitud`) REFERENCES `solicitudes` (`id`),
  ADD CONSTRAINT `detalle_solicitud_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id`);

--
-- Filtros para la tabla `movimientos_stock`
--
ALTER TABLE `movimientos_stock`
  ADD CONSTRAINT `fk_movimientos_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `movimientos_stock_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id`);

--
-- Filtros para la tabla `registro_ingreso`
--
ALTER TABLE `registro_ingreso`
  ADD CONSTRAINT `registro_ingreso_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id`),
  ADD CONSTRAINT `registro_ingreso_ibfk_2` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedores` (`id`);

--
-- Filtros para la tabla `solicitudes`
--
ALTER TABLE `solicitudes`
  ADD CONSTRAINT `solicitudes_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `solicitudes_ibfk_2` FOREIGN KEY (`id_admin_aprueba`) REFERENCES `usuarios` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
