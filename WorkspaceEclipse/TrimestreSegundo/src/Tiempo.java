
/**
 * Clase gestora de tiempo. Se ocupa de controlar las operaciones básicas de conteo,
 * además de comprobar si un año es bisiesto.
 * 
 * @author César Ravelo Martínez
 *
 */
public class Tiempo {
	
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
		
		if (hh < 0 || hh > 24 || mm < 0 || mm > 59 || ss < 0 || ss > 59)
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
		
		segundos = contador % 60;
		contador /= 60;
		minutos = contador % 60;
		contador /= 60;
		horas = contador % 24;		
	}
	
	/**
	 * Método encargado de incrementar las horas en una unidad.
	 */
	public void incremHoras() {
		horas += (horas + 1 == 24) ? -23 : 1;
	}
	
	/**
	 * Método encargado de incrementar los minutos en una unidad.
	 */
	public void incremMinutos() {
		minutos += (minutos + 1 == 60) ? -59 : 1 ;

		if (minutos == 0)
			incremHoras();

	}	
	
	/**
	 * Método encargado de incrementar los segundos en una unidad.
	 */
	public void incremSeg() {
		segundos += (segundos + 1 == 60) ? -59 : 1 ;
		
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
		return (formato24)?String.format("%02d:%02d:%02d", horas, minutos, segundos) :
			String.format("%02d:%02d:%02d %s", horas % 12, minutos, segundos, (horas < 12)? "am" : "pm" );
	}	
}
