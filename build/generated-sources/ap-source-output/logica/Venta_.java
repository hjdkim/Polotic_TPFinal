package logica;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import logica.Cliente;
import logica.Empleado;
import logica.Paquete;
import logica.Servicio;

@Generated(value="EclipseLink-2.7.7.v20200504-rNA", date="2021-12-16T03:24:34")
@StaticMetamodel(Venta.class)
public class Venta_ { 

    public static volatile SingularAttribute<Venta, Integer> num_venta;
    public static volatile SingularAttribute<Venta, String> medio_pago;
    public static volatile SingularAttribute<Venta, Cliente> venta_cliente;
    public static volatile SingularAttribute<Venta, Empleado> venta_empleado;
    public static volatile SingularAttribute<Venta, Servicio> venta_servicio;
    public static volatile SingularAttribute<Venta, Paquete> venta_paquete;
    public static volatile SingularAttribute<Venta, Date> fecha_venta;

}