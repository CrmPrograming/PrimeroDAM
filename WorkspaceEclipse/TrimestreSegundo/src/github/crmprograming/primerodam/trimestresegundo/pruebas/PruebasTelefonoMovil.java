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
				t1.ponDigito(actual);
			
		} while (actual != '-');
		
		in.close();

	}

}
