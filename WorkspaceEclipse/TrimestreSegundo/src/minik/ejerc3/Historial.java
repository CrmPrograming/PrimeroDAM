package minik.ejerc3;

public class Historial {
	
	private final int INCREMENTOS = 10;	
	private int[] h;
	private int ultima;
	
	public Historial() {
		h = new int[INCREMENTOS];
		ultima = 0;
	}
	
	public void tirada(int c) {
		if (ultima == h.length)
			aumentarHistorial();
			
		h[ultima++] = c;
	}
	
	private void aumentarHistorial() {
		int[] nuevo = new int[h.length + INCREMENTOS];
		int i;
		
		for (i = 0; i < ultima; i++)
			nuevo[i] = h[i];
		
		h = nuevo;		
	}
	
	public void reset() {
		ultima = 0;
	}
	
	public int[] getHistorialReciente() {
		int[] tiradas = new int[ultima];
		int i;
		
		for (i = 0; i < ultima; i++)
			tiradas[i] = h[ultima - 1 - i];
		
		return tiradas;
	}	

}
