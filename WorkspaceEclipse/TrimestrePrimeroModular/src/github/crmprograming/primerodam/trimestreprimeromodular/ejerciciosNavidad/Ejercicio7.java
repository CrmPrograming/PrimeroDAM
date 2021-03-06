package github.crmprograming.primerodam.trimestreprimeromodular.ejerciciosNavidad;

import java.util.Scanner;

/*
 * Confeccionar un programa que lea n pares de datos, cada par de datos corresponde a la medida de la base y la altura de un triángulo. El programa deberá informar:
 * a) De cada triángulo la medida de su base, su altura y su superficie.
 * b) La cantidad de triángulos cuya superficie es mayor a 12.
 */

public class Ejercicio7 {

	/*
	 * Método encargado de calcular el área de un triángulo dadas la base y su altura
	 */
	public static float area(float b, float h) {
		return (b*h) / 2;
	}
	
	/*
	 * Método encargado de mostrar los datos de los triángulos contenidos en t.
	 * Además, también mostrará la cantidad de triángulos cuya superficie sea mayor al
	 * límite establecido.
	 */
	public static void mostrarDatos(float[][] t) {
		final int BASE = 0, ALTURA = 1, LIMITE_SUPERFICIE = 12;
		int i, cantidadSuperiores = 0;
		float superficieActual = 0f;
		
		// Mostramos los triángulos y sus datos
		for (i = 0; i < t.length; i++) {
			System.out.printf("> Datos Triángulo %d\n", i + 1);
			System.out.printf("- Base: %f\n", t[i][BASE]);			 
			System.out.printf("- Altura: %f\n", t[i][ALTURA]);
			superficieActual = area(t[i][BASE], t[i][ALTURA]);
			System.out.printf("- Superficie: %f\n", superficieActual);
			if (superficieActual > LIMITE_SUPERFICIE)
				cantidadSuperiores++;
			System.out.println();
		}
		
		// En caso de haber algún triángulo cuya superficie sea mayor a la establecida,
		// mostramos cuántos cumplen dicho requisito.
		if (cantidadSuperiores > 0) {
			System.out.printf("> Cantidad de triángulos con superficie " +
					"superior a %d: %d\n", LIMITE_SUPERFICIE, cantidadSuperiores);
		}
		
	}
	
	/*
	 * Método encargado de leer por la entrada estandar los datos de los triángulos.
	 */
	public static float[][] cargarDatos() {
		final int BASE_ALTURA = 2, BASE = 0, ALTURA = 1;
		float[][] datos = null;
		int totalDatos, i;
		Scanner in = new Scanner(System.in);
		
		System.out.print("> Introduzca la cantidad de pares a leer: ");
		totalDatos = in.nextInt();
		
		datos = new float[totalDatos][BASE_ALTURA];
		
		for (i = 0; i < totalDatos; i++) {
			System.out.printf("> Datos Triángulo %d\n", i + 1);
			System.out.print("- Base: ");
			datos[i][BASE] = in.nextFloat();
			System.out.print("- Altura: ");
			datos[i][ALTURA] = in.nextFloat();
			System.out.println();
		}		
		
		in.close();
		
		return datos;
	}

	public static void main(String[] args) {
		float[][] triangulos = cargarDatos();
		
		mostrarDatos(triangulos);

	}

}
