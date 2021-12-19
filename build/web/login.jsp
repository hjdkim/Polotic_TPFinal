<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <h1>Ingrese su usario y contraseña</h1>
        <div>
            <form action="SvUsuario" method="POST">
                <div>
                    <label for="nombreUsu">Nombre de usuario: </label>
                    <input type="text" name="nombreUsu" id="nombreUsu">
                </div>
                <div>
                    <label for="contrasenia">Contraseña: </label>
                    <input type="password" name="contrasenia" id="contrasenia">
                </div>
                <div>
                    <button type="submit">Login</button>
                </div>
            </form>
        </div>
    </body>
</html>
