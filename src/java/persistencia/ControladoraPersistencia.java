package persistencia;

import java.util.List;
import logica.Empleado;
import logica.Paquete;
import logica.Servicio;
import logica.Usuario;

public class ControladoraPersistencia {

    ClienteJpaController clienteJPA = new ClienteJpaController();
    EmpleadoJpaController empleJPA = new EmpleadoJpaController();
    PaqueteJpaController paqueteJPA = new PaqueteJpaController();
    ServicioJpaController servicioJPA = new ServicioJpaController();
    UsuarioJpaController usuJPA = new UsuarioJpaController();
    VentaJpaController ventaJPA = new VentaJpaController();

    public void crearEmpleado(Empleado emple, Usuario usu) {
        usuJPA.create(usu);
        empleJPA.create(emple);
    }

    public void crearServicio(Servicio serv) {
        servicioJPA.create(serv);
    }

    public List<Servicio> traerServicios() {
        return servicioJPA.findServicioEntities();
    }

    public void crearPaquete(Paquete paq) {
        paqueteJPA.create(paq);
    }

}
