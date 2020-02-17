package github.crmprograming.primerodam.trimestresegundo.ejerc.figuras;

/**
 * Clase gestora de triángulos. Se caracteriza por:
 * - Estar formado por su base y su altura.
 * - Capaz de calcular su área: base * altura / 2. 
 * 
 * @author César Ravelo Martínez
 *
 */
public class Triangulo extends Figura {

	/**
	 * Long con la medida de la base del triángulo.
	 */
	private long base;
	
	/**
	 * Long con la medida de la altura del triángulo.
	 */
	private long altura;
	
	/**
	 * Constructor de la clase. Inicializa el triángulo
	 * en base a los valores indicados como parámetro.
	 * Delega la inicialización del punto de coordenadas
	 * a la clase padre Figura.
	 * 
	 * @param _x Long con la coordenada X de la figura
	 * @param _y Long con la coordenada Y de la figura
	 * @param _base Long con la medida de la base del triángulo
	 * @param _altura Long con la medida de la altura del triángulo
	 */
	public Triangulo(long _x, long _y, long _base, long _altura) {
		super(_x, _y);
		
		if (_base < 0 || _altura < 0)
			throw new IllegalArgumentException("ERROR: No se puede crear un triángulo de medidas negativas");
		
		base = _base;
		altura = _altura;
	}
	
	/**
	 * Sobreescritura del método area heredado de la clase Figura.
	 * 
	 * @return Long con el área correspondiente de la figura
	 */
	@Override
	public long area() {
		return getBase() * getAltura() / 2l;
	}

	/**
	 * Método getter de la base del triángulo.
	 * 
	 * @return Long con la medida de la base del triángulo.
	 */
	public long getBase() {
		return base;
	}

	/**
	 * Método getter de la altura del triángulo.
	 * 
	 * @return Long con la medida de la altura del triángulo.
	 */
	public long getAltura() {
		return altura;
	}

}
