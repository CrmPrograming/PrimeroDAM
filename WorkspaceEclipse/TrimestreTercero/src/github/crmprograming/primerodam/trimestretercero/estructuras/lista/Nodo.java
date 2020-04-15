package github.crmprograming.primerodam.trimestretercero.estructuras.lista;

public class Nodo<T> {
	
	private T dato;
	private Nodo<T> next;
	
	public Nodo(T d) {
		this(d, null);
	}
	
	public Nodo(T d, Nodo<T> n) {
		setDato(d);
		setNext(n);
	}
	
	public T getDato() {
		return dato;
	}
	public void setDato(T dato) {
		this.dato = dato;
	}
	public Nodo<T> getNext() {
		return next;
	}
	public void setNext(Nodo<T> next) {
		this.next = next;
	}
	
}
