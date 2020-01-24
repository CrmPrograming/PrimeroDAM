package github.crmprograming.primerodam.trimestreprimeromodular.funciones.matematicas;

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
	 * Dados un punto origen y un listado de puntos representados en un
	 * vector bidimensional, devuelve el índice del punto más cercano.
	 * 
	 * Se entiende que cada fila representa un punto y cada columna
	 * sus coordenadas x e y. 
	 *  
	 * @param origen  Coordenada del punto P 
	 * @param puntos  Coordenadas de los puntos a valorar 
	 * @return   	  Posición en los vectores del punto más cercano
	 */
	public static int puntoCercano(int[] origen, int[][] puntos) {
		int pos = -1;
		double min = Double.MAX_VALUE;
		double actual;
		int pActual;

		// Comprobamos el listado de puntos para encontrar el más cercano
		for (pActual = 0; pActual < puntos.length; pActual++) {
			actual = distancia(origen, puntos[pActual]);
			// Si la distancia actual es menor que la más cercana hasta ahora, actualizamos
			if (actual < min) {
				pos = pActual;
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
	
	/**
	 * Dados dos puntos P y Q, devuelve su distancia
	 * 
	 * @param p Coordenadas del punto P 
	 * @param q Coordenadas del punto Q 
	 * @return 	 Distancia en double entre ambos puntos
	 */
	public static double distancia(int[] p, int[] q) {
		return distancia(p[0], p[1], q[0], q[1]);		
	}
}
