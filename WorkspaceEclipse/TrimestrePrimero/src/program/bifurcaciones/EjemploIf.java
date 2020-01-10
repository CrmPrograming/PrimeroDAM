package program.bifurcaciones;
import java.util.Scanner;

public class EjemploIf {

	public static void main(String[] argumentos) {
		StringBuffer mensaje;
		int edad, otroEdad;
		String nombre, otroNombre;
		Scanner teclado = new Scanner(System.in);
		final String FORMATO_MENSAJE = "%s tiene %2d años\n";

		// Nombre y Edad de una persona
		System.out.print("Cómo te llamas: ");
		nombre = teclado.nextLine();
		System.out.print("Cuántos años tienes: ");
		edad = teclado.nextInt();
		teclado.nextLine();

		// Nombre y Edad de la otra persona
		System.out.print("Dime el nombre de otra persona: ");
		otroNombre = teclado.nextLine();
		System.out.print("Y su edad: ");
		otroEdad = teclado.nextInt();
		System.out.printf(FORMATO_MENSAJE, nombre, edad);
		System.out.printf(FORMATO_MENSAJE, otroNombre, otroEdad);
		mensaje = new StringBuffer(nombre);

		// Comprobamos las edades
		if (edad < otroEdad) {
			mensaje.append(" es " + (otroEdad - edad));
			mensaje.append(" años más joven que " + otroNombre);
		} else if (edad > otroEdad) {
			mensaje.append(" es " + (edad - otroEdad));
			mensaje.append(" años mayor que " + otroNombre);
		} else
			mensaje.append(" tiene la misma edad que " + otroNombre);
				
		System.out.println(mensaje);
		teclado.close();
	}

}