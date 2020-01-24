package github.crmprograming.primerodam.trimestreprimeromodular.ejerciciosNavidad;

import java.util.Scanner;

/*
 * Cargar un String por teclado e implementar los siguientes métodos:
 * a) Imprimir la primera mitad de los caracteres de la cadena.
 * b) Imprimir el último caracter.
 * c) Imprimirlo en forma inversa.
 * d) Imprimir cada caracter del String separado con un guión.
 * e) Imprimir la cantidad de vocales almacenadas.
 * f) Implementar un método que verifique si la cadena se lee igual de izquierda a derecha tanto como de derecha a izquierda (ej. neuquen se lee igual en las dos direcciones)
 */

public class Ejercicio4 {
	
	/*
	 * Método encargado de leer la cadena a analizar.
	 */
	public static String leerCadena() {
		String dato = "";
		Scanner in = new Scanner(System.in);
		
		System.out.print("> Introduzca la cadena a analizar: ");
		dato = in.nextLine();
		
		in.close();
		
		return dato;
	}
	

	/*
	 * Método encargado de mostrar todos los caracteres de la cadena
	 * desde el principio hasta la mitad de la misma.
	 */
	public static void mostrarMitad(String c) {
		int i;
		
		for (i = 0; i < c.length() / 2; i++)
			System.out.print(c.charAt(i));
		
		System.out.println();
		
	}
	
	/*
	 * Método encargado de mostrar el último caracter de la cadena dada.
	 */
	public static void mostrarUltimoCaracter(String c) {
		System.out.println(c.charAt(c.length() - 1));
	}
	
	/*
	 * Método encargado de mostrar la cadena de manera inversa.
	 * 
	 * NOTA: Se podría haber implementado de manera recursiva. Sin embargo,
	 * dado que no se conseguía una ventaja considerable, se ha preferido
	 * la implementación iterativa del problema.
	 */
	public static void mostrarInversa(String c) {
		int i;
		
		for (i = c.length() - 1; i >= 0; i--)
			System.out.print(c.charAt(i));
		System.out.println();
	}
	
	/*
	 * Método encargado de mostrar los caracteres de la cadena separados con guiones.
	 */
	public static void mostrarGuiones(String c) {
		int i;
		
		for (i = 0; i < c.length()-1; i++)
			System.out.printf("%s-", c.charAt(i));
		System.out.println(c.charAt(c.length() - 1));
		
	}
	
	/*
	 * Método encargado de mostrar la cantidad total de vocales en la cadena dada.
	 */
	public static void mostrarCantidadVocales(String c) {
		int i, totalVocales = 0;
		char actual;
		
		for (i = 0; i < c.length(); i++) {
			actual = c.charAt(i); 
			if (actual == 'a' || actual == 'e' || actual == 'i' || actual == 'o' || actual == 'u')
				totalVocales++;
		}
		
		
		System.out.println("> Total de vocales: " + totalVocales);
	}
	
	/*
	 * Método encargado de comprobar si la cadena dada es capicua o simétrica.
	 */
	public static boolean verificarCapicua(String c) {
		int i = 0, j = c.length() - 1;
		
		while (i < j && c.charAt(i) == c.charAt(j)) {
			i++;
			j--;
		}
		
		return !(i < j);
		
	}
	
	public static void main(String[] args) {
		String cadena = leerCadena();
		
		mostrarMitad(cadena);
		mostrarUltimoCaracter(cadena);
		mostrarInversa(cadena);
		mostrarGuiones(cadena);
		mostrarCantidadVocales(cadena);
		System.out.println(verificarCapicua(cadena));
		
	}
	
}
