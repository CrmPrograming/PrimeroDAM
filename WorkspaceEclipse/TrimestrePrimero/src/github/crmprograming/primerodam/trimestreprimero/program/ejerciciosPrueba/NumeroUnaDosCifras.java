package github.crmprograming.primerodam.trimestreprimero.program.ejerciciosPrueba;
import java.util.Scanner;

public class NumeroUnaDosCifras {

	public static void main(String[] args) {
		Scanner teclado = new Scanner(System.in);
		int numero = 0;
		
		System.out.print("> Introduzca un número entero de 1 a 99: ");
		numero = teclado.nextInt();
		System.out.println();		
		teclado.close();
		
		if (numero > 9) {
			System.out.println("> El número es de dos cifras");
		} else {
			System.out.println("> El número es de una cifra");
		}

	}

}
