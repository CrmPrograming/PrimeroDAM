package github.crmprograming.primerodam.trimestresegundo.ejer.solitario;

/**
 * Clase gestora de un montón de cartas del mismo palo apiladas
 * desde el 1 hasta el 10.
 * 
 * @author César Ravelo Martínez
 *
 */
public class MontonPalo {
	
	/**
	 * Constante entera con el tamaño máximo de cartas que pueden
	 * haber en un montón.
	 */
	private static final int MAX_CARTAS = 10;
	
	/**
	 * Tabla de instancias de la clase Carta con las cartas almacenadas.
	 */
	private Carta[] cartas;
	
	/**
	 * Entero con la cantidad de cartas almacenadas en el montón.
	 */
	private int cont;
	
	/**
	 * Constructor de la clase, inicializa la tabla cartas y el
	 * contador cont.
	 */
	public MontonPalo() {
		cartas = new Carta[MAX_CARTAS];
		cont = 0;
	}
	
	/**
	 * Método encargado de insertar una nueva carta al final
	 * del montón. Para ello se debe cumplir:
	 * 
	 * - El montón no debe estar lleno
	 * - Si no hay ninguna carta, la carta a insertar debe ser un uno
	 * - Si hay alguna carta, se insertará si es el siguiente número del mismo palo
	 * 
	 * Indicará al finalizar si se pudo o no insertar dicha carta.
	 * 
	 * @param c Instancia de la clase Carta a intentar insertar
	 * @return Booleano con el resultado de haber podido o no insertar la carta
	 */
	public boolean ponerCarta(Carta c) {
		boolean result = true;
		
		if (estaLleno() // Queda espacio para poner más cartas
			&& ((cont == 0 && c.getNumero() == 1) // Si no hay cartas, aseguramos que c sea un uno
				|| (cont > 0 && (cartas[cont - 1].getPalo().equals(c.getPalo())
					&& cartas[cont - 1].getNumero() == c.getNumero() - 1)))) // Si hay cartas, aseguramos que sea mismo palo y la siguiente
			cartas[cont++] = c;
		else
			result = false;
		
		return result;
	}
	
	/**
	 * Método encargado de indicar si el montón está lleno o no.
	 * 
	 * @return Booleano con el estado del montón
	 */
	public boolean estaLleno() {
		return (cont < MAX_CARTAS);
	}

}
