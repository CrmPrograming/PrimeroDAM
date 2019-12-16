package funciones;

public class Vectores {
	
	/**
	 * Dados dos vectores de tipo entero ordenados previamente de menor
	 * a mayor, devolver un vector que mezcle ambos vectores
	 * 
	 * @param a Vector 1
	 * @param b Vector 2
	 * @return  Vector con la mezcla de ambos vectores
	 */
	public static int[] merge(int[] a, int[] b) {
		int i, j;
		int[] c = new int[b.length + a.length];
		
		i = j = 0;
		while (i < a.length && j < b.length)
			c[i + j] = (a[i] < b[j])?a[i++]:b[j++];
			
		while (i < a.length)
			c[i + j] = a[i++];
		while (j < b.length)
			c[i + j] = b[j++];
		
		return c;
	}
	
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
	 * Dado un vector de datos y una cantidad, devuelve otro vector con todos esos
	 * datos del mismo tamaño que la cantidad indicada
	 * 
	 * @param datos    Vector con los valores a copiar
	 * @param cantidad Tamaño del vector a copiar
	 * @return Vector del tamaño indicado con los valores ya copiados
	 */
	public static float[] ajustarVector(float[] datos, int cantidad) {
		float[] v = new float[cantidad];
		int i;

		for (i = 0; i < cantidad; i++)
			v[i] = datos[i];

		return (v);
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
	
}
