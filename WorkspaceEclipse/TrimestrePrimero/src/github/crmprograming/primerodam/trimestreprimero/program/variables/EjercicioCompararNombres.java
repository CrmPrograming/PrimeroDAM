package github.crmprograming.primerodam.trimestreprimero.program.variables;
import java.util.Scanner;

/*
 *  Realiza un programa que solicite dos nombre (el primero será necesariamente mayor que el segundo)
 *  y que nos informe de cuánto mayor es el primero con un mensaje como este.
 *  El nombre "XXXXX" tiene X caracteres más que "XXXX".
 *  
 *  Alumno: César Ravelo Martínez
 *  Fecha: 24 de Sep. 2019
 */

public class EjercicioCompararNombres {

	public static void main(String[] args) {
		// Declaración inicial de variables
		Scanner teclado = new Scanner(System.in);
		String nombreA, nombreB;
		StringBuffer nomA, nomB;
		int diferenciaTam = 0;
		
		// Solicitamos los nombres por teclado
		System.out.print("> Introduzca el primer nombre: ");
		nombreA = teclado.nextLine();
		System.out.print("> Introduzca el segundo nombre: ");
		nombreB = teclado.nextLine();
		teclado.close();
		System.out.println();
		
		nomA = new StringBuffer(nombreA);
		nomB = new StringBuffer(nombreB);
		
		// Calculamos la diferencia de tamaños
		diferenciaTam = nomA.length() - nomB.length();
		
		// Imprimimos el resultado
		System.out.println("El nombre \"" + nomA + "\" tiene " + diferenciaTam + " caracteres más que \"" + nomB + "\"");		
	}

}
