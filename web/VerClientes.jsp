<%@page import="java.util.TimeZone"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="logica.Cliente"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Clientes</title>
    </head>
    <body>
        <%
            //Verifica si usuario está guardado como atributo de la session (logeado)
            HttpSession misession = request.getSession();
            String usuario = (String) misession.getAttribute("usuario");
            if (usuario == null) {
                response.sendRedirect("login.jsp");
            } else {%>
        <h1>Clientes</h1>
        <table>
            <thead>
                <tr>
                    <th>Nombre</th>
                    <th>Apellido</th>
                    <th>Dirección</th>
                    <th>Fecha de nacimiento</th>
                    <th>Celular</th>
                    <th>Email</th>
                </tr>
            </thead>
            <tbody>
                <%
                    //Instancia la lista desde el atributo de la sesion seteado en Servlet.
                    List<Cliente> listaClientes = (List) misession.getAttribute("listaClientes");
                    
                    //Formatea la fecha y el timezone. (Da un día menos sin el TZ.)
                    SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
                    sdf.setTimeZone(TimeZone.getTimeZone("UTC"));

                    //Iteración para mostrar los servicios
                    for (Cliente cli : listaClientes) {
                %>
                <tr>
                    <% int idCli = cli.getId_cliente();
                        String nombreCli = cli.getNombre();
                        String apellidoCli = cli.getApellido();
                        String dirCli = cli.getDireccion();
                        String fechaNac = sdf.format(cli.getFecha_nac());
                        String celCli = cli.getCelular();
                        String emailCli = cli.getEmail();
                        Boolean activoCli = cli.isCliente_activo();

                        //Filtro para mostrar solo servicios activos
                        if (activoCli == true) {
                    %>
                    <td><%=nombreCli%></td>
                    <td><%=apellidoCli%></td>
                    <td><%=dirCli%></td>
                    <td><%=fechaNac%></td>
                    <td><%=celCli%></td>
                    <td><%=emailCli%></td>
                    <td>
                        <form action="SvModificar" method="POST">
                            <input type="hidden" name="pedirModificarCli" value="<%=idCli%>">
                            <button type="submit">Modificar</button>
                        </form>
                    </td>
                    <td>
                        <form action="SvEliminar" method="POST">
                            <input type="hidden" name="eliminarCli" value="<%=idCli%>">
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
