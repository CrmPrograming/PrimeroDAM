package program.ejerciciosPrueba;
import java.util.Scanner;

public class ComprobarNavidad {

	public static void main(String[] args) {
		Scanner teclado = new Scanner(System.in);
		int dia, mes, ano;
		final int DIA_NAVIDAD = 24;
		final int MES_NAVIDAD = 12;
		
		System.out.print("> Introduzca la fecha a comprobar (día, mes, año separados por espacio): ");
		dia = teclado.nextInt();
		mes = teclado.nextInt();
		ano = teclado.nextInt();
		teclado.close();
		System.out.println();
		
		if ((dia == DIA_NAVIDAD) && (mes == MES_NAVIDAD)) {
			System.out.println("> La fecha " + dia + "/" + mes + "/" + ano + " es Navidad");
		} else {
			System.out.println("> La fecha " + dia + "/" + mes + "/" + ano + "  NO es Navidad");
		}

	}

}
