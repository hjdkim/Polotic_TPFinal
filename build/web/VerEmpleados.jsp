<%@page import="logica.Usuario"%>
<%@page import="java.util.TimeZone"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="logica.Empleado"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <%
            //Verifica si usuario está guardado como atributo de la session (logeado)
            HttpSession misession = request.getSession();
            String usuario = (String) misession.getAttribute("usuario");
            if (usuario == null) {
                response.sendRedirect("login.jsp");
            } else {%>
        
        <h1>Empleados</h1>
        
        <table>
            <thead>
                <tr>
                    <th>Nombre</th>
                    <th>Apellido</th>
                    <th>Cargo</th>
                    <th>Sueldo</th>
                    <th>Dirección</th>
                    <th>Fecha de nacimiento</th>
                    <th>Celular</th>
                    <th>Email</th>
                    <th>Usuario</th>
                    <th>Contraseña</th>
                </tr>
            </thead>
            <tbody>
                <%
                    //Instancia la lista desde el atributo de la sesion seteado en Servlet.
                    List<Empleado> listaEmpleados = (List) misession.getAttribute("listaEmpleados");
                    
                    //Formatea la fecha y el timezone. (Da un día menos sin el TZ.)
                    SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
                    sdf.setTimeZone(TimeZone.getTimeZone("UTC"));

                    //Iteración para mostrar los servicios
                    for (Empleado emple : listaEmpleados) {
                %>
                <tr>
                    <% int idEmple = emple.getId_Empleado();
                        String nombreEmple = emple.getNombre();
                        String apellidoEmple = emple.getApellido();
                        String cargoEmple = emple.getCargo();
                        double sueldoEmple = emple.getSueldo();
                        String dirEmple = emple.getDireccion();
                        String fechaNac = sdf.format(emple.getFecha_nac());
                        String celEmple = emple.getCelular();
                        String emailEmple = emple.getEmail();
                        Usuario usuEmple = emple.getUsu();
                        String nombreUsu = usuEmple.getNombreUsu();
                        String contrasenia = usuEmple.getContrasenia();
                        
                        Boolean activoEmple = emple.isEmpleado_activo();

                        //Filtro para mostrar solo servicios activos
                        if (activoEmple == true) {
                    %>
                    <td><%=nombreEmple%></td>
                    <td><%=apellidoEmple%></td>
                    <td><%=cargoEmple%></td>
                    <td><%=sueldoEmple%></td>
                    <td><%=dirEmple%></td>
                    <td><%=fechaNac%></td>
                    <td><%=celEmple%></td>
                    <td><%=emailEmple%></td>
                    <td><%=nombreUsu%></td>
                    <td><%=contrasenia%></td>
                    <td>
                        <form action="SvModificar" method="POST">
                            <input type="hidden" name="modificarEmple" value="<%=idEmple%>">
                            <button type="submit">Modificar</button>
                        </form>
                    </td>
                    <td>
                        <form action="SvEliminar" method="POST">
                            <input type="hidden" name="eliminarEmple" value="<%=idEmple%>">
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
