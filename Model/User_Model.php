<?php
// User_Moder.php:

include('../Db/Connection_db.php');

class UserModel
{
    public function authenticateUser($username, $password, $conn) {
        // Inicializar la variable $user_cursor como un recurso de cursor
        $user_cursor = oci_new_cursor($conn);
    
        // Llama al procedimiento almacenado para obtener el registro de usuario
        $stmt = oci_parse($conn, "BEGIN GetUserByUsername(:username, :user_cursor); END;");
        oci_bind_by_name($stmt, ':username', $username);
        oci_bind_by_name($stmt, ':user_cursor', $user_cursor, -1, OCI_B_CURSOR);
    
        // Ejecutar el procedimiento almacenado
        oci_execute($stmt);
    
        // Verificar errores en la ejecución
        $error = oci_error($stmt);
        if ($error) {
            echo "Error: " . $error['message'];
            exit;
        }
    
        // Recupera el resultado del cursor
        oci_execute($user_cursor);
    
        // Recupera el usuario de la consulta
        $user = oci_fetch_assoc($user_cursor);
    
        // Verifica si el usuario existe y si la contraseña es válida
        if ($user && password_verify($password, $user['CONTRASENA'])) {
            return true; // Autenticación exitosa
        } else {
            return false; // Autenticación fallida o usuario no encontrado
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
}
