package program.ejerciciosPrueba;

/**
 * Fichero: EjemploBucleWhile.java Recorre una cadena de caracteres, copiando
 * cada caracter en otra, pero sólo mientras que no encuentra el caracter 'd'
 * Después muestra ambas cadenas, la original y la copia.
 **/

public class EjemploBucleWhile {
	
	public static void main(String[] args) {
		String copiaDeAqui = "Copia esta cadena de caracteres hastas la letra 'd'.";
		StringBuffer copiaEnEste = new StringBuffer();
		int i = 0;
		char c = ' ';
		
		// La primera vez la condición del bucle será cierta
		while (c != 'd') {
			// ya que se inicializa c a un valor distinto de ‘d’
			c = copiaDeAqui.charAt(i);
			copiaEnEste.append(c);
			i++;
		}
		System.out.println(copiaDeAqui);
		System.out.println(copiaEnEste);
	}
}