package logica;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;

@Entity
public class Paquete implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    private int codigo_paquete;
    @Basic
    private double costo_paquete;
    private boolean paquete_activo;
    @ManyToMany
    @JoinTable(
            name = "paquete_servicio",
            joinColumns = @JoinColumn(name = "codigo_paquete"),
            inverseJoinColumns = @JoinColumn(name = "codigo_servicio"))
    private List<Servicio> lista_servicios;

    public Paquete() {
    }

    public Paquete(int codigo_paquete, double costo_paquete, boolean paquete_activo, List<Servicio> lista_servicios) {
        this.codigo_paquete = codigo_paquete;
        this.costo_paquete = costo_paquete;
        this.paquete_activo = paquete_activo;
        this.lista_servicios = lista_servicios;
    }

    public int getCodigo_paquete() {
        return codigo_paquete;
    }

    public void setCodigo_paquete(int codigo_paquete) {
        this.codigo_paquete = codigo_paquete;
    }

    public double getCosto_paquete() {
        return costo_paquete;
    }

    public void setCosto_paquete(double costo_paquete) {
        this.costo_paquete = costo_paquete;
    }

    public List<Servicio> getLista_servicios() {
        return lista_servicios;
    }

    public void setLista_servicios(List<Servicio> lista_servicios) {
        this.lista_servicios = lista_servicios;
    }

    public boolean isPaquete_activo() {
        return paquete_activo;
    }

    public void setPaquete_activo(boolean paquete_activo) {
        this.paquete_activo = paquete_activo;
    }
    
    public String mostrarServicios(List<Servicio> lista_servicios) {
        String servicios = "";
        for(Servicio serv : lista_servicios) {
            servicios = servicios + " + " + serv.getNombre();
        }
        return servicios;
    }
    
}
