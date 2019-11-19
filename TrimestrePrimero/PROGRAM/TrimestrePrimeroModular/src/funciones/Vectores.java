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
	
}
