
public class SecuenciaCasiOrdenada {
	
	/**
	 * Dada una tabla de enteros,
	 * devuelve un String en el formato [d1, d2, ..., dn]
	 * @param t Tabla de valores iniciales
	 * @return String con la tabla de datos formateada
	 */
	public static String arrayToString(int[] t) {
		int i;
		String result = "";
		
		// Comprobamos en caso de que la tabla no contenga elementos
		if (t.length > 0) {
			result += "[";		
			for (i = 0; i < t.length-1; i++)
				result += t[i] + ", ";
			result += t[t.length-1] + "]";
		} else {
			result += "[]";
		}
		
		return result;
	}
	
	/**
	 * Dada una sequencia de al menos 2 elementos, se comprueba si está
	 * casi ordenada (se puede quitar un único elemento y queda ordenada
	 * de menor a mayor)
	 * @param sequence Vector con la secuencia de valores
	 * @return Booleano que confirma si es una secuencia casi ordenada
	 */
	public static boolean almostIncreasingSequence(int[] sequence) {
		final int CANTIDAD_QUITABLE = 1;		
		int i = 0, quitables = 0;
		
		// Buscamos si se tiene que quitar más de un elemento
		while ((quitables <= CANTIDAD_QUITABLE) && (i < sequence.length - 1)) {			
			quitables += (sequence[i] > sequence[i+1])?1:0;
			i++;
		}
		
		return (quitables <= CANTIDAD_QUITABLE);
	}
	
	/**
	 * Método principal de la aplicación
	 * @param args Parámetros de entrada a la aplicación
	 */
	public static void main(String[] args) {
		// Listado de pruebas a ejecutar
		int[] pruebaValida = {1, 3, 5, 2, 7, 8},
			  pruebaNoValida = {1, 3, 2, 5, 7, 4, 8},
			  pruebaTam2 = {1, 3},
			  pruebaTam2Invertida = {3, 1},
			  pruebaExtremoFinal = {1, 3, 2, 5, 4};
				
			
		System.out.println(arrayToString(pruebaValida) + " -> " + almostIncreasingSequence(pruebaValida));
		System.out.println(arrayToString(pruebaNoValida) + " -> " + almostIncreasingSequence(pruebaNoValida));
		System.out.println(arrayToString(pruebaTam2) + " -> " + almostIncreasingSequence(pruebaTam2));
		System.out.println(arrayToString(pruebaTam2Invertida) + " -> " + almostIncreasingSequence(pruebaTam2Invertida));
		System.out.println(arrayToString(pruebaExtremoFinal) + " -> " + almostIncreasingSequence(pruebaExtremoFinal));
		
	}
}
