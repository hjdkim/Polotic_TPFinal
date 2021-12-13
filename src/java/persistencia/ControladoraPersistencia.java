package persistencia;

import logica.Empleado;
import logica.Servicio;
import logica.Usuario;

public class ControladoraPersistencia {
    ServicioJpaController servicioJPA = new ServicioJpaController();
    EmpleadoJpaController empleJPA = new EmpleadoJpaController();
    UsuarioJpaController usuJPA = new UsuarioJpaController();
    
    public void crearServicio(Servicio serv){
        servicioJPA.create(serv);
    }
    
    public void crearEmpleado(Empleado emple, Usuario usu){
        usuJPA.create(usu);
        empleJPA.create(emple);
    }
    
}
