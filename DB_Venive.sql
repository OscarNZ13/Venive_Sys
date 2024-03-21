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

SET SERVEROUTPUT ON;

-- Stored Procedure para la tabla "Usuarios"
-- Inserts para tabla Productos

--Blusas
INSERT INTO Productos (nombre_producto, precio_compra, precio_venta, porcentaje_ganancia, imagen) VALUES
('Blusa de Algodón', 15, 30, 100, 'camisa_algodon.jpg');
INSERT INTO Productos (nombre_producto, precio_compra, precio_venta, porcentaje_ganancia, imagen) VALUES
('Blusa Peplum de Rayas', 18, 36, 100, 'blusa_peplum.jpg');

INSERT INTO Productos (nombre_producto, precio_compra, precio_venta, porcentaje_ganancia, imagen) VALUES
('Blusa Transparente de Lunares', 19, 38, 100, 'blusa_transparente.jpg');

INSERT INTO Productos (nombre_producto, precio_compra, precio_venta, porcentaje_ganancia, imagen) VALUES
('Blusa de Lino Básica', 15, 30, 100, 'blusa_lino.jpg');

INSERT INTO Productos (nombre_producto, precio_compra, precio_venta, porcentaje_ganancia, imagen) VALUES
('Blusa Cropped de Algodón', 17, 34, 100, 'blusa_cropped.jpg');

INSERT INTO Productos (nombre_producto, precio_compra, precio_venta, porcentaje_ganancia, imagen) VALUES
('Blusa Asimétrica de Moda', 24, 48, 100, 'blusa_asimetrica.jpg');

INSERT INTO Productos (nombre_producto, precio_compra, precio_venta, porcentaje_ganancia, imagen) VALUES
('Blusa Cruzada de Gasa', 21, 42, 100, 'blusa_gasa.jpg');

INSERT INTO Productos (nombre_producto, precio_compra, precio_venta, porcentaje_ganancia, imagen) VALUES
('Blusa con Volantes en los Hombros', 23, 46, 100, 'blusa_volantes.jpg');

INSERT INTO Productos (nombre_producto, precio_compra, precio_venta, porcentaje_ganancia, imagen) VALUES
('Blusa Estampada de Flores', 20, 40, 100, 'blusa_flores.jpg');

--Jeans

INSERT INTO Productos (nombre_producto, precio_compra, precio_venta, porcentaje_ganancia, imagen) VALUES
('Jeans Clasicos Colombianos', 20, 45, 125, 'jeans_clasicos.jpg');
INSERT INTO Productos (nombre_producto, precio_compra, precio_venta, porcentaje_ganancia, imagen) VALUES
('Pantalon Colombiano de Tiro Alto', 30, 60, 100, 'pantalon_tiro_alto.jpg');

INSERT INTO Productos (nombre_producto, precio_compra, precio_venta, porcentaje_ganancia, imagen) VALUES
('Pantalon Levanta Cola Azul', 35, 70, 100, 'pantalon_levanta_cola_azul.jpg');

INSERT INTO Productos (nombre_producto, precio_compra, precio_venta, porcentaje_ganancia, imagen) VALUES
('Pantalon Colombiano Push Up', 32, 64, 100, 'pantalon_push_up.jpg');

INSERT INTO Productos (nombre_producto, precio_compra, precio_venta, porcentaje_ganancia, imagen) VALUES
('Pantalon Colombiano de Cintura Alta', 28, 56, 100, 'pantalon_cintura_alta.jpg');

INSERT INTO Productos (nombre_producto, precio_compra, precio_venta, porcentaje_ganancia, imagen) VALUES
('Pantalon Colombiano Estampado Floral', 33, 66, 100, 'pantalon_estampado_floral.jpg');

INSERT INTO Productos (nombre_producto, precio_compra, precio_venta, porcentaje_ganancia, imagen) VALUES
('Pantalon Colombiano de Cuero Sintético', 40, 80, 100, 'pantalon_cuero_sintetico.jpg');

INSERT INTO Productos (nombre_producto, precio_compra, precio_venta, porcentaje_ganancia, imagen) VALUES
('Pantalon Colombiano Skinny Negro', 30, 60, 100, 'pantalon_skinny_negro.jpg');

INSERT INTO Productos (nombre_producto, precio_compra, precio_venta, porcentaje_ganancia, imagen) VALUES
('Pantalon Colombiano Acampanado', 32, 64, 100, 'pantalon_acampanado.jpg');

INSERT INTO Productos (nombre_producto, precio_compra, precio_venta, porcentaje_ganancia, imagen) VALUES
('Pantalon Colombiano Jogger', 35, 70, 100, 'pantalon_jogger.jpg');

INSERT INTO Productos (nombre_producto, precio_compra, precio_venta, porcentaje_ganancia, imagen) VALUES
('Pantalon Colombiano Cargo', 38, 76, 100, 'pantalon_cargo.jpg');


--Ropa deportiva

INSERT INTO Productos (nombre_producto, precio_compra, precio_venta, porcentaje_ganancia, imagen) VALUES
('Sudadera con Capucha', 25, 50, 100, 'sudadera_capucha.jpg');
INSERT INTO Productos (nombre_producto, precio_compra, precio_venta, porcentaje_ganancia, imagen) VALUES
('Leggings Deportivos Fit', 20, 40, 100, 'leggings_fit.jpg');

INSERT INTO Productos (nombre_producto, precio_compra, precio_venta, porcentaje_ganancia, imagen) VALUES
('Top Deportivo Breathe', 15, 30, 100, 'top_breathe.jpg');

INSERT INTO Productos (nombre_producto, precio_compra, precio_venta, porcentaje_ganancia, imagen) VALUES
('Conjunto Deportivo Energy', 35, 70, 100, 'conjunto_energy.jpg');

INSERT INTO Productos (nombre_producto, precio_compra, precio_venta, porcentaje_ganancia, imagen) VALUES
('Shorts Deportivos Runner', 18, 36, 100, 'shorts_runner.jpg');

INSERT INTO Productos (nombre_producto, precio_compra, precio_venta, porcentaje_ganancia, imagen) VALUES
('Camiseta Deportiva Flex', 22, 44, 100, 'camiseta_flex.jpg');

INSERT INTO Productos (nombre_producto, precio_compra, precio_venta, porcentaje_ganancia, imagen) VALUES
('Sudadera Deportiva Zip', 25, 50, 100, 'sudadera_zip.jpg');

INSERT INTO Productos (nombre_producto, precio_compra, precio_venta, porcentaje_ganancia, imagen) VALUES
('Pantalón Deportivo Comfy', 24, 48, 100, 'pantalon_comfy.jpg');

INSERT INTO Productos (nombre_producto, precio_compra, precio_venta, porcentaje_ganancia, imagen) VALUES
('Tank Top Active', 16, 32, 100, 'tank_top_active.jpg');

INSERT INTO Productos (nombre_producto, precio_compra, precio_venta, porcentaje_ganancia, imagen) VALUES
('Chaqueta Deportiva Windbreaker', 30, 60, 100, 'chaqueta_windbreaker.jpg');

INSERT INTO Productos (nombre_producto, precio_compra, precio_venta, porcentaje_ganancia, imagen) VALUES
('Capris Deportivos Stretch', 21, 42, 100, 'capris_stretch.jpg');


--Chaquetas

INSERT INTO Productos (nombre_producto, precio_compra, precio_venta, porcentaje_ganancia, imagen) VALUES
('Chaqueta de Cuero City Nights', 50, 100, 100, 'chaqueta_cuero_city.jpg');

INSERT INTO Productos (nombre_producto, precio_compra, precio_venta, porcentaje_ganancia, imagen) VALUES
('Blazer Elegance Fit', 40, 80, 100, 'blazer_elegance.jpg');

INSERT INTO Productos (nombre_producto, precio_compra, precio_venta, porcentaje_ganancia, imagen) VALUES
('Chaqueta Vaquera Classic', 30, 60, 100, 'chaqueta_vaquera_classic.jpg');

INSERT INTO Productos (nombre_producto, precio_compra, precio_venta, porcentaje_ganancia, imagen) VALUES
('Chaqueta Bomber Floral', 35, 70, 100, 'bomber_floral.jpg');

INSERT INTO Productos (nombre_producto, precio_compra, precio_venta, porcentaje_ganancia, imagen) VALUES
('Parka Verde Explorer', 45, 90, 100, 'parka_verde_explorer.jpg');

INSERT INTO Productos (nombre_producto, precio_compra, precio_venta, porcentaje_ganancia, imagen) VALUES
('Chaqueta Puffer Winter Dream', 50, 100, 100, 'puffer_winter_dream.jpg');

INSERT INTO Productos (nombre_producto, precio_compra, precio_venta, porcentaje_ganancia, imagen) VALUES
('Gabardina Clasica Rainy Days', 55, 110, 100, 'gabardina_classic.jpg');

INSERT INTO Productos (nombre_producto, precio_compra, precio_venta, porcentaje_ganancia, imagen) VALUES
('Chaqueta de Piel Soft Touch', 60, 120, 100, 'chaqueta_piel_soft.jpg');

INSERT INTO Productos (nombre_producto, precio_compra, precio_venta, porcentaje_ganancia, imagen) VALUES
('Chaqueta Impermeable Adventure', 40, 80, 100, 'impermeable_adventure.jpg');

INSERT INTO Productos (nombre_producto, precio_compra, precio_venta, porcentaje_ganancia, imagen) VALUES
('Cardigan Largo Cozy Evenings', 35, 70, 100, 'cardigan_cozy.jpg');


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
