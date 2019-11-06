package program.busqueda;
import java.util.Scanner;

/*
 *   - Autor: César Ravelo Martínez
 *   - Fecha: 28/10/2019
 *   
 *   Suponemos una tabla de tamaño 7 de enteros con los valores.
 *   
 *   El usuario facilitará el código de la isla que necesita y se le responde
 *   dando el nombre de la isla correspondiente o bien decir que no corresponde a ninguna isla
 */

public class BuscadorIslaOrdenada {

	public static void main(String[] args) {
		// Declaración de variables
		final int[] COD_ISLAS = {28, 35, 36, 40, 89, 103, 150};
		final String[] NOM_ISLAS = {"Tenerife", "Gran Canaria", "La Palma", "El Hierro", "La Gomera", "Fuerteventura", "Lanzarote"};
		int codBusqueda;
		int izq = 0;
		int dere = COD_ISLAS.length - 1;
		int medio = (izq + dere) / 2;
		Scanner teclado = new Scanner(System.in);
		
		// Solicitud de datos al usuario		
		System.out.print("> Introduzca el código de la isla a buscar: ");
		codBusqueda = teclado.nextInt();
		System.out.println();
		teclado.close();
		
		// Búsqueda del código de la isla asociada		
		while (codBusqueda != COD_ISLAS[medio] && izq < dere) {
			// Buscamos el valor a la izquierda del valor medio
			if (codBusqueda < COD_ISLAS[medio])
				dere = medio - 1;
			else
				izq = medio + 1;
			medio = (izq + dere)/2;
		}
		
		// Si el código existe, se muestra su isla correspondiente
		// En caso contrario, avisar de que dicho código no existe
		if (codBusqueda == COD_ISLAS[medio]) {
			System.out.printf("> La isla con el código %d es %s\n", codBusqueda, NOM_ISLAS[medio]);
		} else {
			System.out.printf("> No existe isla con el código %d", codBusqueda);
		}

	}

}
