<?php
// Credenciales de la base de datos
$usuario = 'Venive_sys';
$contraseña = '202425';
$bd_nombre = 'BD_Venive';
$host = 'localhost';

// Intentar la conexión
$conn = oci_connect($usuario, $contraseña, "//{$host}/{$bd_nombre}");

// Verificar si la conexión se realizó correctamente
if (!$conn) {
    $error = oci_error();
    echo "Falló la conexión a la base de datos: " . $error['message'];
} else {
    echo "Conexión exitosa a Oracle!";
    
    // Puedes realizar consultas u otras operaciones aquí
    
    // Cuando hayas terminado, cierra la conexión
    oci_close($conn);
}