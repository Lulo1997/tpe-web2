-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-10-2022 a las 23:12:46
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
-- Base de datos: `db_bandas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bandas`
--

CREATE TABLE `bandas` (
  `id_banda` int(11) NOT NULL,
  `id_genero_fk` int(11) NOT NULL,
  `nombre_banda` varchar(45) NOT NULL,
  `cantidad_discos` int(11) NOT NULL,
  `origen_banda` varchar(45) NOT NULL,
  `imagen_banda` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `bandas`
--

INSERT INTO `bandas` (`id_banda`, `id_genero_fk`, `nombre_banda`, `cantidad_discos`, `origen_banda`, `imagen_banda`) VALUES
(3, 2, 'ABBA', 9, ' Estocolmo, Suecia (1972)', './images/abbaa.jpg'),
(4, 1, 'Soda stereo', 7, 'Buenos Aires,Argentina(1982)', './images/soda stereo.png'),
(5, 2, 'La Oreja de Van Gogh', 8, 'San Sebastián, España (1996)', './images/la oreja de van gogh.jpg'),
(19, 6, 'asddsa', 12, 'Berlin(Alemania)', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `genero`
--

CREATE TABLE `genero` (
  `id_genero` int(11) NOT NULL,
  `genero_banda` varchar(25) NOT NULL,
  `historia_genero` varchar(500) NOT NULL,
  `instrumentos_comunes` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `genero`
--

INSERT INTO `genero` (`id_genero`, `genero_banda`, `historia_genero`, `instrumentos_comunes`) VALUES
(1, 'rock', 'holAjaaaa', 'guitarra,violin'),
(2, 'pop', '', ''),
(6, 'folklore', 'a', 'asdasdasd');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `nombre_usuario` varchar(50) NOT NULL,
  `contraseña` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`nombre_usuario`, `contraseña`) VALUES
('oroquietaluciano@gmail.com', '$2y$10$mo8/XJ.vff0LvO/LQGbuj.Ami459kSwgEykdHP0M/y9ipA9CplxP.');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `bandas`
--
ALTER TABLE `bandas`
  ADD PRIMARY KEY (`id_banda`),
  ADD KEY `fk_restriction` (`id_genero_fk`);

--
-- Indices de la tabla `genero`
--
ALTER TABLE `genero`
  ADD PRIMARY KEY (`id_genero`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`nombre_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `bandas`
--
ALTER TABLE `bandas`
  MODIFY `id_banda` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `genero`
--
ALTER TABLE `genero`
  MODIFY `id_genero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `bandas`
--
ALTER TABLE `bandas`
  ADD CONSTRAINT `fk_restriction` FOREIGN KEY (`id_genero_fk`) REFERENCES `genero` (`id_genero`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;