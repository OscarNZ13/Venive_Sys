<?php
session_start();
?>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Venive Shop - Modificar Producto</title>
    <link rel="stylesheet" href="../Public/css/style_editproduct.css?v=<?php echo (rand()); ?>" />
</head>

<body>

    <div class="Modify-Box">
        <form action="../Controller/product_controller.php" method="post">
            <h1 class="h1-modify">Modificar Producto</h1>

            <input type="hidden" name="id_producto" value="<?php echo $_POST['id_producto']; ?>">

            <p>Nombre del Producto
                <input type="text" placeholder="Nombre del producto" name="nombre_producto" class="input-nombre-prenda" required>
            </p>

            <p>Precio de Compra
                <input type="number" placeholder="Precio de compra" name="precio_compra" class="input-Precio-Compra" required>
            </p>

            <p>Precio de Venta
                <input type="number" placeholder="Precio de venta" name="precio_venta" class="input-Precio-Venta" required>
            </p>

            <p>Porcentaje de Ganancia
                <input type="number" placeholder="Porcentaje de ganancia" name="porcentaje_ganancia" class="input-Porcentaje-Ganancia" required>
            </p>

            <p>Imagen
                <input type="text" placeholder="URL de la imagen" name="imagen" class="input-imagen" required>
            </p>

            <button class="Btn-Modify" type="submit" value="modify" name="btn_modificar">Modificar</button>

        </form>
    </div>

</body>

</html>