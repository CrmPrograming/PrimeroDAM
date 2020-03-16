package minik.ejerc.herenciainterfaces;

public class AfirmacionFalsa {
	
	public static int[] tabla2;

	public static void main(String[] args) {
		// a) Definir arrays bidimensionales de la forma a[i][j] con j variable
		int[][] tabla = new int[3][];
		int filas;
		
		tabla[0] = new int[] {1};
		tabla[1] = new int[] {1, 2, 3, 4};
		tabla[2] = new int[] {1, 2, 3, 4, 5, 6, 7};
		
		for (filas = 0; filas < tabla.length; filas++)
			System.out.printf("> Tamaño de la tabla %d: %d\n", filas + 1, tabla[filas].length);
		
		// b) Declarar arrays con memoria estática
		// (Ver la declaración arriba)
		tabla2  = new int[5];
		tabla2[2] = -1;
		
		System.out.println(tabla2[2]);		
		
		// c) Array es un objeto
		System.out.println("Los arrays son objetos: " + (new int[] {1}) instanceof Object);

	}

}
