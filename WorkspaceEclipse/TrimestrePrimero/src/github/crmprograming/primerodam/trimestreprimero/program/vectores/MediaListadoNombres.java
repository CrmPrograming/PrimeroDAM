package github.crmprograming.primerodam.trimestreprimero.program.vectores;
import java.util.Scanner;

public class MediaListadoNombres {

	/**
	 * @param args
	 */
	public static void main(String[] args) {

		final String CONDICION_PARADA = "fin";
		String actual;
		int cantidadNombres = 0;
		double media = 0d;
		Scanner teclado = new Scanner(System.in);
		
		System.out.println("> Introduzca los nombres de la lista o 'fin' (sin comillas) para terminar");
		System.out.print("+ Nombre " + (cantidadNombres + 1) + ": ");
		actual = teclado.nextLine();
		while (!actual.equals(CONDICION_PARADA)) {
			media = media + actual.length();
			cantidadNombres++;
			System.out.print("+ Nombre " + (cantidadNombres + 1) + ": ");
			actual = teclado.nextLine();
		}
		System.out.println();
		teclado.close();
		if (cantidadNombres > 0) {
			media = media / (double)cantidadNombres;
			System.out.println("> La media de los tamaños de los nombres dados es: " + media);
		} else {
			System.out.println("> No se introdujo ningún nombre");
		}
	}

}
