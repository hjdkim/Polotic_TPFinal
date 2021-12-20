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
                    <h3 class="mt-2 text-center">Nuevo Paquete</h3>
                </div>
                <div class="container-fluid d-flex">
                    <div class="mx-auto">
                        <form action="SvPaquete" method="POST">
                            <table id="tabla_servicios" class="table">
                                <thead>
                                    <tr>
                                        <th scope="col"></th>
                                        <th scope="col">Código</th>
                                        <th scope="col">Nombre</th>
                                        <th scope="col">Descripción</th>
                                        <th scope="col">Destino</th>
                                        <th scope="col">Fecha</th>
                                        <th scope="col">Costo</th>
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
                                            <input class="form-check-input" type="checkbox" id="servicio<%=codigoServ%>" name="servicio" value="<%=codigoServ%>">
                                        </td>
                                        <th scope="row"><%=codigoServ%></td>
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
                                <button type="submit" class="btn btn-primary mt-2">Armar</button>
                            </div>
                        </form>
                    </div>
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
