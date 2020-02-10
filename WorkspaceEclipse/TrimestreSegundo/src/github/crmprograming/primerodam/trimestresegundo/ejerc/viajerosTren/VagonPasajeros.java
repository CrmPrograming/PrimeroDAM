package github.crmprograming.primerodam.trimestresegundo.ejerc.viajerosTren;

public class VagonPasajeros {
	
	private final static int CAPACIDAD_POR_DEFECTO = 30;
	
	private Pasajero[] asientos;
	
	public VagonPasajeros() {
		this(CAPACIDAD_POR_DEFECTO);
	}
	
	public VagonPasajeros(int capacidad) {
		asientos = new Pasajero[capacidad];
	}
	
	public void subir(Pasajero pasajero) {
		int i = 0;
		
		while (i < asientos.length && asientos[i] != null)
			i++;
		
		if (i < asientos.length)
			asientos[i] = pasajero;
		else
			throw new RuntimeException("ERROR: No queda espacio libre en el vagón.");		
	}
	
	public Pasajero bajar(String nombre) {
		Pasajero pVagon = null;
		int i = 0;
		
		while (i < asientos.length && !nombre.equals(asientos[i].getNombre()))
			i++;
		
		if (i < asientos.length) {
			pVagon = asientos[i];
			asientos[i] = null;
		}
			
		return pVagon;
	}

}
