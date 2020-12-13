package Logica;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


@Entity
public class Turno implements Serializable{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    int id_turno;
    String motivo; 
    @Temporal(TemporalType.DATE)
    Date fecha;   
    @Temporal(TemporalType.TIME)
    Date horario;  
    String estado;
    String observaciones;
    @ManyToOne
    @JoinColumn(name = "DOCTOR_ID")
    Doctor doctor;
    @ManyToOne
    @JoinColumn(name = "PACIENTE_ID")
    Paciente paciente;

    public Turno() {
    }

    public Turno(int id_turno, String motivo, Date fecha, Date horario, String estado, String observaciones, Doctor doctor, Paciente paciente) {
        this.id_turno = id_turno;
        this.motivo = motivo;
        this.fecha = fecha;
        this.horario = horario;
        this.estado = estado;
        this.observaciones = observaciones;
        this.doctor = doctor;
        this.paciente = paciente;
    }

    public int getId_turno() {
        return id_turno;
    }

    public void setId_turno(int id_turno) {
        this.id_turno = id_turno;
    }

    public String getMotivo() {
        return motivo;
    }

    public void setMotivo(String motivo) {
        this.motivo = motivo;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public Date getHorario() {
        return horario;
    }

    public void setHorario(Date horario) {
        this.horario = horario;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getObservaciones() {
        return observaciones;
    }

    public void setObservaciones(String observaciones) {
        this.observaciones = observaciones;
    }

    public Doctor getDoctor() {
        return doctor;
    }

    public void setDoctor(Doctor doctor) {
        this.doctor = doctor;
    }

    public Paciente getPaciente() {
        return paciente;
    }

    public void setPaciente(Paciente paciente) {
        this.paciente = paciente;
    }

    
}
