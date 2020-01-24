package github.crmprograming.primerodam.trimestreprimero.program.bucles;
import java.util.Scanner;

public class CancionesMaximaMinimaTitulo {
	
	public static void main(String[] args) {		
		// Declaración inicial de las variables
		final int T_INF_BAJO = -1;
		final int SEGUNDOS_MINUTO = 60;		
		int minutosMaximo = T_INF_BAJO;
		int segundosMaximo = T_INF_BAJO;
		int mejorConversionMaxima = T_INF_BAJO;
		int minutosMinimo = SEGUNDOS_MINUTO;
		int segundosMinimo = SEGUNDOS_MINUTO;
		int mejorConversionMinima = Integer.MAX_VALUE;
		int actualMinutos;
		int actualSegundos;
		int actualCancionConvertida = 0;
		String tituloMinima = "";
		String tituloMaxima = "";
		String tituloActual = "";
		
		final String CONDICION_PARADA = "";
		Scanner teclado = new Scanner(System.in);
		
		// Comienzo del programa
		System.out.println("> Bienvenido. Introduzca las canciones según se le vaya pidiendo o pulse Enter para acabar.");
		System.out.print("# Introduzca el título de la canción: ");
		tituloActual = teclado.nextLine();	
			
		// Mientras no se introduzca la condición de parada, seguir preguntando canciones
		while (!tituloActual.equals(CONDICION_PARADA)) {
			System.out.print("- Introduzca la canción (minutos): ");
			actualMinutos = teclado.nextInt();
			System.out.print("+ Introduzca la canción (segundos): ");
			actualSegundos = teclado.nextInt();
			// Limpiar el buffer de Scanner
			teclado.nextLine();
			
			// Conversión de minutos a segundos
			actualCancionConvertida = (actualMinutos * SEGUNDOS_MINUTO) + actualSegundos;
			// Comprobación de max-min 
			
			if (actualCancionConvertida > mejorConversionMaxima) {
				mejorConversionMaxima = actualCancionConvertida;
				minutosMaximo = actualMinutos;
				segundosMaximo = actualSegundos;
				tituloMaxima = tituloActual;
			}
			if (actualCancionConvertida < mejorConversionMinima) {
				mejorConversionMinima = actualCancionConvertida;
				minutosMinimo = actualMinutos;
				segundosMinimo = actualSegundos;
				tituloMinima = tituloActual;
			}
			System.out.println();
			System.out.print("# Introduzca el título de la canción: ");
			tituloActual = teclado.nextLine();				
		}		
		teclado.close();
		System.out.println();
		
		// Comprobar si al menos una canción fue introducida
		if (minutosMaximo == T_INF_BAJO && minutosMinimo == SEGUNDOS_MINUTO) {
			System.out.println("\n> No se introdujo ninguna canción");
		} else {
			System.out.printf("> Canción más larga: \"%s\" [%02d:%02d]\n", tituloMaxima, minutosMaximo, segundosMaximo);
			System.out.printf("> Canción más corta: \"%s\" [%02d:%02d]\n", tituloMinima, minutosMinimo, segundosMinimo);
		}
	}

}
