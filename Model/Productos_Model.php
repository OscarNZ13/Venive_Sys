<?php
// Productos_Model.php

include ('../Db/Connection_db.php');

class ProductosModel {

    public function NuevoProducto($nombreP, $PrecioCompraP, $Imagen, $conn) {
        // Declarar la sentencia SQL para llamar al procedimiento almacenado
        $sql = "BEGIN InsertarNuevoProducto(:nombre_producto, :precio_compra, :imagen); END;";
    
        // Preparar la sentencia
        $stmt = oci_parse($conn, $sql);
    
        // Vincular los parámetros
        oci_bind_by_name($stmt, ':nombre_producto', $nombreP);
        oci_bind_by_name($stmt, ':precio_compra', $PrecioCompraP);
        oci_bind_by_name($stmt, ':imagen', $Imagen);
    
        // Ejecutar la sentencia
        if (oci_execute($stmt)) {
            // Liberar recursos
            oci_free_statement($stmt);
            // Devolver true si se insertó correctamente
            return true;
        } else {
            // Obtener el error
            $e = oci_error($stmt);
            // Liberar recursos
            oci_free_statement($stmt);
            // Imprimir el error (puedes manejarlo de otra forma si lo prefieres)
            echo "Error al insertar el producto: " . htmlentities($e['message']);
            // Devolver false si hubo un error
            return false;
        }
    }

    public function ElminarPrductos($conn, $id_producto) {
        //Creacion de sentencia:
        $sql = "BEGIN EliminarPrenda(:p_id_producto); END;";
    
        //Preparacion de sentencia:
        $stmt = oci_parse($conn, $sql);
    
        //Asignacion de bins para prevenir inyecciones SQL:
        oci_bind_by_name($stmt, ':p_id_producto', $id_producto, -1, SQLT_CHR);
    
        //Ejecucion de la sentencia:
        $result = oci_execute($stmt);
    
        // Verificar el resultado y devolver un booleano
        if($result) {
            return true; // Éxito al eliminar el producto
        } else {
            return false; // Error al eliminar el producto
        }
    }
    
    function modificarPrenda($id_producto, $nombre_producto = null, $precio_compra = null, $precio_venta = null, $porcentaje_ganancia = null, $imagen = null, $conn) {
        // Preparar la sentencia SQL para llamar al procedimiento almacenado
        $sql = "BEGIN ModificarPrenda(:p_id_producto, :p_nombre_producto, :p_precio_compra, :p_precio_venta, :p_porcentaje_ganancia, :p_imagen); END;";
        
        // Preparar la sentencia para su ejecución
        $stmt = oci_parse($conn, $sql);
        
        // Bind de parámetros
        oci_bind_by_name($stmt, ':p_id_producto', $id_producto);
        oci_bind_by_name($stmt, ':p_nombre_producto', $nombre_producto);
        oci_bind_by_name($stmt, ':p_precio_compra', $precio_compra);
        oci_bind_by_name($stmt, ':p_precio_venta', $precio_venta);
        oci_bind_by_name($stmt, ':p_porcentaje_ganancia', $porcentaje_ganancia);
        oci_bind_by_name($stmt, ':p_imagen', $imagen);
        
        // Ejecutar la sentencia
        if (oci_execute($stmt)) {
            echo "Prenda modificada correctamente.";
        } else {
            $e = oci_error($stmt);  // Obtiene el error de oci_execute
            echo "Error al modificar prenda: " . htmlentities($e['message']);
        }
        
        // Cerrar el statement
        oci_free_statement($stmt);
    }

    public function obtenerProductos($conn)
    {
        $productos = array();
        $productos_cursor = oci_new_cursor($conn);

        // Llama al procedimiento almacenado para obtener los productos
        $sql = "BEGIN ObtenerProductos(:productos_cursor); END;";
        $stmt = oci_parse($conn, $sql);

        // Bind de parámetros
        oci_bind_by_name($stmt, ':productos_cursor', $productos_cursor, -1, OCI_B_CURSOR);

        // Ejecutar el procedimiento almacenado
        if (!oci_execute($stmt)) {
            $e = oci_error($stmt);  // Obtiene el error de oci_execute
            trigger_error(htmlentities($e['message'], ENT_QUOTES), E_USER_ERROR);
        }

        // Recuperar los datos del cursor
        oci_execute($productos_cursor);
        while ($row = oci_fetch_assoc($productos_cursor)) {
            $productos[] = $row;
        }

        // Cerrar el cursor y liberar recursos
        oci_free_statement($stmt);
        oci_free_statement($productos_cursor);

        return $productos;
    }

    public function obtenerProductosPantalones($conn)
    {
        $productospant = array();
        $productos_cursor = oci_new_cursor($conn);

        // Llama al procedimiento almacenado para obtener los productos que son pantalones
        $sql = "BEGIN ObtenerProductosPantalon(:productos_cursor); END;";
        $stmt = oci_parse($conn, $sql);

        // Bind de parámetros
        oci_bind_by_name($stmt, ':productos_cursor', $productos_cursor, -1, OCI_B_CURSOR);

        // Ejecutar el procedimiento almacenado
        if (!oci_execute($stmt)) {
            $e = oci_error($stmt);  // Obtiene el error de oci_execute
            trigger_error(htmlentities($e['message'], ENT_QUOTES), E_USER_ERROR);
        }

        // Recuperar los datos del cursor
        oci_execute($productos_cursor);
        while ($row = oci_fetch_assoc($productos_cursor)) {
            $productospant[] = $row;
        }

        // Cerrar el cursor y liberar recursos
        oci_free_statement($stmt);
        oci_free_statement($productos_cursor);

        return $productospant;
    }

    public function obtenerProductosBlusas($conn)
    {
        $productosblusa = array();
        $productos_cursor = oci_new_cursor($conn);

        // Llama al procedimiento almacenado para obtener los productos que son blusas
        $sql = "BEGIN ObtenerProductosBlusas(:productos_cursor); END;";
        $stmt = oci_parse($conn, $sql);

        // Bind de parámetros
        oci_bind_by_name($stmt, ':productos_cursor', $productos_cursor, -1, OCI_B_CURSOR);

        // Ejecutar el procedimiento almacenado
        if (!oci_execute($stmt)) {
            $e = oci_error($stmt);  // Obtiene el error de oci_execute
            trigger_error(htmlentities($e['message'], ENT_QUOTES), E_USER_ERROR);
        }

        // Recuperar los datos del cursor
        oci_execute($productos_cursor);
        while ($row = oci_fetch_assoc($productos_cursor)) {
            $productosblusa[] = $row;
        }

        // Cerrar el cursor y liberar recursos
        oci_free_statement($stmt);
        oci_free_statement($productos_cursor);

        return $productosblusa;
    }

    public function obtenerProductosChaquetas($conn)
    {
        $productoschaquetas = array();
        $productos_cursor = oci_new_cursor($conn);

        // Llama al procedimiento almacenado para obtener los productos que son chaquetas
        $sql = "BEGIN ObtenerProductosChaquetas(:productos_cursor); END;";
        $stmt = oci_parse($conn, $sql);

        // Bind de parámetros
        oci_bind_by_name($stmt, ':productos_cursor', $productos_cursor, -1, OCI_B_CURSOR);

        // Ejecutar el procedimiento almacenado
        if (!oci_execute($stmt)) {
            $e = oci_error($stmt);  // Obtiene el error de oci_execute
            trigger_error(htmlentities($e['message'], ENT_QUOTES), E_USER_ERROR);
        }

        // Recuperar los datos del cursor
        oci_execute($productos_cursor);
        while ($row = oci_fetch_assoc($productos_cursor)) {
            $productoschaquetas[] = $row;
        }

        // Cerrar el cursor y liberar recursos
        oci_free_statement($stmt);
        oci_free_statement($productos_cursor);

        return $productoschaquetas;
    }

    public function obtenerProductosRopaDeportiva($conn)
    {
        $productosdeportiva = array();
        $productos_cursor = oci_new_cursor($conn);

        // Llama al procedimiento almacenado para obtener los productos que ropa deportiva
        $sql = "BEGIN ObtenerProductosRopaDeportiva(:productos_cursor); END;";
        $stmt = oci_parse($conn, $sql);

        // Bind de parámetros
        oci_bind_by_name($stmt, ':productos_cursor', $productos_cursor, -1, OCI_B_CURSOR);

        // Ejecutar el procedimiento almacenado
        if (!oci_execute($stmt)) {
            $e = oci_error($stmt);  // Obtiene el error de oci_execute
            trigger_error(htmlentities($e['message'], ENT_QUOTES), E_USER_ERROR);
        }

        // Recuperar los datos del cursor
        oci_execute($productos_cursor);
        while ($row = oci_fetch_assoc($productos_cursor)) {
            $productosdeportiva[] = $row;
        }

        // Cerrar el cursor y liberar recursos
        oci_free_statement($stmt);
        oci_free_statement($productos_cursor);

        return $productosdeportiva;
    }

    public function obtenerProductosHombre($conn)
    {
        $productoshombre = array();
        $productos_cursor = oci_new_cursor($conn);

        // Llama al procedimiento almacenado para obtener los productos que son para hombres
        $sql = "BEGIN ObtenerProductosHombre(:productos_cursor); END;";
        $stmt = oci_parse($conn, $sql);

        // Bind de parámetros
        oci_bind_by_name($stmt, ':productos_cursor', $productos_cursor, -1, OCI_B_CURSOR);

        // Ejecutar el procedimiento almacenado
        if (!oci_execute($stmt)) {
            $e = oci_error($stmt);  // Obtiene el error de oci_execute
            trigger_error(htmlentities($e['message'], ENT_QUOTES), E_USER_ERROR);
        }

        // Recuperar los datos del cursor
        oci_execute($productos_cursor);
        while ($row = oci_fetch_assoc($productos_cursor)) {
            $productoshombre[] = $row;
        }

        // Cerrar el cursor y liberar recursos
        oci_free_statement($stmt);
        oci_free_statement($productos_cursor);

        return $productoshombre;
    }

    public function obtenerProductosMujer($conn)
    {
        $productosmujer = array();
        $productos_cursor = oci_new_cursor($conn);

        // Llama al procedimiento almacenado para obtener los productos que son para hombres
        $sql = "BEGIN ObtenerProductosMujer(:productos_cursor); END;";
        $stmt = oci_parse($conn, $sql);

        // Bind de parámetros
        oci_bind_by_name($stmt, ':productos_cursor', $productos_cursor, -1, OCI_B_CURSOR);

        // Ejecutar el procedimiento almacenado
        if (!oci_execute($stmt)) {
            $e = oci_error($stmt);  // Obtiene el error de oci_execute
            trigger_error(htmlentities($e['message'], ENT_QUOTES), E_USER_ERROR);
        }

        // Recuperar los datos del cursor
        oci_execute($productos_cursor);
        while ($row = oci_fetch_assoc($productos_cursor)) {
            $productosmujer[] = $row;
        }

        // Cerrar el cursor y liberar recursos
        oci_free_statement($stmt);
        oci_free_statement($productos_cursor);

        return $productosmujer;
    }
}