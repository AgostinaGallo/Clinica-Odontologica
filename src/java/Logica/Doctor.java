package Logica;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class Doctor extends Persona implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    int id_doctor;
    String especialidad;
    @OneToOne
    @JoinColumn(name = "USUARIO_ID")
    Usuario usuario;
    @OneToMany(mappedBy = "doctor")
    List<HorarioAtencion> listaHorarios;
    @OneToMany(mappedBy = "doctor")
    List<Turno> listaTurnos;

    public Doctor() {
    }

    public Doctor(int id_doctor, String especialidad, Usuario usuario, List<HorarioAtencion> listaHorarios, List<Turno> listaTurnos, String dni, String nombre, String apellido, String sexo, String direccion, String telefono, String email, Date fecha_nacimiento, String ciudad, String provincia) {
        super(dni, nombre, apellido, sexo, direccion, telefono, email, fecha_nacimiento, ciudad, provincia);
        this.id_doctor = id_doctor;
        this.especialidad = especialidad;
        this.usuario = usuario;
        this.listaHorarios = listaHorarios;
        this.listaTurnos = listaTurnos;
    }

    public String getEspecialidad() {
        return especialidad;
    }

    public void setEspecialidad(String especialidad) {
        this.especialidad = especialidad;
    }

    public List<HorarioAtencion> getListaHorarios() {
        return listaHorarios;
    }

    public void setListaHorarios(List<HorarioAtencion> listaHorarios) {
        this.listaHorarios = listaHorarios;
    }

    public List<Turno> getListaTurnos() {
        return listaTurnos;
    }

    public void setListaTurnos(List<Turno> listaTurnos) {
        this.listaTurnos = listaTurnos;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    public int getId_doctor() {
        return id_doctor;
    }

    public void setId_doctor(int id_doctor) {
        this.id_doctor = id_doctor;
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
