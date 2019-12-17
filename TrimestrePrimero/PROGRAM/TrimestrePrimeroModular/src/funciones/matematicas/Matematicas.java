package funciones.matematicas;

import java.util.ArrayList;

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
		
		if (v.length == 0)
			throw new NullPointerException();
		
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
	 * Dada un ArrayList bidimensional con los ingresos y gastos de unos trimestres,
	 * devuelve la media de los gastos
	 * @param balance ArrayList de valores con los ingresos y gastos
	 * @return	Media de los gastos
	 */
	public static float mediaGastos(ArrayList<ArrayList<Integer>> balance) {
		final int GASTOS = 1;
		int trim;
		float result = 0f;
		
		for (trim = 0; trim < balance.size(); trim++)
			result += balance.get(trim).get(GASTOS);
		
		return result / balance.size();
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
	 * Dada una ArrayList bidimensional con los ingresos y gastos de unos trimestres,
	 * devuelve el balance total, siendo la diferencia entre los ingresos totales
	 * y los gastos totales
	 * @param balance Tabla bidimensional de valores con los ingresos y gastos
	 * @return	Balance total
	 */
	public static int totalBalance(ArrayList<ArrayList<Integer>> balance) {
		final int INGRESOS = 0;
		final int GASTOS = 1;
		int trim;
		int result = 0;
		
		for (trim = 0; trim < balance.size(); trim++)
			result += balance.get(trim).get(INGRESOS) - balance.get(trim).get(GASTOS); 
		
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
	
	/**
	 * Dada una tabla bidimensional con los ingresos y gastos de unos trimestres,
	 * muestra la tabla en formato HTML
	 * 
	 * @param balance Tabla bidimensional de valores con los ingresos y gastos
	 */
	public static void mostrarHTML(int[][] balance) {
		final int INGRESOS = 0, GASTOS = 1, TRIMESTRES = 4;
		int i;
		int[] beneficios = new int[balance.length];
		int totalIngresos = 0, totalGastos = 0;
		
		final String TAG_TABLA_ABRIR = "<table border='1'>",
				TAG_TABLA_CERRAR = "</table>",
				TAG_TH_ABRIR = "<th>",
				TAG_TH_CERRAR = "</th>",
				TAG_TR_ABRIR = "<tr>",
				TAG_TR_CERRAR = "</tr>",
				TAG_TD_ABRIR = "<td>",
				TAG_TD_CERRAR = "</td>";
		
		String tablaHTML = TAG_TABLA_ABRIR + "\n";

		// Mostramos la cabecera
		tablaHTML += "\t" + TAG_TR_ABRIR + "\n";
		tablaHTML += "\t\t" + TAG_TH_ABRIR  + "DATOS" + TAG_TH_CERRAR;
		
		for (i = 0; i < TRIMESTRES; i++)
			tablaHTML += TAG_TH_ABRIR + (i + 1) + "º" + TAG_TH_CERRAR;
		tablaHTML += TAG_TH_ABRIR + "TOTAL" + TAG_TH_CERRAR + "\n";
		tablaHTML += "\t"+ TAG_TR_CERRAR +"\n";
		
		// Mostramos los ingresos
		tablaHTML += "\t" + TAG_TR_ABRIR + "\n";
		tablaHTML += "\t\t" + TAG_TD_ABRIR + "INGRESOS" + TAG_TD_CERRAR;
		for (i = 0; i < TRIMESTRES; i++) {
			tablaHTML += TAG_TD_ABRIR + balance[i][INGRESOS] + TAG_TD_CERRAR;
			totalIngresos += balance[i][INGRESOS];
		}
		tablaHTML += TAG_TD_ABRIR + totalIngresos + TAG_TD_CERRAR + "\n";
		tablaHTML += "\t" + TAG_TR_CERRAR + "\n";
		
		// Mostramos los gastos
		tablaHTML += "\t" + TAG_TR_ABRIR + "\n";
		tablaHTML += "\t\t" + TAG_TD_ABRIR + "GASTOS" + TAG_TD_CERRAR;
		for (i = 0; i < TRIMESTRES; i++) {
			tablaHTML += TAG_TD_ABRIR + balance[i][GASTOS] + TAG_TD_CERRAR;
			totalGastos += balance[i][GASTOS];
		}
		tablaHTML += TAG_TD_ABRIR + totalGastos + TAG_TD_CERRAR + "\n";
		tablaHTML += "\t" + TAG_TR_CERRAR + "\n";
		
		
		// Mostramos los beneficios
		beneficios = totales(balance);
		tablaHTML += "\t" + TAG_TR_ABRIR + "\n";
		tablaHTML += "\t\t" + TAG_TD_ABRIR + "TOTAL" + TAG_TD_CERRAR;
		for (i = 0; i < beneficios.length; i++)
			tablaHTML += TAG_TD_ABRIR + beneficios[i] + TAG_TD_CERRAR;
		tablaHTML += TAG_TD_ABRIR + (totalIngresos - totalGastos) + TAG_TD_CERRAR + "\n";
		tablaHTML += "\t" + TAG_TR_CERRAR + "\n"; 
		
		tablaHTML += TAG_TABLA_CERRAR;
		System.out.println(tablaHTML);
	}
	
	public static int addTwoDigits(int n) {
		String num = "" + n;		
		
		return ((int)(num.charAt(0) - '0') + (int) (num.charAt(1) - '0'));
		
	}
	
	public static int addTwoDigitsBis(int n) {		
		int decimal = n / 10;
				
		return (decimal + (n - decimal * 10));
		
	}
	
}
