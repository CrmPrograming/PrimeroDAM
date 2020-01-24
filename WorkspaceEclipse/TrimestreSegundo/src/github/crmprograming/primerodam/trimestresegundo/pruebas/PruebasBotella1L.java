package github.crmprograming.primerodam.trimestresegundo.pruebas;

import java.util.Scanner;

import github.crmprograming.primerodam.trimestresegundo.utenciliosCocina.Botella1L;

public class PruebasBotella1L {

	public static void main(String[] args) {
		Botella1L bot = new Botella1L();
		Botella1L bot2 = new Botella1L();
		Botella1L[] box = null;
		int cantidad, i;
		Scanner in = new Scanner(System.in);

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
		
		System.out.println("----------------------------");
		
		Botella1L.unidades = "Litros";		
		System.out.println(bot);
		
		bot2.anadir(0.3f);		
		bot = new Botella1L();		
		bot.anadir(0.5f);		
		System.out.println("> La suma de 2 botellas de 0.3 y 0.5 es: " + bot.suma(bot2));
		
		System.out.println("----------------------------");
		
		System.out.print("> Introduzca el tamaño de la caja de botellas que quiere: ");
		cantidad = in.nextInt();
		
		box = Botella1L.caja(cantidad);		
		for (i = 0; i < cantidad; i++)
			System.out.println(box[i]);
		
		in.close();
	}

}
