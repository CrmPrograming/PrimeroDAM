package github.crmprograming.primerodam.trimestresegundo.ejerc.viajerosTren.herencia;

public class VagonMaquinistas extends Vagon {
	
	public final static int CANTIDAD_VAGONES_MAQUINISTA = 2;
	
	private final static int MAQUINISTAS_MAXIMOS = 2;
	
	public VagonMaquinistas() {
		super(MAQUINISTAS_MAXIMOS);
	}
	
	public VagonMaquinistas(int tam) {
		this();
	}
	
	@Override
	public void subir(Persona pasajero) {
		if (pasajero instanceof Maquinista)
			super.subir(pasajero);
		else
			throw new RuntimeException("ERROR: Un pasajero no maquinista no puede ir en un vagón de maquinistas.");		
	}

}
