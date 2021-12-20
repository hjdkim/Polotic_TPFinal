<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Servicios</title>
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
                    <h3 class="mt-2 text-center">Nuevo Servicio</h3>
                </div>
                <div class="container-fluid d-flex">
                    <div class="mx-auto">
                        <form action="SvServicio" method="POST">
                            <div>
                                <label for="nombre" class="form-label">Nombre: </label>
                                <input type="text" name="nombre" id="nombre" class="form-control mb-2">
                            </div>
                            <div>
                                <label for="descripcion" class="form-label">Descripcion: </label>
                                <input type="text" name="descripcion" id="descripcion" class="form-control mb-2">
                            </div>
                            <div>
                                <label for="destino" class="form-label">Destino: </label>
                                <input type="text" name="destino" id="destino" class="form-control mb-2">
                            </div>
                            <div>
                                <label for="costo" class="form-label">Costo: </label>
                                <input type="number" name="costo" id="costo" class="form-control mb-2">
                            </div>
                            <div>
                                <label for="fecha_servicio" class="form-label">Fecha de Servicio: </label>
                                <input type="date" name="fecha_servicio" id="fecha_servicio" class="form-control mb-2">
                            </div>
                            <div>
                                <button type="submit" class="btn btn-primary mt-2">Enviar</button>
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
