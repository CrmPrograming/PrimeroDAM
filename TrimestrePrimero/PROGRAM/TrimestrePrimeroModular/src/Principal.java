import java.util.InputMismatchException;
import java.util.NoSuchElementException;
import java.util.Scanner;

import funciones.matematicas.Matematicas;

public class Principal {

	/**
	 * Dado un vector de datos y una cantidad, devuelve otro vector con todos esos
	 * datos del mismo tamaño que la cantidad indicada
	 * 
	 * @param datos    Vector con los valores a copiar
	 * @param cantidad Tamaño del vector a copiar
	 * @return Vector del tamaño indicado con los valores ya copiados
	 */
	public static float[] ajustarVector(float[] datos, int cantidad) {
		float[] v = new float[cantidad];
		int i;

		for (i = 0; i < cantidad; i++)
			v[i] = datos[i];

		return (v);
	}

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
				datos[i] = actual;
				i++;
			} catch (InputMismatchException e) {
				// En caso de haber leído un valor no numérico
				teclado.next();
			} catch (NoSuchElementException e) {
				// En caso de terminarse el flujo de datos, forzamos a parar
				actual = PARADA;
			}
		} while (i < LIMIT - 1 && actual != PARADA);

		if (actual != PARADA) {
			datos[i] = actual;
			i++;
		}

		teclado.close();

		// Ajustamos el vector reduciendo su tamaño hasta la cantidad de elementos
		// insertada
		datos = ajustarVector(datos, i);

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
