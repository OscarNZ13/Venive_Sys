<?php
include ('../Db/Connection_db.php');

class UserModel
{
    public function authenticateUser($username, $password, $conn)
    {
        // Inicializar $auth_status
        $auth_status = 0;

        // Llama al procedimiento almacenado
        $sql = "BEGIN Authenticate_User(:username, :password, :auth_status); END;";
        $stmt = oci_parse($conn, $sql);

        // Bind de parámetros
        oci_bind_by_name($stmt, ':username', $username);
        oci_bind_by_name($stmt, ':password', $password);
        oci_bind_by_name($stmt, ':auth_status', $auth_status, 1); // Tipo de dato OUT

        // Ejecutar el procedimiento almacenado
        oci_execute($stmt);

        // Verificar el resultado
        if ($auth_status == 1) {
            return true; // Autenticación exitosa
        } else {
            return false; // Autenticación fallida
        }
    }


    public function RegisterUser($username, $email, $password, $location)
    {

        // Convertir la contraseña en un hash seguro

        // Verificar si la consulta se ejecutó correctamente


        // Verificar si se encontraron filas en el resultado

    }

    public function ValidarDatos($username, $email, $password, $location)
    {
        // Verificar si algún campo está vacío

        // Verificar si el correo electrónico tiene el formato correcto


        // Verificar si la contraseña tiene al menos 8 caracteres y contiene al menos un número y una letra


        // Si todas las validaciones pasan, devuelve true

    }
}