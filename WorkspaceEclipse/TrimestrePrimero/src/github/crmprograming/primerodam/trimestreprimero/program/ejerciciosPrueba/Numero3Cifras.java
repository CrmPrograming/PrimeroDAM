package github.crmprograming.primerodam.trimestreprimero.program.ejerciciosPrueba;
import java.util.Scanner;

public class Numero3Cifras {

	public static void main(String[] args) {
		Scanner teclado = new Scanner(System.in);
		int numero = 0;
		final int LIMITE_UNA_CIFRA = 10;
		final int LIMITE_DOS_CIFRAS = 100;
		final int LIMITE_TRES_CIFRAS = 1000;
		
		System.out.print("> Introduzca el número a evaluar: ");
		numero = teclado.nextInt();
		teclado.close();
		System.out.println();
		
		if (numero < LIMITE_UNA_CIFRA) {
			System.out.println("> ERROR. El número es de 1 cifra");
		} else if (numero < LIMITE_DOS_CIFRAS) {
			System.out.println("> ERROR. El número es de 2 cifras");
		} else if (numero < LIMITE_TRES_CIFRAS) {
			System.out.println("> ERROR. El número es de 3 cifras");
		} else {
			System.out.println("> ERROR. El número es mayor de 3 cifras");
		}

	}

}
