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
        <title>Empleados</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
    </head>
    <body>

        <%
            //Verifica si usuario está guardado como atributo de la session (logeado)
            HttpSession misession = request.getSession();
            String usuario = (String) misession.getAttribute("usuario");
            if (usuario == null) {
                response.sendRedirect("login.jsp");
            } else {%>

        <div class="d-flex" id="wrapper">
            <!-- Sidebar-->
            <div class="border-end bg-white" id="sidebar-wrapper">
                <div class="sidebar-heading border-bottom bg-light">Turismo SAM</div>
                <div class="list-group list-group-flush">
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="SvVerVentas">Ventas</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="SvCliente">Clientes</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="SvEmpleado">Empleados</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="SvServicio">Servicios</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="SvPaquete">Paquetes</a>
                </div>
            </div>
            <!-- Page content wrapper-->
            <div id="page-content-wrapper">
                <!-- Top navigation-->
                <nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
                    <div class="container-fluid">
                        <button class="btn btn-secondary" id="sidebarToggle"><-></button>
                        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav ms-auto mt-2 mt-lg-0">
                                <li class="nav-item active"><a class="nav-link" href="index.jsp">Home</a></li>
                            </ul>
                        </div>
                    </div>
                </nav>
                <!-- Page content-->
                <div class="container-fluid">
                    <div>
                        <form action="AltaEmpleados.jsp">
                            <button type="submit" class="btn btn-primary mt-2">Nuevo Empleado</button>
                        </form>
                    </div>

                    <h3 class="mt-0 text-center">Clientes</h3>

                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">Nombre</th>
                                <th scope="col">Apellido</th>
                                <th scope="col">Cargo</th>
                                <th scope="col">Sueldo</th>
                                <th scope="col">Dirección</th>
                                <th scope="col">DNI</th>
                                <th scope="col">Fecha de nacimiento</th>
                                <th scope="col">Celular</th>
                                <th scope="col">Email</th>
                                <th scope="col">Usuario</th>
                                <th scope="col">Contraseña</th>
                                <th scope="col"></th>
                                <th scope="col"></th>
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
                                    String dniEmple = emple.getDni();
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
                                <td><%=dniEmple%></td>
                                <td><%=fechaNac%></td>
                                <td><%=celEmple%></td>
                                <td><%=emailEmple%></td>
                                <td><%=nombreUsu%></td>
                                <td><%=contrasenia%></td>
                                <td>
                                    <form action="SvModificar" method="POST">
                                        <input type="hidden" name="pedirModificarEmple" value="<%=idEmple%>">
                                        <button type="submit" class="btn btn-warning">Modificar</button>
                                    </form>
                                </td>
                                <td>
                                    <form action="SvEliminar" method="POST">
                                        <input type="hidden" name="eliminarEmple" value="<%=idEmple%>">
                                        <button type="submit" class="btn btn-danger">Eliminar</button>
                                    </form>
                                </td>
                            </tr>
                            <% }
                    }%>


                        </tbody>
                    </table>

                </div>
            </div>
        </div>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>

        <% }%>
    </body>
</html>
