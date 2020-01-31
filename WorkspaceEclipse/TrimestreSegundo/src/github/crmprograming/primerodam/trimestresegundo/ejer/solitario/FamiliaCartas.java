package github.crmprograming.primerodam.trimestresegundo.ejer.solitario;

/**
 * Clase gestora de una familia de cartas del mismo palo apiladas
 * desde el 1 hasta el 10.
 * 
 * @author César Ravelo Martínez
 *
 */
public class FamiliaCartas {
	
	/**
	 * Constante entera con el tamaño máximo de cartas que pueden
	 * haber en una familia de cartas.
	 */
	private static final int MAX_CARTAS = 10;
	
	/**
	 * Tabla de instancias de la clase Carta con las cartas almacenadas.
	 */
	private Carta[] cartas;
	
	/**
	 * Entero con la cantidad de cartas almacenadas en la familia de cartas.
	 */
	private int cont;
	
	/**
	 * Constructor de la clase, inicializa la tabla cartas y el
	 * contador cont.
	 */
	public FamiliaCartas() {
		cartas = new Carta[MAX_CARTAS];
		cont = 0;
	}
	
	/**
	 * Método encargado de insertar una nueva carta al final
	 * de la familia de cartas. Para ello se debe cumplir:
	 * 
	 * - La familia no debe estar llena
	 * - Si no hay ninguna carta, la carta a insertar debe ser un uno
	 * - Si hay alguna carta, se insertará si es el siguiente número del mismo palo
	 * 
	 * Indicará al finalizar si se pudo o no insertar dicha carta.
	 * 
	 * @param c Instancia de la clase Carta a intentar insertar
	 * @return Booleano con el resultado de haber podido o no insertar la carta
	 */
	public boolean ponerCarta(Carta c) {
		boolean result = !estaLleno();
		
		if (result // Queda espacio para poner más cartas
			&& ((estaVacia() && c.getNumero() == 1) // Si no hay cartas, aseguramos que c sea un uno
				|| (cont > 0 && (cartas[cont - 1].getPalo().equals(c.getPalo())
					&& cartas[cont - 1].getNumero() == c.getNumero() - 1)))) // Si hay cartas, aseguramos que sea mismo palo y la siguiente
			cartas[cont++] = c;
		else
			result = false;
		
		return result;
	}
	
	/**
	 * Método encargado de indicar si la familia está lleno o no.
	 * 
	 * @return Booleano con el estado de la familia
	 */
	private boolean estaLleno() {
		return (cont >= MAX_CARTAS);
	}
	
	/**
	 * Método encargado de indicar si la familia está vacía por completo o no.
	 * 
	 * @return Booleano con el estado de la familia
	 */
	private boolean estaVacia() {
		return (cont == 0);
	}
	
	/**
	 * Método encargado de dar la última carta almacenada. En caso de
	 * no haber ninguna carta, devuelve null.
	 * 
	 * @return Instancia de la clase Carta o null
	 */
	public final Carta getCarta() {	
		return (estaVacia())? null : cartas[cont - 1];
	}
	
	/**
	 * Sobrecarga del método toString() de la clase para mostrar el estado
	 * del objeto con el siguiente formato:
	 * 
	 * Familia: <última carta introducida>
	 */
	@Override
	public String toString() {
		return String.format("Familia: %s", (estaVacia())? "No hay cartas en ella" : cartas[cont - 1]);
	}

}
