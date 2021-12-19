package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logica.Controladora;

@WebServlet(name = "SvEliminar", urlPatterns = {"/SvEliminar"})
public class SvEliminar extends HttpServlet {

    //Instancia de la controladora lógica
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

        //Elimina el empleado si se aprieta el botón 'eliminarEmple'
        if (request.getParameter("eliminarEmple") != null) {

            //Trae el código de servicio como parametro y lo elimina
            int idEmple = Integer.parseInt(request.getParameter("eliminarEmple"));
            control.eliminarEmpleado(idEmple);

            //Actualiza la lista y lo setea en el atributo "listaServicios" de la sesion
            request.getSession().setAttribute("listaEmpleados", control.traerEmpleados());
            response.sendRedirect("SvEmpleado");
        }

        //Elimina el servicio si se aprieta el botón 'eliminarServ'
        if (request.getParameter("eliminarServ") != null) {

            //Trae el código de servicio como parametro y lo elimina
            int codigoServ = Integer.parseInt(request.getParameter("eliminarServ"));
            control.eliminarServicio(codigoServ);

            //Actualiza la lista y lo setea en el atributo "listaServicios" de la sesion
            request.getSession().setAttribute("listaServicios", control.traerServicios());
            response.sendRedirect("SvServicio");
        }

        //Elimina el paquete si se aprieta el botón 'eliminarPaque'
        if (request.getParameter("eliminarPaque") != null) {

            //Trae el código de paquete como parametro y lo elimina
            int codigoPaque = Integer.parseInt(request.getParameter("eliminarPaque"));
            control.eliminarPaquete(codigoPaque);

            //Actualiza la lista y lo setea en el atributo "listaServicios" de la sesion
            request.getSession().setAttribute("listaPaquetes", control.traerPaquetes());
            response.sendRedirect("SvPaquete");

        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
