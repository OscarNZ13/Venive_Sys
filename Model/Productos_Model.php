<?php
// Productos_Model.php

include ('../Db/Connection_db.php');

class ProductosModel {

    public function ElminarPrductos($conn, $id_producto) {
        //Creacion de sentencia:
        $sql = "BEGIN EliminarPrenda(:p_id_producto); END;";

        //Preparacion de sentencia:
        $stmt = oci_parse($conn, $sql);

        //Asignacion de bins para prevenir inyecciones SQL:
        oci_bind_by_name($stmt, ':p_id_producto', $id_producto, -1, SQLT_CHR);

        //Ejecucion de la sentencia:
        oci_execute($stmt);

        if($stmt!=true){
            echo "No se pudo eliminar el producto correctamente";
        }
    } 
}
$conn = $GLOBALS['dbconn'];

$P1 = new ProductosModel();

$P1->ElminarPrductos($conn, 146);