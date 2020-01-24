package github.crmprograming.primerodam.trimestreprimeromodular.ejerciciosNavidad;

import java.util.Scanner;

/*
 * EJERCICIO 2
 * 
 * 	Crear una matriz de n * m filas (cargar n y m por teclado)
 * Imprimir los cuatro valores que se encuentran en los vértices de la misma (mat[0][0] etc.)
 * 
 * NOTA: Según el enunciado, se entienden los siguientes aspectos:
 * - Una matriz de dimensiones 1 * 1 tendrá sus 4 extremos en el único término existente
 * - Una matriz de orden 1 * m tendrá los extremos superiores iguales a los inferiores
 * - Una matriz de orden n * 1 tendrá los extremos izquierdos iguales a los derechos
 */
public class Ejercicio2 {
	
	/*
	 * Método encargado de mostrar por la salida estandar la matriz dada
	 * como parámetro, m.
	 */
	public static void imprimir(int[][] m) {
		int i, j;
		
		for (i = 0; i < m.length; i++) {
			System.out.printf("[ ");
			for (j = 0; j < m[i].length; j++) {
				System.out.printf("%d ", m[i][j]);
			}
			System.out.printf("]\n");
		}
		
	}
	
	/*
	 * Muestra por la salida estandar los valores extremos de la matriz m.
	 */
	public static void mostrarExtremos(int[][] m) {
		
		System.out.printf("| %d %d |\n", m[0][0], m[0][m[0].length - 1]);
		System.out.printf("| %d %d |\n", m[m.length - 1][0], m[m.length - 1][m[0].length - 1]);
		
	}
	
	/*
	 * Método encargado de leer los datos necesarios de la aplicación,
	 * devolviendo al finalizar una matriz de dimensiones n * m.
	 */
	public static int[][] leerDatos() {
		int[][] t = null;
		int n, m, i, j;
		Scanner in = new Scanner(System.in);
		
		// Lectura de dimensiones n y m
		System.out.print("> Introduzca las dimensiones de la matriz separados por espacio: ");
		n = in.nextInt();
		m = in.nextInt();
		
		t = new int[n][m];
		
		// Lectura de los valores de la tabla inicial
		System.out.println("> A continuación introduzca los valores de la matriz:");
		for (i = 0; i < n; i++) {
			for (j = 0; j < m; j++) {
				System.out.printf("[%d, %d] -> ", i + 1, j + 1);
				t[i][j] = in.nextInt();
			}
		}
		
		in.close();
		
		return t;
	}

	public static void main(String[] args) {
		int[][] m = leerDatos();
		
		System.out.println("\n######### Matriz normal #########");
		imprimir(m);
		System.out.println("######### Extremos #########");
		mostrarExtremos(m);

	}

}
