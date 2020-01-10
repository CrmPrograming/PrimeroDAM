/**
 * Clase encargada de realizar las pruebas de los módulos que se especifiquen en ella
 * 
 * @author César Ravelo Martínez
 * @since 1.0
 */
public class Pruebas {
	
	/**
	 * Método encargado de realizar y mostrar por pantalla las pruebas y sus resultados
	 */
	public static void pruebasFraseOculta() {
		// Declaración de datos iniciales y batería de pruebas
		int i;
		String actual;
		char[][][] sopas = {{{'X'}},
							{"j0O30gO2".toCharArray(),
			 				 "PmfVLfMU".toCharArray(),
			 				 "k5dsAjkN".toCharArray(),
			 				 "Fbhna3xB".toCharArray(),
			 				 "FyRBzkyR".toCharArray(),
			 				 "yI2vg3Mx".toCharArray(),
			 				 "adukl9sX".toCharArray(),
			 				 "y3munuKM".toCharArray()},
			 				{")ZamrdHC60".toCharArray(),
			 				 "cmFz7ZBSS4".toCharArray(),
			 				 "x5oD6DAyYi".toCharArray(),
			 				 "n32wXnFDPi".toCharArray(),
			 				 "JVq1t4KWi5".toCharArray(),
			 				 "kXD9Od0k5g".toCharArray(),
			 				 "1LMyZºoj5l".toCharArray(),
			 				 "fuOBzEIvsz".toCharArray(),
			 				 "dbv2QWfoDA".toCharArray(),
			 				 "24Cw7ZKqe1".toCharArray()},
			 				{"ZZamrdHC60".toCharArray(),
				 			 "cmTz7ZBSS4".toCharArray(),
				 			 "x5oD6DAyAi".toCharArray(),
				 			 "n32wXnFDPi".toCharArray(),
				 			 "JVqtP4KWi5".toCharArray(),
				 			 "kX9AOd0k5g".toCharArray(),
				 			 "1LMyZºoj5l".toCharArray(),
				 			 "fuOBzEIvsz".toCharArray(),
				 			 "dOv2QWfoDA".toCharArray(),
				 			 "24Cw7ZKqe1}".toCharArray()},
				 			{"YhziMpSdxH".toCharArray(),
				 			 "8vUIeyInCM".toCharArray(),
				 			 "NoIMZVLCzA".toCharArray(),
				 			 "FfMFCZ11JB".toCharArray(),
				 			 "JGqSROh4Uu".toCharArray()}};
		
		int[][] inic = {{0, 0},
						{2, 2},
						{9, 9},
						{0, 0},
						{2, 6}};
		
		int[][][] desp = {{},
						  {{5, 1},
			  			   {-3, 2},
			  			   {-3, 2},
			  			   {2, -3},
			  			   {2, -2},
			  			   {1, 4},
			  			   {-5, -1},
			  			   {2, -4}},
			  			  {{-3, -4},
			  			   {-6, -5},
			  			   {2, 5},
			  			   {0, 1},
			  			   {4, -4},
			  			   {2, 7}},
			  			  {{2, 8},
			  			   {2, -4},
			  			   {1, -1},
			  			   {-4, -1},
			  			   {7, -1}},
			  			  {{-1, -4},
			  			   {2, 2},
			  			   {-1, 5},
			  			   {-2, -3}}};
		
		String[] soluciones = {"X",
							   "dukUa2sfb",
							   "1º)DAMA",
							   "ZAPATO",
							   "LUCAS"};
		
		for (i = 0; i < soluciones.length; i++) {
			actual = Funciones.funcionOculta(sopas[i], inic[i][0], inic[i][1], desp[i]);
			System.out.printf("[%c] Se esperaba \"%s\" y se obtuvo \"%s\"\n", 
							  (actual.equals(soluciones[i]))?'X':' ', soluciones[i], actual);
		}
			
		
	}
	
	/**
	 * Método main de la aplicación
	 * @param args Parámetros de entrada del programa
	 */
	public static void main(String[] args) {		
		pruebasFraseOculta();
	}

}
