package github.crmprograming.primerodam.trimestresegundo.ejerc.figuras;

/**
 * Clase gestora de elipses. Se caracteriza por:
 * - Estar formada por un radio mayor y un radio menor.
 * 
 * @author César Ravelo Martínez
 *
 */
public class Elipse extends Figura {
	
	/**
	 * Long con la medida del radio mayor de la elipse.
	 */
	private long radioMayor;
	
	/**
	 * Long con la medida del radio menor de la elipse.
	 */
	private long radioMenor;

	/**
	 * Constructor de la clase. Inicializa la elipse
	 * en base a los valores indicados como parámetro.
	 * Delega la inicialización del punto de coordenadas
	 * a la clase padre Figura.
	 * 
	 * @param _x Long con la coordenada X de la figura
	 * @param _y Long con la coordenada Y de la figura
	 * @param _radioMayor Long con la medida del radio mayor
	 * @param _radioMenor Long con la medida del radio menor 
	 */
	public Elipse(long _x, long _y, long _radioMayor, long _radioMenor) {
		super(_x, _y);
		
		if (_radioMayor < _radioMenor)
			throw new IllegalArgumentException("ERROR: El radio mayor no puede ser menor al radio menor");
		
		radioMayor = _radioMayor;
		radioMenor = _radioMenor;		
	}

	/**
	 * Sobreescritura del método area heredado de la clase Figura.
	 * Se calcula el área mediante la siguiente fórmula:
	 * 
	 * PI * R * r
	 * 
	 * @return Long con el área correspondiente de la figura
	 */
	@Override
	public double area() {
		return Math.PI * getRadioMayor() * getRadioMenor();
	}

	/**
	 * Sobreescritura del método perimetro heredado de la clase Figura.
	 * Se calcula el perímetro mediante la siguiente fórmula:
	 * 
	 * 2 * PI * SQRT((R^2 + r^2) / 2)
	 * 
	 * @return Double con el perímetro correspondiente a la figura
	 */
	@Override
	public double perimetro() {		
		return 2 * Math.PI * Math.sqrt((Math.pow(getRadioMayor(), 2) + Math.pow(getRadioMayor(), 2)) / 2);
	}

	/**
	 * Método getter del radio mayor de la elipse.
	 * 
	 * @return long con el radio mayor de la elipse
	 */
	public long getRadioMayor() {
		return radioMayor;
	}

	/**
	 * Método getter del radio menor de la elipse.
	 * 
	 * @return long con el radio menor de la elipse
	 */
	public long getRadioMenor() {
		return radioMenor;
	}

}
