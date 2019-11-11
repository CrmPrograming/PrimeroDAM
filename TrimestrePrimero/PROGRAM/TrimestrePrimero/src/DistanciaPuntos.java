
public class DistanciaPuntos {
	
	/**
	 * 	Dados un punto P y un listado de puntos representados en dos vectores,
	 * devuelve como resultado la posición asociada al punto más cercano de P
	 * 
	 * @param px Coordenada x del punto P
	 * @param py Coordenada y del punto P
	 * @param x  Coordenada x del punto i-ésimo
	 * @param y  Coordenada y del punto i-ésimo
	 * @return	 Posición en los vectores del punto más cercano
	 */
	public static int puntoCercano(int px, int py, int[] x, int[] y) {
		int pos = -1;
		double min = Double.MAX_VALUE;
		double actual;
		int i;
		
		// Comprobamos el listado de puntos para encontrar el más cercano
		for (i = 0; i < x.length; i++) {
			actual = distancia(px, py, x[i], y[i]);
			if (actual < min) {
				pos = i;
				min = actual;
			}
		}
		
		return pos;
	}
	
	/**
	 * 	Dados dos puntos P y Q, devuelve su distancia
	 * 
	 * @param px Coordenada x del punto P
	 * @param py Coordenada y del punto P
	 * @param qx Coordenada x del punto Q
	 * @param qy Coordenada y del punto Q
	 * @return	 Distancia en double entre ambos puntos
	 */
	public static double distancia(int px, int py, int qx, int qy) {
		return Math.sqrt(Math.pow(px - qx, 2) + Math.pow(py - qy, 2));
	}

	public static void main(String[] args) {
		int[] coordX = {1, 2, 5, 3};
		int[] coordY = {1, 5, 4, 2};
		
		System.out.println("> El punto más cercano es: " + puntoCercano(0, 0, coordX, coordY));

	}

}
