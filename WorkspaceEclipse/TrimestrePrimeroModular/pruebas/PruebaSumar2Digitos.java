import github.crmprograming.primerodam.trimestreprimeromodular.funciones.matematicas.Matematicas;

public class PruebaSumar2Digitos {
	
	public static void main(String[] args) {
		int n = 23;
		
		System.out.println(Matematicas.addTwoDigits(n));
		System.out.println(System.currentTimeMillis());
		System.out.println(Matematicas.addTwoDigitsBis(n));
		System.out.println(System.currentTimeMillis());
	}

}
