package github.crmprograming.primerodam.trimestresegundo.pruebas;

import github.crmprograming.primerodam.trimestresegundo.ejer.solitario.*;

public class PruebasSolitario {

	public static void main(String[] args) {
		Mazo m = new Mazo();
		
		/*
		for (int i = 0; i < 40; i++)
			System.out.println(m.sacarCarta());
		*/
		
		MontonPalo mPalo = new MontonPalo();
		
		for (int i = 0; i < 40; i++)
			mPalo.ponerCarta(m.sacarCarta());
		
		System.out.println();
				

	}

}
