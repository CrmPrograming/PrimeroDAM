package github.crmprograming.primerodam.trimestresegundo.ejerc.asociados;

public class Asociado {
	
	public static Asociado vocal;
	private String nombre;
	
	public Asociado(String dni) {
		if (vocal == null)
			vocal = this;
		
		nombre = dni;
	}
	
	public static void nombrarNuevoVocal(Asociado nuevo) {
		vocal = (nuevo != null)? nuevo : vocal;
	}
	
	public void opinar(String opinion) {
		if (this == vocal)
			System.out.printf("%s: %s\n", nombre, opinion);
		else 
			transmiteOpinion(opinion, nombre);
	}
	
	private void transmiteOpinion(String opinion, String nombre) {
		System.out.printf("De parte de %s: %s\n", nombre, opinion);
	}
	

}
