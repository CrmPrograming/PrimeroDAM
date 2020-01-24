package github.crmprograming.primerodam.trimestresegundo.gestorTiempos;

/**
 * Clase gestora de tiempo. Se ocupa de controlar las operaciones básicas de conteo.
 * 
 * Además puede controlar el tiempo del momento actual.
 * 
 * @author César Ravelo Martínez
 *
 */
public class Tiempo2 {
	
	/**
	 * Constante estática para gestionar el valor máximo de las horas.
	 */
	public static final int MAX_HORAS = 24;
	
	/**
	 * Constante estática para gestionar el valor máximo de los minutos.
	 */
	public static final int MAX_MINUTOS = 60;
	
	/**
	 * Constante estática para gestionar el valor máximo de los segundos.
	 */	
	public static final int MAX_SEGUNDOS = 60;
	
	/**
	 * Constante estática para gestionar el valor máximo de los segundos.
	 */	
	public static final int MAX_MILISEG = 1000;
	
	/**
	 * Atributo largo entero para almacenar una hora cualquiera como milisegundos
	 */
	private long miliseg;
	
	/*
	 * Constructor por defecto de la clase. Fijará la hora a la
	 * hora actual del sistema.
	 */
	public Tiempo2() {
		reset();
	}
	
	/**
	 * Constructor por parámetros de la clase. Dada una hora
	 * cualquiera válida, inicializa la clase a dicha hora.
	 * @param hh Entero con las horas dadas
	 * @param mm Entero con los minutos dados
	 * @param ss Entero con los segundos dados
	 */
	public Tiempo2(int hh, int mm, int ss) {
		miliseg = convertirTiempo(hh, mm, ss);		
	}
	
	/**
	 * Reinicia la clase para ponerse al valor de la hora actual en el momento de ser llamada.
	 */
	public void reset() {
		miliseg = System.currentTimeMillis();
	}
	
	/**
	 * Método encargado de transformar una hora(s), minutos y segundos dados en milisegundos.
	 * Se espera para su ejecución que las horas, minutos y segundos respeten los valores válidos:
	 * 
	 * - Horas [0, 23]
	 * - Minutos [0, 59]
	 * - Segundos [0, 59]
	 * 
	 * @param hh Entero con las horas dadas
	 * @param mm Entero con los minutos dados
	 * @param ss Entero con los segundos dados
	 * @return Entero largo con las horas, minutos y segundos expresado en milisegundos
	 * @throws IllegalArgumentException Excepción generada en caso de no haber recibido los parámetros en formato válido
	 */
	public static long convertirTiempo(int hh, int mm, int ss) throws IllegalArgumentException {
		if (hh >= MAX_HORAS || hh < 0 || mm >= MAX_MINUTOS || mm < 0 || ss >= MAX_SEGUNDOS || ss < 0)
			throw new IllegalArgumentException("# La hora dada no viene en un formato válido");
		
		long tActual = 0l;
		tActual = hh * MAX_MINUTOS * MAX_SEGUNDOS;
		tActual += mm * MAX_SEGUNDOS;
		tActual += ss;
		
		// nº de milis desde las 00:00 de hoy
		return tActual * MAX_MILISEG;
	}

	/**
	 * Método getter del atributo miliseg.
	 * 
	 * @return Entero largo con los milisegundos almacenados
	 */
	public long getMiliseg() {
		return miliseg;
	}
	
	/**
	 * Método setter del atributo miliseg.
	 * 
	 * @param hh Entero con las horas dadas
	 * @param mm Entero con los minutos dados
	 * @param ss Entero con los segundos dados
	 */
	public void setMiliseg(int hh, int mm, int ss) {
		miliseg = convertirTiempo(hh, mm, ss);
	}
	
	/**
	 * Sobrecarga del método toString de la clase Object.
	 * 
	 * Devuelve un String con el formato:
	 * 
	 * hh:mm:ss
	 * 
	 * @return String con la cadena formateada
	 */
	@Override
	public String toString() {		
		int horas = 0, minutos = 0, segundos = 0;		
		long aux = 0l;
		
		aux = getMiliseg() / MAX_MILISEG;
		segundos = (int) (aux % MAX_SEGUNDOS);
		aux /= MAX_SEGUNDOS;
		minutos = (int) (aux % MAX_MINUTOS);
		aux /= MAX_MINUTOS;
		horas = (int) (aux % MAX_HORAS);
		
		return String.format("%02d:%02d:%02d", horas, minutos, segundos);
	}

}
