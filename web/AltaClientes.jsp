<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alta Cliente</title>
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
                    <h3 class="mt-2 text-center">Nuevo Cliente</h3>
                </div>
                <div class="container-fluid d-flex">
                    <div class="mx-auto">
                        <form action="SvCliente" method="POST">
                            <div>
                                <label for="nombre" class="form-label">Nombre: </label>
                                <input type="text" name="nombre" id="nombre" class="form-control mb-2">
                            </div>
                            <div>
                                <label for="apellido" class="form-label">Apellido: </label>
                                <input type="text" name="apellido" id="apellido" class="form-control mb-2">
                            </div>
                            <div>
                                <label for="direccion" class="form-label">Dirección: </label>
                                <input type="text" name="direccion" id="direccion" class="form-control mb-2">
                            </div>
                            <div>
                                <label for="dni" class="form-label">DNI: </label>
                                <input type="text" name="dni" id="dni" class="form-control mb-2">
                            </div>
                            <div>
                                <label for="fecha_nac" class="form-label">Fecha de Nacimiento: </label>
                                <input type="date" name="fecha_nac" id="fecha_nac" class="form-control mb-2">
                            </div>
                            <div>
                                <label for="nacionalidad" class="form-label">Nacionalidad: </label>
                                <input type="text" name="nacionalidad" id="nacionalidad" class="form-control mb-2">
                            </div>
                            <div>
                                <label for="celular" class="form-label">Celular: </label>
                                <input type="text" name="celular" id="celular" class="form-control mb-2">
                            </div>
                            <div>
                                <label for="email" class="form-label">Email: </label>
                                <input type="email" name="email" id="email" class="form-control mb-2">
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
