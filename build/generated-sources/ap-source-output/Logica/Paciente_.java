package Logica;

import Logica.Cobertura;
import Logica.Responsable;
import Logica.Turno;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2020-10-13T18:21:26")
@StaticMetamodel(Paciente.class)
public class Paciente_ extends Persona_ {

    public static volatile SingularAttribute<Paciente, Boolean> poseeCobertura;
    public static volatile SingularAttribute<Paciente, Cobertura> cobertura;
    public static volatile SingularAttribute<Paciente, String> estado;
    public static volatile SingularAttribute<Paciente, Responsable> responsable;
    public static volatile SingularAttribute<Paciente, Date> fecha_registro;
    public static volatile SingularAttribute<Paciente, Integer> id_paciente;
    public static volatile ListAttribute<Paciente, Turno> listaTurnos;

}