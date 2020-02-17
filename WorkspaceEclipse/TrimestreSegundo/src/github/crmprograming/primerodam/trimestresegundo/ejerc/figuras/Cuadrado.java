package github.crmprograming.primerodam.trimestresegundo.ejerc.figuras;

/**
 * Clase gestora de cuadrados. Se caracteriza por:
 * - Estar formada por cuatro lados iguales.
 * 
 * @author César Ravelo Martínez
 *
 */
public class Cuadrado extends Rectangulo {

	/**
	 * Constructor de la clase. Inicializa el rectángulo
	 * en base a los valores indicados como parámetro.
	 * Delega la inicialización del punto de coordenadas
	 * a la clase padre Figura.
	 * 
	 * @param _x Long con la coordenada X de la figura
	 * @param _y Long con la coordenada Y de la figura
	 * @param _l Long con la medida de cada lado del cuadrado 
	 */
	public Cuadrado(long _x, long _y, long _l) {
		super(_x, _y, _l, _l);		
	}
	
	/**
	 * Método getter de la medida del lado del cuadrado.
	 * 
	 * @return Long con la medida del lado del cuadrado.
	 */
	public long getLado() {
		return getL1();
	}

}
