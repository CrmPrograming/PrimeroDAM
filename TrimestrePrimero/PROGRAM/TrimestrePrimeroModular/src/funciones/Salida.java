package funciones;

/**
 * 
 * @author César Ravelo Martínez
 * @version 1.0
 */
public class Salida {

	/**
	 * Dada una tabla de enteros,
	 * la muestra en el formato [d1, d2, ..., dn]
	 * @param t Tabla de valores a mostrar
	 */
	public static void mostrar(int[] t) {
		int i;
		
		// Comprobamos en caso de que la tabla no contenga elementos
		if (t.length > 0) {
			System.out.print("[");		
			for (i = 0; i < t.length-1; i++)
				System.out.printf("%d, ",t[i]);
			System.out.printf("%d]\n", t[t.length-1]);
		} else {
			System.out.println("[]");
		}
	}
}
