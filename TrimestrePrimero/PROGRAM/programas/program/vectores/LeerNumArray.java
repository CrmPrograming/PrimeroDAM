package program.vectores;
import java.util.Scanner;

/**
 */
public class LeerNumArray {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		final int TOTAL_NUMEROS = 10;
		double[] datos = new double[TOTAL_NUMEROS];
		double limite;
		double sumaValores = 0d;
		int numTotalesPromedio = 0;
		double promedio;		
		int i = 0;
		Scanner teclado = new Scanner(System.in);		
		
		// Pedimos los 10 valores al usuario
		System.out.println("> Introduzca el listado de valores a continuación:");
		for (i = 0; i < TOTAL_NUMEROS; i++) {
			System.out.print("- Dato " + (i + 1) + ": ");			
			datos[i] = teclado.nextDouble();			
		}
		
		// Pedimos el valor límite para calcular el promedio
		System.out.print("> Introduzca el límite para calcular el promedio: ");
		limite = teclado.nextDouble();
		teclado.close();
		
		// Calculamos el sumatorio de todos los valores que cumplen el límite
		// y además los contamos
		for (i = 0; i < TOTAL_NUMEROS; i++) {
			if (datos[i] > limite) {
				sumaValores = sumaValores + datos[i];
				numTotalesPromedio++;
			}
		}
		
		// En caso de haber dado algún valor, calcular y mostrar el promedio
		if (numTotalesPromedio > 0) {
			promedio = sumaValores / (double) numTotalesPromedio;
			System.out.printf("> El promedio es: %.2f", promedio);
		} else {
			System.out.println("> Ningún valor supera el límite propuesto");
		}
	}

}
