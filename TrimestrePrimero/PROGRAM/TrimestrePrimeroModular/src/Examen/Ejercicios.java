package Examen;
import java.util.Scanner;

/**
 * Clase con los ejercicios resueltos para el examen del día 02/12/2019
 * 1º DAM A
 * 
 * @author César Ravelo Martínez
 *
 */
public class Ejercicios {
	
	// FUNCIONES PARA EL EJERCICIO 1 //
	
	/**
	 * Método encargado de pedir los datos por teclado necesarios para
	 * la ejecución del ejercicio 1 del examen
	 * 
	 * @return Vector de enteros con los valores solicitados al usuario
	 */
	public static int[] pedirDatos() {
		// Declaración inicial de variables, constantes y vectores
		final int CANTIDAD = 20;
		Scanner in = new Scanner(System.in);
		int[] valores = new int[CANTIDAD];
		int i;
		
		System.out.printf("> Introduzca los %d elementos a continuación:\n", CANTIDAD);
		
		// Petición de los n términos de la secuencia
		for (i = 0; i < CANTIDAD; i++) {
			System.out.printf("- Valor %d: ", i+1);
			valores[i] = in.nextInt();
		}
		
		in.close();
		
		return valores;
	}
	
	/**
	 * Método encargado de mostrar los valores dados como una secuencia según los
	 * criterios del enunciado del ejercicio 1
	 * 
	 * @param datos Vector de enteros con los valores a mostrar la secuencia
	 */
	public static void mostrarSecuencia(int[] datos) {
		// Declaración inicial de variables, constantes y vectores
		int i;
		int sumaActual = 0;
		final int LIMIT = 100;
		
		System.out.println("> A continuación se procederá a mostrar la secuencia de valores:\n");
		
		// Mostramos las secuencias de datos
		for (i = 0; i < datos.length; i++) {
			System.out.printf("%d ", datos[i]);
			sumaActual = sumaActual + Math.abs(datos[i]);
			// En caso de alcanzar una secuencia superior al valor límite,
			// realizamos un salto de línea
			if (sumaActual > LIMIT) {
				System.out.printf("\\%d\\\n", sumaActual);
				sumaActual = 0;
			}
		}
		// Mostramos la suma absoluta de los últimos valores
		System.out.printf("\\%d\\\n", sumaActual);			
	}
	
	// FUNCIONES PARA EL EJERCICIO 2 //
	
	/**
	 * Método encargado de normalizar una hora según los criterios del
	 * ejercicio 2.
	 *  
	 * @param segundos Tiempo en segundos transcurridos desde las 00:00:00
	 * @return Vector de enteros donde cada posición se corresponde a [HORAS, MINUTOS, SEGUNDOS]
	 */
	public static int[] normaliza(long segundos) {
		// Declaración inicial de variables, constantes y vectores
		int[] tiempoNormalizado = new int[3];
		final int SEGUNDOS_MINUTO = 60, SEGUNDOS_HORA = 3600, HORAS_DIA = 24;
		final int HORAS = 0, MINUTOS = 1, SEGUNDS = 2;
		int segundosTemporales, segundosSobrantes, minutosTemporales, minutosSobrantes, horasTemporales;
		
		// Cálculo de los segundos
		segundosTemporales = (int) segundos % SEGUNDOS_MINUTO;		
		tiempoNormalizado[SEGUNDS] = segundosTemporales % SEGUNDOS_MINUTO;
		
		// Guardamos los segundos sobrantes para sumarlos a los minutos
		segundosSobrantes = (int) Math.ceil(segundosTemporales / SEGUNDOS_MINUTO);
		
		// Cálculo de los minutos
		minutosTemporales = ((int) Math.ceil(segundos / SEGUNDOS_MINUTO)) + segundosSobrantes;
		tiempoNormalizado[MINUTOS] = minutosTemporales % SEGUNDOS_MINUTO;	

		// Guardamos los minutos sobrantes para sumarlos a las horas
		minutosSobrantes = (int) Math.ceil(minutosTemporales / SEGUNDOS_MINUTO);
		
		// Cálculo de las horas
		horasTemporales = ((int) Math.ceil(segundos / SEGUNDOS_HORA)) + minutosSobrantes;
		tiempoNormalizado[HORAS] = horasTemporales % HORAS_DIA;
		
		return tiempoNormalizado;
	}
	
	// FUNCIONES PARA EL EJERCICIO 3 //
	
	/**
	 * Método encargado de mostrar la salida solicitada
	 * para el ejercicio 3 del exámen 
	 * 
	 * @param tam Tamaño respecto al cual se mostrará la salida
	 */
	public static void imprimir(int tam) {
		// Declaración inicial de variables
		int i, j;
		
		// Mostramos la salida solicitada para tam elementos
		for (i = 0; i < tam; i++) {
			j = 0;
			// Mostramos los términos Y hasta la columna anterior
			// de la diagonal
			while (j < (tam - 1) - i) {
				System.out.print('Y');
				j++;
			}
			// Mostramos los términos X hasta completar la fila
			while (j < tam) {
				System.out.print('O');
				j++;
			}
			System.out.println();
		}
		
	}
	
	/**
	 * Método main de la aplicación
	 * 
	 * @param args Argumentos iniciales de la aplicación
	 */
	public static void main(String[] args) {
		// Declaraciones ejercicio 1		
		int[] secuencia = pedirDatos();
		
		// Declaraciones ejercicio 2
		// Tiempo 4:22:55
		final int HORAS = 0, MIN = 1, SEGUND = 2;
		long segundos = 8575l;
		int[] horaNormalizada;
		
		// Declaraciones ejercicio 3
		final int TAM_0 = 0, TAM_1 = 1, TAM_7 = 7, TAM_10 = 10;
		
		// Ejercicio 1
		System.out.println("##### EJECUCIONES EJERCICIO 1 ####");
		mostrarSecuencia(secuencia);
		
		// Ejercicio 2		
		System.out.println("##### EJECUCIONES EJERCICIO 2 ####");
		horaNormalizada = normaliza(segundos);
		System.out.printf("%d:%d:%d\n\n", horaNormalizada[HORAS], horaNormalizada[MIN], horaNormalizada[SEGUND]);
		
		// Ejercicio 3
		System.out.println("##### EJECUCIONES EJERCICIO 3 ####");
		// Prueba para tamaño 0
		System.out.println("> Tamaño 0");
		imprimir(TAM_0);
		System.out.println();
		// Prueba para tamaño 1
		System.out.println("> Tamaño 1");
		imprimir(TAM_1);
		System.out.println();
		// Prueba para tamaño 7
		System.out.println("> Tamaño 7");
		imprimir(TAM_7);
		System.out.println();
		// Prueba para tamaño 10
		System.out.println("> Tamaño 10");
		imprimir(TAM_10);
		System.out.println();		
	}

}
