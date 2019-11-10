package program.vectores;
import java.util.Scanner;

public class CaracteresFrase {

	public static void main(String[] args) {
		char[] frase;
		char[] caracteres = new char[0]; // Guarda los caracteres sin repetición
		char[] ncaracteres;
		int[] cantidad = new int[0]; // Guarda cuántas veces se repite un caracter en la frase
		int[] ncantidad;
		int i = 0;
		int j = 0;
		int k = 0;
		boolean existe = false;
		Scanner teclado = new Scanner(System.in);
		
		// Petición de la frase original
		System.out.print("> Introduzca la fase a analizar: ");
		frase = teclado.nextLine().toCharArray();
		teclado.close();
		System.out.println();
		
		// Recorremos la frase para contar los caracteres		
		while (i < frase.length) {
			j = 0;
			// Buscamos a ver si ya habíamos encontrado anteriormente un caracter dado
			while (j < caracteres.length && !existe) {
				if (caracteres[j] == frase[i]) {
					existe = true;
				} else {
					j++;
				}
			}
			// Si es la primera vez que encontramos un caracter, lo añadimos al listado
			// redimensionando los vectores e insertando por el final
			if (!existe) {
				ncaracteres = new char[caracteres.length + 1];
				for (k = 0; k < caracteres.length; k++)
					ncaracteres[k] = caracteres[k];
				caracteres = ncaracteres;
				caracteres[caracteres.length - 1] = frase[i];
				
				ncantidad = new int[cantidad.length + 1];
				for (k = 0; k < cantidad.length; k++)
					ncantidad[k] = cantidad[k];
				cantidad = ncantidad;
				cantidad[cantidad.length - 1] = 1;
			} else {
				// En caso de no ser la primera vez que encontramos el caracter, lo incrementamos en su posición
				cantidad[j]++;
			}
			i++;
			existe = false;
		}
		
		// Mostramos el resultado en formato tabla
		i = 0;
		System.out.printf("%8s%13s", "CARACTER", "CANTIDAD\n");
		System.out.printf("%8s%13s", "--------", "--------\n");
		while (i < cantidad.length) {
			System.out.printf("%5c%6s%5d\n", caracteres[i], "-", cantidad[i]);
			i++;
		}
	}

}