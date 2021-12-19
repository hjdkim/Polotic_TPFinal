package persistencia;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import logica.Empleado;
import logica.Paquete;
import logica.Servicio;
import logica.Usuario;
import logica.exceptions.NonexistentEntityException;

public class ControladoraPersistencia {

    ClienteJpaController clienteJPA = new ClienteJpaController();
    EmpleadoJpaController empleJPA = new EmpleadoJpaController();
    PaqueteJpaController paqueteJPA = new PaqueteJpaController();
    ServicioJpaController servicioJPA = new ServicioJpaController();
    UsuarioJpaController usuJPA = new UsuarioJpaController();
    VentaJpaController ventaJPA = new VentaJpaController();
    
    public List<Usuario> traerUsuarios() {
        return usuJPA.findUsuarioEntities();
    }
    
    public Usuario traerUsuario(int id) {
        return usuJPA.findUsuario(id);
    }
    
    public void crearEmpleado(Empleado emple, Usuario usu) {
        usuJPA.create(usu);
        empleJPA.create(emple);
    }

    public List<Empleado> traerEmpleados() {
        return empleJPA.findEmpleadoEntities();
    }
    
    public void eliminarEmpleado(int id) {
        try {
            empleJPA.destroy(id);
        } catch (persistencia.exceptions.NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void crearServicio(Servicio serv) {
        servicioJPA.create(serv);
    }

    public List<Servicio> traerServicios() {
        return servicioJPA.findServicioEntities();
    }
    
    public Servicio traerServicios(int id) {
        return servicioJPA.findServicio(id);
    }
    
    public void eliminarServicio(int codigoServ) {
        try {
            servicioJPA.destroy(codigoServ);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void crearPaquete(Paquete paq) {
        paqueteJPA.create(paq);
    }
    
    public List<Paquete> traerPaquetes() {
        return paqueteJPA.findPaqueteEntities();
    }
    
    public void eliminarPaquete(int codigoPaque) {
        try {
            paqueteJPA.destroy(codigoPaque);
        } catch (persistencia.exceptions.NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}
