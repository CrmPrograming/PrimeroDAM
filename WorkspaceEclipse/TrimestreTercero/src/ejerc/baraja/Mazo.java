package ejerc.baraja;

import java.util.ArrayList;
import java.util.HashMap;

public class Mazo {
	
	private ArrayList<Carta> listado;
	private HashMap<String, Integer> conversion;
	
	public Mazo() {
		listado = new ArrayList<Carta>();
		conversion = new HashMap<String, Integer>();
		
		conversion.put("as", 11);
		conversion.put("tres", 10);
		conversion.put("sota", 2);
		conversion.put("caballo", 3);
		conversion.put("rey", 4);
		
		listado.add(new Carta("as", "oros"));
		listado.add(new Carta("as", "bastos"));
		listado.add(new Carta("as", "espadas"));
		listado.add(new Carta("as", "copas"));
		listado.add(new Carta("dos", "oros"));
		listado.add(new Carta("dos", "bastos"));
		listado.add(new Carta("dos", "espadas"));
		listado.add(new Carta("dos", "copas"));
		listado.add(new Carta("tres", "oros"));
		listado.add(new Carta("tres", "bastos"));
		listado.add(new Carta("tres", "espadas"));
		listado.add(new Carta("tres", "copas"));
		listado.add(new Carta("cuatro", "oros"));
		listado.add(new Carta("cuatro", "bastos"));
		listado.add(new Carta("cuatro", "espadas"));
		listado.add(new Carta("cuatro", "copas"));
		listado.add(new Carta("cinco", "oros"));
		listado.add(new Carta("cinco", "bastos"));
		listado.add(new Carta("cinco", "espadas"));
		listado.add(new Carta("cinco", "copas"));
		listado.add(new Carta("seis", "oros"));
		listado.add(new Carta("seis", "bastos"));
		listado.add(new Carta("seis", "espadas"));
		listado.add(new Carta("seis", "copas"));
		listado.add(new Carta("siete", "oros"));
		listado.add(new Carta("siete", "bastos"));
		listado.add(new Carta("siete", "espadas"));
		listado.add(new Carta("siete", "copas"));
		listado.add(new Carta("ocho", "oros"));
		listado.add(new Carta("ocho", "bastos"));
		listado.add(new Carta("ocho", "espadas"));
		listado.add(new Carta("ocho", "copas"));
		listado.add(new Carta("nueve", "oros"));
		listado.add(new Carta("nueve", "bastos"));
		listado.add(new Carta("nueve", "espadas"));
		listado.add(new Carta("nueve", "copas"));
		listado.add(new Carta("sota", "oros"));
		listado.add(new Carta("sota", "bastos"));
		listado.add(new Carta("sota", "espadas"));
		listado.add(new Carta("sota", "copas"));
		listado.add(new Carta("caballo", "oros"));
		listado.add(new Carta("caballo", "bastos"));
		listado.add(new Carta("caballo", "espadas"));
		listado.add(new Carta("caballo", "copas"));
		listado.add(new Carta("rey", "oros"));
		listado.add(new Carta("rey", "bastos"));
		listado.add(new Carta("rey", "espadas"));
		listado.add(new Carta("rey", "copas"));
	}
	
	public void generarSecuencia() {
		final int CANTIDAD = 5;
		int total = 0;
		int i;
		Carta actual;
		
		for (i = 0; i < CANTIDAD; i++) {
			actual = listado.get((int) (Math.random() * listado.size()));
			System.out.println(actual);
			if (conversion.containsKey(actual.getFig().toString()))
				total += conversion.get(actual.getFig().toString());
		}
		
		System.out.println("Tienes " + total + " puntos");
			
	}
	
	public static void main(String[] args) {
		Mazo m = new Mazo();
		
		m.generarSecuencia();
	}

}
