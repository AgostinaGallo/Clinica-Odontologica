package Logica;

import Logica.Doctor;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2020-10-13T18:21:26")
@StaticMetamodel(HorarioAtencion.class)
public class HorarioAtencion_ { 

    public static volatile SingularAttribute<HorarioAtencion, Doctor> doctor;
    public static volatile SingularAttribute<HorarioAtencion, Date> hora_hasta;
    public static volatile SingularAttribute<HorarioAtencion, Date> hora_desde;
    public static volatile SingularAttribute<HorarioAtencion, String> dia;
    public static volatile SingularAttribute<HorarioAtencion, Integer> id_horario;

}