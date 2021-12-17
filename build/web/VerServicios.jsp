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
        <table>
            <thead>
                <tr>
                    <th>Código</th>
                    <th>Nombre</th>
                    <th>Descripción</th>
                    <th>Destino</th>
                    <th>Fecha</th>
                    <th>Costo</th>
                </tr>
            </thead>
            <tbody>
                <% Controladora control = new Controladora();
                SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
                List <Servicio> listaServicios = control.traerServicios();
                for(Servicio serv : listaServicios) {
                %>    
                <tr>
                    <% int codigoServ = serv.getCodigo_servicio();
                    String nombreServ = serv.getNombre();
                    String descServ = serv.getDescripcion_breve();
                    String destServ = serv.getDestino_servicio();
                    String fechaServ = sdf.format(serv.getFecha_servicio());
                    double costoServ = serv.getCosto_servico();
                    %>
                    <td><%=codigoServ %></td>
                    <td><%=nombreServ %></td>
                    <td><%=descServ %></td>
                    <td><%=destServ %></td>
                    <td><%=fechaServ %></td>
                    <td><%=costoServ %></td>
                </tr>
                <%}%>
            </tbody>
        </table>
    </body>
</html>
