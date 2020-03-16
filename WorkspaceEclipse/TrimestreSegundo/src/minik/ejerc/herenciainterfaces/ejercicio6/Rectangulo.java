package minik.ejerc.herenciainterfaces.ejercicio6;

public class Rectangulo extends Figura {

	private int base;
	private int altura;
	
	public Rectangulo(int base, int altura) {
		this.base = base;
		this.altura = altura;
	}

	@Override
	public double area() {
		return (double) base * altura;
	}

}
