package azar;

public class Dado {
	private int lados;

	public Dado(int lados) {
		if (lados < 2)
			throw new RuntimeException("Al menos dos... ");
		this.lados = lados;
	}

	public int lanzarDado() {
		int cara;
		cara = ((int) (Math.random() * lados)) + 1;
		return cara;
	}
}