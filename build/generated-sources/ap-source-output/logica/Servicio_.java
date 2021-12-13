package logica;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.7.v20200504-rNA", date="2021-12-13T01:24:12")
@StaticMetamodel(Servicio.class)
public class Servicio_ { 

    public static volatile SingularAttribute<Servicio, Integer> codigoServicio;
    public static volatile SingularAttribute<Servicio, Date> fecha_servicio;
    public static volatile SingularAttribute<Servicio, Double> costo_servico;
    public static volatile SingularAttribute<Servicio, String> nombre;
    public static volatile SingularAttribute<Servicio, String> descripcion_breve;
    public static volatile SingularAttribute<Servicio, String> destino_servicio;

}