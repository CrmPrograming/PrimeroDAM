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
	 * Tabla de instancias de la clase Carta, controla las cartas
	 * almacenadas en el objeto.
	 */
	private Carta[] cartas = new Carta[10]; // [1, 10]
	
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
		boolean result = cont < cartas.length;
		
		// Mientras se tenga espacio y se pueda colocar la carta, se inserta
		if ((result) &&
				((cont == 0) || 
				 (cartas[cont - 1].getNumero() > c.getNumero() && !cartas[cont - 1].getPalo().equals(c.getPalo()))))
			cartas[cont++] = c;
		else
			result = false;
		
		return result;				
	}

}
