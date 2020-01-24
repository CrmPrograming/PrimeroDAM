package github.crmprograming.primerodam.trimestreprimero.program.bucles;
import java.util.Scanner;

public class AcumuladorParesImpares {

	public static void main(String[] args) {
		final int CONDICION_PARADA = 999;		
		int pares = 0;
		int impares = 0;
		int total;
		int i = 0;
		int actual = CONDICION_PARADA;
		Scanner teclado = new Scanner(System.in);
		
		System.out.print("> Introduzca un nº o 999 para terminar: ");
		actual = teclado.nextInt();	
		while (actual != CONDICION_PARADA) {
			i++;
			if (actual % 2 == 0) {
				pares += actual;
			} else {
				impares += actual;
			}	
			System.out.print("> Introduzca un nº o 999 para terminar: ");
			actual = teclado.nextInt();
		}
		teclado.close();
		total = pares + impares;
		System.out.printf("\n> Números introducidos: %d\n", i);
		System.out.printf("> Pares: %d, Impares: %d, Total: %d\n", pares, impares, total);
	}

}
