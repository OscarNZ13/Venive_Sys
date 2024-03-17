<?php
session_start();
?>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="../Public/css/login.css">
</head>

<body>

    <div class="Login-Box">
        <form action="../Controller/login_controller.php" method="post">
            <h1 class="h1-1">Autenticación</h1>

            <?php
            // Verificar si hay un mensaje de error en la sesión
            if (isset($_SESSION['error'])) {
                // Mostrar el mensaje de error
                echo '<p class="error-message">' . $_SESSION['error'] . '</p>';
                // Eliminar el mensaje de error de la sesión para que no se muestre nuevamente
                unset($_SESSION['error']);
            }
            ?>

            <p>Usuario
                <input type="text" placeholder="usua..." name="Usuario" class="input-Username" required>
            </p>

            <p>Contraseña
                <input type="password" placeholder="contra..." name="Contrasena" class="input-Password" required>
            </p>

            <button class="Btn-Summit" type="submit" value="Ingresar">Ingresar</button>

        </form>

    </div>

</body>

</html>