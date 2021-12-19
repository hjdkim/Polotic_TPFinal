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
import logica.Controladora;
import logica.Paquete;
import logica.Servicio;

@WebServlet(name = "SvPaquete", urlPatterns = {"/SvPaquete"})
public class SvPaquete extends HttpServlet {

    Controladora control = new Controladora();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //Trae la lista de servicios y la guarda como atributo en la session.
        List <Paquete> listaPaquetes = control.traerPaquetes();
        HttpSession misession = request.getSession();
        misession.setAttribute("listaPaquetes", listaPaquetes);
        response.sendRedirect("VerPaquetes.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            String[] lista_codigos = request.getParameterValues("servicio");
            
            control.crearPaquete(lista_codigos);
            
            response.sendRedirect("VerPaquetes.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
