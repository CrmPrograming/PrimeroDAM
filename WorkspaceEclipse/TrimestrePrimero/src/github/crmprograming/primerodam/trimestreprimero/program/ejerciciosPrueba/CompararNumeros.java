package github.crmprograming.primerodam.trimestreprimero.program.ejerciciosPrueba;
import java.util.Scanner;

public class CompararNumeros {

	public static void main(String[] args) {
		Scanner teclado = new Scanner(System.in);
		float x, y;
		
		System.out.print("> Introduzca los dos números separados por espacio: ");
		x = teclado.nextFloat();
		y = teclado.nextFloat();
		teclado.close();
		System.out.println();
		
		if (x > y) {
			System.out.println("> La suma y resta asociados es: " + (x + y) + ", " + (x - y));
		} else {
			System.out.println("> El producto y división asociados es: " + (x * y) + ", " + (x / y));
		}
		
	}

}
