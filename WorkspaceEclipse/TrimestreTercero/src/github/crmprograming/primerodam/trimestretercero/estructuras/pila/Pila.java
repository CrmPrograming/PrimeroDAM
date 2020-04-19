package github.crmprograming.primerodam.trimestretercero.estructuras.pila;

import java.util.EmptyStackException;

import github.crmprograming.primerodam.trimestretercero.estructuras.lista.Nodo;

public class Pila implements Apilable<String> {
	
	private Nodo<String> top;
	private int tam;
	
	public Pila() {
		top = null;
		tam = 0;
	}

	@Override
	public void push(String o) {
		Nodo<String> n = new Nodo<String>(o, top);
		top = n;
		tam++;
	}

	@Override
	public String pop() throws EmptyStackException {
		if (isEmpty()) throw new EmptyStackException();
		
		String dato = top.getDato();
		top = top.getNext();
		tam--;
		
		return dato;
	}

	@Override
	public String top() throws EmptyStackException {
		if (isEmpty()) throw new EmptyStackException();
				
		return top.getDato();
	}

	@Override
	public int size() {
		return tam;
	}

	@Override
	public boolean isEmpty() {
		return size() == 0;
	}

}
