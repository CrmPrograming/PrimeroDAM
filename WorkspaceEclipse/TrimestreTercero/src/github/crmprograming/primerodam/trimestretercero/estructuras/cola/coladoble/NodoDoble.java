package github.crmprograming.primerodam.trimestretercero.estructuras.cola.coladoble;

public class NodoDoble<T> {
	
	private T dato;
	private NodoDoble<T> next;
	private NodoDoble<T> last;
	
	public NodoDoble(T d) {
		this(d, null, null);
	}
	
	public NodoDoble(T d, NodoDoble<T> n, NodoDoble<T> l) {
		setDato(d);
		setNext(n);
		setLast(l);
	}
	
	public T getDato() {
		return dato;
	}
	
	public void setDato(T dato) {
		this.dato = dato;
	}
	
	public NodoDoble<T> getNext() {
		return next;
	}
	
	public void setNext(NodoDoble<T> next) {
		this.next = next;
	}
	
	public NodoDoble<T> getLast() {
		return last;
	}
	
	public void setLast(NodoDoble<T> last) {
		this.last = last;
	}

}
