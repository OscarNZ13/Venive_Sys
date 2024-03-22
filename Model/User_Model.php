<?php
// User_Moder.php:

include ('../Db/Connection_db.php');

class UserModel
{
    public function authenticateUser($username, $password, $conn)
    {
        // Obtener el hash de la contraseña almacenada en la base de datos
        $sql = "SELECT contrasena FROM Usuarios WHERE nombre_usuario = :username";
        $stmt = oci_parse($conn, $sql);
        oci_bind_by_name($stmt, ':username', $username);
        oci_execute($stmt);

        $row = oci_fetch_assoc($stmt);
        $stored_hash = $row['CONTRASENA'];

        // Verificar si el usuario existe y la contraseña es correcta
        if ($stored_hash && password_verify($password, $stored_hash)) {
            return true; // Autenticación exitosa
        } else {
            return false; // Autenticación fallida
        }
    }

    public function RegisterUser($username, $password, $conn)
    {
        //Convertir la contraseña en un hash
        $hashed_password = password_hash($password, PASSWORD_DEFAULT);

        //Llama al procedimiento almacenado
        $sql = "BEGIN InsertarUsuario(:username, :hashed_password); END;";
        $stmt = oci_parse($conn, $sql);

        //Bind de parámetros
        oci_bind_by_name($stmt, ':username', $username);
        oci_bind_by_name($stmt, ':hashed_password', $hashed_password);

        //Ejecutar el procedimiento almacenado
        oci_execute($stmt);

        //Verificar si la consulta se ejecutó correctamente
        $rowsAffected = oci_num_rows($stmt);
        if ($rowsAffected > 0) {
            return true; // Registro exitoso
        } else {
            return false; // Registro fallido
        }
    }

    public function obtenerProductos($conn)
    {
        $productos = array();
        $productos_cursor = oci_new_cursor($conn);

        // Llama al procedimiento almacenado para obtener los productos
        $sql = "BEGIN ObtenerProductos(:productos_cursor); END;";
        $stmt = oci_parse($conn, $sql);

        // Bind de parámetros
        oci_bind_by_name($stmt, ':productos_cursor', $productos_cursor, -1, OCI_B_CURSOR);

        // Ejecutar el procedimiento almacenado
        if (!oci_execute($stmt)) {
            $e = oci_error($stmt);  // Obtiene el error de oci_execute
            trigger_error(htmlentities($e['message'], ENT_QUOTES), E_USER_ERROR);
        }

        // Recuperar los datos del cursor
        oci_execute($productos_cursor);
        while ($row = oci_fetch_assoc($productos_cursor)) {
            $productos[] = $row;
        }

        // Cerrar el cursor y liberar recursos
        oci_free_statement($stmt);
        oci_free_statement($productos_cursor);

        return $productos;
    }
}