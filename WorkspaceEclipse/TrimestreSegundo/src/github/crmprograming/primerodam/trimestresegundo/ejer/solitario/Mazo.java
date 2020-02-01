package github.crmprograming.primerodam.trimestresegundo.ejer.solitario;

import java.util.ArrayList;

/**
 * Clase gestora del comportamiento de un mazo de 40 cartas para el juego Solitario.
 * @author César Ravelo Martínez
 *
 */
public class Mazo {
	
	/**
	 * Constante entera con el tamaño máximo de cartas que tendrá el mazo.
	 */
	public static final int MAX_CARTAS = 40;
	
	/**
	 * Tabla de objetos de la clase Carta con las cartas almacenadas en el mazo.
	 */
	private Carta[] CARTAS;
	
	/**
	 * Entero con la posición de la última carta existente en el mazo.
	 */
	private int cont;
	
	/**
	 * Constructor de la clase Mazo el cual inicializará sus valores con
	 * todas las cartas existentes de cada palo hasta tener el mazo lleno.
	 */
	public Mazo() {		
		int i, j;
		String[] palos = {Carta.PALO_BASTOS, Carta.PALO_COPAS, Carta.PALO_ESPADAS, Carta.PALO_OROS};
		CARTAS = new Carta[MAX_CARTAS];
		
		for (i = 0; i < palos.length; i++) {
			for (j = 1; j < 8; j++)
				CARTAS[cont++] = new Carta(j, palos[i]);
			for (j = 10; j <= 12; j++)
				CARTAS[cont++] = new Carta(j, palos[i]);
		}
		cont--;
	}
	
	/**
	 * Método encargado de extraer una carta al azar del mazo.
	 * Si el mazo está vacío, devolverá null.
	 * 
	 * @return Instancia de Carta sacada al azar o null 
	 */
	public Carta sacarCarta() {
		Carta sacada = null;
		int pos = -1;
		
		if (!estaVacia()) {
			pos = (int) (Math.random() * (cont + 1));
			sacada = CARTAS[pos];
			CARTAS[pos] = CARTAS[cont--];
		}		
		
		return sacada;
	}
	
	public void barajar(ArrayList<Carta> listado) {
		for (cont = 0; cont < listado.size(); cont++)
			CARTAS[cont] = listado.get(cont);
		cont--;
	}
	
	/**
	 * Método encargado de indicar si el mazo está vacío.
	 * 
	 * @return Booleano con el estado del mazo
	 */
	public boolean estaVacia() {
		return (cont < 0);
	}
	
	/**
	 * Sobrecarga del método toString() de la clase para mostrar el estado
	 * del objeto con el siguiente formato:
	 * 
	 * Mazo: <cantidad de cartas en el mazo>
	 */
	@Override
	public String toString() {
		return String.format("Mazo: %s", (estaVacia())? "No hay cartas en el mazo" : "" + (cont + 1));
	}

}
