package logica;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import logica.Paquete;

@Generated(value="EclipseLink-2.7.7.v20200504-rNA", date="2021-12-19T18:03:07")
@StaticMetamodel(Servicio.class)
public class Servicio_ { 

    public static volatile SingularAttribute<Servicio, Date> fecha_servicio;
    public static volatile ListAttribute<Servicio, Paquete> lista_paquetes;
    public static volatile SingularAttribute<Servicio, Double> costo_servico;
    public static volatile SingularAttribute<Servicio, Integer> codigo_servicio;
    public static volatile SingularAttribute<Servicio, Boolean> servicio_activo;
    public static volatile SingularAttribute<Servicio, String> nombre;
    public static volatile SingularAttribute<Servicio, String> descripcion_breve;
    public static volatile SingularAttribute<Servicio, String> destino_servicio;

}