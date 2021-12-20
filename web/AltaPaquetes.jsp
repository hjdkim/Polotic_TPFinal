<%@page import="java.util.TimeZone"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="logica.Servicio"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Paquete nuevo</title>
    </head>
    <body>

        <%
            //Verifica si usuario está guardado como atributo de la session (logeado)
            HttpSession misession = request.getSession();
            String usuario = (String) misession.getAttribute("usuario");
            if (usuario == null) {
                response.sendRedirect("login.jsp");
            } else {%>

        <h1>Nuevo paquete</h1>
        <form action="SvPaquete" method="POST">
            <table id="tabla_servicios">
                <thead>
                    <tr>
                        <th></th>
                        <th>Código</th>
                        <th>Nombre</th>
                        <th>Descripción</th>
                        <th>Destino</th>
                        <th>Fecha</th>
                        <th>Costo</th>
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
                            double costoServ = serv.getCosto_servicio();
                            Boolean activoServ = serv.isServicio_activo();

                            //Filtro para mostrar solo servicios activos
                            if (activoServ == true) {
                        %>
                        <td>
                            <input type="checkbox" id="servicio<%=codigoServ%>" name="servicio" value="<%=codigoServ%>">
                        </td>
                        <td><%=codigoServ%></td>
                        <td><%=nombreServ%></td>
                        <td><%=descServ%></td>
                        <td><%=destServ%></td>
                        <td><%=fechaServ%></td>
                        <td id="costo<%=codigoServ%>"><%=costoServ%></td>
                    </tr>
                    <% }
                        }%>
                </tbody>

            </table>
            <div>
                <button type="submit">Armar</button>
            </div>
        </form>
        <% }%>
        
    </body>
</html>
