package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
import logica.Servicio;

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

            //Trae el cliente con el código y lo guarda en la sesión
            int codigoCli = Integer.parseInt(request.getParameter("pedirModificarCli"));
            Cliente cli = control.traerCliente(codigoCli);
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

                //Trae al cliente con el código de cliente
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

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
