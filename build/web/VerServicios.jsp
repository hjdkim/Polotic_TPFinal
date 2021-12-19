<%@page import="java.util.TimeZone"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page import="logica.Servicio"%>
<%@page import="logica.Controladora"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Servicios</title>
    </head>
    <body>
        
        <%
            //Verifica si usuario está guardado como atributo de la session (logeado)
            HttpSession misession = request.getSession();
            String usuario = (String) misession.getAttribute("usuario");
            if (usuario == null) {
                response.sendRedirect("login.jsp");
            } else {%>
            
        <table>
            <thead>
                <tr>
                    <th>Código</th>
                    <th>Nombre</th>
                    <th>Descripción</th>
                    <th>Destino</th>
                    <th>Fecha</th>
                    <th>Precio</th>
                    <th>Modificar</th>
                    <th>Eliminar</th>
                </tr>
            </thead>
            <tbody>
                <%
                    //Instancia la lista desde el atributo de la sesion seteado en Servlet.
                    List<Servicio> listaServicios = (List) misession.getAttribute("listaServicios");

                    //Formatea la fecha y el timezone. (Da un día menos sin el TZ.)
                    SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
                    sdf.setTimeZone(TimeZone.getTimeZone("UTC"));

                    //Iteración para mostrar los servicios
                    for (Servicio serv : listaServicios) {
                %>    
                <tr>
                    <% int codigoServ = serv.getCodigo_servicio();
                        String nombreServ = serv.getNombre();
                        String descServ = serv.getDescripcion_breve();
                        String destServ = serv.getDestino_servicio();
                        String fechaServ = sdf.format(serv.getFecha_servicio());
                        double costoServ = serv.getCosto_servico();
                        Boolean activoServ = serv.isServicio_activo();

                        //Filtro para mostrar solo servicios activos
                        if (activoServ == true) {
                    %>
                    <td><%=codigoServ%></td>
                    <td><%=nombreServ%></td>
                    <td><%=descServ%></td>
                    <td><%=destServ%></td>
                    <td><%=fechaServ%></td>
                    <td><%=costoServ%></td>
                    <td>
                        <form action="SvModificar" method="POST">
                            <input type="hidden" name="modificarServ" value="<%=codigoServ%>">
                            <button type="submit">Modificar</button>
                        </form>
                    </td>
                    <td>
                        <form action="SvEliminar" method="POST">
                            <input type="hidden" name="eliminarServ" value="<%=codigoServ%>">
                            <button type="submit">Eliminar</button>
                        </form>
                    </td>
                </tr>
                <% }
                        }%>
            </tbody>
        </table>
            <% } %>
    </body>
</html>
