package program.variables;
import java.util.Scanner;

public class SumaProductoNumeros {
	
	public static void main(String[] args) {		
		// Declaración de variables y objetos locales
	    Scanner teclado = new Scanner(System.in);
	    int num1, num2, suma, producto;
	    
	    // Sollicitud de datos por pantalla
	    System.out.println("############################");
	    System.out.println("#     CÁLCULO DE SUMA Y    #");
	    System.out.println("#       PRODUCTO DE DOS    #");
	    System.out.println("#        NÚMEROS           #");
	    System.out.println("############################");
	    System.out.println();
	    System.out.print("Ingrese primer valor: ");
	    num1 = teclado.nextInt();
	    System.out.print("Ingrese segundo valor ");
	    num2 = teclado.nextInt();
	    teclado.close();
	    
	    // Cálculos de operaciones suma y producto
	    suma = num1 + num2;
	    producto = num1 * num2;
	    
	    // Mostrar resultados 
	    System.out.println("La suma de los dos valores es: " + suma);
	    System.out.println("El producto de los dos valores es: " + producto);	    
	}

}
