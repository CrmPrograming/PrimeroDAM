import java.util.InputMismatchException;
import java.util.NoSuchElementException;
import java.util.Scanner;

import github.crmprograming.primerodam.trimestreprimeromodular.funciones.Vectores;
import github.crmprograming.primerodam.trimestreprimeromodular.funciones.matematicas.Matematicas;

public class PruebasTryCatchMedia {

	/**
	 * Método encargado de probar el código donde se utilizan bloques try-catch a
	 * fin de controlar la excepción producida al calcular la media de una secuencia
	 * vacía de valores.
	 */
	public static void tryCatchMedia() {
		final int LIMIT = 100, PARADA = 999;
		float[] datos = new float[LIMIT];
		Scanner teclado = new Scanner(System.in);
		int i = 0;
		float actual = 0f;

		// Lectura de los n-elementos
		System.out.printf("> Introduzca hasta %d elementos o %d:\n", LIMIT, PARADA);		

		do {
			try {
				System.out.printf("- Elemento %d: ", i + 1);
				actual = teclado.nextFloat();
				if (actual != 999) {
					datos[i] = actual;
					i++;
				}
			} catch (InputMismatchException e) {
				// En caso de haber leído un valor no numérico
				teclado.next();
			} catch (NoSuchElementException e) {
				// En caso de terminarse el flujo de datos, forzamos a parar
				actual = PARADA;
				System.out.println();
			}
		} while (i < LIMIT && actual != PARADA);

		teclado.close();

		// Ajustamos el vector reduciendo su tamaño hasta la cantidad de elementos
		// insertada
		datos = Vectores.ajustarVector(datos, i);

		// Calculamos la media
		try {
			System.out.printf("> La media de los valores dados es %f\n", Matematicas.media(datos));
		} catch (NullPointerException e) {
			// En caso de intentar calcular la media de una secuencia vacía de valores
			System.out.print("! Se produjo un error. ");
			System.out.println("Esperada una lista de valores para calcular la media, no se obtuvo ninguno");
		}

	}
	
	public static void main(String[] args) {
		tryCatchMedia();

	}

}
