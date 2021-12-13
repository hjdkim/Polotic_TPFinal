package logica;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class Servicio implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    private int codigoServicio;
    @Basic
    private String nombre;
    private String descripcion_breve;
    private String destino_servicio;
    private double costo_servico;
    @Temporal(TemporalType.DATE)
    private Date fecha_servicio;

    public Servicio() {
    }

    public Servicio(int codigoServicio, String nombre, String descripcion_breve, String destino_servicio, Date fecha_servicio, double costo_servico) {
        this.codigoServicio = codigoServicio;
        this.nombre = nombre;
        this.descripcion_breve = descripcion_breve;
        this.destino_servicio = destino_servicio;
        this.fecha_servicio = fecha_servicio;
        this.costo_servico = costo_servico;
    }

    public void setCodigoServicio(int codigoServicio) {
        this.codigoServicio = codigoServicio;
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
        return codigoServicio;
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

}
