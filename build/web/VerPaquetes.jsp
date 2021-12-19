<%@page import="logica.Paquete"%>
<%@page import="java.util.List"%>
<%@page import="logica.Servicio"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de paquetes</title>
    </head>
    <body>

        <%
            //Verifica si usuario está guardado como atributo de la session (logeado)
            HttpSession misession = request.getSession();
            String usuario = (String) misession.getAttribute("usuario");
            if (usuario == null) {
                response.sendRedirect("login.jsp");
            } else {%>

        <h1>Paquetes disponibles</h1>
        <table>
            <thead>
                <tr>
                    <th>Código</th>
                    <th>Servicios</th>
                    <th>Precio</th>
                    <th>Modificar</th>
                    <th>Eliminar</th>
                </tr>
            </thead>
            <tbody>
                <%
                    //Instancia la lista desde el atributo de la sesion seteado en Servlet.
                    List<Paquete> listaPaquetes = (List) misession.getAttribute("listaPaquetes");

                    //Iteración para mostrar los servicios
                    for (Paquete paque : listaPaquetes) {
                %>
                <tr>
                    <% int codigoPaquete = paque.getCodigo_paquete();
                        double precioPaquete = paque.getCosto_paquete();
                        List<Servicio> listaServicios = paque.getLista_servicios();
                        Boolean activoPaquete = paque.isPaquete_activo();

                        //Filtro para mostrar solo servicios activos
                        if (activoPaquete == true) {
                    %>
                    <td><%=codigoPaquete%></td>
                    <td>
            <table>
                    <% for (Servicio serv : listaServicios) {
                    %>
                <tr>
                    <td>
                        <%=serv.getNombre()%>
                    </td>
                </tr>
                <% }%>
            </table>
                    </td>
            <td><%=precioPaquete%></td>
            <td>
                <form action="SvModificar" method="POST">
                    <input type="hidden" name="codigoPaquete" value="<%=codigoPaquete%>">
                    <button type="submit">Modificar</button>
                </form>
            </td>
            <td>
                <form action="SvEliminar" method="POST">
                    <input type="hidden" name="codigoPaquete" value="<%=codigoPaquete%>">
                    <button type="submit">Eliminar</button>
                </form>
            </td>
        </tr>
        <% }
            }%>
    </tbody>
</table>
<% }%>
</body>
</html>
