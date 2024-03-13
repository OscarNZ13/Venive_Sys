-- Crear tabla "Sexo"
CREATE TABLE Sexo (
    id_sexo NUMBER PRIMARY KEY,
    nombre_sexo VARCHAR2(20)
);

-- Crear tabla "Categorias"
CREATE TABLE Categorias (
    id_categoria NUMBER PRIMARY KEY,
    nombre_categoria VARCHAR2(50)
);

-- Crear tabla "Productos"
CREATE TABLE Productos (
    id_producto NUMBER PRIMARY KEY,
    nombre_producto VARCHAR2(100),
    tipo VARCHAR2(50),
    precio_compra NUMBER,
    precio_venta NUMBER,
    porcentaje_ganancia NUMBER,
    imagen VARCHAR2(200)
);

-- Crear tabla "Inventario"
CREATE TABLE Inventario (
    id_inventario NUMBER PRIMARY KEY,
    id_producto NUMBER,
    talla VARCHAR2(10),
    cantidad_disponible NUMBER,
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto)
);

-- Crear tabla "Productos_Categorias"
CREATE TABLE Productos_Categorias (
    id_producto_categoria NUMBER PRIMARY KEY,
    id_producto NUMBER,
    id_categoria NUMBER,
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto),
    FOREIGN KEY (id_categoria) REFERENCES Categorias(id_categoria)
);

-- Crear tabla "Productos_Sexo"
CREATE TABLE Productos_Sexo (
    id_producto_sexo NUMBER PRIMARY KEY,
    id_producto NUMBER,
    id_sexo NUMBER,
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto),
    FOREIGN KEY (id_sexo) REFERENCES Sexo(id_sexo)
);

-- Inserts para la tabla "Sexo"
INSERT INTO Sexo (id_sexo, nombre_sexo) VALUES (1, 'Hombre');
INSERT INTO Sexo (id_sexo, nombre_sexo) VALUES (2, 'Mujer');

-- Inserts para la tabla "Categorias"
INSERT INTO Categorias (id_categoria, nombre_categoria) VALUES (1, 'Pantalones');
INSERT INTO Categorias (id_categoria, nombre_categoria) VALUES (2, 'Blusas');
INSERT INTO Categorias (id_categoria, nombre_categoria) VALUES (3, 'Chaquetas');
INSERT INTO Categorias (id_categoria, nombre_categoria) VALUES (4, 'Ropa deportiva');