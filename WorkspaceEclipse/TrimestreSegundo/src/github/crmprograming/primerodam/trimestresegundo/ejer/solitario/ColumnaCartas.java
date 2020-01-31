package github.crmprograming.primerodam.trimestresegundo.ejer.solitario;

/**
 * Clase gestora de una columna de cartas. Las cartas almacenadas
 * en ella van de mayor a menor, sin repetir palo entre dos cartas consecutivas
 * y con una capacidad máxima.
 * 
 * @author César Ravelo Martínez
 *
 */
public class ColumnaCartas {
	
	/**
	 * Constante entera con el tamaño máximo de cartas que pueden
	 * haber en un montón.
	 */
	private static final int MAX_CARTAS = 10;
	
	/**
	 * Tabla de instancias de la clase Carta, controla las cartas
	 * almacenadas en el objeto.
	 */
	private Carta[] cartas = new Carta[MAX_CARTAS]; // [1, 10]
	
	/**
	 * Entero con la cantidad de cartas contenidas en la columna.
	 */
	private int cont = 0;
	
	/**
	 * Método encargado de almacenar una carta en la columna.
	 * Se respetará si la carta a insertar es menor a la última almacenada
	 * y de distinto palo, además de comprobar si la cola está llena o no.
	 * Indicará si se pudo o no insertar dicha carta.
	 * 
	 * @param c Instancia de la clase Carta a intentar almacenar
	 * @return Booleano indicativo de si se pudo o no almacenar la carta
	 */
	public boolean ponerCarta(Carta c) {
		boolean result = !estaLleno();
		
		// Mientras se tenga espacio y se pueda colocar la carta, se inserta
		if (result &&
				(estaVacia() || 
				 (cartas[cont - 1].getNumero() == c.getNumero() + 1 && !cartas[cont - 1].getPalo().equals(c.getPalo()))))
			cartas[cont++] = c;
		else
			result = false;
		
		return result;
	}
	
	/**
	 * Método encargado de indicar si la columna está llena o no.
	 * 
	 * @return Booleano con el estado de la columna
	 */
	private boolean estaLleno() {
		return (cont >= MAX_CARTAS);
	}
	
	/**
	 * Método encargado de indicar si la columna está vacía por completo o no.
	 * 
	 * @return Booleano con el estado de la columna
	 */
	private boolean estaVacia() {
		return (cont == 0);
	}
	
	/**
	 * Sobrecarga del método toString() de la clase para mostrar el estado
	 * del objeto con el siguiente formato:
	 * 
	 * Columna: <última carta introducida>
	 */
	@Override
	public String toString() {
		return String.format("Columna: %s", (estaVacia())? "No hay cartas en ella" : cartas[cont - 1]);
	}

}
