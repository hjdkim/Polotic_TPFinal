package persistencia;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import logica.Cliente;
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

    public Empleado traerEmpleado(int id) {
        return empleJPA.findEmpleado(id);
    }

    public void modificarEmpleado(Empleado emple, Usuario usu) {
        try {
            empleJPA.edit(emple);
            usuJPA.edit(usu);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
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

    public void modificarServicio(Servicio serv) {
        try {
            servicioJPA.edit(serv);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
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
    
    public Paquete traerPaquete(int id) {
        return paqueteJPA.findPaquete(id);
    }
    
    public void modificarPaquete(Paquete paque) {
        try {
            paqueteJPA.edit(paque);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void eliminarPaquete(int codigoPaque) {
        try {
            paqueteJPA.destroy(codigoPaque);
        } catch (persistencia.exceptions.NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void crearCliente(Cliente cli) {
        clienteJPA.create(cli);
    }

    public List<Cliente> traerClientes() {
        return clienteJPA.findClienteEntities();
    }

    public Cliente traerCliente(int id) {
        return clienteJPA.findCliente(id);
    }

    public void modificarCliente(Cliente cli) {
        try {
            clienteJPA.edit(cli);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void eliminarCliente(int id) {
        try {
            clienteJPA.destroy(id);
        } catch (persistencia.exceptions.NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
