package program.ejerciciosPrueba;

public class MaximoTres {

	public static void mostrar(int i, int[] v) {
		if (i != v.length) {
			System.out.print(v[i] + " ");
			mostrar(i+1, v);
			
		}			
		
		
	}
	
	public static void main(String[] args) {
		
		int[] listado = new int[10];
		
		for (int i = 0; i < listado.length; i++) {
			listado[i] = (int) (Math.random() * 100);
			System.out.print(listado[i] + " ");
		}
		
		System.out.println();
		System.out.println();
		mostrar(0, listado);
	}

}
