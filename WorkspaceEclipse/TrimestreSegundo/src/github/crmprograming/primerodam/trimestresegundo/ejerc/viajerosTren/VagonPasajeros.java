package github.crmprograming.primerodam.trimestresegundo.ejerc.viajerosTren;

/**
 * Clase gestora de un vagón de pasajeros, junto
 * con sus métodos asociados al movimiento de pasajeros. 
 * 
 * @author César Ravelo Martínez
 *
 */
public class VagonPasajeros {
	
	/**
	 * Constante estática entera para indicar una capacidad por defecto en los vagones.
	 */
	private final static int CAPACIDAD_POR_DEFECTO = 30;
	
	/**
	 * Tabla de Pasajero con los pasajeros ubicados en el vagón.
	 */
	private Pasajero[] asientos;
	
	/**
	 * Constructor por defecto de la clase. Inicializa la capacidad
	 * del vagón a CAPACIDAD_POR_DEFECTO.
	 */
	public VagonPasajeros() {
		this(CAPACIDAD_POR_DEFECTO);
	}
	
	/**
	 * Constructor de la clase inicializador de la capacidad del vagón
	 * al parámetro indicado. Debe ser un valor positivo.
	 * 
	 * @param capacidad Entero con la capacidad a asignarle al vagón
	 */
	public VagonPasajeros(int capacidad) {
		asientos = new Pasajero[capacidad];
	}
	
	/**
	 * Método encargado de almacenar un pasajero en el vagón.
	 * - Sólo insertará un pasajero si hay espacio para él.
	 * - En caso de no haber espacio, lanzará RuntimeException
	 * - Los pasajeros se insertan de manera consecutiva en el primer
	 * hueco que encuentre
	 * 
	 * @param pasajero Instancia de Pasajero a almacenar
	 */
	public void subir(Pasajero pasajero) {
		int i = 0;
		
		while (i < asientos.length && asientos[i] != null)
			i++;
		
		if (i < asientos.length)
			asientos[i] = pasajero;
		else
			throw new RuntimeException("ERROR: No queda espacio libre en el vagón.");		
	}
	
	/**
	 * Método encargado de retirar y obtener un pasajero del vagón.
	 * Se realiza la búsqueda del pasajero por su nombre:
	 * - Si se encontró, se extrae el pasajero de la tabla asientos
	 * - En caso de no encontrarlo, retornará null.
	 * 
	 * @param nombre String con el nombre del pasajero a buscar
	 * @return Instancia de Pasajero con el pasajero extraído
	 */
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
