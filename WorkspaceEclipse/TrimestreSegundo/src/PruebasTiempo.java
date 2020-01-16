
public class PruebasTiempo {

	public static void main(String[] args) {
		final int A_BISIESTO = 2020, A_NO_BISIESTO = 2018, TIEMPO_SEGUNDOS = 5420;
		Tiempo t = new Tiempo();
		
		
		System.out.printf("> El año %d es bisiesto: %b\n", A_BISIESTO, Tiempo.esBisiesto(A_BISIESTO));
		System.out.printf("> El año %d es bisiesto: %b\n", A_NO_BISIESTO, Tiempo.esBisiesto(A_NO_BISIESTO));
		
		System.out.printf("> Tiempo por defecto en formato 12H: %s\n", t);
		
		t.set(17, 23, 59);
		
		System.out.printf("> Tiempo fijado en formato 12H: %s\n", t);
		
		Tiempo.formato24 = true;
		
		System.out.printf("> Tiempo fijado en formato 24H: %s\n", t);
		
		t.incremSeg();
		
		Tiempo.formato24 = false;
		
		System.out.printf("> Tiempo tras incremento a segundo: %s\n", t);
		
		t.set(23, 59, 59);
		
		System.out.printf("> Tiempo previo a incremento: %s\n", t);
		
		t.incremSeg();
		
		System.out.printf("> Tiempo tras incremento: %s\n", t);
		
		t.set(TIEMPO_SEGUNDOS);
		
		System.out.printf("> Convertir 1:30:20 de segundos a hora completa (%d): %s\n", TIEMPO_SEGUNDOS, t);

	}

}
