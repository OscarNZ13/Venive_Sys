<?php
// Connection_db.php:

$usuario = 'Venive_User';
$contrasena = '202425';
$host = 'localhost/orcl';

$dbconn = oci_connect($usuario, $contrasena, $host);

if (!$dbconn) {
    $error = oci_error();
    trigger_error(htmlentities($error['message'], ENT_QUOTES), E_USER_ERROR);
} else {
    echo '';
}