package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
        //Trae las listas de servicios paquetes y las guarda como atributo en la session.
        List<Servicio> listaServicios = control.traerServicios();
        HttpSession misession = request.getSession();
        misession.setAttribute("listaServicios", listaServicios);
        List<Paquete> listaPaquetes = control.traerPaquetes();
        misession.setAttribute("listaPaquetes", listaPaquetes);
        response.sendRedirect("VerPaquetes.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //Trae los servicios marcados como array de String y arma el paquete con los mismos
        String[] lista_codigos = request.getParameterValues("servicio");
        
        Paquete paque = new Paquete();
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
        
        control.crearPaquete(paque);
        
        //Actualiza la lista de paquetes y redirige
        HttpSession misession = request.getSession();
        List<Paquete> listaPaquetes = control.traerPaquetes();
        misession.setAttribute("listaPaquetes", listaPaquetes);
        response.sendRedirect("VerPaquetes.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
