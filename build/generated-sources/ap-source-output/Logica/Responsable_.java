package Logica;

import Logica.Paciente;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2020-10-13T18:21:26")
@StaticMetamodel(Responsable.class)
public class Responsable_ extends Persona_ {

    public static volatile SingularAttribute<Responsable, String> relacion;
    public static volatile SingularAttribute<Responsable, Paciente> paciente;
    public static volatile SingularAttribute<Responsable, Integer> id_responsable;

}