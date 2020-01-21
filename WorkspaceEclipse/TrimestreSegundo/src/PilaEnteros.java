
/**
 * Clase gestora de una estructura pila para datos de tipo entero
 * @author Alumno
 */
public class PilaEnteros {
	
	/**
	 * Tabla de enteros con los datos a almacenar.
	 * Su tamaño viene dado en el constructor de la clase.
	 */
	private int[] datos;
	
	/**
	 * Entero con la posición del último almacenado en la pila.
	 * En caso de estar vacía, su valor será -1.
	 */
	private int cima;
	
	/**
	 * Constructor de la clase. Inicializa la capacidad máxima de la pila
	 * según el parámetro indicado, creando en el proceso una pila vacía.
	 * 
	 * @param tam Entero con el tamaño máximo de la pila
	 */
	public PilaEnteros(int tam) {
		// Controlamos que no se intente crear una pila de manera incorrecta 
		if (tam < 0)
			throw new IllegalArgumentException("ERROR. Se esperaba una dimensión inicial positiva de la pila");
		
		datos = new int[tam];
		cima = -1;
	}
	
	/**
	 * Método encargado de comprobar si la pila se encuentra vacía.
	 * 
	 * @return Booleano con el estado de la pila
	 */
	public boolean vacia() {
		return cima < 0;
	}
	
	/**
	 * Método encargado de comprobar si la pila se encuentra llena.
	 * 
	 * @return Booleano con el estado de la pila
	 */
	public boolean llena() {
		return cima == (datos.length - 1);
	}
	
	/**
	 * Método encargado de insertar un valor al final de la pila.
	 * Si la pila se encuentra llena, lanzará una IllegalStateException.
	 * 
	 * @param x Entero con el valor a almacenar
	 */
	public void apilar(int x) {
		if (llena())
			throw new IllegalStateException("ERROR. Pila llena, imposible insertar más datos");	
		
		datos[++cima] = x;
	}
	
	/**
	 * Método encargado de sacar el último valor insertado en la pila.
	 * Si la pila se encuentra vacía, lanzará una IllegalStateException. 
	 */
	public int desapilar() {
		if (vacia())
			throw new IllegalStateException("ERROR. Pila vacía, no hay valores que extraer");
		
		return datos[cima--];
	}
	
	/**
	 * Sobrecarga del método toString encargado de mostrar el estado del objeto con el
	 * siguiente formato:
	 * 
	 * Cima: %d, Pila: [x, x, x, ..., x]
	 */
	@Override
	public String toString() {
		String msg = "[";
		int i;
		
		if (datos.length > 0) {				
			for (i = 0; i < datos.length - 1; i++)
				msg += datos[i] + " ";
			
			msg += datos[i];
		}
		
		return String.format("Cima: %d, Pila: %s", cima, msg + "]");
	}
	

}
