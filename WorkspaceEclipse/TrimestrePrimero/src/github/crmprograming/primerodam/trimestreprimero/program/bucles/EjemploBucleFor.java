package github.crmprograming.primerodam.trimestreprimero.program.bucles;
/**
Fichero: EjemploBucleFor.java
Incrementa el valor del objeto variable num, desde 1 hasta 10
mostrando con cada valor los reglones de la tabla de multiplicar del 4
**/
public class EjemploBucleFor {
	public static void main(String[] args) {
		int num;
		System.out.println(" TABLA DE MULTIPLICAR DEL 4");
		for(num = 1; num <= 10; num++)			
			System.out.printf("4 x %d = %d\n", num, (4 * num));
	}
}