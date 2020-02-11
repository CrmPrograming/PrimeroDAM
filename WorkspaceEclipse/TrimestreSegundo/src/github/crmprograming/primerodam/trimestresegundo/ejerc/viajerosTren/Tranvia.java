package github.crmprograming.primerodam.trimestresegundo.ejerc.viajerosTren;

/**
 * Clase gestora del comportamiento de un tranvía.
 * Un tranvía está compuesto por una serie de vagones
 * cada uno con sus correspondientes pasajeros.
 * 
 * @author César Ravelo Martínez
 *
 */
public class Tranvia {
	
	/**
	 * Constante estática entera con la cantidad de vagones por defecto.
	 */
	private final static int CANTIDAD_VAGONES_DEFECTO = 4;
	
	/**
	 * Tabla de VagonPasajeros con la cantidad de vagones a controlar.
	 */
	private VagonPasajeros[] vagones;
	
	/**
	 * Constructor por defecto de la clase.
	 */
	public Tranvia() {
		this(CANTIDAD_VAGONES_DEFECTO);	
	}
	
	/**
	 * Constructor inicializador de la clase.
	 * Creará tantos vagones como se le especifique.
	 * 
	 * @param numVagones Entero con la cantidad de vagones a crear
	 */
	public Tranvia(int numVagones) {
		int i;
		
		vagones = new VagonPasajeros[numVagones];
		
		for (i = 0; i < vagones.length; i++)
			vagones[i] = new VagonPasajeros();		
	}
	
	/**
	 * Método encargado de sacar un pasajero del vagón especificado.
	 * El indicador del vagón irá en el rango [1, n].
	 * 
	 * @param nombre String con el nombre del pasajero a retirar
	 * @param vagon Entero con el identificador del vagón a consultar
	 * @return Instancia de Pasajero con el pasajero retirado
	 */
	public Pasajero bajar(String nombre, int vagon) {	
		return vagones[vagon - 1].bajar(nombre);
	}
	
	/**
	 * Método encargado de subir un pasajero al vagón indicado.
	 * El indicador del vagón irá en el rango [1, n].
	 * - Si el vagón no existe, lanzará una RuntimeException
	 * - Si no se pudo ubicar en ese vagón, se intentará colocar en los demás
	 * - Si no se pudo ubicar en ningún vagón, lanzará una RuntimeException
	 * - Si se colocó al pasajero, se retornará la posición donde se insertó
	 * 
	 * @param p Instancia de Pasajero con el pasajero a guardar
	 * @param vagon Entero con el indicador del vagón a intentar insertar inicialmente
	 * @return Entero con la posición del vagón donde se guardó el pasajero
	 */
	public int subir(Pasajero p, int vagon) {
		int i = vagon - 1;
		boolean ubicado = false;
		
		// Comprobamos si el vagón existe
		if (i < 0 || i >= vagones.length)
			throw new RuntimeException("ERROR: El vagón solicitado no existe.");
		
		// Mientras queden vagones, buscamos un asiento para el pasajero
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
