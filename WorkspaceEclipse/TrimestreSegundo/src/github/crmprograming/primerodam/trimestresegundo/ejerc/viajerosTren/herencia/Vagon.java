package github.crmprograming.primerodam.trimestresegundo.ejerc.viajerosTren.herencia;

public class Vagon {

	private final static int CAPACIDAD_POR_DEFECTO = 30;
	
	private Persona[] asientos;
	
	public Vagon() {
		this(CAPACIDAD_POR_DEFECTO);
	}
	
	public Vagon(int capacidad) {
		asientos = new Persona[capacidad];
	}
	
	public void subir(Persona pasajero) {
		int i = 0;
		
		while (i < asientos.length && asientos[i] != null)
			i++;
		
		if (i < asientos.length)
			asientos[i] = pasajero;
		else
			throw new RuntimeException("ERROR: No queda espacio libre en el vagón.");
	}
	
	public Persona bajar(String nombre) {
		Persona pVagon = null;
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
