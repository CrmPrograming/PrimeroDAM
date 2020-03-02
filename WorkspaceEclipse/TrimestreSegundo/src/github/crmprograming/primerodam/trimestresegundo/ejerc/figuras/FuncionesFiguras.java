package github.crmprograming.primerodam.trimestresegundo.ejerc.figuras;

public class FuncionesFiguras {

	public static int buscar(Figura[] figuras, Figura f) {
		int pos = 0;
		
		while (pos < figuras.length - 1 && !figuras[pos].equals(f))
			pos++;
			
		return (figuras[pos].equals(f))? pos : -1;
	}

}
