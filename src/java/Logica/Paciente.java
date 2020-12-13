package Logica;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class Paciente extends Persona implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    int id_paciente;
    @Temporal(TemporalType.DATE)
    Date fecha_registro;
    String estado;
    boolean poseeCobertura;
    @OneToOne(mappedBy = "paciente")
    Cobertura cobertura;
    @OneToOne(mappedBy = "paciente")
    Responsable responsable;
    @OneToMany(mappedBy = "paciente")
    List<Turno> listaTurnos;

    public Paciente() {
    }

    public Paciente(int id_paciente, Date fecha_registro, String estado, boolean poseeCobertura, Cobertura cobertura, Responsable responsable, List<Turno> listaTurnos, String dni, String nombre, String apellido, String sexo, String direccion, String telefono, String email, Date fecha_nacimiento, String ciudad, String provincia) {
        super(dni, nombre, apellido, sexo, direccion, telefono, email, fecha_nacimiento, ciudad, provincia);
        this.id_paciente = id_paciente;
        this.fecha_registro = fecha_registro;
        this.estado = estado;
        this.poseeCobertura = poseeCobertura;
        this.cobertura = cobertura;
        this.responsable = responsable;
        this.listaTurnos = listaTurnos;
    }

    public int getId_paciente() {
        return id_paciente;
    }

    public void setId_paciente(int id_paciente) {
        this.id_paciente = id_paciente;
    }

    public Date getFecha_registro() {
        return fecha_registro;
    }

    public void setFecha_registro(Date fecha_registro) {
        this.fecha_registro = fecha_registro;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public boolean isPoseeCobertura() {
        return poseeCobertura;
    }

    public void setPoseeCobertura(boolean poseeCobertura) {
        this.poseeCobertura = poseeCobertura;
    }

    public Cobertura getCobertura() {
        return cobertura;
    }

    public void setCobertura(Cobertura cobertura) {
        this.cobertura = cobertura;
    }

    public Responsable getResponsable() {
        return responsable;
    }

    public void setResponsable(Responsable responsable) {
        this.responsable = responsable;
    }

    public List<Turno> getListaTurnos() {
        return listaTurnos;
    }

    public void setListaTurnos(List<Turno> listaTurnos) {
        this.listaTurnos = listaTurnos;
    }

    @Override
    public String getDni() {
        return dni;
    }

    @Override
    public void setDni(String dni) {
        this.dni = dni;
    }

    @Override
    public String getNombre() {
        return nombre;
    }

    @Override
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    @Override
    public String getApellido() {
        return apellido;
    }

    @Override
    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    @Override
    public String getSexo() {
        return sexo;
    }

    @Override
    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    @Override
    public String getDireccion() {
        return direccion;
    }

    @Override
    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    @Override
    public String getTelefono() {
        return telefono;
    }

    @Override
    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    @Override
    public String getEmail() {
        return email;
    }

    @Override
    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public Date getFecha_nacimiento() {
        return fecha_nacimiento;
    }

    @Override
    public void setFecha_nacimiento(Date fecha_nacimiento) {
        this.fecha_nacimiento = fecha_nacimiento;
    }

    @Override
    public String getCiudad() {
        return ciudad;
    }

    @Override
    public void setCiudad(String ciudad) {
        this.ciudad = ciudad;
    }

    @Override
    public String getProvincia() {
        return provincia;
    }

    @Override
    public void setProvincia(String provincia) {
        this.provincia = provincia;
    }

}
