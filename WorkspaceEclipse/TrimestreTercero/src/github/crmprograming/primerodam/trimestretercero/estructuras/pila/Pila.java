package github.crmprograming.primerodam.trimestretercero.estructuras.pila;

import java.util.EmptyStackException;

import github.crmprograming.primerodam.trimestretercero.estructuras.lista.Nodo;

public class Pila implements Apilable<String> {
	
	private Nodo<String> top;
	private int size;
	
	public Pila() {
		top = null;
		size = 0;
	}

	@Override
	public void push(String o) {
		Nodo<String> n = new Nodo<String>(o, top);
		top = n;
		size++;
	}

	@Override
	public String pop() throws EmptyStackException {
		if (isEmpty()) throw new EmptyStackException();
		
		String dato = top.getDato();
		top = top.getNext();
		size--;
		
		return dato;
	}

	@Override
	public String top() throws EmptyStackException {
		if (isEmpty()) throw new EmptyStackException();
				
		return top.getDato();
	}

	@Override
	public int size() {
		return size;
	}

	@Override
	public boolean isEmpty() {
		return size() == 0;
	}

}
