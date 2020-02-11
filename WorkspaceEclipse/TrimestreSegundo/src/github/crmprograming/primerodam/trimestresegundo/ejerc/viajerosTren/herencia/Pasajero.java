package github.crmprograming.primerodam.trimestresegundo.ejerc.viajerosTren.herencia;

/**
 * Clase gestora de un pasajero.
 * Hereda de la clase Persona su comportamiento.
 * 
 * Se entiende por Pasajero como una Persona sin
 * un rol aparente.
 * 
 * @author César Ravelo Martínez
 */
public class Pasajero extends Persona {

	/**
	 * Constructor de la clase. Inicializa el objeto
	 * asignándole el nombre a la persona.
	 * 
	 * @param nombre String con el nombre a asignarle al pasajero
	 */
	public Pasajero(String nombre) {
		super(nombre);
	}

}
