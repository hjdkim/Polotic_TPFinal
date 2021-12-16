package logica;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
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
    private double costo_servico;
    @Temporal(TemporalType.DATE)
    private Date fecha_servicio;
    @ManyToMany
    @JoinTable(
        name="servicio_paquete",
        joinColumns = @JoinColumn(name = "codigo_servicio"),
        inverseJoinColumns = @JoinColumn(name = "codigo_paquete"))
    private List<Paquete> lista_paquetes;

    public Servicio() {
    }

    public Servicio(int codigoServicio, String nombre, String descripcion_breve, String destino_servicio, Date fecha_servicio, double costo_servico) {
        this.codigo_servicio = codigoServicio;
        this.nombre = nombre;
        this.descripcion_breve = descripcion_breve;
        this.destino_servicio = destino_servicio;
        this.fecha_servicio = fecha_servicio;
        this.costo_servico = costo_servico;
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

    public void setCosto_servico(double costo_servico) {
        this.costo_servico = costo_servico;
    }

    public void setFecha_servicio(Date fecha_servicio) {
        this.fecha_servicio = fecha_servicio;
    }

    public int getCodigoServicio() {
        return codigo_servicio;
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

    public double getCosto_servico() {
        return costo_servico;
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

}
