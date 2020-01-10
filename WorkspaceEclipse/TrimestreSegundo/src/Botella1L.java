
public class Botella1L {
	
	public float contenido; // Valores válidos [0, 1]
	public boolean cerrado; // false -> Abierta
	
	public void abrir() {
		cerrado = false;
	}
	
	public void cerrar() {
		cerrado = true;
	}
	
	@Override
	public String toString() {
		// 0.00 (abierta/cerrada)
		return contenido + "(" + (cerrado)?"":"" + ")";
	}
	
	public float añadir(float cant) {
		float sobra = 0f;
		if (cant + contenido > 1f) {
			sobra = (cant + contenido) - 1f;
			contenido = 1f;
			
		} else {
			contenido += cant;
			sobra = 0f;
		}
		
		return sobra;
	}
	
	public float extraer(float cant) {
		
	}
	
	
	
	
}
