package ejerciciosNavidad;

import java.util.Scanner;

/*
 * EJERCICIO 1
 * 
 * 	Crear una matriz de n * m filas (cargar n y m por teclado).
 * Intercambiar la primer fila con la segundo. Imprimir luego la matriz
 */

public class Ejercicio1 {
	
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
	
	public static int[][] trasponer(int[][] m) {
		int[][] t = new int[m[0].length][m.length];
		int i, j;
		
		for (i = 0; i < t.length; i++)
			for (j = 0; j < t[i].length; j++)
				t[i][j] = m[j][i];		
		
		return t;
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
		int[][] t = trasponer(m);
		
		System.out.println("\n######### Matriz normal #########");
		imprimir(m);
		System.out.println("######### Matriz traspuesta #########");
		imprimir(t);

	}

}
