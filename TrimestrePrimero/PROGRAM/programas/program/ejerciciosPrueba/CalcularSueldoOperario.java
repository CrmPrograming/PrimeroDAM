package program.ejerciciosPrueba;
import java.util.Scanner;

public class CalcularSueldoOperario {

	public static void main(String[] args) {
		Scanner teclado = new Scanner(System.in);
		float sueldo, sueldoFinal;
		int antiguedad;
		final int SUELDO_MINIMO = 500;
		final float AUMENTO_20 = 0.2f;
		final float AUMENTO_5 = 0.05f;
		
		System.out.print("> Introduzca el sueldo y la antiguedad separados por espacio: ");
		sueldo = teclado.nextFloat();
		antiguedad = teclado.nextInt();
		teclado.close();
		System.out.println();

		sueldoFinal = sueldo;
		
		if (sueldo < SUELDO_MINIMO) {
			if (antiguedad < 10) {
				sueldoFinal = sueldo + (sueldo * AUMENTO_5);
			} else {
				sueldoFinal = sueldo + (sueldo * AUMENTO_20);
			}
		}
		
		System.out.println("> Su sueldo final es: " + sueldoFinal);
		
	}

}
