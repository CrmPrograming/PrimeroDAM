// Generated by Structorizer 3.29-13 

import java.util.Scanner;

/**
 */
public class Media
{



	/**
	 * @param args
	 */
	public static void main(String[] args)
	{
		// TODO: Check and accomplish variable declarations: 
		
		// TODO: You may have to modify input instructions, 
		//       e.g. by replacing nextLine() with a more suitable call 
		//       according to the variable type, say nextInt(). 
		
		double sumaNumeros = 0d;
		double numero;
		double media;
		int cuantos = 0;
		final double CONDICION_PARADA = 999d;
		System.out.println("Introduzca una lista de números (para acabar...)");
		numero = (new Scanner(System.in)).nextLine();
		while (numero != CONDICION_PARADA)
		{
			sumaNumeros = sumaNumeros + numero;
			cuantos++;
			System.out.println("Introduzca una lista de números (para acabar...)");
			numero = (new Scanner(System.in)).nextLine();
		}
		if (cuantos > 0)
		{
			media = sumaNumeros / cuantos;
			System.out.println("La media es " + media);
		}
		else
		{
			System.out.println("No se dieron valores para calcular la media");
		}
	}

}
