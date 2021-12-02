-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-11-2021 a las 01:08:45
-- Versión del servidor: 10.4.19-MariaDB
-- Versión de PHP: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `qom`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador`
--

CREATE TABLE `administrador` (
  `idAdministrador` int(10) UNSIGNED NOT NULL,
  `Rol_idRol` int(10) UNSIGNED NOT NULL,
  `Nombre` varchar(20) DEFAULT NULL,
  `Apellidos` varchar(20) DEFAULT NULL,
  `Correo` varchar(20) DEFAULT NULL,
  `Telefono` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `administrador`
--

INSERT INTO `administrador` (`idAdministrador`, `Rol_idRol`, `Nombre`, `Apellidos`, `Correo`, `Telefono`) VALUES
(1, 1, 'Juan', 'Valdes', 'Juan@qom.com', 2147483647),
(2, 2, 'Dayana', 'Villalobos', 'Daya004@qom.com', 2147483647),
(3, 3, 'Jenni', 'Cetina', 'Jenni003@qom.com', 2147483647),
(4, 4, 'Judani', 'Vavice', 'judani@qom.com', 2147483647);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `idCategoria` int(10) UNSIGNED NOT NULL,
  `Nombre_de_la_categoria` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`idCategoria`, `Nombre_de_la_categoria`) VALUES
(1, 'Preparados'),
(2, 'Bebidas'),
(3, 'Empaquetados');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id_clientes` int(10) UNSIGNED NOT NULL,
  `Rol_idRol` int(10) UNSIGNED NOT NULL,
  `Nombre` varchar(20) DEFAULT NULL,
  `Telefono` int(11) DEFAULT NULL,
  `Apellidos` varchar(20) DEFAULT NULL,
  `Correos` varchar(20) DEFAULT NULL,
  `Categoria_de_cliente` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id_clientes`, `Rol_idRol`, `Nombre`, `Telefono`, `Apellidos`, `Correos`, `Categoria_de_cliente`) VALUES
(1, 21, 'Luis', 2147483647, 'García', 'luis@gmail.com', 'Aprendiz'),
(2, 22, 'Álvaro', 2147483647, 'Rodríguez', 'Albaro@gmail.com', 'Instructor'),
(3, 23, 'Luisa', 2147483647, 'Garzon', 'luisa@gmail.com', 'Aprendiz'),
(4, 24, 'Ángel', 2147483647, 'Roa', 'Angel@gmail.com', 'Instructor');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles_pedido`
--

CREATE TABLE `detalles_pedido` (
  `id_deta_pedido` int(10) UNSIGNED NOT NULL,
  `pedidos_clientes_id_clientes` int(10) UNSIGNED NOT NULL,
  `pedidos_id_pedidos` int(10) UNSIGNED NOT NULL,
  `productos_Categoria_idCategoria` int(10) UNSIGNED NOT NULL,
  `productos_id_productos` int(10) UNSIGNED NOT NULL,
  `cantidad_de_productos` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `detalles_pedido`
--

INSERT INTO `detalles_pedido` (`id_deta_pedido`, `pedidos_clientes_id_clientes`, `pedidos_id_pedidos`, `productos_Categoria_idCategoria`, `productos_id_productos`, `cantidad_de_productos`) VALUES
(200, 1, 4000, 1, 800, 3),
(201, 2, 4001, 2, 801, 4),
(202, 3, 4002, 3, 802, 5),
(203, 4, 4003, 4, 803, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE `inventario` (
  `idInventario` int(10) UNSIGNED NOT NULL,
  `Entradas` int(11) DEFAULT NULL,
  `Salidas` int(11) DEFAULT NULL,
  `Total` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `inventario`
--

INSERT INTO `inventario` (`idInventario`, `Entradas`, `Salidas`, `Total`) VALUES
(300, 3, 2, 1),
(301, 4, 3, 1),
(302, 5, 4, 1),
(303, 6, 5, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id_pedidos` int(10) UNSIGNED NOT NULL,
  `clientes_id_clientes` int(10) UNSIGNED NOT NULL,
  `Estado_del_pedido` varchar(20) DEFAULT NULL,
  `Fecha_del_pedido` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id_pedidos`, `clientes_id_clientes`, `Estado_del_pedido`, `Fecha_del_pedido`) VALUES
(4000, 1, 'Cancelado', '2021-03-02'),
(4001, 2, 'Espera', '2021-04-02'),
(4002, 3, 'Cancelado', '2021-05-02'),
(4003, 4, 'Espera', '2021-06-02');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_productos` int(10) UNSIGNED NOT NULL,
  `Categoria_idCategoria` int(10) UNSIGNED NOT NULL,
  `nombre_producto` varchar(20) DEFAULT NULL,
  `precio` int(11) DEFAULT NULL,
  `Presentacion` varchar(20) DEFAULT NULL,
  `Fecha_de_vencimiento` date NOT NULL,
  `Marca` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_productos`, `Categoria_idCategoria`, `nombre_producto`, `precio`, `Presentacion`, `Fecha_de_vencimiento`, `Marca`) VALUES
(800, 1, 'Empanada', 1000, 'Servilleta', '2021-07-12', 'a'),
(801, 2, 'pepsi', 1500, 'Botella', '2021-08-12', 'a'),
(802, 3, 'Sandwich', 1500, 'Servilleta', '2021-09-12', 'a'),
(810, 0, 'c', 2, 'c', '2021-10-21', 'Postobón'),
(811, 0, '', 2, '', '2021-10-23', ''),
(812, 0, 'c', 2, 'c', '2021-11-03', 'Postobón'),
(813, 0, 'Cuatro', 1000, 'botella plastica', '2021-11-15', 'Postobon'),
(814, 0, 'c', 2, 'c', '2021-11-18', 'Postobón');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos_has_inventario`
--

CREATE TABLE `productos_has_inventario` (
  `productos_Categoria_idCategoria` int(10) UNSIGNED NOT NULL,
  `productos_id_productos` int(10) UNSIGNED NOT NULL,
  `Inventario_idInventario` int(10) UNSIGNED NOT NULL,
  `ingreso_de_productos` varchar(20) DEFAULT NULL,
  `Salida_de_productos` varchar(20) DEFAULT NULL,
  `Saldo` int(11) DEFAULT NULL,
  `Fecha_de_movimiento` date DEFAULT NULL,
  `Tipo_de_movimiento` varchar(20) DEFAULT NULL,
  `Producto` varchar(20) DEFAULT NULL,
  `Cantidad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `productos_has_inventario`
--

INSERT INTO `productos_has_inventario` (`productos_Categoria_idCategoria`, `productos_id_productos`, `Inventario_idInventario`, `ingreso_de_productos`, `Salida_de_productos`, `Saldo`, `Fecha_de_movimiento`, `Tipo_de_movimiento`, `Producto`, `Cantidad`) VALUES
(1, 800, 300, '3', '2', 1, '2021-07-12', 'Entrada', 'Empanada', 3),
(2, 801, 301, '4', '3', 1, '2021-07-12', 'Entrada', 'pepsi', 4),
(3, 802, 302, '5', '4', 1, '2021-07-12', 'Salida', 'Sandwich', 5),
(4, 803, 303, '6', '5', 1, '2021-07-12', 'Salida', 'Chettos', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_de_inventario`
--

CREATE TABLE `tipo_de_inventario` (
  `idTipo_de_inventario` int(10) UNSIGNED NOT NULL,
  `productos_has_Inventario_Inventario_idInventario` int(10) UNSIGNED NOT NULL,
  `productos_has_Inventario_productos_id_productos` int(10) UNSIGNED NOT NULL,
  `productos_has_Inventario_productos_Categoria_idCategoria` int(10) UNSIGNED NOT NULL,
  `Fecha_de_movimiento` date DEFAULT NULL,
  `Tipo_de_movimento` varchar(20) DEFAULT NULL,
  `Cantidad_de_producto` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipo_de_inventario`
--

INSERT INTO `tipo_de_inventario` (`idTipo_de_inventario`, `productos_has_Inventario_Inventario_idInventario`, `productos_has_Inventario_productos_id_productos`, `productos_has_Inventario_productos_Categoria_idCategoria`, `Fecha_de_movimiento`, `Tipo_de_movimento`, `Cantidad_de_producto`) VALUES
(900, 300, 800, 1, '2021-07-12', 'Entrada', '3'),
(901, 301, 801, 2, '2021-07-12', 'Entrada', '4'),
(902, 302, 802, 3, '2021-07-12', 'Salida', '5'),
(903, 303, 803, 4, '2021-07-12', 'Salida', '6');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) UNSIGNED NOT NULL,
  `usuario` varchar(250) CHARACTER SET latin1 NOT NULL,
  `pass` varchar(250) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `usuario`, `pass`) VALUES
(1, 'jenni', '202cb962ac59075b964b07152d234b70'),
(2, 'dayana', '250cf8b51c773f3f8dc8b4be867a9a02');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`idAdministrador`,`Rol_idRol`),
  ADD KEY `Administrador_FKIndex1` (`Rol_idRol`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`idCategoria`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_clientes`),
  ADD KEY `clientes_FKIndex1` (`Rol_idRol`);

--
-- Indices de la tabla `detalles_pedido`
--
ALTER TABLE `detalles_pedido`
  ADD PRIMARY KEY (`id_deta_pedido`),
  ADD KEY `detalles_pedido_FKIndex1` (`productos_id_productos`,`productos_Categoria_idCategoria`),
  ADD KEY `detalles_pedido_FKIndex2` (`pedidos_id_pedidos`,`pedidos_clientes_id_clientes`);

--
-- Indices de la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`idInventario`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id_pedidos`,`clientes_id_clientes`),
  ADD KEY `pedidos_FKIndex1` (`clientes_id_clientes`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_productos`,`Categoria_idCategoria`),
  ADD KEY `productos_FKIndex1` (`Categoria_idCategoria`);

--
-- Indices de la tabla `productos_has_inventario`
--
ALTER TABLE `productos_has_inventario`
  ADD PRIMARY KEY (`productos_Categoria_idCategoria`,`productos_id_productos`,`Inventario_idInventario`),
  ADD KEY `productos_has_Inventario_FKIndex1` (`productos_id_productos`,`productos_Categoria_idCategoria`),
  ADD KEY `productos_has_Inventario_FKIndex2` (`Inventario_idInventario`);

--
-- Indices de la tabla `tipo_de_inventario`
--
ALTER TABLE `tipo_de_inventario`
  ADD PRIMARY KEY (`idTipo_de_inventario`),
  ADD KEY `Tipo_de_inventario_FKIndex1` (`productos_has_Inventario_productos_Categoria_idCategoria`,`productos_has_Inventario_productos_id_productos`,`productos_has_Inventario_Inventario_idInventario`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `administrador`
--
ALTER TABLE `administrador`
  MODIFY `idAdministrador` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `idCategoria` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_clientes` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `detalles_pedido`
--
ALTER TABLE `detalles_pedido`
  MODIFY `id_deta_pedido` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=204;

--
-- AUTO_INCREMENT de la tabla `inventario`
--
ALTER TABLE `inventario`
  MODIFY `idInventario` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=304;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_productos` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=815;

--
-- AUTO_INCREMENT de la tabla `tipo_de_inventario`
--
ALTER TABLE `tipo_de_inventario`
  MODIFY `idTipo_de_inventario` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=904;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
