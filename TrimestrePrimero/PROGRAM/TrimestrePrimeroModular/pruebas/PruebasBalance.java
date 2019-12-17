import java.util.ArrayList;

import funciones.matematicas.Matematicas;

public class PruebasBalance {

	public static void main(String[] args) {
		int[][] valores = {{50, 20},
				   {100, 50},
				   {35, 20}, 
				   {80, 40}};
		
		ArrayList<Integer> actual;
		ArrayList<ArrayList<Integer>> balance = new ArrayList<ArrayList<Integer>>();
		int i = 0, j = 0;
		for (i = 0; i < valores.length; i++) {
			actual = new ArrayList<Integer>();
			for (j = 0; j < valores[i].length; j++)
				actual.add(valores[i][j]);
			balance.add(actual);
		}
		
		System.out.println(balance);
		System.out.printf("BALANCE TOTAL: %+d", Matematicas.totalBalance(balance));

	}

}
