package program.ejerciciosPrueba;
import java.util.Scanner;

public class NumeroPositivoNegativoNulo {

	public static void main(String[] args) {
		Scanner teclado = new Scanner(System.in);
		float numero = 0f;
		final float CERO = 0f;
		
		
		System.out.print("> Introduzca el número a evaluar: ");
		numero = teclado.nextFloat();		
		teclado.close();
		System.out.println();
		
		if (numero < CERO) {
			System.out.println("> El número es negativo");
		} else if (numero > CERO) {
			System.out.println("> El número es positivo");
		} else {
			System.out.println("> El número es nulo");
		}

	}

}
