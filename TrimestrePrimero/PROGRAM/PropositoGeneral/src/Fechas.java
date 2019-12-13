
public class Fechas {
	
	public static int[] convertirSegundos(long segundos) {
		final int H = 0, M = 1, S = 2;
		int[] tiempo = new int[3];
		long tSegundos = segundos;
		
		tiempo[S] = (int) (tSegundos % 60);
		tSegundos = tSegundos / 60;
		
		tiempo[M] = (int) (tSegundos % 60);
		tSegundos = tSegundos / 60;
		
		tiempo[H] = (int) (tSegundos % 24);		
		
		return (tiempo);
	}

}
