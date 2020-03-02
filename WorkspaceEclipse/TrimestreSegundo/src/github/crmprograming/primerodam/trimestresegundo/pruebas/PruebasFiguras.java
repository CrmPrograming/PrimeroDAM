package github.crmprograming.primerodam.trimestresegundo.pruebas;

import github.crmprograming.primerodam.trimestresegundo.ejerc.figuras.*;

public class PruebasFiguras {

	public static void main(String[] args) {
		Rectangulo r1 = new Rectangulo(0, 0, 2, 3);
		Rectangulo r2 = new Rectangulo(0, 0, 2, 3);
		Rectangulo r3 = new Rectangulo(0, 0, 2, 4);
		Rectangulo r4 = new Rectangulo(0, 0, 2, 2);
		Cuadrado c1 = new Cuadrado(0, 0, 2);
		Triangulo t1 = new Triangulo(0, 0, 5, 4);
		Triangulo t2 = new Triangulo(0, 0, 6, 4);
		Triangulo t3 = new Triangulo(0, 0, 5, 4);
		Elipse e1 = new Elipse(0, 0, 8, 1);
		Elipse e2 = new Elipse(0, 0, 5, 2);
		Elipse e3 = new Elipse(0, 0, 8, 1);
		Casita h1 = new Casita(0, 0, 3, 10, 2);
		Casita h2 = new Casita(0, 0, 4, 15, 4);
		Casita h3 = new Casita(0, 0, 3, 10, 2);
		Figura[] figuras = {r1, r2, c1, t2, e1, e3, h1, h2};
		
		// Pruebas básicas de equals para Rectangulo
		System.out.println("> Pruebas básicas de equals para Rectangulo:");
		System.out.println(r1.equals(r2));
		System.out.println(r1.equals(r3));
		System.out.println(r4.equals(c1));
		System.out.println(c1.equals(r4));
		System.out.println();
		
		// Pruebas básicas de equals para Triangulo
		System.out.println("> Pruebas básicas de equals para Triangulo:");
		System.out.println(t1.equals(t2));
		System.out.println(t1.equals(t3));
		System.out.println(t1.equals(r1));
		System.out.println();
		
		// Pruebas básicas de equals para Elipse
		System.out.println("> Pruebas básicas de equals para Elipse:");
		System.out.println(e1.equals(e2));
		System.out.println(e1.equals(e3));
		System.out.println(e1.equals(r1));
		System.out.println();
		
		// Pruebas básicas de equals para Elipse
		System.out.println("> Pruebas básicas de equals para Casita:");
		System.out.println(h1.equals(h2));
		System.out.println(h1.equals(h3));
		System.out.println(h1.equals(r1));
		System.out.println();
		
		//Pruebas de búsqueda
		System.out.println(FuncionesFiguras.buscar(figuras, h3));
		System.out.println(FuncionesFiguras.buscar(figuras, r3));
	}

}
