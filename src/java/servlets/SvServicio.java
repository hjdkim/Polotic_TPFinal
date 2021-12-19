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
import logica.Controladora;
import logica.Servicio;

@WebServlet(name = "SvServicio", urlPatterns = {"/SvServicio"})
public class SvServicio extends HttpServlet {
    
    //instancias de la Controladora de la lógica y Formateadora de fechas
    Controladora control = new Controladora();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //Trae la lista de servicios y la guarda como atributo en la session.
        List <Servicio> listaServicios = control.traerServicios();
        HttpSession misession = request.getSession();
        misession.setAttribute("listaServicios", listaServicios);
        response.sendRedirect("VerServicios.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            //Trae los parámetros del formulario y crea un servicio con los mismos.
            String nombre = request.getParameter("nombre");
            String descripcion = request.getParameter("descripcion");
            String destino = request.getParameter("destino");
            Double costo = Double.parseDouble(request.getParameter("costo"));
            Date fecha_servicio = sdf.parse(request.getParameter("fecha_servicio"));

            control.crearServicio(nombre, descripcion, destino, fecha_servicio, costo);
            response.sendRedirect("SvServicio");
        } catch (ParseException ex) {
            Logger.getLogger(SvEmpleado.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
