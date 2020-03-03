package github.crmprograming.primerodam.trimestresegundo.ejerc.figuras;

/**
 * Clase gestora de rectángulos. Se caracteriza por:
 * - Estar formado por dos pares lados iguales entre si.
 * - Capaz de calcular su área: base * altura. 
 * 
 * @author César Ravelo Martínez
 *
 */
public class Rectangulo extends Figura {
	
	/**
	 * Long con la medida de uno de los lados del rectángulo.
	 */
	private long l1;
	
	/**
	 * Long con la medida del otro lado del rectángulo.
	 */
	private long l2;

	/**
	 * Constructor de la clase. Inicializa el rectángulo
	 * en base a los valores indicados como parámetro.
	 * Delega la inicialización del punto de coordenadas
	 * a la clase padre Figura.
	 * 
	 * @param _x Long con la coordenada X de la figura
	 * @param _y Long con la coordenada Y de la figura
	 * @param _l1 Long con la medida del lado 1 del rectángulo
	 * @param _l2 Long con la medida del lado 2 del rectángulo
	 */
	public Rectangulo(long _x, long _y, long _l1, long _l2) {
		super(_x, _y);
		
		if (_l1 < 0 || _l2 < 0)
			throw new IllegalArgumentException("ERROR: No se puede crear un rectángulo de lados negativos");
		
		l1 = _l1;
		l2 = _l2;
	}

	/**
	 * Sobreescritura del método area heredado de la clase Figura.
	 * 
	 * @return Long con el área correspondiente de la figura
	 */
	@Override
	public double area() {		
		return getL1() * getL2();
	}
	
	/**
	 * Sobreescritura del método perimetro heredado de la clase Figura.
	 * 
	 * @return double con el perímetro correspondiente de la figura
	 */
	@Override
	public double perimetro() {
		return getL1() * 2 + getL2() * 2;
	}
	
	/**
	 * Sobreescritura del método equals heredado de la clase Object.
	 * 
	 * Se entiende que un Rectangulo es igual a otro según los siguientes casos:
	 * - Ambos hacen referencia al mismo objeto.
	 * - Ambos son instancias de Rectangulo y sus pares de lados son iguales.
	 * 
	 * @return boolean con el resultado de la comparación
	 */
	@Override
	public boolean equals(Object obj) {
		return (this == obj) ||
				((obj instanceof Rectangulo) && (getL1() == ((Rectangulo) obj).getL1() && getL2() == ((Rectangulo) obj).getL2()));
	}

	/**
	 * Método getter del lado 1 del rectángulo.
	 * 
	 * @return long con la medida del lado 1 del rectángulo.
	 */
	public long getL1() {
		return l1;
	}

	/**
	 * Método getter del lado 2 del rectángulo.
	 * 
	 * @return long con la medida del lado 2 del rectángulo.
	 */
	public long getL2() {
		return l2;
	}

}
