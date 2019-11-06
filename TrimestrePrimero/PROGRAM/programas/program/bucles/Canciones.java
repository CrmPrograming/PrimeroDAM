package program.bucles;

import java.util.Scanner;

/*
 *  Leer una secuencia de canciones como minutos y segundos
 *  hasta encontrar una canción “nula” (minutos y segundos 
 *  igual a cero). Una vez encontrada la canción nula, 
 *  devolver el promedio en minutos y segundos de la playlist introducida.
 *  
 *  Alumno: César Ravelo Martínez
 *  Fecha: 8 de Octubre 2019
 */

public class Canciones {

	public static void main(String[] args) {
		// Declaraciones iniciales
		int totalCanciones = 0;
		int minutos = 0;
		int segundos = 0;
		int actualMinutos, actualSegundos;
		int mediaMinutos, mediaSegundos;
		Scanner teclado = new Scanner(System.in);
		final int SEGUNDO_NULO = 0;
		final int MINUTO_NULO = 0;
		final int SEGUNDOS_MINUTO = 60;		
		
		// Solicitud de canciones por consola		
		System.out.println("> Bienvenido. Introduzca las canciones según se le vaya pidiendo o tiempo 0:00 para acabar.");
		System.out.print("- Introduzca la canción (minutos): ");
		actualMinutos = teclado.nextInt();
		System.out.print("+ Introduzca la canción (segundos): ");
		actualSegundos = teclado.nextInt();
		while (actualMinutos != MINUTO_NULO || actualSegundos != SEGUNDO_NULO) {
			minutos = minutos + actualMinutos;
			segundos = segundos + actualSegundos;
			totalCanciones++;
			System.out.print("- Introduzca la canción (minutos): ");
			actualMinutos = teclado.nextInt();
			System.out.print("+ Introduzca la canción (segundos): ");
			actualSegundos = teclado.nextInt();
		}
		teclado.close();
		
		// Cálculo y conversión del promedio de la playlist
		if (minutos == MINUTO_NULO && segundos == SEGUNDO_NULO) {
			System.out.println("\n> No se introdujo ninguna canción");
		} else {
			System.out.println("\n> Total canciones: " + (totalCanciones));						
			segundos = segundos + (minutos * SEGUNDOS_MINUTO);
			mediaSegundos = (int) Math.floor(segundos / totalCanciones);			
			mediaMinutos = (int) Math.floor(mediaSegundos / SEGUNDOS_MINUTO);
			mediaSegundos = mediaSegundos % SEGUNDOS_MINUTO;
			System.out.printf("> Tiempo promedio: %02d:%02d\n", mediaMinutos, mediaSegundos);
		}
	}

}
