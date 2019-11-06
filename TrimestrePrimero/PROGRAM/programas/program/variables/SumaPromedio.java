package program.variables;
import java.util.Scanner;

public class SumaPromedio {
	
	public static void main(String[] args) {		
		// Declaración de variables y objetos locales
	    Scanner teclado = new Scanner(System.in);
	    int num1, num2, num3, num4, suma;
	    float promedio;
	    
	    // Sollicitud de datos por pantalla
	    System.out.println("######################");
	    System.out.println("#  CÁLCULO DE SUMA Y #");
	    System.out.println("#    PROMEDIO DE 4   #");
	    System.out.println("#        NÚMEROS     #");
	    System.out.println("######################");
	    System.out.println();
	    System.out.print("Ingrese los cuatro números separados por espacio: ");
	    num1 = teclado.nextInt();
	    num2 = teclado.nextInt();
	    num3 = teclado.nextInt();
	    num4 = teclado.nextInt();
	    teclado.close();
	    
	    // Cálculos de operaciones suma y producto
	    suma = num1 + num2 + num3 + num4;
	    promedio = suma / ((float) 4); 
	    
	    // Mostrar resultados 
	    System.out.print("Los resultados son: [" + suma + ", " + promedio + "]");	    
	}
}
