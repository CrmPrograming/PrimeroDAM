package program.vectores;
import java.util.Scanner;

/*
 * 	Autor: César Ravelo Martínez
 * 	
 * 	Solicitar hasta 10 nº o el caracter de parada 999. Al terminar, pedir
 * 	una posición del vector y finalizar mostrando los valores en orden
 * 	inverso desde la posición dada hasta el inicio.
 */
public class MostrarSubvectorInverso {

	public static void main(String[] args) {
		final int MAX_NUMEROS = 10;
		final double COD_PARADA = 999;
		double[] datos = new double[MAX_NUMEROS];
		double actual = 0d;
		int cantidadValores = 0;
		int pos;
		int i = 0;		
		
		// Solicitud anticipada de los datos
		Scanner teclado = new Scanner(System.in);
		System.out.println("> Introduzca hasta " + MAX_NUMEROS + " o " + (int) COD_PARADA + " para terminar");
		System.out.print("+ Dato " + (cantidadValores + 1) + ": ");
		actual = teclado.nextDouble();		
		while ((cantidadValores < (MAX_NUMEROS - 1)) && (actual != COD_PARADA)) {
			datos[cantidadValores] = actual;
			cantidadValores = cantidadValores + 1;
			System.out.print("+ Dato " + (cantidadValores + 1) + ": ");
			actual = teclado.nextDouble();
		}		
		if (actual != COD_PARADA) {
			datos[cantidadValores] = actual;
			cantidadValores = cantidadValores + 1;
		}
		
		// Si se dieron valores, mostrar la lista invertida desde pos
		if (cantidadValores > 0) {
			System.out.print("> Introduzca la posición de inicio: ");
			pos = teclado.nextInt();
			System.out.println("> La lista de valores en orden inverso desde " + pos + " es:");
			for (i = (pos - 1); i >= 0; i--) {
				System.out.printf("%.2f ", datos[i]);
			}
		} else {
			System.out.println("> No se introdujo ningún valor");
		}
		teclado.close();
	}

}