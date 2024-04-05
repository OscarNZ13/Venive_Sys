<?php
// index_controller.php:

include_once '../Model/User_model.php';
include_once '../Db/connection_db.php';

class IndexController
{
    public function obtenerProductos()
    {
        $userModel = new UserModel();
        $conn = $GLOBALS['dbconn']; // Utiliza la conexión establecida en connection_db.php

        // Obtener los productos del modelo
        $productos = $userModel->obtenerProductos($conn);

        return $productos;
    }

    public function obtenerProductosPantalones()
    {
        $userModel = new UserModel();
        $conn = $GLOBALS['dbconn']; // Utiliza la conexión establecida en connection_db.php

        // Obtener los productos del modelo
        $productospant = $userModel->obtenerProductosPantalones($conn);

        return $productospant;
    }

    public function obtenerProductosBlusas()
    {
        $userModel = new UserModel();
        $conn = $GLOBALS['dbconn']; // Utiliza la conexión establecida en connection_db.php

        // Obtener los productos del modelo
        $productosblusa = $userModel->ObtenerProductosBlusas($conn);

        return $productosblusa;
    }
}