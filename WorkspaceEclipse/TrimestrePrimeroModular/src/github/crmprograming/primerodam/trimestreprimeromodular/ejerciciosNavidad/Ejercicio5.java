package github.crmprograming.primerodam.trimestreprimeromodular.ejerciciosNavidad;

import java.util.ArrayList;
import java.util.Scanner;

/*
 * Cargar un vector de n elementos. Imprimir el menor y un mensaje si se repite dentro del vector.
 */

public class Ejercicio5 {
	
	/*
	 * Método encargado de mostrar el menor término de la tabla t e indicar, en caso de repetirse,
	 * cuántas veces se repite.
	 * 
	 * Para ello utilizamos dos ArrayList<Integer>:
	 * - valores, contiene los valores sin repetición según se van encontrando
	 * - rep, contiene las repeticiones asociadas a los datos en valores.
	 * 
	 * De esta forma, si en la posición 2 de valores tenemos el dato '3', en
	 * la posición 2 tenemos la cantidad de veces que se ha repetido dicho valor.
	 */
	public static void mostrarMenor(int[] t) {
		int menor = Integer.MAX_VALUE;		
		int i;
		int pos;
		ArrayList<Integer> valores = new ArrayList<Integer>();
		ArrayList<Integer> rep = new ArrayList<Integer>();
		
		// Buscamos el menor término en t
		for (i = 0; i < t.length; i++) {
			// Comprobamos si encontramos un nuevo valor menor
			if (menor > t[i])
				menor = t[i];
			
			// Contabilizamos si se repite el valor o es la primera vez que aparece.
			if (!valores.contains(t[i])) {
				valores.add(t[i]);
				rep.add(1);
			} else {
				pos = valores.indexOf(t[i]);
				rep.set(pos, rep.get(pos) + 1);
			}	
		}
		
		// Mostramos el menor término encontrado
		System.out.printf("- Menor: %d\n", menor);
		
		// En caso de repetirse, indicamos las veces que se repite el menor término de t
		pos = valores.indexOf(menor);
		if (rep.get(pos) > 1)
			System.out.printf("> El valor menor se repite %d veces", rep.get(pos));
	}
	
	/*
	 * Método encargado de leer los valores introducidos por la entrada estandar.
	 */
	public static int[] cargarDatos() {		
		int[] datos = null;
		int tam = 0, i;
		Scanner in = new Scanner(System.in);
		
		System.out.print("> Indique la cantidad de elementos a guardar: ");
		tam = in.nextInt();
		datos = new int[tam];
		
		for (i = 0; i < tam; i++) {
			System.out.printf("> Dato %d: ", i + 1);
			datos[i] = in.nextInt();
		}
		
		in.close();
		
		return datos;
	}

	public static void main(String[] args) {

		int[] datos;
		
		datos = cargarDatos();
		mostrarMenor(datos);		
		
	}

}
