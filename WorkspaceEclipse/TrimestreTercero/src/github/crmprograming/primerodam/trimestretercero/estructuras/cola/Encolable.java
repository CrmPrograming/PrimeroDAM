package github.crmprograming.primerodam.trimestretercero.estructuras.cola;

import java.util.EmptyStackException;

public interface Encolable<T> {
	public int size();
	public boolean isEmpty();
	public void insertar(T o);
	public T extraer() throws EmptyStackException;
}
