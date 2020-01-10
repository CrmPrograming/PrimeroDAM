package ejerciciosNavidad;

import java.util.Scanner;

/*
 * EJERCICIO 2
 * 
 * 	Crear una matriz de n * m filas (cargar n y m por teclado)
 * Imprimir los cuatro valores que se encuentran en los vértices de la misma (mat[0][0] etc.)
 */

public class Ejercicio2 {
	
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
	
	public static void mostrarExtremos(int[][] m) {
		
		System.out.printf("| %d %d |\n", m[0][0], m[0][m[0].length - 1]);
		System.out.printf("| %d %d |\n", m[m.length - 1][0], m[m.length - 1][m[0].length - 1]);
		
	}
	
	public static int[][] leerDatos() {
		int[][] t = null;
		int n, m, i, j;
		Scanner in = new Scanner(System.in);
		
		System.out.print("> Introduzca las dimensiones de la matriz separados por espacio: ");
		n = in.nextInt();
		m = in.nextInt();		
		
		t = new int[n][m];		
		
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
