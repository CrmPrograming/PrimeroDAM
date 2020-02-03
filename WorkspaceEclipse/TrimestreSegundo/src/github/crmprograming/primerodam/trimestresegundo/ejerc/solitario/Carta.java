package github.crmprograming.primerodam.trimestresegundo.ejerc.solitario;

/**
 * Clase gestora del comportamiento de una carta de solitario.
 * 
 * @author César Ravelo Martínez
 *
 */
public class Carta {
	
	/**
	 * Entero privado con el número asociado a la carta.
	 * Valores válidos en el rango [1, 10].
	 */
	private int numero;
	
	/**
	 * String privado con el palo asociado a la carta.
	 * Valores válidos: Bastos, Copas, Espadas, Oros.
	 */
	private String palo;
	
	/**
	 * String constante con la cadena asociada al palo Bastos.
	 */
	public static final String PALO_BASTOS = "Bastos";
	
	/**
	 * String constante con la cadena asociada al palo Copas.
	 */
	public static final String PALO_COPAS = "Copas";
	
	/**
	 * String constante con la cadena asociada al palo Espadas.
	 */
	public static final String PALO_ESPADAS = "Espadas";
	
	/**
	 * String constante con la cadena asociada al palo Oros.
	 */
	public static final String PALO_OROS = "Oros";
	
	/**
	 * Constructor de la clase, tomando como valores iniciales el
	 * número de la carta y el palo correspondiente.
	 * 
	 * El número debe estar en los rangos [1, 7] o [10, 12].
	 * Internamente el número se guardará en el rango [1, 10].
	 * 
	 * Si el número de la carta o el palo no es válido, lanzará una IllegalArgumentException.
	 * 
	 * @param n Entero con el número de la carta
	 * @param p String con el palo de la carta
	 */
	public Carta(int n, String p) {
		if (n < 1 || n > 12 || n == 8 || n == 9 )
			throw new IllegalArgumentException("ERROR: Esperado un número válido de carta.");
		if (!p.equals(PALO_BASTOS) && !p.equals(PALO_COPAS) && !p.equals(PALO_ESPADAS) && !p.equals(PALO_OROS) )
			throw new IllegalArgumentException("ERROR: Esperado un palo de carta válido.");
		
		numero = n;
		// Si la carta dada es 10, 11 o 12, lo ajustamos al rango [1, 10]
		if (n >= 10)
			numero = numero - 2;
		
		palo = p;
	}
	
	/**
	 * Método getter del atributo numero.
	 * 
	 * @return Entero con el número asociado a la carta en formato [1, 10].
	 */
	public int getNumero() {
		return numero;
	}
	
	/**
	 * Método getter del atributo palo.
	 * 
	 * @return String con el palo asociado a la carta.
	 */
	public String getPalo() {
		return palo;
	}
	
	/**
	 * Sobrecarga del método toString() para mostrar el objeto con el formato:
	 * 
	 * "número-palo". Comillas incluídas.
	 */
	@Override
	public String toString() {
		return String.format("\"%d-%s\"", (numero < 8)? numero : numero + 2, palo);
	}		
	
}
