import funciones.Vectores;

public class PruebasAlmostIncreasingSequence {
	
	/**
	 * Método encargado de realizar las pruebas necesarias para
	 * la función Vectores.almostIncreasingSequence
	 * @see Vectores.almostIncreasingSequence
	 */
	public static void pruebasAlmostIncreasingSequence() {
		int[] pValida = {1, 3, 5, 2, 7, 8},
			  pNoValida = {1, 3, 2, 5, 7, 4, 8},
			  pTam2 = {1, 3},
			  pTam2Bis = {3, 2},
			  pExtremoFinal = {1, 3, 2, 5, 4};
			
		
		System.out.println(Vectores.arrayToString(pValida) + " -> " + Vectores.almostIncreasingSequence(pValida));
		System.out.println(Vectores.arrayToString(pNoValida) + " -> " + Vectores.almostIncreasingSequence(pNoValida));
		System.out.println(Vectores.arrayToString(pTam2) + " -> " + Vectores.almostIncreasingSequence(pTam2));
		System.out.println(Vectores.arrayToString(pTam2Bis) + " -> " + Vectores.almostIncreasingSequence(pTam2Bis));
		System.out.println(Vectores.arrayToString(pExtremoFinal) + " -> " + Vectores.almostIncreasingSequence(pExtremoFinal));
	}

	public static void main(String[] args) {
		pruebasAlmostIncreasingSequence();

	}

}
