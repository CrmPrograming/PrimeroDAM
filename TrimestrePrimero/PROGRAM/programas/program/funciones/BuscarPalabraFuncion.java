package program.funciones;
import java.util.Scanner;

public class BuscarPalabraFuncion {
	
	public static int buscarPalabra(String frase, String fragmento) {
		char[] texto;
		char[] palabra;
		String sPalabra;		
		int i = -1;
		int j;
		boolean encontrado;
		Scanner in = new Scanner(System.in);
				
		texto = frase.toCharArray();		
		sPalabra = fragmento;
		palabra = sPalabra.toCharArray();
		in.close();				

		// Buscamos la palabra en el texto
		// recorriéndolo hasta encontrarlo o no tener más caracteres
		do {
			i++;
			j = 0;
			// Si dimos con el primer caracter de la palabra,
			// analizamos los siguientes para ver si coinciden
			while (j < palabra.length - 1 && palabra[j] == texto[i + j])
				j++;
			encontrado = palabra[j] == texto[i + j];
		} while(!encontrado && palabra.length + i <= texto.length);
		
		// En caso de haber encontrado la palabra damos su posición o -1 si no
		return (encontrado?i:-1);
	}
	
	public static void main(String[] args) {
		int pos = -1;
		Scanner in = new Scanner(System.in);
		String texto, fragmento;
		System.out.println("> Introduzca el texto a analizar:");
		texto = in.nextLine();
		System.out.println("> Introduzca la palabra a buscar: ");
		fragmento = in.nextLine();
		in.close();
		pos = buscarPalabra(texto, fragmento);
		if (pos != -1) 
			System.out.println("> La palabra fue encontrada en la posición [" + pos + "]");
		else 
			System.out.println("> No se ha encontrado la palabra \"" + fragmento + "\"");
	}

}
