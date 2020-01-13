package ejerciciosNavidad;

import java.util.Scanner;

/*
 * Realizar un programa que lea los lados de n triángulos, e informar:
 * a) De cada uno de ellos, qué tipo de triángulo es: equilátero (tres lados iguales), isósceles (dos lados iguales), o escaleno (ningún lado igual)
 * b) Cantidad de triángulos de cada tipo.
 * c) Tipo de triángulo que posee menor cantidad.
 */

public class Ejercicio6 {
	
	/*
	 * Método encargado de leer los datos de los triángulos
	 */
	public static int[][] cargarTriangulos() {
		final int LADOS = 3;
		int[][] datos = null;
		int cantidad, i, j;
		Scanner in = new Scanner(System.in);
		
		// Leemos la cantidad de triángulos a estudiar, n
		System.out.print("> Introduzca la cantidad de triángulos a estudiar: ");
		cantidad = in.nextInt();
		
		datos = new int[cantidad][LADOS];
		
		// Leemos los lados de los n triángulos
		for (i = 0; i < cantidad; i++) {
			System.out.printf("> Triángulo %d\n", i + 1);
			
			for (j = 0; j < LADOS; j++) {
				System.out.printf("- Lado %d: ", j + 1);
				datos[i][j] = in.nextInt();
			}
			
		}
		
		in.close();
		return datos;
	}
	
	/*
	 * Método encargado de identificar el tipo de triángulo dado por parámetro.
	 */
	public static int identificarTriangulo(int[] t) {
		final int EQUILATERO = 0, ISOSCELES = 1, ESCALENO = 2;
		int tipo = -1;
		
		if (t[0] == t[1] && t[0] == t[2])
			tipo = EQUILATERO;
		else if (t[0] == t[1] || t[0] == t[2] || t[1] == t[2])
			tipo = ISOSCELES;
			else
				tipo = ESCALENO;			
		
		return tipo;		
	}
	
	/*
	 * Método encargado de mostrar los datos de los triángulos
	 * contenidos en t, además de sus tipos y la cantidad de cada uno
	 * junto con especificar de qué tipo hay menos triángulos.
	 */
	public static void mostrarTriangulos(int[][] t) {
		final int EQUILATERO = 0, ISOSCELES = 1, ESCALENO = 2;
		int tEqui = 0, tIsos = 0, tEsc = 0;
		int i;
		
		// Mostramos todos los triángulos y sus datos, además del tipo
		for (i = 0; i < t.length; i++) {
			System.out.printf("> Triángulo %d\n", i + 1);
			System.out.printf("- Lados: [%d %d %d]\n", t[i][0], t[i][1], t[i][2]);
			System.out.printf("- Tipo: ");
			
			switch (identificarTriangulo(t[i])) {
				case EQUILATERO:
					System.out.println("Equilátero");
					tEqui++;
					break;
				case ISOSCELES:
					System.out.println("Isósceles");
					tIsos++;
					break;
				case ESCALENO:
					System.out.println("Escaleno");
					tEsc++;
					break;
			}
			
		}
		
		// Mostramos la cantidad de cada tipo de triángulo
		System.out.println();
		System.out.printf("> Equiláteros: %d\n", tEqui);
		System.out.printf("> Isósceles: %d\n", tIsos);
		System.out.printf("> Escalenos: %d\n", tEsc);
		
		// Mostramos el triángulo del que menos hay
		System.out.printf("> Menor Tipo: ");
		switch (menor(tEqui, tIsos, tEsc)) {
			case EQUILATERO:
				System.out.println("Equilátero");
				tEqui++;
				break;
			case ISOSCELES:
				System.out.println("Isósceles");
				tIsos++;
				break;
			case ESCALENO:
				System.out.println("Escaleno");
				tEsc++;
				break;
		}
		
	}
	
	/*
	 * Método encargado de determinar el tipo de triángulo del que hay menor cantidad.
	 */
	public static int menor(int tEquilateros, int tIsosceles, int tEscalenos) {
		final int EQUILATERO = 0, ISOSCELES = 1, ESCALENO = 2;
		int tipoMenor = -1;
		
		if (tEquilateros < tIsosceles) {
			if (tEquilateros < tEscalenos)
				tipoMenor = EQUILATERO;
			else
				tipoMenor = ESCALENO;
		} else {
			if (tIsosceles < tEscalenos)
				tipoMenor = ISOSCELES;
			else
				tipoMenor = ESCALENO;
		}
		
		return tipoMenor;		
	}

	public static void main(String[] args) {
		int[][] triangulos = cargarTriangulos();
		
		mostrarTriangulos(triangulos);
	}

}
