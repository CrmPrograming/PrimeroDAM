package program.vectores;
import java.util.Scanner;

/**
 */
public class MostrarVectorCiclo {

	/**
	 * @param args
	 */
	public static void main(String[] args) {

		final int MAX_NUMEROS = 10;
		final double COD_PARADA = 999;
		double[] datos = new double[MAX_NUMEROS];
		double actual = 0d;
		int cantidadValores = 0;
		int pos;
		int i = 0;
		Scanner teclado = new Scanner(System.in);
		
		// Petición de datos al usuario hasta introducir 10 valores o 999
		System.out.println("> Introduzca hasta " + MAX_NUMEROS + " o " + COD_PARADA + " para terminar");
		System.out.print("+ Dato " + (cantidadValores + 1) + ": ");
		actual = teclado.nextDouble();
		while ((cantidadValores < (datos.length - 1)) && (actual != COD_PARADA)) {
			datos[cantidadValores] = actual;
			cantidadValores = cantidadValores + 1;
			System.out.print("+ Dato " + (cantidadValores + 1) + ": ");
			actual = teclado.nextDouble();
		}
		// Leemos el valor 10 aparte
		if (actual != COD_PARADA) {
			datos[cantidadValores] = actual;
			cantidadValores = cantidadValores + 1;
		}
		// En caso de haber dado  mínimo un valor, mostramos la lista
		if (cantidadValores > 0) {
			System.out.print("> Introduzca la posición de inicio: ");
			pos = teclado.nextInt();
			System.out.println("> La lista de valores en ciclo desde la posición " + pos + " es:");
			System.out.print(datos[pos] + " ");
			i = (pos + 1) % cantidadValores;
			while (i != pos) {
				System.out.print(datos[i] + " ");
				i = (i + 1) % cantidadValores;
			}
		} else {
			System.out.println("> No se introdujo ningún valor");
		}
		teclado.close();
	}

}
