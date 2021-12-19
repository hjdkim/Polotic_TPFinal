package logica;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class Servicio implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    private int codigo_servicio;
    @Basic
    private String nombre;
    private String descripcion_breve;
    private String destino_servicio;
    private double costo_servicio;
    private boolean servicio_activo;
    @Temporal(TemporalType.DATE)
    private Date fecha_servicio;
    @ManyToMany(mappedBy = "lista_servicios", cascade = CascadeType.PERSIST)
    private List<Paquete> lista_paquetes;

    public Servicio() {
    }

    public Servicio(int codigo_servicio, String nombre, String descripcion_breve, String destino_servicio, double costo_servico, boolean servicio_activo, Date fecha_servicio, List<Paquete> lista_paquetes) {
        this.codigo_servicio = codigo_servicio;
        this.nombre = nombre;
        this.descripcion_breve = descripcion_breve;
        this.destino_servicio = destino_servicio;
        this.costo_servicio = costo_servico;
        this.servicio_activo = servicio_activo;
        this.fecha_servicio = fecha_servicio;
        this.lista_paquetes = lista_paquetes;
    }

    public void setCodigoServicio(int codigoServicio) {
        this.codigo_servicio = codigoServicio;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setDescripcion_breve(String descripcion_breve) {
        this.descripcion_breve = descripcion_breve;
    }

    public void setDestino_servicio(String destino_servicio) {
        this.destino_servicio = destino_servicio;
    }

    public void setCosto_servicio(double costo_servicio) {
        this.costo_servicio = costo_servicio;
    }

    public void setFecha_servicio(Date fecha_servicio) {
        this.fecha_servicio = fecha_servicio;
    }

    public String getNombre() {
        return nombre;
    }

    public String getDescripcion_breve() {
        return descripcion_breve;
    }

    public String getDestino_servicio() {
        return destino_servicio;
    }

    public double getCosto_servicio() {
        return costo_servicio;
    }

    public Date getFecha_servicio() {
        return fecha_servicio;
    }

    public List<Paquete> getLista_paquetes() {
        return lista_paquetes;
    }

    public void setLista_paquetes(List<Paquete> lista_paquetes) {
        this.lista_paquetes = lista_paquetes;
    }

    public int getCodigo_servicio() {
        return codigo_servicio;
    }

    public void setCodigo_servicio(int codigo_servicio) {
        this.codigo_servicio = codigo_servicio;
    }

    public boolean isServicio_activo() {
        return servicio_activo;
    }

    public void setServicio_activo(boolean servicio_activo) {
        this.servicio_activo = servicio_activo;
    }

}
