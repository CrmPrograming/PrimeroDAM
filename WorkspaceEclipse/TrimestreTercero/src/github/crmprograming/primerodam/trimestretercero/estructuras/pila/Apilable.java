package github.crmprograming.primerodam.trimestretercero.estructuras.pila;

import java.util.EmptyStackException;

public interface Apilable<T> {
	public void push(T o);	
	public T pop() throws EmptyStackException;
	public T top() throws EmptyStackException;
	public int size();
	public boolean isEmpty();
}
