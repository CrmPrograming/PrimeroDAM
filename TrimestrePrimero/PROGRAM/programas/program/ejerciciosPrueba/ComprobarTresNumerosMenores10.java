package program.ejerciciosPrueba;
import java.util.Scanner;

public class ComprobarTresNumerosMenores10 {

	public static void main(String[] args) {
		Scanner teclado = new Scanner(System.in);
		int x, y, z;
		final int LIMITE = 10;
		
		System.out.print("> Introduzca los tres números separados por espacio: ");
		x = teclado.nextInt();
		y = teclado.nextInt();
		z = teclado.nextInt();
		teclado.close();
		System.out.println();
		
		if ((x < LIMITE) && (y < LIMITE) && (z < LIMITE)) {
			System.out.println("Todos los números son menores a diez");
		} else {
			System.out.println("Uno o más números no son menores a diez");
		}

	}

}
