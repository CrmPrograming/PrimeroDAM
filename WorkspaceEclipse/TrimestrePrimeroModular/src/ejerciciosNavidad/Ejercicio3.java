package ejerciciosNavidad;

import java.util.Scanner;

/*
 * 	EJERCICIO 3
 * 
 * 	Se desea saber la temperatura media trimestral de cuatro paises. Para ello se tiene como dato las temperaturas medias mensuales de dichos paises.
 * 	Se debe ingresar el nombre del país y seguidamente las tres temperaturas medias mensuales.
 * 	Seleccionar las estructuras de datos adecuadas para el almacenamiento de los datos en memoria.
 * 	a - Cargar por teclado los nombres de los paises y las temperaturas medias mensuales.
 * 	b - Imprimir los nombres de las paises y las temperaturas medias mensuales de las mismas.
 * 	c - Calcular la temperatura media trimestral de cada país.
 * 
 */

public class Ejercicio3 {
	
	/*
	 * Método encargado de mostrar por la salida estandar
	 * los datos contenidos en la matriz d.
	 */
	public static void mostrarDatos(String[][] d) {
		int i, j;
		
		System.out.println("##### Datos de los países #####");
		for (i = 0; i < d.length; i++) {
			for (j = 0; j < d[i].length; j++)
				System.out.print(d[i][j] + " ");
			
			System.out.println();
		}
		
	}
	
	/*
	 * Método encargado de mostrar la media trimestral
	 * en base a los datos contenidos en la matriz d.
	 */
	public static void mostrarMediaTrimestral(String[][] d) {
		final int NOMBRE = 0;
		int i;
		
		System.out.println("##### Media trimestral de los países #####");
		for (i = 0; i < d.length; i++)
			System.out.printf("%s: %+.2f\n", d[i][NOMBRE], calcularMedia(d[i]));
						
	}
	
	/*
	 * Método encargado de calcular la media de los
	 * datos contenidos en la tabla d.
	 * 
	 * NOTA: La primera posición de la tabla d contiene
	 * el nombre del país, mientras que el resto de
	 * posiciones contienen los valores para calcular la media.
	 * 
	 * Por ello, a la hora de calcular la media se hace utilizando
	 * en el denominador el nº de elementos en dicha tabla - 1
	 * para obviar la posición d[0] con el nombre del país.
	 */
	public static float calcularMedia(String[] d) {
		int i;
		float sum = 0f;
		
		// Sumatorio de todos los valores numéricos en d
		for (i = 1; i < d.length; i++)
			sum += Float.parseFloat(d[i]);
		
		return sum / (d.length - 1);
		
	}
	
	/*
	 * Método encargado de leer los datos requeridos por el programa.
	 * 
	 * NOTA: La estructura elegida para almacenar los datos será
	 * una matriz de 4 * (3 + 1). Esto se ha hecho para reservar
	 * la posición datos[i][0] para el nombre del país al que se hace
	 * referencia y el resto de columnas para la posición i, los
	 * valores numéricos de las temperaturas.
	 */
	public static String[][] leerDatos() {
		final int NUM_PAISES = 4, TOTAL_TEMPERATURAS = 3, NOM_PAIS = 0;
		String[][] datos = new String[NUM_PAISES][TOTAL_TEMPERATURAS + 1];
		int i, j;
		Scanner in = new Scanner(System.in);
		
		for (i = 0; i < NUM_PAISES; i++) {
			System.out.printf("> Introduzca el nombre del país %d: ", i + 1);
			datos[i][NOM_PAIS] = in.nextLine();
			
			// Lectura de las temperaturas
			for (j = 1; j < TOTAL_TEMPERATURAS + 1; j++) {
				System.out.printf("- Introduzca la temperatura %d: ", j);
				datos[i][j] = in.nextLine();
			}
			
		}
		
		in.close();
		
		return datos;
	}

	public static void main(String[] args) {
		String[][] datos = leerDatos();
		
		mostrarDatos(datos);
		System.out.println();
		mostrarMediaTrimestral(datos);

	}

}