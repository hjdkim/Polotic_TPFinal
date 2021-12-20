package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.Controladora;
import logica.Empleado;

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
        String nombreEmpleado = "";
        
        //Verifica los datos del usuario
        int usuID = control.verificarUsuario(usuario, contrasenia);

        if (usuID != 0) {
            //Busca el nombre de empleado
            List<Empleado> listaEmpleados = control.traerEmpleados();
            for (Empleado emple : listaEmpleados) {
                if (emple.getUsu().getId_Usuario() == usuID) {
                    nombreEmpleado = emple.getNombre();
                }
            }

            //Obtengo la session y le asigo el usuario, la contraseña y el nombre del empleado
            HttpSession misession = request.getSession();
            misession.setAttribute("usuario", usuario);
            misession.setAttribute("contrasenia", contrasenia);
            misession.setAttribute("nombreEmpleado", nombreEmpleado);

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
