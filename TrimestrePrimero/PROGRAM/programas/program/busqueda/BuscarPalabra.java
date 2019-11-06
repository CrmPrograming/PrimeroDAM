package program.busqueda;

import java.util.Scanner;

public class BuscarPalabra {

	public static void main(String[] args) {
		// Declaración inicial de variables
		char[] texto;
		char[] palabra;
		String sPalabra;
		int i = 0;
		Scanner in = new Scanner(System.in);
		
		// Petición de datos al usuario
		System.out.println("> Introduzca el texto a analizar:");
		texto = in.nextLine().toCharArray();
		System.out.print("> Introduzca la palabra a buscar: ");
		sPalabra = in.nextLine();
		palabra = sPalabra.toCharArray();
		in.close();
		
		// Buscamos hasta no tener más caracteres o haber encontrado la palabra
		while (palabra.length + i < texto.length && !(palabra[0] == texto[i] && palabra[1] == texto[i+1] && palabra[2] == texto[i+2]))			
			i++;		
		
		// En caso de haber encontrado la palabra, damos su posición
		if (palabra[0] == texto[i] && palabra[1] == texto[i+1] && palabra[2] == texto[i+2]) {
			System.out.println("> La palabra fue encontrada en la posición " + i);
		} else {
			System.out.println("> No se ha encontrado la palabra " + sPalabra);
		}

	}

}
