<?php
session_start();

// Verificar si se recibieron los datos del formulario
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['id_producto'], $_POST['nombre_producto'], $_POST['precio_venta'])) {
    // Obtener los datos del formulario
    $id_producto = $_POST['id_producto'];
    $nombre_producto = $_POST['nombre_producto'];
    $precio_venta = $_POST['precio_venta'];

    // Incluir el controlador para modificar la prenda
    include_once '../Controller/index_controller.php';

    // Crear una instancia del controlador
    $indexController = new IndexController();

    // Llamar a la función para modificar la prenda
    $indexController->modificarPrenda($id_producto, $nombre_producto, null, $precio_venta, null, null);

    // Redireccionar a la página principal después de modificar la prenda
    header("Location: index.php");
    exit;
}
?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modificar Prenda</title>
    <link href="../Public/css/style.css" rel="stylesheet">
    <!-- Agrega cualquier otra hoja de estilos que necesites -->
</head>
<body>
    <section class="layout">
        <!-- Encabezado -->
        <div class="header">
            <h1>Modificar Prenda</h1>
            <!-- Agrega cualquier elemento de navegación o branding aquí -->
        </div>

        <!-- Contenido principal -->
        <div class="main">
            <!-- Formulario para modificar la prenda -->
            <form action="../Controller/modificar_prenda_controller.php" method="POST">
                <input type="hidden" name="id_producto" value="<?php echo $id_producto; ?>">
                <label for="nombre">Nombre de la Prenda:</label><br>
                <input type="text" id="nombre" name="nombre_producto" value="<?php echo $nombre_producto; ?>"><br>
                <label for="precio_compra">Precio de Compra:</label><br>
                <input type="text" id="precio_compra" name="precio_compra" value="<?php echo $precio_compra; ?>"><br>
                <label for="precio_venta">Precio de Venta:</label><br>
                <input type="text" id="precio_venta" name="precio_venta" value="<?php echo $precio_venta; ?>"><br>
                <!-- Agrega más campos según sea necesario para los atributos que deseas modificar -->

                <input type="submit" value="Modificar">
            </form>
        </div>

        <!-- Pie de página -->
        <div class="footer">
            <!-- Agrega cualquier información de contacto o enlaces de redes sociales aquí -->
        </div>
    </section>
</body>
</html>