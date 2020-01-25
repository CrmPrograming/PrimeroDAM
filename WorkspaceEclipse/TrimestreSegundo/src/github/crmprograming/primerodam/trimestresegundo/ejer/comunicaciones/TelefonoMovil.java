package github.crmprograming.primerodam.trimestresegundo.ejer.comunicaciones;

import java.util.ArrayList;
import java.util.Arrays;

public class TelefonoMovil {
	
	private static ArrayList<String> listado;
	private String miNumero;
	private char[] digitos;
	private int cont;
	
	private final int MAX_DIGITOS = 20;
	private final int TAM_TLF_VALIDO = 9;
	
	static {
		listado = new ArrayList<String>();
	}
	
	public TelefonoMovil(String numero) {
		if (listado.contains(numero))
			throw new IllegalStateException("ERROR: Dicho número ya existe en el listado");
		
		digitos = new char[MAX_DIGITOS];
		cont = 0;
		miNumero = numero;
		listado.add(numero);	
	}
	
	public void llamar() {
		int i;
		if (cont < TAM_TLF_VALIDO)
			System.out.println("...número erroneo");
		else {
			if (miNumero.length() == digitos.length && Arrays.equals(digitos, miNumero.toCharArray()))
				System.out.println("...llamada fallida: intentando llamar a si mismo.");
			else {
				System.out.print("...llamada realizada al: ");
				for (i = 0; i < cont; i++)
					System.out.print(digitos[i] + " ");
				System.out.println(".");
			}
		}
	}
	
	public void cancelar() {
		if (cont >= TAM_TLF_VALIDO)
			System.out.println("...llamada anulada");
		cont = 0;
	}
	
	public void anularDigito() {
		if (cont > 0) {
			System.out.println('\b');		
			cont--;
		}
	}
	
	public void ponDigito(char dig) {
		if (cont < MAX_DIGITOS) {
			if (cont > 0 || (cont == 0 && (dig == '0' || dig == '1' || dig == '6' || dig == '9')))
				switch (dig) {
				case '0':
					digito0();
					cont++;
					break;
				case '1':
					digito1();
					cont++;
					break;
				case '2':
					digito2();
					cont++;
					break;
				case '3':
					digito3();
					cont++;
					break;
				case '4':
					digito4();
					cont++;
					break;
				case '5':
					digito5();
					cont++;
					break;
				case '6':
					digito6();
					cont++;
					break;
				case '7':
					digito7();
					cont++;
					break;
				case '8':
					digito8();
					cont++;
					break;
				case '9':
					digito9();
					cont++;
					break;
				default:
					System.out.println("> ERROR: El valor introducido no se corresponde al de un dígito");
				}
		} else
			System.out.println("> ERROR: Capacidad máxima alcanzada, imposible añadir más dígitos");
		
	}
	
	private void digito0() {
		digitos[cont] = '0';
	}
	
	private void digito1() {
		digitos[cont] = '1';
	}
	
	private void digito6() {
		digitos[cont] = '6';
	}
	
	private void digito9() {
		digitos[cont] = '9';
	}
	
	private void digito2() {
		digitos[cont] = '2';
	}
	
	private void digito3() {
		digitos[cont] = '3';
	}
	
	private void digito4() {
		digitos[cont] = '4';
	}
	
	private void digito5() {
		digitos[cont] = '5';
	}
	
	private void digito7() {
		digitos[cont] = '7';
	}
	
	private void digito8() {
		digitos[cont] = '8';
	}
	
}
