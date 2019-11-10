
public class Funciones {
	
	/* Función encargada de devolver la media de los valores 
	*  almacenados en el vector dado como parámetro
	*/ 
	public static float media(float[] v) {
		int i;
		float suma = 0f;
		for (i = 0; i < v.length; i++)
			suma += v[i];
		return (suma / v.length);
	}

	/*
	 * Método main principal de la aplicación
	 */
	public static void main(String[] args) {
		float[] valores = {2f, 5f, 1f, 7f, 6f, 2f};
		System.out.printf("> La media de los valores dados es %f", media(valores));
	}

}
