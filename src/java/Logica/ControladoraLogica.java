package Logica;

import Persistencia.ControladoraPersistencia;
import static java.lang.Boolean.parseBoolean;
import static java.lang.Integer.parseInt;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ControladoraLogica {

    ControladoraPersistencia controlPersis = new ControladoraPersistencia();

    private List<Usuario> listaUsuarios;
    //private List<Secretaria> listaSecres;
    //private List<Doctor> listaDoctores;

// -------------------------------------- METODOS
    //Convierte un String a un tipo DATE en formato dd-MM-yyyy
    //@return Retorna la fecha en formato Date
    public static synchronized java.util.Date StringToDate(String fecha) {
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd"); //formato guión
        Date fechaEnviar = null;
        try {
            fechaEnviar = df.parse(fecha);
            return fechaEnviar;
        } catch (ParseException ex) {
            ex.printStackTrace();
            return null;
        }
    }

// Convertir Date a String
    public static String DateToString(Date fecha) {
        SimpleDateFormat formatoFecha = new SimpleDateFormat("yyyy-MM-dd");
        return formatoFecha.format(fecha);
    }

    //Convierte un String a un tipo TIME en formato hh:mm
    public static synchronized java.util.Date StringToTime(String tiempo) {
        DateFormat dt = new SimpleDateFormat("hh:mm"); //formato guión
        Date tiempoEnviar = null;
        try {
            tiempoEnviar = dt.parse(tiempo);
            return tiempoEnviar;
        } catch (ParseException ex) {
            ex.printStackTrace();
            return null;
        }
    }
//Convertir Hora a String

    public static String TimeToString(Date tiempo) throws ParseException {

        SimpleDateFormat formatoTiempo = new SimpleDateFormat("hh:mm");
        return formatoTiempo.format(tiempo);
    }

    // Obtiene Hora Actual del sistema
    public static String getHoraActual() {
        Date ahora = new Date();
        SimpleDateFormat formateador = new SimpleDateFormat("hh:mm");
        return formateador.format(ahora);
    }
//----------------------------------
//          | LOGIN - Comprobacion |
//----------------------------------

    public boolean comprobarLogin(String username, String contrasenia) {

        boolean checkUsuario = false;
        listaUsuarios = controlPersis.getUsuarios();

        //Recorro lista, donde coincida usuario o email con su contraseña
        for (Usuario usu : listaUsuarios) {
            if ((usu.getUsername().equals(username) || usu.getEmail().equals(username)) && usu.getContrasenia().equals(contrasenia)) {
                checkUsuario = true;
                return checkUsuario;
            }
        }
        return checkUsuario;
    }

//+---------+
// | TURNO |
//+---------+
    public List<Turno> getListaTurnos() {
        return controlPersis.getTurnos();
    }

    public Turno getTurnoById(String id_turno) {
        Turno tur = controlPersis.getTurnoById(parseInt(id_turno));
        System.out.print(tur);
        return tur;
    }

    public void crearTurno(String motivo, String fecha, String horario, String doctor, String paciente, String estado, String observaciones) {

        Turno tur = new Turno();

        tur.setMotivo(motivo);
        tur.setFecha(StringToDate(fecha));
        tur.setHorario(StringToTime(horario));
        tur.setDoctor(controlPersis.getDoctorById(parseInt(doctor)));
        tur.setPaciente(controlPersis.getPacienteById(parseInt(paciente)));

        tur.setEstado(estado);
        tur.setObservaciones(observaciones);

        // Llamo a ControladoraPersistencia y envio objeto
        controlPersis.crearTurno(tur);
    }

    public void borrarTurno(String id_turno) {

        controlPersis.borrarTurno(Integer.parseInt(id_turno));
    }

    public void editarTurno(String id_turno, String motivo, String fecha, String horario, String doctor, String paciente, String estado, String observaciones) {

        Turno tur = controlPersis.getTurnoById(parseInt(id_turno));

        tur.setMotivo(motivo);
        tur.setFecha(StringToDate(fecha));
        tur.setHorario(StringToTime(horario));
        tur.setDoctor(controlPersis.getDoctorById(parseInt(doctor)));
        tur.setPaciente(controlPersis.getPacienteById(parseInt(paciente)));
        tur.setEstado(estado);
        tur.setObservaciones(observaciones);

        controlPersis.editarTurno(tur);
    }

//+--------------+
// | SECRETARIA |
//+--------------+
    public void crearSecretaria(String dni, String nombre, String apellido, String sexo, String direccion, String telefono, String email, String fecha_nacimiento, String ciudad, String provincia) {
        Secretaria sec = new Secretaria();
        sec.setDni(dni);
        sec.setNombre(nombre);
        sec.setApellido(apellido);
        sec.setSexo(sexo);
        sec.setDireccion(direccion);
        sec.setTelefono(telefono);
        sec.setEmail(email);
        sec.setFecha_nacimiento(StringToDate(fecha_nacimiento));
        sec.setCiudad(ciudad);
        sec.setProvincia(provincia);
        // !! A arreglar, referenciar relaciones
        sec.setUsuario(sec.getUsuario());

        // Llamo a ControladoraPersistencia y envio objeto
        controlPersis.crearSecretaria(sec);
    }

    public List<Secretaria> getListaSecres() {
        return controlPersis.getSecres();
    }

    public void borrarSecre(String id_secretaria) {
        controlPersis.borrarSecre(Integer.parseInt(id_secretaria));
    }

    public Secretaria getSecreById(String id_secretaria) {
        Secretaria sec = controlPersis.getSecreById(parseInt(id_secretaria));
        System.out.print(sec);
        return sec;
    }

    public void editarSecre(String id_secretaria, String dni, String sexo, String nombre, String apellido, String direccion, String telefono, String email, String fecha_nacimiento, String ciudad, String provincia) {

        Secretaria sec = controlPersis.getSecreById(parseInt(id_secretaria));

        sec.setDni(dni);
        sec.setSexo(sexo);
        sec.setNombre(nombre);
        sec.setApellido(apellido);
        sec.setDireccion(direccion);
        sec.setTelefono(telefono);
        sec.setEmail(email);
        sec.setFecha_nacimiento(StringToDate(fecha_nacimiento));
        sec.setCiudad(ciudad);
        sec.setProvincia(provincia);

        controlPersis.editarSecre(sec);
    }

//+---------+
// | DOCTOR |
//+---------+
    public List<Doctor> getListaDoctores() {
        return controlPersis.getDoctores();
    }

    public String getNombreDoctorFK(Doctor doc) {
        return controlPersis.getNombreDoctor(doc);
    }

    public Doctor getDoctorById(String id_doctor) {
        Doctor doc = controlPersis.getDoctorById(parseInt(id_doctor));
        System.out.print(doc);
        return doc;
    }

    public void crearDoctor(String dni, String nombre, String apellido, String sexo, String direccion, String telefono, String email, String fecha_nacimiento, String ciudad, String provincia, String especialidad) {
        Doctor doc = new Doctor();

        doc.setDni(dni);
        doc.setNombre(nombre);
        doc.setApellido(apellido);
        doc.setSexo(sexo);
        doc.setDireccion(direccion);
        doc.setTelefono(telefono);
        doc.setEmail(email);
        doc.setFecha_nacimiento(StringToDate(fecha_nacimiento));
        doc.setCiudad(ciudad);
        doc.setProvincia(provincia);
        doc.setEspecialidad(especialidad);
        // !! A arreglar, referenciar relaciones
        doc.setUsuario(doc.getUsuario());
        doc.setListaHorarios(doc.getListaHorarios());
        doc.setListaTurnos(doc.getListaTurnos());

        // Llamo a ControladoraPersistencia y envio objeto
        controlPersis.crearDoctor(doc);

    }

    public void editarDoctor(String id_doctor, String dni, String sexo, String nombre, String apellido, String direccion, String telefono, String email, String fecha_nacimiento, String ciudad, String provincia, String especialidad) {

        Doctor doc = controlPersis.getDoctorById(parseInt(id_doctor));

        doc.setDni(dni);
        doc.setSexo(sexo);
        doc.setNombre(nombre);
        doc.setApellido(apellido);
        doc.setDireccion(direccion);
        doc.setTelefono(telefono);
        doc.setEmail(email);
        doc.setFecha_nacimiento(StringToDate(fecha_nacimiento));
        doc.setCiudad(ciudad);
        doc.setProvincia(provincia);
        doc.setEspecialidad(especialidad);
        /*
        doc.setUsuario(doc.getUsuario());
        doc.setListaHorarios(doc.getListaHorarios());
        doc.setListaTurnos(doc.getListaTurnos());*/

        controlPersis.editarDoctor(doc);
    }

    public void borrarDoctor(String id_doctor) {
        controlPersis.borrarDoctor(Integer.parseInt(id_doctor));
    }

//+-----------+
// | PACIENTE |
//+-----------+
    public List<Paciente> getListaPacientes() {
        return controlPersis.getPacientes();
    }

    public Paciente getPacienteById(String id_paciente) {
        Paciente pac = controlPersis.getPacienteById(parseInt(id_paciente));
        System.out.print(pac);
        return pac;
    }

    public void crearPaciente(String dni, String nombre, String apellido, String sexo, String direccion, String telefono, String email, String fecha_nacimiento, String ciudad, String provincia, String fecha_registro, String poseeCobertura, String estado) {

        Paciente pac = new Paciente();

        pac.setDni(dni);
        pac.setNombre(nombre);
        pac.setApellido(apellido);
        pac.setSexo(sexo);
        pac.setDireccion(direccion);
        pac.setTelefono(telefono);
        pac.setEmail(email);
        pac.setFecha_nacimiento(StringToDate(fecha_nacimiento));
        pac.setCiudad(ciudad);
        pac.setProvincia(provincia);
        // FIX - poner fecha actual
        pac.setFecha_registro(StringToDate(fecha_registro));
        pac.setPoseeCobertura(parseBoolean(poseeCobertura));
        pac.setEstado(estado);
        // FIX - referenciar relaciones
        pac.setCobertura(pac.getCobertura());
        pac.setResponsable(pac.getResponsable());
        pac.setListaTurnos(pac.getListaTurnos());

        // Llamo a ControladoraPersistencia y envio objeto
        controlPersis.crearPaciente(pac);
    }

    public void editarPaciente(String id_paciente, String dni, String nombre, String apellido, String sexo, String direccion, String telefono, String email, String fecha_nacimiento, String ciudad, String provincia, String fecha_registro, String poseeCobertura, String estado) {

        Paciente pac = controlPersis.getPacienteById(parseInt(id_paciente));

        pac.setDni(dni);
        pac.setNombre(nombre);
        pac.setApellido(apellido);
        pac.setSexo(sexo);
        pac.setDireccion(direccion);
        pac.setTelefono(telefono);
        pac.setEmail(email);
        pac.setFecha_nacimiento(StringToDate(fecha_nacimiento));
        pac.setCiudad(ciudad);
        pac.setProvincia(provincia);
        // FIX - poner fecha actual
        pac.setFecha_registro(StringToDate(fecha_registro));
        pac.setPoseeCobertura(parseBoolean(poseeCobertura));
        pac.setEstado(estado);
        // FIX - referenciar relaciones
        /*pac.setCobertura(pac.getCobertura());
        pac.setResponsable(pac.getResponsable());
        pac.setListaTurnos(pac.getListaTurnos());*/

        // Llamo a ControladoraPersistencia y envio objeto
        controlPersis.editarPaciente(pac);
    }

    public void borrarPaciente(String id_paciente) {
        controlPersis.borrarPaciente(Integer.parseInt(id_paciente));
    }

}
