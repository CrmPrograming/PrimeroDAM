package minik.ejerc.herenciainterfaces.ejercicio6;

public class AlgoritmoOrdena {
	
	public static void ordenar(Comparable lista[]) {
		for (int i = 0; i < lista.length; i++)
			for (int j = lista.length-1; j > i; j--)
				if (lista[j].compareTo(lista[j-1]) < 0) {
					Comparable aux = lista[j];
					
					lista[j] = lista[j - 1];
					lista[j - 1] = aux;
				}

	}
	
	public static void main(String[] args) {
		A[] l = new A[10];
		Figura[] f = new Figura[10];
		int i;
		
		for (i = 0; i < l.length; i++) {
			l[i] = new A((int) (Math.random() * 100));
			f[i] = (i % 2 == 0)? new Rectangulo((int) (Math.random() * 100), (int) (Math.random() * 100)) : new Circulo((int) (Math.random() * 100));
		}
		
		for (i = 0; i < l.length; i++)
			System.out.print(l[i] + " ");
		System.out.println();
		
		ordenar(l);
		
		for (i = 0; i < l.length; i++)
			System.out.print(l[i] + " ");
		
		System.out.println();
		
		for (i = 0; i < f.length; i++)
			System.out.print(f[i] + " ");
		System.out.println();
		
		ordenar(f);
		
		for (i = 0; i < f.length; i++)
			System.out.print(f[i] + " ");		
		
	}

}
