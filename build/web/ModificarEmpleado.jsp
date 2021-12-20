<%@page import="logica.Usuario"%>
<%@page import="java.util.TimeZone"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="logica.Empleado"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar de Emplado</title>
    </head>
    <body>
        <%
            //Verifica si usuario está guardado como atributo de la session (logeado)
            HttpSession misession = request.getSession();
            String usuario = (String) misession.getAttribute("usuario");
            if (usuario == null) {
                response.sendRedirect("login.jsp");
            } else {%>

        <h1>Modificar Empleado</h1>
        <p>Ingrese los datos del empleado a modificar</p>
        <form action="SvModificar" method="POST">
            <%  Empleado emple = (Empleado) misession.getAttribute("empleAModificar");
                Usuario usuEmple = emple.getUsu();
                //Formatea la fecha y el timezone. (Da un día menos sin el TZ.)
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                sdf.setTimeZone(TimeZone.getTimeZone("UTC"));
            %>
            <div>
                <label for="nombre">Nombre: </label>
                <input type="text" name="nombre" id="nombre" value="<%=emple.getNombre() %>">
            </div>
            <div>
                <label for="apellido">Apellido: </label>
                <input type="text" name="apellido" id="apellido" value="<%=emple.getApellido() %>">
            </div>
            <div>
                <label for="direccion">Dirección: </label>
                <input type="text" name="direccion" id="direccion" value="<%=emple.getDireccion() %>">
            </div>
            <div>
                <label for="dni">DNI: </label>
                <input type="text" name="dni" id="dni" value="<%=emple.getDni() %>">
            </div>
            <div>
                <label for="fecha_nac">Fecha de Nacimiento: </label>
                <input type="date" name="fecha_nac" id="fecha_nac" value="<%=sdf.format(emple.getFecha_nac())%>">
            </div>
            <div>
                <label for="nacionalidad">Nacionalidad: </label>
                <input type="text" name="nacionalidad" id="nacionalidad" value="<%=emple.getNacionalidad() %>">
            </div>
            <div>
                <label for="celular">Celular: </label>
                <input type="text" name="celular" id="celular" value="<%=emple.getCelular() %>">
            </div>
            <div>
                <label for="email">Email: </label>
                <input type="email" name="email" id="email" value="<%=emple.getEmail() %>">
            </div>
            <div>
                <label for="cargo">Cargo: </label>
                <input type="text" name="cargo" id="cargo" value="<%=emple.getCargo() %>">
            </div>
            <div>
                <label for="sueldo">Sueldo: </label>
                <input type="number" name="sueldo" id="sueldo" value="<%=emple.getSueldo() %>">
            </div>
            <div>
                <label for="nombreUsu">Nombre de usuario: </label>
                <input type="text" name="nombreUsu" id="nombreUsu" value="<%=usuEmple.getNombreUsu() %>">
            </div>
            <div>
                <label for="contrasenia">Contraseña: </label>
                <input type="password" name="contrasenia" id="contrasenia" value="<%=usuEmple.getContrasenia() %>">
            </div>
            <div>
                <input type="hidden" name="modificarEmple" value="<%=emple.getId_Empleado()%>">
                <button type="submit">Modificar</button>
            </div>

        </form>
        <% }%>
    </body>
</html>
