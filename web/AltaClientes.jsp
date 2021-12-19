<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alta Cliente</title>
    </head>
    <body>
        <%
            //Verifica si usuario está guardado como atributo de la session (logeado)
            HttpSession misession = request.getSession();
            String usuario = (String) misession.getAttribute("usuario");
            if (usuario == null) {
                response.sendRedirect("login.jsp");
            } else {%>
        <h1>Alta Cliente</h1>
        <p>Ingrese los datos</p>
        <form action="SvCliente" method="POST">
            <div>
                <label for="nombre">Nombre: </label>
                <input type="text" name="nombre" id="nombre">
            </div>
            <div>
                <label for="apellido">Apellido: </label>
                <input type="text" name="apellido" id="apellido">
            </div>
            <div>
                <label for="direccion">Dirección: </label>
                <input type="text" name="direccion" id="direccion">
            </div>
            <div>
                <label for="dni">DNI: </label>
                <input type="text" name="dni" id="dni">
            </div>
            <div>
                <label for="fecha_nac">Fecha de Nacimiento: </label>
                <input type="date" name="fecha_nac" id="fecha_nac">
            </div>
            <div>
                <label for="nacionalidad">Nacionalidad: </label>
                <input type="text" name="nacionalidad" id="nacionalidad">
            </div>
            <div>
                <label for="celular">Celular: </label>
                <input type="text" name="celular" id="celular">
            </div>
            <div>
                <label for="email">Email: </label>
                <input type="email" name="email" id="email">
            </div>
            <div>
                <button type="submit">Enviar</button>
            </div>
            
        </form>
        
        
        
        
        <% } %>
    </body>
</html>
