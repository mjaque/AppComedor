-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 21-06-2023 a las 17:32:27
-- Versión del servidor: 8.0.33-0ubuntu0.22.04.2
-- Versión de PHP: 8.1.2-1ubuntu2.11

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: appcomedor
--

--
-- Estructura de tabla para la tabla Curso
--
DROP TABLE IF EXISTS Curso;
CREATE TABLE Curso (
  id INT UNSIGNED NOT NULL,
  nombre varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  KEY FK_Curso_id (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla Curso
--

INSERT INTO Curso (id, nombre) VALUES
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


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla Dias
--

DROP TABLE IF EXISTS Dias;
CREATE TABLE IF NOT EXISTS Dias (
  dia date NOT NULL,
  idPersona INT UNSIGNED NOT NULL,
  idPadre INT UNSIGNED DEFAULT NULL,
  incidencia varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  PRIMARY KEY (dia,idPersona),
  KEY FK_Dias_idPersona (idPersona),
  KEY FK_Dias_idPadre (idPadre)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;


--
-- Estructura de tabla para la tabla Festivo
--

DROP TABLE IF EXISTS Festivo;
CREATE TABLE IF NOT EXISTS Festivo (
  diaFestivo date NOT NULL,
  PRIMARY KEY (diaFestivo)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla Hijo
--

DROP TABLE IF EXISTS Hijo;
CREATE TABLE IF NOT EXISTS Hijo (
  id INT UNSIGNED NOT NULL,
  idPadreAlta INT UNSIGNED NOT NULL,
  idCurso INT UNSIGNED NOT NULL,
  pin char(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  activo tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (id),
  UNIQUE KEY UQ_Hijo_pin (pin),
  KEY FK_Hijo_idPadreAlta (idPadreAlta),
  KEY FK_Hijo_idCurso (idCurso)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla Hijo_Padre
--

DROP TABLE IF EXISTS Hijo_Padre;
CREATE TABLE IF NOT EXISTS Hijo_Padre (
  idPadre INT UNSIGNED NOT NULL,
  idHijo INT UNSIGNED NOT NULL,
  activo tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (idPadre,idHijo),
  KEY FK_Hijo_Padre_idHijo (idHijo)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla Padre
--

DROP TABLE IF EXISTS Padre;
CREATE TABLE IF NOT EXISTS Padre (
  id INT UNSIGNED NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla Persona
--

DROP TABLE IF EXISTS Persona;
CREATE TABLE IF NOT EXISTS Persona (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  nombre varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  apellidos varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  correo varchar(90) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  clave varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  activo tinyint(1) NOT NULL DEFAULT '1',
  telefono char(9) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  dni char(9) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  iban char(24) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  titular varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  fechaFirmaMandato date DEFAULT NULL,
  referenciaUnicaMandato varchar(35) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY UQ_correoPersona (correo),
  UNIQUE KEY UQ_referenciaUnicaMandato (referenciaUnicaMandato),
  UNIQUE KEY UQ_dniPersona (dni)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

INSERT INTO Persona (nombre, apellidos, correo) VALUES('Pruebas', 'Secretaría', 'mjaque@fundacionloyola.es');
-- --------------------------------------------------------

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla RecuperacionClaves
--

DROP TABLE IF EXISTS RecuperacionClaves;
CREATE TABLE IF NOT EXISTS RecuperacionClaves (
  id INT UNSIGNED NOT NULL,
  fechaLimite datetime NOT NULL,
  codigo varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY UQ_RecuperacionClaves_Codigo (codigo)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla Usuario
--

DROP TABLE IF EXISTS Usuario;
CREATE TABLE IF NOT EXISTS Usuario (
  id INT UNSIGNED NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla Dias
--
ALTER TABLE Dias
  ADD CONSTRAINT FK_Dias_idPadre FOREIGN KEY (idPadre) REFERENCES Padre (id),
  ADD CONSTRAINT FK_Dias_idPersona FOREIGN KEY (idPersona) REFERENCES Persona (id);

--
-- Filtros para la tabla Hijo
--
ALTER TABLE Hijo
  ADD CONSTRAINT FK_Hijo_id FOREIGN KEY (id) REFERENCES Persona (id) ON DELETE CASCADE,
  ADD CONSTRAINT FK_Hijo_idCurso FOREIGN KEY (idCurso) REFERENCES Curso (id),
  ADD CONSTRAINT FK_Hijo_idPadreAlta FOREIGN KEY (idPadreAlta) REFERENCES Padre (id);

--
-- Filtros para la tabla Hijo_Padre
--
ALTER TABLE Hijo_Padre
  ADD CONSTRAINT FK_Hijo_Padre_idHijo FOREIGN KEY (idHijo) REFERENCES Hijo (id) ON DELETE CASCADE,
  ADD CONSTRAINT FK_Hijo_Padre_idPadre FOREIGN KEY (idPadre) REFERENCES Padre (id) ON DELETE CASCADE;

--
-- Filtros para la tabla Padre
--
ALTER TABLE Padre
  ADD CONSTRAINT FK_Padre_id FOREIGN KEY (id) REFERENCES Persona (id) ON DELETE CASCADE;

--
-- Filtros para la tabla RecuperacionClaves
--
ALTER TABLE RecuperacionClaves
  ADD CONSTRAINT FK_RecuperacionClaves_id FOREIGN KEY (id) REFERENCES Persona (id);

--
-- Filtros para la tabla Usuario
--
ALTER TABLE Usuario
  ADD CONSTRAINT FK_Usuario_id FOREIGN KEY (id) REFERENCES Persona (id) ON DELETE CASCADE;
SET FOREIGN_KEY_CHECKS=1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
