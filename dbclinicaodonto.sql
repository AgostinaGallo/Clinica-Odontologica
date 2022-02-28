-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 24-10-2020 a las 21:31:45
-- Versión del servidor: 5.7.31
-- Versión de PHP: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `dbclinicaodonto`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cobertura`
--

DROP TABLE IF EXISTS `cobertura`;
CREATE TABLE IF NOT EXISTS `cobertura` (
  `ID_COBERTURA` int(11) NOT NULL AUTO_INCREMENT,
  `CUIL` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ESTADO` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `NOMBRE` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `NRO_AFILIADO` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `NRO_TITULAR` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `PACIENTE_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_COBERTURA`),
  KEY `FK_COBERTURA_PACIENTE_ID` (`PACIENTE_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `doctor`
--

DROP TABLE IF EXISTS `doctor`;
CREATE TABLE IF NOT EXISTS `doctor` (
  `ID_DOCTOR` int(11) NOT NULL AUTO_INCREMENT,
  `APELLIDO` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `CIUDAD` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `DIRECCION` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `DNI` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `EMAIL` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ESPECIALIDAD` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `FECHA_NACIMIENTO` date DEFAULT NULL,
  `NOMBRE` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `PROVINCIA` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `SEXO` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `TELEFONO` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `USUARIO_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_DOCTOR`),
  KEY `FK_DOCTOR_USUARIO_ID` (`USUARIO_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `doctor`
--

INSERT INTO `doctor` (`ID_DOCTOR`, `APELLIDO`, `CIUDAD`, `DIRECCION`, `DNI`, `EMAIL`, `ESPECIALIDAD`, `FECHA_NACIMIENTO`, `NOMBRE`, `PROVINCIA`, `SEXO`, `TELEFONO`, `USUARIO_ID`) VALUES
(21, 'Dos Santos', 'Posadas', 'Morcillo 91911', '32547811', 'luisina@gmail.com', 'Peridoncia', '1990-05-11', 'Luisina', 'Misiones', 'Femenino', '1541112222', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horarioatencion`
--

DROP TABLE IF EXISTS `horarioatencion`;
CREATE TABLE IF NOT EXISTS `horarioatencion` (
  `ID_HORARIO` int(11) NOT NULL AUTO_INCREMENT,
  `DIA` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `HORA_DESDE` time DEFAULT NULL,
  `HORA_HASTA` time DEFAULT NULL,
  `DOCTOR_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_HORARIO`),
  KEY `FK_HORARIOATENCION_DOCTOR_ID` (`DOCTOR_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paciente`
--

DROP TABLE IF EXISTS `paciente`;
CREATE TABLE IF NOT EXISTS `paciente` (
  `ID_PACIENTE` int(11) NOT NULL AUTO_INCREMENT,
  `APELLIDO` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `CIUDAD` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `DIRECCION` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `DNI` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `EMAIL` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ESTADO` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `FECHA_NACIMIENTO` date DEFAULT NULL,
  `FECHA_REGISTRO` date DEFAULT NULL,
  `NOMBRE` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `POSEECOBERTURA` tinyint(1) DEFAULT '0',
  `PROVINCIA` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `SEXO` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `TELEFONO` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`ID_PACIENTE`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `paciente`
--

INSERT INTO `paciente` (`ID_PACIENTE`, `APELLIDO`, `CIUDAD`, `DIRECCION`, `DNI`, `EMAIL`, `ESTADO`, `FECHA_NACIMIENTO`, `FECHA_REGISTRO`, `NOMBRE`, `POSEECOBERTURA`, `PROVINCIA`, `SEXO`, `TELEFONO`) VALUES
(3, 'Gallo', 'La Matanza', 'Morcillo 91911', '41700201', 'agosgallo@gmail.com', 'Activo', '1999-02-11', '2020-10-20', 'Agostina', 1, 'Misiones', 'Femenino', '44561147'),
(8, 'Martinez', 'San Telmo', 'Vivanco 9211', '32547811', 'juan@gmail.com', 'Activo', '1998-05-11', '2020-10-22', 'Juan', 1, 'Buenos Aires', 'Masculino', '44561147'),
(9, 'Fernandez', 'San Telmo', 'Morcillo 91911', '23786232', 'martin@jose.com', 'Activo', '1988-05-11', '2020-10-22', 'Martin Jose', 1, 'Buenos Aires', 'Masculino', '3764121415');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `responsable`
--

DROP TABLE IF EXISTS `responsable`;
CREATE TABLE IF NOT EXISTS `responsable` (
  `ID_RESPONSABLE` int(11) NOT NULL AUTO_INCREMENT,
  `APELLIDO` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `CIUDAD` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `DIRECCION` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `DNI` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `EMAIL` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `FECHA_NACIMIENTO` date DEFAULT NULL,
  `NOMBRE` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `PROVINCIA` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `RELACION` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `SEXO` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `TELEFONO` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `PACIENTE_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_RESPONSABLE`),
  KEY `FK_RESPONSABLE_PACIENTE_ID` (`PACIENTE_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `secretaria`
--

DROP TABLE IF EXISTS `secretaria`;
CREATE TABLE IF NOT EXISTS `secretaria` (
  `ID_SECRETARIA` int(11) NOT NULL AUTO_INCREMENT,
  `APELLIDO` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `CIUDAD` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `DIRECCION` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `DNI` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `EMAIL` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `FECHA_NACIMIENTO` date DEFAULT NULL,
  `NOMBRE` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `PROVINCIA` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `SEXO` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `TELEFONO` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `USUARIO_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_SECRETARIA`),
  KEY `FK_SECRETARIA_USUARIO_ID` (`USUARIO_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `secretaria`
--

INSERT INTO `secretaria` (`ID_SECRETARIA`, `APELLIDO`, `CIUDAD`, `DIRECCION`, `DNI`, `EMAIL`, `FECHA_NACIMIENTO`, `NOMBRE`, `PROVINCIA`, `SEXO`, `TELEFONO`, `USUARIO_ID`) VALUES
(5, 'Gimenez', 'Iguazu', 'Barrio fatima', '21354211', 'facugim@gmail.com', '1999-04-10', 'Facundo', 'Misiones', 'Masculino', '1548787878', NULL),
(2, 'Mendoza', 'Rosario', 'Los lapachos 922929', '55222333', 'teremendoza@hotmail.com', '1990-10-20', 'Teresa', 'Santa Fe', 'Femenino', '3764122121', NULL),
(4, 'Torres', 'San Telmo', 'Vivanco 9211', '41500231', 'flor@gmail.com', '1970-02-11', 'Florencia', 'San Telmo', 'Femenino', '154878994', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `turno`
--

DROP TABLE IF EXISTS `turno`;
CREATE TABLE IF NOT EXISTS `turno` (
  `ID_TURNO` int(11) NOT NULL AUTO_INCREMENT,
  `ESTADO` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `FECHA` date DEFAULT NULL,
  `HORARIO` time DEFAULT NULL,
  `MOTIVO` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `OBSERVACIONES` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `DOCTOR_ID` int(11) DEFAULT NULL,
  `PACIENTE_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_TURNO`),
  KEY `FK_TURNO_PACIENTE_ID` (`PACIENTE_ID`),
  KEY `FK_TURNO_DOCTOR_ID` (`DOCTOR_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `turno`
--

INSERT INTO `turno` (`ID_TURNO`, `ESTADO`, `FECHA`, `HORARIO`, `MOTIVO`, `OBSERVACIONES`, `DOCTOR_ID`, `PACIENTE_ID`) VALUES
(15, 'Inactivo', '2020-10-23', '03:55:00', 'Extraccion', 'El paciente necesita limpieza ', 21, 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `ID_USUARIO` int(11) NOT NULL AUTO_INCREMENT,
  `CONTRASENIA` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `EMAIL` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `USERNAME` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`ID_USUARIO`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`ID_USUARIO`, `CONTRASENIA`, `EMAIL`, `USERNAME`) VALUES
(1, '123', 'admin@admin', 'admin'),
(2, '123', 'agos@gmail.com', 'agos');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
