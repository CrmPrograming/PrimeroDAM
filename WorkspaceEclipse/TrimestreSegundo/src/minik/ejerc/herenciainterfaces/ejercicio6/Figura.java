package minik.ejerc.herenciainterfaces.ejercicio6;

public abstract class Figura implements Comparable<Figura> {
	
	public abstract double area();
	
	@Override
	public int compareTo(Figura o) {
		double a1 = area();
		double a2 = o.area();
		
		return (a1 < a2)? -1 : (a1 == a2)? 0 : 1;
	}
	
	@Override
	public String toString() {
		return "[" + this.getClass().getSimpleName() + " " + String.format("%.2f", area()) + "]";
	}

}
