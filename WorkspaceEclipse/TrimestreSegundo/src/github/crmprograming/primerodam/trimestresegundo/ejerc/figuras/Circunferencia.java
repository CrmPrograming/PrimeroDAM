package github.crmprograming.primerodam.trimestresegundo.ejerc.figuras;

/**
 * Clase gestora de circunferencias. Se caracteriza por:
 * - Estar formada por un radio
 * 
 * @author César Ravelo Martínez
 *
 */
public class Circunferencia extends Elipse {	

	/**
	 * Constructor de la clase. Inicializa la circunferencia
	 * en base a los valores indicados como parámetro.
	 * Delega la inicialización del punto de coordenadas
	 * a la clase padre Elipse.
	 * 
	 * @param _x Long con la coordenada X de la figura
	 * @param _y Long con la coordenada Y de la figura
	 * @param _radio Long con el radio de la circunferencia 
	 */
	public Circunferencia(long _x, long _y, long _radio) {
		super(_x, _y, _radio, _radio);
	}

	/**
	 * Método getter del radio de la circunferencia.
	 * 
	 * @return Long con el radio de la circunferencia
	 */
	public long getRadio() {
		return getRadioMayor();
	}

}
