package github.crmprograming.primerodam.trimestresegundo.ejerc.viajerosTren.herencia;

public class Tranvia {
	
	private final static int CANTIDAD_VAGONES_DEFECTO = 4;
	
	private Vagon[] vagones;
	
	public Tranvia() {
		this(CANTIDAD_VAGONES_DEFECTO);
	}
	
	public Tranvia(int numVagones) {
		int i;
		
		vagones = new Vagon[numVagones + VagonMaquinistas.CANTIDAD_VAGONES_MAQUINISTA];
		
		for (i = 1; i < vagones.length - 1; i++)
			vagones[i] = new VagonPasajeros();
		
		vagones[0] = new VagonMaquinistas();
		vagones[vagones.length - 1] = new VagonMaquinistas();		
	}
	
	public Persona bajar(String nombre, int vagon) {
		return vagones[vagon - 1].bajar(nombre);
	}
	
	public int subir(Persona p, int vagon) {
		int i = vagon - 1;
		boolean ubicado = false;
		
		if (i < 0 || i >= vagones.length)
			throw new RuntimeException("ERROR: El vagón solicitado no existe");
		
		do {
			try {
				vagones[i % vagones.length].subir(p);
				ubicado = true;
			} catch(Exception e) {
				i++;
			}
		} while (!ubicado && i % vagones.length != vagon);
		
		if (!ubicado)
			throw new RuntimeException("ERROR: No quedan vagones libres para ubicar al pasajero.");
		
		return i % vagones.length;
	}

}
