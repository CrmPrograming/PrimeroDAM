package github.crmprograming.primerodam.trimestreprimero.program.ejerciciosPrueba;
import java.util.Scanner;

public class NotasAlumnos {

	public static void main(String[] args) {
		Scanner teclado = new Scanner(System.in);
		float notaA, notaB, notaC, promedio;
		final float TOTAL_NOTAS = 3f;
		
		System.out.print("> Introduzca los 3 números separados por espacio: ");
		notaA = teclado.nextFloat();
		notaB = teclado.nextFloat();
		notaC = teclado.nextFloat();		
		teclado.close();
		System.out.println();
		
		promedio = (notaA + notaB + notaC) / TOTAL_NOTAS;
		
		if (promedio > 6) {
			System.out.println("> El alumno promociona");
		} else {
			System.out.println("> El alumno NO promociona");
		}

	}

}
