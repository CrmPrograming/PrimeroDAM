package github.crmprograming.primerodam.trimestresegundo.ejerc.viajerosTren.herencia;

import java.util.ArrayList;

/**
 * Clase gestora de una entidad Persona.
 * No se podrá crear una persona cuyo nombre
 * ya exista para otro.
 * 
 * @author César Ravelo Martínez
 */
public class Persona {
	
	/**
	 * ArrayList<String> con el listado de personas creados.
	 */
	private static ArrayList<String> pasajerosExistentes;
	
	/**
	 * String con el nombre asociado a la persona.
	 */
	private String nombre;
	
	/**
	 * Inicialización estática del listado de personas.
	 */
	static {
		pasajerosExistentes = new ArrayList<String>();
	}
	
	/**
	 * Constructor de la clase. Inicializa el objeto
	 * asignándole el nombre a la persona.
	 * 
	 * @param nombre String con el nombre a asignarle a la persona
	 */
	public Persona(String nombre) {
		if (pasajerosExistentes.contains(nombre))
			throw new IllegalStateException("ERROR: Ya existe un pasajero con el nombre " + nombre);
		
		this.nombre = nombre;
		pasajerosExistentes.add(nombre);
	}
	
	/**
	 * Método getter del atributo nombre.
	 * 
	 * @return String con el nombre de la persona
	 */
	public String getNombre() {
		return nombre;
	}

}
