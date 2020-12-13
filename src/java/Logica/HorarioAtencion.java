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
public class HorarioAtencion implements Serializable {   
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    int id_horario;    
    String dia;
    @Temporal(TemporalType.TIME)
    Date hora_desde;
    @Temporal(TemporalType.TIME)
    Date hora_hasta;
    @ManyToOne
    @JoinColumn(name = "DOCTOR_ID")
    Doctor doctor;
    
    
    public HorarioAtencion() {
    }

    public HorarioAtencion(int id_horario, String dia, Date hora_desde, Date hora_hasta, Doctor doctor) {
        this.id_horario = id_horario;
        this.dia = dia;
        this.hora_desde = hora_desde;
        this.hora_hasta = hora_hasta;
        this.doctor = doctor;
    }


    public int getId_horario() {
        return id_horario;
    }

    public void setId_horario(int id_horario) {
        this.id_horario = id_horario;
    }

    public String getDia() {
        return dia;
    }

    public void setDia(String dia) {
        this.dia = dia;
    }

    public Date getHora_desde() {
        return hora_desde;
    }

    public void setHora_desde(Date hora_desde) {
        this.hora_desde = hora_desde;
    }

    public Date getHora_hasta() {
        return hora_hasta;
    }

    public void setHora_hasta(Date hora_hasta) {
        this.hora_hasta = hora_hasta;
    }

    public Doctor getDoctor() {
        return doctor;
    }

    public void setDoctor(Doctor doctor) {
        this.doctor = doctor;
    }
      
    
}