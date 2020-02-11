package github.crmprograming.primerodam.trimestresegundo.ejerc.viajerosTren.herencia;

import java.util.ArrayList;

public class Persona {
	
	private static ArrayList<String> pasajerosExistentes;
	
	private String nombre;
	
	static {
		pasajerosExistentes = new ArrayList<String>();
	}
	
	public Persona(String nombre) {
		if (pasajerosExistentes.contains(nombre))
			throw new IllegalStateException("ERROR: Ya existe un pasajero con el nombre " + nombre);
		
		this.nombre = nombre;
		pasajerosExistentes.add(nombre);
	}
	
	public String getNombre() {
		return nombre;
	}

}
