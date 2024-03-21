<?php
include_once '../Model/User_model.php';
include_once '../Db/connection_db.php';

class IndexController
{
    public function obtenerProductos()
    {
        $userModel = new UserModel();
        $conn = $GLOBALS['dbconn']; // Utiliza la conexión establecida en connection_db.php

        // Inicializar la variable para el cursor de productos
        $productos_cursor = oci_new_cursor($conn);

        // Obtener los productos del modelo
        $productos = $userModel->obtenerProductos($conn, $productos_cursor);

        // Cerrar el cursor
        oci_free_statement($productos_cursor);

        return $productos;
    }
}

