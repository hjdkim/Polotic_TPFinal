package logica;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import persistencia.ControladoraPersistencia;

public class Controladora {

    ControladoraPersistencia controlPersis = new ControladoraPersistencia();

    public boolean verificarUsuario(String usuario, String contrasenia) {
        //Trae la lista de usuarios con controladora de persistencia
        List<Usuario> listaUsuarios = controlPersis.traerUsuarios();

        //Si existe una lista de usuarios y si alguno coincide con el usuario y la contraseña, devuelve true.
        if (listaUsuarios != null) {
            for (Usuario usu : listaUsuarios) {
                if (usu.getNombreUsu().equals(usuario) && usu.getContrasenia().equals(contrasenia)) {
                    return true;
                }
            }
        }
        return false;
    }

    public void crearServicio(String nombre, String descripcion_breve, String destino_servicio, Date fecha_servicio, double costo_servico) {
        Servicio serv = new Servicio();
        //Setea los atributos al servicio y se lo pasa a la controladora de persistencia para crear
        serv.setNombre(nombre);
        serv.setDescripcion_breve(descripcion_breve);
        serv.setDestino_servicio(destino_servicio);
        serv.setFecha_servicio(fecha_servicio);
        serv.setCosto_servico(costo_servico);
        serv.setServicio_activo(true);
        
        controlPersis.crearServicio(serv);
    }

    public List<Servicio> traerServicios() {
        return controlPersis.traerServicios();
    }

    public void eliminarServicio(int codigoServ) {
        controlPersis.eliminarServicio(codigoServ);
    }

    public void crearPaquete(String[] lista_codigos){
        Paquete paque = new Paquete();
        List<Servicio> listaParaPaquete = new ArrayList<Servicio>();
        
        //Trae toda la lista de servicios
        List<Servicio> listaServicios = traerServicios();
        
        double precio_original = 0;
        
        //Recorre la lista de servicios y agrega a la lista para paquetes si el código coincide.
        for(String codigo : lista_codigos) {
            for(Servicio serv : listaServicios) {
                if(Integer.parseInt(codigo) == serv.getCodigo_servicio()) {
                    listaParaPaquete.add(serv);
                    precio_original += serv.getCosto_servico(); //Suma el precio
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
        
        controlPersis.crearPaquete(paque);
        
    }
    
    public List<Paquete> traerPaquetes() {
        return controlPersis.traerPaquetes();
    }
    
    public void eliminarPaquete(int codigoPaque) {
        controlPersis.eliminarPaquete(codigoPaque);
    }
    
    
    public void crearEmpleado(String nombre, String apellido, String direccion, String dni, Date fecha_nac, String nacionalidad, String celular, String email, String cargo, Double sueldo, String nombreUsu, String contrasenia) throws ParseException {

        Empleado emple = new Empleado();
        Usuario usu = new Usuario();

        //Asigna valores al empleado
        emple.setNombre(nombre);
        emple.setApellido(apellido);
        emple.setDireccion(direccion);
        emple.setDni(dni);
        emple.setFecha_nac(fecha_nac);
        emple.setNacionalidad(nacionalidad);
        emple.setCelular(celular);
        emple.setEmail(email);
        emple.setCargo(cargo);
        emple.setSueldo(sueldo);
        emple.setEmpleado_activo(true);

        //Asigna valores al usuario
        usu.setNombreUsu(nombreUsu);
        usu.setContrasenia(contrasenia);

        //Asigna usuario al empleado
        emple.setUsu(usu);

        controlPersis.crearEmpleado(emple, usu);
    }

}
