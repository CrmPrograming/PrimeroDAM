package utenciliosCocina;

public class Botella1L {
	
	public final float CAPACIDAD_MAXIMA = 1f;
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
		return String.format("%.2f (%s)", contenido, (cerrado)?"cerrada":"abierta");
	}
	
	public float anadir(float cant) {
		float sobra = cant;
		if (!cerrado)
			if (cant + contenido > CAPACIDAD_MAXIMA) {
				sobra = (cant + contenido) - CAPACIDAD_MAXIMA;
				contenido = CAPACIDAD_MAXIMA;			
			} else {
				contenido += cant;
				sobra = 0f;
			}
		return sobra;
	}
	
	public float extraer(float cant) {
		float sobra = cant;		
		if (!cerrado)
			if (contenido - cant < 0f) {
				sobra = cant - contenido;
				contenido = 0f;			
			} else {
				contenido -= cant;
				sobra = 0f;
			}		
		return sobra;
	}	
}
