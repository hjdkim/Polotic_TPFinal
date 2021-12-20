<%@page import="java.util.TimeZone"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="logica.Servicio"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar Servicio</title>
    </head>
    <body>

        <%
            //Verifica si usuario está guardado como atributo de la session (logeado)
            HttpSession misession = request.getSession();
            String usuario = (String) misession.getAttribute("usuario");
            if (usuario == null) {
                response.sendRedirect("login.jsp");
            } else {%>

        <h1>Modificación de Servicio</h1>
        <p>Ingrese los datos del servicio a modificar</p>
        <form action="SvModificar" method="POST">
            <%  Servicio serv = (Servicio) misession.getAttribute("servAModificar");
                //Formatea la fecha y el timezone. (Da un día menos sin el TZ.)
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                sdf.setTimeZone(TimeZone.getTimeZone("UTC"));
            %>
            <div>
                <label for="nombre">Nombre: </label>
                <input type="text" name="nombre" id="nombre" value="<%=serv.getNombre()%>">
            </div>
            <div>
                <label for="descripcion">Descripcion: </label>
                <input type="text" name="descripcion" id="descripcion" value="<%=serv.getDescripcion_breve()%>">
            </div>
            <div>
                <label for="destino">Destino: </label>
                <input type="text" name="destino" id="destino" value="<%=serv.getDestino_servicio()%>">
            </div>
            <div>
                <label for="costo">Costo: </label>
                <input type="number" name="costo" id="costo" value="<%=serv.getCosto_servicio()%>">
            </div>
            <div>
                <label for="fecha_servicio">Fecha de Servicio: </label>
                <input type="date" name="fecha_servicio" id="fecha_servicio" value="<%=sdf.format(serv.getFecha_servicio())%>">
            </div>
            <div>
                <input type="hidden" name="modificarServ" value="<%=serv.getCodigo_servicio()%>">
                <button type="submit">Modificar</button>
            </div>

        </form>
        <% }%>
    </body>
</html>
