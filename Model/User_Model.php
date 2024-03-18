<?php
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
}