
public class PruebasPilaEnteros {

	public static void main(String[] args) {
		final int TAM = 10;
		int i;
		PilaEnteros p = new PilaEnteros(0);
		
		System.out.println(p);
		
		p = new PilaEnteros(TAM);
		
		System.out.println(p);
		
		p.apilar(23);
		
		System.out.println(p);
		
		for (i = 0; i < TAM - 1; i++)
			p.apilar((int) (Math.random() * 10));
		
		System.out.println(p);
		
		try {
			p.apilar(18);
		} catch(Exception e) {
			System.err.println("Intento de apilar en una pila llena: " + e.getMessage());
		}
		
		System.out.println(p.desapilar());
		System.out.println(p);
		
		while (!p.vacia()) {
			System.out.println(p.desapilar());
		}
		
		System.out.println(p);
		
		try {
			p.desapilar();
		} catch(Exception e) {
			System.err.println("Intento de desapilar en una pila vacía: " + e.getMessage());
		}

	}

}
