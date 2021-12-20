package logica;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class Venta implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    private int num_venta;
    @Temporal(TemporalType.DATE)
    private Date fecha_venta;
    @Basic
    private String medio_pago;
    @ManyToOne(optional = true)
    private Servicio venta_servicio;
    @ManyToOne(optional = true)
    private Paquete venta_paquete;
    @ManyToOne
    private Cliente venta_cliente;
    @ManyToOne
    private Empleado venta_empleado;
    @Basic
    private boolean venta_activo;
    
    public Venta() {
    }

    public Venta(int num_venta, Date fecha_venta, String medio_pago, Servicio venta_servicio, Paquete venta_paquete, Cliente venta_cliente, Empleado venta_empleado, boolean venta_activo) {
        this.num_venta = num_venta;
        this.fecha_venta = fecha_venta;
        this.medio_pago = medio_pago;
        this.venta_servicio = venta_servicio;
        this.venta_paquete = venta_paquete;
        this.venta_cliente = venta_cliente;
        this.venta_empleado = venta_empleado;
        this.venta_activo = venta_activo;
    }

    public int getNum_venta() {
        return num_venta;
    }

    public void setNum_venta(int num_venta) {
        this.num_venta = num_venta;
    }

    public Date getFecha_venta() {
        return fecha_venta;
    }

    public void setFecha_venta(Date fecha_venta) {
        this.fecha_venta = fecha_venta;
    }

    public String getMedio_pago() {
        return medio_pago;
    }

    public void setMedio_pago(String medio_pago) {
        this.medio_pago = medio_pago;
    }

    public Servicio getVenta_servicio() {
        return venta_servicio;
    }

    public void setVenta_servicio(Servicio venta_servicio) {
        this.venta_servicio = venta_servicio;
    }

    public Paquete getVenta_paquete() {
        return venta_paquete;
    }

    public void setVenta_paquete(Paquete venta_paquete) {
        this.venta_paquete = venta_paquete;
    }

    public Cliente getVenta_cliente() {
        return venta_cliente;
    }

    public void setVenta_cliente(Cliente venta_cliente) {
        this.venta_cliente = venta_cliente;
    }

    public Empleado getVenta_empleado() {
        return venta_empleado;
    }

    public void setVenta_empleado(Empleado venta_empleado) {
        this.venta_empleado = venta_empleado;
    }

    public boolean isVenta_activo() {
        return venta_activo;
    }

    public void setVenta_activo(boolean venta_activo) {
        this.venta_activo = venta_activo;
    }

}
