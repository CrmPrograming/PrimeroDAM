package minik.ejerc2;

public class PruebasMiLista {

	public static void main(String[] args) {
		MiLista l = new MiLista(new String[] {});
		MiLista l2 = new MiLista(new String[] {});
		
		System.out.println(l);
		
		l.add(1, "Jarra");
		l.add(2, "Cinco");
		l.add(0, "Damasco");
		l.add(3, "La Laguna");
		
		System.out.println(l);
		
		l2.add(2, "DatoEnPos");
		l2.add(0, "OtroDatoEnPos0");
		l2.add(20, "DatoEnPos2");
		
		System.out.println(l2);
	}


}
