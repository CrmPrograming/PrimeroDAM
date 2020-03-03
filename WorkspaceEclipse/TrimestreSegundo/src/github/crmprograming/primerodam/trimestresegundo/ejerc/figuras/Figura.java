package github.crmprograming.primerodam.trimestresegundo.ejerc.figuras;

/**
 * Clase abstracta de figuras cerradas. Define una clase como una figura
 * geométrica la cual se caracteriza por:
 * - Estar posicionada en un punto del plano (x, y).
 * - Capaz de calcular su área. 
 * 
 * @author César Ravelo Martínez
 *
 */
public abstract class Figura {
	
	/**
	 * Long con la coordenada X de la figura.
	 */
	private long x;
	
	/**
	 * Long con la coordenada Y de la figura.
	 */
	private long y;

	/**
	 * Constructor de la clase. Inicializa una Figura
	 * en el punto de coordenadas establecido por parámetro.
	 * 
	 * @param _x Long con la coordenada X
	 * @param _y Long con la coordenada Y
	 */
	public Figura(long _x, long _y) {
		x = _x;
		y = _y;
	}
	
	/**
	 * Método abstracto para el cálculo del área de una Figura.
	 * Cada especificación de Figura deberá implementarlo en base
	 * al método de cálculo asociado a dicha figura geométrica.
	 * 
	 * @return double con el área correspondiente de la figura
	 */
	public abstract double area();
	
	/**
	 * Método abstracto para el cálculo del perímetro de una Figura.
	 * Cada especificación de Figura deberá implementarlo en base
	 * al método de cálculo asociado a dicha figura geométrica.
	 * 
	 * @return double con el perímetro correspondiente de la figura
	 */
	public abstract double perimetro();
	
	/**
	 * Método encargado de buscar una Figura en una tabla de Figura.
	 * Retornará la posición en la cual se encuentre la figura indicada
	 * en la tabla o -1 en caso de no encontrarla.
	 * 
	 * Para ello utiliza la búsqueda lineal.
	 * 
	 * @param figuras Tabla de Figura con los valores a comparar
	 * @param f Instancia de Figura a buscar en la tabla figuras
	 * @return Entero con la posición de la figura en la tabla
	 */
	public static int buscar(Figura[] figuras, Figura f) {
		int pos = 0;
		
		while (pos < figuras.length - 1 && !figuras[pos].equals(f))
			pos++;
			
		return (figuras[pos].equals(f))? pos : -1;
	}

	/**
	 * Método getter del atributo x.
	 * @return Long con la coordenada X de la figura
	 */
	public long getX() {
		return x;
	}

	/**
	 * Método getter del atributo y.
	 * @return Long con la coordenada Y de la figura
	 */
	public long getY() {
		return y;
	}
	
}
