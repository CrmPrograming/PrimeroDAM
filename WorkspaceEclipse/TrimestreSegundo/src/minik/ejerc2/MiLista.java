package minik.ejerc2;

public class MiLista {
	
	public static final int MAX_CAPACIDAD = 100;
	
	private Dato[] listado;
	private int capacidad;
	
	public MiLista(String[] datos) {
		if (datos.length > MAX_CAPACIDAD)
			throw new RuntimeException("ERROR: Esperada una cantidad de datos inferior a " + MAX_CAPACIDAD);
		
		int i;
		listado = new Dato[MAX_CAPACIDAD];
		
		for (i = 0; i < datos.length; i++)
			listado[i] = new Dato(datos[i], i);
		
		capacidad = i;
	}
	
	public boolean add(int pos, String dato) {
		if (length() == MAX_CAPACIDAD)
			throw new RuntimeException("ERROR: Capacidad máxima alcanzada.");
		
		if (listado[pos] == null) {
			capacidad++;
			listado[pos] = new Dato(dato, capacidad - 1);
		} else
			listado[pos] = new Dato(dato, capacidad);
		
		return true;
	}
	
	public int length() {
		return capacidad;
	}
	
	@Override
	public String toString() {
		String mensaje = "";
		int i;
		
		for (i = 0; i < listado.length; i++)
			if (listado[i] != null)
				mensaje += listado[i].toString() + ", ";
		
		return String.format("[%s]", (mensaje.length() > 1)? mensaje.substring(0, mensaje.length() - 2) : "");
	}
	
	public int cuantosHabia(int pos) {
		return (listado[pos] == null)? -1 : listado[pos].getHistorial();	
	}
	
	private class Dato {
		
		private String cadena;
		private int historial;

		public Dato(String c, int h) {
			cadena = c;
			historial = h;
		}

		@Override
		public String toString() {
			return String.format("\"%s\"(%d)", cadena, historial);
		}
		
		public int getHistorial() {
			return historial;
		}
		
	}
	
}