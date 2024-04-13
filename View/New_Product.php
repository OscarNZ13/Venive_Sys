<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Venive Shop</title>
    <link rel="stylesheet" href="../Public/css/new_product_style.css?php echo (rand()); ?>"">
</head>

<body>

    <div class="Login-Box">
        <form action="../Controller/product_controller.php" method="post">
            <h1 class="h1-2">Nuevo Producto</h1>

            <p>Nombre del Producto
                <input type="text" placeholder="Nombre del producto" name="nombre_producto" class="input-nombre-prenda" required>
            </p>

            <p>Precio de Compra
                <input type="number" placeholder="Precio de compra" name="precio_compra" class="input-Precio-Compra" required>
            </p>

            <p>Imagen
                <input type="text" placeholder="URL de la imagen" name="imagen" class="input-imagen" required>
            </p>

            <button class="Btn-Register-2" type="submit" value="register" name="btn_crear">Crear</button>

        </form>
    </div>

</body>

</html>