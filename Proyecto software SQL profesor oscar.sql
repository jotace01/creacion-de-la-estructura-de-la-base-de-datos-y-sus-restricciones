-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-11-2023 a las 19:45:11
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `adsovirtual`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asesor`
--

CREATE TABLE `asesor` (
  `id_asesor` varchar(10) NOT NULL,
  `nom_asesor` varchar(10) DEFAULT NULL,
  `apellido_asesor` varchar(20) DEFAULT NULL,
  `especialidad_asesor` varchar(20) DEFAULT NULL,
  `tel_asesor` varchar(12) DEFAULT NULL,
  `email_asesor` varchar(20) DEFAULT NULL,
  `clave_c1` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` varchar(10) NOT NULL,
  `nom_cliente` varchar(10) DEFAULT NULL,
  `apellido_cliente` varchar(20) DEFAULT NULL,
  `direcc_cliente` varchar(20) DEFAULT NULL,
  `tel_cliente` varchar(12) DEFAULT NULL,
  `email_cliente` varchar(20) DEFAULT NULL,
  `clave_c1` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `diego_dj_producciones`
--

CREATE TABLE `diego_dj_producciones` (
  `clave_c` varchar(5) NOT NULL,
  `id_c` varchar(30) DEFAULT NULL,
  `nom_c` varchar(30) DEFAULT NULL,
  `direcc_c` varchar(30) DEFAULT NULL,
  `tel_c` varchar(12) DEFAULT NULL,
  `email_c` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evento`
--

CREATE TABLE `evento` (
  `id_evento` varchar(10) NOT NULL,
  `nom_evento` varchar(10) DEFAULT NULL,
  `direcc_evento` varchar(20) DEFAULT NULL,
  `descrip_evento` varchar(20) DEFAULT NULL,
  `costo` int(11) DEFAULT NULL,
  `clave_c1` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden_reserva_evento`
--

CREATE TABLE `orden_reserva_evento` (
  `id_reserva` varchar(2) NOT NULL,
  `fecha_reserv` varchar(10) DEFAULT NULL,
  `hora_reserv` int(11) DEFAULT NULL,
  `lugar_reserv` varchar(10) DEFAULT NULL,
  `direcc_reserv` varchar(20) DEFAULT NULL,
  `clave_c1` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asesor`
--
ALTER TABLE `asesor`
  ADD PRIMARY KEY (`id_asesor`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indices de la tabla `diego_dj_producciones`
--
ALTER TABLE `diego_dj_producciones`
  ADD PRIMARY KEY (`clave_c`);

--
-- Indices de la tabla `evento`
--
ALTER TABLE `evento`
  ADD PRIMARY KEY (`id_evento`);

--
-- Indices de la tabla `orden_reserva_evento`
--
ALTER TABLE `orden_reserva_evento`
  ADD PRIMARY KEY (`id_reserva`),
  ADD KEY `clave_c1` (`clave_c1`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asesor`
--
ALTER TABLE `asesor`
  ADD CONSTRAINT `asesor_ibfk_1` FOREIGN KEY (`id_asesor`) REFERENCES `orden_reserva_evento` (`id_reserva`);

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `orden_reserva_evento` (`id_reserva`);

--
-- Filtros para la tabla `evento`
--
ALTER TABLE `evento`
  ADD CONSTRAINT `evento_ibfk_1` FOREIGN KEY (`id_evento`) REFERENCES `orden_reserva_evento` (`id_reserva`);

--
-- Filtros para la tabla `orden_reserva_evento`
--
ALTER TABLE `orden_reserva_evento`
  ADD CONSTRAINT `orden_reserva_evento_ibfk_1` FOREIGN KEY (`clave_c1`) REFERENCES `diego_dj_producciones` (`clave_c`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
