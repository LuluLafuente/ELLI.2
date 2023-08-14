-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-08-2023 a las 06:00:34
-- Versión del servidor: 10.4.25-MariaDB
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_prueba`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrativo`
--

CREATE TABLE `administrativo` (
  `ID_ADMINISTRATIVO` int(11) NOT NULL,
  `LEGAJO_ADM` varchar(15) NOT NULL,
  `DNI` int(11) NOT NULL,
  `NOMBRE` varchar(30) NOT NULL,
  `APELLIDO` varchar(30) NOT NULL,
  `ROL_ADMINISTRATIVO` int(11) NOT NULL,
  `USUARIO` varchar(50) NOT NULL,
  `CONTRASENIA` varchar(20) NOT NULL,
  `DOMICILIO` varchar(50) NOT NULL,
  `NRO_DOMICILIO` int(11) DEFAULT NULL,
  `CELULAR` int(11) DEFAULT NULL,
  `FOTO_ADM` varchar(100) NOT NULL,
  `FECHA_INSC` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `administrativo`
--

INSERT INTO `administrativo` (`ID_ADMINISTRATIVO`, `LEGAJO_ADM`, `DNI`, `NOMBRE`, `APELLIDO`, `ROL_ADMINISTRATIVO`, `USUARIO`, `CONTRASENIA`, `DOMICILIO`, `NRO_DOMICILIO`, `CELULAR`, `FOTO_ADM`, `FECHA_INSC`) VALUES
(1, 'TSDS-19-1-A', 1, 'Rosana', 'Salomon', 1, 'rsaolomon@iset.com.ar', '1', 'calle', 123, 38100001, '.\\img_profile\\perfil.png', '2023-07-18 18:05:10'),
(2, 'TSDS-19-2-A', 2, 'Paula', 'Vázquez', 1, 'pvazquez@iset.com.ar', '1', 'calle', 123, 38100001, '.\\img_profile\\perfil.png', '2023-07-18 18:05:10'),
(3, 'TSDS-19-3-A', 3, 'Celia', 'Valenzuela', 1, 'cvalenzuela@iset.com.ar', '1', 'calle', 123, 38100001, '.\\img_profile\\perfil.png', '2023-07-18 18:05:10'),
(4, 'TSDS-19-4-A', 4, 'Pablo', 'Zelaya', 1, 'pzelaya@iset.com.ar', '1', 'calle', 123, 38100001, '.\\img_profile\\perfil.png', '2023-07-18 18:05:10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumno`
--

CREATE TABLE `alumno` (
  `ID_ALUMNO` int(11) NOT NULL,
  `DNI` int(11) NOT NULL,
  `NOMBRE` varchar(50) NOT NULL,
  `APELLIDO` varchar(50) NOT NULL,
  `ROL_ALUMNO` int(11) NOT NULL,
  `USUARIO` varchar(50) NOT NULL,
  `CONTRASENIA` varchar(20) NOT NULL,
  `DOMICILIO` varchar(100) NOT NULL,
  `NRO_DOMICILIO` int(11) DEFAULT NULL,
  `CELULAR` int(10) UNSIGNED ZEROFILL DEFAULT NULL,
  `RED_FACEBOOK` varchar(100) DEFAULT NULL,
  `RED_INSTAGRAM` varchar(100) DEFAULT NULL,
  `RED_TWITTER` varchar(100) DEFAULT NULL,
  `FOTO_ALU` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `alumno`
--

INSERT INTO `alumno` (`ID_ALUMNO`, `DNI`, `NOMBRE`, `APELLIDO`, `ROL_ALUMNO`, `USUARIO`, `CONTRASENIA`, `DOMICILIO`, `NRO_DOMICILIO`, `CELULAR`, `RED_FACEBOOK`, `RED_INSTAGRAM`, `RED_TWITTER`, `FOTO_ALU`) VALUES
(1, 1, 'Lourdes', 'Lafuente', 3, 'llafuente@iset.com.ar', '0', 'calle', 123, 0038100001, 'https://www.facebook.com/usuario', 'https://www.instagram.com/usuario', 'https://www.instagram.com/usuario', '.\\img_profile\\perfil.png'),
(2, 2, 'Ignacio', 'Llorente', 3, 'illorente@iset.com.ar', '0', 'calle', 123, 0038100001, NULL, NULL, NULL, '.\\img_profile\\perfil.png'),
(3, 3, 'Lucas', 'Villagran', 3, 'lvillagran@iset.com.ar', '0', 'calle', 123, 0038100001, NULL, NULL, NULL, '.\\img_profile\\perfil.png'),
(4, 4, 'David', 'Carrazana', 3, 'dcarrazana@iset.com.ar', '0', 'calle', 123, 0038100001, NULL, NULL, NULL, '.\\img_profile\\perfil.png'),
(5, 5, 'Ariel', 'Kasiañuk', 3, 'akasiañuk@iset.com.ar', '0', 'calle', 123, 0038100001, NULL, NULL, NULL, '.\\img_profile\\perfil.png'),
(6, 6, 'Carlos', 'Namen', 3, 'cnamen@iset.com.ar', '0', 'calle', 123, 0038100001, NULL, NULL, NULL, '.\\img_profile\\perfil.png'),
(7, 7, 'Ramon', 'Gutierrez', 3, 'rgutierrez@iset.com.ar', '0', 'calle', 123, 0038100001, NULL, NULL, NULL, '.\\img_profile\\perfil.png'),
(8, 8, 'Ricardo', 'Mejias Villejas', 3, 'rmejias@iset.com.ar', '0', 'calle', 123, 0038100001, NULL, NULL, NULL, '.\\img_profile\\perfil.png'),
(9, 9, 'Norma del Carmen', 'Navarro', 3, 'nnavarro@iset.com.ar', '0', 'calle', 123, 0038100001, NULL, NULL, NULL, '.\\img_profile\\perfil.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrera`
--

CREATE TABLE `carrera` (
  `ID_CARRERA` int(11) NOT NULL,
  `NOMBRE` varchar(100) NOT NULL,
  `ABREVIADO` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `carrera`
--

INSERT INTO `carrera` (`ID_CARRERA`, `NOMBRE`, `ABREVIADO`) VALUES
(1, 'Tecnicatura Superior en Desarrollo de Software', 'TSDS'),
(2, 'Tecnicatura Superior en Bioenergía', 'TSB'),
(3, 'Tecnicatura Superior en Gestión Ambiental', 'TSGA'),
(4, 'Tecnicatura Superior en Automatización y Robótica Industrial', 'TSARI');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cohorte`
--

CREATE TABLE `cohorte` (
  `ID_COHORTE` int(11) NOT NULL,
  `ID_CARRERA` int(11) NOT NULL,
  `NUMERO` int(11) NOT NULL,
  `ANIO` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cohorte`
--

INSERT INTO `cohorte` (`ID_COHORTE`, `ID_CARRERA`, `NUMERO`, `ANIO`) VALUES
(1, 1, 1, '2018-01-01'),
(2, 1, 2, '2019-01-01'),
(3, 1, 3, '2020-01-01'),
(4, 1, 4, '2021-01-01'),
(5, 1, 5, '2022-01-01'),
(6, 1, 6, '2023-01-01'),
(7, 2, 1, '2018-01-01'),
(8, 2, 2, '2019-01-01'),
(9, 2, 3, '2020-01-01'),
(10, 2, 4, '2021-01-01'),
(11, 2, 5, '2022-01-01'),
(12, 2, 6, '2023-01-01'),
(13, 3, 1, '2018-01-01'),
(14, 3, 2, '2019-01-01'),
(15, 3, 3, '2020-01-01'),
(16, 3, 4, '2021-01-01'),
(17, 3, 5, '2022-01-01'),
(18, 3, 6, '2023-01-01'),
(19, 4, 1, '2018-01-01'),
(20, 4, 2, '2019-01-01'),
(21, 4, 3, '2020-01-01'),
(22, 4, 4, '2021-01-01'),
(23, 4, 5, '2022-01-01'),
(24, 4, 6, '2023-01-01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cursa`
--

CREATE TABLE `cursa` (
  `ID_CURSADO` int(11) NOT NULL,
  `ID_ALUMNO` varchar(15) NOT NULL,
  `ID_MATERIA` int(11) NOT NULL,
  `FECHA` datetime NOT NULL,
  `CICLO` int(11) NOT NULL,
  `1ER_PARCIAL` int(11) DEFAULT NULL,
  `2DO_PARCIAL` int(11) DEFAULT NULL,
  `FINAL` int(11) DEFAULT NULL,
  `ESTADO` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cursa`
--

INSERT INTO `cursa` (`ID_CURSADO`, `ID_ALUMNO`, `ID_MATERIA`, `FECHA`, `CICLO`, `1ER_PARCIAL`, `2DO_PARCIAL`, `FINAL`, `ESTADO`) VALUES
(1, 'TSDS-19-001-AL', 1, '2023-08-03 22:08:33', 2023, 7, 7, 7, 'Promoción'),
(2, 'TSDS-19-001-AL', 2, '2023-08-03 22:08:33', 2023, 7, 9, 8, 'Promoción'),
(3, 'TSDS-19-001-AL', 3, '2023-08-03 22:08:33', 2023, 4, 4, 6, 'Aprobado'),
(4, 'TSDS-19-001-AL', 4, '2023-08-03 22:08:33', 2023, 8, 8, 8, 'Promoción'),
(5, 'TSDS-19-001-AL', 5, '2023-08-03 22:08:33', 2023, 10, 5, 10, 'Aprobado'),
(6, 'TSDS-19-001-AL', 6, '2023-08-03 22:08:33', 2023, 9, 10, 10, 'Promoción'),
(7, 'TSDS-19-001-AL', 7, '2023-08-03 22:08:33', 2023, 8, 8, 9, 'Aprobado'),
(8, 'TSDS-19-001-AL', 8, '2023-08-03 22:08:33', 2023, 8, 8, 9, 'Aprobado'),
(9, 'TSDS-19-001-AL', 9, '2023-08-03 22:08:33', 2023, 8, 7, 8, 'Aprobado'),
(10, 'TSDS-19-001-AL', 10, '2023-08-03 22:08:33', 2023, 10, 10, 10, 'Aprobado'),
(11, 'TSDS-19-001-AL', 11, '2023-08-03 22:08:33', 2023, -1, -1, -1, 'Sin Datos'),
(12, 'TSDS-19-001-AL', 12, '2023-08-03 22:08:33', 2023, -1, -1, -1, 'Sin Datos'),
(13, 'TSDS-19-001-AL', 13, '2023-08-03 22:08:33', 2023, -1, -1, -1, 'Sin Datos'),
(14, 'TSDS-19-001-AL', 14, '2023-08-03 22:08:33', 2023, -1, -1, -1, 'Sin Datos'),
(15, 'TSDS-19-001-AL', 15, '2023-08-03 22:08:33', 2023, -1, -1, -1, 'Sin Datos'),
(16, 'TSDS-19-001-AL', 16, '2023-08-03 22:08:33', 2023, -1, -1, -1, 'Sin Datos'),
(17, 'TSDS-19-001-AL', 17, '2023-08-03 22:08:33', 2023, -1, -1, -1, 'Sin Datos'),
(18, 'TSDS-19-001-AL', 18, '2023-08-03 22:08:33', 2023, -1, -1, -1, 'Sin Datos'),
(19, 'TSDS-19-001-AL', 19, '2023-08-03 22:08:33', 2023, -1, -1, -1, 'Sin Datos'),
(20, 'TSDS-19-001-AL', 20, '2023-08-03 22:08:33', 2023, -1, -1, -1, 'Sin Datos'),
(21, 'TSDS-19-001-AL', 21, '2023-08-03 22:08:33', 2023, -1, -1, -1, 'Sin Datos'),
(22, 'TSDS-19-001-AL', 22, '2023-08-03 22:08:33', 2023, -1, -1, -1, 'Sin Datos'),
(23, 'TSDS-19-001-AL', 23, '2023-08-03 22:08:33', 2023, -1, -1, -1, 'Sin Datos'),
(24, 'TSDS-19-001-AL', 24, '2023-08-03 22:08:33', 2023, -1, -1, -1, 'Sin Datos'),
(25, 'TSDS-19-001-AL', 25, '2023-08-03 22:08:33', 2023, -1, -1, -1, 'Sin Datos'),
(26, 'TSDS-19-001-AL', 26, '2023-08-03 22:08:33', 2023, -1, -1, -1, 'Sin Datos'),
(27, 'TSDS-19-001-AL', 27, '2023-08-03 22:08:33', 2023, -1, -1, -1, 'Sin Datos'),
(28, 'TSDS-19-004-AL', 1, '2023-08-03 22:08:34', 2023, 8, 7, 7, 'Promoción'),
(29, 'TSDS-19-004-AL', 2, '2023-08-03 22:08:34', 2023, 9, 9, 9, 'Promoción'),
(30, 'TSDS-19-004-AL', 3, '2023-08-03 22:08:34', 2023, 10, 10, 10, 'Regular'),
(31, 'TSDS-19-004-AL', 4, '2023-08-03 22:08:34', 2023, 7, 7, 7, 'Promoción'),
(32, 'TSDS-19-004-AL', 5, '2023-08-03 22:08:34', 2023, 0, 0, 0, 'Libre'),
(33, 'TSDS-19-004-AL', 6, '2023-08-03 22:08:34', 2023, 10, 6, 8, 'Regular'),
(34, 'TSDS-19-004-AL', 7, '2023-08-03 22:08:34', 2023, 10, 10, 10, 'Promoción'),
(35, 'TSDS-19-004-AL', 8, '2023-08-03 22:08:34', 2023, 0, 0, 0, 'Libre'),
(36, 'TSDS-19-004-AL', 9, '2023-08-03 22:08:34', 2023, 10, 9, 9, 'Regular'),
(37, 'TSDS-19-004-AL', 10, '2023-08-03 22:08:34', 2023, 9, 10, 9, 'Regular'),
(38, 'TSDS-19-004-AL', 11, '2023-08-03 22:08:34', 2023, 8, 9, 8, 'Promoción'),
(39, 'TSDS-19-004-AL', 12, '2023-08-03 22:08:34', 2023, 6, 5, 5, 'Regular'),
(40, 'TSDS-19-004-AL', 13, '2023-08-03 22:08:34', 2023, 0, 0, 0, 'Libre'),
(41, 'TSDS-19-004-AL', 14, '2023-08-03 22:08:34', 2023, 10, 10, 10, 'Promoción'),
(42, 'TSDS-19-004-AL', 15, '2023-08-03 22:08:34', 2023, 10, 10, 10, 'Promoción'),
(43, 'TSDS-19-004-AL', 16, '2023-08-03 22:08:34', 2023, 10, 8, 9, 'Regular'),
(44, 'TSDS-19-004-AL', 17, '2023-08-03 22:08:34', 2023, 6, 6, 6, 'Regular'),
(45, 'TSDS-19-004-AL', 18, '2023-08-03 22:08:34', 2023, 10, 6, 8, 'Regular'),
(46, 'TSDS-19-004-AL', 19, '2023-08-03 22:08:34', 2023, 6, 6, 6, 'Regular'),
(47, 'TSDS-19-004-AL', 20, '2023-08-03 22:08:34', 2023, 8, 8, 8, 'Promoción'),
(48, 'TSDS-19-004-AL', 21, '2023-08-03 22:08:34', 2023, -1, -1, -1, 'Regular'),
(49, 'TSDS-19-004-AL', 22, '2023-08-03 22:08:34', 2023, 7, 7, 7, 'Promoción'),
(50, 'TSDS-19-004-AL', 23, '2023-08-03 22:08:34', 2023, -1, -1, -1, 'Regular'),
(51, 'TSDS-19-004-AL', 24, '2023-08-03 22:08:34', 2023, -1, -1, -1, 'Regular'),
(52, 'TSDS-19-004-AL', 25, '2023-08-03 22:08:34', 2023, -1, -1, -1, 'Regular'),
(53, 'TSDS-19-004-AL', 26, '2023-08-03 22:08:34', 2023, 8, 4, 6, 'Regular'),
(54, 'TSDS-19-004-AL', 27, '2023-08-03 22:08:34', 2023, 6, 6, 6, 'Regular'),
(55, 'TSDS-19-004-AL', 28, '2023-08-03 22:08:34', 2023, 6, 6, 6, 'Regular'),
(56, 'TSDS-19-007-AL', 1, '2023-08-03 22:08:34', 2023, 6, 7, -1, 'Sin Datos'),
(57, 'TSDS-19-007-AL', 2, '2023-08-03 22:08:34', 2023, -1, -1, -1, 'Sin Datos'),
(58, 'TSDS-19-007-AL', 3, '2023-08-03 22:08:34', 2023, -1, -1, 10, 'Regular'),
(59, 'TSDS-19-007-AL', 4, '2023-08-03 22:08:34', 2023, -1, -1, 5, 'Regular'),
(60, 'TSDS-19-007-AL', 5, '2023-08-03 22:08:34', 2023, -1, -1, 7, 'Promoción'),
(61, 'TSDS-19-007-AL', 6, '2023-08-03 22:08:34', 2023, -1, -1, 10, 'Regular'),
(62, 'TSDS-19-007-AL', 7, '2023-08-03 22:08:34', 2023, -1, -1, 9, 'Promoción'),
(63, 'TSDS-19-007-AL', 8, '2023-08-03 22:08:34', 2023, -1, -1, 9, 'Promoción'),
(64, 'TSDS-19-007-AL', 9, '2023-08-03 22:08:34', 2023, -1, -1, -1, 'Sin Datos'),
(65, 'TSDS-19-007-AL', 10, '2023-08-03 22:08:34', 2023, -1, -1, -1, 'Sin Datos'),
(66, 'TSDS-19-007-AL', 11, '2023-08-03 22:08:34', 2023, -1, -1, 8, 'Promoción'),
(67, 'TSDS-19-007-AL', 12, '2023-08-03 22:08:34', 2023, -1, -1, 5, 'Regular'),
(68, 'TSDS-19-007-AL', 13, '2023-08-03 22:08:34', 2023, -1, -1, 8, 'Promoción'),
(69, 'TSDS-19-007-AL', 14, '2023-08-03 22:08:34', 2023, -1, -1, 10, 'Promoción'),
(70, 'TSDS-19-007-AL', 15, '2023-08-03 22:08:34', 2023, -1, -1, 10, 'Promoción'),
(71, 'TSDS-19-007-AL', 16, '2023-08-03 22:08:34', 2023, -1, -1, -1, 'Sin Datos'),
(72, 'TSDS-19-007-AL', 17, '2023-08-03 22:08:34', 2023, -1, -1, -1, 'Sin Datos'),
(73, 'TSDS-19-007-AL', 18, '2023-08-03 22:08:34', 2023, -1, -1, -1, 'Sin Datos'),
(74, 'TSDS-19-007-AL', 19, '2023-08-03 22:08:34', 2023, -1, -1, -1, 'Sin Datos'),
(75, 'TSDS-19-007-AL', 20, '2023-08-03 22:08:34', 2023, -1, -1, -1, 'Sin Datos'),
(76, 'TSDS-19-007-AL', 21, '2023-08-03 22:08:34', 2023, -1, -1, -1, 'Sin Datos'),
(77, 'TSDS-19-007-AL', 22, '2023-08-03 22:08:34', 2023, -1, -1, -1, 'Sin Datos'),
(78, 'TSDS-19-007-AL', 23, '2023-08-03 22:08:34', 2023, -1, -1, -1, 'Sin Datos'),
(79, 'TSDS-19-007-AL', 24, '2023-08-03 22:08:34', 2023, -1, -1, -1, 'Sin Datos'),
(80, 'TSDS-19-007-AL', 25, '2023-08-03 22:08:34', 2023, -1, -1, -1, 'Sin Datos'),
(81, 'TSDS-19-007-AL', 26, '2023-08-03 22:08:34', 2023, -1, -1, -1, 'Sin Datos'),
(82, 'TSDS-19-007-AL', 27, '2023-08-03 22:08:34', 2023, -1, -1, -1, 'Sin Datos'),
(83, 'TSDS-19-007-AL', 28, '2023-08-03 22:08:34', 2023, -1, -1, -1, 'Sin Datos'),
(84, 'TSDS-19-009-AL', 1, '2023-08-03 22:08:34', 2023, 8, 7, -1, 'Sin Datos'),
(85, 'TSDS-19-009-AL', 2, '2023-08-03 22:08:34', 2023, -1, -1, -1, 'Sin Datos'),
(86, 'TSDS-19-009-AL', 3, '2023-08-03 22:08:34', 2023, -1, -1, -1, 'Sin Datos'),
(87, 'TSDS-19-009-AL', 4, '2023-08-03 22:08:34', 2023, -1, -1, 8, 'Regular'),
(88, 'TSDS-19-009-AL', 5, '2023-08-03 22:08:34', 2023, -1, -1, 8, 'Promoción'),
(89, 'TSDS-19-009-AL', 6, '2023-08-03 22:08:34', 2023, -1, -1, -1, 'Sin Datos'),
(90, 'TSDS-19-009-AL', 7, '2023-08-03 22:08:34', 2023, -1, -1, 8, 'Promoción'),
(91, 'TSDS-19-009-AL', 8, '2023-08-03 22:08:34', 2023, -1, -1, 6, 'Promoción'),
(92, 'TSDS-19-009-AL', 9, '2023-08-03 22:08:34', 2023, -1, -1, -1, 'Sin Datos'),
(93, 'TSDS-19-009-AL', 10, '2023-08-03 22:08:34', 2023, -1, -1, -1, 'Sin Datos'),
(94, 'TSDS-19-009-AL', 11, '2023-08-03 22:08:34', 2023, -1, -1, 8, 'Promoción'),
(95, 'TSDS-19-009-AL', 12, '2023-08-03 22:08:34', 2023, -1, -1, -1, 'Sin Datos'),
(96, 'TSDS-19-009-AL', 13, '2023-08-03 22:08:34', 2023, -1, -1, 9, 'Promoción'),
(97, 'TSDS-19-009-AL', 14, '2023-08-03 22:08:34', 2023, -1, -1, 9, 'Promoción'),
(98, 'TSDS-19-009-AL', 15, '2023-08-03 22:08:34', 2023, -1, -1, 9, 'Promoción'),
(99, 'TSDS-19-009-AL', 16, '2023-08-03 22:08:34', 2023, -1, -1, -1, 'Sin Datos'),
(100, 'TSDS-19-009-AL', 17, '2023-08-03 22:08:34', 2023, -1, -1, -1, 'Sin Datos'),
(101, 'TSDS-19-009-AL', 18, '2023-08-03 22:08:34', 2023, -1, -1, -1, 'Sin Datos'),
(102, 'TSDS-19-009-AL', 19, '2023-08-03 22:08:34', 2023, -1, -1, -1, 'Sin Datos'),
(103, 'TSDS-19-009-AL', 20, '2023-08-03 22:08:34', 2023, -1, -1, -1, 'Sin Datos'),
(104, 'TSDS-19-009-AL', 21, '2023-08-03 22:08:34', 2023, -1, -1, -1, 'Sin Datos'),
(105, 'TSDS-19-009-AL', 22, '2023-08-03 22:08:34', 2023, -1, -1, -1, 'Sin Datos'),
(106, 'TSDS-19-009-AL', 23, '2023-08-03 22:08:34', 2023, -1, -1, -1, 'Sin Datos'),
(107, 'TSDS-19-009-AL', 24, '2023-08-03 22:08:34', 2023, -1, -1, -1, 'Sin Datos'),
(108, 'TSDS-19-009-AL', 25, '2023-08-03 22:08:34', 2023, -1, -1, -1, 'Sin Datos'),
(109, 'TSDS-19-009-AL', 26, '2023-08-03 22:08:34', 2023, -1, -1, -1, 'Sin Datos'),
(110, 'TSDS-19-009-AL', 27, '2023-08-03 22:08:34', 2023, -1, -1, -1, 'Sin Datos'),
(111, 'TSDS-19-009-AL', 28, '2023-08-03 22:08:34', 2023, -1, -1, -1, 'Sin Datos'),
(112, 'TSDS-19-003-AL', 1, '2023-08-03 22:08:34', 2023, 8, 7, -1, 'Sin Datos'),
(113, 'TSDS-19-003-AL', 2, '2023-08-03 22:08:34', 2023, -1, -1, -1, 'Sin Datos'),
(114, 'TSDS-19-003-AL', 3, '2023-08-03 22:08:34', 2023, -1, -1, 8, 'Regular'),
(115, 'TSDS-19-003-AL', 4, '2023-08-03 22:08:34', 2023, -1, -1, 7, 'Regular'),
(116, 'TSDS-19-003-AL', 5, '2023-08-03 22:08:34', 2023, -1, -1, 7, 'Promoción'),
(117, 'TSDS-19-003-AL', 6, '2023-08-03 22:08:34', 2023, -1, -1, 8, 'Promoción'),
(118, 'TSDS-19-003-AL', 7, '2023-08-03 22:08:34', 2023, -1, -1, 9, 'Promoción'),
(119, 'TSDS-19-003-AL', 8, '2023-08-03 22:08:34', 2023, -1, -1, 8, 'Promoción'),
(120, 'TSDS-19-003-AL', 9, '2023-08-03 22:08:34', 2023, -1, -1, -1, 'Sin Datos'),
(121, 'TSDS-19-003-AL', 10, '2023-08-03 22:08:34', 2023, -1, -1, -1, 'Sin Datos'),
(122, 'TSDS-19-003-AL', 11, '2023-08-03 22:08:34', 2023, -1, -1, 8, 'Promoción'),
(123, 'TSDS-19-003-AL', 12, '2023-08-03 22:08:34', 2023, -1, -1, -1, 'Sin Datos'),
(124, 'TSDS-19-003-AL', 13, '2023-08-03 22:08:34', 2023, -1, -1, 8, 'Promoción'),
(125, 'TSDS-19-003-AL', 14, '2023-08-03 22:08:34', 2023, -1, -1, 9, 'Promoción'),
(126, 'TSDS-19-003-AL', 15, '2023-08-03 22:08:34', 2023, -1, -1, 4, 'Promoción'),
(127, 'TSDS-19-003-AL', 16, '2023-08-03 22:08:34', 2023, -1, -1, -1, 'Sin Datos'),
(128, 'TSDS-19-003-AL', 17, '2023-08-03 22:08:34', 2023, -1, -1, -1, 'Sin Datos'),
(129, 'TSDS-19-003-AL', 18, '2023-08-03 22:08:34', 2023, -1, -1, -1, 'Sin Datos'),
(130, 'TSDS-19-003-AL', 19, '2023-08-03 22:08:34', 2023, -1, -1, -1, 'Sin Datos'),
(131, 'TSDS-19-003-AL', 20, '2023-08-03 22:08:34', 2023, -1, -1, -1, 'Sin Datos'),
(132, 'TSDS-19-003-AL', 21, '2023-08-03 22:08:34', 2023, -1, -1, -1, 'Sin Datos'),
(133, 'TSDS-19-003-AL', 22, '2023-08-03 22:08:34', 2023, -1, -1, -1, 'Sin Datos'),
(134, 'TSDS-19-003-AL', 23, '2023-08-03 22:08:34', 2023, -1, -1, -1, 'Sin Datos'),
(135, 'TSDS-19-003-AL', 24, '2023-08-03 22:08:34', 2023, -1, -1, -1, 'Sin Datos'),
(136, 'TSDS-19-003-AL', 25, '2023-08-03 22:08:34', 2023, -1, -1, -1, 'Sin Datos'),
(137, 'TSDS-19-003-AL', 26, '2023-08-03 22:08:34', 2023, -1, -1, -1, 'Sin Datos'),
(138, 'TSDS-19-003-AL', 27, '2023-08-03 22:08:34', 2023, -1, -1, -1, 'Sin Datos'),
(139, 'TSDS-19-003-AL', 28, '2023-08-03 22:08:34', 2023, -1, -1, -1, 'Sin Datos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `docente`
--

CREATE TABLE `docente` (
  `ID_DOCENTE` int(11) NOT NULL,
  `DNI` int(11) NOT NULL,
  `NOMBRE` varchar(30) NOT NULL,
  `APELLIDO` varchar(30) NOT NULL,
  `ROL_DOCENTE` int(11) NOT NULL,
  `USUARIO` varchar(50) NOT NULL,
  `CONTRASENIA` varchar(20) NOT NULL,
  `DOMICILIO` varchar(50) NOT NULL,
  `NRO_DOMICILIO` int(11) DEFAULT NULL,
  `CELULAR` int(11) DEFAULT NULL,
  `RED_FACEBOOK` varchar(100) DEFAULT NULL,
  `RED_INSTAGRAM` varchar(100) DEFAULT NULL,
  `RED_TWITTER` varchar(100) DEFAULT NULL,
  `FOTO_DOC` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `docente`
--

INSERT INTO `docente` (`ID_DOCENTE`, `DNI`, `NOMBRE`, `APELLIDO`, `ROL_DOCENTE`, `USUARIO`, `CONTRASENIA`, `DOMICILIO`, `NRO_DOMICILIO`, `CELULAR`, `RED_FACEBOOK`, `RED_INSTAGRAM`, `RED_TWITTER`, `FOTO_DOC`) VALUES
(1, 1, 'Oscar', 'Niemeyer', 2, 'oniemeyer@iset.com.ar', '0', 'calle', 123, 38100001, 'https://www.facebook.com/us', 'https://www.instagram.com/us', 'https://www.instagram.com/us', '.\\img_profile\\perfil.png'),
(2, 2, 'María', 'Costilla', 2, 'mcostilla@iset.com.ar', '0', 'calle', 123, 38100001, NULL, NULL, NULL, '.\\img_profile\\perfil.png'),
(3, 3, 'Buckminster', 'Fuller', 2, 'bfuller@iset.com.ar', '0', 'calle', 123, 38100001, NULL, NULL, NULL, '.\\img_profile\\perfil.png'),
(4, 4, 'Santiago', 'Calatrava', 2, 'scalatrava@iset.com.ar', '0', 'calle', 123, 38100001, NULL, NULL, NULL, '.\\img_profile\\perfil.png'),
(5, 5, 'Diego', 'Figueroa', 2, 'dfigueroa@iset.com.ar', '0', 'calle', 123, 38100001, NULL, NULL, NULL, '.\\img_profile\\perfil.png'),
(6, 6, 'Jorge', 'Leiva', 2, 'jleiva@iset.com.ar', '0', 'calle', 123, 38100001, NULL, NULL, NULL, '.\\img_profile\\perfil.png'),
(7, 7, 'Viktor', 'Frankenstein', 2, 'vfrankenstein@iset.com.ar', '0', 'calle', 123, 38100001, NULL, NULL, NULL, '.\\img_profile\\perfil.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ensenia`
--

CREATE TABLE `ensenia` (
  `ID_ENSENIA` int(11) NOT NULL,
  `ID_DOCENTE` varchar(15) NOT NULL,
  `ID_MATERIA` int(11) NOT NULL,
  `DESDE` datetime NOT NULL,
  `HASTA` datetime DEFAULT NULL,
  `CICLO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evalua_en`
--

CREATE TABLE `evalua_en` (
  `ID_EVALUA` int(11) NOT NULL,
  `ID_EXAMEN` int(11) NOT NULL,
  `ID_DOCENTE` varchar(15) NOT NULL,
  `ID_MATERIA` int(11) NOT NULL,
  `FECHA` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `evalua_en`
--

INSERT INTO `evalua_en` (`ID_EVALUA`, `ID_EXAMEN`, `ID_DOCENTE`, `ID_MATERIA`, `FECHA`) VALUES
(1, 1, 'TSDS-19-005-DC', 1, '2023-08-03 22:08:35'),
(2, 2, 'TSDS-19-005-DC', 2, '2023-08-03 22:08:35'),
(3, 3, 'TSDS-19-005-DC', 3, '2023-08-03 22:08:35'),
(4, 4, 'TSDS-19-005-DC', 4, '2023-08-03 22:08:35'),
(5, 5, 'TSDS-19-005-DC', 5, '2023-08-03 22:08:35'),
(6, 6, 'TSDS-19-005-DC', 6, '2023-08-03 22:08:35'),
(7, 7, 'TSDS-19-005-DC', 7, '2023-08-03 22:08:35'),
(8, 8, 'TSDS-19-005-DC', 8, '2023-08-03 22:08:35'),
(9, 9, 'TSDS-19-005-DC', 9, '2023-08-03 22:08:35'),
(10, 10, 'TSDS-19-005-DC', 10, '2023-08-03 22:08:35'),
(11, 11, 'TSDS-19-005-DC', 11, '2023-08-03 22:08:35'),
(12, 12, 'TSDS-19-005-DC', 12, '2023-08-03 22:08:35'),
(13, 13, 'TSDS-19-005-DC', 13, '2023-08-03 22:08:35'),
(14, 14, 'TSDS-19-005-DC', 14, '2023-08-03 22:08:35'),
(15, 15, 'TSDS-19-005-DC', 16, '2023-08-03 22:08:35'),
(16, 16, 'TSDS-19-005-DC', 17, '2023-08-03 22:08:35'),
(17, 17, 'TSDS-19-005-DC', 18, '2023-08-03 22:08:35'),
(18, 18, 'TSDS-19-005-DC', 19, '2023-08-03 22:08:35'),
(19, 19, 'TSDS-19-005-DC', 20, '2023-08-03 22:08:35'),
(20, 20, 'TSDS-19-005-DC', 22, '2023-08-03 22:08:35'),
(21, 21, 'TSDS-19-005-DC', 24, '2023-08-03 22:08:35'),
(22, 22, 'TSDS-19-005-DC', 25, '2023-08-03 22:08:35'),
(23, 23, 'TSDS-19-005-DC', 26, '2023-08-03 22:08:35');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `examen_final`
--

CREATE TABLE `examen_final` (
  `ID_EXAMEN_FINAL` int(11) NOT NULL,
  `ID_MATERIA` int(11) NOT NULL,
  `LIBRO` int(11) NOT NULL,
  `FOLIO` int(11) NOT NULL,
  `FECHA` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `examen_final`
--

INSERT INTO `examen_final` (`ID_EXAMEN_FINAL`, `ID_MATERIA`, `LIBRO`, `FOLIO`, `FECHA`) VALUES
(1, 1, 1, 61, '2023-08-03 22:08:34'),
(2, 2, 1, 63, '2023-08-03 22:08:34'),
(3, 3, 1, 150, '2023-08-03 22:08:34'),
(4, 4, 1, 62, '2023-08-03 22:08:34'),
(5, 5, 1, 44, '2023-08-03 22:08:34'),
(6, 6, 1, 54, '2023-08-03 22:08:34'),
(7, 7, 1, 60, '2023-08-03 22:08:34'),
(8, 8, 1, 47, '2023-08-03 22:08:34'),
(9, 9, 1, 134, '2023-08-03 22:08:34'),
(10, 10, 1, 173, '2023-08-03 22:08:34'),
(11, 11, 1, 124, '2023-08-03 22:08:34'),
(12, 12, 1, 72, '2023-08-03 22:08:34'),
(13, 13, 1, 97, '2023-08-03 22:08:34'),
(14, 14, 1, 68, '2023-08-03 22:08:34'),
(15, 16, 1, 167, '2023-08-03 22:08:34'),
(16, 17, 1, 98, '2023-08-03 22:08:34'),
(17, 18, 1, 165, '2023-08-03 22:08:34'),
(18, 19, 1, 136, '2023-08-03 22:08:34'),
(19, 20, 1, 155, '2023-08-03 22:08:34'),
(20, 22, 1, 154, '2023-08-03 22:08:34'),
(21, 24, 1, 58, '2023-08-03 22:08:34'),
(22, 25, 1, 152, '2023-08-03 22:08:34'),
(23, 26, 1, 58, '2023-08-03 22:08:34');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `legajo_alumno`
--

CREATE TABLE `legajo_alumno` (
  `ID_LEGAJO` int(11) NOT NULL,
  `DNI` int(11) NOT NULL,
  `LEGAJO_ALU` varchar(15) NOT NULL,
  `CARRERA` int(11) NOT NULL,
  `COHORTE` int(11) NOT NULL,
  `FECHA_INSCRIPCION` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `legajo_alumno`
--

INSERT INTO `legajo_alumno` (`ID_LEGAJO`, `DNI`, `LEGAJO_ALU`, `CARRERA`, `COHORTE`, `FECHA_INSCRIPCION`) VALUES
(1, 1, 'TSDS-19-001-AL', 1, 2, '2023-07-18 18:05:10'),
(2, 2, 'TSDS-19-002-AL', 1, 2, '2023-07-18 18:05:10'),
(3, 3, 'TSDS-19-003-AL', 1, 2, '2023-07-18 18:05:10'),
(4, 4, 'TSDS-19-004-AL', 1, 2, '2023-07-18 18:05:10'),
(5, 5, 'TSDS-19-005-AL', 1, 2, '2023-07-18 18:05:10'),
(6, 6, 'TSDS-19-006-AL', 1, 2, '2023-07-18 18:05:10'),
(7, 7, 'TSDS-19-007-AL', 1, 2, '2023-07-18 18:05:10'),
(8, 8, 'TSDS-19-008-AL', 1, 2, '2023-07-18 18:05:10'),
(9, 9, 'TSDS-19-009-AL', 1, 2, '2023-07-18 18:05:10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `legajo_docente`
--

CREATE TABLE `legajo_docente` (
  `ID_LEGAJO` int(11) NOT NULL,
  `DNI` int(11) NOT NULL,
  `LEGAJO_DOC` varchar(15) NOT NULL,
  `CARRERA` int(11) NOT NULL,
  `FECHA_INSCRIPCION` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `legajo_docente`
--

INSERT INTO `legajo_docente` (`ID_LEGAJO`, `DNI`, `LEGAJO_DOC`, `CARRERA`, `FECHA_INSCRIPCION`) VALUES
(1, 1, 'TSDS-19-001-DC', 1, '2023-07-18 18:05:10'),
(2, 2, 'TSDS-19-002-DC', 1, '2023-07-18 18:05:10'),
(3, 3, 'TSDS-19-003-DC', 1, '2023-07-18 18:05:10'),
(4, 4, 'TSDS-19-004-DC', 1, '2023-07-18 18:05:10'),
(5, 5, 'TSDS-19-005-DC', 1, '2023-07-18 18:05:10'),
(6, 6, 'TSDS-19-006-DC', 1, '2023-07-18 18:05:10'),
(7, 7, 'TSDS-19-007-DC', 1, '2023-07-18 18:05:10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materia`
--

CREATE TABLE `materia` (
  `ID_MATERIA` int(11) NOT NULL,
  `ID_CARRERA` int(11) NOT NULL,
  `ASIGNATURA` varchar(100) NOT NULL,
  `ANIO` int(11) NOT NULL,
  `DESCRIPCION` varchar(3000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `materia`
--

INSERT INTO `materia` (`ID_MATERIA`, `ID_CARRERA`, `ASIGNATURA`, `ANIO`, `DESCRIPCION`) VALUES
(1, 1, 'Ciudadanía y Espacio Público', 1, 'Descripcion de la materia'),
(2, 1, 'Introducción a la informática', 1, 'Descripcion de la materia'),
(3, 1, 'Introducción a Redes', 1, 'Descripcion de la materia'),
(4, 1, 'Bases de datos I', 1, 'Descripcion de la materia'),
(5, 1, 'Matemática I', 1, 'Descripcion de la materia'),
(6, 1, 'Programación I', 1, 'Descripcion de la materia'),
(7, 1, 'Inglés Técnico I', 1, 'Descripcion de la materia'),
(8, 1, 'Estructura de datos y algoritmos', 1, 'Descripcion de la materia'),
(9, 1, 'Taller de Programación I', 1, 'Descripcion de la materia'),
(10, 1, 'Programación II', 2, 'Desarrollo de algoritmos avanzados'),
(11, 1, 'Estadística Aplicada', 2, 'Descripcion de la materia'),
(12, 1, 'Base de datos II', 2, 'Descripcion de la materia'),
(13, 1, 'Matematicas II', 2, 'Materia dedicada al análisis de soluciones computacionales mediante las matematicas'),
(14, 1, 'Sistemas de Información Empresarial', 2, 'Descripcion de la materia'),
(15, 1, 'Inglés Técnico II', 2, 'Descripcion de la materia'),
(16, 1, 'Redes y Seguridad Informática', 2, 'Descripcion de la materia'),
(17, 1, 'Análisis y Diseño de Sistemas', 2, 'Descripcion de la materia'),
(18, 1, 'Laboratorio de Programacion II', 2, 'Dedicada a la practica de las soluciones computacionales propuestas'),
(19, 1, 'Taller de Programación II', 2, 'Descripcion de la materia'),
(20, 1, 'Emprendimientos Tecnológicos', 3, 'Descripcion de la materia'),
(21, 1, 'Gestión de proyectos y Software de Calidad', 3, 'Descripcion de la materia'),
(22, 1, 'Desarrollo empresarial', 3, 'Descripcion de la materia'),
(23, 1, 'Programación III', 3, 'Descripcion de la materia'),
(24, 1, 'Inglés Técnico III', 3, 'Descripcion de la materia'),
(25, 1, 'Ética y Deontología Profesional', 3, 'Descripcion de la materia'),
(26, 1, 'Legislación de software', 3, 'Descripcion de la materia'),
(27, 1, 'Programación Avanzada', 3, 'Descripcion de la materia'),
(28, 1, 'Taller de Programación III', 3, 'Descripcion de la materia'),
(29, 2, 'Matemática y Física Aplicada', 1, ''),
(30, 2, 'Portugués Técnico', 1, ''),
(31, 2, 'Química', 1, ''),
(32, 2, 'Química Biológica', 1, ''),
(33, 2, 'Agronomía', 1, ''),
(34, 2, 'Mundo del trabajo', 1, ''),
(35, 2, 'Microbiología', 1, ''),
(36, 2, 'Seguridad Industrial', 1, ''),
(37, 2, 'Termodinámica', 2, ''),
(38, 2, 'Gestión Ambiental', 2, ''),
(39, 2, 'Legislación', 2, ''),
(40, 2, 'Mecánica Aplicada', 2, ''),
(41, 2, 'Inglés Técnico', 2, ''),
(42, 2, 'Electrotecnia', 2, ''),
(43, 2, 'Uso Térmico y Producción de Energía Eléctrica', 2, ''),
(44, 2, 'Práctica Profesionalizante I', 2, ''),
(45, 2, 'Informática Aplicada', 3, ''),
(46, 2, 'Innovación y Desarrollo Tecnológico', 3, ''),
(47, 2, 'Bioetanol', 3, ''),
(48, 2, 'Biogas', 3, ''),
(49, 2, 'Biodiesel', 3, ''),
(50, 2, 'Biorefineria', 3, ''),
(51, 2, 'Práctica Profesionalizante II', 3, ''),
(52, 3, 'Matemáticas', 1, ''),
(53, 3, 'Biología', 1, ''),
(54, 3, 'Física', 1, ''),
(55, 3, 'Ambiente y Sociedad', 1, ''),
(56, 3, 'Estadística Aplicada', 1, ''),
(57, 3, 'Tecnologías de la Información y la comunicación', 1, ''),
(58, 3, 'Quimica General e Inorgánica', 1, ''),
(59, 3, 'Inglés', 1, ''),
(60, 3, 'Ecología', 1, ''),
(61, 3, 'Eficiencia Energética y Desarrollo', 1, ''),
(62, 3, 'Prácticas profesionalizantes I', 1, ''),
(63, 3, 'Sociología de las Organizaciones', 2, ''),
(64, 3, 'Química Orgánica y Biológica', 2, ''),
(65, 3, 'Geología e Hidrología', 2, ''),
(66, 3, 'Ecología Urbana y Rural', 2, ''),
(67, 3, 'Derecho Ambiental', 2, ''),
(68, 3, 'Metodología de la Investigación Científica', 2, ''),
(69, 3, 'Climatología', 2, ''),
(70, 3, 'Química Ambiental', 2, ''),
(71, 3, 'Sistemas de Gestión Ambiental', 2, ''),
(72, 3, 'Prácticas Profesionalizantes II', 2, ''),
(73, 3, 'Ordenamiento Territorial', 3, ''),
(74, 3, 'Gestión y Administración Ambiental', 3, ''),
(75, 3, 'Seguridad y Salud Laboral', 3, ''),
(76, 3, 'Seguridad Ambiental', 3, ''),
(77, 3, 'Educación y Comunicación Ambiental', 3, ''),
(78, 3, 'Economía Ambiental', 3, ''),
(79, 3, 'Ética y Deontología Profesional', 3, ''),
(80, 3, 'Estadística Aplicada', 3, ''),
(81, 3, 'Toxicología Ambiental', 3, ''),
(82, 3, 'Estudio y Evaluación Ambiental', 3, ''),
(83, 3, 'Practicas profesionalizantes III', 3, ''),
(84, 4, 'Sistemas de Representación', 1, ''),
(85, 4, 'Matemática', 1, ''),
(86, 4, 'Física', 1, ''),
(87, 4, 'Herramientas informáticas', 1, ''),
(88, 4, 'Tecnología de los Materiales', 1, ''),
(89, 4, 'Mecánica I', 1, ''),
(90, 4, 'Máquinas y Herramientas Básicas', 1, ''),
(91, 4, 'Laboratorio de Mecánica', 1, ''),
(92, 4, 'Inglés Técnico I', 1, ''),
(93, 4, 'Prácticas Profesionalizantes I', 1, ''),
(94, 4, 'Formulación y Evaluación de Proyectos', 2, ''),
(95, 4, 'Electrotecnia I', 2, ''),
(96, 4, 'Seguridad e Higiene en el Trabajo', 2, ''),
(97, 4, 'Inglés Técnico II', 2, ''),
(98, 4, 'Electrónica y Sistemas Digitales', 2, ''),
(99, 4, 'Sistemas de Control', 2, ''),
(100, 4, 'Materia', 2, ''),
(101, 4, 'Herramientas Informáticas II', 2, ''),
(102, 4, 'Mecánica II', 2, ''),
(103, 4, 'Robótica I', 2, ''),
(104, 4, 'Prácticas Profesionalizantes II', 2, ''),
(105, 4, 'Derecho Laboral', 3, ''),
(106, 4, 'Sensores y Actuadores', 3, ''),
(107, 4, 'Microcontroladores y PCL', 3, ''),
(108, 4, 'Hidráulica', 3, ''),
(109, 4, 'Neumática', 3, ''),
(110, 4, 'Organización y Marketing de Talleres', 3, ''),
(111, 4, 'Electrotecnia II', 3, ''),
(112, 4, 'Laboratorio de Microprocesadores', 3, ''),
(113, 4, 'Robótica II', 3, ''),
(114, 4, 'Prácticas Profesionalizantes III', 3, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rinde`
--

CREATE TABLE `rinde` (
  `ID_RINDE` int(11) NOT NULL,
  `ID_EXAMEN` int(11) NOT NULL,
  `ID_ALUMNO` varchar(15) NOT NULL,
  `ID_MATERIA` int(11) NOT NULL,
  `NOTA` int(2) NOT NULL,
  `FECHA` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `rinde`
--

INSERT INTO `rinde` (`ID_RINDE`, `ID_EXAMEN`, `ID_ALUMNO`, `ID_MATERIA`, `NOTA`, `FECHA`) VALUES
(1, 1, 'TSDS-19-001-AL', 1, 7, '2023-08-03 22:08:35'),
(2, 2, 'TSDS-19-001-AL', 2, 8, '2023-08-03 22:08:35'),
(3, 3, 'TSDS-19-001-AL', 3, 8, '2023-08-03 22:08:35'),
(4, 4, 'TSDS-19-001-AL', 4, 6, '2023-08-03 22:08:35'),
(5, 5, 'TSDS-19-001-AL', 5, 8, '2023-08-03 22:08:35'),
(6, 6, 'TSDS-19-001-AL', 6, 10, '2023-08-03 22:08:35'),
(7, 7, 'TSDS-19-001-AL', 7, 10, '2023-08-03 22:08:35'),
(8, 8, 'TSDS-19-001-AL', 8, 9, '2023-08-03 22:08:35'),
(9, 9, 'TSDS-19-001-AL', 9, 8, '2023-08-03 22:08:35'),
(10, 10, 'TSDS-19-001-AL', 10, 8, '2023-08-03 22:08:35'),
(11, 11, 'TSDS-19-001-AL', 11, 9, '2023-08-03 22:08:35'),
(12, 12, 'TSDS-19-001-AL', 12, 5, '2023-08-03 22:08:35'),
(13, 13, 'TSDS-19-001-AL', 13, 8, '2023-08-03 22:08:35'),
(14, 14, 'TSDS-19-001-AL', 14, 10, '2023-08-03 22:08:35'),
(15, 15, 'TSDS-19-001-AL', 16, 10, '2023-08-03 22:08:35'),
(16, 16, 'TSDS-19-001-AL', 17, 4, '2023-08-03 22:08:35'),
(17, 17, 'TSDS-19-001-AL', 18, 10, '2023-08-03 22:08:35'),
(18, 18, 'TSDS-19-001-AL', 19, 10, '2023-08-03 22:08:35'),
(19, 19, 'TSDS-19-001-AL', 20, 9, '2023-08-03 22:08:35'),
(20, 20, 'TSDS-19-001-AL', 22, 8, '2023-08-03 22:08:35'),
(21, 21, 'TSDS-19-001-AL', 24, 4, '2023-08-03 22:08:35'),
(22, 22, 'TSDS-19-001-AL', 25, 9, '2023-08-03 22:08:35'),
(23, 23, 'TSDS-19-001-AL', 26, 10, '2023-08-03 22:08:35');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `ID_ROL` int(11) NOT NULL,
  `ROL` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`ID_ROL`, `ROL`) VALUES
(1, 'administración'),
(2, 'docente'),
(3, 'alumno');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_admin_examen`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_admin_examen` (
`LEGAJO_ALU` varchar(15)
,`ALUMNO` varchar(101)
,`MATERIA` varchar(100)
,`1ER_PARCIAL` int(11)
,`2DO_PARCIAL` int(11)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_admin_final`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_admin_final` (
`LEGAJO_ALU` varchar(15)
,`ALUMNO` varchar(101)
,`MATERIA` varchar(100)
,`NOTA` int(2)
,`LIBRO` int(11)
,`FOLIO` int(11)
,`FECHA` datetime
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_alumnos_inscriptos`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_alumnos_inscriptos` (
`INSCRIPTOS` bigint(21)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_alumnos_insc_carrera`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_alumnos_insc_carrera` (
`CARRERA` varchar(5)
,`INSCRIPTOS` bigint(21)
,`COHORTE` int(11)
,`ANIO` int(4)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_alumnos_insc_cohorte`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_alumnos_insc_cohorte` (
`INSCRIPTOS` bigint(21)
,`COHORTE` int(11)
,`ANIO` int(4)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_cursado`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_cursado` (
`LEGAJO` varchar(15)
,`ALUMNO` varchar(101)
,`ANIO` int(11)
,`ID_MATERIA` int(11)
,`MATERIA` varchar(100)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_docentes_inscriptos`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_docentes_inscriptos` (
`CARRERA` varchar(5)
,`INSCRIPTOS` bigint(21)
,`ANIO` int(4)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_docentes_inscriptos_carrera`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_docentes_inscriptos_carrera` (
`ABREVIADO` varchar(5)
,`INSCRIPTOS` bigint(21)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_nota_alumno`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_nota_alumno` (
`MATERIA` int(11)
,`ASIGNATURA` varchar(100)
,`ANIO` int(11)
,`NOTA` int(11)
,`CONDICION` varchar(50)
,`LEGAJO` varchar(15)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_nota_cursado`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_nota_cursado` (
`DNI` int(11)
,`APELLIDO` varchar(50)
,`ASIGNATURA` varchar(100)
,`1ER_PARCIAL` int(11)
,`2DO_PARCIAL` int(11)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_nota_final`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_nota_final` (
`APELLIDO` varchar(50)
,`MATERIA` varchar(100)
,`NOTA` int(2)
,`LIBRO` int(11)
,`FOLIO` int(11)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_plan_estudio`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_plan_estudio` (
`CARRERA` varchar(100)
,`ID_CARRERA` int(11)
,`ID_MATERIA` int(11)
,`ASIGNATURA` varchar(100)
,`ANIO` int(11)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_admin_examen`
--
DROP TABLE IF EXISTS `vw_admin_examen`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_admin_examen`  AS SELECT `la`.`LEGAJO_ALU` AS `LEGAJO_ALU`, concat(`al`.`APELLIDO`,' ',`al`.`NOMBRE`) AS `ALUMNO`, `m`.`ASIGNATURA` AS `MATERIA`, `c`.`1ER_PARCIAL` AS `1ER_PARCIAL`, `c`.`2DO_PARCIAL` AS `2DO_PARCIAL` FROM (((`alumno` `al` join `legajo_alumno` `la` on(`la`.`DNI` = `al`.`DNI`)) join `cursa` `c` on(`c`.`ID_ALUMNO` = `la`.`LEGAJO_ALU`)) join `materia` `m` on(`m`.`ID_MATERIA` = `c`.`ID_MATERIA`))  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_admin_final`
--
DROP TABLE IF EXISTS `vw_admin_final`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_admin_final`  AS SELECT `la`.`LEGAJO_ALU` AS `LEGAJO_ALU`, concat(`al`.`NOMBRE`,' ',`al`.`APELLIDO`) AS `ALUMNO`, `m`.`ASIGNATURA` AS `MATERIA`, `r`.`NOTA` AS `NOTA`, `ef`.`LIBRO` AS `LIBRO`, `ef`.`FOLIO` AS `FOLIO`, `ef`.`FECHA` AS `FECHA` FROM ((((`alumno` `al` join `legajo_alumno` `la` on(`la`.`DNI` = `al`.`DNI`)) join `rinde` `r` on(`r`.`ID_ALUMNO` = `la`.`LEGAJO_ALU`)) join `examen_final` `ef` on(`ef`.`ID_EXAMEN_FINAL` = `r`.`ID_EXAMEN`)) join `materia` `m` on(`m`.`ID_MATERIA` = `ef`.`ID_MATERIA`))  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_alumnos_inscriptos`
--
DROP TABLE IF EXISTS `vw_alumnos_inscriptos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_alumnos_inscriptos`  AS SELECT count(`legajo_alumno`.`LEGAJO_ALU`) AS `INSCRIPTOS` FROM `legajo_alumno``legajo_alumno`  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_alumnos_insc_carrera`
--
DROP TABLE IF EXISTS `vw_alumnos_insc_carrera`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_alumnos_insc_carrera`  AS SELECT `ca`.`ABREVIADO` AS `CARRERA`, count(`la`.`DNI`) AS `INSCRIPTOS`, `co`.`NUMERO` AS `COHORTE`, year(`co`.`ANIO`) AS `ANIO` FROM ((`legajo_alumno` `la` join `cohorte` `co` on(`co`.`ID_COHORTE` = `la`.`COHORTE`)) join `carrera` `ca` on(`ca`.`ID_CARRERA` = `la`.`CARRERA`)) GROUP BY `la`.`CARRERA``CARRERA`  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_alumnos_insc_cohorte`
--
DROP TABLE IF EXISTS `vw_alumnos_insc_cohorte`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_alumnos_insc_cohorte`  AS SELECT count(`la`.`DNI`) AS `INSCRIPTOS`, `co`.`NUMERO` AS `COHORTE`, year(`co`.`ANIO`) AS `ANIO` FROM (`legajo_alumno` `la` join `cohorte` `co` on(`co`.`ID_COHORTE` = `la`.`COHORTE`))  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_cursado`
--
DROP TABLE IF EXISTS `vw_cursado`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_cursado`  AS SELECT `la`.`LEGAJO_ALU` AS `LEGAJO`, concat(`a`.`NOMBRE`,' ',`a`.`APELLIDO`) AS `ALUMNO`, `c`.`CICLO` AS `ANIO`, `c`.`ID_MATERIA` AS `ID_MATERIA`, `m`.`ASIGNATURA` AS `MATERIA` FROM (((`legajo_alumno` `la` join `alumno` `a` on(`a`.`DNI` = `la`.`DNI`)) join `cursa` `c` on(`c`.`ID_ALUMNO` = `la`.`LEGAJO_ALU`)) join `materia` `m` on(`m`.`ID_MATERIA` = `c`.`ID_MATERIA`))  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_docentes_inscriptos`
--
DROP TABLE IF EXISTS `vw_docentes_inscriptos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_docentes_inscriptos`  AS SELECT `c`.`ABREVIADO` AS `CARRERA`, count(`ld`.`LEGAJO_DOC`) AS `INSCRIPTOS`, year(`ld`.`FECHA_INSCRIPCION`) AS `ANIO` FROM (`legajo_docente` `ld` join `carrera` `c` on(`c`.`ID_CARRERA` = `ld`.`CARRERA`))  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_docentes_inscriptos_carrera`
--
DROP TABLE IF EXISTS `vw_docentes_inscriptos_carrera`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_docentes_inscriptos_carrera`  AS SELECT `c`.`ABREVIADO` AS `ABREVIADO`, count(`ld`.`CARRERA`) AS `INSCRIPTOS` FROM (`legajo_docente` `ld` join `carrera` `c` on(`c`.`ID_CARRERA` = `ld`.`CARRERA`)) GROUP BY `ld`.`CARRERA``CARRERA`  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_nota_alumno`
--
DROP TABLE IF EXISTS `vw_nota_alumno`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_nota_alumno`  AS SELECT `m`.`ID_MATERIA` AS `MATERIA`, `m`.`ASIGNATURA` AS `ASIGNATURA`, `m`.`ANIO` AS `ANIO`, `c`.`FINAL` AS `NOTA`, `c`.`ESTADO` AS `CONDICION`, `la`.`LEGAJO_ALU` AS `LEGAJO` FROM ((`cursa` `c` join `legajo_alumno` `la` on(`c`.`ID_ALUMNO` = `la`.`LEGAJO_ALU`)) join `materia` `m` on(`c`.`ID_MATERIA` = `m`.`ID_MATERIA`))  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_nota_cursado`
--
DROP TABLE IF EXISTS `vw_nota_cursado`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_nota_cursado`  AS SELECT `al`.`DNI` AS `DNI`, `al`.`APELLIDO` AS `APELLIDO`, `m`.`ASIGNATURA` AS `ASIGNATURA`, `c`.`1ER_PARCIAL` AS `1ER_PARCIAL`, `c`.`2DO_PARCIAL` AS `2DO_PARCIAL` FROM (((`alumno` `al` join `legajo_alumno` `la` on(`la`.`DNI` = `al`.`DNI`)) join `cursa` `c` on(`c`.`ID_ALUMNO` = `la`.`LEGAJO_ALU`)) join `materia` `m` on(`m`.`ID_MATERIA` = `c`.`ID_MATERIA`))  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_nota_final`
--
DROP TABLE IF EXISTS `vw_nota_final`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_nota_final`  AS SELECT `al`.`APELLIDO` AS `APELLIDO`, `m`.`ASIGNATURA` AS `MATERIA`, `r`.`NOTA` AS `NOTA`, `ef`.`LIBRO` AS `LIBRO`, `ef`.`FOLIO` AS `FOLIO` FROM ((((`alumno` `al` join `legajo_alumno` `la` on(`la`.`DNI` = `al`.`DNI`)) join `rinde` `r` on(`r`.`ID_ALUMNO` = `la`.`LEGAJO_ALU`)) join `examen_final` `ef` on(`ef`.`ID_EXAMEN_FINAL` = `r`.`ID_EXAMEN`)) join `materia` `m` on(`m`.`ID_MATERIA` = `ef`.`ID_MATERIA`))  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_plan_estudio`
--
DROP TABLE IF EXISTS `vw_plan_estudio`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_plan_estudio`  AS SELECT `c`.`NOMBRE` AS `CARRERA`, `c`.`ID_CARRERA` AS `ID_CARRERA`, `m`.`ID_MATERIA` AS `ID_MATERIA`, `m`.`ASIGNATURA` AS `ASIGNATURA`, `m`.`ANIO` AS `ANIO` FROM (`carrera` `c` join `materia` `m` on(`m`.`ID_CARRERA` = `c`.`ID_CARRERA`))  ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administrativo`
--
ALTER TABLE `administrativo`
  ADD PRIMARY KEY (`ID_ADMINISTRATIVO`),
  ADD UNIQUE KEY `DNI` (`DNI`),
  ADD KEY `FK_ROL_ADMINISTRATIVO` (`ROL_ADMINISTRATIVO`);

--
-- Indices de la tabla `alumno`
--
ALTER TABLE `alumno`
  ADD PRIMARY KEY (`ID_ALUMNO`),
  ADD UNIQUE KEY `DNI` (`DNI`),
  ADD KEY `FK_ROL_ALUMNO` (`ROL_ALUMNO`);

--
-- Indices de la tabla `carrera`
--
ALTER TABLE `carrera`
  ADD PRIMARY KEY (`ID_CARRERA`);

--
-- Indices de la tabla `cohorte`
--
ALTER TABLE `cohorte`
  ADD PRIMARY KEY (`ID_COHORTE`),
  ADD KEY `FK_ID_CARRERA_COH` (`ID_CARRERA`);

--
-- Indices de la tabla `cursa`
--
ALTER TABLE `cursa`
  ADD PRIMARY KEY (`ID_CURSADO`),
  ADD KEY `FK_ID_ALUMNO` (`ID_ALUMNO`),
  ADD KEY `FK_ID_MATERIA_CURSA` (`ID_MATERIA`);

--
-- Indices de la tabla `docente`
--
ALTER TABLE `docente`
  ADD PRIMARY KEY (`ID_DOCENTE`),
  ADD UNIQUE KEY `DNI` (`DNI`),
  ADD KEY `FK_ROL_DOCENTE` (`ROL_DOCENTE`);

--
-- Indices de la tabla `ensenia`
--
ALTER TABLE `ensenia`
  ADD PRIMARY KEY (`ID_ENSENIA`),
  ADD KEY `FK_ID_DOCENTE` (`ID_DOCENTE`),
  ADD KEY `FK_ID_MATERIA_ENSENIA` (`ID_MATERIA`);

--
-- Indices de la tabla `evalua_en`
--
ALTER TABLE `evalua_en`
  ADD PRIMARY KEY (`ID_EVALUA`),
  ADD KEY `FK_ID_EXAMEN_EVALUA_EN` (`ID_EXAMEN`),
  ADD KEY `FK_ID_DOCENTE_EVALUA_EN` (`ID_DOCENTE`),
  ADD KEY `FK_ID_MATERIA_EVALUA_EN` (`ID_MATERIA`);

--
-- Indices de la tabla `examen_final`
--
ALTER TABLE `examen_final`
  ADD PRIMARY KEY (`ID_EXAMEN_FINAL`),
  ADD KEY `FK_ID_MATERIA_EXAM` (`ID_MATERIA`);

--
-- Indices de la tabla `legajo_alumno`
--
ALTER TABLE `legajo_alumno`
  ADD PRIMARY KEY (`ID_LEGAJO`),
  ADD UNIQUE KEY `LEGAJO_ALU` (`LEGAJO_ALU`),
  ADD KEY `FK_DNI_ALUMNO` (`DNI`),
  ADD KEY `FK_ID_CARRERA_LEGALU` (`CARRERA`),
  ADD KEY `FK_ID_COHORTE` (`COHORTE`);

--
-- Indices de la tabla `legajo_docente`
--
ALTER TABLE `legajo_docente`
  ADD PRIMARY KEY (`ID_LEGAJO`),
  ADD UNIQUE KEY `LEGAJO_DOC` (`LEGAJO_DOC`),
  ADD KEY `FK_DNI_DOCENTE` (`DNI`),
  ADD KEY `FK_ID_CARRERA_LEGDOC` (`CARRERA`);

--
-- Indices de la tabla `materia`
--
ALTER TABLE `materia`
  ADD PRIMARY KEY (`ID_MATERIA`),
  ADD KEY `FK_ID_CARRERA_MAT` (`ID_CARRERA`);

--
-- Indices de la tabla `rinde`
--
ALTER TABLE `rinde`
  ADD PRIMARY KEY (`ID_RINDE`),
  ADD KEY `FK_ID_EXAMEN_RINDE` (`ID_EXAMEN`),
  ADD KEY `FK_ID_ALUMNO_RINDE` (`ID_ALUMNO`),
  ADD KEY `FK_ID_MATERIA_RINDE` (`ID_MATERIA`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`ID_ROL`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `administrativo`
--
ALTER TABLE `administrativo`
  MODIFY `ID_ADMINISTRATIVO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `alumno`
--
ALTER TABLE `alumno`
  MODIFY `ID_ALUMNO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `cohorte`
--
ALTER TABLE `cohorte`
  MODIFY `ID_COHORTE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `cursa`
--
ALTER TABLE `cursa`
  MODIFY `ID_CURSADO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=140;

--
-- AUTO_INCREMENT de la tabla `docente`
--
ALTER TABLE `docente`
  MODIFY `ID_DOCENTE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `ensenia`
--
ALTER TABLE `ensenia`
  MODIFY `ID_ENSENIA` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `evalua_en`
--
ALTER TABLE `evalua_en`
  MODIFY `ID_EVALUA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `examen_final`
--
ALTER TABLE `examen_final`
  MODIFY `ID_EXAMEN_FINAL` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `legajo_alumno`
--
ALTER TABLE `legajo_alumno`
  MODIFY `ID_LEGAJO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `legajo_docente`
--
ALTER TABLE `legajo_docente`
  MODIFY `ID_LEGAJO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `rinde`
--
ALTER TABLE `rinde`
  MODIFY `ID_RINDE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `ID_ROL` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `administrativo`
--
ALTER TABLE `administrativo`
  ADD CONSTRAINT `FK_ROL_ADMINISTRATIVO` FOREIGN KEY (`ROL_ADMINISTRATIVO`) REFERENCES `rol` (`ID_ROL`);

--
-- Filtros para la tabla `alumno`
--
ALTER TABLE `alumno`
  ADD CONSTRAINT `FK_ROL_ALUMNO` FOREIGN KEY (`ROL_ALUMNO`) REFERENCES `rol` (`ID_ROL`);

--
-- Filtros para la tabla `cohorte`
--
ALTER TABLE `cohorte`
  ADD CONSTRAINT `FK_ID_CARRERA_COH` FOREIGN KEY (`ID_CARRERA`) REFERENCES `carrera` (`ID_CARRERA`);

--
-- Filtros para la tabla `cursa`
--
ALTER TABLE `cursa`
  ADD CONSTRAINT `FK_ID_ALUMNO` FOREIGN KEY (`ID_ALUMNO`) REFERENCES `legajo_alumno` (`LEGAJO_ALU`),
  ADD CONSTRAINT `FK_ID_MATERIA_CURSA` FOREIGN KEY (`ID_MATERIA`) REFERENCES `materia` (`ID_MATERIA`);

--
-- Filtros para la tabla `docente`
--
ALTER TABLE `docente`
  ADD CONSTRAINT `FK_ROL_DOCENTE` FOREIGN KEY (`ROL_DOCENTE`) REFERENCES `rol` (`ID_ROL`);

--
-- Filtros para la tabla `ensenia`
--
ALTER TABLE `ensenia`
  ADD CONSTRAINT `FK_ID_DOCENTE` FOREIGN KEY (`ID_DOCENTE`) REFERENCES `legajo_docente` (`LEGAJO_DOC`),
  ADD CONSTRAINT `FK_ID_MATERIA_ENSENIA` FOREIGN KEY (`ID_MATERIA`) REFERENCES `materia` (`ID_MATERIA`);

--
-- Filtros para la tabla `evalua_en`
--
ALTER TABLE `evalua_en`
  ADD CONSTRAINT `FK_ID_DOCENTE_EVALUA_EN` FOREIGN KEY (`ID_DOCENTE`) REFERENCES `legajo_docente` (`LEGAJO_DOC`),
  ADD CONSTRAINT `FK_ID_EXAMEN_EVALUA_EN` FOREIGN KEY (`ID_EXAMEN`) REFERENCES `examen_final` (`ID_EXAMEN_FINAL`),
  ADD CONSTRAINT `FK_ID_MATERIA_EVALUA_EN` FOREIGN KEY (`ID_MATERIA`) REFERENCES `materia` (`ID_MATERIA`);

--
-- Filtros para la tabla `examen_final`
--
ALTER TABLE `examen_final`
  ADD CONSTRAINT `FK_ID_MATERIA_EXAM` FOREIGN KEY (`ID_MATERIA`) REFERENCES `materia` (`ID_MATERIA`);

--
-- Filtros para la tabla `legajo_alumno`
--
ALTER TABLE `legajo_alumno`
  ADD CONSTRAINT `FK_DNI_ALUMNO` FOREIGN KEY (`DNI`) REFERENCES `alumno` (`DNI`),
  ADD CONSTRAINT `FK_ID_CARRERA_LEGALU` FOREIGN KEY (`CARRERA`) REFERENCES `carrera` (`ID_CARRERA`),
  ADD CONSTRAINT `FK_ID_COHORTE` FOREIGN KEY (`COHORTE`) REFERENCES `cohorte` (`ID_COHORTE`);

--
-- Filtros para la tabla `legajo_docente`
--
ALTER TABLE `legajo_docente`
  ADD CONSTRAINT `FK_DNI_DOCENTE` FOREIGN KEY (`DNI`) REFERENCES `docente` (`DNI`),
  ADD CONSTRAINT `FK_ID_CARRERA_LEGDOC` FOREIGN KEY (`CARRERA`) REFERENCES `carrera` (`ID_CARRERA`);

--
-- Filtros para la tabla `materia`
--
ALTER TABLE `materia`
  ADD CONSTRAINT `FK_ID_CARRERA_MAT` FOREIGN KEY (`ID_CARRERA`) REFERENCES `carrera` (`ID_CARRERA`);

--
-- Filtros para la tabla `rinde`
--
ALTER TABLE `rinde`
  ADD CONSTRAINT `FK_ID_ALUMNO_RINDE` FOREIGN KEY (`ID_ALUMNO`) REFERENCES `legajo_alumno` (`LEGAJO_ALU`),
  ADD CONSTRAINT `FK_ID_EXAMEN_RINDE` FOREIGN KEY (`ID_EXAMEN`) REFERENCES `examen_final` (`ID_EXAMEN_FINAL`),
  ADD CONSTRAINT `FK_ID_MATERIA_RINDE` FOREIGN KEY (`ID_MATERIA`) REFERENCES `materia` (`ID_MATERIA`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
