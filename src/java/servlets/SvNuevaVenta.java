package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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
import logica.Venta;

@WebServlet(name = "SvNuevaVenta", urlPatterns = {"/SvNuevaVenta"})
public class SvNuevaVenta extends HttpServlet {

    //instancias de la Controladora de la lógica y Formateadora de fechas
    Controladora control = new Controladora();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //Trae las listas de empleados, servicios, paquetes, clientes y ventas y las guarda como atributo en la session.
        List<Empleado> listaEmpleados = control.traerEmpleados();
        List<Servicio> listaServicios = control.traerServicios();
        List<Paquete> listaPaquetes = control.traerPaquetes();
        List<Cliente> listaClientes = control.traerClientes();
        List<Venta> listaVentas = control.traerVentas();
        HttpSession misession = request.getSession();
        misession.setAttribute("listaEmpleados", listaEmpleados);
        misession.setAttribute("listaServicios", listaServicios);
        misession.setAttribute("listaPaquetes", listaPaquetes);
        misession.setAttribute("listaClientes", listaClientes);
        misession.setAttribute("listaVentas", listaVentas);

        response.sendRedirect("NuevaVenta.jsp");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            //Trae los parámetros ingresados y se los pasa a la controladora para crear venta
            int idEmple = Integer.parseInt(request.getParameter("vendedor"));
            int idCliente = Integer.parseInt(request.getParameter("cliente"));
            String producto = request.getParameter("producto");
            Date fechaVenta = sdf.parse(request.getParameter("fechaVenta"));
            String medioPago = request.getParameter("medioPago");
            control.crearVenta(idEmple, idCliente, producto, fechaVenta, medioPago);

            //Actualiza la lista ventas y redirige a VerVentas
            List<Venta> listaVentas = control.traerVentas();
            HttpSession misession = request.getSession();
            misession.setAttribute("listaVentas", listaVentas);
            response.sendRedirect("VerVentas");
        } catch (ParseException ex) {
            Logger.getLogger(SvNuevaVenta.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
