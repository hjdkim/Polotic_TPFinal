<%@page import="logica.Usuario"%>
<%@page import="java.util.TimeZone"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="logica.Empleado"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar de Emplado</title>
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
                    <h3 class="mt-2 text-center">Modificar Empleado</h3>
                </div>
                <div class="container-fluid d-flex">
                    <div class="mx-auto">
                        <form action="SvModificar" method="POST">
                            <%  Empleado emple = (Empleado) misession.getAttribute("empleAModificar");
                                Usuario usuEmple = emple.getUsu();
                                //Formatea la fecha y el timezone. (Da un día menos sin el TZ.)
                                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                                sdf.setTimeZone(TimeZone.getTimeZone("UTC"));
                            %>
                            <div>
                                <label class="form-label" for="nombre">Nombre: </label>
                                <input class="form-control mb-2" type="text" name="nombre" id="nombre" value="<%=emple.getNombre()%>">
                            </div>
                            <div>
                                <label class="form-label" for="apellido">Apellido: </label>
                                <input class="form-control mb-2" type="text" name="apellido" id="apellido" value="<%=emple.getApellido()%>">
                            </div>
                            <div>
                                <label class="form-label" for="direccion">Dirección: </label>
                                <input class="form-control mb-2" type="text" name="direccion" id="direccion" value="<%=emple.getDireccion()%>">
                            </div>
                            <div>
                                <label class="form-label" for="dni">DNI: </label>
                                <input class="form-control mb-2" type="text" name="dni" id="dni" value="<%=emple.getDni()%>">
                            </div>
                            <div>
                                <label class="form-label" for="fecha_nac">Fecha de Nacimiento: </label>
                                <input class="form-control mb-2" type="date" name="fecha_nac" id="fecha_nac" value="<%=sdf.format(emple.getFecha_nac())%>">
                            </div>
                            <div>
                                <label class="form-label" for="nacionalidad">Nacionalidad: </label>
                                <input class="form-control mb-2" type="text" name="nacionalidad" id="nacionalidad" value="<%=emple.getNacionalidad()%>">
                            </div>
                            <div>
                                <label class="form-label" for="celular">Celular: </label>
                                <input class="form-control mb-2" type="text" name="celular" id="celular" value="<%=emple.getCelular()%>">
                            </div>
                            <div>
                                <label class="form-label" for="email">Email: </label>
                                <input class="form-control mb-2" type="email" name="email" id="email" value="<%=emple.getEmail()%>">
                            </div>
                            <div>
                                <label class="form-label" for="cargo">Cargo: </label>
                                <input class="form-control mb-2" type="text" name="cargo" id="cargo" value="<%=emple.getCargo()%>">
                            </div>
                            <div>
                                <label class="form-label" for="sueldo">Sueldo: </label>
                                <input class="form-control mb-2" type="number" name="sueldo" id="sueldo" value="<%=emple.getSueldo()%>">
                            </div>
                            <div>
                                <label class="form-label" for="nombreUsu">Nombre de usuario: </label>
                                <input class="form-control mb-2" type="text" name="nombreUsu" id="nombreUsu" value="<%=usuEmple.getNombreUsu()%>">
                            </div>
                            <div>
                                <label class="form-label" for="contrasenia">Contraseña: </label>
                                <input class="form-control mb-2" type="password" name="contrasenia" id="contrasenia" value="<%=usuEmple.getContrasenia()%>">
                            </div>
                            <div>
                                <input type="hidden" name="modificarEmple" value="<%=emple.getId_Empleado()%>">
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
