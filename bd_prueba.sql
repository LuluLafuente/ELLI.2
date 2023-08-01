-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-08-2023 a las 23:13:20
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

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
  `LEGAJO_ADM` varchar(12) NOT NULL,
  `DNI` int(11) NOT NULL,
  `NOMBRE` varchar(30) NOT NULL,
  `APELLIDO` varchar(30) NOT NULL,
  `ROL_ADMINISTRATIVO` int(11) NOT NULL,
  `USUARIO` varchar(50) NOT NULL,
  `CONTRASENIA` varchar(20) NOT NULL,
  `DOMICILIO` varchar(50) NOT NULL,
  `NRO_DOMICILIO` int(11) DEFAULT NULL,
  `CELULAR` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `administrativo`
--

INSERT INTO `administrativo` (`LEGAJO_ADM`, `DNI`, `NOMBRE`, `APELLIDO`, `ROL_ADMINISTRATIVO`, `USUARIO`, `CONTRASENIA`, `DOMICILIO`, `NRO_DOMICILIO`, `CELULAR`) VALUES
('TSDS-19-1-A', 1, 'Rosana', 'Salomon', 1, 'rsaolomon@iset.com.ar', '1', 'calle', 123, 38100001),
('TSDS-19-2-A', 2, 'Paula', 'Vázquez', 1, 'pvazquez@iset.com.ar', '1', 'calle', 123, 38100001),
('TSDS-19-3-A', 3, 'Celia', 'Valenzuela', 1, 'cvalenzuela@iset.com.ar', '1', 'calle', 123, 38100001),
('TSDS-19-4-A', 4, 'Pablo', 'Zelaya', 1, 'pzelaya@iset.com.ar', '1', 'calle', 123, 38100001);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumno`
--

CREATE TABLE `alumno` (
  `LEGAJO_ALU` varchar(12) NOT NULL,
  `DNI` int(11) NOT NULL,
  `NOMBRE` varchar(50) NOT NULL,
  `APELLIDO` varchar(50) NOT NULL,
  `ROL_ALUMNO` int(11) NOT NULL,
  `USUARIO` varchar(50) NOT NULL,
  `CONTRASENIA` varchar(20) NOT NULL,
  `DOMICILIO` varchar(100) NOT NULL,
  `CELULAR` int(11) DEFAULT NULL,
  `NRO_DOMICILIO` int(11) DEFAULT NULL,
  `ANIO` int(11) NOT NULL,
  `CARRERA` int(11) NOT NULL,
  `RED_FACEBOOK` varchar(100) DEFAULT NULL,
  `RED_INSTAGRAM` varchar(100) DEFAULT NULL,
  `RED_TWITTER` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `alumno`
--

INSERT INTO `alumno` (`LEGAJO_ALU`, `DNI`, `NOMBRE`, `APELLIDO`, `ROL_ALUMNO`, `USUARIO`, `CONTRASENIA`, `DOMICILIO`, `CELULAR`, `NRO_DOMICILIO`, `ANIO`, `CARRERA`, `RED_FACEBOOK`, `RED_INSTAGRAM`, `RED_TWITTER`) VALUES
('TSDS-19-1-A', 1, 'Lourdes', 'Lafuente', 3, 'llafuente@iset.com.ar', '0', 'calle', 38100001, 123, 2019, 1, 'https://www.facebook.com/usuario', 'https://www.instagram.com/usuario', 'https://www.instagram.com/usuario'),
('TSDS-19-2-A', 2, 'Ignacio', 'Llorente', 3, 'illorente@iset.com.ar', '0', 'calle', 38100001, 123, 2019, 1, NULL, NULL, NULL),
('TSDS-19-3-A', 3, 'Lucas', 'Villagran', 3, 'lvillagran@iset.com.ar', '0', 'calle', 38100001, 123, 2019, 1, NULL, NULL, NULL),
('TSDS-19-4-A', 4, 'David', 'Carrazana', 3, 'dcarrazana@iset.com.ar', '0', 'calle', 38100001, 123, 2019, 1, NULL, NULL, NULL),
('TSDS-19-5-A', 5, 'Ariel', 'Kasiañuk', 3, 'akasiañuk@iset.com.ar', '0', 'calle', 38100001, 123, 2019, 1, NULL, NULL, NULL),
('TSDS-19-6-A', 6, 'Carlos', 'Namen', 3, 'cnamen@iset.com.ar', '0', 'calle', 38100001, 123, 2019, 1, NULL, NULL, NULL),
('TSDS-19-7-A', 7, 'Ramon', 'Gutierrez', 3, 'rgutierrez@iset.com.ar', '0', 'calle', 38100001, 123, 2019, 1, NULL, NULL, NULL),
('TSDS-19-8-A', 8, 'Ricardo', 'Xxxx', 3, 'rxxxx@iset.com.ar', '0', 'calle', 38100001, 123, 2019, 1, NULL, NULL, NULL),
('TSDS-19-9-A', 9, 'Norma', ' Xxxx', 3, 'nxxxx@iset.com.ar', '0', 'calle', 38100001, 123, 2019, 1, NULL, NULL, NULL);

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
-- Estructura de tabla para la tabla `cursa`
--

CREATE TABLE `cursa` (
  `ID_CURSADO` int(11) NOT NULL,
  `ID_ALUMNO` varchar(12) NOT NULL,
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
(1, 'TSDS-19-1-A', 1, '2023-07-26 22:52:51', 2023, 7, 7, 7, 'Promocion'),
(2, 'TSDS-19-1-A', 2, '2023-07-26 22:52:51', 2023, 7, 9, 8, 'Promocion'),
(3, 'TSDS-19-1-A', 3, '2023-07-26 22:52:51', 2023, 4, 4, 6, 'Aprobado'),
(4, 'TSDS-19-1-A', 4, '2023-07-26 22:52:51', 2023, 8, 8, 8, 'Promocion'),
(5, 'TSDS-19-1-A', 5, '2023-07-26 22:52:51', 2023, 10, 5, 10, 'Aprobado'),
(6, 'TSDS-19-1-A', 6, '2023-07-26 22:52:51', 2023, 9, 10, 10, 'Promocion'),
(7, 'TSDS-19-1-A', 7, '2023-07-26 22:52:51', 2023, 8, 8, 9, 'Aprobado'),
(8, 'TSDS-19-1-A', 8, '2023-07-26 22:52:51', 2023, 8, 8, 9, 'Aprobado'),
(9, 'TSDS-19-1-A', 9, '2023-07-26 22:52:51', 2023, 8, 7, 8, 'Aprobado'),
(10, 'TSDS-19-1-A', 10, '2023-07-26 22:52:51', 2023, 10, 10, 10, 'Aprobado'),
(11, 'TSDS-19-1-A', 11, '2023-07-26 22:52:51', 2023, 8, 9, 9, 'Promocion'),
(12, 'TSDS-19-1-A', 12, '2023-07-26 22:52:51', 2023, 4, 5, 5, 'Aprobado'),
(13, 'TSDS-19-1-A', 13, '2023-07-26 22:52:51', 2023, 9, 7, 8, 'Promocion'),
(14, 'TSDS-19-1-A', 14, '2023-07-26 22:52:51', 2023, 10, 10, 10, 'Promocion'),
(15, 'TSDS-19-1-A', 15, '2023-07-26 22:52:51', 2023, 0, 0, 0, 'Libre'),
(16, 'TSDS-19-1-A', 16, '2023-07-26 22:52:51', 2023, 10, 4, 10, 'Aprobado'),
(17, 'TSDS-19-1-A', 17, '2023-07-26 22:52:51', 2023, 8, 8, 4, 'Aprobado'),
(18, 'TSDS-19-1-A', 18, '2023-07-26 22:52:51', 2023, 7, 6, 10, 'Aprobado'),
(19, 'TSDS-19-1-A', 19, '2023-07-26 22:52:51', 2023, 10, 10, 10, 'Aprobado'),
(20, 'TSDS-19-1-A', 20, '2023-07-26 22:52:51', 2023, 8, 8, 9, 'Promocion'),
(21, 'TSDS-19-1-A', 21, '2023-07-26 22:52:51', 2023, 6, 6, 0, 'Sin Datos'),
(22, 'TSDS-19-1-A', 22, '2023-07-26 22:52:51', 2023, 6, 6, 0, 'Sin Datos'),
(23, 'TSDS-19-1-A', 23, '2023-07-26 22:52:51', 2023, 0, 0, 0, 'Sin Datos'),
(24, 'TSDS-19-1-A', 24, '2023-07-26 22:52:51', 2023, 0, 0, 4, 'Aprobado'),
(25, 'TSDS-19-1-A', 25, '2023-07-26 22:52:51', 2023, 8, 8, 9, 'Promocion'),
(26, 'TSDS-19-1-A', 26, '2023-07-26 22:52:51', 2023, 8, 8, 10, 'Aprobado'),
(27, 'TSDS-19-1-A', 27, '2023-07-26 22:52:51', 2023, 8, 8, 0, 'Sin Datos'),
(28, 'TSDS-19-1-A', 28, '2023-07-26 22:52:51', 2023, 8, 8, 8, 'Promocion');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `docente`
--

CREATE TABLE `docente` (
  `LEGAJO_DOC` varchar(12) NOT NULL,
  `DNI` int(11) NOT NULL,
  `NOMBRE` varchar(30) NOT NULL,
  `APELLIDO` varchar(30) NOT NULL,
  `ROL_DOCENTE` int(11) NOT NULL,
  `USUARIO` varchar(50) NOT NULL,
  `CONTRASENIA` varchar(20) NOT NULL,
  `DOMICILIO` varchar(50) NOT NULL,
  `NRO_DOMICILIO` int(11) DEFAULT NULL,
  `CELULAR` int(11) DEFAULT NULL,
  `CARRERA` int(11) NOT NULL,
  `RED_FACEBOOK` varchar(50) DEFAULT NULL,
  `RED_INSTAGRAM` varchar(50) DEFAULT NULL,
  `RED_TWITTER` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `docente`
--

INSERT INTO `docente` (`LEGAJO_DOC`, `DNI`, `NOMBRE`, `APELLIDO`, `ROL_DOCENTE`, `USUARIO`, `CONTRASENIA`, `DOMICILIO`, `NRO_DOMICILIO`, `CELULAR`, `CARRERA`, `RED_FACEBOOK`, `RED_INSTAGRAM`, `RED_TWITTER`) VALUES
('TSDS-19-1-D', 1, 'Oscar', 'Niemeyer', 2, 'oniemeyer@iset.com.ar', '0', 'calle', 123, 38100001, 1, 'https://www.facebook.com/usuario', 'https://www.instagram.com/usuario', 'https://www.instagram.com/usuario'),
('TSDS-19-2-D', 2, 'María', 'Costilla', 2, 'mcostilla@iset.com.ar', '0', 'calle', 123, 38100001, 1, NULL, NULL, NULL),
('TSDS-19-3-D', 3, 'Buckminster', 'Fuller', 2, 'bfuller@iset.com.ar', '0', 'calle', 123, 38100001, 1, NULL, NULL, NULL),
('TSDS-19-4-D', 4, 'Santiago', 'Calatrava', 2, 'scalatrava@iset.com.ar', '0', 'calle', 123, 38100001, 1, NULL, NULL, NULL),
('TSDS-19-6-D', 6, 'Jorge', 'Leiva', 2, 'jleiva@iset.com.ar', '0', 'calle', 123, 38100001, 1, NULL, NULL, NULL),
('TSDS-19-7-D', 7, 'Viktor', 'Frankenstein', 2, 'vfrankenstein@iset.com.ar', '0', 'calle', 123, 38100001, 1, NULL, NULL, NULL),
('TSDS-21-5-D', 5, 'Diego', 'Figueroa', 2, 'dfigueroa@iset.com.ar', '0', 'calle', 123, 38100001, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ensenia`
--

CREATE TABLE `ensenia` (
  `ID_ENSENIA` int(11) NOT NULL,
  `ID_DOCENTE` varchar(12) NOT NULL,
  `ID_MATERIA` int(11) NOT NULL,
  `DESDE` datetime NOT NULL,
  `HASTA` datetime DEFAULT NULL,
  `CICLO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `examenfinal`
--

CREATE TABLE `examenfinal` (
  `ID_ALUMNO` varchar(12) NOT NULL,
  `MATERIA` varchar(80) NOT NULL,
  `FINAL` int(11) NOT NULL,
  `ID_ACTA` int(11) NOT NULL,
  `nota1` int(11) NOT NULL,
  `nota2` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `examenfinal`
--

INSERT INTO `examenfinal` (`ID_ALUMNO`, `MATERIA`, `FINAL`, `ID_ACTA`, `nota1`, `nota2`) VALUES
('TSDS-19-1-A', 'Ciudadanía y Espacios Publicos', 7, 61, 0, 0),
('TSDS-19-1-A', ' Introducción a la informatica', 8, 63, 0, 0),
('TSDS-19-1-A', 'Introducción a Redes', 8, 150, 0, 0),
('TSDS-19-1-A', 'Bases de datos I', 6, 62, 0, 0),
('TSDS-19-1-A', ' Matemática I', 8, 44, 0, 0),
('TSDS-19-1-A', ' Programación I', 10, 54, 0, 0),
('TSDS-19-1-A', ' Inglés Técnico I', 10, 60, 0, 0),
('TSDS-19-1-A', ' Estructura de datos', 9, 47, 0, 0),
('TSDS-19-1-A ', 'Taller de Programacion', 8, 134, 0, 0),
('TSDS-19-1-A', ' Programación II', 8, 173, 0, 0),
('TSDS-19-1-A', ' Estadística Aplicada', 9, 124, 0, 0),
('TSDS-19-1-A', 'Base de datos II', 5, 72, 0, 0),
('TSDS-19-1-A ', 'Matematicas II', 8, 97, 0, 0),
('TSDS-19-1-A ', 'Sistemas de Informacion', 10, 68, 0, 0),
('TSDS-19-1-A', 'Redes y Seguridad Informatica', 10, 167, 0, 0),
('TSDS-19-1-A', 'Análisis y Diseño de Sistemas', 4, 98, 0, 0),
('TSDS-19-1-A', 'Laboratorio de Programacion', 10, 165, 0, 0),
('TSDS-19-1-A', 'Taller de Programacion', 10, 136, 0, 0),
('TSDS-19-1-A', 'Emprendimientos Tecnologicos', 9, 155, 0, 0),
('TSDS-19-1-A', 'Ética y Deontología ', 4, 58, 0, 0),
('TSDS-19-1-A', 'Legislación de software', 9, 152, 0, 0),
('TSDS-19-1-A', 'Tec. Avanzadas de Programación', 10, 58, 0, 0),
('TSDS-19-1-A', 'Desarrollo Empresarial', 8, 154, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materia`
--

CREATE TABLE `materia` (
  `ID_MATERIA` int(11) NOT NULL,
  `ID_CARRERA` int(11) NOT NULL,
  `NOMBRE` varchar(70) NOT NULL,
  `ANIO` int(11) NOT NULL,
  `DESCRIPCION` varchar(3000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `materia`
--

INSERT INTO `materia` (`ID_MATERIA`, `ID_CARRERA`, `NOMBRE`, `ANIO`, `DESCRIPCION`) VALUES
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
(22, 1, 'Programación III', 3, 'Descripcion de la materia'),
(23, 1, 'Inglés Técnico III', 3, 'Descripcion de la materia'),
(24, 1, 'Ética y Deontología Profesional', 3, 'Descripcion de la materia'),
(25, 1, 'Legislación de software', 3, 'Descripcion de la materia'),
(26, 1, 'Tecnicas Avanzadas de Programacion', 3, 'Descripcion de la materia'),
(27, 1, 'Taller de Programación III', 3, 'Descripcion de la materia'),
(28, 1, 'Desarrollo Empresarial', 3, 'Descripcion de la materia');

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
-- Estructura Stand-in para la vista `vw_cursado`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_cursado` (
`legajo_alu` varchar(12)
,`alumno` varchar(101)
,`anio` int(11)
,`materia` int(11)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_examenadmin`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_examenadmin` (
`LEGAJO_ALU` varchar(12)
,`Name` varchar(101)
,`NOMBRE` varchar(70)
,`1ER_PARCIAL` int(11)
,`2DO_PARCIAL` int(11)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_finaladmin`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_finaladmin` (
`LEGAJO_ALU` varchar(12)
,`Name` varchar(101)
,`MATERIA` varchar(80)
,`FINAL` int(11)
,`ID_ACTA` int(11)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_notafinal`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_notafinal` (
`APELLIDO` varchar(50)
,`MATERIA` varchar(80)
,`FINAL` int(11)
,`ID_ACTA` int(11)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_nota_alumno`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_nota_alumno` (
`Materia` int(11)
,`nombre` varchar(70)
,`anio` int(11)
,`nota` int(11)
,`condicion` varchar(50)
,`legajo` varchar(12)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_plan_estudio`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_plan_estudio` (
`carrera` varchar(100)
,`id_carrera` int(11)
,`id_materia` int(11)
,`nombre` varchar(70)
,`anio` int(11)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_vista_cursado`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_vista_cursado` (
`DNI` int(11)
,`APELLIDO` varchar(50)
,`NOMBRE` varchar(70)
,`1ER_PARCIAL` int(11)
,`2DO_PARCIAL` int(11)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_cursado`
--
DROP TABLE IF EXISTS `vw_cursado`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_cursado`  AS SELECT `a`.`LEGAJO_ALU` AS `legajo_alu`, concat(`a`.`NOMBRE`,' ',`a`.`APELLIDO`) AS `alumno`, `c`.`CICLO` AS `anio`, `c`.`ID_MATERIA` AS `materia` FROM (`cursa` `c` join `alumno` `a` on(`a`.`LEGAJO_ALU` = `c`.`ID_ALUMNO`))  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_examenadmin`
--
DROP TABLE IF EXISTS `vw_examenadmin`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_examenadmin`  AS SELECT `alumno`.`LEGAJO_ALU` AS `LEGAJO_ALU`, concat(`alumno`.`APELLIDO`,' ',`alumno`.`NOMBRE`) AS `Name`, `materia`.`NOMBRE` AS `NOMBRE`, `cursa`.`1ER_PARCIAL` AS `1ER_PARCIAL`, `cursa`.`2DO_PARCIAL` AS `2DO_PARCIAL` FROM ((`alumno` join `cursa` on(`cursa`.`ID_ALUMNO` = `alumno`.`LEGAJO_ALU`)) join `materia` on(`materia`.`ID_MATERIA` = `cursa`.`ID_MATERIA`))  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_finaladmin`
--
DROP TABLE IF EXISTS `vw_finaladmin`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_finaladmin`  AS SELECT `alumno`.`LEGAJO_ALU` AS `LEGAJO_ALU`, concat(`alumno`.`NOMBRE`,' ',`alumno`.`APELLIDO`) AS `Name`, `examenfinal`.`MATERIA` AS `MATERIA`, `examenfinal`.`FINAL` AS `FINAL`, `examenfinal`.`ID_ACTA` AS `ID_ACTA` FROM (`alumno` join `examenfinal` on(`examenfinal`.`ID_ALUMNO` = `alumno`.`LEGAJO_ALU`))  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_notafinal`
--
DROP TABLE IF EXISTS `vw_notafinal`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_notafinal`  AS SELECT `alumno`.`APELLIDO` AS `APELLIDO`, `examenfinal`.`MATERIA` AS `MATERIA`, `examenfinal`.`FINAL` AS `FINAL`, `examenfinal`.`ID_ACTA` AS `ID_ACTA` FROM (`alumno` join `examenfinal` on(`examenfinal`.`ID_ALUMNO` = `alumno`.`LEGAJO_ALU`))  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_nota_alumno`
--
DROP TABLE IF EXISTS `vw_nota_alumno`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_nota_alumno`  AS SELECT `m`.`ID_MATERIA` AS `Materia`, `m`.`NOMBRE` AS `nombre`, `m`.`ANIO` AS `anio`, `c`.`FINAL` AS `nota`, `c`.`ESTADO` AS `condicion`, `a`.`LEGAJO_ALU` AS `legajo` FROM ((`cursa` `c` join `alumno` `a` on(`c`.`ID_ALUMNO` = `a`.`LEGAJO_ALU`)) join `materia` `m` on(`c`.`ID_MATERIA` = `m`.`ID_MATERIA`))  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_plan_estudio`
--
DROP TABLE IF EXISTS `vw_plan_estudio`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_plan_estudio`  AS SELECT `c`.`NOMBRE` AS `carrera`, `c`.`ID_CARRERA` AS `id_carrera`, `m`.`ID_MATERIA` AS `id_materia`, `m`.`NOMBRE` AS `nombre`, `m`.`ANIO` AS `anio` FROM (`carrera` `c` join `materia` `m` on(`m`.`ID_CARRERA` = `c`.`ID_CARRERA`))  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_vista_cursado`
--
DROP TABLE IF EXISTS `vw_vista_cursado`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_vista_cursado`  AS SELECT `alumno`.`DNI` AS `DNI`, `alumno`.`APELLIDO` AS `APELLIDO`, `materia`.`NOMBRE` AS `NOMBRE`, `cursa`.`1ER_PARCIAL` AS `1ER_PARCIAL`, `cursa`.`2DO_PARCIAL` AS `2DO_PARCIAL` FROM ((`alumno` join `cursa` on(`alumno`.`LEGAJO_ALU` = `cursa`.`ID_ALUMNO`)) join `materia` on(`cursa`.`ID_MATERIA` = `materia`.`ID_MATERIA`))  ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administrativo`
--
ALTER TABLE `administrativo`
  ADD PRIMARY KEY (`LEGAJO_ADM`),
  ADD UNIQUE KEY `DNI` (`DNI`),
  ADD KEY `FK_ROL_ADMINISTRATIVO` (`ROL_ADMINISTRATIVO`);

--
-- Indices de la tabla `alumno`
--
ALTER TABLE `alumno`
  ADD PRIMARY KEY (`LEGAJO_ALU`),
  ADD KEY `FK_CARRERA` (`CARRERA`),
  ADD KEY `FK_ROL_ALUMNO` (`ROL_ALUMNO`);

--
-- Indices de la tabla `carrera`
--
ALTER TABLE `carrera`
  ADD PRIMARY KEY (`ID_CARRERA`);

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
  ADD PRIMARY KEY (`LEGAJO_DOC`),
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
-- Indices de la tabla `materia`
--
ALTER TABLE `materia`
  ADD PRIMARY KEY (`ID_MATERIA`),
  ADD KEY `FK_ID_CARRERA` (`ID_CARRERA`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`ID_ROL`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cursa`
--
ALTER TABLE `cursa`
  MODIFY `ID_CURSADO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de la tabla `ensenia`
--
ALTER TABLE `ensenia`
  MODIFY `ID_ENSENIA` int(11) NOT NULL AUTO_INCREMENT;

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
  ADD CONSTRAINT `FK_CARRERA` FOREIGN KEY (`CARRERA`) REFERENCES `carrera` (`ID_CARRERA`),
  ADD CONSTRAINT `FK_ROL_ALUMNO` FOREIGN KEY (`ROL_ALUMNO`) REFERENCES `rol` (`ID_ROL`);

--
-- Filtros para la tabla `cursa`
--
ALTER TABLE `cursa`
  ADD CONSTRAINT `FK_ID_ALUMNO` FOREIGN KEY (`ID_ALUMNO`) REFERENCES `alumno` (`LEGAJO_ALU`),
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
  ADD CONSTRAINT `FK_ID_DOCENTE` FOREIGN KEY (`ID_DOCENTE`) REFERENCES `docente` (`LEGAJO_DOC`),
  ADD CONSTRAINT `FK_ID_MATERIA_ENSENIA` FOREIGN KEY (`ID_MATERIA`) REFERENCES `materia` (`ID_MATERIA`);

--
-- Filtros para la tabla `materia`
--
ALTER TABLE `materia`
  ADD CONSTRAINT `FK_ID_CARRERA` FOREIGN KEY (`ID_CARRERA`) REFERENCES `carrera` (`ID_CARRERA`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
