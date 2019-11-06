package program.ejerciciosPrueba;
import java.util.Scanner;

public class Mayor3Numeros {

	public static void main(String[] args) {
		Scanner teclado = new Scanner(System.in);
		int x, y, z;
		int mayor = -999;
		
		System.out.print("> Introduzca los 3 números separados por espacio: ");
		x = teclado.nextInt();
		y = teclado.nextInt();
		z = teclado.nextInt();
		teclado.close();
		System.out.println();
		
		/*
		if (x > y) {
			mayor = x;
		} else {
			mayor = y;
		}*/
		
		mayor = (x > y)? x : y;
		
		if (mayor < z) {
			mayor = z;
		}
		
		System.out.println("> El número mayor es: " + mayor);
		
	}

}
