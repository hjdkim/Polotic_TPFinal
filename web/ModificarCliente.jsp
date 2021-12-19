<%@page import="java.util.TimeZone"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="logica.Cliente"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar Cliente</title>
    </head>
    <body>
        <%
            //Verifica si usuario está guardado como atributo de la session (logeado)
            HttpSession misession = request.getSession();
            String usuario = (String) misession.getAttribute("usuario");
            if (usuario == null) {
                response.sendRedirect("login.jsp");
            } else {%>

        <h1>Modificar Cliente</h1>
        <p>Ingrese los datos del cliente a modificar</p>
        <form action="SvModificar" method="POST">
            <%  Cliente cli = (Cliente) misession.getAttribute("cliAModificar");
                //Formatea la fecha y el timezone. (Da un día menos sin el TZ.)
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                sdf.setTimeZone(TimeZone.getTimeZone("UTC"));
            %>
            <div>
                <label for="nombre">Nombre: </label>
                <input type="text" name="nombre" id="nombre" value="<%=cli.getNombre() %>">
            </div>
            <div>
                <label for="apellido">Apellido: </label>
                <input type="text" name="apellido" id="apellido" value="<%=cli.getApellido() %>">
            </div>
            <div>
                <label for="direccion">Dirección: </label>
                <input type="text" name="direccion" id="direccion" value="<%=cli.getDireccion() %>">
            </div>
            <div>
                <label for="dni">DNI: </label>
                <input type="text" name="dni" id="dni" value="<%=cli.getDni() %>">
            </div>
            <div>
                <label for="fecha_nac">Fecha de Nacimiento: </label>
                <input type="date" name="fecha_nac" id="fecha_nac" value="<%=sdf.format(cli.getFecha_nac())%>">
            </div>
            <div>
                <label for="nacionalidad">Nacionalidad: </label>
                <input type="text" name="nacionalidad" id="nacionalidad" value="<%=cli.getNacionalidad() %>">
            </div>
            <div>
                <label for="celular">Celular: </label>
                <input type="text" name="celular" id="celular" value="<%=cli.getCelular() %>">
            </div>
            <div>
                <label for="email">Email: </label>
                <input type="email" name="email" id="email" value="<%=cli.getEmail() %>">
            </div>
            <div>
                <input type="hidden" name="modificarCli" value="<%=cli.getId_cliente()%>">
                <button type="submit">Enviar</button>
            </div>

        </form>
        <% }%>
    </body>
</html>
