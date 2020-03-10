package minik.ejerc3;

import azar.Dado;

public class DadoConMemoria extends Dado {
	
	private Historial h;

	public DadoConMemoria() {
		this(6);
	}
	
	public DadoConMemoria(int lados) {
		super(lados);
		
		h = new Historial();
	}
	
	@Override
	public int lanzarDado() {
		int cara = super.lanzarDado();
		
		h.tirada(cara);
		
		return cara;
	}
	
	public void reset() {
		h.reset();
	}
	
	public int[] historico() {
		return h.getHistorialReciente();
	}	

}
