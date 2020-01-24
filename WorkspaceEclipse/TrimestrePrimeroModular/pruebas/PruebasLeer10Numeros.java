import java.util.ArrayList;
import java.util.Scanner;

import github.crmprograming.primerodam.trimestreprimeromodular.funciones.Vectores;

public class PruebasLeer10Numeros {

	public static void main(String[] args) {
		Scanner teclado = new Scanner(System.in);
		ArrayList<Integer> listado = new ArrayList<Integer>();
		
		Vectores.leer10Numeros(teclado, listado);
		System.out.println(listado);
		
		teclado.close();

	}

}
