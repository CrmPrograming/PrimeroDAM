package github.crmprograming.primerodam.trimestreprimero.program.variables;
import java.util.Scanner;

public class SumaProducto4 {
		
	public static void main(String[] args) {
		// Declaración de variables y objetos locales
	    Scanner teclado = new Scanner(System.in);
	    int num1, num2, num3, num4, suma, producto;
	    
	    // Sollicitud de datos por pantalla
	    System.out.println("############################");
	    System.out.println("#     CÁLCULO DE SUMA Y    #");
	    System.out.println("#       PRODUCTO DE 4      #");
	    System.out.println("#        NÚMEROS           #");
	    System.out.println("############################");
	    System.out.println();
	    System.out.print("Ingrese los cuatro números separados por espacio: ");
	    num1 = teclado.nextInt();
	    num2 = teclado.nextInt();
	    num3 = teclado.nextInt();
	    num4 = teclado.nextInt();
	    teclado.close();
	    
	    // Cálculos de operaciones suma y producto
	    suma = num1 + num2;
	    producto = num3 * num4; 
	    
	    // Mostrar resultados 
	    System.out.print("Los resultados son: [" + suma + ", " + producto + "]");	    
	}

}
