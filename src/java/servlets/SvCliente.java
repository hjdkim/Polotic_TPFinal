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

@WebServlet(name = "SvCliente", urlPatterns = {"/SvCliente"})
public class SvCliente extends HttpServlet {

    Controladora control = new Controladora();
    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //Trae la lista de empleados y la guarda como atributo en la session.
        List<Cliente> listaClientes = control.traerClientes();
        HttpSession misession = request.getSession();
        misession.setAttribute("listaClientes", listaClientes);
        response.sendRedirect("VerClientes.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String nombre = request.getParameter("nombre");
            String apellido = request.getParameter("apellido");
            String direccion = request.getParameter("direccion");
            String dni = request.getParameter("dni");
            Date fecha_nac = formatter.parse(request.getParameter("fecha_nac"));
            String nacionalidad = request.getParameter("nacionalidad");
            String celular = request.getParameter("celular");
            String email = request.getParameter("email");

            control.crearCliente(nombre, apellido, direccion, dni, fecha_nac, nacionalidad, celular, email);
            response.sendRedirect("SvCliente");
        } catch (ParseException ex) {
            Logger.getLogger(SvEmpleado.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
