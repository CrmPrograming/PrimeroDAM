package github.crmprograming.primerodam.trimestretercero.estructuras.lista;

import java.util.EmptyStackException;

public class Lista {
	
	private Nodo<String> cabecera;
	private int total;
	
	public Lista() {
		cabecera = null;
		total = 0;
	}
	
	public Lista(String s) {
		cabecera = new Nodo<String>(s);
		total++;
	}
	
	public Nodo<String> getUltimo() throws EmptyStackException {
		if (estaVacia()) throw new EmptyStackException();
				
		Nodo<String> actual = getCabecera();
		
		while (actual.getNext() != null)
			actual = actual.getNext();
		
		return actual;		
	}
	
	public Nodo<String> getNodo(String d) throws EmptyStackException {
		if (estaVacia()) throw new EmptyStackException();
		
		Nodo<String> actual = getCabecera();
		
		while (actual.getNext() != null && !actual.getDato().equals(d))
			actual = actual.getNext();
		
		return (actual.getDato().equals(d))? actual : null;		
	}
	
	public void insertarPrincipio(String d) {
		insertarPrincipio(new Nodo<String>(d));
	}
	
	public void insertarPrincipio(Nodo<String> n) {		
		n.setNext(getCabecera());
		total++;
		
		setCabecera(n);
	}
	
	public void insertarFinal(String d) {
		insertarFinal(new Nodo<String>(d));
	}
	
	public void insertarFinal(Nodo<String> n) {
		Nodo<String> actual = getCabecera();
		
		if (estaVacia())
			insertarPrincipio(n);
		else {
			while (actual.getNext() != null)
				actual = actual.getNext();
			
			actual.setNext(n);
			total++;
		}
	}
	
	public void insertarPosicion(String d, int pos) {
		insertarPosicion(new Nodo<String>(d), pos);
	}
	
	public void insertarPosicion(Nodo<String> n, int pos) {
		Nodo<String> actual = getCabecera();
		int posActual = 0;
		
		if (estaVacia())
			insertarPrincipio(n);
		else {
			while (actual.getNext() != null && posActual < pos) {
				actual = actual.getNext();
				posActual++;
			}
			
			n.setNext(actual.getNext());
			actual.setNext(n);
			total++;
		}
	}
	
	public boolean estaVacia() {
		return total == 0;
	}

	public Nodo<String> getCabecera() {
		return cabecera;
	}

	public void setCabecera(Nodo<String> cabecera) {
		this.cabecera = cabecera;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

}
