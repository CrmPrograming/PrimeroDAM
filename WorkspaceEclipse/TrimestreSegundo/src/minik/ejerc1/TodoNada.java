package minik.ejerc1;

import java.util.Scanner;

public class TodoNada {
	
	private static int lecturaFilas() {
		int filas;
		Scanner in = new Scanner(System.in);
		
		System.out.print("> Introduzca el nº de filas: ");
		filas = in.nextInt();
		
		if (filas < 1 || filas > 15)
			throw new RuntimeException("ERROR: Se esperaba un número de filas dentro del rango [1, 15]");
		
		return filas;
	}
	
	public static void main(String[] args) {		
		int nFilasMaximas;
		int filas, espacios, oes;		
		
		nFilasMaximas = lecturaFilas();
		
		for (filas = 0; filas < nFilasMaximas; filas++) {
			for (espacios = 0; espacios < (nFilasMaximas - 1) - filas; espacios++)
				System.out.print(" ");
			
			System.out.print("*");
			
			for (oes = 0; oes < filas; oes++)
				System.out.print("O");
			
			System.out.println("*");
		}

	}

}
