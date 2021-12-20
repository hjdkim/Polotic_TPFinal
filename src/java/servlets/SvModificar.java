package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.Cliente;
import logica.Controladora;
import logica.Empleado;
import logica.Paquete;
import logica.Servicio;
import logica.Usuario;
import logica.Venta;

@WebServlet(name = "SvModificar", urlPatterns = {"/SvModificar"})
public class SvModificar extends HttpServlet {

    //Instancia de la controladora lógica
    Controladora control = new Controladora();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //Carga el servicio a modificar si se aprieta el botón 'pedirModificarServ'
        if (request.getParameter("pedirModificarServ") != null) {

            //Trae el servicio con el código y lo guarda en la sesión
            int codigoServ = Integer.parseInt(request.getParameter("pedirModificarServ"));
            Servicio serv = control.traerServicio(codigoServ);
            HttpSession misession = request.getSession();
            misession.setAttribute("servAModificar", serv);
            response.sendRedirect("ModificarServicio.jsp");
        }

        //Modifica el servicio si se aprieta el botón 'modificarServ'
        if (request.getParameter("modificarServ") != null) {
            try {
                //Trae los parámetros del formulario y modifica al servicio con los mismos.
                String nombre = request.getParameter("nombre");
                String descripcion = request.getParameter("descripcion");
                String destino = request.getParameter("destino");
                Double costo = Double.parseDouble(request.getParameter("costo"));
                Date fecha_servicio = sdf.parse(request.getParameter("fecha_servicio"));

                //Trae al servicio con el código de servicio
                Servicio serv = control.traerServicio(Integer.parseInt(request.getParameter("modificarServ")));
                //Setea los atributos al servicio y se lo pasa a la controladora de persistencia para modificar
                serv.setNombre(nombre);
                serv.setDescripcion_breve(descripcion);
                serv.setDestino_servicio(destino);
                serv.setFecha_servicio(fecha_servicio);
                serv.setCosto_servicio(costo);

                control.modificarServicio(serv);

                //Redirecciona al servlet SvServicio
                response.sendRedirect("SvServicio");
            } catch (ParseException ex) {
                Logger.getLogger(SvEmpleado.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        //Carga el cliente a modificar si se aprieta el botón 'pedirModificarCli'
        if (request.getParameter("pedirModificarCli") != null) {

            //Trae el cliente con el id y lo guarda en la sesión
            int idCli = Integer.parseInt(request.getParameter("pedirModificarCli"));
            Cliente cli = control.traerCliente(idCli);
            HttpSession misession = request.getSession();
            misession.setAttribute("cliAModificar", cli);
            response.sendRedirect("ModificarCliente.jsp");
        }

        //Modifica el cliente si se aprieta el botón 'modificarCli'
        if (request.getParameter("modificarCli") != null) {
            try {
                //Trae los parámetros del formulario y modifica al servicio con los mismos.
                String nombre = request.getParameter("nombre");
                String apellido = request.getParameter("apellido");
                String direccion = request.getParameter("direccion");
                String dni = request.getParameter("dni");
                Date fecha_nac = sdf.parse(request.getParameter("fecha_nac"));
                String nacionalidad = request.getParameter("nacionalidad");
                String celular = request.getParameter("celular");
                String email = request.getParameter("email");

                //Trae al cliente con el ID de cliente
                Cliente cli = control.traerCliente(Integer.parseInt(request.getParameter("modificarCli")));
                //Setea los atributos al cliente y se lo pasa a la controladora de persistencia para modificar
                cli.setNombre(nombre);
                cli.setApellido(apellido);
                cli.setDireccion(direccion);
                cli.setDni(dni);
                cli.setFecha_nac(fecha_nac);
                cli.setNacionalidad(nacionalidad);
                cli.setCelular(celular);
                cli.setEmail(email);

                control.modificarCliente(cli);

                //Redirecciona al servlet SvCliente
                response.sendRedirect("SvCliente");
            } catch (ParseException ex) {
                Logger.getLogger(SvEmpleado.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        //Carga el empleado a modificar si se aprieta el botón 'pedirModificarEmple'
        if (request.getParameter("pedirModificarEmple") != null) {

            //Trae el empleado con el id y lo guarda en la sesión
            int idEmple = Integer.parseInt(request.getParameter("pedirModificarEmple"));
            Empleado emple = control.traerEmpleado(idEmple);
            HttpSession misession = request.getSession();
            misession.setAttribute("empleAModificar", emple);
            response.sendRedirect("ModificarEmpleado.jsp");
        }

        //Modifica el empleado si se aprieta el botón 'modificarEmple'
        if (request.getParameter("modificarEmple") != null) {
            try {
                //Trae los parámetros del formulario y modifica al empleado con los mismos.
                String nombre = request.getParameter("nombre");
                String apellido = request.getParameter("apellido");
                String direccion = request.getParameter("direccion");
                String dni = request.getParameter("dni");
                Date fecha_nac = sdf.parse(request.getParameter("fecha_nac"));
                String nacionalidad = request.getParameter("nacionalidad");
                String celular = request.getParameter("celular");
                String email = request.getParameter("email");
                String cargo = request.getParameter("cargo");
                Double sueldo = Double.parseDouble(request.getParameter("sueldo"));
                String nombreUsu = request.getParameter("nombreUsu");
                String contrasenia = request.getParameter("contrasenia");

                //Trae al empleado y su usuario con el ID
                Empleado emple = control.traerEmpleado(Integer.parseInt(request.getParameter("modificarEmple")));
                Usuario usu = emple.getUsu();

                //Setea los atributos al cliente y se lo pasa a la controladora de persistencia para modificar
                emple.setNombre(nombre);
                emple.setApellido(apellido);
                emple.setDireccion(direccion);
                emple.setDni(dni);
                emple.setFecha_nac(fecha_nac);
                emple.setNacionalidad(nacionalidad);
                emple.setCelular(celular);
                emple.setEmail(email);
                emple.setCargo(cargo);
                emple.setSueldo(sueldo);
                usu.setNombreUsu(nombreUsu);
                usu.setContrasenia(contrasenia);

                control.modificarEmpleado(emple, usu);

                //Redirecciona al servlet SvEmpleado
                response.sendRedirect("SvEmpleado");
            } catch (ParseException ex) {
                Logger.getLogger(SvEmpleado.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        //Carga el paquete a modificar si se aprieta el botón 'pedirModificarPaque'
        if (request.getParameter("pedirModificarPaque") != null) {

            //Trae el paquete con el código y lo guarda en la sesión
            int codigoPaque = Integer.parseInt(request.getParameter("pedirModificarPaque"));
            Paquete paque = control.traerPaquete(codigoPaque);
            HttpSession misession = request.getSession();
            misession.setAttribute("paqueAModificar", paque);
            response.sendRedirect("ModificarPaquete.jsp");
        }

        //Modifica el servicio si se aprieta el botón 'modificarPaque'
        if (request.getParameter("modificarPaque") != null) {
            //Trae los parámetros del formulario y modifica al servicio con los mismos.
            String[] lista_codigos = request.getParameterValues("servicio");

            Paquete paque = control.traerPaquete(Integer.parseInt(request.getParameter("modificarPaque")));

            List<Servicio> listaParaPaquete = new ArrayList<Servicio>();

            //Trae toda la lista de servicios
            List<Servicio> listaServicios = control.traerServicios();

            double precio_original = 0;

            //Recorre la lista de servicios y agrega a la lista para paquetes si el código coincide.
            for (String codigo : lista_codigos) {
                for (Servicio serv : listaServicios) {
                    if (Integer.parseInt(codigo) == serv.getCodigo_servicio()) {
                        listaParaPaquete.add(serv);
                        precio_original += serv.getCosto_servicio(); //Suma el precio
                    }
                }
            }

            //Aplica el descuento
            double descuento = precio_original * 0.1;
            double precio_final = precio_original - descuento;

            //Asigna valores al paquete y se lo pasa a la controladora de persistencia para crear
            paque.setCosto_paquete(precio_final);
            paque.setPaquete_activo(true);
            paque.setLista_servicios(listaParaPaquete);

            control.modificarPaquete(paque);

            //Redirecciona al servlet SvServicio
            response.sendRedirect("SvPaquete");
        }

        //Carga la venta a modificar si se aprieta el botón 'pedirModificarVenta'
        if (request.getParameter("pedirModificarVenta") != null) {

            //Trae venta con el número y la guarda en la sesión
            int numVenta = Integer.parseInt(request.getParameter("pedirModificarVenta"));
            Venta venta = control.traerVenta(numVenta);
            HttpSession misession = request.getSession();
            misession.setAttribute("ventaAModificar", venta);
            response.sendRedirect("ModificarVenta.jsp");
        }

        //Modifica la venta si se aprieta el botón 'modificarVenta'
        if (request.getParameter("modificarVenta") != null) {
            try {
                //Trae los parámetros del formulario y modifica a la venta con los mismos.
                int idEmple = Integer.parseInt(request.getParameter("vendedor"));
                int idCli = Integer.parseInt(request.getParameter("cliente"));
                String producto = request.getParameter("producto");
                Date fechaVenta = sdf.parse(request.getParameter("fechaVenta"));
                String medioPago = request.getParameter("medioPago");

                //Trae a la venta con el número de venta
                Venta venta = control.traerVenta(Integer.parseInt(request.getParameter("modificarVenta")));
                //Setea los atributos a la venta y se lo pasa a la controladora de persistencia para modificar

                //Asigna valores a Venta
                Empleado emple = control.traerEmpleado(idEmple);
                Cliente cli = control.traerCliente(idCli);
                venta.setVenta_empleado(emple);
                venta.setVenta_cliente(cli);
                venta.setFecha_venta(fechaVenta);
                venta.setMedio_pago(medioPago);

                //Verifica si el producto es un servicio o un paquete
                if (producto.charAt(0) == 's') {
                    Servicio serv = control.traerServicio(Integer.parseInt(producto.substring(1)));
                    venta.setVenta_servicio(serv);
                    venta.setVenta_paquete(null);
                } else {
                    Paquete paque = control.traerPaquete(Integer.parseInt(producto.substring(1)));
                    venta.setVenta_paquete(paque);
                    venta.setVenta_servicio(null);
                }

                control.modificarVenta(venta);

                //Redirecciona al servlet SvCliente
                response.sendRedirect("SvVerVentas");
            } catch (ParseException ex) {
                Logger.getLogger(SvEmpleado.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        //Carga la venta a eliminar si se aprieta el botón 'eliminarVenta'
        if (request.getParameter("eliminarVenta") != null) {
            //Trae venta con el número, la inactiva y se la pasa a la controladora para modificar
            int numVenta = Integer.parseInt(request.getParameter("eliminarVenta"));
            Venta venta = control.traerVenta(numVenta);
            venta.setVenta_activo(false);

            control.modificarVenta(venta);

            response.sendRedirect("SvVerVentas");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
