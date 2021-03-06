package github.crmprograming.primerodam.trimestreprimeromodular.funciones;

import java.util.Scanner;

/**
 * 
 * @author César Ravelo Martínez
 * @version 1.0
 */
public class Salida {

	/**
	 * Dada una tabla de enteros,
	 * la muestra en el formato [d1, d2, ..., dn]
	 * @param t Tabla de valores a mostrar
	 */
	public static void mostrar(int[] t) {
		int i;
		
		// Comprobamos en caso de que la tabla no contenga elementos
		if (t.length > 0) {
			System.out.print("[");		
			for (i = 0; i < t.length-1; i++)
				System.out.printf("%d, ",t[i]);
			System.out.printf("%d]\n", t[t.length-1]);
		} else {
			System.out.println("[]");
		}
	}
	
	/**
	 * Dada una tabla de enteros,
	 * devuelve un String en el formato [d1, d2, ..., dn]
	 * @param t Tabla de valores iniciales
	 * @return String con la tabla de datos formateada
	 */
	public static String arrayToString(int[] t) {
		int i;
		String result = "";
		
		// Comprobamos en caso de que la tabla no contenga elementos
		if (t.length > 0) {
			result += "[";		
			for (i = 0; i < t.length-1; i++)
				result += t[i] + ", ";
			result += t[t.length-1] + "]\n";
		} else {
			result += "[]";
		}
		
		return result;
	}
	
	/**
	 * Método encargado de pedir datos por pantalla y mostrarlos de
	 * manera inversa hasta leer 999
	 * @param in Objeto Scanner encargado de leer los datos
	 */
	public static void mostrarRecursivo(Scanner in) {
		int num;
		num = in.nextInt();
		if (num != 999) {
			mostrarRecursivo(in);
			System.out.print(num + " ");
		}
		
	}
}