package github.crmprograming.primerodam.trimestresegundo.pruebas;

import java.util.Scanner;

import github.crmprograming.primerodam.trimestresegundo.ejer.comunicaciones.TelefonoMovil;

public class PruebasTelefonoMovil {
	
	public static void main(String[] args) {
		Scanner in = new Scanner(System.in);
		TelefonoMovil t1 = new TelefonoMovil("623457458");
		char actual = 'a';
		
		t1 = null;
		
		try {
			t1 = new TelefonoMovil("623457458");
		
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
		
		t1 = new TelefonoMovil("2312412334");
		
		t1.llamar();
		t1.cancelar();
		
		do {
			System.out.println("> Introduzca un dígito, - para acabar, + para llamar, . cancelar");
			actual = in.next().charAt(0);
			
			if (actual == '+')
				t1.llamar();
			else if (actual == '.')
				t1.cancelar();
			else if (actual != '-')
				switch (actual) {
				case '0':
					t1.digito0();
					break;
				case '1':
					t1.digito1();
					break;
				case '2':
					t1.digito2();
					break;
				case '3':
					t1.digito3();
					break;
				case '4':
					t1.digito4();
					break;
				case '5':
					t1.digito5();
					break;
				case '6':
					t1.digito6();
					break;
				case '7':
					t1.digito7();
					break;
				case '8':
					t1.digito8();
					break;
				case '9':
					t1.digito9();
					break;
				default:
					System.out.println("> ERROR: El valor introducido no se corresponde al de un dígito");
				}
			
		} while (actual != '-');
		
		in.close();

	}

}
