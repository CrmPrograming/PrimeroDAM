// Generated by Structorizer 3.30-01 

import java.util.Scanner;

/**
 */
public class PromedioCicladoAcotado
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
		
		final int MAX_NUMEROS = 10;
		final double COD_PARADA = 999;
		double[] datos = new double[]{0d, 0d, 0d, 0d, 0d, 0d, 0d, 0d, 0d, 0d};
		double limite;
		double sumaValores = 0d;
		int numTotalesPromedio = 0;
		double promedio;
		double actual = 0d;
		int cantidadValores = 0;
		int i = 0;
		System.out.println("> Introduzca hasta " + MAX_NUMEROS + " o " + COD_PARADA + " para terminar");
		System.out.println("+ Dato " + (cantidadValores + 1) + ": ");
		actual = (new Scanner(System.in)).nextLine();
		while ((cantidadValores < (MAX_NUMEROS-1)) && (actual != COD_PARADA))
		{
			datos[cantidadValores] = actual;
			cantidadValores = cantidadValores + 1;
			System.out.println("+ Dato " + (cantidadValores + 1) + ": ");
			actual = (new Scanner(System.in)).nextLine();
		}
		if ((actual != COD_PARADA) && (cantidadValores < MAX_NUMEROS))
		{
			datos[cantidadValores] = actual;
			cantidadValores = cantidadValores + 1;
		}
		if (cantidadValores > 0)
		{
			System.out.println("> Introduzca el l�mite para calcular el promedio: ");
			limite = (new Scanner(System.in)).nextLine();
			for (int i = 0; i <= cantidadValores - 1; i += (1))
			{
				if (datos[i] > limite)
				{
					sumaValores = sumaValores + datos[i];
					numTotalesPromedio = numTotalesPromedio + 1;
				}
			}
			if (numTotalesPromedio > 0)
			{
				promedio = sumaValores / numTotalesPromedio;
				System.out.println("> El promedio es: " + promedio);
			}
			else
			{
				System.out.println("> Ning�n valor supera el l�mite propuesto");
			}
		}
		else
		{
			System.out.println("> No se introdujo ning�n valor");
		}
	}

}