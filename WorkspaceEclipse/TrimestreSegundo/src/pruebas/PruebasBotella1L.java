package pruebas;

import utenciliosCocina.Botella1L;

public class PruebasBotella1L {

	public static void main(String[] args) {
		Botella1L bot = new Botella1L();

		System.out.println(bot);		
		
		bot.anadir(0.5f);
		
		System.out.println(bot);
		
		bot.cerrar();
		
		System.out.println(bot);
		
		System.out.printf("> Al intentar añadir 1L, sobró %.2fL\n", bot.anadir(1f));
		
		bot.abrir();
		
		System.out.printf("> Al intentar añadir 1L, sobró %.2fL\n", bot.anadir(1f));
		
		System.out.println(bot);
		
		System.out.printf("> Al intentar extraer 1.2L, faltó por extraer %.2fL\n", bot.extraer(1.2f));
		
		System.out.println(bot);
		
		
	}

}
