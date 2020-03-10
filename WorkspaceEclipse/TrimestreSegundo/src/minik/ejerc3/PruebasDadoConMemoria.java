package minik.ejerc3;

public class PruebasDadoConMemoria {

	public static void main(String[] args) {
		DadoConMemoria d = new DadoConMemoria();
		int[] tiradas;
		int i, j;
		
		tiradas = d.historico();
		System.out.print("[");
		for (i = 0; i < tiradas.length; i++)
			System.out.print(tiradas[i] + " ");
		System.out.println("]");
		
		
		for (j = 0; j < 10; j++) {
			d.lanzarDado();
			tiradas = d.historico();
			System.out.print("[");
			for (i = 0; i < tiradas.length; i++)
				System.out.print(tiradas[i] + " ");
			System.out.println("]");
		}
		
		d.reset();
		System.out.println("---------------------");
		for (j = 0; j < 10; j++) {
			d.lanzarDado();
			tiradas = d.historico();
			System.out.print("[");
			for (i = 0; i < tiradas.length; i++)
				System.out.print(tiradas[i] + " ");
			System.out.println("]");
		}
	}

}
