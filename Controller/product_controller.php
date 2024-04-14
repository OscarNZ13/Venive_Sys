<?php
session_start();
// product_controller.php:

include_once '../Db/connection_db.php';
include ("../Model/Productos_Model.php");

$conn = $GLOBALS['dbconn'];
$ProductModel = new ProductosModel();

// Verificar si se envió el formulario para crear un nuevo producto
if(isset($_POST['btn_crear'])) {
    $nombreP = $_POST['nombre_producto'];
    $PrecioCompraP = $_POST['precio_compra'];
    $Imagen = $_POST['imagen'];

    if ($ProductModel->NuevoProducto($nombreP, $PrecioCompraP, $Imagen, $conn)) {
        header("location: ../View/index.php");
        exit();
    } else {
        $_SESSION['error'] = "Error en la creacion del producto";
        header("location: ../View/New_Product.php");
        exit();
    }
}

// Verificar si se envió el formulario de edición
if(isset($_POST['accion']) && $_POST['accion'] == 'editar') {

    $id_producto = $_POST['id_producto'];

    header("location: ../View/index.php");
    exit(); 
}

// Verificar si se envió el formulario de eliminación
if(isset($_POST['accion']) && $_POST['accion'] == 'eliminar') {

    $id_producto_eliminar = $_POST['id_producto_eliminar'];

    if ($ProductModel->ElminarPrductos($conn, $id_producto_eliminar)) {
        header("location: ../View/index.php");
        exit();
    } else {
        $_SESSION['error'] = "Error en la creacion del producto";
        header("location: ../View/New_Product.php");
        exit();
    }
}

header("location: ../View/index.php");
?>