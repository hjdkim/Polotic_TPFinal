<%@page import="java.util.TimeZone"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="logica.Servicio"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar Servicio</title>
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
                    <h3 class="mt-2 text-center">Modificar Servicio</h3>
                </div>
                <div class="container-fluid d-flex">
                    <div class="mx-auto">
                        <form action="SvModificar" method="POST">
                            <%  Servicio serv = (Servicio) misession.getAttribute("servAModificar");
                                //Formatea la fecha y el timezone. (Da un día menos sin el TZ.)
                                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                                sdf.setTimeZone(TimeZone.getTimeZone("UTC"));
                            %>
                            <div>
                                <label class="form-label" for="nombre">Nombre: </label>
                                <input class="form-control mb-2" type="text" name="nombre" id="nombre" value="<%=serv.getNombre()%>">
                            </div>
                            <div>
                                <label class="form-label" for="descripcion">Descripcion: </label>
                                <input class="form-control mb-2" type="text" name="descripcion" id="descripcion" value="<%=serv.getDescripcion_breve()%>">
                            </div>
                            <div>
                                <label class="form-label" for="destino">Destino: </label>
                                <input class="form-control mb-2" type="text" name="destino" id="destino" value="<%=serv.getDestino_servicio()%>">
                            </div>
                            <div>
                                <label class="form-label" for="costo">Costo: </label>
                                <input class="form-control mb-2" type="number" name="costo" id="costo" value="<%=serv.getCosto_servicio()%>">
                            </div>
                            <div>
                                <label class="form-label" for="fecha_servicio">Fecha de Servicio: </label>
                                <input class="form-control mb-2" type="date" name="fecha_servicio" id="fecha_servicio" value="<%=sdf.format(serv.getFecha_servicio())%>">
                            </div>
                            <div>
                                <input type="hidden" name="modificarServ" value="<%=serv.getCodigo_servicio()%>">
                                <button type="submit" class="btn btn-primary mt-2">Modificar</button>
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
