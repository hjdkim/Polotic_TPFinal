package logica;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;

@Entity
public class Paquete implements Serializable {
    
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    private int codigo_paquete;
    @Basic
    private double costo_paquete;
    @ManyToMany(mappedBy = "lista_paquetes")
    private List<Servicio> lista_servicios;

    public Paquete() {
    }

    public Paquete(int codigo_paquete, double costo_paquete, List<Servicio> lista_servicios) {
        this.codigo_paquete = codigo_paquete;
        this.costo_paquete = costo_paquete;
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
    
    
}
