
public class Matematicas {

	/**
	 * Función encargada de devolver la media de los valores almacenados en el
	 * vector dado como parámetro
	 * @param v Listado de valores a comprobar
	 * @return Media calculada de los valores dados
	 * @throws NullPointerException Excepción si la lista de valores es vacía
	 */
	public static float media(float[] v) {
		int i;
		float suma = 0f;
		
		if (v == null || v.length == 0)
			throw new NullPointerException();
		
		for (i = 0; i < v.length; i++)
			suma += v[i];
		
		return (suma / v.length);
	}
}
