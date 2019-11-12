package funciones.matematicas;

/**
 * 
 * @author César Ravelo Martínez
 * @version 1.0
 */
public class Matematicas {
	
	/**
	 * Función encargada de devolver la media de los valores almacenados en el
	 * vector dado como parámetro
	 * @param v Listado de valores a comprobar
	 * @return Media calculada de los valores dados
	 */
	public static float media(float[] v) {
		int i;
		float suma = 0f;
		for (i = 0; i < v.length; i++)
			suma += v[i];
		return (suma / v.length);
	}
}
