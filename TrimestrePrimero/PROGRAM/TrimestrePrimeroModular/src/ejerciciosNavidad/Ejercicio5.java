package ejerciciosNavidad;

import java.util.ArrayList;
import java.util.Scanner;

/*
 * Cargar un vector de n elementos. imprimir el menor y un mensaje si se repite dentro del vector.
 */

public class Ejercicio5 {
	
	public static void mostrarMenor(int[] t) {
		int menor = Integer.MAX_VALUE;		
		int i;
		int pos;
		ArrayList<Integer> valores = new ArrayList<Integer>();
		ArrayList<Integer> rep = new ArrayList<Integer>();
		
		for (i = 0; i < t.length; i++) {
			if (menor > t[i])
				menor = t[i];
				
			if (!valores.contains(t[i])) {
				valores.add(t[i]);
				rep.add(1);
			} else {
				pos = valores.indexOf(t[i]);
				rep.set(pos, rep.get(pos) + 1);
			}	
		}
		
		System.out.printf("- Menor: %d\n", menor);
		pos = valores.indexOf(menor);
		if (rep.get(pos) > 1)
			System.out.printf("> El valor menor se repite %d veces", rep.get(pos));
	}
	
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
