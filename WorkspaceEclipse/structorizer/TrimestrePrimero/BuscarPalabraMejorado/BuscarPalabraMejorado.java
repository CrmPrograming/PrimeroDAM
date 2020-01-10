import java.util.Scanner;

/*
 * 	autor: César Ravelo Martínez
 *	fecha: 4/11/2019
 * 
 * 	Dado un texto de longitud desconocida,
 * 	buscar en él una palabra de longitud desconocida.
 * 
 * 	En caso de encontrarla, dar su posición. 
 */
public class BuscarPalabraMejorado {
	
	public static void main(String[] args) {
		// Declaración inicial de variables
		char[] texto;
		char[] palabra;
		String sPalabra;
		int i = 0;
		int j;
		boolean encontrado = false;
		Scanner in = new Scanner(System.in);
		
		// Petición de datos al usuario
		System.out.println("> Introduzca el texto a analizar:");
		texto = in.nextLine().toCharArray();
		System.out.print("> Introduzca la palabra a buscar: ");
		sPalabra = in.nextLine();
		palabra = sPalabra.toCharArray();
		in.close();				

		// Buscamos la palabra en el texto
		// recorriéndolo hasta encontrarlo o no tener más caracteres
		while (palabra.length + i <= texto.length && !encontrado) {
			j = 0;
			// Si dimos con el primer caracter de la palabra,
			// analizamos los siguientes para ver si coinciden
			while (j < palabra.length && palabra[j] == texto[i + j])
				j++;			
			if (j == palabra.length)
				encontrado = true;
			else
				i++;			
		}
		
		// En caso de haber encontrado la palabra, damos su posición
		if (encontrado)
			System.out.println("> La palabra fue encontrada en la posición [" + i + "]");
		else
			System.out.println("> No se ha encontrado la palabra \"" + sPalabra + "\"");		
	}

}
