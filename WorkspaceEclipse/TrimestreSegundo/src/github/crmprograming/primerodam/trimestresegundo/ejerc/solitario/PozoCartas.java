package github.crmprograming.primerodam.trimestresegundo.ejerc.solitario;

import java.util.ArrayList;
import java.util.Arrays;

/**
 * Clase gestora de un pozo de cartas. En él, se almacenarán instancias
 * de la clase Carta sin tener en cuenta ni su número ni su palo.
 * 
 * @author César Ravelo Martínez
 *
 */
public class PozoCartas {

	/**
	 * Constante entera con el tamaño máximo de cartas que pueden
	 * haber en el pozo.
	 */
	private static final int MAX_CARTAS = 40;
	
	/**
	 * Tabla de instancias de la clase Carta con las cartas almacenadas.
	 */
	private Carta[] cartas = new Carta[MAX_CARTAS];
	
	/**
	 * Entero con la cantidad de cartas almacenadas en la familia de cartas.
	 */
	private int cont = 0;
	
	/**
	 * Método encargado de insertar una carta dada al final del pozo.
	 *  
	 * @param c Instancia de la clase Carta a almacenar
	 */
	public void ponerCarta(Carta c) {
		cartas[cont++] = c;
	}
	
	/**
	 * Método encargado de sacar la última carta almacenada. En caso de
	 * no haber ninguna, retorna null.
	 * 
	 * @return Instancia de la clase Carta o null
	 */
	public Carta sacarCarta() {
		Carta sacada = null;
		
		if (!estaVacia())
			sacada = cartas[--cont];
		
		return sacada;
	}
	
	/**
	 * Método encargado de vaciar el pozo indicando que no quedan
	 * cartas almacenadas en él.
	 */
	public void vaciarPozo() {
		cont = 0;
	}
	
	/**
	 * Método encargado de generar un ArrayList<Carta> con las cartas
	 * almacenadas en el momento de su invocación.
	 * 
	 * @return ArrayList<Carta> listado de cartas contenidas
	 */
	public ArrayList<Carta> listaCartas() {
		return new ArrayList<Carta>(Arrays.asList(cartas).subList(0, cont));
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
	public Carta getCarta() {	
		return (estaVacia())? null : cartas[cont - 1];
	}
	
	/**
	 * Sobrecarga del método toString() de la clase Object a fin de mostrar
	 * las instancias de esta clase con el formato:
	 * 
	 * Pozo: <cantidad de cartas almacenadas>
	 */
	@Override
	public String toString() {
		return String.format("Pozo: %s", (estaVacia())? "No hay cartas en el pozo" : "" + cont);
	}
	
}
