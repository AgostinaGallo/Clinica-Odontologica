package Logica;

import Logica.HorarioAtencion;
import Logica.Turno;
import Logica.Usuario;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2020-10-13T18:21:26")
@StaticMetamodel(Doctor.class)
public class Doctor_ extends Persona_ {

    public static volatile SingularAttribute<Doctor, Integer> id_doctor;
    public static volatile ListAttribute<Doctor, HorarioAtencion> listaHorarios;
    public static volatile SingularAttribute<Doctor, Usuario> usuario;
    public static volatile SingularAttribute<Doctor, String> especialidad;
    public static volatile ListAttribute<Doctor, Turno> listaTurnos;

}