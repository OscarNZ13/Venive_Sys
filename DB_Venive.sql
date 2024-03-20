-- Crear tabla "Usuarios"
CREATE TABLE Usuarios (
    id_usuario NUMBER PRIMARY KEY,
    nombre_usuario VARCHAR2(50),
    contrasena VARCHAR2(200),
    rol VARCHAR2(20) DEFAULT 'Administrador'
);

DELETE FROM Usuarios WHERE id_usuario = 1;

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

CREATE TABLE Tallas (
    id_talla NUMBER PRIMARY KEY,
    talla_abreviada VARCHAR2(3)
);

-- Crear tabla "Productos"
CREATE TABLE Productos (
    id_producto NUMBER PRIMARY KEY,
    nombre_producto VARCHAR2(100),
    precio_compra NUMBER,
    precio_venta NUMBER,
    porcentaje_ganancia NUMBER,
    imagen VARCHAR2(2000)
);

DROP TABLE Productos;

-- Crear tabla "Inventario"
CREATE TABLE Inventario (
    id_producto NUMBER,
    id_talla NUMBER,
    cantidad_disponible NUMBER,
    PRIMARY KEY (id_producto, id_talla), -- Clave primaria compuesta
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto) ON DELETE CASCADE, -- Restricci�n ON DELETE CASCADE
    FOREIGN KEY (id_talla) REFERENCES Tallas(id_talla) -- Clave for�nea para la tabla Tallas
);

DROP TABLE Inventario;

-- Crear tabla "Productos_Categorias"
CREATE TABLE Productos_Categorias (
    id_categoria NUMBER,
    id_producto NUMBER,
    PRIMARY KEY (id_categoria, id_producto), -- Clave primaria compuesta
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto) ON DELETE CASCADE, -- Restricci�n ON DELETE CASCADE
    FOREIGN KEY (id_categoria) REFERENCES Categorias(id_categoria)
);

DROP TABLE Productos_Categorias;

-- Crear tabla "Productos_Sexo"
CREATE TABLE Productos_Sexo (
    id_sexo NUMBER,
    id_producto NUMBER,
    PRIMARY KEY (id_sexo, id_producto), -- Clave primaria compuesta
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto) ON DELETE CASCADE, -- Restricci�n ON DELETE CASCADE
    FOREIGN KEY (id_sexo) REFERENCES Sexo(id_sexo)
);

DROP TABLE Productos_Sexo;

-- Creaci�n de secuencia para el id_usuario en la tabla Usuarios
CREATE SEQUENCE seq_id_usuario
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOMAXVALUE;

-- Creaci�n del trigger para asignar el id_usuario autom�ticamente en la tabla Usuarios
CREATE OR REPLACE TRIGGER tr_id_usuario
BEFORE INSERT ON Usuarios
FOR EACH ROW
BEGIN
    :NEW.id_usuario := seq_id_usuario.NEXTVAL;
END;
/

-- Creaci�n de secuencia para el id_sexo en la tabla Sexo
CREATE SEQUENCE seq_id_sexo
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOMAXVALUE;

-- Creaci�n del trigger para asignar el id_sexo autom�ticamente en la tabla Sexo
CREATE OR REPLACE TRIGGER tr_id_sexo
BEFORE INSERT ON Sexo
FOR EACH ROW
BEGIN
    :NEW.id_sexo := seq_id_sexo.NEXTVAL;
END;
/

-- Creaci�n de secuencia para el id_categoria en la tabla Categorias
CREATE SEQUENCE seq_id_categoria
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOMAXVALUE;

-- Creaci�n del trigger para asignar el id_categoria autom�ticamente en la tabla Categorias
CREATE OR REPLACE TRIGGER tr_id_categoria
BEFORE INSERT ON Categorias
FOR EACH ROW
BEGIN
    :NEW.id_categoria := seq_id_categoria.NEXTVAL;
END;
/

-- Creaci�n de secuencia para el id_talla en la tabla Tallas
CREATE SEQUENCE seq_id_talla
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOMAXVALUE;

-- Creaci�n del trigger para asignar el id_talla autom�ticamente en la tabla Tallas
CREATE OR REPLACE TRIGGER tr_id_talla
BEFORE INSERT ON Tallas
FOR EACH ROW
BEGIN
    :NEW.id_talla := seq_id_talla.NEXTVAL;
END;
/

-- Creaci�n de secuencia para el id_producto en la tabla Productos
CREATE SEQUENCE seq_id_producto
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOMAXVALUE;

-- Creaci�n del trigger para asignar el id_producto autom�ticamente en la tabla Productos
CREATE OR REPLACE TRIGGER tr_id_producto
BEFORE INSERT ON Productos
FOR EACH ROW
BEGIN
    :NEW.id_producto := seq_id_producto.NEXTVAL;
END;
/

-- Inserts para la tabla Usuarios:
INSERT INTO Usuarios (nombre_usuario, contrasena) VALUES ('Oscar', 123);
INSERT INTO Usuarios (nombre_usuario, contrasena) VALUES ('Andres', 456);

-- Inserts para la tabla "Sexo"
INSERT INTO Sexo (nombre_sexo) VALUES ('Hombre');
INSERT INTO Sexo (nombre_sexo) VALUES ('Mujer');

-- Inserts para la tabla "Categorias"
INSERT INTO Categorias (nombre_categoria) VALUES ('Pantalones');
INSERT INTO Categorias (nombre_categoria) VALUES ('Blusas');
INSERT INTO Categorias (nombre_categoria) VALUES ('Chaquetas');
INSERT INTO Categorias (nombre_categoria) VALUES ('Ropa deportiva');

-- Inserts para la tabla Tallas
INSERT INTO Tallas (talla_abreviada) VALUES ('XS');
INSERT INTO Tallas (talla_abreviada) VALUES ('S');
INSERT INTO Tallas (talla_abreviada) VALUES ('M');
INSERT INTO Tallas (talla_abreviada) VALUES ('L');
INSERT INTO Tallas (talla_abreviada) VALUES ('XL');
INSERT INTO Tallas (talla_abreviada) VALUES ('XXL');

-- Inserts para la tabla Productos
INSERT INTO Productos (id_producto, nombre_producto, precio_compra, precio_venta, porcentaje_ganancia, imagen)
VALUES (1, 'Jeans Skinny', 25000, 45000, 80, 'imagen_jeans_skinny.jpg');

INSERT INTO Productos (id_producto, nombre_producto, precio_compra, precio_venta, porcentaje_ganancia, imagen)
VALUES (2, 'Blusa de Encaje Floral', 18000, 35000, 94, 'imagen_blusa_encaje_floral.jpg');

INSERT INTO Productos (id_producto, nombre_producto, precio_compra, precio_venta, porcentaje_ganancia, imagen)
VALUES (3, 'Chaqueta de Cuero Clásica', 40000, 75000, 87, 'imagen_chaqueta_cuero.jpg');

INSERT INTO Productos (id_producto, nombre_producto, precio_compra, precio_venta, porcentaje_ganancia, imagen)
VALUES (4, 'Leggings Deportivos', 15000, 28000, 87, 'imagen_leggings_deportivos.jpg');

INSERT INTO Productos (id_producto, nombre_producto, precio_compra, precio_venta, porcentaje_ganancia, imagen)
VALUES (5, 'Pantalones Cargo', 30000, 55000, 83, 'imagen_pantalones_cargo.jpg');

INSERT INTO Productos (id_producto, nombre_producto, precio_compra, precio_venta, porcentaje_ganancia, imagen)
VALUES (6, 'Camisa de Algodón', 22000, 42000, 91, 'imagen_camisa_algodon.jpg');

INSERT INTO Productos (id_producto, nombre_producto, precio_compra, precio_venta, porcentaje_ganancia, imagen)
VALUES (7, 'Vestido Elegante', 35000, 68000, 94, 'imagen_vestido_elegante.jpg');

INSERT INTO Productos (id_producto, nombre_producto, precio_compra, precio_venta, porcentaje_ganancia, imagen)
VALUES (8, 'Sudadera con Capucha', 28000, 52000, 86, 'imagen_sudadera_capucha.jpg');

INSERT INTO Productos (id_producto, nombre_producto, precio_compra, precio_venta, porcentaje_ganancia, imagen)
VALUES (9, 'Camiseta Deportiva', 18000, 32000, 78, 'imagen_camiseta_deportiva.jpg');

INSERT INTO Productos (id_producto, nombre_producto, precio_compra, precio_venta, porcentaje_ganancia, imagen)
VALUES (10, 'Falda Plisada', 25000, 48000, 92, 'imagen_falda_plisada.jpg');

INSERT INTO Productos (id_producto, nombre_producto, precio_compra, precio_venta, porcentaje_ganancia, imagen)
VALUES (11, 'Abrigo de Lana', 55000, 95000, 73, 'imagen_abrigo_lana.jpg');

INSERT INTO Productos (id_producto, nombre_producto, precio_compra, precio_venta, porcentaje_ganancia, imagen)
VALUES (12, 'Pantalones Vaqueros', 32000, 60000, 88, 'imagen_pantalones_vaqueros.jpg');

INSERT INTO Productos (id_producto, nombre_producto, precio_compra, precio_venta, porcentaje_ganancia, imagen)
VALUES (13, 'Vestido Casual', 40000, 72000, 80, 'imagen_vestido_casual.jpg');

INSERT INTO Productos (id_producto, nombre_producto, precio_compra, precio_venta, porcentaje_ganancia, imagen)
VALUES (14, 'Traje Formal', 70000, 125000, 78, 'imagen_traje_formal.jpg');

INSERT INTO Productos (id_producto, nombre_producto, precio_compra, precio_venta, porcentaje_ganancia, imagen)
VALUES (15, 'Chaqueta Deportiva', 35000, 65000, 85, 'imagen_chaqueta_deportiva.jpg');

INSERT INTO Productos (id_producto, nombre_producto, precio_compra, precio_venta, porcentaje_ganancia, imagen)
VALUES (16, 'Blusa Estampada', 28000, 52000, 86, 'imagen_blusa_estampada.jpg');

INSERT INTO Productos (id_producto, nombre_producto, precio_compra, precio_venta, porcentaje_ganancia, imagen)
VALUES (17, 'Pantalón de Vestir', 42000, 78000, 85, 'imagen_pantalon_vestir.jpg');

INSERT INTO Productos (id_producto, nombre_producto, precio_compra, precio_venta, porcentaje_ganancia, imagen)
VALUES (18, 'Vestido de Noche Elegante', 60000, 110000, 83, 'imagen_vestido_noche_elegante.jpg');

INSERT INTO Productos (id_producto, nombre_producto, precio_compra, precio_venta, porcentaje_ganancia, imagen)
VALUES (19, 'Sweater Cuello V', 25000, 45000, 80, 'imagen_sweater_cuello_v.jpg');

INSERT INTO Productos (id_producto, nombre_producto, precio_compra, precio_venta, porcentaje_ganancia, imagen)
VALUES (20, 'Jeans Rectos', 33000, 60000, 82, 'imagen_jeans_rectos.jpg');

SET SERVEROUTPUT ON;

-- Stored Procedure para la tabla "Usuarios"

-- Insertar --
CREATE OR REPLACE PROCEDURE InsertarUsuario (
    p_nombre_usuario IN VARCHAR2,
    p_contrasena IN VARCHAR2
)
IS
BEGIN
    INSERT INTO Usuarios (nombre_usuario, contrasena)
    VALUES (p_nombre_usuario, p_contrasena);
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Usuario insertado correctamente.');
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error al insertar usuario: ' || SQLERRM);
END;
/

BEGIN
    InsertarUsuario('Miguel', '789');
END;
/

-- Eliminar --
CREATE OR REPLACE PROCEDURE EliminarUsuario (
    p_id_usuario IN NUMBER
)
IS
BEGIN
    DELETE FROM Usuarios WHERE id_usuario = p_id_usuario;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Usuario eliminado correctamente.');
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error al eliminar usuario: ' || SQLERRM);
END;
/

BEGIN
    EliminarUsuario(); --ID del usuario a eliminar
END;
/

-- Mostrar --
CREATE OR REPLACE PROCEDURE MostrarUsuario(
    p_id_usuario IN NUMBER
)
IS
    v_id_usuario Usuarios.id_usuario%TYPE;
    v_nombre_usuario Usuarios.nombre_usuario%TYPE;
    v_rol Usuarios.rol%TYPE;
BEGIN
    -- Seleccionar la informaci�n del usuario
    SELECT id_usuario, nombre_usuario, rol
    INTO v_id_usuario, v_nombre_usuario, v_rol
    FROM Usuarios
    WHERE id_usuario = p_id_usuario;
    
    -- Mostrar la informaci�n del usuario
    DBMS_OUTPUT.PUT_LINE('ID de Usuario: ' || v_id_usuario);
    DBMS_OUTPUT.PUT_LINE('Nombre de Usuario: ' || v_nombre_usuario);
    DBMS_OUTPUT.PUT_LINE('Rol: ' || v_rol);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No se encontr� un usuario con el ID especificado.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al mostrar el usuario: ' || SQLERRM);
END;
/

BEGIN
    MostrarUsuario(); --ID del usuario a mostrar
END;
/

-- Autenticacion de usuario --
CREATE OR REPLACE PROCEDURE Authenticate_User (
    p_username IN VARCHAR2,
    p_password IN VARCHAR2,
    p_auth_status OUT NUMBER
)
AS
    v_count NUMBER;
BEGIN
    -- Verificar si las credenciales son v�lidas
    SELECT COUNT(*) INTO v_count
    FROM Usuarios
    WHERE nombre_usuario = p_username AND contrasena = p_password;
    
    -- Asignar 1 si las credenciales son v�lidas, 0 en caso contrario
    IF v_count > 0 THEN
        p_auth_status := 1; -- Autenticaci�n exitosa
    ELSE
        p_auth_status := 0; -- Autenticaci�n fallida
    END IF;
END;
/

-- Crear nueva prenda
CREATE OR REPLACE PROCEDURE InsertarPrenda (
    p_nombre_producto IN VARCHAR2,
    p_precio_compra IN NUMBER,
    p_precio_venta IN NUMBER,
    p_porcentaje_ganancia IN NUMBER,
    p_imagen IN VARCHAR2
)
IS
BEGIN
    INSERT INTO Productos (nombre_producto, precio_compra, precio_venta, porcentaje_ganancia, imagen)
    VALUES (p_nombre_producto, p_precio_compra, p_precio_venta, p_porcentaje_ganancia, p_imagen);
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Prenda insertada correctamente.');
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error al insertar prenda: ' || SQLERRM);
END;
/

--Ejecutamos
EXEC InsertarPrenda('Camisa', 20, 40, 100, 'imagen_cami.jpg');

-- Eliminar prenda
CREATE OR REPLACE PROCEDURE EliminarPrenda (
    p_id_producto IN NUMBER
)
IS
BEGIN
    DELETE FROM Productos WHERE id_producto = p_id_producto;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Prenda eliminada correctamente.');
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error al eliminar prenda: ' || SQLERRM);
END;
/

--Ejecutamos
EXEC EliminarPrenda(1);

-- Modificar prenda
CREATE OR REPLACE PROCEDURE ModificarPrenda (
    p_id_producto IN NUMBER,
    p_nombre_producto IN VARCHAR2 := NULL,
    p_precio_compra IN NUMBER := NULL,
    p_precio_venta IN NUMBER := NULL,
    p_porcentaje_ganancia IN NUMBER := NULL,
    p_imagen IN VARCHAR2 := NULL
)
IS
BEGIN
    UPDATE Productos
    SET nombre_producto = COALESCE(p_nombre_producto, nombre_producto),
        precio_compra = COALESCE(p_precio_compra, precio_compra),
        precio_venta = COALESCE(p_precio_venta, precio_venta),
        porcentaje_ganancia = COALESCE(p_porcentaje_ganancia, porcentaje_ganancia),
        imagen = COALESCE(p_imagen, imagen)
    WHERE id_producto = p_id_producto;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Prenda modificada correctamente.');
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error al modificar prenda: ' || SQLERRM);
END;
/

--Ejecutamos
EXEC ModificarPrenda(1, 'Nuevo nombre', NULL, 50, NULL, NULL);

-- Mostrar prenda
CREATE OR REPLACE PROCEDURE MostrarPrenda (
    p_id_producto IN NUMBER
)
IS
    v_id_producto Productos.id_producto%TYPE;
    v_nombre_producto Productos.nombre_producto%TYPE;
    v_precio_compra Productos.precio_compra%TYPE;
    v_precio_venta Productos.precio_venta%TYPE;
    v_porcentaje_ganancia Productos.porcentaje_ganancia%TYPE;
    v_imagen Productos.imagen%TYPE;
BEGIN
    SELECT id_producto, nombre_producto, precio_compra, precio_venta, porcentaje_ganancia, imagen
    INTO v_id_producto, v_nombre_producto, v_precio_compra, v_precio_venta, v_porcentaje_ganancia, v_imagen
    FROM Productos
    WHERE id_producto = p_id_producto;
    
    DBMS_OUTPUT.PUT_LINE('ID Producto: ' || v_id_producto);
    DBMS_OUTPUT.PUT_LINE('Nombre Producto: ' || v_nombre_producto);
    DBMS_OUTPUT.PUT_LINE('Precio Compra: ' || v_precio_compra);
    DBMS_OUTPUT.PUT_LINE('Precio Venta: ' || v_precio_venta);
    DBMS_OUTPUT.PUT_LINE('Porcentaje Ganancia: ' || v_porcentaje_ganancia);
    DBMS_OUTPUT.PUT_LINE('Imagen: ' || v_imagen);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No se encontró una prenda con el ID especificado.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al mostrar la prenda: ' || SQLERRM);
END;
/

--Ejecutamos
EXEC MostrarPrenda(1);
