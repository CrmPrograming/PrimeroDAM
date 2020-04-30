package github.crmprograming.primerodam.trimestretercero.estructuras.cola.coladoble;

import java.util.EmptyStackException;

import github.crmprograming.primerodam.trimestretercero.estructuras.lista.Nodo;

public class ColaDoble implements DobleEncolable<String> {
	
	private NodoDoble<String> cabeza;
	private NodoDoble<String> cola;
	private int tam;
	
	public ColaDoble() {
		cabeza = cola = null;		
		tam = 0;
	}
	
	public ColaDoble(String d) {
		cabeza = new NodoDoble<String>(d);
		cola = cabeza;
		tam++;
	}

	@Override
	public int size() {
		return tam;
	}

	@Override
	public boolean isEmpty() {		
		return tam == 0;
	}

	@Override
	public void putTop(String o) {
		NodoDoble<String> nuevo = new NodoDoble<String>(o);
		
		if (isEmpty())
			cola = nuevo;
		else
			nuevo.setNext(cabeza);
		
		cabeza.setLast(nuevo);
		cabeza = nuevo;
		tam++;
	}

	@Override
	public void putBack(String o) {
		NodoDoble<String> nuevo = new NodoDoble<String>(o);
		
		if (isEmpty())
			cabeza = nuevo;
		else
			cola.setNext(nuevo);
		
		nuevo.setLast(cola);
		cola = nuevo;
		tam++;
	}

	@Override
	public String getTop() throws EmptyStackException {
		if (isEmpty()) throw new EmptyStackException();
		
		String dato = cabeza.getDato();
		cabeza = cabeza.getNext();
		
		if (cabeza == null)
			cola = null;
		else
			cabeza.setLast(null);
		
		tam--;
		
		return dato;
	}

	@Override
	public String getBack() throws EmptyStackException {
		if (isEmpty()) throw new EmptyStackException();
		
		String dato = cola.getDato();
		cola = cola.getLast();
		
		if (cola == null)
			cabeza = null;
		else
			cola.setNext(null);
		
		tam--;
		
		return dato;
	}

	public NodoDoble<String> getCabeza() {
		return cabeza;
	}

	public void setCabeza(NodoDoble<String> cabeza) {
		this.cabeza = cabeza;
	}

	public NodoDoble<String> getCola() {
		return cola;
	}

	public void setCola(NodoDoble<String> cola) {
		this.cola = cola;
	}	

}
