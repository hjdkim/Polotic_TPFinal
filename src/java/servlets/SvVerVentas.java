package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.List;
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

@WebServlet(name = "SvVerVentas", urlPatterns = {"/SvVerVentas"})
public class SvVerVentas extends HttpServlet {

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

        response.sendRedirect("VerVentas.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
