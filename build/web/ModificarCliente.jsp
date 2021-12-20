<%@page import="java.util.TimeZone"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="logica.Cliente"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar Cliente</title>
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
                    <h3 class="mt-2 text-center">Modificar Cliente</h3>
                </div>
                <div class="container-fluid d-flex">
                    <div class="mx-auto">
                        <form action="SvModificar" method="POST">
                            <%  Cliente cli = (Cliente) misession.getAttribute("cliAModificar");
                                //Formatea la fecha y el timezone. (Da un día menos sin el TZ.)
                                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                                sdf.setTimeZone(TimeZone.getTimeZone("UTC"));
                            %>
                            <div>
                                <label class="form-label" for="nombre">Nombre: </label>
                                <input class="form-control mb-2" type="text" name="nombre" id="nombre" value="<%=cli.getNombre()%>">
                            </div>
                            <div>
                                <label class="form-label" for="apellido">Apellido: </label>
                                <input class="form-control mb-2" type="text" name="apellido" id="apellido" value="<%=cli.getApellido()%>">
                            </div>
                            <div>
                                <label class="form-label" for="direccion">Dirección: </label>
                                <input class="form-control mb-2" type="text" name="direccion" id="direccion" value="<%=cli.getDireccion()%>">
                            </div>
                            <div>
                                <label class="form-label" for="dni">DNI: </label>
                                <input class="form-control mb-2" type="text" name="dni" id="dni" value="<%=cli.getDni()%>">
                            </div>
                            <div>
                                <label class="form-label" for="fecha_nac">Fecha de Nacimiento: </label>
                                <input class="form-control mb-2" type="date" name="fecha_nac" id="fecha_nac" value="<%=sdf.format(cli.getFecha_nac())%>">
                            </div>
                            <div>
                                <label class="form-label" for="nacionalidad">Nacionalidad: </label>
                                <input class="form-control mb-2" type="text" name="nacionalidad" id="nacionalidad" value="<%=cli.getNacionalidad()%>">
                            </div>
                            <div>
                                <label class="form-label" for="celular">Celular: </label>
                                <input class="form-control mb-2" type="text" name="celular" id="celular" value="<%=cli.getCelular()%>">
                            </div>
                            <div>
                                <label class="form-label" for="email">Email: </label>
                                <input class="form-control mb-2" type="email" name="email" id="email" value="<%=cli.getEmail()%>">
                            </div>
                            <div>
                                <input type="hidden" name="modificarCli" value="<%=cli.getId_cliente()%>">
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
