<?php
session_start();
// product_controller.php:

include_once '../Db/connection_db.php';
include("../Model/Productos_Model.php");

$conn = $GLOBALS['dbconn'];
$ProductModel = new ProductosModel();

// Verificar si se envió el formulario para crear un nuevo producto
if (isset($_POST['btn_crear'])) {
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
if (isset($_POST['accion']) && $_POST['accion'] == 'editar') {

    $id_producto = $_POST['id_producto'];

    header("location: ../View/index.php");
    exit();
}

// Verificar si se envió el formulario de eliminación
if (isset($_POST['accion']) && $_POST['accion'] == 'eliminar') {

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

// Verificar si se recibieron los datos del formulario de modificación de producto
if (isset($_POST['btn_modificar'])) {
    // Verificar si se recibieron todos los datos del formulario
    if (isset($_POST['id_producto']) && isset($_POST['nombre_producto']) && isset($_POST['precio_compra']) && isset($_POST['precio_venta']) && isset($_POST['porcentaje_ganancia']) && isset($_POST['imagen'])) {
        // Obtener los datos del formulario
        $id_producto = $_POST['id_producto'];
        $nombre_producto = $_POST['nombre_producto'];
        $precio_compra = $_POST['precio_compra'];
        $precio_venta = $_POST['precio_venta'];
        $porcentaje_ganancia = $_POST['porcentaje_ganancia'];
        $imagen = $_POST['imagen'];

        // Crear una instancia del modelo de productos
        $productosModel = new ProductosModel();

        // Llamar al método para editar el producto
        $resultado = $productosModel->editarProducto($id_producto, $nombre_producto, $precio_compra, $precio_venta, $porcentaje_ganancia, $imagen, $conn);

        // Verificar el resultado y redirigir según corresponda
        if ($resultado === true) {
            // Operación exitosa, redirigir a alguna página de éxito
            header("Location: ../View/index.php");
            exit();
        } else {
            // Ocurrió un error, redirigir a alguna página de error mostrando el mensaje
            $_SESSION['error'] = "Error en la edición del producto";
            header("location: ../View/edit_product.php");
            exit();
        }
    } else {
        // No se recibieron todos los datos del formulario, redirigir a alguna página de error
        header("Location: ../View/edit_product.php?mensaje=No se recibieron todos los datos del formulario");
        exit();
    }
}

header("location: ../View/index.php");
