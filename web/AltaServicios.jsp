<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Servicios</title>
    </head>
    <body>
        <h1>Alta Servicios</h1>
        <p>Ingrese los datos del servicio</p>
        <form action="SvServicio" method="POST">
            <div>
                <label for="nombre">Nombre: </label>
                <input type="text" name="nombre" id="nombre">
            </div>
            <div>
                <label for="descripcion">Descripcion: </label>
                <input type="text" name="descripcion" id="descripcion">
            </div>
            <div>
                <label for="destino">Destino: </label>
                <input type="text" name="destino" id="destino">
            </div>
            <div>
                <label for="costo">Costo: </label>
                <input type="number" name="costo" id="costo">
            </div>
            <div>
                <label for="fecha_servicio">Fecha de Servicio: </label>
                <input type="date" name="fecha_servicio" id="fecha_servicio">
            </div>
            <div>
                <button type="submit"> Enviar </button>
            </div>

        </form>
    </body>
</html>
