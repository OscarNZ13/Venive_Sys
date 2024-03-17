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

-- Creación de secuencia para el id_usuario en la tabla Usuarios
CREATE SEQUENCE seq_id_usuario
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOMAXVALUE;

-- Creación del trigger para asignar el id_usuario automáticamente en la tabla Usuarios
CREATE OR REPLACE TRIGGER tr_id_usuario
BEFORE INSERT ON Usuarios
FOR EACH ROW
BEGIN
    :NEW.id_usuario := seq_id_usuario.NEXTVAL;
END;
/

-- Creación de secuencia para el id_sexo en la tabla Sexo
CREATE SEQUENCE seq_id_sexo
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOMAXVALUE;

-- Creación del trigger para asignar el id_sexo automáticamente en la tabla Sexo
CREATE OR REPLACE TRIGGER tr_id_sexo
BEFORE INSERT ON Sexo
FOR EACH ROW
BEGIN
    :NEW.id_sexo := seq_id_sexo.NEXTVAL;
END;
/

-- Creación de secuencia para el id_categoria en la tabla Categorias
CREATE SEQUENCE seq_id_categoria
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOMAXVALUE;

-- Creación del trigger para asignar el id_categoria automáticamente en la tabla Categorias
CREATE OR REPLACE TRIGGER tr_id_categoria
BEFORE INSERT ON Categorias
FOR EACH ROW
BEGIN
    :NEW.id_categoria := seq_id_categoria.NEXTVAL;
END;
/

-- Creación de secuencia para el id_producto en la tabla Productos
CREATE SEQUENCE seq_id_producto
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOMAXVALUE;

-- Creación del trigger para asignar el id_producto automáticamente en la tabla Productos
CREATE OR REPLACE TRIGGER tr_id_producto
BEFORE INSERT ON Productos
FOR EACH ROW
BEGIN
    :NEW.id_producto := seq_id_producto.NEXTVAL;
END;
/

-- Creación de secuencia para el id_inventario en la tabla Inventario
CREATE SEQUENCE seq_id_inventario
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOMAXVALUE;

-- Creación del trigger para asignar el id_inventario automáticamente en la tabla Inventario
CREATE OR REPLACE TRIGGER tr_id_inventario
BEFORE INSERT ON Inventario
FOR EACH ROW
BEGIN
    :NEW.id_inventario := seq_id_inventario.NEXTVAL;
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


--- Deletes ara pruebas: ---
/*
-- Eliminar todos los registros de la tabla Usuarios
DELETE FROM Usuarios;

-- Eliminar todos los registros de la tabla Sexo
DELETE FROM Sexo;

-- Eliminar todos los registros de la tabla Categorias
DELETE FROM Categorias;
*/

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
    -- Seleccionar la información del usuario
    SELECT id_usuario, nombre_usuario, rol
    INTO v_id_usuario, v_nombre_usuario, v_rol
    FROM Usuarios
    WHERE id_usuario = p_id_usuario;
    
    -- Mostrar la información del usuario
    DBMS_OUTPUT.PUT_LINE('ID de Usuario: ' || v_id_usuario);
    DBMS_OUTPUT.PUT_LINE('Nombre de Usuario: ' || v_nombre_usuario);
    DBMS_OUTPUT.PUT_LINE('Rol: ' || v_rol);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No se encontró un usuario con el ID especificado.');
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
    -- Verificar si las credenciales son válidas
    SELECT COUNT(*) INTO v_count
    FROM Usuarios
    WHERE nombre_usuario = p_username AND contrasena = p_password;
    
    -- Asignar 1 si las credenciales son válidas, 0 en caso contrario
    IF v_count > 0 THEN
        p_auth_status := 1; -- Autenticación exitosa
    ELSE
        p_auth_status := 0; -- Autenticación fallida
    END IF;
END;
/
