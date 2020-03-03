package github.crmprograming.primerodam.trimestresegundo.ejerc.figuras;

/**
 * Clase gestora de una casita. Se caracteriza por:
 * - Estar formada por un Triángulo (tejado)
 * - Estar formada por un Rectángulo (cuerpo)
 * 
 * @author César Ravelo Martínez
 *
 */
public class Casita extends Figura {
	
	/**
	 * Instancia de Rectangulo representativo del cuerpo de la casita.
	 */
	private Rectangulo cuerpo;
	
	/**
	 * Instancia de Triangulo representativo del tejado de la casita.
	 */
	private Triangulo tejado;
	
	/**
	 * Constructor de la clase. Inicializa la casita
	 * en base a los valores indicados como parámetro.
	 * Delega la inicialización del punto de coordenadas
	 * a la clase padre Figura.
	 * 
	 * @param _x Long con la coordenada X de la figura
	 * @param _y Long con la coordenada Y de la figura
	 * @param _base Long con el radio de la circunferencia
	 * @param _alturaCasa Long con la altura de la casa
	 * @param _alturaTejado Long con la altura del tejado de la casa
	 */
	public Casita(long _x, long _y, long _base, long _alturaCasa, long _alturaTejado) {
		super(_x, _y);
		
		cuerpo = new Rectangulo(_x, _y + _alturaTejado, _base, _alturaCasa - _alturaTejado);
		tejado = new Triangulo(_x, _y, _base, _alturaTejado);		
	}

	/**
	 * Sobreescritura del método area heredado de la clase Figura.
	 * Se calcula el área como la suma de las áreas de las distintas
	 * figuras que la forman.
	 * 
	 * @return Double con el área correspondiente de la figura
	 */
	@Override
	public double area() {
		return cuerpo.area() + tejado.area();
	}

	/**
	 * Sobreescritura del método perimetro heredado de la clase Figura.
	 * Se calcula el perímetro como la suma de los perímetros de las
	 * distintas figuras que la forman menos los lados comunes a ambas
	 * figuras (en nuestro caso, la base superior del cuerpo de la casa
	 * y la base del tejado). 
	 * 
	 * @return Double con el perímetro correspondiente a la figura 
	 */
	@Override
	public double perimetro() {
		double result = cuerpo.perimetro() + tejado.perimetro();
		
		return result - tejado.getBase() - cuerpo.getL1();
	}
	
	/**
	 * Sobreescritura del método equals heredado de la clase Object.
	 * 
	 * Se entiende que una Casita es igual a otra según los siguientes casos:
	 * - Ambos hacen referencia al mismo objeto.
	 * - Ambos son instancias de Casita y sus partes, cuerpo y tejado, son iguales.
	 * 
	 * @return boolean con el resultado de la comparación
	 */
	@Override
	public boolean equals(Object obj) {
		return (this == obj) ||
				((obj instanceof Casita) && (getCuerpo().equals(((Casita) obj).getCuerpo()) && getTejado().equals(((Casita) obj).getTejado())));
	}
	
	/**
	 * Método getter del cuerpo de la casita.
	 * 
	 * @return Rectangulo con el cuerpo de la casita
	 */
	public Rectangulo getCuerpo() {
		return cuerpo;
	}
	
	/**
	 * Método getter del tejado de la casita.
	 * 
	 * @return Triangulo con el tejado de la casita
	 */
	public Triangulo getTejado() {
		return tejado;
	}

}
