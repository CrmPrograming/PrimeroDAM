package program.variables;
import java.util.Scanner;

public class Cuadrado {
	
	public static void main(String[] args) {		
		// Declaración de variables y objetos locales
	    Scanner teclado = new Scanner(System.in);
	    int lado, perimetro, area;
	    
	    // Sollicitud de datos por pantalla
	    System.out.println("############################");
	    System.out.println("#  CÁLCULO DE PERÍMETRO Y  #");
	    System.out.println("#    ÁREA DE UN CUADRADO   #");	    
	    System.out.println("############################");
	    System.out.println();
	    System.out.print("Ingrese el lado del cuadrado: ");
	    lado = teclado.nextInt();
	    teclado.close();
	    
	    // Cálculos de operaciones perímetro y área
	    perimetro = lado * 4;
	    area = lado * lado;
	    
	    // Mostrar resultados 
	    System.out.print("Para un cuadrado de lado " + lado + ", el perímetro es " + perimetro);
	    System.out.println(" y el área es " + area);
	}

}
