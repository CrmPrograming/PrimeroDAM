package minik.ejerc.herenciainterfaces.ejercicio6;

public class A implements Comparable<A> {
	private int x;
	
	A(int v) {
		x = v;
	}

	@Override
	public int compareTo(A o) {			
		return (x < o.x)? -1 : (x == o.x)? 0 : 1;
	}
	
	@Override
	public String toString() {
		return "" + x;
	}
	
	
}