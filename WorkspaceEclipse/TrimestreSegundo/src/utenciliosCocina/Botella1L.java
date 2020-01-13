package utenciliosCocina;

/**
 * Clase gestora de una botella de 1 litro.
 * 
 * @author César Ravelo Martínez
 *
 */
public class Botella1L {
	
	/**
	 * Constante entera con el límite de litros disponibles en la botella.
	 */
	public final float CAPACIDAD_MAXIMA = 1f;
	
	/**
	 * Flotante con la cantidad de líquido dentro de la botella. 
	 * Sus valores vienen delimitados por el rango [0, 1].
	 */
	public float contenido;
	
	/**
	 * Boolean indicativo del estado de la botella.
	 * False -> Abierta
	 * True -> Cerrada
	 */
	public boolean cerrado;
	
	/**
	 * Método encargado de abrir la botella.
	 */
	public void abrir() {
		cerrado = false;
	}
	
	/**
	 * Método encargado de cerrar la botella.
	 */
	public void cerrar() {
		cerrado = true;
	}
	
	/**
	 * Sobrecarga del método toString de la clase Object para generar un String
	 * con el siguiente formato:
	 * 
	 * 0.00 (abierta/cerrada)
	 * 
	 * Es decir, "%.2f (%s)".
	 */
	@Override
	public String toString() {
		return String.format("%.2f (%s)", contenido, (cerrado)?"cerrada":"abierta");
	}
	
	/**
	 * Método encargado de introducir más líquido en la botella.
	 * 
	 * Sólo se podrá insertar si la botella se encuentra abierta.
	 * 
	 * Devolverá la cantidad que desborda o no entra en la botella según su
	 * capacidad actual.
	 * 
	 * @param cant Flotante con la cantidad a añadir
	 * @return Flotante con la cantidad que sobra
	 */
	public float anadir(float cant) {
		float sobra = cant;
		if (!cerrado)
			if (cant + contenido > CAPACIDAD_MAXIMA) {
				sobra = (cant + contenido) - CAPACIDAD_MAXIMA;
				contenido = CAPACIDAD_MAXIMA;			
			} else {
				contenido += cant;
				sobra = 0f;
			}
		return sobra;
	}
	
	/**
	 * Método encargado de sacar líquido de la botella.
	 * 
	 * Sólo se podrá sacar si la botella está abierta.
	 * 
	 * Devolverá la cantidad que se pudiera extraer.
	 * 
	 * @param cant Flotante con la cantidad a extraer
	 * @return Flotante con la cantidad extraída
	 */
	public float extraer(float cant) {
		float sobra = cant;		
		if (!cerrado)
			if (contenido - cant < 0f) {
				sobra = cant - contenido;
				contenido = 0f;			
			} else {
				contenido -= cant;
				sobra = 0f;
			}		
		return sobra;
	}	
}
