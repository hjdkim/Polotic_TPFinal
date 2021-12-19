package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.Controladora;

@WebServlet(name = "SvUsuario", urlPatterns = {"/SvUsuario"})
public class SvUsuario extends HttpServlet {

    Controladora control = new Controladora();
    
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
        
        //Trae los parámetros de usuario y contraseña del jsp
        String usuario = request.getParameter("nombreUsu");
        String contrasenia = request.getParameter("contrasenia");
        
        //Verifica los datos del usuario
        boolean autorizado = control.verificarUsuario(usuario, contrasenia);
        
        
        if(autorizado == true) {
            //Obtengo la session y le asigo el usuario y la contraseña
            HttpSession misession = request.getSession();
            misession.setAttribute("usuario", usuario);
            misession.setAttribute("contrasenia", contrasenia);
            
            response.sendRedirect("index.jsp");
        } else {
            response.sendRedirect("login.jsp");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
