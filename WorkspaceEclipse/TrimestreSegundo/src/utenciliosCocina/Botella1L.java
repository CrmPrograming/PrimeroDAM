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
	public final static float CAPACIDAD_MAXIMA = 1f;
	
	/**
	 * Flotante con la cantidad de líquido dentro de la botella. 
	 * Sus valores vienen delimitados por el rango [0, 1].
	 */
	private float contenido;
	
	/**
	 * Boolean indicativo del estado de la botella.
	 * False -> Abierta
	 * True -> Cerrada
	 */
	private boolean cerrado;
	
	/**
	 * String estático con las unidades de todas las botellas.
	 */
	public static String unidades;
	
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
	 * Método encargado de comprobar si la botella se encuentra cerrada.
	 * 
	 * @return Boolean con el estado de la botella
	 */
	public boolean estaCerrada() {
		return cerrado;
	}
	
	/**
	 * Método encargado de comprobar si la botella se encuentra abierta.
	 * 
	 * @return Boolean con el estado de la botella
	 */
	public boolean estaAbierta() {
		return !estaCerrada();
	}
	
	/**
	 * Método encargado de comprobar si la botella está llena
	 * 
	 * @return Boolean con el estado del contenido de la botella
	 */
	public boolean estaLlena() {
		return contenido == CAPACIDAD_MAXIMA;
	}
	
	/**
	 * Método encargado de comprobar si la botella está vacía
	 * 
	 * @return Boolean con el estado del contenido de la botella
	 */
	public boolean estaVacia() {
		return contenido == 0f;
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
		
		if (!estaCerrada())
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
		
		if (!estaCerrada())
			if (contenido - cant < 0f) {
				sobra -= contenido;
				contenido = 0f;
			} else {
				contenido -= cant;
				sobra = 0f;
			}
		return sobra;
	}
	
	/**
	 * Método estático encargado de generar una tabla de Botella1L donde
	 * cada una de sus botellas estará llena y cerrada según el tamaño
	 * indicado por parámetro.
	 * 
	 * Los únicos tamaños válidos son: 6, 8, 10, 12, 24
	 * @param tam Entero con el tamaño de la caja
	 * @return tabla de Botella1L con las instancias creadas
	 * @throws IllegalArgumentException en caso de dar un tamaño no válido
	 */
	public static Botella1L[] caja(int tam) throws IllegalArgumentException {
		final int TAM_6 = 6, TAM_8 = 8, TAM_10 = 10, TAM_12 = 12, TAM_24 = 24;
		Botella1L[] c = null;
		int i;
		
		switch (tam) {
			case TAM_6:
			case TAM_8:
			case TAM_10:
			case TAM_12:
			case TAM_24:
				c = new Botella1L[tam];
				
				for (i = 0; i < tam; i++) {
					c[i] = new Botella1L();
					c[i].anadir(CAPACIDAD_MAXIMA);
					c[i].cerrar();
				}				
				
				break;
			
			default:
				throw new IllegalArgumentException();
		}
		
		return c;
	}
	
	/**
	 * Método encargado de dada una instancia de Botella1L, b2, generar
	 * una nueva instancia cuyo contenido sea la suma del contenido de b2
	 * y el contenido de la instancia que invoque a este método.
	 * 
	 * @param b2 Objeto Botella1L de la segunda botella
	 * @return Instancia de Botella1L con la suma de contenidos
	 */
	public Botella1L suma(Botella1L b2) {
		Botella1L nueva = new Botella1L();
		
		nueva.anadir(b2.getContenido() + getContenido());
		
		nueva.cerrar();
		
		return nueva;
	}
	
	/**
	 * Método getter del contenido de la botella.
	 * 
	 * @return float con el contenido actual de la botella
	 */
	public float getContenido() {
		return contenido;
	}
	
	/**
	 * Sobrecarga del método toString de la clase Object para generar un String
	 * con el siguiente formato:
	 * 
	 * 0.00 [unidades] (abierta/cerrada)
	 * 
	 * Es decir, "%.2f %s (%s)".
	 */
	@Override
	public String toString() {
		return String.format("%.2f %s (%s)", getContenido(), (unidades == null)? "" : unidades,
								(cerrado)? "cerrada" : "abierta");
	}
	
}
