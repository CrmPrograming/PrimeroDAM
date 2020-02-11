package github.crmprograming.primerodam.trimestresegundo.ejerc.viajerosTren.herencia;

/**
 * Clase gestora del comportamiento de un tranvía.
 * 
 * Un tranvía consta de:
 * - Dos VagonMaquinistas ubicados a los extremos del Tranvia.
 * - Tantos VagonPasajeros como se le indica al constructor inicializador
 *
 * @author César Ravelo Martínez
 */
public class Tranvia {
	
	/**
	 * Constante estática entera con la cantidad de vagones de pasajeros por defecto.
	 */
	private final static int CANTIDAD_VAGONES_DEFECTO = 4;
	
	/**
	 * Constante estática entera con la cantidad de vagones de maquinista por defecto.
	 */
	private final static int CANTIDAD_VAGONES_MAQUINISTA = 2;
	
	/**
	 * Tabla de Vagon con los vagones contenidos en el tranvía.
	 */
	private Vagon[] vagones;
	
	/**
	 * Constructor por defecto de la clase.
	 * Delega en el constructor inicializador con el valor por defecto
	 * establecido en el atributo CANTIDAD_VAGONES_DEFECTO.
	 */
	public Tranvia() {
		this(CANTIDAD_VAGONES_DEFECTO);
	}
	
	/**
	 * Constructor inicializador de la clase.
	 * 
	 * Crea tantos vagones como la cantidad indicada por parámetro,
	 * además de los dos VagonMaquinistas a los extremos.
	 */
	public Tranvia(int numVagones) {
		int i;
		
		vagones = new Vagon[numVagones + CANTIDAD_VAGONES_MAQUINISTA];
		
		for (i = 1; i < vagones.length - 1; i++)
			vagones[i] = new VagonPasajeros();
		
		vagones[0] = new VagonMaquinistas();
		vagones[vagones.length - 1] = new VagonMaquinistas();
	}
	
	/**
	 * Método encargado de sacar una persona del vagón especificado.
	 * El indicador del vagón irá en el rango [1, n].
	 * 
	 * @param nombre String con el nombre de la persona a retirar
	 * @param vagon Entero con el identificador del vagón a consultar
	 * @return Instancia de Persona con la persona retirada
	 */
	public Persona bajar(String nombre, int vagon) {
		return vagones[vagon - 1].bajar(nombre);
	}
	
	/**
	 * Método encargado de subir una persona al vagón indicado.
	 * El indicador del vagón irá en el rango [1, n].
	 * - Si el vagón no existe, lanzará una RuntimeException
	 * - Si no se pudo ubicar en ese vagón, se intentará colocar en los demás
	 * - Si no se pudo ubicar en ningún vagón, lanzará una RuntimeException
	 * - Si se colocó a la persona, se retornará la posición donde se insertó
	 * 
	 * @param p Instancia de Persona con la persona a guardar
	 * @param vagon Entero con el indicador del vagón a intentar insertar inicialmente
	 * @return Entero con la posición del vagón donde se guardó la persona
	 */
	public int subir(Persona p, int vagon) {
		if (p == null)
			throw new RuntimeException("ERROR: Intento de insertar una persona nula.");
		
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
		} while (!ubicado && i % vagones.length != vagon - 1);
		
		if (!ubicado)
			throw new RuntimeException("ERROR: No quedan vagones libres para ubicar al pasajero.");
		
		return i % vagones.length;
	}

}
