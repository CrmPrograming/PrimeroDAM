package funciones.matematicas;

/**
 * 
 * @author César Ravelo Martínez
 * @version 1.0
 */
public class Geometria {
	
	/**
	 * Dados un punto P y un listado de puntos representados en dos vectores,
	 * devuelve como resultado la posición asociada al punto más cercano de P
	 * 
	 * 
	 * @see distancia
	 * @param px Coordenada x del punto P
	 * @param py Coordenada y del punto P
	 * @param x  Coordenadas x de los puntos a valorar
	 * @param y  Coordenadas y de los puntos a valorar
	 * @return   Posición en los vectores del punto más cercano
	 */
	public static int puntoCercano(int px, int py, int[] x, int[] y) {
		int pos = -1;
		double min = Double.MAX_VALUE;
		double actual;
		int i;

		// Comprobamos el listado de puntos para encontrar el más cercano
		for (i = 0; i < x.length; i++) {
			actual = distancia(px, py, x[i], y[i]);
			// Si la distancia actual es menor que la más cercana hasta ahora, actualizamos
			if (actual < min) {
				pos = i;
				min = actual;
			}
		}

		return pos;
	}

	/**
	 * Dados dos puntos P y Q, devuelve su distancia
	 * 
	 * @param px Coordenada x del punto P
	 * @param py Coordenada y del punto P
	 * @param qx Coordenada x del punto Q
	 * @param qy Coordenada y del punto Q
	 * @return 	 Distancia en double entre ambos puntos
	 */
	public static double distancia(int px, int py, int qx, int qy) {
		return Math.sqrt(Math.pow(px - qx, 2) + Math.pow(py - qy, 2));
	}	
}
