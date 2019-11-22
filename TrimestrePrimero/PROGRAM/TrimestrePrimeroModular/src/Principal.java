import funciones.*;
import funciones.matematicas.*;

/**
 * 
 * @author César Ravelo Martínez
 * @version 1.0
 */
public class Principal {
	
	/**
	 * Calcula la media para unos valores ya estipulados
	 */
	public static void calcularMedia() {
		// Código para la función media
		float[] valores = { 2f, 5f, 1f, 7f, 6f, 2f };
		System.out.printf("> La media de los valores dados es %f", Matematicas.media(valores));
	}
	
	/**
	 * Calcula la distancia entre puntos para valores ya estipulados
	 */
	public static void calcularDistancia1() {
		// Código para las funciones de puntos 1
		int[] coordX = {3,  2, -5, 1};
		int[] coordY = {4, -5,  4, 1};
		int pX = -5;
		int pY = 5;
		int coord = Geometria.puntoCercano(pX, pY, coordX, coordY);
		System.out.printf("> El punto más cercano es: (%d, %d)\n", coordX[coord], coordY[coord]);
	}
	
	/**
	 * Calcula la distancia entre puntos para valores ya estipulados
	 */
	public static void calcularDistancia2() {
		int[] p = {-5, 5};
		int[][] puntos = {{3, 4}, {2, -5}, {-5, 4}, {1, 1}};
		int coord = Geometria.puntoCercano(p, puntos);
		System.out.printf("> El punto más cercano es: (%d, %d)\n", puntos[coord][0], puntos[coord][1]);
	}
	
	/**
	 * Calcula balances para valores ya estipulados
	 */
	public static void calcularBalances() {
		int[][] balance = {{50, 20},
				   {100, 50},
				   {35, 20}, 
				   {80, 40}};		
		int i = 0;
		System.out.printf("%8s ", "INGRESOS");
		for (i = 0; i < balance.length; i++) {
			System.out.printf("|%4d ", balance[i][0]);
		}
		System.out.printf("|%+.2f\n", Matematicas.mediaIngresos(balance));
		System.out.printf(" %-7s ", "GASTOS");
		for (i = 0; i < balance.length; i++) {
			System.out.printf("|%4d ", balance[i][1]);
		}
		System.out.printf("|%+.2f\n", Matematicas.mediaGastos(balance));
		System.out.println("-----------------------------------------");
		System.out.printf("BALANCE TOTAL: %+d", Matematicas.totalBalance(balance));
	}
	
	/**
	 * Método main principal de la aplicación
	 * @param args Valores de entrada de la aplicación
	 */
	public static void main(String[] args) {
//		int[][] balance = {{50, 20},
//				   {100, 50},
//				   {35, 20}, 
//				   {80, 40}};
////		calcularMedia();
//		
////		calcularDistancia1();
////		calcularDistancia2();
//		
////		calcularBalances();
//		
//		Matematicas.mostrarTabla(balance);
//		
//		Salida.mostrar(Matematicas.totales(balance));
//		System.out.println(Salida.arrayToString(Matematicas.totales(balance)));
//		
//		Matematicas.mostrarHTML(balance);
//		
//		int[] a = {2, 6, 7, 9};
//		int[] b = {1, 4, 5, 11};
//		Salida.mostrar(Vectores.merge(a, b));
		
		int i, filaFicha = 5, columnaFicha = 7;
		char[][] tablero = new char[8][8];
		char[] victimas;
		char[] fichas = {'A', 'T', 'C', 'p', 'P'};
		int[][] posiciones = {{5, 7},
							  {5, 3},
							  {4, 7},
							  {2, 6},
							  {3, 1}};
		Ajedrez.cargarPartida(tablero, fichas, posiciones);
		Ajedrez.mostrar(tablero);
		System.out.println();
		victimas = Ajedrez.explorar(tablero, filaFicha, columnaFicha);
		
		if (victimas.length > 0) {
			for (i = 0; i < victimas.length; i++)
				System.out.print(victimas[i] + " ");
			System.out.println();
		} else {
			System.out.println("> No hay fichas al alcance");
		}
	}		
}
