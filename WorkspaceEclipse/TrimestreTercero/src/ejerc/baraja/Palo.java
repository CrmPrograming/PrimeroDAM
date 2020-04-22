package ejerc.baraja;

public class Palo {

	private String tipo;
	
	public Palo(String t) {
		tipo = t;
	}
	
	@Override
	public boolean equals(Object o) {
		if (this == o)
			return true;
		
		if (o instanceof Figura)
			return tipo.equals(o.toString());
			
		return false;
	}
	
	@Override
	public String toString() {
		return tipo;
	}
	
}
