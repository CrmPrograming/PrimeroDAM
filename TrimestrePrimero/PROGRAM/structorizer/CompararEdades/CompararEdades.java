// Generated by Structorizer 3.29-13 

import java.util.Scanner;

/**
 */
public class CompararEdades
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
		
		int tuEdad;
		String nombre = "Ana Rosa";
		String mensaje;
		final int EDAD = 24;
		System.out.println(nombre + " tiene " + EDAD + " años de edad.");
		System.out.println("Introduce las edades (0 indica terminar)");
		System.out.println("Qué edad tienes tú: ");
		tuEdad = (new Scanner(System.in)).nextLine();
		while (tuEdad != 0)
		{
			if (tuEdad > 0)
			{
				if (tuEdad > EDAD)
				{
					mensaje = (tuEdad - EDAD) + " menor que tu";
				}
				else
				{
					if (EDAD > tuEdad)
					{
						mensaje = (EDAD - tuEdad) + " mayor que tu";
					}
					else
					{
						mensaje = "IGUAL EDAD";
					}
				}
			}
			else
			{
				mensaje = "Esto no puede ser una edad";
			}
			System.out.println(mensaje);
			System.out.println("Qué edad tienes tú: ");
			tuEdad = (new Scanner(System.in)).nextLine();
		}
		System.out.println("Adios, hasta la próxima ejecución...");
	}

}
