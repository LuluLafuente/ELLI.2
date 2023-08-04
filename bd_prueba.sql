CREATE DATABASE bd_prueba;

USE bd_prueba;

CREATE TABLE `ROL`(
     `ID_ROL` INT         NOT NULL AUTO_INCREMENT,
     `ROL`    VARCHAR(30) NOT NULL,
    
     CONSTRAINT `PK_ID_ROL` PRIMARY KEY (`ID_ROL`)
);

CREATE TABLE `CARRERA`(
     `ID_CARRERA` INT          NOT NULL,
     `NOMBRE`     VARCHAR(100) NOT NULL,
     `ABREVIADO`  VARCHAR(5)   NOT NULL,
    
     CONSTRAINT `PK_ID_CARRERA` PRIMARY KEY(`ID_CARRERA`)
);

CREATE TABLE `COHORTE`(
     `ID_COHORTE` INT  NOT NULL AUTO_INCREMENT,
     `ID_CARRERA` INT  NOT NULL,
     `NUMERO`     INT  NOT NULL,
     `ANIO`       DATE NOT NULL,
    
     CONSTRAINT `PK_ID_COHORTE`     PRIMARY KEY (`ID_COHORTE`),
     CONSTRAINT `FK_ID_CARRERA_COH` FOREIGN KEY (`ID_CARRERA`) REFERENCES `CARRERA`(`ID_CARRERA`)
);

CREATE TABLE `MATERIA` (
     `ID_MATERIA`  INT           NOT NULL,
     `ID_CARRERA`  INT           NOT NULL,
     `NOMBRE`      VARCHAR(100)  NOT NULL,
     `ANIO`        INT           NOT NULL,
     `DESCRIPCION` VARCHAR(3000) NOT NULL,
    
     CONSTRAINT `PK_ID_MATERIA`     PRIMARY KEY (`ID_MATERIA`),
     CONSTRAINT `FK_ID_CARRERA_MAT` FOREIGN KEY (`ID_CARRERA`) REFERENCES `CARRERA`(`ID_CARRERA`)
);

CREATE TABLE `ADMINISTRATIVO`(
    `ID_ADMINISTRATIVO`  INT          NOT NULL AUTO_INCREMENT,
    `LEGAJO_ADM`         VARCHAR(15)  NOT NULL, 
    `DNI`                INT          NOT NULL UNIQUE,
    `NOMBRE`             VARCHAR(30)  NOT NULL,
    `APELLIDO`           VARCHAR(30)  NOT NULL,
    `ROL_ADMINISTRATIVO` INT          NOT NULL,
    `USUARIO`            VARCHAR(50)  NOT NULL,
    `CONTRASENIA`        VARCHAR(20)  NOT NULL,
    `DOMICILIO`          VARCHAR(50)  NOT NULL,
    `NRO_DOMICILIO`      INT              NULL,
    `CELULAR`            INT              NULL,
    `FOTO_ADM`           VARCHAR(100) NOT NULL,
    `FECHA_INSC`         DATETIME     NOT NULL,
    
    CONSTRAINT `PK_ID_ADMINISTATIVO`   PRIMARY KEY(`ID_ADMINISTRATIVO`),
    CONSTRAINT `FK_ROL_ADMINISTRATIVO` FOREIGN KEY(`ROL_ADMINISTRATIVO`) REFERENCES `ROL`(`ID_ROL`)
);

CREATE TABLE `DOCENTE`(
    `ID_DOCENTE`    INT          NOT NULL AUTO_INCREMENT,
    `DNI`           INT          NOT NULL UNIQUE,
    `NOMBRE`        VARCHAR(30)  NOT NULL,
    `APELLIDO`      VARCHAR(30)  NOT NULL,
    `ROL_DOCENTE`   INT          NOT NULL,
    `USUARIO`       VARCHAR(50)  NOT NULL,
    `CONTRASENIA`   VARCHAR(20)  NOT NULL,
    `DOMICILIO`     VARCHAR(50)  NOT NULL,
    `NRO_DOMICILIO` INT              NULL,
    `CELULAR`       INT              NULL,
    `RED_FACEBOOK`  VARCHAR(50)      NULL,
    `RED_INSTAGRAM` VARCHAR(50)      NULL,
    `RED_TWITTER`   VARCHAR(50)      NULL,
    `FOTO_DOC`      VARCHAR(100) NOT NULL,
    
    CONSTRAINT `PK_ID_DOCENTE`  PRIMARY KEY(`ID_DOCENTE`),
    CONSTRAINT `FK_ROL_DOCENTE` FOREIGN KEY(`ROL_DOCENTE`) REFERENCES `ROL`(`ID_ROL`)
);

CREATE TABLE `LEGAJO_DOCENTE`(
    `ID_LEGAJO`         INT         NOT NULL AUTO_INCREMENT,
    `DNI`               INT         NOT NULL,
    `LEGAJO_DOC`        VARCHAR(15) NOT NULL UNIQUE,
    `CARRERA`           INT         NOT NULL,
    `FECHA_INSCRIPCION` DATETIME    NOT NULL,
    
    CONSTRAINT `PK_ID_LEGAJO`         PRIMARY KEY (`ID_LEGAJO`),
    CONSTRAINT `FK_DNI_DOCENTE`       FOREIGN KEY (`DNI`)     REFERENCES `DOCENTE`(`DNI`),
    CONSTRAINT `FK_ID_CARRERA_LEGDOC` FOREIGN KEY (`CARRERA`) REFERENCES `CARRERA`(`ID_CARRERA`)
);

CREATE TABLE `ENSENIA`(
    `ID_ENSENIA` INT         NOT NULL AUTO_INCREMENT,
    `ID_DOCENTE` VARCHAR(15) NOT NULL,
    `ID_MATERIA` INT         NOT NULL,
    `DESDE`      DATETIME    NOT NULL,
    `HASTA`      DATETIME        NULL,
    `CICLO`      INT         NOT NULL,
    
    CONSTRAINT `PK_ID_ENSENIA`         PRIMARY KEY (`ID_ENSENIA`),
    CONSTRAINT `FK_ID_DOCENTE`         FOREIGN KEY (`ID_DOCENTE`) REFERENCES `LEGAJO_DOCENTE`(`LEGAJO_DOC`),
    CONSTRAINT `FK_ID_MATERIA_ENSENIA` FOREIGN KEY (`ID_MATERIA`) REFERENCES `MATERIA`(`ID_MATERIA`)
);

CREATE TABLE `ALUMNO`(
     `ID_ALUMNO`     INT          NOT NULL AUTO_INCREMENT,
     `DNI`           INT          NOT NULL UNIQUE,
     `NOMBRE`        VARCHAR(50)  NOT NULL,
     `APELLIDO`      VARCHAR(50)  NOT NULL,
     `ROL_ALUMNO`    INT          NOT NULL,
     `USUARIO`       VARCHAR(50)  NOT NULL,
     `CONTRASENIA`   VARCHAR(20)  NOT NULL,
     `DOMICILIO`     VARCHAR(100) NOT NULL,
     `NRO_DOMICILIO` INT              NULL,
     `CELULAR`       INT(10) ZEROFILL NULL,
     `RED_FACEBOOK`  VARCHAR(100)     NULL,
     `RED_INSTAGRAM` VARCHAR(100)     NULL,
     `RED_TWITTER`   VARCHAR(100)     NULL,
     `FOTO_ALU`      VARCHAR(100) NOT NULL,
    
     CONSTRAINT `PK_ID_ALUMNO`  PRIMARY KEY (`ID_ALUMNO`),
     CONSTRAINT `FK_ROL_ALUMNO` FOREIGN KEY (`ROL_ALUMNO`) REFERENCES `ROL`(`ID_ROL`)
);

CREATE TABLE `LEGAJO_ALUMNO`(
    `ID_LEGAJO`         INT         NOT NULL AUTO_INCREMENT,
    `DNI`               INT         NOT NULL,
    `LEGAJO_ALU`        VARCHAR(15) NOT NULL UNIQUE,
    `CARRERA`           INT         NOT NULL,
    `COHORTE`           INT         NOT NULL,
    `FECHA_INSCRIPCION` DATETIME    NOT NULL,
    
    CONSTRAINT `PK_ID_LEGAJO`         PRIMARY KEY (`ID_LEGAJO`),
    CONSTRAINT `FK_DNI_ALUMNO`        FOREIGN KEY (`DNI`)     REFERENCES `ALUMNO`(`DNI`),
    CONSTRAINT `FK_ID_CARRERA_LEGALU` FOREIGN KEY (`CARRERA`) REFERENCES `CARRERA`(`ID_CARRERA`),
    CONSTRAINT `FK_ID_COHORTE`        FOREIGN KEY (`COHORTE`) REFERENCES `COHORTE`(`ID_COHORTE`)
);

CREATE TABLE `CURSA`(
    `ID_CURSADO`  INT         NOT NULL AUTO_INCREMENT,
    `ID_ALUMNO`   VARCHAR(15) NOT NULL,
    `ID_MATERIA`  INT         NOT NULL,
    `FECHA`       DATETIME    NOT NULL,
    `CICLO`       INT         NOT NULL,
    `1ER_PARCIAL` INT             NULL,
    `2DO_PARCIAL` INT             NULL,
    `FINAL`       INT             NULL,
    `ESTADO`      VARCHAR(50)     NULL,
    
    CONSTRAINT `PK_ID_CURSA`         PRIMARY KEY (`ID_CURSADO`),
    CONSTRAINT `FK_ID_ALUMNO`        FOREIGN KEY (`ID_ALUMNO`)  REFERENCES `LEGAJO_ALUMNO`(`LEGAJO_ALU`),
    CONSTRAINT `FK_ID_MATERIA_CURSA` FOREIGN KEY (`ID_MATERIA`) REFERENCES `MATERIA`(`ID_MATERIA`)
);

-- En esta tabla, se reemplazo "MATERIA", por "ID_MATERIA", también se separo las notas con guiones bajo "-"
-- Se agregaron también las claves foraneas en la tabla
CREATE TABLE `EXAMEN_FINAL`(
    `ID_EXAMEN_FINAL` INT         NOT NULL AUTO_INCREMENT,
    `ID_ALUMNO`       VARCHAR(15) NOT NULL,
    `ID_MATERIA`      INT         NOT NULL,
    `FINAL`           INT(2)      NOT NULL,
    `ID_ACTA`         INT         NOT NULL,
    `NOTA_1`          INT(2)      NOT NULL,
    `NOTA_2`          INT(2)      NOT NULL,
    
    CONSTRAINT `PK_ID_CURSA`         PRIMARY KEY (`ID_EXAMEN_FINAL`),
    CONSTRAINT `FK_ID_ALUMNO_EXAMEN` FOREIGN KEY (`ID_ALUMNO`)  REFERENCES `LEGAJO_ALUMNO`(`LEGAJO_ALU`),
    CONSTRAINT `FK_ID_MATERIA_EXAM`  FOREIGN KEY (`ID_MATERIA`) REFERENCES `MATERIA`(`ID_MATERIA`)
);

-- Insert de tablas

-- Insert Roles

INSERT INTO `ROL` (`ID_ROL`, `ROL`)
     VALUES (1, 'administración');

INSERT INTO `ROL` (`ID_ROL`, `ROL`)
     VALUES (2, 'docente');

INSERT INTO `ROL` (`ID_ROL`, `ROL`)
     VALUES (3, 'alumno');

-- Insert Carreras

INSERT INTO `CARRERA` (`ID_CARRERA`, `NOMBRE`, `ABREVIADO`)
     VALUES (1, 'Tecnicatura Superior en Desarrollo de Software', 'TSDS');

INSERT INTO `CARRERA` (`ID_CARRERA`, `NOMBRE`, `ABREVIADO`)
     VALUES (2, 'Tecnicatura Superior en Bioenergía', 'TSB');

INSERT INTO `CARRERA` (`ID_CARRERA`, `NOMBRE`, `ABREVIADO`)
     VALUES (3, 'Tecnicatura Superior en Gestión Ambiental', 'TSGA');

INSERT INTO `CARRERA` (`ID_CARRERA`, `NOMBRE`, `ABREVIADO`)
     VALUES (4, 'Tecnicatura Superior en Automatización y Robótica Industrial', 'TSARI');

-- Insert Cohorte

INSERT INTO `COHORTE` (`ID_CARRERA`, `NUMERO`, `ANIO`)
     VALUES (1, 1, '2018-01-01');
     
INSERT INTO `COHORTE` (`ID_CARRERA`, `NUMERO`, `ANIO`)
     VALUES (1, 2, '2019-01-01');
     
INSERT INTO `COHORTE` (`ID_CARRERA`, `NUMERO`, `ANIO`)
     VALUES (1, 3, '2020-01-01');
     
INSERT INTO `COHORTE` (`ID_CARRERA`, `NUMERO`, `ANIO`)
     VALUES (1, 4, '2021-01-01');
     
INSERT INTO `COHORTE` (`ID_CARRERA`, `NUMERO`, `ANIO`)
     VALUES (1, 5, '2022-01-01');
     
INSERT INTO `COHORTE` (`ID_CARRERA`, `NUMERO`, `ANIO`)
     VALUES (1, 6, '2023-01-01');

INSERT INTO `COHORTE` (`ID_CARRERA`, `NUMERO`, `ANIO`)
     VALUES (2, 1, '2018-01-01');
     
INSERT INTO `COHORTE` (`ID_CARRERA`, `NUMERO`, `ANIO`)
     VALUES (2, 2, '2019-01-01');
     
INSERT INTO `COHORTE` (`ID_CARRERA`, `NUMERO`, `ANIO`)
     VALUES (2, 3, '2020-01-01');
     
INSERT INTO `COHORTE` (`ID_CARRERA`, `NUMERO`, `ANIO`)
     VALUES (2, 4, '2021-01-01');
     
INSERT INTO `COHORTE` (`ID_CARRERA`, `NUMERO`, `ANIO`)
     VALUES (2, 5, '2022-01-01');
     
INSERT INTO `COHORTE` (`ID_CARRERA`, `NUMERO`, `ANIO`)
     VALUES (2, 6, '2023-01-01');

INSERT INTO `COHORTE` (`ID_CARRERA`, `NUMERO`, `ANIO`)
     VALUES (3, 1, '2018-01-01');
     
INSERT INTO `COHORTE` (`ID_CARRERA`, `NUMERO`, `ANIO`)
     VALUES (3, 2, '2019-01-01');
     
INSERT INTO `COHORTE` (`ID_CARRERA`, `NUMERO`, `ANIO`)
     VALUES (3, 3, '2020-01-01');
     
INSERT INTO `COHORTE` (`ID_CARRERA`, `NUMERO`, `ANIO`)
     VALUES (3, 4, '2021-01-01');
     
INSERT INTO `COHORTE` (`ID_CARRERA`, `NUMERO`, `ANIO`)
     VALUES (3, 5, '2022-01-01');
     
INSERT INTO `COHORTE` (`ID_CARRERA`, `NUMERO`, `ANIO`)
     VALUES (3, 6, '2023-01-01');

INSERT INTO `COHORTE` (`ID_CARRERA`, `NUMERO`, `ANIO`)
     VALUES (4, 1, '2018-01-01');
     
INSERT INTO `COHORTE` (`ID_CARRERA`, `NUMERO`, `ANIO`)
     VALUES (4, 2, '2019-01-01');
     
INSERT INTO `COHORTE` (`ID_CARRERA`, `NUMERO`, `ANIO`)
     VALUES (4, 3, '2020-01-01');
     
INSERT INTO `COHORTE` (`ID_CARRERA`, `NUMERO`, `ANIO`)
     VALUES (4, 4, '2021-01-01');
     
INSERT INTO `COHORTE` (`ID_CARRERA`, `NUMERO`, `ANIO`)
     VALUES (4, 5, '2022-01-01');
     
INSERT INTO `COHORTE` (`ID_CARRERA`, `NUMERO`, `ANIO`)
     VALUES (4, 6, '2023-01-01');

-- Insert Materias

-- Insert TSDS
INSERT INTO `MATERIA` (`ID_MATERIA`, `ID_CARRERA`, `NOMBRE`, `ANIO`, `DESCRIPCION`)
     VALUES (1, 1, 'Ciudadanía y Espacio Público', 1, 'Descripcion de la materia');

INSERT INTO `MATERIA` (`ID_MATERIA`, `ID_CARRERA`, `NOMBRE`, `ANIO`, `DESCRIPCION`)
     VALUES (2, 1, 'Introducción a la informática', 1, 'Descripcion de la materia');

INSERT INTO `MATERIA` (`ID_MATERIA`, `ID_CARRERA`, `NOMBRE`, `ANIO`, `DESCRIPCION`)
     VALUES (3, 1, 'Introducción a Redes', 1, 'Descripcion de la materia');

INSERT INTO `MATERIA` (`ID_MATERIA`, `ID_CARRERA`, `NOMBRE`, `ANIO`, `DESCRIPCION`)
     VALUES (4, 1, 'Bases de datos I', 1, 'Descripcion de la materia');

INSERT INTO `MATERIA` (`ID_MATERIA`, `ID_CARRERA`, `NOMBRE`, `ANIO`, `DESCRIPCION`)
     VALUES (5, 1, 'Matemática I', 1, 'Descripcion de la materia');

INSERT INTO `MATERIA` (`ID_MATERIA`, `ID_CARRERA`, `NOMBRE`, `ANIO`, `DESCRIPCION`)
     VALUES (6, 1, 'Programación I', 1, 'Descripcion de la materia');

INSERT INTO `MATERIA` (`ID_MATERIA`, `ID_CARRERA`, `NOMBRE`, `ANIO`, `DESCRIPCION`)
     VALUES (7, 1, 'Inglés Técnico I', 1, 'Descripcion de la materia');

INSERT INTO `MATERIA` (`ID_MATERIA`, `ID_CARRERA`, `NOMBRE`, `ANIO`, `DESCRIPCION`)
     VALUES (8, 1, 'Estructura de datos y algoritmos', 1, 'Descripcion de la materia');

INSERT INTO `MATERIA` (`ID_MATERIA`, `ID_CARRERA`, `NOMBRE`, `ANIO`, `DESCRIPCION`)
     VALUES (9, 1, 'Taller de Programación I', 1, 'Descripcion de la materia');

INSERT INTO `MATERIA` (`ID_MATERIA`, `ID_CARRERA`, `NOMBRE`, `ANIO`, `DESCRIPCION`)
     VALUES (10, 1, 'Programación II', 2, 'Desarrollo de algoritmos avanzados');

INSERT INTO `MATERIA` (`ID_MATERIA`, `ID_CARRERA`, `NOMBRE`, `ANIO`, `DESCRIPCION`)
     VALUES (11, 1, 'Estadística Aplicada', 2, 'Descripcion de la materia');

INSERT INTO `MATERIA` (`ID_MATERIA`, `ID_CARRERA`, `NOMBRE`, `ANIO`, `DESCRIPCION`)
     VALUES (12, 1, 'Base de datos II', 2, 'Descripcion de la materia');

INSERT INTO `MATERIA` (`ID_MATERIA`, `ID_CARRERA`, `NOMBRE`, `ANIO`, `DESCRIPCION`)
     VALUES (13, 1,'Matematicas II', 2, 'Materia dedicada al análisis de soluciones computacionales mediante las matematicas');

INSERT INTO `MATERIA` (`ID_MATERIA`, `ID_CARRERA`, `NOMBRE`, `ANIO`, `DESCRIPCION`)
     VALUES (14, 1, 'Sistemas de Información Empresarial', 2, 'Descripcion de la materia');

INSERT INTO `MATERIA` (`ID_MATERIA`, `ID_CARRERA`, `NOMBRE`, `ANIO`, `DESCRIPCION`)
     VALUES (15, 1, 'Inglés Técnico II', 2, 'Descripcion de la materia');

INSERT INTO `MATERIA` (`ID_MATERIA`, `ID_CARRERA`, `NOMBRE`, `ANIO`, `DESCRIPCION`)
     VALUES (16, 1, 'Redes y Seguridad Informática', 2, 'Descripcion de la materia');

INSERT INTO `MATERIA` (`ID_MATERIA`, `ID_CARRERA`, `NOMBRE`, `ANIO`, `DESCRIPCION`)
     VALUES (17, 1, 'Análisis y Diseño de Sistemas', 2, 'Descripcion de la materia');

INSERT INTO `MATERIA` (`ID_MATERIA`, `ID_CARRERA`, `NOMBRE`, `ANIO`, `DESCRIPCION`)
     VALUES (18, 1, 'Laboratorio de Programacion II', 2, 'Dedicada a la practica de las soluciones computacionales propuestas');

INSERT INTO `MATERIA` (`ID_MATERIA`, `ID_CARRERA`, `NOMBRE`, `ANIO`, `DESCRIPCION`)
     VALUES (19, 1, 'Taller de Programación II', 2, 'Descripcion de la materia');

INSERT INTO `MATERIA` (`ID_MATERIA`, `ID_CARRERA`, `NOMBRE`, `ANIO`, `DESCRIPCION`)
     VALUES (20, 1, 'Emprendimientos Tecnológicos', 3, 'Descripcion de la materia');

INSERT INTO `MATERIA` (`ID_MATERIA`, `ID_CARRERA`, `NOMBRE`, `ANIO`, `DESCRIPCION`)
     VALUES (21, 1, 'Gestión de proyectos y Software de Calidad', 3, 'Descripcion de la materia');

INSERT INTO `MATERIA` (`ID_MATERIA`, `ID_CARRERA`, `NOMBRE`, `ANIO`, `DESCRIPCION`)
     VALUES (22, 1, 'Desarrollo empresarial', 3, 'Descripcion de la materia');

INSERT INTO `MATERIA` (`ID_MATERIA`, `ID_CARRERA`, `NOMBRE`, `ANIO`, `DESCRIPCION`)
     VALUES (23, 1, 'Programación III', 3, 'Descripcion de la materia');

INSERT INTO `MATERIA` (`ID_MATERIA`, `ID_CARRERA`, `NOMBRE`, `ANIO`, `DESCRIPCION`)
     VALUES (24, 1, 'Inglés Técnico III', 3, 'Descripcion de la materia');

INSERT INTO `MATERIA` (`ID_MATERIA`, `ID_CARRERA`, `NOMBRE`, `ANIO`, `DESCRIPCION`)
     VALUES (25, 1, 'Ética y Deontología Profesional', 3, 'Descripcion de la materia');

INSERT INTO `MATERIA` (`ID_MATERIA`, `ID_CARRERA`, `NOMBRE`, `ANIO`, `DESCRIPCION`)
     VALUES (26, 1, 'Legislación de software', 3, 'Descripcion de la materia');

INSERT INTO `MATERIA` (`ID_MATERIA`, `ID_CARRERA`, `NOMBRE`, `ANIO`, `DESCRIPCION`)
     VALUES (27, 1, 'Programación Avanzada', 3, 'Descripcion de la materia');

INSERT INTO `MATERIA` (`ID_MATERIA`, `ID_CARRERA`, `NOMBRE`, `ANIO`, `DESCRIPCION`)
     VALUES (28, 1, 'Taller de Programación III', 3, 'Descripcion de la materia');

-- Insert TSB
INSERT INTO `MATERIA`(`ID_MATERIA`, `ID_CARRERA`, `NOMBRE`, `ANIO`, `DESCRIPCION`)
     VALUES (29, 2, 'Matemática y Física Aplicada', 1, '');

INSERT INTO `MATERIA`(`ID_MATERIA`, `ID_CARRERA`, `NOMBRE`, `ANIO`, `DESCRIPCION`)
     VALUES (30, 2, 'Portugués Técnico', 1, '');

INSERT INTO `MATERIA`(`ID_MATERIA`, `ID_CARRERA`, `NOMBRE`, `ANIO`, `DESCRIPCION`)
     VALUES (31, 2, 'Química', 1, '');

INSERT INTO `MATERIA`(`ID_MATERIA`, `ID_CARRERA`, `NOMBRE`, `ANIO`, `DESCRIPCION`)
     VALUES (32, 2, 'Química Biológica', 1, '');

INSERT INTO `MATERIA`(`ID_MATERIA`, `ID_CARRERA`, `NOMBRE`, `ANIO`, `DESCRIPCION`)
     VALUES (33, 2, 'Agronomía', 1, '');

INSERT INTO `MATERIA`(`ID_MATERIA`, `ID_CARRERA`, `NOMBRE`, `ANIO`, `DESCRIPCION`)
     VALUES (34, 2, 'Mundo del trabajo', 1, '');

INSERT INTO `MATERIA`(`ID_MATERIA`, `ID_CARRERA`, `NOMBRE`, `ANIO`, `DESCRIPCION`)
     VALUES (35, 2, 'Microbiología', 1, '');

INSERT INTO `MATERIA`(`ID_MATERIA`, `ID_CARRERA`, `NOMBRE`, `ANIO`, `DESCRIPCION`)
     VALUES (36, 2, 'Seguridad Industrial', 1, '');

INSERT INTO `MATERIA`(`ID_MATERIA`, `ID_CARRERA`, `NOMBRE`, `ANIO`, `DESCRIPCION`)
     VALUES (37, 2, 'Termodinámica', 2, '');

INSERT INTO `MATERIA`(`ID_MATERIA`, `ID_CARRERA`, `NOMBRE`, `ANIO`, `DESCRIPCION`)
     VALUES (38, 2, 'Gestión Ambiental', 2, '');

INSERT INTO `MATERIA`(`ID_MATERIA`, `ID_CARRERA`, `NOMBRE`, `ANIO`, `DESCRIPCION`)
     VALUES (39, 2, 'Legislación', 2, '');

INSERT INTO `MATERIA`(`ID_MATERIA`, `ID_CARRERA`, `NOMBRE`, `ANIO`, `DESCRIPCION`)
     VALUES (40, 2, 'Mecánica Aplicada', 2, '');

INSERT INTO `MATERIA`(`ID_MATERIA`, `ID_CARRERA`, `NOMBRE`, `ANIO`, `DESCRIPCION`)
     VALUES (41, 2, 'Inglés Técnico', 2, '');

INSERT INTO `MATERIA`(`ID_MATERIA`, `ID_CARRERA`, `NOMBRE`, `ANIO`, `DESCRIPCION`)
     VALUES (42, 2, 'Electrotecnia', 2, '');

INSERT INTO `MATERIA`(`ID_MATERIA`, `ID_CARRERA`, `NOMBRE`, `ANIO`, `DESCRIPCION`)
     VALUES (43, 2, 'Uso Térmico y Producción de Energía Eléctrica', 2, '');

INSERT INTO `MATERIA`(`ID_MATERIA`, `ID_CARRERA`, `NOMBRE`, `ANIO`, `DESCRIPCION`)
     VALUES (44, 2, 'Práctica Profesionalizante I', 2, '');

INSERT INTO `MATERIA`(`ID_MATERIA`, `ID_CARRERA`, `NOMBRE`, `ANIO`, `DESCRIPCION`)
     VALUES (45, 2, 'Informática Aplicada', 3, '');

INSERT INTO `MATERIA`(`ID_MATERIA`, `ID_CARRERA`, `NOMBRE`, `ANIO`, `DESCRIPCION`)
     VALUES (46, 2, 'Innovación y Desarrollo Tecnológico', 3, '');

INSERT INTO `MATERIA`(`ID_MATERIA`, `ID_CARRERA`, `NOMBRE`, `ANIO`, `DESCRIPCION`)
     VALUES (47, 2, 'Bioetanol', 3, '');

INSERT INTO `MATERIA`(`ID_MATERIA`, `ID_CARRERA`, `NOMBRE`, `ANIO`, `DESCRIPCION`)
     VALUES (48, 2, 'Biogas', 3, '');
     
INSERT INTO `MATERIA`(`ID_MATERIA`, `ID_CARRERA`, `NOMBRE`, `ANIO`, `DESCRIPCION`)
     VALUES (49, 2, 'Biodiesel', 3, '');

INSERT INTO `MATERIA`(`ID_MATERIA`, `ID_CARRERA`, `NOMBRE`, `ANIO`, `DESCRIPCION`)
     VALUES (50, 2, 'Biorefineria', 3, '');

INSERT INTO `MATERIA`(`ID_MATERIA`, `ID_CARRERA`, `NOMBRE`, `ANIO`, `DESCRIPCION`)
     VALUES (51, 2, 'Práctica Profesionalizante II', 3, '');

-- Insert TSGA
INSERT INTO `MATERIA`(`ID_MATERIA`, `ID_CARRERA`, `NOMBRE`, `ANIO`, `DESCRIPCION`)
     VALUES (52, 3, 'Matemáticas', 1, '');

INSERT INTO `MATERIA`(`ID_MATERIA`, `ID_CARRERA`, `NOMBRE`, `ANIO`, `DESCRIPCION`)
     VALUES (53, 3, 'Biología', 1, '');

INSERT INTO `MATERIA`(`ID_MATERIA`, `ID_CARRERA`, `NOMBRE`, `ANIO`, `DESCRIPCION`)
     VALUES (54, 3, 'Física', 1, '');

INSERT INTO `MATERIA`(`ID_MATERIA`, `ID_CARRERA`, `NOMBRE`, `ANIO`, `DESCRIPCION`)
     VALUES (55, 3, 'Ambiente y Sociedad', 1, '');

INSERT INTO `MATERIA`(`ID_MATERIA`, `ID_CARRERA`, `NOMBRE`, `ANIO`, `DESCRIPCION`)
     VALUES (56, 3, 'Estadística Aplicada', 1, '');

INSERT INTO `MATERIA`(`ID_MATERIA`, `ID_CARRERA`, `NOMBRE`, `ANIO`, `DESCRIPCION`)
     VALUES (57, 3, 'Tecnologías de la Información y la comunicación', 1, '');

INSERT INTO `MATERIA`(`ID_MATERIA`, `ID_CARRERA`, `NOMBRE`, `ANIO`, `DESCRIPCION`)
     VALUES (58, 3, 'Quimica General e Inorgánica', 1, '');

INSERT INTO `MATERIA`(`ID_MATERIA`, `ID_CARRERA`, `NOMBRE`, `ANIO`, `DESCRIPCION`)
     VALUES (59, 3, 'Inglés', 1, '');
     
INSERT INTO `MATERIA`(`ID_MATERIA`, `ID_CARRERA`, `NOMBRE`, `ANIO`, `DESCRIPCION`)
     VALUES (60, 3, 'Ecología', 1, '');
     
INSERT INTO `MATERIA`(`ID_MATERIA`, `ID_CARRERA`, `NOMBRE`, `ANIO`, `DESCRIPCION`)
     VALUES (61, 3, 'Eficiencia Energética y Desarrollo', 1, '');

INSERT INTO `MATERIA`(`ID_MATERIA`, `ID_CARRERA`, `NOMBRE`, `ANIO`, `DESCRIPCION`)
     VALUES (62, 3, 'Prácticas profesionalizantes I', 1, '');

INSERT INTO `MATERIA`(`ID_MATERIA`, `ID_CARRERA`, `NOMBRE`, `ANIO`, `DESCRIPCION`)
     VALUES (63, 3, 'Sociología de las Organizaciones', 2, '');

INSERT INTO `MATERIA`(`ID_MATERIA`, `ID_CARRERA`, `NOMBRE`, `ANIO`, `DESCRIPCION`)
     VALUES (64, 3, 'Química Orgánica y Biológica', 2, '');

INSERT INTO `MATERIA`(`ID_MATERIA`, `ID_CARRERA`, `NOMBRE`, `ANIO`, `DESCRIPCION`)
     VALUES (65, 3, 'Geología e Hidrología', 2, '');

INSERT INTO `MATERIA`(`ID_MATERIA`, `ID_CARRERA`, `NOMBRE`, `ANIO`, `DESCRIPCION`)
     VALUES (66, 3, 'Ecología Urbana y Rural', 2, '');

INSERT INTO `MATERIA`(`ID_MATERIA`, `ID_CARRERA`, `NOMBRE`, `ANIO`, `DESCRIPCION`)
     VALUES (67, 3, 'Derecho Ambiental', 2, '');

INSERT INTO `MATERIA`(`ID_MATERIA`, `ID_CARRERA`, `NOMBRE`, `ANIO`, `DESCRIPCION`)
     VALUES (68, 3, 'Metodología de la Investigación Científica', 2, '');

INSERT INTO `MATERIA`(`ID_MATERIA`, `ID_CARRERA`, `NOMBRE`, `ANIO`, `DESCRIPCION`)
     VALUES (69, 3, 'Climatología', 2, '');

INSERT INTO `MATERIA`(`ID_MATERIA`, `ID_CARRERA`, `NOMBRE`, `ANIO`, `DESCRIPCION`)
     VALUES (70, 3, 'Química Ambiental', 2, '');

INSERT INTO `MATERIA`(`ID_MATERIA`, `ID_CARRERA`, `NOMBRE`, `ANIO`, `DESCRIPCION`)
     VALUES (71, 3, 'Sistemas de Gestión Ambiental', 2, '');

INSERT INTO `MATERIA`(`ID_MATERIA`, `ID_CARRERA`, `NOMBRE`, `ANIO`, `DESCRIPCION`)
     VALUES (72, 3, 'Prácticas Profesionalizantes II', 2, '');

INSERT INTO `MATERIA`(`ID_MATERIA`, `ID_CARRERA`, `NOMBRE`, `ANIO`, `DESCRIPCION`)
     VALUES (73, 3, 'Ordenamiento Territorial', 3, '');

INSERT INTO `MATERIA`(`ID_MATERIA`, `ID_CARRERA`, `NOMBRE`, `ANIO`, `DESCRIPCION`)
     VALUES (74, 3, 'Gestión y Administración Ambiental', 3, '');

INSERT INTO `MATERIA`(`ID_MATERIA`, `ID_CARRERA`, `NOMBRE`, `ANIO`, `DESCRIPCION`)
     VALUES (75, 3, 'Seguridad y Salud Laboral', 3, '');

INSERT INTO `MATERIA`(`ID_MATERIA`, `ID_CARRERA`, `NOMBRE`, `ANIO`, `DESCRIPCION`)
     VALUES (76, 3, 'Seguridad Ambiental', 3, '');

INSERT INTO `MATERIA`(`ID_MATERIA`, `ID_CARRERA`, `NOMBRE`, `ANIO`, `DESCRIPCION`)
     VALUES (77, 3, 'Educación y Comunicación Ambiental', 3, '');

INSERT INTO `MATERIA`(`ID_MATERIA`, `ID_CARRERA`, `NOMBRE`, `ANIO`, `DESCRIPCION`)
     VALUES (78, 3, 'Economía Ambiental', 3, '');

INSERT INTO `MATERIA`(`ID_MATERIA`, `ID_CARRERA`, `NOMBRE`, `ANIO`, `DESCRIPCION`)
     VALUES (79, 3, 'Ética y Deontología Profesional', 3, '');

INSERT INTO `MATERIA`(`ID_MATERIA`, `ID_CARRERA`, `NOMBRE`, `ANIO`, `DESCRIPCION`)
     VALUES (80, 3, 'Estadística Aplicada', 3, '');

INSERT INTO `MATERIA`(`ID_MATERIA`, `ID_CARRERA`, `NOMBRE`, `ANIO`, `DESCRIPCION`)
     VALUES (81, 3, 'Toxicología Ambiental', 3, '');

INSERT INTO `MATERIA`(`ID_MATERIA`, `ID_CARRERA`, `NOMBRE`, `ANIO`, `DESCRIPCION`)
     VALUES (82, 3, 'Estudio y Evaluación Ambiental', 3, '');

INSERT INTO `MATERIA`(`ID_MATERIA`, `ID_CARRERA`, `NOMBRE`, `ANIO`, `DESCRIPCION`)
     VALUES (83, 3, 'Practicas profesionalizantes III', 3, '');

-- Insert TSARI
INSERT INTO `MATERIA`(`ID_MATERIA`, `ID_CARRERA`, `NOMBRE`, `ANIO`, `DESCRIPCION`)
     VALUES (84, 4, 'Sistemas de Representación', 1, '');

INSERT INTO `MATERIA`(`ID_MATERIA`, `ID_CARRERA`, `NOMBRE`, `ANIO`, `DESCRIPCION`)
     VALUES (85, 4, 'Matemática', 1, '');

INSERT INTO `MATERIA`(`ID_MATERIA`, `ID_CARRERA`, `NOMBRE`, `ANIO`, `DESCRIPCION`)
     VALUES (86, 4, 'Física', 1, '');

INSERT INTO `MATERIA`(`ID_MATERIA`, `ID_CARRERA`, `NOMBRE`, `ANIO`, `DESCRIPCION`)
     VALUES (87, 4, 'Herramientas informáticas', 1, '');

INSERT INTO `MATERIA`(`ID_MATERIA`, `ID_CARRERA`, `NOMBRE`, `ANIO`, `DESCRIPCION`)
     VALUES (88, 4, 'Tecnología de los Materiales', 1, '');

INSERT INTO `MATERIA`(`ID_MATERIA`, `ID_CARRERA`, `NOMBRE`, `ANIO`, `DESCRIPCION`)
     VALUES (89, 4, 'Mecánica I', 1, '');

INSERT INTO `MATERIA`(`ID_MATERIA`, `ID_CARRERA`, `NOMBRE`, `ANIO`, `DESCRIPCION`)
     VALUES (90, 4, 'Máquinas y Herramientas Básicas', 1, '');

INSERT INTO `MATERIA`(`ID_MATERIA`, `ID_CARRERA`, `NOMBRE`, `ANIO`, `DESCRIPCION`)
     VALUES (91, 4, 'Laboratorio de Mecánica', 1, '');

INSERT INTO `MATERIA`(`ID_MATERIA`, `ID_CARRERA`, `NOMBRE`, `ANIO`, `DESCRIPCION`)
     VALUES (92, 4, 'Inglés Técnico I', 1, '');

INSERT INTO `MATERIA`(`ID_MATERIA`, `ID_CARRERA`, `NOMBRE`, `ANIO`, `DESCRIPCION`)
     VALUES (93, 4, 'Prácticas Profesionalizantes I', 1, '');

INSERT INTO `MATERIA`(`ID_MATERIA`, `ID_CARRERA`, `NOMBRE`, `ANIO`, `DESCRIPCION`)
     VALUES (94, 4, 'Formulación y Evaluación de Proyectos', 2, '');

INSERT INTO `MATERIA`(`ID_MATERIA`, `ID_CARRERA`, `NOMBRE`, `ANIO`, `DESCRIPCION`)
     VALUES (95, 4, 'Electrotecnia I', 2, '');

INSERT INTO `MATERIA`(`ID_MATERIA`, `ID_CARRERA`, `NOMBRE`, `ANIO`, `DESCRIPCION`)
     VALUES (96, 4, 'Seguridad e Higiene en el Trabajo', 2, '');

INSERT INTO `MATERIA`(`ID_MATERIA`, `ID_CARRERA`, `NOMBRE`, `ANIO`, `DESCRIPCION`)
     VALUES (97, 4, 'Inglés Técnico II', 2, '');

INSERT INTO `MATERIA`(`ID_MATERIA`, `ID_CARRERA`, `NOMBRE`, `ANIO`, `DESCRIPCION`)
     VALUES (98, 4, 'Electrónica y Sistemas Digitales', 2, '');

INSERT INTO `MATERIA`(`ID_MATERIA`, `ID_CARRERA`, `NOMBRE`, `ANIO`, `DESCRIPCION`)
     VALUES (99, 4, 'Sistemas de Control', 2, '');

INSERT INTO `MATERIA`(`ID_MATERIA`, `ID_CARRERA`, `NOMBRE`, `ANIO`, `DESCRIPCION`)
     VALUES (100, 4, 'Materia', 2, '');

INSERT INTO `MATERIA`(`ID_MATERIA`, `ID_CARRERA`, `NOMBRE`, `ANIO`, `DESCRIPCION`)
     VALUES (101, 4, 'Herramientas Informáticas II', 2, '');

INSERT INTO `MATERIA`(`ID_MATERIA`, `ID_CARRERA`, `NOMBRE`, `ANIO`, `DESCRIPCION`)
     VALUES (102, 4, 'Mecánica II', 2, '');

INSERT INTO `MATERIA`(`ID_MATERIA`, `ID_CARRERA`, `NOMBRE`, `ANIO`, `DESCRIPCION`)
     VALUES (103, 4, 'Robótica I', 2, '');

INSERT INTO `MATERIA`(`ID_MATERIA`, `ID_CARRERA`, `NOMBRE`, `ANIO`, `DESCRIPCION`)
     VALUES (104, 4, 'Prácticas Profesionalizantes II', 2, '');

INSERT INTO `MATERIA`(`ID_MATERIA`, `ID_CARRERA`, `NOMBRE`, `ANIO`, `DESCRIPCION`)
     VALUES (105, 4, 'Derecho Laboral', 3, '');

INSERT INTO `MATERIA`(`ID_MATERIA`, `ID_CARRERA`, `NOMBRE`, `ANIO`, `DESCRIPCION`)
     VALUES (106, 4, 'Sensores y Actuadores', 3, '');

INSERT INTO `MATERIA`(`ID_MATERIA`, `ID_CARRERA`, `NOMBRE`, `ANIO`, `DESCRIPCION`)
     VALUES (107, 4, 'Microcontroladores y PCL', 3, '');

INSERT INTO `MATERIA`(`ID_MATERIA`, `ID_CARRERA`, `NOMBRE`, `ANIO`, `DESCRIPCION`)
     VALUES (108, 4, 'Hidráulica', 3, '');

INSERT INTO `MATERIA`(`ID_MATERIA`, `ID_CARRERA`, `NOMBRE`, `ANIO`, `DESCRIPCION`)
     VALUES (109, 4, 'Neumática', 3, '');

INSERT INTO `MATERIA`(`ID_MATERIA`, `ID_CARRERA`, `NOMBRE`, `ANIO`, `DESCRIPCION`)
     VALUES (110, 4, 'Organización y Marketing de Talleres', 3, '');

INSERT INTO `MATERIA`(`ID_MATERIA`, `ID_CARRERA`, `NOMBRE`, `ANIO`, `DESCRIPCION`)
     VALUES (111, 4, 'Electrotecnia II', 3, '');

INSERT INTO `MATERIA`(`ID_MATERIA`, `ID_CARRERA`, `NOMBRE`, `ANIO`, `DESCRIPCION`)
     VALUES (112, 4, 'Laboratorio de Microprocesadores', 3, '');

INSERT INTO `MATERIA`(`ID_MATERIA`, `ID_CARRERA`, `NOMBRE`, `ANIO`, `DESCRIPCION`)
     VALUES (113, 4, 'Robótica II', 3, '');

INSERT INTO `MATERIA`(`ID_MATERIA`, `ID_CARRERA`, `NOMBRE`, `ANIO`, `DESCRIPCION`)
     VALUES (114, 4, 'Prácticas Profesionalizantes III', 3, '');

-- Insert Administrativos

INSERT INTO `ADMINISTRATIVO` (`LEGAJO_ADM`, `DNI`, `NOMBRE`, `APELLIDO`, `ROL_ADMINISTRATIVO`, `USUARIO`, `CONTRASENIA`, `DOMICILIO`, `NRO_DOMICILIO`, `CELULAR`, `FOTO_ADM`, `FECHA_INSC`)
     VALUES ('TSDS-19-1-A', 1, 'Rosana', 'Salomon', 1, 'rsaolomon@iset.com.ar', 1, 'calle', 123, 38100001, '.\\img_profile\\perfil.png', '2023-07-18 18:05:10');

INSERT INTO `ADMINISTRATIVO` (`LEGAJO_ADM`, `DNI`, `NOMBRE`, `APELLIDO`, `ROL_ADMINISTRATIVO`, `USUARIO`, `CONTRASENIA`, `DOMICILIO`, `NRO_DOMICILIO`, `CELULAR`, `FOTO_ADM`, `FECHA_INSC`)
     VALUES ('TSDS-19-2-A', 2, 'Paula', 'Vázquez', 1, 'pvazquez@iset.com.ar', 1, 'calle', 123, 38100001, '.\\img_profile\\perfil.png', '2023-07-18 18:05:10');

INSERT INTO `ADMINISTRATIVO` (`LEGAJO_ADM`, `DNI`, `NOMBRE`, `APELLIDO`, `ROL_ADMINISTRATIVO`, `USUARIO`, `CONTRASENIA`, `DOMICILIO`, `NRO_DOMICILIO`, `CELULAR`, `FOTO_ADM`, `FECHA_INSC`)
     VALUES ('TSDS-19-3-A', 3, 'Celia', 'Valenzuela', 1, 'cvalenzuela@iset.com.ar', 1, 'calle', 123, 38100001, '.\\img_profile\\perfil.png', '2023-07-18 18:05:10');

INSERT INTO `ADMINISTRATIVO` (`LEGAJO_ADM`, `DNI`, `NOMBRE`, `APELLIDO`, `ROL_ADMINISTRATIVO`, `USUARIO`, `CONTRASENIA`, `DOMICILIO`, `NRO_DOMICILIO`, `CELULAR`, `FOTO_ADM`, `FECHA_INSC`)
     VALUES ('TSDS-19-4-A', 4, 'Pablo', 'Zelaya', 1, 'pzelaya@iset.com.ar', 1, 'calle', 123, 38100001, '.\\img_profile\\perfil.png', '2023-07-18 18:05:10');

-- Insert Docentes

INSERT INTO `DOCENTE` (`DNI`, `NOMBRE`, `APELLIDO`, `ROL_DOCENTE`, `USUARIO`, `CONTRASENIA`, `DOMICILIO`, `NRO_DOMICILIO`, `CELULAR`, `RED_FACEBOOK`, `RED_INSTAGRAM`, `RED_TWITTER`, `FOTO_DOC`)
     VALUES (1, 'Oscar', 'Niemeyer', 2, 'oniemeyer@iset.com.ar', 0, 'calle', 123, 38100001, 'https://www.facebook.com/us', 'https://www.instagram.com/us', 'https://www.instagram.com/us', '.\\img_profile\\perfil.png');

INSERT INTO `DOCENTE` (`DNI`, `NOMBRE`, `APELLIDO`, `ROL_DOCENTE`, `USUARIO`, `CONTRASENIA`, `DOMICILIO`, `NRO_DOMICILIO`, `CELULAR`, `RED_FACEBOOK`, `RED_INSTAGRAM`, `RED_TWITTER`, `FOTO_DOC`)
     VALUES (2, 'María', 'Costilla', 2, 'mcostilla@iset.com.ar', 0, 'calle', 123, 38100001, NULL, NULL, NULL, '.\\img_profile\\perfil.png');

INSERT INTO `DOCENTE` (`DNI`, `NOMBRE`, `APELLIDO`, `ROL_DOCENTE`, `USUARIO`, `CONTRASENIA`, `DOMICILIO`, `NRO_DOMICILIO`, `CELULAR`, `RED_FACEBOOK`, `RED_INSTAGRAM`, `RED_TWITTER`, `FOTO_DOC`)
     VALUES (3, 'Buckminster', 'Fuller', 2, 'bfuller@iset.com.ar', 0, 'calle', 123, 38100001, NULL, NULL, NULL, '.\\img_profile\\perfil.png');

INSERT INTO `DOCENTE` (`DNI`, `NOMBRE`, `APELLIDO`, `ROL_DOCENTE`, `USUARIO`, `CONTRASENIA`, `DOMICILIO`, `NRO_DOMICILIO`, `CELULAR`, `RED_FACEBOOK`, `RED_INSTAGRAM`, `RED_TWITTER`, `FOTO_DOC`)
     VALUES (4, 'Santiago', 'Calatrava', 2, 'scalatrava@iset.com.ar', 0, 'calle', 123, 38100001, NULL, NULL, NULL, '.\\img_profile\\perfil.png');

INSERT INTO `DOCENTE` (`DNI`, `NOMBRE`, `APELLIDO`, `ROL_DOCENTE`, `USUARIO`, `CONTRASENIA`, `DOMICILIO`, `NRO_DOMICILIO`, `CELULAR`, `RED_FACEBOOK`, `RED_INSTAGRAM`, `RED_TWITTER`, `FOTO_DOC`)
     VALUES (5, 'Diego', 'Figueroa', 2, 'dfigueroa@iset.com.ar', 0, 'calle', 123, 38100001, NULL, NULL, NULL, '.\\img_profile\\perfil.png');

INSERT INTO `DOCENTE` (`DNI`, `NOMBRE`, `APELLIDO`, `ROL_DOCENTE`, `USUARIO`, `CONTRASENIA`, `DOMICILIO`, `NRO_DOMICILIO`, `CELULAR`, `RED_FACEBOOK`, `RED_INSTAGRAM`, `RED_TWITTER`, `FOTO_DOC`)
     VALUES (6, 'Jorge', 'Leiva', 2, 'jleiva@iset.com.ar', 0, 'calle', 123, 38100001, NULL, NULL, NULL, '.\\img_profile\\perfil.png');

INSERT INTO `DOCENTE` (`DNI`, `NOMBRE`, `APELLIDO`, `ROL_DOCENTE`, `USUARIO`, `CONTRASENIA`, `DOMICILIO`, `NRO_DOMICILIO`, `CELULAR`, `RED_FACEBOOK`, `RED_INSTAGRAM`, `RED_TWITTER`, `FOTO_DOC`)
     VALUES (7, 'Viktor', 'Frankenstein', 2, 'vfrankenstein@iset.com.ar', 0, 'calle', 123, 38100001, NULL, NULL, NULL, '.\\img_profile\\perfil.png');

-- Insert Legajo Docente
     
INSERT INTO `LEGAJO_DOCENTE` (`DNI`, `LEGAJO_DOC`, `CARRERA`, `FECHA_INSCRIPCION`)
     VALUES (1, 'TSDS-19-001-DC', 1, '2023-07-18 18:05:10');
     
INSERT INTO `LEGAJO_DOCENTE` (`DNI`, `LEGAJO_DOC`, `CARRERA`, `FECHA_INSCRIPCION`)
     VALUES (2, 'TSDS-19-002-DC', 1, '2023-07-18 18:05:10');
     
INSERT INTO `LEGAJO_DOCENTE` (`DNI`, `LEGAJO_DOC`, `CARRERA`, `FECHA_INSCRIPCION`)
     VALUES (3, 'TSDS-19-003-DC', 1, '2023-07-18 18:05:10');
     
INSERT INTO `LEGAJO_DOCENTE` (`DNI`, `LEGAJO_DOC`, `CARRERA`, `FECHA_INSCRIPCION`)
     VALUES (4, 'TSDS-19-004-DC', 1, '2023-07-18 18:05:10');
     
INSERT INTO `LEGAJO_DOCENTE` (`DNI`, `LEGAJO_DOC`, `CARRERA`, `FECHA_INSCRIPCION`)
     VALUES (5, 'TSDS-19-005-DC', 1, '2023-07-18 18:05:10');
     
INSERT INTO `LEGAJO_DOCENTE` (`DNI`, `LEGAJO_DOC`, `CARRERA`, `FECHA_INSCRIPCION`)
     VALUES (6, 'TSDS-19-006-DC', 1, '2023-07-18 18:05:10');
     
INSERT INTO `LEGAJO_DOCENTE` (`DNI`, `LEGAJO_DOC`, `CARRERA`, `FECHA_INSCRIPCION`)
     VALUES (7, 'TSDS-19-007-DC', 1, '2023-07-18 18:05:10');

-- Insert Alumnos

INSERT INTO `ALUMNO` (`DNI`, `NOMBRE`, `APELLIDO`, `ROL_ALUMNO`, `USUARIO`, `CONTRASENIA`, `DOMICILIO`, `NRO_DOMICILIO`, `CELULAR`, `RED_FACEBOOK`, `RED_INSTAGRAM`, `RED_TWITTER`, `FOTO_ALU`)
     VALUES (1, 'Lourdes', 'La Fuente', 3, 'llafuente@iset.com.ar', 0, 'calle', 123, 38100001, 'https://www.facebook.com/usuario', 'https://www.instagram.com/usuario', 'https://www.instagram.com/usuario', '.\\img_profile\\perfil.png');
     
INSERT INTO `ALUMNO` (`DNI`, `NOMBRE`, `APELLIDO`, `ROL_ALUMNO`, `USUARIO`, `CONTRASENIA`, `DOMICILIO`, `NRO_DOMICILIO`, `CELULAR`, `RED_FACEBOOK`, `RED_INSTAGRAM`, `RED_TWITTER`, `FOTO_ALU`)
     VALUES (2, 'Ignacio', 'Llorente', 3, 'illorente@iset.com.ar', 0, 'calle', 123, 38100001, NULL, NULL, NULL, '.\\img_profile\\perfil.png');

INSERT INTO `ALUMNO` (`DNI`, `NOMBRE`, `APELLIDO`, `ROL_ALUMNO`, `USUARIO`, `CONTRASENIA`, `DOMICILIO`, `NRO_DOMICILIO`, `CELULAR`, `RED_FACEBOOK`, `RED_INSTAGRAM`, `RED_TWITTER`, `FOTO_ALU`)
     VALUES (3, 'Lucas', 'Villagran', 3, 'lvillagran@iset.com.ar', 0, 'calle', 123, 38100001, NULL, NULL, NULL, '.\\img_profile\\perfil.png');

INSERT INTO `ALUMNO` (`DNI`, `NOMBRE`, `APELLIDO`, `ROL_ALUMNO`, `USUARIO`, `CONTRASENIA`, `DOMICILIO`, `NRO_DOMICILIO`, `CELULAR`, `RED_FACEBOOK`, `RED_INSTAGRAM`, `RED_TWITTER`, `FOTO_ALU`)
     VALUES (4, 'David', 'Carrazana', 3, 'dcarrazana@iset.com.ar', 0, 'calle', 123, 38100001, NULL, NULL, NULL, '.\\img_profile\\perfil.png');

INSERT INTO `ALUMNO` (`DNI`, `NOMBRE`, `APELLIDO`, `ROL_ALUMNO`, `USUARIO`, `CONTRASENIA`, `DOMICILIO`, `NRO_DOMICILIO`, `CELULAR`, `RED_FACEBOOK`, `RED_INSTAGRAM`, `RED_TWITTER`, `FOTO_ALU`)
     VALUES (5, 'Ariel', 'Kasiañuk', 3, 'akasiañuk@iset.com.ar', 0, 'calle', 123, 38100001, NULL, NULL, NULL, '.\\img_profile\\perfil.png');

INSERT INTO `ALUMNO` (`DNI`, `NOMBRE`, `APELLIDO`, `ROL_ALUMNO`, `USUARIO`, `CONTRASENIA`, `DOMICILIO`, `NRO_DOMICILIO`, `CELULAR`, `RED_FACEBOOK`, `RED_INSTAGRAM`, `RED_TWITTER`, `FOTO_ALU`)
     VALUES (6, 'Carlos', 'Namen', 3, 'cnamen@iset.com.ar', 0, 'calle', 123, 38100001, NULL, NULL, NULL, '.\\img_profile\\perfil.png');

INSERT INTO `ALUMNO` (`DNI`, `NOMBRE`, `APELLIDO`, `ROL_ALUMNO`, `USUARIO`, `CONTRASENIA`, `DOMICILIO`, `NRO_DOMICILIO`, `CELULAR`, `RED_FACEBOOK`, `RED_INSTAGRAM`, `RED_TWITTER`, `FOTO_ALU`)
     VALUES (7, 'Ramon', 'Gutierrez', 3, 'rgutierrez@iset.com.ar', 0, 'calle', 123, 38100001, NULL, NULL, NULL, '.\\img_profile\\perfil.png');

INSERT INTO `ALUMNO` (`DNI`, `NOMBRE`, `APELLIDO`, `ROL_ALUMNO`, `USUARIO`, `CONTRASENIA`, `DOMICILIO`, `NRO_DOMICILIO`, `CELULAR`, `RED_FACEBOOK`, `RED_INSTAGRAM`, `RED_TWITTER`, `FOTO_ALU`)
     VALUES (8, 'Ricardo', 'Xxxx', 3, 'rxxxx@iset.com.ar', 0, 'calle', 123, 38100001, NULL, NULL, NULL, '.\\img_profile\\perfil.png');

INSERT INTO `ALUMNO` (`DNI`, `NOMBRE`, `APELLIDO`, `ROL_ALUMNO`, `USUARIO`, `CONTRASENIA`, `DOMICILIO`, `NRO_DOMICILIO`, `CELULAR`, `RED_FACEBOOK`, `RED_INSTAGRAM`, `RED_TWITTER`, `FOTO_ALU`)
     VALUES (9, 'Norma', ' Xxxx', 3, 'nxxxx@iset.com.ar', 0, 'calle', 123, 38100001, NULL, NULL, NULL, '.\\img_profile\\perfil.png');

-- Insert Legajo Alumno

INSERT INTO `LEGAJO_ALUMNO` (`DNI`, `LEGAJO_ALU`, `CARRERA`, `COHORTE`, `FECHA_INSCRIPCION`)
     VALUES (1, 'TSDS-19-001-AL', 1, 2, '2023-07-18 18:05:10');
     
INSERT INTO `LEGAJO_ALUMNO` (`DNI`, `LEGAJO_ALU`, `CARRERA`, `COHORTE`, `FECHA_INSCRIPCION`)
     VALUES (2, 'TSDS-19-002-AL', 1, 2, '2023-07-18 18:05:10');
     
INSERT INTO `LEGAJO_ALUMNO` (`DNI`, `LEGAJO_ALU`, `CARRERA`, `COHORTE`, `FECHA_INSCRIPCION`)
     VALUES (3, 'TSDS-19-003-AL', 1, 2, '2023-07-18 18:05:10');
     
INSERT INTO `LEGAJO_ALUMNO` (`DNI`, `LEGAJO_ALU`, `CARRERA`, `COHORTE`, `FECHA_INSCRIPCION`)
     VALUES (4, 'TSDS-19-004-AL', 1, 2, '2023-07-18 18:05:10');

INSERT INTO `LEGAJO_ALUMNO` (`DNI`, `LEGAJO_ALU`, `CARRERA`, `COHORTE`, `FECHA_INSCRIPCION`)
     VALUES (5, 'TSDS-19-005-AL', 1, 2, '2023-07-18 18:05:10');
     
INSERT INTO `LEGAJO_ALUMNO` (`DNI`, `LEGAJO_ALU`, `CARRERA`, `COHORTE`, `FECHA_INSCRIPCION`)
     VALUES (6, 'TSDS-19-006-AL', 1, 2, '2023-07-18 18:05:10');

INSERT INTO `LEGAJO_ALUMNO` (`DNI`, `LEGAJO_ALU`, `CARRERA`, `COHORTE`, `FECHA_INSCRIPCION`)
     VALUES (7, 'TSDS-19-007-AL', 1, 2, '2023-07-18 18:05:10');
     
INSERT INTO `LEGAJO_ALUMNO` (`DNI`, `LEGAJO_ALU`, `CARRERA`, `COHORTE`, `FECHA_INSCRIPCION`)
     VALUES (8, 'TSDS-19-008-AL', 1, 2, '2023-07-18 18:05:10');
     
INSERT INTO `LEGAJO_ALUMNO` (`DNI`, `LEGAJO_ALU`, `CARRERA`, `COHORTE`, `FECHA_INSCRIPCION`)
     VALUES (9, 'TSDS-19-009-AL', 1, 2, '2023-07-18 18:05:10');

--
-- Volcado de datos para la tabla cursa
--

INSERT INTO `CURSA` (`ID_CURSADO`, `ID_MATERIA`, `ID_ALUMNO`, `FECHA`, `CICLO`, `1ER_PARCIAL`, `2DO_PARCIAL`, `FINAL`, `ESTADO`) VALUES
(1, 1, 'TSDS-19-001-AL', CURRENT_TIMESTAMP, 2023, 7, 7, 7, 'Promocion'),
(2, 2, 'TSDS-19-001-AL', CURRENT_TIMESTAMP, 2023, 7, 9, 8, 'Promocion'),
(3, 3, 'TSDS-19-001-AL', CURRENT_TIMESTAMP, 2023, 4, 4, 6, 'Aprobado'),
(4, 4, 'TSDS-19-001-AL', CURRENT_TIMESTAMP, 2023, 8, 8, 8, 'Promocion'),
(5, 5, 'TSDS-19-001-AL', CURRENT_TIMESTAMP, 2023, 10, 5, 10, 'Aprobado'),
(6, 6, 'TSDS-19-001-AL', CURRENT_TIMESTAMP, 2023, 9, 10, 10, 'Promocion'),
(7, 7, 'TSDS-19-001-AL', CURRENT_TIMESTAMP, 2023, 8, 8, 9, 'Aprobado'),
(8, 8, 'TSDS-19-001-AL', CURRENT_TIMESTAMP, 2023, 8, 8, 9, 'Aprobado'),
(9, 9, 'TSDS-19-001-AL', CURRENT_TIMESTAMP, 2023, 8, 7, 8, 'Aprobado'),
(10, 10, 'TSDS-19-001-AL', CURRENT_TIMESTAMP, 2023, 10, 10, 10, 'Aprobado'),
(11, 11, 'TSDS-19-001-AL', CURRENT_TIMESTAMP, 2023, -1, -1, -1, 'Sin Datos'),
(12, 12, 'TSDS-19-001-AL', CURRENT_TIMESTAMP, 2023, -1, -1, -1, 'Sin Datos'),
(13, 13, 'TSDS-19-001-AL', CURRENT_TIMESTAMP, 2023, -1, -1, -1, 'Sin Datos'),
(14, 14, 'TSDS-19-001-AL', CURRENT_TIMESTAMP, 2023, -1, -1, -1, 'Sin Datos'),
(15, 15, 'TSDS-19-001-AL', CURRENT_TIMESTAMP, 2023, -1, -1, -1, 'Sin Datos'),
(16, 16, 'TSDS-19-001-AL', CURRENT_TIMESTAMP, 2023, -1, -1, -1, 'Sin Datos'),
(17, 17, 'TSDS-19-001-AL', CURRENT_TIMESTAMP, 2023, -1, -1, -1, 'Sin Datos'),
(18, 18, 'TSDS-19-001-AL', CURRENT_TIMESTAMP, 2023, -1, -1, -1, 'Sin Datos'),
(19, 19, 'TSDS-19-001-AL', CURRENT_TIMESTAMP, 2023, -1, -1, -1, 'Sin Datos'),
(20, 20, 'TSDS-19-001-AL', CURRENT_TIMESTAMP, 2023, -1, -1, -1, 'Sin Datos'),
(21, 21, 'TSDS-19-001-AL', CURRENT_TIMESTAMP, 2023, -1, -1, -1, 'Sin Datos'),
(22, 22, 'TSDS-19-001-AL', CURRENT_TIMESTAMP, 2023, -1, -1, -1, 'Sin Datos'),
(23, 23, 'TSDS-19-001-AL', CURRENT_TIMESTAMP, 2023, -1, -1, -1, 'Sin Datos'),
(24, 24, 'TSDS-19-001-AL', CURRENT_TIMESTAMP, 2023, -1, -1, -1, 'Sin Datos'),
(25, 25, 'TSDS-19-001-AL', CURRENT_TIMESTAMP, 2023, -1, -1, -1, 'Sin Datos'),
(26, 26, 'TSDS-19-001-AL', CURRENT_TIMESTAMP, 2023, -1, -1, -1, 'Sin Datos'),
(27, 27, 'TSDS-19-001-AL', CURRENT_TIMESTAMP, 2023, -1, -1, -1, 'Sin Datos');

--
-- Volcado de datos para la tabla examen_final
--

-- En esta vista se reemplazo el campo "MATERIA" por "ID_MATERIA", al igual que en nota, se agregó
-- un guion bajo, para separar los nombres, quedando "NOTA_1" y "NOTA_2"

INSERT INTO `examen_final` (`ID_ALUMNO`, `ID_MATERIA`, `FINAL`, `ID_ACTA`, `NOTA_1`, `NOTA_2`) VALUES
('TSDS-19-001-AL', 1, 7, 61, 0, 0),
('TSDS-19-001-AL', 2, 8, 63, 0, 0),
('TSDS-19-001-AL', 3, 8, 150, 0, 0),
('TSDS-19-001-AL', 4, 6, 62, 0, 0),
('TSDS-19-001-AL', 5, 8, 44, 0, 0),
('TSDS-19-001-AL', 6, 10, 54, 0, 0),
('TSDS-19-001-AL', 7, 10, 60, 0, 0),
('TSDS-19-001-AL', 8, 9, 47, 0, 0),
('TSDS-19-001-AL', 9, 8, 134, 0, 0),
('TSDS-19-001-AL', 10, 8, 173, 0, 0),
('TSDS-19-001-AL', 11, 9, 124, 0, 0),
('TSDS-19-001-AL', 12, 5, 72, 0, 0),
('TSDS-19-001-AL', 13, 8, 97, 0, 0),
('TSDS-19-001-AL', 14, 10, 68, 0, 0),
('TSDS-19-001-AL', 16, 10, 167, 0, 0),
('TSDS-19-001-AL', 17, 4, 98, 0, 0),
('TSDS-19-001-AL', 18, 10, 165, 0, 0),
('TSDS-19-001-AL', 19, 10, 136, 0, 0),
('TSDS-19-001-AL', 20, 9, 155, 0, 0),
('TSDS-19-001-AL', 22, 8, 154, 0, 0),
('TSDS-19-001-AL', 24, 4, 58, 0, 0),
('TSDS-19-001-AL', 25, 9, 152, 0, 0),
('TSDS-19-001-AL', 26, 10, 58, 0, 0);


-- CREACION DE VISTAS

-- VISTA nota_alumno

CREATE OR REPLACE VIEW vw_nota_alumno AS
SELECT m.id_materia  AS 'MATERIA',
       m.nombre      AS 'NOMBRE',
       m.anio        AS 'ANIO',
       c.final       AS 'NOTA',
       c.estado      AS 'CONDICION',
       la.LEGAJO_ALU AS 'LEGAJO'
  FROM `cursa` c
  JOIN legajo_alumno la  ON c.id_alumno = la.LEGAJO_ALU
  JOIN materia m ON c.id_materia = m.id_materia;

-- VISTA plan_estudio

CREATE OR REPLACE VIEW vw_plan_estudio AS
SELECT c.nombre     AS 'CARRERA',
       c.id_carrera AS 'ID_CARRERA',
       m.id_materia AS 'ID_MATERIA',
       m.nombre     AS 'MATERIA',
       m.anio       AS 'ANIO'
  FROM carrera c
  JOIN materia m ON m.id_carrera = c.id_carrera;

-- VISTA cursado

CREATE OR REPLACE VIEW vw_cursado AS
SELECT la.LEGAJO_ALU as 'LEGAJO',
       CONCAT(a.NOMBRE, ' ', a.APELLIDO) AS 'ALUMNO',
       c.CICLO                           AS 'ANIO',
       c.ID_MATERIA                      AS 'ID_MATERIA',
       m.NOMBRE                          AS 'MATERIA'
FROM legajo_alumno la
JOIN alumno a ON a.DNI = la.DNI
JOIN cursa c  ON c.ID_ALUMNO = la.LEGAJO_ALU
JOIN materia m ON m.ID_MATERIA = c.ID_MATERIA;

-- VISTA docentes_inscriptos

CREATE OR REPLACE VIEW vw_docentes_inscriptos AS
SELECT c.ABREVIADO                AS 'CARRERA',
       COUNT(ld.LEGAJO_DOC)       AS 'INSCRIPTOS',
       YEAR(ld.FECHA_INSCRIPCION) AS 'ANIO'
  FROM legajo_docente ld
  JOIN carrera c ON c.ID_CARRERA = ld.CARRERA;

-- VISTA docentes_inscriptos_carrera

CREATE OR REPLACE VIEW vw_docentes_inscriptos_carrera AS
  SELECT c.ABREVIADO,
         COUNT(ld.CARRERA) AS 'INSCRIPTOS'
    FROM `legajo_docente` ld
    JOIN carrera c ON c.ID_CARRERA = ld.CARRERA
GROUP BY ld.CARRERA;

-- VISTAS alumnos_inscriptos

CREATE OR REPLACE VIEW vw_alumnos_inscriptos AS
SELECT COUNT(LEGAJO_ALU) AS 'INSCRIPTOS'
  FROM LEGAJO_ALUMNO;

-- VISTA alumnos_inscriptos_cohorte

CREATE OR REPLACE VIEW vw_alumnos_insc_cohorte AS
SELECT COUNT(la.dni) AS 'INSCRIPTOS',
       co.NUMERO     AS 'COHORTE',
       YEAR(co.ANIO) AS 'ANIO'
  FROM legajo_alumno la
  JOIN cohorte co ON co.ID_COHORTE = la.COHORTE;

-- VISTA alumnos_inscriptos_carrera

CREATE OR REPLACE VIEW vw_alumnos_insc_carrera AS
SELECT ca.ABREVIADO  AS 'CARRERA',
       COUNT(la.dni) AS 'INSCRIPTOS',
       co.NUMERO     AS 'COHORTE',
       YEAR(co.ANIO) AS 'ANIO'
  FROM legajo_alumno la
  JOIN cohorte co ON co.ID_COHORTE = la.COHORTE
  JOIN carrera ca ON ca.ID_CARRERA = la.CARRERA
  GROUP BY la.CARRERA;

-- VISTA admin_examen
-- En esta vista se agregó un JOIN para que funcione de acuerdo a la nueba bd

CREATE OR REPLACE VIEW `admin_examen` AS
SELECT la.`LEGAJO_ALU`                         AS `LEGAJO_ALU`, 
       concat(al.`APELLIDO`, ' ', al.`NOMBRE`) AS `ALUMNO`, 
       m.`NOMBRE`                              AS `MATERIA`, 
       c.`1ER_PARCIAL`                         AS `1ER_PARCIAL`, 
       c.`2DO_PARCIAL`                         AS `2DO_PARCIAL` 
  FROM `alumno` al
  JOIN `legajo_alumno` la ON la.DNI = al.DNI
  JOIN `cursa` c          ON c.`ID_ALUMNO` = la.`LEGAJO_ALU` 
  JOIN `materia` m        ON m.`ID_MATERIA` = c.`ID_MATERIA`;

-- VISTA admin_final
-- En esta vista se agregó un JOIN para que funcione de acuerdo a la nueba bd

CREATE OR REPLACE VIEW `admin_final` AS
SELECT la.`LEGAJO_ALU`                         AS `LEGAJO_ALU`,
       concat(al.`NOMBRE`, ' ', al.`APELLIDO`) AS `ALUMNO`, 
       m.`Nombre`                              AS `MATERIA`, 
       ef.`FINAL`                              AS `FINAL`, 
       ef.`ID_ACTA`                            AS `ID_ACTA` 
  FROM `alumno` al 
  JOIN `legajo_alumno` la ON la.DNI = al.DNI
  JOIN `examen_final` ef  ON ef.`ID_ALUMNO` = la.`LEGAJO_ALU`
  JOIN `materia` m        ON m.ID_MATERIA = ef.ID_MATERIA;

-- VISTA nota_final
-- En esta vista se agregó un JOIN para que funcione de acuerdo a la nueba bd

CREATE OR REPLACE VIEW `vw_nota_final` AS
SELECT al.`APELLIDO` AS `APELLIDO`, 
       m.`NOMBRE`    AS `MATERIA`, 
       ef.`FINAL`    AS `FINAL`, 
       ef.`ID_ACTA`  AS `ID_ACTA`
 FROM `alumno` al
 JOIN `legajo_alumno` la ON la.DNI = al.DNI
 JOIN `examen_final` ef  ON ef.`ID_ALUMNO` = la.`LEGAJO_ALU`
 JOIN `materia` m        ON m.ID_MATERIA = ef.ID_MATERIA;

-- VISTA nota_cursado
-- Esta vista reemplaza a vw_vista_cursado

CREATE OR REPLACE VIEW `vw_nota_cursado` AS
SELECT al.`DNI`        AS `DNI`, 
       al.`APELLIDO`   AS `APELLIDO`, 
       m.`NOMBRE`      AS `NOMBRE`, 
       c.`1ER_PARCIAL` AS `1ER_PARCIAL`, 
       c.`2DO_PARCIAL` AS `2DO_PARCIAL` 
  FROM `alumno` al
  JOIN `legajo_alumno` la ON la.DNI = al.DNI
  JOIN `cursa` c          ON c.`ID_ALUMNO` = la.`LEGAJO_ALU`
  JOIN `materia` m        ON m.`ID_MATERIA` = c.`ID_MATERIA`;
