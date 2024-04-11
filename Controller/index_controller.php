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
}