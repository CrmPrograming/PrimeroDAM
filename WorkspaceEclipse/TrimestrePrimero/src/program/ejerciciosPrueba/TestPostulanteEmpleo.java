package program.ejerciciosPrueba;
import java.util.Scanner;

public class TestPostulanteEmpleo {

	public static void main(String[] args) {
		Scanner teclado = new Scanner(System.in);
		int totalPreguntas, preguntasAcertadas;
		float porcentaje;
		final int CIEN = 100;
		final int PORCENTAJE_90 = 90;
		final int PORCENTAJE_75 = 75;
		final int PORCENTAJE_50 = 50;
		
		System.out.print("> Introduzca la cantidad de preguntas: ");
		totalPreguntas = teclado.nextInt();
		System.out.println();
		System.out.print("> Introduzca la cantidad de preguntas acertadas: ");
		preguntasAcertadas = teclado.nextInt();		
		teclado.close();
		System.out.println();
		
		// Calculamos el porcentaje resultante mediante la fórmula
		// porcentaje = (100 x acertadas) / total

		porcentaje = (CIEN * preguntasAcertadas) / totalPreguntas;
		
		if (porcentaje >= PORCENTAJE_90) {
			System.out.println("> Nivel máximo");
		} else if (porcentaje >= PORCENTAJE_75) {
			System.out.println("> Nivel medio");
		} else if (porcentaje >= PORCENTAJE_50) {
			System.out.println("> Nivel regular");
		} else {
			System.out.println("> Fuera de nivel");
		}
		
	}

}
