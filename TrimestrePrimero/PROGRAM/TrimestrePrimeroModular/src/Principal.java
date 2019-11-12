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
		
		// Código para las funciones de puntos 1
//		int[] coordX = {3,  2, -5, 1};
//		int[] coordY = {4, -5,  4, 1};
//		int pX = -5;
//		int pY = 5;
//		int coord = Geometria.puntoCercano(pX, pY, coordX, coordY);
//		System.out.printf("> El punto más cercano es: (%d, %d)\n", coordX[coord], coordY[coord]);
		int[] p = {-5, 5};
		int[][] puntos = {{3, 4}, {2, -5}, {-5, 4}, {1, 1}};
		int coord = Geometria.puntoCercano(p, puntos);
		System.out.printf("> El punto más cercano es: (%d, %d)\n", puntos[coord][0], puntos[coord][1]);
	}

}
