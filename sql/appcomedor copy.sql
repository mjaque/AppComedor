-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-04-2024 a las 15:48:00
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
-- Base de datos: `appcomedor`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `curso`
--

CREATE TABLE `curso` (
  `id` int(10) UNSIGNED NOT NULL,
  `orden` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `curso`
--

INSERT INTO `curso` (`id`, `orden`, `nombre`) VALUES
(1, 1, 'daw');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dias`
--

CREATE TABLE `dias` (
  `dia` date NOT NULL,
  `idPersona` int(10) UNSIGNED NOT NULL,
  `idPadre` int(10) UNSIGNED DEFAULT NULL,
  `incidencia` varchar(500) DEFAULT NULL,
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `festivo`
--

CREATE TABLE `festivo` (
  `diaFestivo` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hijo`
--

CREATE TABLE `hijo` (
  `id` int(10) UNSIGNED NOT NULL,
  `idPadreAlta` int(10) UNSIGNED NOT NULL,
  `idCurso` int(10) UNSIGNED NOT NULL,
  `pin` char(8) NOT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `hijo`
--

INSERT INTO `hijo` (`id`, `idPadreAlta`, `idCurso`, `pin`, `activo`) VALUES
(2, 1, 1, 'D8AADD8D', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hijo_padre`
--

CREATE TABLE `hijo_padre` (
  `idPadre` int(10) UNSIGNED NOT NULL,
  `idHijo` int(10) UNSIGNED NOT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `hijo_padre`
--

INSERT INTO `hijo_padre` (`idPadre`, `idHijo`, `activo`) VALUES
(1, 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `log`
--

CREATE TABLE `log` (
  `id` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `accion` varchar(255) DEFAULT NULL,
  `metodo` varchar(50) DEFAULT NULL,
  `datos` text DEFAULT NULL,
  `resultados` text DEFAULT NULL,
  `usuario` varchar(255) DEFAULT NULL,
  `controlador` varchar(255) DEFAULT NULL,
  `pathParams` varchar(255) DEFAULT NULL,
  `queryParams` varchar(255) DEFAULT NULL,
  `body` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `log`
--

INSERT INTO `log` (`id`, `fecha`, `accion`, `metodo`, `datos`, `resultados`, `usuario`, `controlador`, `pathParams`, `queryParams`, `body`) VALUES
(1, '2024-03-28 15:10:29', NULL, 'POST', NULL, NULL, NULL, 'login', '', '', '{\"usuario\":\"a@g.com\",\"clave\":\"asdf\"}'),
(2, '2024-03-28 15:11:52', NULL, 'POST', NULL, NULL, NULL, 'persona', '', '', '{\"nombre\":\"antonio\",\"apellidos\":\"antonio\",\"correo\":\"a@gmail.com\",\"clave\":\"12345678\",\"telefono\":\"666666666\",\"dni\":\"66666666c\",\"iban\":\"ES9121000418450200051332\",\"titular\":\"antonio\"}'),
(3, '2024-03-28 15:11:54', NULL, 'POST', NULL, NULL, NULL, 'padres', '', '', '\"1\"'),
(4, '2024-03-28 15:11:55', NULL, 'POST', NULL, NULL, NULL, 'login', '', '', '{\"usuario\":\"a@gmail.com\",\"clave\":\"12345678\"}'),
(5, '2024-03-28 15:11:57', NULL, 'GET', NULL, NULL, NULL, 'cursos', '', '', 'null'),
(6, '2024-03-28 15:11:57', NULL, 'GET', NULL, NULL, NULL, 'hijos', '', '1', 'null'),
(7, '2024-03-28 15:11:57', NULL, 'GET', NULL, NULL, NULL, 'festivos', '', '1-3-2024##30-4-2024', 'null'),
(8, '2024-03-28 15:11:57', NULL, 'GET', NULL, NULL, NULL, 'hijos', '', '1', 'null'),
(9, '2024-03-28 15:12:38', NULL, 'POST', NULL, NULL, NULL, 'login', '', '', '{\"usuario\":\"a@gmail.com\",\"clave\":\"12345678\"}'),
(10, '2024-03-28 15:12:41', NULL, 'GET', NULL, NULL, NULL, 'cursos', '', '', 'null'),
(11, '2024-03-28 15:12:41', NULL, 'GET', NULL, NULL, NULL, 'hijos', '', '1', 'null'),
(12, '2024-03-28 15:12:41', NULL, 'GET', NULL, NULL, NULL, 'festivos', '', '1-3-2024##30-4-2024', 'null'),
(13, '2024-03-28 15:12:41', NULL, 'GET', NULL, NULL, NULL, 'hijos', '', '1', 'null'),
(14, '2024-03-28 15:15:34', NULL, 'PUT', NULL, NULL, NULL, 'persona', '', '', '{\"id\":1,\"nombre\":\"antonio\",\"apellidos\":\"antonio\",\"telefono\":\"666666666\",\"correo\":\"antonio@gmail.com\"}'),
(15, '2024-03-28 15:15:37', NULL, 'GET', NULL, NULL, NULL, 'festivos', '', '1-3-2024##30-4-2024', 'null'),
(16, '2024-03-28 15:15:37', NULL, 'GET', NULL, NULL, NULL, 'hijos', '', '1', 'null'),
(17, '2024-03-28 15:15:53', NULL, 'PUT', NULL, NULL, NULL, 'persona', '', '', '{\"id\":1,\"nombre\":\"antonio\",\"apellidos\":\"antonio\",\"telefono\":\"666666666\",\"correo\":\"antonio@gmail.com\"}'),
(18, '2024-03-28 15:15:57', NULL, 'GET', NULL, NULL, NULL, 'festivos', '', '1-3-2024##30-4-2024', 'null'),
(19, '2024-03-28 15:15:57', NULL, 'GET', NULL, NULL, NULL, 'hijos', '', '1', 'null'),
(20, '2024-03-28 15:15:59', NULL, 'GET', NULL, NULL, NULL, 'festivos', '', '1-3-2024##30-4-2024', 'null'),
(21, '2024-03-28 15:15:59', NULL, 'GET', NULL, NULL, NULL, 'hijos', '', '1', 'null'),
(22, '2024-03-28 15:17:47', NULL, 'GET', NULL, NULL, NULL, 'festivos', '', '1-3-2024##30-4-2024', 'null'),
(23, '2024-03-28 15:17:47', NULL, 'GET', NULL, NULL, NULL, 'cursos', '', '', 'null'),
(24, '2024-03-28 15:17:47', NULL, 'GET', NULL, NULL, NULL, 'hijos', '', '1', 'null'),
(25, '2024-03-28 15:17:50', NULL, 'POST', NULL, NULL, NULL, 'login', '', '', '{\"usuario\":\"a@gmail.com\",\"clave\":\"12345678\"}'),
(26, '2024-03-28 15:17:56', NULL, 'POST', NULL, NULL, NULL, 'login', '', '', '{\"usuario\":\"antonio@gmail.com\",\"clave\":\"12345678\"}'),
(27, '2024-03-28 15:17:59', NULL, 'GET', NULL, NULL, NULL, 'cursos', '', '', 'null'),
(28, '2024-03-28 15:17:59', NULL, 'GET', NULL, NULL, NULL, 'festivos', '', '1-3-2024##30-4-2024', 'null'),
(29, '2024-03-28 15:17:59', NULL, 'GET', NULL, NULL, NULL, 'hijos', '', '1', 'null'),
(30, '2024-03-28 15:17:59', NULL, 'GET', NULL, NULL, NULL, 'hijos', '', '1', 'null'),
(31, '2024-03-28 15:18:13', NULL, 'POST', NULL, NULL, NULL, 'hijos', 'altaHijo', '', '{\"id\":1,\"nombre\":\"fernando\",\"apellidos\":\"alonso\",\"idCurso\":1}'),
(32, '2024-03-28 15:18:14', NULL, 'GET', NULL, NULL, NULL, 'hijos', '', '1', 'null'),
(33, '2024-03-28 15:18:27', NULL, 'GET', NULL, NULL, NULL, 'cursos', '', '', 'null'),
(34, '2024-03-28 15:18:27', NULL, 'GET', NULL, NULL, NULL, 'hijos', '', '1', 'null'),
(35, '2024-03-28 15:18:27', NULL, 'GET', NULL, NULL, NULL, 'festivos', '', '1-3-2024##30-4-2024', 'null'),
(36, '2024-03-28 15:18:28', NULL, 'GET', NULL, NULL, NULL, 'hijos', '', '1', 'null'),
(37, '2024-03-28 15:18:28', NULL, 'GET', NULL, NULL, NULL, 'dias', '', '2', 'null'),
(38, '2024-03-28 15:18:29', NULL, 'GET', NULL, NULL, NULL, 'festivos', '', '1-3-2024##30-4-2024', 'null'),
(39, '2024-03-28 15:18:30', NULL, 'GET', NULL, NULL, NULL, 'hijos', '', '1', 'null'),
(40, '2024-03-28 15:18:30', NULL, 'GET', NULL, NULL, NULL, 'dias', '', '2', 'null'),
(41, '2024-03-28 15:18:34', NULL, 'GET', NULL, NULL, NULL, 'festivos', '', '1-4-2024##31-5-2024', 'null'),
(42, '2024-03-28 15:18:34', NULL, 'GET', NULL, NULL, NULL, 'hijos', '', '1', 'null'),
(43, '2024-03-28 15:18:34', NULL, 'GET', NULL, NULL, NULL, 'dias', '', '2', 'null'),
(44, '2024-03-28 15:18:34', NULL, 'GET', NULL, NULL, NULL, 'festivos', '', '1-3-2024##30-4-2024', 'null'),
(45, '2024-03-28 15:18:34', NULL, 'GET', NULL, NULL, NULL, 'hijos', '', '1', 'null'),
(46, '2024-03-28 15:18:34', NULL, 'GET', NULL, NULL, NULL, 'dias', '', '2', 'null'),
(47, '2024-03-28 15:18:35', NULL, 'GET', NULL, NULL, NULL, 'festivos', '', '1-3-2024##30-4-2024', 'null'),
(48, '2024-03-28 15:18:35', NULL, 'GET', NULL, NULL, NULL, 'hijos', '', '1', 'null'),
(49, '2024-03-28 15:18:35', NULL, 'GET', NULL, NULL, NULL, 'dias', '', '2', 'null'),
(50, '2024-03-28 15:18:35', NULL, 'GET', NULL, NULL, NULL, 'festivos', '', '1-3-2024##30-4-2024', 'null'),
(51, '2024-03-28 15:18:35', NULL, 'GET', NULL, NULL, NULL, 'hijos', '', '1', 'null'),
(52, '2024-03-28 15:18:35', NULL, 'GET', NULL, NULL, NULL, 'dias', '', '2', 'null'),
(53, '2024-03-28 15:18:35', NULL, 'GET', NULL, NULL, NULL, 'festivos', '', '1-3-2024##30-4-2024', 'null'),
(54, '2024-03-28 15:18:35', NULL, 'GET', NULL, NULL, NULL, 'hijos', '', '1', 'null'),
(55, '2024-03-28 15:18:35', NULL, 'GET', NULL, NULL, NULL, 'dias', '', '2', 'null'),
(56, '2024-03-28 15:18:36', NULL, 'GET', NULL, NULL, NULL, 'festivos', '', '1-2-2024##31-3-2024', 'null'),
(57, '2024-03-28 15:18:36', NULL, 'GET', NULL, NULL, NULL, 'hijos', '', '1', 'null'),
(58, '2024-03-28 15:18:36', NULL, 'GET', NULL, NULL, NULL, 'dias', '', '2', 'null'),
(59, '2024-03-28 15:18:36', NULL, 'GET', NULL, NULL, NULL, 'festivos', '', '1-2-2024##31-3-2024', 'null'),
(60, '2024-03-28 15:18:36', NULL, 'GET', NULL, NULL, NULL, 'hijos', '', '1', 'null'),
(61, '2024-03-28 15:18:36', NULL, 'GET', NULL, NULL, NULL, 'dias', '', '2', 'null'),
(62, '2024-03-28 15:18:36', NULL, 'GET', NULL, NULL, NULL, 'festivos', '', '1-2-2024##31-3-2024', 'null'),
(63, '2024-03-28 15:18:36', NULL, 'GET', NULL, NULL, NULL, 'hijos', '', '1', 'null'),
(64, '2024-03-28 15:18:36', NULL, 'GET', NULL, NULL, NULL, 'dias', '', '2', 'null'),
(65, '2024-03-28 15:18:36', NULL, 'GET', NULL, NULL, NULL, 'festivos', '', '1-2-2024##31-3-2024', 'null'),
(66, '2024-03-28 15:18:36', NULL, 'GET', NULL, NULL, NULL, 'hijos', '', '1', 'null'),
(67, '2024-03-28 15:18:36', NULL, 'GET', NULL, NULL, NULL, 'dias', '', '2', 'null'),
(68, '2024-03-28 15:18:36', NULL, 'GET', NULL, NULL, NULL, 'festivos', '', '1-1-2024##29-2-2024', 'null'),
(69, '2024-03-28 15:18:36', NULL, 'GET', NULL, NULL, NULL, 'hijos', '', '1', 'null'),
(70, '2024-03-28 15:18:36', NULL, 'GET', NULL, NULL, NULL, 'dias', '', '2', 'null'),
(71, '2024-03-28 15:18:37', NULL, 'GET', NULL, NULL, NULL, 'festivos', '', '1-1-2024##29-2-2024', 'null'),
(72, '2024-03-28 15:18:37', NULL, 'GET', NULL, NULL, NULL, 'hijos', '', '1', 'null'),
(73, '2024-03-28 15:18:37', NULL, 'GET', NULL, NULL, NULL, 'dias', '', '2', 'null'),
(74, '2024-03-28 15:18:37', NULL, 'GET', NULL, NULL, NULL, 'festivos', '', '1-1-2024##29-2-2024', 'null'),
(75, '2024-03-28 15:18:37', NULL, 'GET', NULL, NULL, NULL, 'hijos', '', '1', 'null'),
(76, '2024-03-28 15:18:37', NULL, 'GET', NULL, NULL, NULL, 'dias', '', '2', 'null'),
(77, '2024-03-28 15:18:37', NULL, 'GET', NULL, NULL, NULL, 'festivos', '', '1-1-2024##29-2-2024', 'null'),
(78, '2024-03-28 15:18:37', NULL, 'GET', NULL, NULL, NULL, 'hijos', '', '1', 'null'),
(79, '2024-03-28 15:18:37', NULL, 'GET', NULL, NULL, NULL, 'dias', '', '2', 'null'),
(80, '2024-03-28 15:18:37', NULL, 'GET', NULL, NULL, NULL, 'festivos', '', '1-1-2024##29-2-2024', 'null'),
(81, '2024-03-28 15:18:37', NULL, 'GET', NULL, NULL, NULL, 'hijos', '', '1', 'null'),
(82, '2024-03-28 15:18:37', NULL, 'GET', NULL, NULL, NULL, 'dias', '', '2', 'null'),
(83, '2024-03-28 15:18:38', NULL, 'GET', NULL, NULL, NULL, 'festivos', '', '1-2-2024##31-3-2024', 'null'),
(84, '2024-03-28 15:18:38', NULL, 'GET', NULL, NULL, NULL, 'hijos', '', '1', 'null'),
(85, '2024-03-28 15:18:38', NULL, 'GET', NULL, NULL, NULL, 'dias', '', '2', 'null'),
(86, '2024-03-28 15:18:38', NULL, 'GET', NULL, NULL, NULL, 'festivos', '', '1-2-2024##31-3-2024', 'null'),
(87, '2024-03-28 15:18:38', NULL, 'GET', NULL, NULL, NULL, 'hijos', '', '1', 'null'),
(88, '2024-03-28 15:18:38', NULL, 'GET', NULL, NULL, NULL, 'dias', '', '2', 'null'),
(89, '2024-03-28 15:18:38', NULL, 'GET', NULL, NULL, NULL, 'festivos', '', '1-2-2024##31-3-2024', 'null'),
(90, '2024-03-28 15:18:38', NULL, 'GET', NULL, NULL, NULL, 'hijos', '', '1', 'null'),
(91, '2024-03-28 15:18:38', NULL, 'GET', NULL, NULL, NULL, 'dias', '', '2', 'null'),
(92, '2024-03-28 15:18:38', NULL, 'GET', NULL, NULL, NULL, 'festivos', '', '1-2-2024##31-3-2024', 'null'),
(93, '2024-03-28 15:18:38', NULL, 'GET', NULL, NULL, NULL, 'hijos', '', '1', 'null'),
(94, '2024-03-28 15:18:38', NULL, 'GET', NULL, NULL, NULL, 'dias', '', '2', 'null'),
(95, '2024-03-28 15:18:39', NULL, 'GET', NULL, NULL, NULL, 'festivos', '', '1-2-2024##31-3-2024', 'null'),
(96, '2024-03-28 15:18:39', NULL, 'GET', NULL, NULL, NULL, 'hijos', '', '1', 'null'),
(97, '2024-03-28 15:18:39', NULL, 'GET', NULL, NULL, NULL, 'dias', '', '2', 'null'),
(98, '2024-03-28 15:18:41', NULL, 'GET', NULL, NULL, NULL, 'festivos', '', '1-2-2024##31-3-2024', 'null'),
(99, '2024-03-28 15:18:41', NULL, 'GET', NULL, NULL, NULL, 'hijos', '', '1', 'null'),
(100, '2024-03-28 15:18:41', NULL, 'GET', NULL, NULL, NULL, 'dias', '', '2', 'null'),
(101, '2024-03-28 15:18:42', NULL, 'GET', NULL, NULL, NULL, 'festivos', '', '1-2-2024##31-3-2024', 'null'),
(102, '2024-03-28 15:18:42', NULL, 'GET', NULL, NULL, NULL, 'hijos', '', '1', 'null'),
(103, '2024-03-28 15:18:42', NULL, 'GET', NULL, NULL, NULL, 'dias', '', '2', 'null');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `padre`
--

CREATE TABLE `padre` (
  `id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `padre`
--

INSERT INTO `padre` (`id`) VALUES
(1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellidos` varchar(80) NOT NULL,
  `correo` varchar(90) DEFAULT NULL,
  `clave` varchar(255) DEFAULT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT 1,
  `telefono` char(9) DEFAULT NULL,
  `dni` char(9) DEFAULT NULL,
  `iban` char(24) DEFAULT NULL,
  `titular` varchar(120) DEFAULT NULL,
  `fechaFirmaMandato` date DEFAULT NULL,
  `referenciaUnicaMandato` varchar(35) DEFAULT NULL,
  `_notas` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`id`, `nombre`, `apellidos`, `correo`, `clave`, `activo`, `telefono`, `dni`, `iban`, `titular`, `fechaFirmaMandato`, `referenciaUnicaMandato`, `_notas`) VALUES
(1, 'antonio', 'antonio', 'antonio@gmail.com', '$2y$15$7y0Grz.ZxYMn/YkNdbXyMOoUYpFzC0qUklI/3zufN1ZxhmeJq6cm6', 1, '666666666', '66666666c', 'ES9121000418450200051332', 'antonio', NULL, NULL, NULL),
(2, 'fernando', 'alonso', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recuperacionclaves`
--

CREATE TABLE `recuperacionclaves` (
  `id` int(10) UNSIGNED NOT NULL,
  `fechaLimite` datetime NOT NULL,
  `codigo` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `curso`
--
ALTER TABLE `curso`
  ADD KEY `FK_Curso_id` (`id`);

--
-- Indices de la tabla `dias`
--
ALTER TABLE `dias`
  ADD PRIMARY KEY (`dia`,`idPersona`),
  ADD KEY `FK_Dias_idPersona` (`idPersona`),
  ADD KEY `FK_Dias_idPadre` (`idPadre`);

--
-- Indices de la tabla `festivo`
--
ALTER TABLE `festivo`
  ADD PRIMARY KEY (`diaFestivo`);

--
-- Indices de la tabla `hijo`
--
ALTER TABLE `hijo`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UQ_Hijo_pin` (`pin`),
  ADD KEY `FK_Hijo_idPadreAlta` (`idPadreAlta`),
  ADD KEY `FK_Hijo_idCurso` (`idCurso`);

--
-- Indices de la tabla `hijo_padre`
--
ALTER TABLE `hijo_padre`
  ADD PRIMARY KEY (`idPadre`,`idHijo`),
  ADD KEY `FK_Hijo_Padre_idHijo` (`idHijo`);

--
-- Indices de la tabla `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `padre`
--
ALTER TABLE `padre`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UQ_correoPersona` (`correo`),
  ADD UNIQUE KEY `UQ_referenciaUnicaMandato` (`referenciaUnicaMandato`),
  ADD UNIQUE KEY `UQ_dniPersona` (`dni`);

--
-- Indices de la tabla `recuperacionclaves`
--
ALTER TABLE `recuperacionclaves`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UQ_RecuperacionClaves_Codigo` (`codigo`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `log`
--
ALTER TABLE `log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `dias`
--
ALTER TABLE `dias`
  ADD CONSTRAINT `FK_Dias_idPadre` FOREIGN KEY (`idPadre`) REFERENCES `padre` (`id`),
  ADD CONSTRAINT `FK_Dias_idPersona` FOREIGN KEY (`idPersona`) REFERENCES `persona` (`id`);

--
-- Filtros para la tabla `hijo`
--
ALTER TABLE `hijo`
  ADD CONSTRAINT `FK_Hijo_id` FOREIGN KEY (`id`) REFERENCES `persona` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_Hijo_idCurso` FOREIGN KEY (`idCurso`) REFERENCES `curso` (`id`),
  ADD CONSTRAINT `FK_Hijo_idPadreAlta` FOREIGN KEY (`idPadreAlta`) REFERENCES `padre` (`id`);

--
-- Filtros para la tabla `hijo_padre`
--
ALTER TABLE `hijo_padre`
  ADD CONSTRAINT `FK_Hijo_Padre_idHijo` FOREIGN KEY (`idHijo`) REFERENCES `hijo` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_Hijo_Padre_idPadre` FOREIGN KEY (`idPadre`) REFERENCES `padre` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `padre`
--
ALTER TABLE `padre`
  ADD CONSTRAINT `FK_Padre_id` FOREIGN KEY (`id`) REFERENCES `persona` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `recuperacionclaves`
--
ALTER TABLE `recuperacionclaves`
  ADD CONSTRAINT `FK_RecuperacionClaves_id` FOREIGN KEY (`id`) REFERENCES `persona` (`id`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `FK_Usuario_id` FOREIGN KEY (`id`) REFERENCES `persona` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
