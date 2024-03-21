$(document).ready(function () {
    // Realizar una solicitud AJAX para obtener los productos del servidor
    $.ajax({
        url: '../Controller/index_controller.php', // Ruta del controlador que devuelve los productos
        type: 'GET',
        dataType: 'json',
        success: function (response) {
            console.log(response); // Imprime la respuesta en la consola del navegador
            // Actualizar la tabla de productos con los datos recibidos
            $.each(response, function (index, producto) {
                var newRow = "<tr>" +
                    "<td>" + producto.ID_PRODUCTO + "</td>" +
                    "<td>" + producto.NOMBRE_PRODUCTO + "</td>" +
                    "<td>" + producto.PRECIO_VENTA + "</td>" +
                    "<td><img src='../Public/img/" + producto.IMAGEN + "' alt='" + producto.NOMBRE_PRODUCTO + "'></td>" +
                    "</tr>";
                $('.content-table tbody').append(newRow);
            });
        },
        error: function () {
            alert('Error al cargar los productos.');
        }
    });
});
