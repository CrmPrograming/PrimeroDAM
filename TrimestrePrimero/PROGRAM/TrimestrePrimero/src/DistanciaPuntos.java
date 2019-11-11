
public class DistanciaPuntos {
	
	public static int puntoCercano(int px, int py, int[] x, int[] y) {
		int pos = -1;
		double min = Double.MAX_VALUE;
		int i;
		
		for (i = 0; i < x.length; i++)
			pos = (distancia(px, py, x[i], y[i]) < min)?i:pos;
		
		return pos;
	}
	
	public static double distancia(int px, int py, int qx, int qy) {
		return Math.sqrt(Math.pow(px - qx, 2) + Math.pow(py - qy, 2));
	}

	public static void main(String[] args) {
		

	}

}
