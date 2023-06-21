-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 21-06-2023 a las 10:44:34
-- Versión del servidor: 10.3.28-MariaDB
-- Versión de PHP: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `guadalupe_appcomedor`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Curso`
--

CREATE TABLE `Curso` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `Curso`
--

INSERT INTO `Curso` (`id`, `nombre`) VALUES
(1, '1º Infantil'),
(2, '2º Infantil'),
(3, '1º Primaria'),
(4, '2º Primaria'),
(5, '3º Primaria'),
(6, '4º Primaria'),
(7, '5º Primaria'),
(8, '6º Primaria'),
(9, '1º ESO'),
(10, '2º ESO'),
(11, '3º ESO'),
(12, '4º ESO'),
(13, '1º BACH'),
(14, '2º BACH'),
(15, '1º CFGM'),
(16, '2º CFGM'),
(17, '1º CFGS');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Dias`
--

CREATE TABLE `Dias` (
  `dia` date NOT NULL,
  `idPersona` smallint(5) UNSIGNED NOT NULL,
  `idPadre` smallint(5) UNSIGNED DEFAULT NULL,
  `incidencia` varchar(500) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `Dias`
--

INSERT INTO `Dias` (`dia`, `idPersona`, `idPadre`, `incidencia`) VALUES
('2023-06-16', 5, 1, 'No come macarrones'),
('2023-06-17', 5, 1, NULL),
('2023-06-18', 5, 1, NULL),
('2023-06-19', 5, 1, 'No come uvas'),
('2023-06-20', 5, 1, NULL),
('2023-06-20', 18, 17, NULL),
('2023-06-21', 5, 1, NULL),
('2023-06-21', 18, 17, NULL),
('2023-06-22', 5, 1, NULL),
('2023-06-22', 18, 17, NULL),
('2023-06-23', 5, 1, NULL),
('2023-06-23', 18, 17, NULL),
('2023-06-24', 5, 1, NULL),
('2023-06-24', 16, 11, NULL),
('2023-06-24', 18, 17, NULL),
('2023-06-25', 5, 1, NULL),
('2023-06-25', 16, 11, NULL),
('2023-06-25', 18, 17, NULL),
('2023-06-26', 5, 1, NULL),
('2023-06-26', 18, 17, NULL),
('2023-06-27', 5, 1, NULL),
('2023-06-28', 5, 1, NULL),
('2023-06-29', 5, 1, NULL),
('2023-06-29', 18, 17, NULL),
('2023-06-30', 5, 1, NULL),
('2023-06-30', 18, 17, NULL),
('2023-08-05', 5, 1, NULL),
('2023-08-06', 5, 1, NULL),
('2023-08-12', 5, 1, NULL),
('2023-08-13', 5, 1, NULL),
('2023-08-19', 5, 1, NULL),
('2023-08-20', 5, 1, NULL),
('2023-08-26', 5, 1, NULL),
('2023-08-27', 5, 1, NULL),
('2023-11-04', 5, 1, NULL),
('2023-11-05', 5, 1, NULL),
('2023-11-11', 5, 1, NULL),
('2023-11-12', 5, 1, NULL),
('2023-11-18', 5, 1, NULL),
('2023-11-19', 5, 1, NULL),
('2023-11-25', 5, 1, NULL),
('2023-11-26', 5, 1, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Festivo`
--

CREATE TABLE `Festivo` (
  `diaFestivo` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Hijo`
--

CREATE TABLE `Hijo` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `idPadreAlta` smallint(5) UNSIGNED NOT NULL,
  `idCurso` tinyint(3) UNSIGNED NOT NULL,
  `pin` char(8) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `Hijo`
--

INSERT INTO `Hijo` (`id`, `idPadreAlta`, `idCurso`, `pin`) VALUES
(4, 2, 5, '87654321'),
(5, 1, 8, '11223344'),
(6, 2, 11, '10203040'),
(15, 11, 3, '134763FB'),
(16, 11, 1, '15FEC0B8'),
(18, 17, 14, '4B1D4DFD');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Hijo_Padre`
--

CREATE TABLE `Hijo_Padre` (
  `idPadre` smallint(5) UNSIGNED NOT NULL,
  `idHijo` smallint(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `Hijo_Padre`
--

INSERT INTO `Hijo_Padre` (`idPadre`, `idHijo`) VALUES
(1, 5),
(2, 4),
(2, 6),
(11, 15),
(11, 16),
(17, 18);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Padre`
--

CREATE TABLE `Padre` (
  `id` smallint(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `Padre`
--

INSERT INTO `Padre` (`id`) VALUES
(1),
(2),
(3),
(10),
(11),
(17),
(20);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Persona`
--

CREATE TABLE `Persona` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `apellidos` varchar(80) COLLATE utf8_spanish_ci NOT NULL,
  `correo` varchar(90) COLLATE utf8_spanish_ci DEFAULT NULL,
  `clave` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `telefono` char(9) COLLATE utf8_spanish_ci DEFAULT NULL,
  `dni` char(9) COLLATE utf8_spanish_ci DEFAULT NULL,
  `iban` char(24) COLLATE utf8_spanish_ci DEFAULT NULL,
  `titular` varchar(120) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fechaFirmaMandato` date DEFAULT NULL,
  `referenciaUnicaMandato` varchar(35) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `Persona`
--

INSERT INTO `Persona` (`id`, `nombre`, `apellidos`, `correo`, `clave`, `telefono`, `dni`, `iban`, `titular`, `fechaFirmaMandato`, `referenciaUnicaMandato`) VALUES
(1, 'Padre1', 'Prueba1', 'email11@gmail.com', '$2y$15$.LtfOiAtM44kRXnPP3AbQODd00CdEWL0/dwcZwmj890ebBFXo0LG6', '609040501', '82307805E', 'ES9420805801101234567891', 'Padre1', '2023-06-01', '123132132321'),
(2, 'Madre', 'Prueba', 'email2@gmail.com', '$2y$15$.LtfOiAtM44kRXnPP3AbQODd00CdEWL0/dwcZwmj890ebBFXo0LG6', '601044401', '98303205F', 'ES9420805801101234567891', 'Madre', NULL, NULL),
(3, 'Padre', 'Login', 'padre@gmail.com', '$2y$15$.LtfOiAtM44kRXnPP3AbQODd00CdEWL0/dwcZwmj890ebBFXo0LG6', '605678411', '76143305G', 'ES9420805801101234567891', 'Padre', NULL, NULL),
(4, 'Bart', 'Simpson', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 'Lisa', 'Simpson', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 'Maggie', 'Simpson', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, 'Rivera Salgado', 'Sergio', 'sergioriverasalgado.guadalupe@alumnado.fundacionloyola.net', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 'MARIA  TERESA', 'MALIA CORDON', 'tmalia@fundacionloyola.es', '$2y$15$rZLinI.3NMNYmYbhuRaqIe/2C3ABUSM55d3WFJLdz0TU2gPwOJtjG', '651510402', '08828349Y', 'ES3030090079132600104117', 'MARIA TERESA MALIA CORDON', NULL, NULL),
(11, 'Isabel', 'Romo Castillo', 'iromo@fundacionloyola.es', '$2y$15$0CoiJpeMGrsAn85woQJ0qOkSli66iHiT3dzNJ7kJESZ19ZRo2R.Nm', '657414162', '80078547E', 'ES0501825819560201560683', 'Isabel Romo Castillo', NULL, NULL),
(15, 'Antonio', 'Jiménez Romo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(16, 'Isabel ', 'Jiménez Romo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(17, 'Pilar', 'Villalón Plá ', 'villalonpla@gmail.com', '$2y$15$6VLBhTKu5KA4j7G6osBc..HN8/bB.orqPy/CWJZ6ptxqT5xuGbhOK', '636999291', '08827166L', 'ES9200494990642116286183', 'Pilar Villalón Plá ', NULL, NULL),
(18, 'Carlos ', 'Albarrán Villalón ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(19, 'Miguel', 'Jaque Barbero', 'mjaque@fundacionloyola.es', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(20, 'Paqui', 'Mateos Nogales', 'paquimateosnogales@gmail.com', '$2y$15$TmLm4KyDpfZJFfC8NqDuO.SAGKKueiUeu4MMBl1PPk6TBi.iQccOG', '649038578', '53262266q', 'ES9830090088201572241212', 'Paqui', NULL, NULL),
(23, 'Mª DEL PILAR', 'VILLALÓN PLÁ', 'pvillalon@fundacionloyola.es', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `RecuperacionClaves`
--

CREATE TABLE `RecuperacionClaves` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `fechaLimite` datetime NOT NULL,
  `codigo` varchar(16) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Usuario`
--

CREATE TABLE `Usuario` (
  `id` smallint(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `Usuario`
--

INSERT INTO `Usuario` (`id`) VALUES
(7),
(19),
(23);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Curso`
--
ALTER TABLE `Curso`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `Dias`
--
ALTER TABLE `Dias`
  ADD PRIMARY KEY (`dia`,`idPersona`),
  ADD KEY `FK_Dias_idPersona` (`idPersona`),
  ADD KEY `FK_Dias_idPadre` (`idPadre`);

--
-- Indices de la tabla `Festivo`
--
ALTER TABLE `Festivo`
  ADD PRIMARY KEY (`diaFestivo`);

--
-- Indices de la tabla `Hijo`
--
ALTER TABLE `Hijo`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UQ_Hijo_pin` (`pin`),
  ADD KEY `FK_Hijo_idPadreAlta` (`idPadreAlta`),
  ADD KEY `FK_Hijo_idCurso` (`idCurso`);

--
-- Indices de la tabla `Hijo_Padre`
--
ALTER TABLE `Hijo_Padre`
  ADD PRIMARY KEY (`idPadre`,`idHijo`),
  ADD KEY `FK_Hijo_Padre_idHijo` (`idHijo`);

--
-- Indices de la tabla `Padre`
--
ALTER TABLE `Padre`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `Persona`
--
ALTER TABLE `Persona`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UQ_correoPersona` (`correo`),
  ADD UNIQUE KEY `UQ_referenciaUnicaMandato` (`referenciaUnicaMandato`),
  ADD UNIQUE KEY `UQ_dniPersona` (`dni`);

--
-- Indices de la tabla `RecuperacionClaves`
--
ALTER TABLE `RecuperacionClaves`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UQ_RecuperacionClaves_Codigo` (`codigo`);

--
-- Indices de la tabla `Usuario`
--
ALTER TABLE `Usuario`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `Curso`
--
ALTER TABLE `Curso`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `Persona`
--
ALTER TABLE `Persona`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `Dias`
--
ALTER TABLE `Dias`
  ADD CONSTRAINT `FK_Dias_idPadre` FOREIGN KEY (`idPadre`) REFERENCES `Padre` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_Dias_idPersona` FOREIGN KEY (`idPersona`) REFERENCES `Persona` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `Hijo`
--
ALTER TABLE `Hijo`
  ADD CONSTRAINT `FK_Hijo_id` FOREIGN KEY (`id`) REFERENCES `Persona` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_Hijo_idCurso` FOREIGN KEY (`idCurso`) REFERENCES `Curso` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_Hijo_idPadreAlta` FOREIGN KEY (`idPadreAlta`) REFERENCES `Padre` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `Hijo_Padre`
--
ALTER TABLE `Hijo_Padre`
  ADD CONSTRAINT `FK_Hijo_Padre_idHijo` FOREIGN KEY (`idHijo`) REFERENCES `Hijo` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_Hijo_Padre_idPadre` FOREIGN KEY (`idPadre`) REFERENCES `Padre` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `Padre`
--
ALTER TABLE `Padre`
  ADD CONSTRAINT `FK_Padre_id` FOREIGN KEY (`id`) REFERENCES `Persona` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `RecuperacionClaves`
--
ALTER TABLE `RecuperacionClaves`
  ADD CONSTRAINT `FK_RecuperacionClaves_id` FOREIGN KEY (`id`) REFERENCES `Persona` (`id`);

--
-- Filtros para la tabla `Usuario`
--
ALTER TABLE `Usuario`
  ADD CONSTRAINT `FK_Usuario_id` FOREIGN KEY (`id`) REFERENCES `Persona` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
