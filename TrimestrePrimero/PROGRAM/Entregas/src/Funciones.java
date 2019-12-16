
/**
 * Clase gestora de las distintas funciones del proyecto
 * 
 * @author César Ravelo Martínez
 * @version 1.0
 */
public class Funciones {

	/**
	 * Dada una sopa de letras, una posición inicial y una lista de desplazamientos,
	 * devolver el mensaje oculto en dicha sopa de letras.
	 * 
	 * @param sopaLetras Tabla bidimensional con los caracteres de la sopa de letras
	 * @param filaIni Índice inicial en filas donde empieza la frase oculta
	 * @param columnaIni Índice inicial en columnas donde empieza la frase oculta
	 * @param desplazamiento Tabla bidimensional con los desplazamientos a realizar
	 * @return String con la frase oculta contenida en sopaLetras
	 */
	public static String funcionOculta(char[][]sopaLetras, int filaIni, int columnaIni, int[][] desplazamiento) {
		// Declaración inicial de variables y constantes
		final int FILA = 0, COLUMNA = 1;
		int i;
		// Comenzamos el algoritmo por la fila filaIni
		int filaActual = filaIni;
		// Comenzamos el algoritmo por la columna columnaIni
		int columnaActual = columnaIni;
		// Comenzamos el algoritmo por el char en la posición inicial
		String frase = "" + sopaLetras[filaActual][columnaActual];
		
		// Recorremos sopaLetras mediante los movimientos en desplazamiento construyendo así la frase oculta
		for (i = 0; i < desplazamiento.length; i++) {
			filaActual += desplazamiento[i][FILA];
			columnaActual += desplazamiento[i][COLUMNA];
			// Extraemos el caracter localizado tras aplicar el desplazamiento actual
			frase += sopaLetras[filaActual][columnaActual];
		}
		
		// Devolvemos la frase oculta extraída de la sopa de letras
		return frase;		
	}
	
}
