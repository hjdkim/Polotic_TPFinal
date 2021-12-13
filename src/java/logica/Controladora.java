package logica;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import persistencia.ControladoraPersistencia;

public class Controladora {
    
    ControladoraPersistencia controlPersis = new ControladoraPersistencia();
    SimpleDateFormat formatter = new SimpleDateFormat("dd-mm-yyyy");
    
    
    public void crearServicio(String nombre, String descripcion_breve, String destino_servicio, Date fecha_servicio, double costo_servico){
        Servicio serv = new Servicio();
        serv.setNombre(nombre);
        serv.setDescripcion_breve(descripcion_breve);
        serv.setDestino_servicio(destino_servicio);
        serv.setFecha_servicio(fecha_servicio);
        serv.setCosto_servico(costo_servico);
        
        controlPersis.crearServicio(serv);
    } 

    public void crearEmpleado(String nombre, String apellido, String direccion, String dni, String fecha_nac, String nacionalidad, String celular, String email, String cargo, Double sueldo, String nombreUsu, String contrasenia) throws ParseException {
        
        Empleado emple = new Empleado();
        Usuario usu = new Usuario();
        
        //Asigno valores al empleado
        emple.setNombre(nombre);
        emple.setApellido(apellido);
        emple.setDireccion(direccion);
        emple.setDni(dni);
        emple.setFecha_nac(formatter.parse(fecha_nac));
        emple.setNacionalidad(nacionalidad);
        emple.setCelular(celular);
        emple.setEmail(email);
        emple.setCargo(cargo);
        emple.setSueldo(sueldo);
        
        //Asigno valores al usuario
        usu.setNombreUsu(nombreUsu);
        usu.setContrasenia(contrasenia);
        
        //Asigno usuario al empleado
        emple.setUsu(usu);
        
        controlPersis.crearEmpleado(emple, usu);
        
    }
    
}
