<?php
session_start();

include ('../Model/User_Model.php');
include ('../Db/Connection_db.php');

// Obtener datos del formulario
$username = $_POST['Usuario'];
$password = $_POST['Contrasena'];

$UserModel = new UserModel();

// Intentar registrar al usuario
if ($UserModel->RegisterUser($username, $password, $dbconn)) {
    $_SESSION['Usuario'] = $username;
    header("location: ../View/index.php");
} else {
    header("location: ../View/register.php?error=1");
}