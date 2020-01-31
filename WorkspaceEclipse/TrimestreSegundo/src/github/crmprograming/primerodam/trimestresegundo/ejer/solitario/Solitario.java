package github.crmprograming.primerodam.trimestresegundo.ejer.solitario;

public class Solitario {
	
	private Mazo mazoPartida;
	private ColumnaCartas[] columnas;
	private FamiliaCartas[] familias;
	private PozoCartas pozo;
	
	public Solitario() {
		reset();
	}
	
	private void reset() {
		mazoPartida = new Mazo();
		columnas = new ColumnaCartas[] {new ColumnaCartas(), new ColumnaCartas(),
										new ColumnaCartas(), new ColumnaCartas()};
		familias = new FamiliaCartas[] {new FamiliaCartas(), new FamiliaCartas(),
										new FamiliaCartas(), new FamiliaCartas()};
		pozo = new PozoCartas();
		
		
	}

	public void gestorPartida() {
		
	}
	
}
