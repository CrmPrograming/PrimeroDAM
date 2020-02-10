package github.crmprograming.primerodam.trimestresegundo.ejerc.viajerosTren;

public class Tranvia {

	private VagonPasajeros[] vagones;
	private final static int CANTIDAD_VAGONES_DEFECTO = 4;
	
	public Tranvia() {
		this(CANTIDAD_VAGONES_DEFECTO);	
	}
	
	public Tranvia(int numVagones) {
		int i;
		
		vagones = new VagonPasajeros[numVagones];
		
		for (i = 0; i < vagones.length; i++)
			vagones[i] = new VagonPasajeros();		
	}
	
	public Pasajero bajar(String nombre, int vagon) {	
		return vagones[vagon - 1].bajar(nombre);
	}
	
	public int subir(Pasajero p, int vagon) {
		int i = vagon - 1;
		boolean ubicado = false;
		
		if (i < 0 || i >= vagones.length)
			throw new RuntimeException("ERROR: El vagón solicitado no existe.");
		
		do {
			try {
				vagones[i % vagones.length].subir(p);
				ubicado = true;
			} catch(Exception e) {
				i++;
			}			
		} while (!ubicado && i % vagones.length != vagon - 1);
		
		if (!ubicado)
			throw new RuntimeException("ERROR: No quedan vagones libres para ubicar al pasajero.");
		
		return i % vagones.length;
	}
	
}
