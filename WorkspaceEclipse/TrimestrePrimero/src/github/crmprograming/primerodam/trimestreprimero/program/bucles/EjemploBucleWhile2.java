package github.crmprograming.primerodam.trimestreprimero.program.bucles;
/**
 * Fichero: EjemploBucleWhile2.java Recorre una cadena de caracteres, copiando
 * cada caracter en otra hasta completar 26 caracteres.
 * Después muestra ambas cadenas, la original y la copia.
 **/

public class EjemploBucleWhile2 {
	
	public static void main(String[] args) {
		String copiaDeAqui = "Copia esta cadena de caracteres hastas la letra 'd'.";
		StringBuffer copiaEnEste = new StringBuffer();		
		int i = 0;
		char c = ' ';
		final int NUM_CARACTERES = 25;
				
		while (i <= NUM_CARACTERES) {			
			c = copiaDeAqui.charAt(i);
			copiaEnEste.append(c);
			i++;
		}
		System.out.println("\"" + copiaDeAqui + "\"");
		System.out.println("\"" + copiaEnEste + "\"");
	}
}