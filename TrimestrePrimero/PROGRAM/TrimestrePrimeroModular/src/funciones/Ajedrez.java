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
		final char VACIA = ' ';
		final char CASILLA_VACIA = VACIA;
		
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
	
	public static char[] explorar(char[][] tablero, int i, int j) {
		char[] victimas = new char[0];
		
		// Identificamos la ficha a analizar
		switch (tablero[i][j]) {
			// Alfiles
			case 'A':
			case 'a':
				victimas = explorarAlfil(tablero, i, j);
				break;
				
			// Torres
			case 'T':
			case 't':
				victimas = explorarTorre(tablero, i, j);
				break;
			
			// Rey
			case 'R':
			case 'r':
				
				break;
				
			// Dama
			case 'D':
			case 'd':
				victimas = explorarTorre(tablero, i, j);				
				victimas = juntarVectores(victimas, explorarAlfil(tablero, i, j));
				break;
		}
		
		return (victimas);
	}
	
	public static char[] explorarTorre(char[][] tablero, int i, int j) {
		String enemigas = "";
		int fila, columna;
		final char VACIA = ' ';
		
		// Buscamos fichas por fila
		for (fila = 0; fila < i; fila++)
			if (tablero[fila][j] != VACIA)
				enemigas += tablero[fila][j];
		
		for (fila = i+1; fila < tablero.length; fila++)
			if (tablero[fila][j] != VACIA)
				enemigas += tablero[fila][j];
		
		// Buscamos fichas por columna
		for (columna = 0; columna < j; columna++)
			if (tablero[i][columna] != VACIA)
				enemigas += tablero[i][columna];
		
		for (columna = i+1; columna < tablero.length; columna++)
			if (tablero[i][columna] != VACIA)
				enemigas += tablero[i][columna];
		
		return (enemigas.toCharArray());
	}
	
	public static char[] explorarAlfil(char[][] tablero, int i, int j) {
		String enemigas = "";
		int fila, columna;
		final int LIMITE = tablero.length - 1,  DIFERENCIA = j - i, DESPLAZAMIENTO = i + j;
		final char VACIA = ' ';
		
		
		// Subdiagonal superior izquierda
		fila = i - 1;
		columna = DIFERENCIA + fila;
		while (fila >= 0 && columna >= 0) {
			if (tablero[fila][columna] != VACIA)
				enemigas += tablero[fila][columna];
			fila--;
			columna = DIFERENCIA + fila;
		}
		
		// Subdiagonal inferior derecha
		fila = i + 1;
		columna = DIFERENCIA + fila;
		while (fila <= LIMITE && columna <= LIMITE) {
			if (tablero[fila][columna] != VACIA)
				enemigas += tablero[fila][columna];
			fila++;
			columna = DIFERENCIA + fila;
		}
		
		// Subdiagonal inferior izquierda
		fila = i + 1;
		columna = DESPLAZAMIENTO - fila;
		while (fila <= LIMITE && columna >= 0) {
			if (tablero[fila][columna] != VACIA)
				enemigas += tablero[fila][columna];
			fila++;
			columna = DESPLAZAMIENTO - fila;
		}
		
		// Subdiagonal superior derecha
		fila = i - 1;
		columna = DESPLAZAMIENTO - fila;
		while (fila >= 0 && columna <= LIMITE) {
			if (tablero[fila][columna] != VACIA)
				enemigas += tablero[fila][columna];
			fila--;
			columna = DESPLAZAMIENTO - fila;
		}		
		
		return (enemigas.toCharArray());
	}
	
	public static char[] juntarVectores(char[] a, char[] b) {
		char[] c = new char[a.length + b.length];
		int i;
		
		for (i = 0; i < a.length; i++)
			c[i] = a[i];
		
		for (i = 0; i < b.length; i++)
			c[i + a.length] = b[i];
		
		return c;
	}

}
