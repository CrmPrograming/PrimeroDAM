import java.util.ArrayList;
import java.util.Arrays;

import github.crmprograming.primerodam.trimestreprimeromodular.funciones.matematicas.Matematicas;

public class PruebasBalance {

	public static void main(String[] args) {		

		ArrayList<ArrayList<Integer>> balance = new ArrayList<ArrayList<Integer>>() {			
			private static final long serialVersionUID = 1L;

			{
				add(new ArrayList<Integer>(Arrays.asList(50, 20)));
				add(new ArrayList<Integer>(Arrays.asList(100, 50)));
				add(new ArrayList<Integer>(Arrays.asList(35, 20)));
				add(new ArrayList<Integer>(Arrays.asList(80, 40)));
			}
		};
		
		System.out.println(balance);
		System.out.println("Media Gastos: " +  Matematicas.mediaGastos(balance));
		System.out.println("Balance Total: " +  Matematicas.totalBalance(balance));
	}

}
