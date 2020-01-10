package program.busqueda;
import java.util.Scanner;

/*
 *   - Autor: César Ravelo Martínez
 *   - Fecha: 28/10/2019
 *   
 *   Suponemos una tabla de tamaño 7 de enteros con los valores:
 *	 
 *	 61 - Tenerife
 *   20 - Gran Canaria
 *   28 - Lanzarote
 *   80 - Fuerteventura
 *   29 - El Hierro
 *   63 - La Palma
 *   25 - La Gomera
 *   
 *   El usuario facilitará el código de la isla que necesita y se le responde
 *   dando el nombre de la isla correspondiente o bien decir que no corresponde a ninguna isla
 */

public class BuscadorIsla {

	public static void main(String[] args) {
		// Declaración de variables
		final int[] COD_ISLAS = {38, 35, 26, 14, 89, 33, 50};
		final String[] NOM_ISLAS = {"Tenerife", "Gran Canaria", "La Palma", "El Hierro", "La Gomera", "Fuerteventura", "Lanzarote"};
		int codBusqueda;
		int i;
		Scanner teclado = new Scanner(System.in);
		
		// Solicitud de datos al usuario		
		System.out.print("> Introduzca el código de la isla a buscar: ");
		codBusqueda = teclado.nextInt();
		System.out.println();
		teclado.close();
		
		// Búsqueda del código de la isla asociada
		i = 0;
		while (i < COD_ISLAS.length - 1 && codBusqueda != COD_ISLAS[i])
			i++;
		
		// Si el código existe, se muestra su isla correspondiente
		// En caso contrario, avisar de que dicho código no existe
		if (codBusqueda == COD_ISLAS[i]) {
			System.out.printf("> La isla con el código %d es %s\n", codBusqueda, NOM_ISLAS[i]);
		} else {
			System.out.printf("> No existe isla con el código %d", codBusqueda);
		}

	}

}
