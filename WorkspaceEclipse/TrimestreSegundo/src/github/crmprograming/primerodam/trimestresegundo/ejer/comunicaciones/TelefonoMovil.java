package github.crmprograming.primerodam.trimestresegundo.ejer.comunicaciones;

import java.util.ArrayList;

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
		if (cont < TAM_TLF_VALIDO)
			System.out.println("...número erroneo");
		else {
			
		}
	}
	
	public void cancelar() {
		
	}
	
	public void anularDigito() {
		
	}
	
	public void ponDigito(char dig) {
		
	}
	
	private void digito0() {
		
	}
	
	private void digito1() {
		
	}
	
	private void digito6() {
		
	}
	
	private void digito9() {
		
	}
	
	private void digito2() {
		
	}
	
	private void digito3() {
		
	}
	
	private void digito4() {
		
	}
	
	private void digito5() {
		
	}
	
	private void digito7() {
		
	}
	
	private void digito8() {
		
	}
	
}
