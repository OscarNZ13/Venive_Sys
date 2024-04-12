<?php
session_start();
// index.php:

include_once '../Controller/index_controller.php';

$indexController = new IndexController();
$productoschaquetas = $indexController->obtenerProductosChaquetas();
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Venive Shop</title>
    <link rel="stylesheet" href="../Public/css/style.css?v=<?php echo (rand()); ?>" />
    <link href="../Public/css/style_tabla.css?v=<?php echo (rand()); ?>" rel="stylesheet">
</head>

<body>
    <section class="layout">
    <div class="header">
            <h1>
                <a style="text-decoration: none;" href="<?php echo (isset($_SESSION['Usuario']))?'../View/chaquetas.php':'../View/login.php'?>">
                    Venive
                </a>
            </h1>

            <div class="Logo-conteiner">
                <a href="../View/index.php">
                    <img src="../Public/img/Venive_logo.png" alt="Venive logo">
                </a>
            </div>

            <?php if (isset($_SESSION['Usuario'])) { ?>
                <div class="conteiner-btn-cerrar-sesion">
                    <?php if (isset($_SESSION['Usuario'])) { ?>
                        <?php
                        $UsuarioL = $_SESSION['Usuario'];
                        ?>
                        <p class="User-logged">
                            Usuario en sesion: <?php echo $UsuarioL ?>
                        </p>
                    <?php } ?>

                    <a href="../Controller/logout_controller.php">
                        <img src="../Public/img/logout.png" alt="btn-cerrar-sesion" class="btn-cerra-sesion">
                    </a>
                </div>
            <?php } ?>
        </div>

        <div class="aside">
            <div class="nav-conteiner">
                <h2>Catálogo</h2>
                <nav>
                    <ul>
                        <li><a href="hombre.php" class="C-HM">Hombre</a></li>
                        <li><a href="mujer.php" class="C-HM">Mujer</a></li>
                    </ul>
                </nav>
            </div>
        </div>
        <div class="main">
            <div class="filtro-ropa">
                <ul>
                    <li><a href="pantalones.php" class="">Pantalones</a></li>
                    <li><a href="blusas.php" class="">Blusas</a></li>
                    <li><a href="chaquetas.php" class="">Chaquetas</a></li>
                    <li><a href="deportiva.php" class="">Deportiva</a></li>
                    <?php if (isset($_SESSION['Usuario'])) { ?>
                        <li><a href="../View/New_Product.php" class="">Nueva Prenda</a></li>
                        <li><a href="../View/register.php" class="">Nuevo Usuario</a></li>
                    <?php } ?>
                </ul>
            </div>
            <div class="box-prendas">
                <div class="header-table">
                    <?php if ($productoschaquetas && count($productoschaquetas) > 0) : ?>
                        <div class="tabla-container"> <!-- Aquí agregamos el contenedor -->
                            <table class="mi-tabla">
                                <thead>
                                    <tr>
                                        <th>Codigo</th>
                                        <th>Prenda</th>
                                        <th>Precio</th>
                                        <th>Imagen</th>
                                        <?php if (isset($_SESSION['Usuario'])) { ?>
                                            <th>Accción</th>
                                        <?php } ?>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php foreach ($productoschaquetas as $productoschaquetas) : ?>
                                        <tr>
                                            <td><?= $productoschaquetas['ID_PRODUCTO'] ?></td>
                                            <td><?= $productoschaquetas['NOMBRE_PRODUCTO'] ?></td>
                                            <td><?= $productoschaquetas['PRECIO_VENTA'] ?></td>
                                            <td><img src="../Public/img/<?= $productoschaquetas['IMAGEN'] ?>" alt="<?= $productoschaquetas['NOMBRE_PRODUCTO'] ?>"></td>
                                            <?php if (isset($_SESSION['Usuario'])) { ?>
                                                <td>

                                                    <form action="../Controller/product_controller.php" method="post">
                                                        <input type="hidden" name="id_producto_editar" value="<?php echo $producto_id ?>">
                                                        <button class="btn-editar-prenda" type="submit">
                                                            <b>Editar</b>
                                                        </button>
                                                    </form>

                                                    <form action="../Controller/product_controller.php" method="post">
                                                        <input type="hidden" name="id_producto_eliminar" value="<?php echo $producto_id ?>">
                                                        <button class="btn-eliminar-prenda" type="submit">
                                                            <b>Eliminar</b>
                                                        </button>
                                                    </form>
                                                </td>
                                            <?php } ?>
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