package github.crmprograming.primerodam.trimestreprimero.program.variables;
import java.util.Scanner;

public class CompradorCliente {
		
	public static void main(String[] args) {		
		// Declaración de variables y objetos locales
	    Scanner teclado = new Scanner(System.in);	    
	    float precio, abonado;
	    int bil50, bil20, bil10, bil5, mon2, mon1, cent50, cent20, cent10, cent5, cent2, cent1;
	    int centimos, abonadoAuxiliar;
	    float cantidadCliente;
	    final int VALOR_BILL50 = 50;
	    final int VALOR_BILL20 = 20;
	    final int VALOR_BILL10 = 10;
	    final int VALOR_BILL5 = 5;
	    final int VALOR_MON2 = 2;
	    final int VALOR_MON1 = 1;
	    final int VALOR_CENT50 = 50;
	    final int VALOR_CENT20 = 20;
	    final int VALOR_CENT10 = 10;
	    final int VALOR_CENT5 = 5;
	    final int VALOR_CENT2 = 2;
	    final int VALOR_CENT1 = 1;
	    bil50 = bil20 = bil10 = bil5 = mon2 = mon1 = cent50 = cent20 = cent10 = cent5 = cent2 = cent1 = 0;
	    
	    // Sollicitud de datos por pantalla
	    System.out.println("########################");
	    System.out.println("#  CÁLCULO DE PRECIO Y #");
	    System.out.println("#   MONEDAS NECESARIAS #");	    
	    System.out.println("########################");
	    System.out.println();
	    System.out.print("> Introduzca el importe del artículo: ");
	    precio = teclado.nextFloat();
	    System.out.print("> Introduzca cuántos artículos quiere el cliente: ");
	    cantidadCliente = teclado.nextFloat();	    
	    teclado.close();
	    
	    // Calculamos el precio total
	    abonado = cantidadCliente * precio;
	    System.out.println("> El cliente va a comprar " + cantidadCliente + " unidades por " + abonado + " €");
						
	    // Calculamos el total de cada tipo de moneda y billete
		abonadoAuxiliar = (int) abonado;
	
		// Separamos la parte decimal o céntimos del abono total para calcularlo por separado
		centimos = (int) (abonado * 100) - (abonadoAuxiliar * 100);
		
		// Calculamos cuántos billetes de 50 hacen falta
		bil50 = abonadoAuxiliar / VALOR_BILL50;		
		abonado = (int) (abonado - (VALOR_BILL50 * bil50));
		abonadoAuxiliar = (int) abonado;		

		// Calculamos cuántos billetes de 20 hacen falta		
		bil20 = abonadoAuxiliar / VALOR_BILL20;
		abonado = (int) (abonado - (VALOR_BILL20 * bil20));
		abonadoAuxiliar = (int) abonado;

		// Calculamos cuántos billetes de 10 hacen falta
		bil10 = abonadoAuxiliar / VALOR_BILL10;
		abonado = (int) (abonado - (VALOR_BILL10 * bil10));
		abonadoAuxiliar = (int) abonado;		

		// Calculamos cuántos billetes de 5 hacen falta
		bil5 = abonadoAuxiliar / VALOR_BILL5;
		abonado = (int) (abonado - (VALOR_BILL5 * bil5));
		abonadoAuxiliar = (int) abonado;

		// Calculamos cuántas monedas de 2 hacen falta
		mon2 = abonadoAuxiliar / VALOR_MON2;
		abonado = (int) (abonado - (VALOR_MON2 * mon2));
		abonadoAuxiliar = (int) abonado;

		// Calculamos cuántas monedas de 1 hacen falta
		mon1 = abonadoAuxiliar / VALOR_MON1;
		abonado = (int) (abonado - (VALOR_MON1 * mon1));

		// Calculamos cuántos céntimos de 50 hacen falta
		cent50 = centimos / VALOR_CENT50;
		centimos = (int) (centimos - (VALOR_CENT50 * cent50));
		abonadoAuxiliar = (int) centimos;

		// Calculamos cuántos céntimos de 20 hacen falta
		cent20 = abonadoAuxiliar / VALOR_CENT20;
		centimos = (int) (centimos - (VALOR_CENT20 * cent20));
		abonadoAuxiliar = (int) centimos;
		
		// Calculamos cuántos céntimos de 10 hacen falta
		cent10 = abonadoAuxiliar / VALOR_CENT10;
		centimos = (int) (centimos - (VALOR_CENT10 * cent10));
		abonadoAuxiliar = (int) centimos;
		
		// Calculamos cuántos céntimos de 5 hacen falta
		cent5 = abonadoAuxiliar / VALOR_CENT5;
		centimos = (int) (centimos - (VALOR_CENT5 * cent5));
		abonadoAuxiliar = (int) centimos;
		
		// Calculamos cuántos céntimos de 2 hacen falta
		cent2 = abonadoAuxiliar / VALOR_CENT2;
		centimos = (int) (centimos - (VALOR_CENT2 * cent2));
		abonadoAuxiliar = (int) centimos;
		
		// Calculamos cuántos céntimos de 1 hacen falta
		cent1 = abonadoAuxiliar / VALOR_CENT1;
		centimos = (int) (centimos - (VALOR_CENT1 * cent1));
		abonadoAuxiliar = (int) centimos;
		
		// Mostramos la cantidad de cada unidad que hace falta
		System.out.println("> La cantidad de monedas de cada tipo son:");
		System.out.println("- Billete de 50: " + bil50);
		System.out.println("- Billete de 20: " + bil20);
		System.out.println("- Billete de 10: " + bil10);
		System.out.println("- Billete de 5: " + bil5);
		System.out.println("- Moneda de 2: " + mon2);
		System.out.println("- Moneda de 1: " + mon1);
		System.out.println("- Céntimo de 0.5: " + cent50);
		System.out.println("- Céntimo de 0.2: " + cent20);
		System.out.println("- Céntimo de 0.1: " + cent10);
		System.out.println("- Céntimo de 0.05: " + cent5);
		System.out.println("- Céntimo de 0.02: " + cent2);
		System.out.println("- Céntimo de 0.01: " + cent1);	    
	}

}
