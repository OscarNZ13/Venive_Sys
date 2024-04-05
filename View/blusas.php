<?php
// index.php:

include_once '../Controller/index_controller.php';

$indexController = new IndexController();
$productosblusa = $indexController->ObtenerProductosBlusas();
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="../Public/css/style.css" rel="stylesheet">
    <link href="../Public/css/style_tabla.css" rel="stylesheet">
</head>

<body>
    <section class="layout">
        <div class="header">
            <h1>Venive</h1>
            <div class="Logo-conteiner">
                <a href="index.php">
                    <img src="../Public/img/Venive_logo.png" alt="Venive logo">
                </a>
            </div>
        </div>
        <div class="aside">
            <div class="nav-conteiner">
                <h2>Catálogo</h2>
                <nav>
                    <ul>
                        <li><a href="#" class="C-HM">Hombre</a></li>
                        <li><a href="#" class="C-HM">Mujer</a></li>
                    </ul>
                </nav>
            </div>
        </div>
        <div class="main">
            <div class="filtro-ropa">
                <ul>
                <li><a href="pantalones.php" class="">Pantalones</a></li>
                    <li><a href="blusas.php" class="">Blusas</a></li>
                    <li><a href="#" class="">Chaquetas</a></li>
                    <li><a href="#" class="">Deportiva</a></li>
                </ul>
            </div>
            <div class="box-prendas">
                <div class="header-table">
                    <?php if ($productosblusa && count($productosblusa) > 0) : ?>
                        <div class="tabla-container"> <!-- Aquí agregamos el contenedor -->
                            <table class="mi-tabla">
                                <thead>
                                    <tr>
                                        <th>Codigo</th>
                                        <th>Prenda</th>
                                        <th>Precio</th>
                                        <th>Imagen</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php foreach ($productosblusa as $productosblusa) : ?>
                                        <tr>
                                            <td><?= $productosblusa['ID_PRODUCTO'] ?></td>
                                            <td><?= $productosblusa['NOMBRE_PRODUCTO'] ?></td>
                                            <td><?= $productosblusa['PRECIO_VENTA'] ?></td>
                                            <td><img src="../Public/img/<?= $productosblusa['IMAGEN'] ?>" alt="<?= $productosblusa['NOMBRE_PRODUCTO'] ?>"></td>
                                        </tr>
                                    <?php endforeach; ?>
                                </tbody>
                            </table>
                        </div>
                    <?php else : ?>
                        <p>No se encontraron productos.</p>
                    <?php endif; ?>
                </div>
            </div>
        </div>
        <div class="footer">
            <div class="contactos-conteiner">
                <a href="https://www.facebook.com/profile.php?id=100064313484599&mibextid=kFxxJD" target="_blank">
                    <img src="../Public/img/facebook-logo-black.png" alt="Contact Facebook">
                </a>
                <a href="https://www.instagram.com/venive.storecr?igsh=Z252bXI1dXJubTJ6" target="_blank">
                    <img src="../Public/img/instagram-logo-black.png" alt="Contact Instagram">
                </a>
                <a href="https://wa.me/70393886" target="_blank">
                    <img src="../Public/img/whatsapp-logo-black.png" alt="Contact WhatsApp">
                </a>
            </div>
        </div>
    </section>
</body>

</html>