<?php
// Datos de conexión
$usuario = 'HR';
$contraseña = '12345';
$base_de_datos = 'DB_With_Schema';

// Intenta establecer la conexión
$conn = oci_connect($usuario, $contraseña, $base_de_datos);

// Verifica si la conexión fue exitosa
if (!$conn) {
    $m = oci_error();
    echo $m['message'], "\n";
    exit;
} else {
    echo "Conexión exitosa a Oracle SQL";
}

// Cierra la conexión al terminar
oci_close($conn);
?>
