package github.crmprograming.primerodam.trimestreprimeromodular.funciones;

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
	
	/**
	 * Dado un tablero con una partida de ajedrez y una posición del mismo,
	 * determina todas las fichas a tiro (aliadas y enemigas) de la ficha en
	 * la posición establecida según sus movimientos característicos.
	 * 
	 * @param tablero Vector representativo del tablero de ajedrez
	 * @param i		  Coordenada x de la ficha dada
	 * @param j       Coordenada y de la ficha dada
	 * @return        Devuelve el listado de fichas a tiro
	 */
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
				victimas = explorarRey(tablero, i, j);
				break;
				
			// Dama
			case 'D':
			case 'd':
				victimas = explorarDama(tablero, i, j);
				break;
		}
		
		return (victimas);
	}
	
	/**
	 * Método encargado de determinar las fichas a tiro
	 * según los movimientos de una torre
	 * 
	 * @param tablero Vector representativo del tablero de ajedrez
	 * @param i		  Coordenada x de la ficha dada
	 * @param j       Coordenada y de la ficha dada
	 * @return		  Devuelve el listado de fichas a tiro
	 */
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
	
	/**
	 * Método encargado de determinar las fichas a tiro
	 * según los movimientos de un alfil
	 * 
	 * @param tablero Vector representativo del tablero de ajedrez
	 * @param i		  Coordenada x de la ficha dada
	 * @param j       Coordenada y de la ficha dada
	 * @return		  Devuelve el listado de fichas a tiro
	 */
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
	
	/**
	 * Método encargado de determinar las fichas a tiro
	 * según los movimientos de una dama
	 * 
	 * @param tablero Vector representativo del tablero de ajedrez
	 * @param i		  Coordenada x de la ficha dada
	 * @param j       Coordenada y de la ficha dada
	 * @return		  Devuelve el listado de fichas a tiro
	 * @see juntarVectores
	 * @see explorarTorre
	 * @see explorarAlfil
	 */
	public static char[] explorarDama(char[][] tablero, int i, int j) {
		return (juntarVectores(explorarTorre(tablero, i, j), explorarAlfil(tablero, i, j)));
	}
	
	/**
	 * Método encargado de determinar las fichas a tiro
	 * según los movimientos de un rey
	 * 
	 * @param tablero Vector representativo del tablero de ajedrez
	 * @param i		  Coordenada x de la ficha dada
	 * @param j       Coordenada y de la ficha dada
	 * @return		  Devuelve el listado de fichas a tiro
	 */
	public static char[] explorarRey(char[][] tablero, int i, int j) {
		String enemigas = "";
		int fila, columna;
		final int LIMITE_SUPERIOR = (i > 0)?i - 1:0;
		final int LIMITE_INFERIOR = (i == tablero.length - 1)?tablero.length - 1:i + 1;
		final int LIMITE_IZQUIERDO = (j > 0)?j - 1:0;
		final int LIMITE_DERECHO = (j == tablero.length - 1)?tablero.length - 1:j + 1;
		final char VACIA = ' ';
		
		for (fila = LIMITE_SUPERIOR; fila <= LIMITE_INFERIOR; fila++) {
			for (columna = LIMITE_IZQUIERDO; columna <= LIMITE_DERECHO; columna++) {				
				if (tablero[fila][columna] != VACIA && !(fila == i && columna == j))
					enemigas += tablero[fila][columna];
			}
		}
		
		return (enemigas.toCharArray());
	}
	
	/**
	 * Dados dos vectores de tipo char, devuelve un vector formado por
	 * los valores de ambos vectores, primero los de a y luego los de b
	 * 
	 * @param a Primer vector de char
	 * @param b Segundo vector de char
	 * @return Vector unificado
	 */
	public static char[] juntarVectores(char[] a, char[] b) {
		char[] c = new char[a.length + b.length];
		int i;
		
		// Insertamos primero los valores de a
		for (i = 0; i < a.length; i++)
			c[i] = a[i];
		
		// Insertamos los valores de b tras los de a
		for (i = 0; i < b.length; i++)
			c[i + a.length] = b[i];
		
		return c;
	}

}
