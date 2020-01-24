package github.crmprograming.primerodam.trimestreprimero.program.ejerciciosPrueba;
import java.util.Scanner;

public class CompararTresNumerosIguales {

	public static void main(String[] args) {
		Scanner teclado = new Scanner(System.in);
		int x, y, z, suma, producto;
		
		System.out.print("> Introduzca los tres números separados por espacio: ");
		x = teclado.nextInt();
		y = teclado.nextInt();
		z = teclado.nextInt();
		teclado.close();
		System.out.println();
		
		if ((x == y) && (y == z)) {
			suma = x + y;
			producto = suma * z;
			System.out.println("> Los tres números son iguales y el resultado final es " + producto);
		} else {
			System.out.println("> Los números NO son iguales");
		}

	}

}
