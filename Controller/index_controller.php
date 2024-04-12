<?php
// index_controller.php:

include_once '../Model/User_model.php';
include_once '../Model/Productos_Model.php';
include_once '../Db/connection_db.php';

class IndexController
{
    public function obtenerProductos()
    {
        $productosModel = new ProductosModel();
        $conn = $GLOBALS['dbconn']; // Utiliza la conexión establecida en connection_db.php

        // Obtener los productos del modelo
        $productos = $productosModel->obtenerProductos($conn);

        return $productos;
    }

    public function modificarPrenda($id_producto, $nombre_producto = null, $precio_compra = null, $precio_venta = null, $porcentaje_ganancia = null, $imagen = null) {
        // Obtener la conexión a la base de datos
        $conn = $GLOBALS['dbconn'];
        
        // Crear una instancia del modelo de productos
        $productosModel = new ProductosModel();
        
        // Llamar a la función para modificar la prenda en la base de datos
        $productosModel->modificarPrenda($id_producto, $nombre_producto, $precio_compra, $precio_venta, $porcentaje_ganancia, $imagen, $conn);
    }

    public function obtenerProductosPantalones()
    {
        $productosModel = new ProductosModel();
        $conn = $GLOBALS['dbconn']; // Utiliza la conexión establecida en connection_db.php

        // Obtener los productos del modelo
        $productospant = $productosModel->obtenerProductosPantalones($conn);

        return $productospant;
    }

    public function obtenerProductosBlusas()
    {
        $productosModel = new ProductosModel();
        $conn = $GLOBALS['dbconn']; // Utiliza la conexión establecida en connection_db.php

        // Obtener los productos del modelo
        $productosblusa = $productosModel->ObtenerProductosBlusas($conn);

        return $productosblusa;
    }

    public function obtenerProductosChaquetas()
    {
        $productosModel = new ProductosModel();
        $conn = $GLOBALS['dbconn']; // Utiliza la conexión establecida en connection_db.php

        // Obtener los productos del modelo
        $productoschaquetas = $productosModel->ObtenerProductosChaquetas($conn);

        return $productoschaquetas;
    }

    public function obtenerProductosRopaDeportiva()
    {
        $productosModel = new ProductosModel();
        $conn = $GLOBALS['dbconn']; // Utiliza la conexión establecida en connection_db.php

        // Obtener los productos del modelo
        $productosdeportiva = $productosModel->obtenerProductosRopaDeportiva($conn);

        return $productosdeportiva;
    }

    public function obtenerProductosHombre()
    {
        $productosModel = new ProductosModel();
        $conn = $GLOBALS['dbconn']; // Utiliza la conexión establecida en connection_db.php

        // Obtener los productos del modelo
        $productoshombre = $productosModel->obtenerProductosHombre($conn);

        return $productoshombre;
    }

    public function obtenerProductosMujer()
    {
        $productosModel = new ProductosModel();
        $conn = $GLOBALS['dbconn']; // Utiliza la conexión establecida en connection_db.php

        // Obtener los productos del modelo
        $productosmujer = $productosModel->obtenerProductosMujer($conn);

        return $productosmujer;
    }
}