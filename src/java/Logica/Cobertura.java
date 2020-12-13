package Logica;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

@Entity
public class Cobertura implements Serializable{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY) 
    int id_cobertura;  
    String nombre;
    String cuil;
    String nro_afiliado;
    String nro_titular;
    String estado; 
    @OneToOne
    @JoinColumn(name="PACIENTE_ID")
    Paciente paciente;

    public Cobertura() {
    }

    public Cobertura(int id_cobertura, String nombre, String cuil, String nro_afiliado, String nro_titular, String estado, Paciente paciente) {
        this.id_cobertura = id_cobertura;
        this.nombre = nombre;
        this.cuil = cuil;
        this.nro_afiliado = nro_afiliado;
        this.nro_titular = nro_titular;
        this.estado = estado;
        this.paciente = paciente;
    }

    public int getId_cobertura() {
        return id_cobertura;
    }

    public void setId_cobertura(int id_cobertura) {
        this.id_cobertura = id_cobertura;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getCuil() {
        return cuil;
    }

    public void setCuil(String cuil) {
        this.cuil = cuil;
    }

    public String getNro_afiliado() {
        return nro_afiliado;
    }

    public void setNro_afiliado(String nro_afiliado) {
        this.nro_afiliado = nro_afiliado;
    }

    public String getNro_titular() {
        return nro_titular;
    }

    public void setNro_titular(String nro_titular) {
        this.nro_titular = nro_titular;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }
    
    
}
