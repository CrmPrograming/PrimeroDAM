package github.crmprograming.primerodam.trimestretercero.estructuras.cola;

import java.util.EmptyStackException;

import github.crmprograming.primerodam.trimestretercero.estructuras.lista.Nodo;

public class Cola implements Encolable<String> {
	
	private Nodo<String> top;
	private Nodo<String> tail;
	private int tam;
	
	public Cola() {
		top = tail = null;
		tam = 0;
	}
	
	public Cola(String d) {
		top = new Nodo<String>(d);
		tail = top;
		tam++;
	}

	@Override
	public boolean isEmpty() {		
		return tam == 0;
	}

	@Override
	public void insertar(String o) {
		Nodo<String> nuevo = new Nodo<String>(o);
		
		if (isEmpty())
			top = nuevo;
		else
			tail.setNext(nuevo);
		
		tail = nuevo;
		tam++;		
	}

	@Override
	public String extraer() throws EmptyStackException {
		if (isEmpty()) throw new EmptyStackException();
		
		String dato = top.getDato();
		top = top.getNext();
		
		if (top == null)
			tail = null;
		
		tam--;
		
		return dato;
	}

	@Override
	public int size() {
		return tam;
	}

}
