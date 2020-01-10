package program.pruebas;

public class ActualizacionVectores {

	public static void main(String[] args) {
		int[] a = {1, 2, 3};
		int[] b = a;
		
		System.out.println(a[0]);
		System.out.println(b[0]);
		
		a[0] = -5;
		
		System.out.println(a[0]);
		System.out.println(b[0]);
		
		b[1] = 57;
		
		System.out.println(a[1]);
		System.out.println(b[1]);

	}

}
