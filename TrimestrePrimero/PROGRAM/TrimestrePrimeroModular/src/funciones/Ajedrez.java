package funciones;

public class Ajedrez {
	
	/**
	 * Dada una tabla de 8x8, un vector con fichas de ajedrez y una tabla con las
	 * posiciones asociadas a las fichas, modifica la tabla t colocando las fichas
	 * en las posiciones dadas
	 * 
	 * @param t 		 Vector representativo del tablero de ajedrez
	 * @param fichas	 Vector con las fichas vivas en el tablero
	 * @param posiciones Vector con las posiciones de las fichas
	 */
	public static void cargarPartida(char[][] t, char[] fichas, int[][] posiciones) {
		int i, j;
		final int X = 0;
		final int Y = 1;
		final char CASILLA_VACIA = ' ';
		
		// Rellenamos la tabla a caracter vacío
		for (i = 0; i < t.length; i++)
			for (j = 0; j < t[i].length; j++)
				t[i][j] = CASILLA_VACIA;
		
		// Colocamos las fichas de ajedrez
		
		for (i = 0; i < fichas.length; i++)
			t[posiciones[i][X]][posiciones[i][Y]] = fichas[i];
	}
	
	/**
	 * Dado un tablero t, lo muestra indicando sus coordenadas en los extremos
	 * @param t Tablero a mostrar
	 */
	public static void mostrar(char[][] t) {
		final int ASCII_A = 97;
		int i, j;
		
		// Mostramos las coordenadas del segundo índice
		System.out.print("   ");
		for (i = 0; i < t.length; i++)
			System.out.print(((char)(i + ASCII_A)) + " ");
		System.out.println("");
		
		// Mostramos los valores
		for (i = 0; i < t.length; i++) {
			System.out.print((i + 1) + " |");
			for (j = 0; j < t[i].length; j++)
				System.out.printf("%c|", t[i][j]);			
			System.out.println();
		}
		
	}

}
