<%@page import="logica.Venta"%>
<%@page import="java.util.TimeZone"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="logica.Cliente"%>
<%@page import="logica.Paquete"%>
<%@page import="logica.Servicio"%>
<%@page import="logica.Empleado"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar Venta</title>
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
            String nombreEmpleado = (String) misession.getAttribute("nombreEmpleado");
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
                    <h3 class="mt-2 text-center">Modificar Venta</h3>
                </div>
                <div class="container-fluid d-flex">
                    <div class="mx-auto">
                        <form action="SvModificar" method="POST">
                            <div>
                                <label class="form-label" for="vendedor">Vendedor: </label>
                                <select class="form-select mb-2" name="vendedor" id="vendedor">
                                    <%
                                        //Instancia las listas desde los atributos de la sesion seteados en Servlet.
                                        Venta venta = (Venta) misession.getAttribute("ventaAModificar");
                                        List<Empleado> listaEmpleados = (List) misession.getAttribute("listaEmpleados");
                                        List<Servicio> listaServicios = (List) misession.getAttribute("listaServicios");
                                        List<Paquete> listaPaquetes = (List) misession.getAttribute("listaPaquetes");
                                        List<Cliente> listaClientes = (List) misession.getAttribute("listaClientes");

                                        //Formatea la fecha y el timezone. (Da un día menos sin el TZ.)
                                        SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
                                        sdf.setTimeZone(TimeZone.getTimeZone("UTC"));

                                        //Iteración para mostrar los servicios
                                        for (Empleado emple : listaEmpleados) {
                                    %>
                                    <option value="<%=emple.getId_Empleado()%>"><%=emple.getNombre() + " " + emple.getApellido()%></option>
                                    <% } %>
                                </select>
                            </div>
                            <div>
                                <label class="form-label" for="cliente">Cliente: </label>
                                <select class="form-select mb-2" name="cliente" id="cliente">
                                    <%
                                        //Iteración para mostrar los servicios
                                        for (Cliente cli : listaClientes) {
                                    %>
                                    <option value="<%=cli.getId_cliente()%>"><%=cli.getNombre() + " " + cli.getApellido()%></option>
                                    <% } %>
                                </select>
                            </div>
                            <div>
                                <label class="form-label" for="producto">Producto: </label>
                                <select class="form-select mb-2" name="producto" id="producto">
                                    <%
                                        //Iteración para mostrar los servicios
                                        for (Servicio serv : listaServicios) {
                                    %>
                                    <option value="<%="s" + serv.getCodigo_servicio()%>"><%=serv.getNombre() + " " + serv.getCosto_servicio()%></option>
                                    <% }
                                        for (Paquete paque : listaPaquetes) {
                                    %>
                                    <option value="<%="p" + paque.getCodigo_paquete()%>"><%=paque.mostrarServicios(paque.getLista_servicios()) + " " + paque.getCosto_paquete()%></option>
                                    <% }%>
                                </select>
                            </div>
                            <div>
                                <label class="form-label" for="medioPago">Medio de pago: </label>
                                <select class="form-select mb-2" name="medioPago" id="medioPago">
                                    <option value="efectivo">Efectivo</option>
                                    <option value="debito">Tarjeta de débito</option>
                                    <option value="credito">Tarjeta de crédito</option>
                                    <option value="monederoVirtual">Monedero virtual</option>
                                    <option value="transferencia">Transferencia</option>
                                </select>
                            </div>
                            <div>
                                <label class="form-label" for="fechaVenta">Fecha de Venta: </label>
                                <input type="date" name="fechaVenta" id="fechaVenta" class="form-control mb-2">
                            </div>
                            <div>
                                <input type="hidden" name="modificarVenta" value="<%=venta.getNum_venta()%>">
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
