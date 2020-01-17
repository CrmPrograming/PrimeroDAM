package gestorTiempos;

/**
 * Clase gestora de tiempo. Se ocupa de controlar las operaciones básicas de conteo,
 * además de comprobar si un año es bisiesto.
 * 
 * @author César Ravelo Martínez
 *
 */
public class Tiempo {
	
	public final int MAX_HORA = 24;
	
	public final int MAX_MINUTOS = 60;
	
	public final int MAX_SEGUNDOS = 60;
	
	/**
	 * Atributo estático representativo del modo de tiempo a mostrar en toString().
	 * Si se encuentra a true, se mostrará el tiempo en formato 24 horas. En caso contrario,
	 * se mostrará en formato 12 horas.
	 */
	public static boolean formato24;
	
	/**
	 * Atributo privado para representar las horas.
	 */
	private int horas;
	
	/**
	 * Atributo privado para representar los minutos.
	 */
	private int minutos;
	
	/**
	 * Atributo privado para representar los segundos.
	 */
	private int segundos;
	
	/**
	 * Método estático encargado de indicar si el año dado por parámetro
	 * es bisiesto o no.
	 * 
	 * @param year Entero con el año a analizar
	 * @return Booleano con la clarificación de si es bisiesto o no
	 */
	public static boolean esBisiesto(int year) {
		return ((year % 4 == 0) && (year % 100 != 0)) || (year % 400 == 0);
	}

	/**
	 * Método getter del atributo horas.
	 * 
	 * @return Entero con el valor de las horas
	 */
	public int getHoras() {
		return horas;
	}
	
	/**
	 * Método setter del atributo horas.
	 * 
	 * @param hh Entero con el valor de las horas
	 */
	public void setHoras(int hh) {
		horas = (hh < MAX_HORA && hh >= 0)? hh : horas;
	}

	/**
	 * Método getter del atributo minutos.
	 * 
	 * @return Entero con el valor de los minutos
	 */
	public int getMinutos() {
		return minutos;
	}
	
	/**
	 * Método setter del atributo minutos.
	 * 
	 * @param mm Entero con el valor de los minutos
	 */
	public void setMinutos(int mm) {
		minutos = (mm < MAX_MINUTOS && mm >= 0)? mm : minutos;
	}

	/**
	 * Método getter del atributo horas.
	 * 
	 * @return Entero con el valor de las horas
	 */
	public int getSegundos() {
		return segundos;
	}
	
	/**
	 * Método setter del atributo segundos.
	 * 
	 * @param ss Entero con el valor de los segundos
	 */
	public void setSegundos(int ss) {
		segundos = (ss < MAX_SEGUNDOS && ss >= 0)? ss : segundos;
	}

	/**
	 * Método encargado de cambiar los atributos de la clase.
	 * 
	 * Todos los parámetros deben corresponderse a su rango de valores posibles:
	 * 
	 * - Horas [0, 23]
	 * - Minutos [0, 59]
	 * - Segundos [0, 59]
	 * 
	 * Si alguno de los parámetros está fuera de rango, se produce una IllegalArgumentException.
	 * 
	 * @param hh Entero con la nueva hora
	 * @param mm Entero con los nuevos minutos
	 * @param ss Entero con los nuevos segundos
	 * @throws IllegalArgumentException Excepción en caso de dar un parámetro en formato incorrecto
	 */
	public void set(int hh, int mm, int ss) throws IllegalArgumentException {
		
		if (hh < 0 || hh > MAX_HORA || mm < 0 || mm >= MAX_MINUTOS || ss < 0 || ss >= MAX_SEGUNDOS)
			throw new IllegalArgumentException();
		
		horas = hh;
		minutos = mm;
		segundos = ss;
	}
	
	/**
	 * Método encargado de cambiar los atributos de la clase.
	 * 
	 * Recibe como parámetro una hora en segundos.
	 * @param t Entero con el tiempo expresado en segundos
	 */
	public void set (int t) {
		int contador = t;
		
		segundos = contador % MAX_SEGUNDOS;
		contador /= MAX_SEGUNDOS;
		minutos = contador % MAX_MINUTOS;
		contador /= MAX_MINUTOS;
		horas = contador % MAX_HORA;		
	}
	
	/**
	 * Método encargado de incrementar las horas en una unidad.
	 */
	public void incremHoras() {
		horas += (horas + 1 == MAX_HORA) ? -(MAX_HORA - 1) : 1;
	}
	
	/**
	 * Método encargado de incrementar los minutos en una unidad.
	 */
	public void incremMinutos() {
		minutos += (minutos + 1 == MAX_MINUTOS) ? -(MAX_MINUTOS - 1) : 1 ;

		if (minutos == 0)
			incremHoras();

	}	
	
	/**
	 * Método encargado de incrementar los segundos en una unidad.
	 */
	public void incremSeg() {
		segundos += (segundos + 1 == MAX_SEGUNDOS) ? -(MAX_SEGUNDOS - 1) : 1 ;
		
		if (segundos == 0)
			incremMinutos();
	}
		
	/**
	 * Sobrecarga del método toString de la clase Object.
	 * 
	 * Mostrará el String en el siguiente formato:
	 * 
	 * %02d:%02d%02d
	 * 
	 * Si el atributo estático formato24 está marcado a true, el formato será:
	 * 
	 * %02d:%02d%02d %s
	 * 
	 * @see Tiempo#formato24
	 */
	@Override
	public String toString() {
		String msg = "";
		if (formato24)
			msg = String.format("%02d:%02d:%02d", horas, minutos, segundos);
		else if (horas < 12)
				msg = String.format("%02d:%02d:%02d am", horas, minutos, segundos);
			 else if (horas == 12)
				 msg = String.format("%02d:%02d:%02d pm", horas, minutos, segundos);
			 else
				 msg = String.format("%02d:%02d:%02d pm", horas - 12, minutos, segundos);
		
		return msg;
	}	
}
