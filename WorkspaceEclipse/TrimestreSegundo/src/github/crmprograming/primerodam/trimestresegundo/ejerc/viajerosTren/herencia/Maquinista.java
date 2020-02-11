package github.crmprograming.primerodam.trimestresegundo.ejerc.viajerosTren.herencia;

/**
 * Clase gestora de un maquinista.
 * Hereda de la clase Persona su comportamiento.
 * 
 * Se entiende por Maquinista como una Persona capaz
 * de pilotar VagonMaquinista.
 * 
 * @author César Ravelo Martínez
 */
public class Maquinista extends Persona {

	/**
	 * Constructor de la clase. Inicializa el objeto
	 * asignándole el nombre a la persona.
	 * 
	 * @param nombre String con el nombre a asignarle al maquinista
	 */
	public Maquinista(String nombre) {
		super(nombre);
	}

}
