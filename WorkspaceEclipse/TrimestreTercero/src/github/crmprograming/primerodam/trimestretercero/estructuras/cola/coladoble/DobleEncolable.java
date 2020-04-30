package github.crmprograming.primerodam.trimestretercero.estructuras.cola.coladoble;

import java.util.EmptyStackException;

public interface DobleEncolable<T> {
	public int size();
	public boolean isEmpty();
	public void putTop(T o);
	public void putBack(T o);
	public T getTop() throws EmptyStackException;
	public T getBack() throws EmptyStackException;
}
