package github.crmprograming.primerodam.trimestresegundo.ejerc.viajerosTren.herencia;

/**
 * Clase gestora de un vagón genérico, junto
 * con sus métodos asociados al movimiento de pasajeros. 
 * 
 * @author César Ravelo Martínez
 */
public class Vagon {

	/**
	 * Constante estática entera para indicar una capacidad por defecto en los vagones.
	 */
	private final static int CAPACIDAD_POR_DEFECTO = 30;
	
	/**
	 * Tabla de Persona con las personas ubicadas en el vagón.
	 */
	private Persona[] asientos;
	
	/**
	 * Constructor por defecto de la clase. Inicializa la capacidad
	 * del vagón a CAPACIDAD_POR_DEFECTO.
	 */
	public Vagon() {
		this(CAPACIDAD_POR_DEFECTO);
	}
	
	/**
	 * Constructor de la clase inicializador de la capacidad del vagón
	 * al parámetro indicado. Debe ser un valor positivo.
	 * 
	 * @param capacidad Entero con la capacidad a asignarle al vagón
	 */
	public Vagon(int capacidad) {
		asientos = new Persona[capacidad];
	}
	
	/**
	 * Método encargado de almacenar una persona en el vagón.
	 * - Sólo insertará una persona si hay espacio.
	 * - En caso de no haber espacio, lanzará RuntimeException
	 * - Las personas se insertan de manera consecutiva en el primer
	 * hueco que encuentre
	 * 
	 * @param persona Instancia de Persona a almacenar
	 */
	public void subir(Persona persona) {
		int i = 0;
		
		while (i < asientos.length && asientos[i] != null)
			i++;
		
		if (i < asientos.length)
			asientos[i] = persona;
		else
			throw new RuntimeException("ERROR: No queda espacio libre en el vagón.");
	}
	
	/**
	 * Método encargado de retirar y obtener una persona del vagón.
	 * Se realiza la búsqueda de la persona por su nombre:
	 * - Si se encontró, se extrae la persona de la tabla asientos
	 * - En caso de no encontrarlo, retornará null.
	 * 
	 * @param nombre String con el nombre de la persona a buscar
	 * @return Instancia de Persona con la persona extraída
	 */
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
