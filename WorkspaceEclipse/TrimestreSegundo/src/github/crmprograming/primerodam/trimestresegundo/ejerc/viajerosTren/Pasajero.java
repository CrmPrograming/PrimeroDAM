package github.crmprograming.primerodam.trimestresegundo.ejerc.viajerosTren;

import java.util.ArrayList;

/**
 * Clase gestora de una entidad Pasajero.
 * No se podrá crear un pasajero cuyo nombre
 * ya exista para otro.
 * 
 * @author César Ravelo Martínez
 *
 */
public class Pasajero {
	
	/**
	 * ArrayList<String> con el listado de pasajeros creados.
	 */
	private static ArrayList<String> pasajerosExistentes;
	
	/**
	 * String con el nombre asociado al pasajero.
	 */
	private String nombre;
	
	/**
	 * Inicialización estática del listado de pasajeros.
	 */
	static {
		pasajerosExistentes = new ArrayList<String>();
	}
	
	/**
	 * Constructor de la clase. Inicializa el objeto
	 * asignándole el nombre al pasajero.
	 * 
	 * @param nombre String con el nombre a asignarle al pasajero
	 */
	public Pasajero(String nombre) {
		if (pasajerosExistentes.contains(nombre))
			throw new IllegalStateException("ERROR: Ya existe un pasajero con el nombre " + nombre);
		
		this.nombre = nombre;
		pasajerosExistentes.add(nombre);
	}
	
	/**
	 * Método getter del atributo nombre.
	 * 
	 * @return String con el nombre del pasajero
	 */
	public String getNombre() {
		return nombre;
	}
	
}
