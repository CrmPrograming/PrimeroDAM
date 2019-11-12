import funciones.matematicas.Geometria;

/**
 * 
 * @author César Ravelo Martínez
 * @version 1.0
 */
public class Principal {
	
	/**
	 * Método main principal de la aplicación
	 * @param args Valores de entrada de la aplicación
	 */
	public static void main(String[] args) {
		// Código para la función media
//		float[] valores = { 2f, 5f, 1f, 7f, 6f, 2f };
//		System.out.printf("> La media de los valores dados es %f", Matematicas.media(valores));
		
		int[] coordX = {3,  2, -5, 1};
		int[] coordY = {4, -5,  4, 1};
		int pX = -5;
		int pY = 5;
		int coord = Geometria.puntoCercano(pX, pY, coordX, coordY);
		System.out.printf("> El punto más cercano es: (%d, %d)\n", coordX[coord], coordY[coord]);
		
	}

}
