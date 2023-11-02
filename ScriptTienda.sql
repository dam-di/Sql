CREATE TABLE cliente (
    cliente_id SERIAL PRIMARY KEY,
    dni VARCHAR(10) UNIQUE ,
    nombre VARCHAR(200),
    correo VARCHAR(100) UNIQUE
);

CREATE TABLE categoria(
    categoria_id SERIAL PRIMARY KEY,
    nombre VARCHAR(200)
);

CREATE TABLE proveedor(
    proveedor_id SERIAL PRIMARY KEY,
    nif VARCHAR(10) UNIQUE,
    nombre VARCHAR(200)
);

CREATE TABLE producto(
    producto_id SERIAL PRIMARY KEY,
    referencia VARCHAR(100) UNIQUE,
    descripcion VARCHAR(200),
    precio DECIMAL,
    retirado BOOLEAN,
    categoria_id INT REFERENCES categoria (categoria_id)
);

CREATE TABLE proveedor_producto(
    producto_id INT references producto (producto_id),
    proveedor_id INT references proveedor (proveedor_id),
    PRIMARY KEY (producto_id, proveedor_id)
);

CREATE TABLE factura(
    factura_id SERIAL PRIMARY KEY,
    fecha DATE,
    pagada BOOLEAN,
    cliente_id INT references cliente (cliente_id)
);

CREATE TABLE detalle_factura(
    factura_id INT references factura (factura_id),
    producto_id INT references producto (producto_id),
    cantidad INT,
    precio DECIMAL,
    PRIMARY KEY (factura_id, producto_id)
);

-- Índices relacionados con la tabla factura
CREATE INDEX idx_cliente_id_factura ON factura(cliente_id);
CREATE INDEX idx_pagada ON factura(pagada);

-- Índices relacionados con la tabla producto
CREATE INDEX idx_categoria_id ON producto(categoria_id);
CREATE INDEX idx_retirado ON producto(retirado);

-- Índices relacionados con la tabla proveedor_producto
CREATE INDEX idx_producto_id ON proveedor_producto(producto_id);
CREATE INDEX idx_proveedor_id ON proveedor_producto(proveedor_id);

-- Índices relacionados con la tabla detalle_factura
CREATE INDEX idx_factura_id ON detalle_factura(factura_id);
CREATE INDEX idx_producto_id_detalle ON detalle_factura(producto_id);

INSERT INTO categoria (nombre) VALUES 
('Electrónicos'),
('Ropa'),
('Hogar'),
('Deportes'),
('Juguetes'),
('Alimentación'),
('Libros'),
('Salud y Belleza'),
('Automóviles'),
('Electrodomésticos');


INSERT INTO proveedor (nif, nombre) VALUES 
('A12345678', 'Suministros Industriales S.A.'),
('B23456789', 'ElectroMega Ltda.'),
('C34567890', 'Innovaciones Tecnológicas SL'),
('D45678901', 'Servicios Informáticos Innovadores S.C.'),
('E56789012', 'Soluciones Empresariales Integradas S.A.'),
('F67890123', 'Comercializadora Global de Hardware SL'),
('G78901234', 'Manufacturas y Suministros Industriales S.A.'),
('H89012345', 'Sistemas de Energía Renovable Ltda.'),
('I90123456', 'Distribuidora Nacional de Componentes Electrónicos S.C.'),
('J01234567', 'Ingeniería y Desarrollo Tecnológico S.A.'),
('K12345678', 'Innovatech Soluciones Empresariales S.A.'),
('L23456789', 'Suministros Electrónicos del Norte Ltda.'),
('M34567890', 'EcoSolutions Energía Renovable S.A.'),
('N45678901', 'Ingeniería Industrial Innovadora S.C.'),
('O56789012', 'Servicios Informáticos Avanzados S.A.'),
('P67890123', 'Distribuidora Nacional de Productos Químicos SL'),
('Q78901234', 'Comercializadora de Equipos Médicos S.A.'),
('R89012345', 'Manufacturas del Futuro Ltda.'),
('S90123456', 'Sistemas de Seguridad Integral S.A.'),
('T01234567', 'Innovaciones Tecnológicas para el Hogar SL');


INSERT INTO producto (referencia, descripcion, precio, retirado, categoria_id) VALUES 
('PRD001', 'Laptop UltraSlim 15 pulgadas', 799.99, false, 1),
('PRD002', 'Smartphone Quantum X5', 349.99, false, 2),
('PRD003', 'Cámara DSLR Profesional 24MP', 999.99, false, 3),
('PRD004', 'Auriculares Bluetooth Noise-Cancelling', 149.99, false, 4),
('PRD005', 'Smart TV 4K 55 pulgadas', 699.99, false, 5),
('PRD006', 'Impresora Multifunción Wi-Fi', 129.99, false, 6),
('PRD007', 'Consola de Juegos VR Ultimate', 449.99, false, 7),
('PRD008', 'Robot Aspirador Inteligente', 199.99, false, 8),
('PRD009', 'Barra de Sonido Dolby Atmos', 299.99, false, 9),
('PRD010', 'Bicicleta Eléctrica Plegable', 799.99, false, 10),
('PRD011', 'Zapatillas Deportivas para Correr', 89.99, false, 1),
('PRD012', 'Chaqueta de Cuero Estilo Vintage', 149.99, false, 2),
('PRD013', 'Juego de Ollas y Sartenes Antiadherentes', 79.99, false, 3),
('PRD014', 'Set de Pelotas de Golf Premium (12 unidades)', 29.99, false, 4),
('PRD015', 'Máquina de Café Espresso Automática', 299.99, false, 5),
('PRD016', 'Teclado Mecánico RGB para Gaming', 129.99, false, 6),
('PRD017', 'Reloj Inteligente con Monitor de Actividad', 199.99, false, 7),
('PRD018', 'Aspiradora Robot con Mapeo Inteligente', 249.99, false, 8),
('PRD019', 'Cámara de Seguridad IP con Visión Nocturna', 79.99, false, 9),
('PRD020', 'Patines en Línea Ajustables para Niños', 49.99, false, 10),
('PRD021', 'Patineta Eléctrica con Control Remoto', 199.99, false, 1),
('PRD022', 'Cámara de Video 4K con Estabilización de Imagen', 449.99, false, 2),
('PRD023', 'Mochila de Viaje Resistente al Agua', 79.99, false, 3),
('PRD024', 'Kit de Herramientas para Reparaciones del Hogar', 69.99, false, 4),
('PRD025', 'Altavoz Bluetooth Portátil con Sonido Envolvente', 129.99, false, 5),
('PRD026', 'Pelota de Fútbol Profesional Tamaño Oficial', 29.99, false, 6),
('PRD027', 'Tableta Digitalizadora para Artistas y Diseñadores', 199.99, false, 7),
('PRD028', 'Silla de Oficina Ergonómica con Soporte Lumbar', 149.99, false, 8),
('PRD029', 'Set de Cuchillos de Cocina de Acero Inoxidable', 99.99, false, 9),
('PRD030', 'Juego de Construcción para Niños con 500 Piezas', 59.99, false, 10),
('PRD031', 'Cámara de Seguridad Exterior con Detección de Movimiento', 159.99, false, 1),
('PRD032', 'Auriculares Inalámbricos con Cancelación de Ruido', 199.99, false, 2),
('PRD033', 'Batería Externa Portátil de Carga Rápida', 49.99, false, 3),
('PRD034', 'Teclado y Ratón Gaming con Iluminación RGB', 79.99, false, 4),
('PRD035', 'Aspiradora de Mano Inalámbrica para Automóviles', 39.99, false, 5),
('PRD036', 'Linterna LED Recargable con Zoom', 29.99, false, 6),
('PRD037', 'Set de Cámaras de Vigilancia Inalámbricas para Hogar', 299.99, false, 7),
('PRD038', 'Altavoz Inteligente con Asistente de Voz Integrado', 129.99, false, 8),
('PRD039', 'Kit de Herramientas para Reparación de Teléfonos Móviles', 59.99, false, 9),
('PRD040', 'Juego de Mesa Estratégico para Familias', 34.99, false, 10),
('PRD041', 'Smartwatch con Monitor de Ritmo Cardíaco', 149.99, false, 1),
('PRD042', 'Impresora Fotográfica de Alta Resolución', 129.99, false, 2),
('PRD043', 'Caja de Herramientas de 200 Piezas', 89.99, false, 3),
('PRD044', 'Auriculares Deportivos Resistentes al Agua', 79.99, false, 4),
('PRD045', 'Aspiradora Robot con Mapeo y Limpieza Programada', 249.99, false, 5),
('PRD046', 'Altavoces Bluetooth Portátiles con Sonido Estéreo', 69.99, false, 6),
('PRD047', 'Cámara Deportiva 4K con Estabilización de Imagen', 199.99, false, 7),
('PRD048', 'Set de Cuchillos de Chef de Acero Inoxidable', 99.99, false, 8),
('PRD049', 'Tableta Gráfica para Diseño y Arte Digital', 179.99, false, 9),
('PRD050', 'Juego de Construcción de Ciudades con 1000 Piezas', 54.99, false, 10),
('PRD051', 'Proyector de Cine en Casa 1080p', 299.99, false, 1),
('PRD052', 'Impresora 3D de Alta Precisión', 499.99, false, 2),
('PRD053', 'Herramientas de Jardinería Profesionales', 79.99, false, 3),
('PRD054', 'Auriculares Inalámbricos Deportivos', 59.99, false, 4),
('PRD055', 'Barbacoa de Gas con Quemadores de Acero Inoxidable', 399.99, false, 5),
('PRD056', 'Teclado y Ratón Ergonómicos Inalámbricos', 89.99, false, 6),
('PRD057', 'Cámara de Seguridad con Detección de Movimiento', 129.99, false, 7),
('PRD058', 'Silla de Oficina de Cuero con Respaldo Alto', 179.99, false, 8),
('PRD059', 'Kit de Herramientas para Reparación de Bicicletas', 49.99, false, 9),
('PRD060', 'Juego de Mesa de Estrategia Medieval', 39.99, false, 10),
('PRD061', 'Cámara Réflex Digital Profesional 36MP', 899.99, false, 1),
('PRD062', 'Smartphone Plegable con Pantalla OLED', 1299.99, false, 2),
('PRD063', 'Set de Cuchillos de Cocina de Alta Calidad', 149.99, false, 3),
('PRD064', 'Auriculares con Cancelación de Ruido y Sonido Envolvente', 299.99, false, 4),
('PRD065', 'Robot Aspirador con Mapeo y Control por App', 349.99, false, 5),
('PRD066', 'Altavoz Bluetooth Flotante Resistente al Agua', 79.99, false, 6),
('PRD067', 'Cámara de Seguridad 360 grados con Visión Nocturna', 199.99, false, 7),
('PRD068', 'Silla Gamer Ergonómica con Soporte Lumbar', 249.99, false, 8),
('PRD069', 'Set de Herramientas de Carpintería Profesional', 159.99, false, 9),
('PRD070', 'Juego de Estrategia de Ciencia Ficción', 44.99, false, 10),
('PRD071', 'Monitor Gaming Curvo de 34 pulgadas', 599.99, false, 1),
('PRD072', 'Cámara de Video 360 grados 4K', 449.99, false, 2),
('PRD073', 'Set de Cuchillos de Cerámica de Colores', 69.99, false, 3),
('PRD074', 'Auriculares Inalámbricos Deportivos con Bluetooth 5.0', 89.99, false, 4),
('PRD075', 'Aspiradora Robot con Función de Trapeado', 279.99, false, 5),
('PRD076', 'Teclado Mecánico Retroiluminado RGB', 119.99, false, 6),
('PRD077', 'Cámara de Seguridad Solar con Panel Integrado', 179.99, false, 7),
('PRD078', 'Silla de Oficina Ergonómica con Reposapiés', 329.99, false, 8),
('PRD079', 'Set de Herramientas de Jardinería para Bonsáis', 49.99, false, 9),
('PRD080', 'Juego de Mesa de Aventuras y Misterio', 39.99, false, 10),
('PRD081', 'Menú del Día: Entrada, Plato Principal y Postre', 14.99, false, 1),
('PRD082', 'Pizza Margherita Familiar', 12.99, false, 1),
('PRD083', 'Hamburguesa Gourmet con Papas Fritas', 9.99, false, 1),
('PRD084', 'Sushi Variado para Dos Personas', 24.99, false, 1),
('PRD085', 'Ensalada César con Pollo a la Parrilla', 8.99, false, 1),
('PRD086', 'Pasta Alfredo con Champiñones y Espárragos', 11.99, false, 1),
('PRD087', 'Tarta de Chocolate y Frambuesas', 6.99, false, 1),
('PRD088', 'Copa de Helado con Toppings Variados', 4.99, false, 1),
('PRD089', 'Café Espresso Doble', 3.49, false, 1),
('PRD090', 'Refresco de Frutas Naturales', 2.99, false, 1),
('PRD091', 'Paquete de 100 Hojas de Papel A4', 7.99, false, 2),
('PRD092', 'Bolígrafos de Tinta Gel (Pack de 10)', 4.49, false, 2),
('PRD093', 'Cuaderno Espiral de Tapa Dura', 3.99, false, 2),
('PRD094', 'Marcadores de Colores Variados (Set de 12)', 6.99, false, 2),
('PRD095', 'Calculadora Científica con Pantalla LCD', 14.99, false, 2),
('PRD096', 'Cinta Adhesiva Transparente (Pack de 6)', 5.29, false, 2),
('PRD097', 'Pegamento en Barra sin Ácido', 2.99, false, 2),
('PRD098', 'Tijeras de Acero Inoxidable', 3.79, false, 2),
('PRD099', 'Blocs de Notas Adhesivas (Pack de 8)', 4.89, false, 2),
('PRD100', 'Organizador de Escritorio de Madera', 12.99, false, 2);


INSERT INTO proveedor_producto (producto_id, proveedor_id) VALUES 
(1, 1), (1, 2), -- Producto 1
(2, 3), (2, 4), -- Producto 2
(3, 5), (3, 6), -- Producto 3
(4, 7), (4, 8), -- Producto 4
(5, 9), (5, 10), -- Producto 5
(6, 1), (6, 3), -- Producto 6
(7, 5), (7, 7), -- Producto 7
(8, 2), (8, 4), -- Producto 8
(9, 6), (9, 8), -- Producto 9
(10, 9), (10, 10), -- Producto 10
(11, 1), (11, 2), (11, 3), -- Producto 11 (más de 2 proveedores)
(12, 4), (12, 5), -- Producto 12
(13, 6), (13, 7), -- Producto 13
(14, 8), (14, 9), -- Producto 14
(15, 10), (15, 1), -- Producto 15
(16, 2), (16, 3), -- Producto 16
(17, 4), (17, 5), -- Producto 17
(18, 6), (18, 7), -- Producto 18
(19, 8), (19, 9), (19, 10), -- Producto 19 (más de 2 proveedores)
(20, 1), (20, 2), -- Producto 20
(21, 1), (21, 2), (21, 3), (21, 4), -- Producto 21 (más de 2 proveedores)
(22, 5), (22, 6), -- Producto 22
(23, 7), (23, 8), -- Producto 23
(24, 9), (24, 10), -- Producto 24
(25, 1), (25, 2), -- Producto 25
(26, 3), (26, 4), -- Producto 26
(27, 5), (27, 6), (27, 7), -- Producto 27 (más de 2 proveedores)
(28, 8), (28, 9), (28, 10), -- Producto 28 (más de 2 proveedores)
(29, 1), (29, 2), (29, 3), -- Producto 29 (más de 2 proveedores)
(30, 4), (30, 5), -- Producto 30
(31, 1), (31, 2), -- Producto 31
(32, 3), (32, 4), -- Producto 32
(33, 5), (33, 6), (33, 7), -- Producto 33 (más de 2 proveedores)
(34, 8), (34, 9), -- Producto 34
(35, 10), (35, 1), -- Producto 35
(36, 2), (36, 3), (36, 4), -- Producto 36 (más de 2 proveedores)
(37, 5), (37, 6), -- Producto 37
(38, 7), (38, 8), -- Producto 38
(39, 9), (39, 10), -- Producto 39
(40, 1), (40, 2), (40, 3), (40, 4), -- Producto 40 (más de 2 proveedores)
(41, 5), (41, 6), -- Producto 41
(42, 7), (42, 8), (42, 9), -- Producto 42 (más de 2 proveedores)
(43, 10), (43, 1), -- Producto 43
(44, 2), (44, 3), -- Producto 44
(45, 4), (45, 5), -- Producto 45
(46, 6), (46, 7), -- Producto 46
(47, 8), (47, 9), (47, 10), -- Producto 47 (más de 2 proveedores)
(48, 1), (48, 2), -- Producto 48
(49, 3), (49, 4), (49, 5), -- Producto 49 (más de 2 proveedores)
(50, 6), (50, 7), -- Producto 50
(51, 8), (51, 9), (51, 10), -- Producto 51 (más de 2 proveedores)
(52, 1), (52, 2), -- Producto 52
(53, 3), (53, 4), -- Producto 53
(54, 5), (54, 6), (54, 7), -- Producto 54 (más de 2 proveedores)
(55, 8), (55, 9), -- Producto 55
(56, 10), (56, 1), -- Producto 56
(57, 2), (57, 3), -- Producto 57
(58, 4), (58, 5), -- Producto 58
(59, 6), (59, 7), -- Producto 59
(60, 8), (60, 9), (60, 10), -- Producto 60
(61, 1), (61, 2), -- Producto 61
(62, 3), (62, 4), -- Producto 62
(63, 5), (63, 6), (63, 7), -- Producto 63 (más de 2 proveedores)
(64, 8), (64, 9), -- Producto 64
(65, 10), (65, 1), -- Producto 65
(66, 2), (66, 3), (66, 4), -- Producto 66 (más de 2 proveedores)
(67, 5), (67, 6), -- Producto 67
(68, 7), (68, 8), -- Producto 68
(69, 9), (69, 10), -- Producto 69
(70, 1), (70, 2), (70, 3), (70, 4), -- Producto 70 (más de 2 proveedores)
(71, 5), (71, 6), -- Producto 71
(72, 7), (72, 8), (72, 9), -- Producto 72 (más de 2 proveedores)
(73, 10), (73, 1), -- Producto 73
(74, 2), (74, 3), -- Producto 74
(75, 4), (75, 5), -- Producto 75
(76, 6), (76, 7), -- Producto 76
(77, 8), (77, 9), (77, 10), -- Producto 77 (más de 2 proveedores)
(78, 1), (78, 2), -- Producto 78
(79, 3), (79, 4), (79, 5), -- Producto 79 (más de 2 proveedores)
(80, 6), (80, 7), -- Producto 80
(81, 8), (81, 9), (81, 10), -- Producto 81 (más de 2 proveedores)
(82, 1), (82, 2), -- Producto 82
(83, 3), (83, 4), -- Producto 83
(84, 5), (84, 6), (84, 7), -- Producto 84 (más de 2 proveedores)
(85, 8), (85, 9), -- Producto 85
(86, 10), (86, 1), -- Producto 86
(87, 2), (87, 3), -- Producto 87
(88, 4), (88, 5), -- Producto 88
(89, 6), (89, 7), -- Producto 89
(90, 8), (90, 9), (90, 10), -- Producto 90 (más de 2 proveedores)
(91, 1), (91, 2), -- Producto 91
(92, 3), (92, 4), (92, 5), -- Producto 92 (más de 2 proveedores)
(93, 6), (93, 7), -- Producto 93
(94, 8), (94, 9), (94, 10), -- Producto 94 (más de 2 proveedores)
(95, 1), (95, 2), -- Producto 95
(96, 3), (96, 4), -- Producto 96
(97, 5), (97, 6), (97, 7), -- Producto 97 (más de 2 proveedores)
(98, 8), (98, 9), -- Producto 98
(99, 10), (99, 1), -- Producto 99
(100, 2), (100, 3); -- Producto 100

INSERT INTO cliente (dni, nombre, correo) VALUES
('123456789A', 'Ana García', 'ana.garcia@example.com'),
('234567890B', 'Carlos Rodríguez', 'carlos.rodriguez@example.com'),
('345678901C', 'Elena Martínez', 'elena.martinez@example.com'),
('456789012D', 'David Pérez', 'david.perez@example.com'),
('567890123E', 'Laura Sánchez', 'laura.sanchez@example.com'),
('678901234F', 'Javier López', 'javier.lopez@example.com'),
('789012345G', 'Sara Fernández', 'sara.fernandez@example.com'),
('890123456H', 'Miguel Torres', 'miguel.torres@example.com'),
('901234567I', 'Carmen Ramírez', 'carmen.ramirez@example.com'),
('012345678J', 'Alejandro Díaz', 'alejandro.diaz@example.com'),
('123456789K', 'María González', 'maria.gonzalez@example.com'),
('234567890L', 'Pablo Castro', 'pablo.castro@example.com'),
('345678901M', 'Laura Ruiz', 'laura.ruiz@example.com'),
('456789012N', 'Adrián Herrera', 'adrian.herrera@example.com'),
('567890123O', 'Eva Morales', 'eva.morales@example.com'),
('678901234P', 'Juan Martín', 'juan.martin@example.com'),
('789012345Q', 'Lorena López', 'lorena.lopez@example.com'),
('890123456R', 'Sergio Pérez', 'sergio.perez@example.com'),
('901234567S', 'Isabel Jiménez', 'isabel.jimenez@example.com'),
('012345678T', 'Héctor Soto', 'hector.soto@example.com'),
('123456789U', 'Cristina Vargas', 'cristina.vargas@example.com'),
('234567890V', 'Alejandro Navarro', 'alejandro.navarro@example.com'),
('345678901W', 'Natalia Romero', 'natalia.romero@example.com'),
('456789012X', 'Diego Fernández', 'diego.fernandez@example.com'),
('567890123Y', 'Paula Mendoza', 'paula.mendoza@example.com'),
('678901234Z', 'Javier Medina', 'javier.medina@example.com'),
('78902345AA', 'Lucía Castro', 'lucia.castro@example.com'),
('89013456AB', 'Marcos Ortega', 'marcos.ortega@example.com'),
('90124567AC', 'Alba Sánchez', 'alba.sanchez@example.com'),
('01235678AD', 'Hugo Pérez', 'hugo.perez@example.com'),
('12346789AE', 'Laura Cordero', 'laura.cordero@example.com'),
('23457890AF', 'Adrián Ramírez', 'adrian.ramirez@example.com'),
('34568901AG', 'Nerea Serrano', 'nerea.serrano@example.com'),
('45679012AH', 'Iván López', 'ivan.lopez@example.com'),
('56780123AI', 'Elena Soto', 'elena.soto@example.com'),
('67891234AJ', 'Sergio Martínez', 'sergio.martinez@example.com'),
('78902345AK', 'Cristina Torres', 'cristina.torres@example.com'),
('89013456AL', 'Carlos Sánchez', 'carlos.sanchez@example.com'),
('90124567AM', 'Laura Pérez', 'laura.perez@example.com');

