package program.ejerciciosPrueba;
import java.util.Scanner;

public class CoordenadaCuadrante {

	public static void main(String[] args) {
		Scanner teclado = new Scanner(System.in);
		int x, y;
		final int CERO = 0;
		
		System.out.print("> Introduzca las coordenadas del punto separados por espacio: ");
		x = teclado.nextInt();
		y = teclado.nextInt();
		teclado.close();
		System.out.println();
		
		if ((x > CERO) && (y > CERO)) {
			System.out.print("> El punto se corresponde al primer cuadrante");
		}
		
		if ((x < CERO) && (y > CERO)) {
			System.out.print("> El punto se corresponde al segundo cuadrante");
		}
		
		if ((x < CERO) && (y < CERO)) {
			System.out.print("> El punto se corresponde al tercer cuadrante");
		}
		
		if ((x > CERO) && (y < CERO)) {
			System.out.print("> El punto se corresponde al cuarto cuadrante");
		}

	}

}
