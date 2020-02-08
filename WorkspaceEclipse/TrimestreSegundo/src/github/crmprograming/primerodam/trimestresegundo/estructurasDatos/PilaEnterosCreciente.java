package github.crmprograming.primerodam.trimestresegundo.estructurasDatos;

/**
 * Clase gestora de una PilaEnteros la cual guarda sus elementos
 * de manera creciente.
 * 
 * @author César Ravelo Martínez
 *
 */
public class PilaEnterosCreciente extends PilaEnteros {

	/**
	 * Constructor de la clase. Delega en el constructor
	 * de la clase padre PilaEnteros
	 * 
	 * @param tam Entero con el tamaño máximo de la pila
	 */
	public PilaEnterosCreciente(int tam) {
		super(tam);
	}	
	
	/**
	 * Método encargado de insertar un valor al final de la pila.
	 * Si la pila se encuentra llena o el valor es menor
	 * al último almacenado, lanzará una IllegalStateException.
	 * 
	 * @param x Entero con el valor a almacenar
	 */
	@Override
	public void apilar(int x) {
		if (!vacia() && x < cima())
			throw new IllegalStateException("ERROR. Valor dado superior al último en la pila");
		
		super.apilar(x);
	}

}
