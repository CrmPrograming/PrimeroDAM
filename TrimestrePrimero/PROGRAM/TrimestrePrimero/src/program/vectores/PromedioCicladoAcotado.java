package program.vectores;
import java.util.Scanner;

/**
 */
public class PromedioCicladoAcotado {

	/**
	 * @param args
	 */
	public static void main(String[] args)	{		
		final int MAX_NUMEROS = 10;
		final double COD_PARADA = 999;
		double[] datos = new double[MAX_NUMEROS];
		double limite;
		double sumaValores = 0d;
		int numTotalesPromedio = 0;
		double promedio;		
		double actual = 0d;
		int cantidadValores = 0;
		int i = 0;
		Scanner teclado = new Scanner(System.in);
		
		// Pedimos los valores a leer
		System.out.println("> Introduzca hasta " + MAX_NUMEROS + " o " + COD_PARADA + " para terminar");
		System.out.print("+ Dato " + (cantidadValores + 1) + ": ");
		actual = teclado.nextDouble();
		while ((cantidadValores < (MAX_NUMEROS - 1)) && (actual != COD_PARADA)) {
			datos[cantidadValores] = actual;
			cantidadValores++;			
			System.out.print("+ Dato " + (cantidadValores + 1) + ": ");
			actual = teclado.nextDouble();			
		}
		// Insertamos el valor 10 fuera del bucle para evitar hacer 10 if en él
		if (actual != COD_PARADA) {
			datos[cantidadValores] = actual;
			cantidadValores++;
		}
		System.out.println();
		
		// En caso de leer al menos un valor, seguimos con el programa
		if (cantidadValores > 0) {
			System.out.print("> Introduzca el límite para calcular el promedio: ");
			limite = teclado.nextDouble();
			
			// Recorremos la lista calculando el promedio para los que cumplan el límite
			for (i = 0; i < cantidadValores; i++)	{
				if (datos[i] > limite)	{
					sumaValores = sumaValores + datos[i];
					numTotalesPromedio = numTotalesPromedio + 1;
				}
			}
			if (numTotalesPromedio > 0)	{
				promedio = sumaValores / numTotalesPromedio;
				System.out.println("> El promedio es: " + promedio);
			}	else {
				System.out.println("> Ningún valor supera el límite propuesto");
			}
		} else	{
			System.out.println("> No se introdujo ningún valor");
		}
		teclado.close();
	}

}
