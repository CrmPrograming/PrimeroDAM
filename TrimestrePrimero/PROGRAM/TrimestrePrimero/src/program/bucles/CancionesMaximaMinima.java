package program.bucles;
import java.util.Scanner;

/*
 *  Leer una secuencia de canciones como minutos y segundos
 *  hasta encontrar una canción “nula” (minutos y segundos 
 *  igual a cero). Una vez encontrada la canción nula, 
 *  devolver la duración de la canción más larga y la más corta.
 *  
 *  Alumno: César Ravelo Martínez
 *  Fecha: 11 de Octubre 2019
 */

public class CancionesMaximaMinima {
	
	public static void main(String[] args) {
		// Declaración de variables iniciales
		int minutosMaximo = -1;
		int segundosMaximo = -1;
		int mejorConversionMaxima = -1;
		int minutosMinimo = 60;
		int segundosMinimo = 60;
		int mejorConversionMinima = Integer.MAX_VALUE;
		int actualMinutos;
		int actualSegundos;
		int actualCancionConvertida = 0;
		final int SEGUNDO_NULO = 0;
		final int MINUTO_NULO = 0;
		final int SEGUNDOS_MINUTO = 60;
		Scanner teclado = new Scanner(System.in);
		
		// Pregunta anticipada
		System.out.println("> Bienvenido. Introduzca las canciones según se le vaya pidiendo o tiempo 0:00 para acabar.");
		System.out.print("- Introduzca la canción (minutos): ");
		actualMinutos = teclado.nextInt();
		System.out.print("+ Introduzca la canción (segundos): ");
		actualSegundos = teclado.nextInt();
		
		// Búsqueda y comprobación de canciones máxima y mínima
		while (actualMinutos != MINUTO_NULO || actualSegundos != SEGUNDO_NULO) {
			actualCancionConvertida = (actualMinutos * SEGUNDOS_MINUTO) + actualSegundos;
			// Comprobación del máximo
			if (actualCancionConvertida > mejorConversionMaxima) {
				mejorConversionMaxima = actualCancionConvertida;
				minutosMaximo = actualMinutos;
				segundosMaximo = actualSegundos;
			}
			// Comprobación del mínimo
			if (actualCancionConvertida < mejorConversionMinima) {
				mejorConversionMinima = actualCancionConvertida;
				minutosMinimo = actualMinutos;
				segundosMinimo = actualSegundos;
			}
			System.out.print("- Introduzca la canción (minutos): ");
			actualMinutos = teclado.nextInt();
			System.out.print("+ Introduzca la canción (segundos): ");
			actualSegundos = teclado.nextInt();
		}
		teclado.close();
		
		// Mostrar solución del problema
		if (minutosMaximo == -1 && segundosMinimo == SEGUNDOS_MINUTO) {
			System.out.println("\n> No se introdujo ninguna canción");
		} else {
			System.out.printf("> Canción más larga: %02d:%02d\n", minutosMaximo, segundosMaximo);
			System.out.printf("> Canción más corta: %02d:%02d\n", minutosMinimo, segundosMinimo);
		}
	}

}
