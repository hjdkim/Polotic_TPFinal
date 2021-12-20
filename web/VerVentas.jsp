<%@page import="logica.Venta"%>
<%@page import="java.util.TimeZone"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <title>Ventas</title>
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
                        <form action="SvNuevaVenta">
                            <button type="submit" class="btn btn-primary mt-2">Nueva Venta</button>
                        </form>
                    </div>
                    <h3 class="mt-0 text-center">Historial de ventas</h3>

                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">Número</th>
                                <th scope="col">Vendedor</th>
                                <th scope="col">Cliente</th>
                                <th scope="col">Producto</th>
                                <th scope="col">Fecha</th>
                                <th scope="col">Precio</th>
                                <th scope="col">Medio de pago</th>
                                <th scope="col"></th>
                                <th scope="col"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                //Instancia la lista desde el atributo de la sesion seteado en Servlet.
                                List<Venta> listaVentas = (List) misession.getAttribute("listaVentas");

                                //Formatea la fecha y el timezone. (Da un día menos sin el TZ.)
                                SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
                                sdf.setTimeZone(TimeZone.getTimeZone("UTC"));

                                //Iteración para mostrar los servicios
                                for (Venta venta : listaVentas) {
                            %>    
                            <tr>
                                <% //Busca los valores de cada venta
                                    int numVenta = venta.getNum_venta();
                                    String vendedor = venta.getVenta_empleado().getNombre() + " " + venta.getVenta_empleado().getApellido();
                                    String cliente = venta.getVenta_cliente().getNombre() + " " + venta.getVenta_cliente().getApellido();
                                    String producto = "";
                                    double precio = 0;
                                    if (venta.getVenta_servicio() != null) {
                                        producto = venta.getVenta_servicio().getNombre();
                                        precio = venta.getVenta_servicio().getCosto_servicio();
                                    } else {
                                        producto = venta.getVenta_paquete().mostrarServicios(venta.getVenta_paquete().getLista_servicios());
                                        precio = venta.getVenta_paquete().getCosto_paquete();
                                    }
                                    String fecha = sdf.format(venta.getFecha_venta());
                                    String medioPago = venta.getMedio_pago();
                                    boolean activo = venta.isVenta_activo();

                                    //Filtro para mostrar solo servicios activos
                                    if (activo == true) {
                                %>
                                <th scope="row"><%=numVenta%></td>
                                <td><%=vendedor%></td>
                                <td><%=cliente%></td>
                                <td><%=producto%></td>
                                <td><%=fecha%></td>
                                <td><%=precio%></td>
                                <td><%=medioPago%></td>
                                <td>
                                    <form action="SvModificar" method="POST">
                                        <input type="hidden" name="pedirModificarVenta" value="<%=numVenta%>">
                                        <button type="submit" class="btn btn-warning">Modificar</button>
                                    </form>
                                </td>
                                <td>
                                    <form action="SvModificar" method="POST">
                                        <input type="hidden" name="eliminarVenta" value="<%=numVenta%>">
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
