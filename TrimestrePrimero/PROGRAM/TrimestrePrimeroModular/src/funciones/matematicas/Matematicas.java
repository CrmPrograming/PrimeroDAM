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
	
	/**
	 * Dada una tabla bidimensional con los ingresos y gastos de unos trimestres,
	 * devuelve la media de los ingresos
	 * @param balance Tabla bidimensional de valores con los ingresos y gastos
	 * @return	Media de los ingresos
	 */
	public static float mediaIngresos(int[][] balance) {
		final int INGRESOS = 0;
		int trim;
		float result = 0f;
		
		for (trim = 0; trim < balance.length; trim++)
			result += balance[trim][INGRESOS];
		
		return result / balance.length;
	}
	
	/**
	 * Dada una tabla bidimensional con los ingresos y gastos de unos trimestres,
	 * devuelve la media de los gastos
	 * @param balance Tabla bidimensional de valores con los ingresos y gastos
	 * @return	Media de los gastos
	 */
	public static float mediaGastos(int[][] balance) {
		final int GASTOS = 1;
		int trim;
		float result = 0f;
		
		for (trim = 0; trim < balance.length; trim++)
			result += balance[trim][GASTOS];
		
		return result / balance.length;
	}
	
	/**
	 * Dada una tabla bidimensional con los ingresos y gastos de unos trimestres,
	 * devuelve el balance total, siendo la diferencia entre los ingresos totales
	 * y los gastos totales
	 * @param balance Tabla bidimensional de valores con los ingresos y gastos
	 * @return	Balance total
	 */
	public static int totalBalance(int[][] balance) {		
		final int INGRESOS = 0;
		final int GASTOS = 1;
		int trim;
		int result = 0;
		
		for (trim = 0; trim < balance.length; trim++)
			result += balance[trim][INGRESOS] - balance[trim][GASTOS]; 
		
		return result;
	}
	
	/**
	 * Dada una tabla bidimensional con los ingresos y gastos de unos trimestres,
	 * muestra una tabla con cada dato junto con los totales correspondientes
	 * 
	 * @param balance Tabla bidimensional de valores con los ingresos y gastos
	 */
	public static void mostrarTabla(int[][] balance) {
		final int INGRESOS = 0, GASTOS = 1;
		int i;
		int[] beneficios = new int[balance.length];
		int totalIngresos = 0, totalGastos = 0;
		
		// Mostramos los ingresos obtenidos de cada trimestre
		System.out.printf("%8s ", "INGRESOS");
		for (i = 0; i < balance.length; i++) {
			System.out.printf("|%5d ", balance[i][INGRESOS]);
			totalIngresos += balance[i][INGRESOS];			
		}
		System.out.printf("|%+5d\n", totalIngresos);		
		
		// Mostramos los gastos generados de cada trimestre
		System.out.printf(" %-7s ", "GASTOS");
		for (i = 0; i < balance.length; i++) {
			System.out.printf("|%5d ", balance[i][GASTOS]);
			totalGastos += balance[i][GASTOS];
		}		
		System.out.printf("|%+5d\n", totalGastos);
		
		System.out.println("----------------------------------------------");
		
		// Mostramos los totales
		beneficios = totales(balance);
		System.out.printf("  %-6s ", "TOTAL");		
		for (i = 0; i < balance.length; i++) 
			System.out.printf("|%+5d ", beneficios[i]);		
		System.out.printf("|%+5d\n", totalIngresos - totalGastos);
	}
	
	/**
	 * Dada una tabla bidimensional con los ingresos y gastos de unos trimestres,
	 * devuelve una tabla con la diferencia total de cada trimestre
	 * 
	 * @param balance Tabla bidimensional de valores con los ingresos y gastos
	 * @return Tabla de enteros con la diferencia calculada
	 */
	public static int[] totales(int[][] balance) {
		final int INGRESOS = 0, GASTOS = 1;
		int[] totales = new int[balance.length];
		int i;
		
		// Calculamos la diferencia de ingresos-gastos de cada trimestre
		for (i = 0; i < totales.length; i++)
			totales[i] = balance[i][INGRESOS] - balance[i][GASTOS];
		
		return totales;
	}
	
	public static void mostrarHTML(int[][] balance) {
		final int INGRESOS = 0, GASTOS = 1, TRIMESTRES = 4;
		int i;
		int[] beneficios = new int[balance.length];
		int totalIngresos = 0, totalGastos = 0;
		String tablaHTML = "<table border='1'>\n";

		// Mostramos la cabecera
		tablaHTML += "\t<tr>\n";
		tablaHTML += "\t\t<th>DATOS</th>";
		
		for (i = 0; i < TRIMESTRES; i++)
			tablaHTML += "<th>" + (i + 1) + "º</th>";
		tablaHTML += "<th>TOTAL</th>\n";
		tablaHTML += "\t</tr>\n";
		
		// Mostramos los ingresos
		tablaHTML += "\t<tr>\n";
		tablaHTML += "\t\t<td>INGRESOS</td>";
		for (i = 0; i < TRIMESTRES; i++) {
			tablaHTML += "<td>" + balance[i][INGRESOS] + "</td>";
			totalIngresos += balance[i][INGRESOS];
		}
		tablaHTML += "<td>"+ totalIngresos + "</td>\n";
		tablaHTML += "\t</tr>\n";
		
		// Mostramos los gastos
		tablaHTML += "\t<tr>\n";
		tablaHTML += "\t\t<td>GASTOS</td>";
		for (i = 0; i < TRIMESTRES; i++) {
			tablaHTML += "<td>" + balance[i][GASTOS] + "</td>";
			totalGastos += balance[i][GASTOS];
		}
		tablaHTML += "<td>"+ totalGastos + "</td>\n";
		tablaHTML += "\t</tr>\n";
		
		
		// Mostramos los beneficios
		beneficios = totales(balance);
		tablaHTML += "\t<tr>\n";
		tablaHTML += "\t\t<td>TOTAL</td>";
		for (i = 0; i < beneficios.length; i++)
			tablaHTML += "<td>" + beneficios[i] + "</td>";
		tablaHTML += "<td>" + (totalIngresos - totalGastos) + "</td>\n";
		tablaHTML += "\t</tr>\n"; 
		
		tablaHTML += "</table>";
		System.out.println(tablaHTML);
	}
	
}
