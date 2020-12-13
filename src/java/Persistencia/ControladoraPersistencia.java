package Persistencia;

import Logica.Doctor;
import Logica.Paciente;
import Logica.Secretaria;
import Logica.Turno;
import Logica.Usuario;
import Persistencia.exceptions.NonexistentEntityException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ControladoraPersistencia {

// Inicializacion Controladores
    CoberturaJpaController coberturaJPA = new CoberturaJpaController();
    DoctorJpaController doctorJPA = new DoctorJpaController();
    HorarioAtencionJpaController horarioJPA = new HorarioAtencionJpaController();
    PacienteJpaController pacienteJPA = new PacienteJpaController();
    ResponsableJpaController responsableJPA = new ResponsableJpaController();
    SecretariaJpaController secretariaJPA = new SecretariaJpaController();
    TurnoJpaController turnoJPA = new TurnoJpaController();
    UsuarioJpaController usuarioJPA = new UsuarioJpaController();

// |||| Listado de Usuarios ||||
    public List<Usuario> getUsuarios() {
        List<Usuario> listaUsuarios;
        listaUsuarios = usuarioJPA.findUsuarioEntities();

        return listaUsuarios;
    }

//+--------------+
// | SECRETARIA |
//+--------------+
    public void crearSecretaria(Secretaria sec) {
        try {
            secretariaJPA.create(sec);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void editarSecre(Secretaria sec) {
        try {
            secretariaJPA.edit(sec);//To change body of generated methods, choose Tools | Templates.
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void borrarSecre(int id_secretaria) {
        try {
            secretariaJPA.destroy(id_secretaria);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public List<Secretaria> getSecres() {
        List<Secretaria> listaSecres;
        listaSecres = secretariaJPA.findSecretariaEntities();

        return listaSecres;
    }

    public Secretaria getSecreById(int id_secretaria) {
        Secretaria sec = secretariaJPA.findSecretaria(id_secretaria);
        return sec;
    }
//+---------+
// | DOCTOR |
//+---------+

    public List<Doctor> getDoctores() {
        List<Doctor> listaDoctores;
        listaDoctores = doctorJPA.findDoctorEntities();

        return listaDoctores;
    }

    public Doctor getDoctorById(int id_doctor) {
        Doctor doc = doctorJPA.findDoctor(id_doctor);
        return doc;
    }

    public String getNombreDoctor(Doctor doc) {
        String nombreDoctor = doc.getNombre() + " " + doc.getApellido();
        System.out.println(nombreDoctor);
        return nombreDoctor;
    }

    public void crearDoctor(Doctor doc) {
        doctorJPA.create(doc);
    }

    public void editarDoctor(Doctor doc) {
        try {
            doctorJPA.edit(doc);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void borrarDoctor(int id_doctor) {
        try {
            doctorJPA.destroy(id_doctor);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

//+---------+
// | TURNO |
//+---------+
    public void crearTurno(Turno tur) {
        try {
            turnoJPA.create(tur);

        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void editarTurno(Turno tur) {
        try {
            turnoJPA.edit(tur);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public void borrarTurno(int id_turno) {
        try {
            turnoJPA.destroy(id_turno);

        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public List<Turno> getTurnos() {
        List<Turno> listaTurnos;
        listaTurnos = turnoJPA.findTurnoEntities();
        return listaTurnos;
    }

    public Turno getTurnoById(int id_turno) {
        Turno tur = turnoJPA.findTurno(id_turno);
        return tur;
    }
//+-----------+
// | PACIENTE |
//+-----------+

    public List<Paciente> getPacientes() {
        List<Paciente> listaPacientes;
        listaPacientes = pacienteJPA.findPacienteEntities();

        return listaPacientes;
    }

    public Paciente getPacienteById(int id_paciente) {
        Paciente pac = pacienteJPA.findPaciente(id_paciente);
        return pac;
    }

    public void crearPaciente(Paciente pac) {
        pacienteJPA.create(pac);
    }

    public void editarPaciente(Paciente pac) {
        try {
            pacienteJPA.edit(pac);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void borrarPaciente(int id_paciente) {
        try {
            pacienteJPA.destroy(id_paciente);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
