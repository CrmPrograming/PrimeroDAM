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
	
	private void ponDigito(char dig) {
		if (cont < MAX_DIGITOS) {
			if (cont > 0 || (cont == 0 && (dig == '0' || dig == '1' || dig == '6' || dig == '9')))
				switch (dig) {
				case '0':
					digitos[cont] = '0';
					cont++;
					break;
				case '1':
					digitos[cont] = '1';
					cont++;
					break;
				case '2':
					digitos[cont] = '2';
					cont++;
					break;
				case '3':
					digitos[cont] = '3';
					cont++;
					break;
				case '4':
					digitos[cont] = '4';
					cont++;
					break;
				case '5':
					digitos[cont] = '5';
					cont++;
					break;
				case '6':
					digitos[cont] = '6';
					cont++;
					break;
				case '7':
					digitos[cont] = '7';
					cont++;
					break;
				case '8':
					digitos[cont] = '8';
					cont++;
					break;
				case '9':
					digitos[cont] = '9';
					cont++;
					break;
				default:
					System.out.println("> ERROR: El valor introducido no se corresponde al de un dígito");
				}
		} else
			System.out.println("> ERROR: Capacidad máxima alcanzada, imposible añadir más dígitos");
		
	}
	
	public void digito0() {
		ponDigito('0');
	}
	
	public void digito1() {
		ponDigito('1');
	}
	
	public void digito6() {
		ponDigito('6');
	}
	
	public void digito9() {
		ponDigito('9');
	}
	
	public void digito2() {
		ponDigito('2');
	}
	
	public void digito3() {
		ponDigito('3');
	}
	
	public void digito4() {
		ponDigito('4');
	}
	
	public void digito5() {
		ponDigito('5');
	}
	
	public void digito7() {
		ponDigito('7');
	}
	
	public void digito8() {
		ponDigito('8');
	}
	
}
