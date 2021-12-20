package logica;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import persistencia.ControladoraPersistencia;

public class Controladora {

    ControladoraPersistencia controlPersis = new ControladoraPersistencia();

    public int verificarUsuario(String usuario, String contrasenia) {
        //Trae la lista de usuarios con controladora de persistencia
        List<Usuario> listaUsuarios = controlPersis.traerUsuarios();
        //Si existe una lista de usuarios y si alguno coincide con el usuario y la contraseña, devuelve true.
        if (listaUsuarios != null) {
            for (Usuario usu : listaUsuarios) {
                if (usu.getNombreUsu().equals(usuario) && usu.getContrasenia().equals(contrasenia)) {
                    return usu.getId_Usuario();
                }
            }
        }
        return 0;
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

    public List<Empleado> traerEmpleados() {
        return controlPersis.traerEmpleados();
    }

    public List<Usuario> traerUsuarios() {
        return controlPersis.traerUsuarios();
    }

    public Empleado traerEmpleado(int id) {
        return controlPersis.traerEmpleado(id);
    }

    public void modificarEmpleado(Empleado emple, Usuario usu) {
        controlPersis.modificarEmpleado(emple, usu);
    }

    public void eliminarEmpleado(int id) {
        controlPersis.eliminarEmpleado(id);
    }

    public void crearServicio(String nombre, String descripcion_breve, String destino_servicio, Date fecha_servicio, double costo_servico) {
        Servicio serv = new Servicio();
        //Setea los atributos al servicio y se lo pasa a la controladora de persistencia para crear
        serv.setNombre(nombre);
        serv.setDescripcion_breve(descripcion_breve);
        serv.setDestino_servicio(destino_servicio);
        serv.setFecha_servicio(fecha_servicio);
        serv.setCosto_servicio(costo_servico);
        serv.setServicio_activo(true);

        controlPersis.crearServicio(serv);
    }

    public List<Servicio> traerServicios() {
        return controlPersis.traerServicios();
    }

    public Servicio traerServicio(int codigoServ) {
        return controlPersis.traerServicios(codigoServ);
    }

    public void modificarServicio(Servicio serv) {
        controlPersis.modificarServicio(serv);
    }

    public void eliminarServicio(int codigoServ) {
        controlPersis.eliminarServicio(codigoServ);
    }

    public void crearPaquete(Paquete paque) {
        controlPersis.crearPaquete(paque);
    }

    public List<Paquete> traerPaquetes() {
        return controlPersis.traerPaquetes();
    }

    public Paquete traerPaquete(int id) {
        return controlPersis.traerPaquete(id);
    }

    public void modificarPaquete(Paquete paque) {
        controlPersis.modificarPaquete(paque);
    }

    public void eliminarPaquete(int codigoPaque) {
        controlPersis.eliminarPaquete(codigoPaque);
    }

    public void crearCliente(String nombre, String apellido, String direccion, String dni, Date fecha_nac, String nacionalidad, String celular, String email) throws ParseException {

        Cliente cli = new Cliente();

        //Asigna valores al empleado
        cli.setNombre(nombre);
        cli.setApellido(apellido);
        cli.setDireccion(direccion);
        cli.setDni(dni);
        cli.setFecha_nac(fecha_nac);
        cli.setNacionalidad(nacionalidad);
        cli.setCelular(celular);
        cli.setEmail(email);
        cli.setCliente_activo(true);

        controlPersis.crearCliente(cli);
    }

    public List<Cliente> traerClientes() {
        return controlPersis.traerClientes();
    }

    public Cliente traerCliente(int id) {
        return controlPersis.traerCliente(id);
    }

    public void modificarCliente(Cliente cli) {
        controlPersis.modificarCliente(cli);
    }

    public void eliminarCliente(int id) {
        controlPersis.eliminarCliente(id);
    }

    public void crearVenta(int idEmple, int idCli, String producto, Date fechaVenta, String medioPago) {
        Venta venta = new Venta();

        //Asigna valores a Venta
        Empleado emple = traerEmpleado(idEmple);
        Cliente cli = traerCliente(idCli);
        venta.setVenta_empleado(emple);
        venta.setVenta_cliente(cli);
        venta.setFecha_venta(fechaVenta);
        venta.setMedio_pago(medioPago);
        venta.setVenta_activo(true);

        //Verifica si el producto es un servicio o un paquete
        if (producto.charAt(0) == 's') {
            Servicio serv = traerServicio(Integer.parseInt(producto.substring(1)));
            venta.setVenta_servicio(serv);
        } else {
            Paquete paque = traerPaquete(Integer.parseInt(producto.substring(1)));
            venta.setVenta_paquete(paque);
        }

        controlPersis.crearVenta(venta);
    }

    public List<Venta> traerVentas() {
        return controlPersis.traerVentas();
    }

    public Venta traerVenta(int id) {
        return controlPersis.traerVenta(id);
    }

    public void modificarVenta(Venta venta) {
        controlPersis.modificarVenta(venta);
    }

    public void eliminarVenta(int id) {
        controlPersis.eliminarVenta(id);
    }
}
