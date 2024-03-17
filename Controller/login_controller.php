<?php
session_start();

include('../Model/User_Model.php');

// Incluye la conexión a la base de datos
include('../Db/Connection_db.php');

$username = $_POST['Usuario'];
$password = $_POST['Contrasena'];

$UserModel = new UserModel();
if ($UserModel->authenticateUser($username, $password, $dbconn)) {
    $_SESSION['Usuario'] = $username;
    header("location: ../View/index.php");
} else {
    $_SESSION['error'] = "Usuario o contraseña incorrectos";
    header("location: ../View/login.php");
}
