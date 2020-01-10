package program.vectores;
import java.util.Scanner;

public class CaracteresFrase2 {

	public static void main(String[] args) {		
		String fraseIntroducida;
		char[] arrayCadena;
		char caracter;
		int contador;
		int i;
		int j;
		
		Scanner teclado = new Scanner(System.in);
		System.out.println("Introduzca una frase");
		System.out.println("El programa enumerará los caracteres de la frase");
		fraseIntroducida = teclado.nextLine();
		teclado.close();
		if (fraseIntroducida.length() != 0) {
			arrayCadena = fraseIntroducida.toCharArray();
			contador=1;
			for (j = 1; j <= arrayCadena.length-1; j++)	{
				if (arrayCadena[j] == arrayCadena[0]) {
					contador++;					
				}
			}
			System.out.println(arrayCadena[0]+ " " +contador);
			for (i = 1; i <= arrayCadena.length-1; i++)	{
				// arrayCadena[i] es un char aun no contabilizado 
				if (arrayCadena[i] != arrayCadena[0]) {
					caracter = arrayCadena[i];
					contador = 1;
					for (j = i+1; j <= arrayCadena.length-1; j++) {
						if (arrayCadena[j] == caracter) {							
							contador++;
							arrayCadena[j] = arrayCadena[0];
						}
					}
					System.out.println(arrayCadena[i]+ " " +contador);
				}
			}
		}
	}

}