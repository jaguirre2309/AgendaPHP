-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-05-2019 a las 03:39:31
-- Versión del servidor: 10.1.36-MariaDB
-- Versión de PHP: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `agenda`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `eventos`
--

CREATE TABLE `eventos` (
  `id` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `hora_inicio` time DEFAULT NULL,
  `fecha_finalizacion` date DEFAULT NULL,
  `hora_finalizacion` time DEFAULT NULL,
  `dia_comp` tinyint(1) NOT NULL,
  `fk_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `eventos`
--

INSERT INTO `eventos` (`id`, `titulo`, `fecha_inicio`, `hora_inicio`, `fecha_finalizacion`, `hora_finalizacion`, `dia_comp`, `fk_usuario`) VALUES
(1, 'Prueba1', '2019-05-14', '07:00:00', '2019-05-16', '08:00:00', 1, 1),
(2, 'Prueba2', '2019-05-14', '16:00:00', '2019-05-19', '18:00:00', 0, 1),
(3, 'Prueba3', '2019-04-14', NULL, '2019-04-19', NULL, 0, 2),
(4, 'Prueba4', '2019-04-14', NULL, '2019-04-19', NULL, 0, 2),
(5, 'PruebaForm', '2019-04-14', NULL, '2019-04-19', NULL, 0, 2),
(6, 'Prueba Form Lleno', '2019-05-19', '07:00:00', '2019-05-21', '12:00:00', 0, 1),
(8, 'Final', '2019-05-15', '12:30:00', '2019-05-17', '15:30:00', 0, 1),
(9, 'Finales', '2019-05-27', '08:00:00', '2019-05-28', '20:00:00', 0, 1),
(14, 'Prueba Final', '2019-05-26', '07:00:00', '2019-05-27', '14:00:00', 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombres` varchar(50) NOT NULL,
  `correo` varchar(40) NOT NULL,
  `password` varchar(70) NOT NULL,
  `fecnac` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombres`, `correo`, `password`, `fecnac`) VALUES
(1, 'Pablo Garcia', 'pablito@gmail.com', '$2y$10$Y8o7YE5Nk57erQOGvdhbT.c86HuB/nEXQW93mtVkr943Ti3stEBIe', '0000-00-00'),
(2, 'Juan Perez', 'juancho@gmail.com', '$2y$10$9SS6SDSTupulEqzQIgsSFuJU2RoU0uM7pzL.CcMLNytY3XjIOhmPG', '0000-00-00'),
(3, 'Angel Condori', 'angeldx@gmail.com', '$2y$10$R1sSkWq728QSlt0C4RT3qektARbzAPfuSVWrsNm5Lq4ZDehD9Hpzi', '0000-00-00');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `eventos`
--
ALTER TABLE `eventos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `eventos`
--
ALTER TABLE `eventos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
