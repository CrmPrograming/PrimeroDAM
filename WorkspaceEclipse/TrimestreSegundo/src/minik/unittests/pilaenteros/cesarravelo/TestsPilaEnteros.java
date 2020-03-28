package minik.unittests.pilaenteros.cesarravelo;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.Before;
import org.junit.Test;

import github.crmprograming.primerodam.trimestresegundo.estructurasDatos.PilaEnteros;

public class TestsPilaEnteros {
	
	private PilaEnteros pLlena, pVacia, pIntermedia;
	private final int MAX_CAPACIDAD = 10;
	
	@Before
	public void inicializar() {
		int i;
		int[] valoresIniciales = {2, 5, 4, 8, 1, 0, 11, 23, 9, 7};
		
		pLlena = new PilaEnteros(MAX_CAPACIDAD);
		pVacia = new PilaEnteros(MAX_CAPACIDAD);
		pIntermedia = new PilaEnteros(MAX_CAPACIDAD);
		for (i = 0; i < MAX_CAPACIDAD; i++) {
			pLlena.apilar(valoresIniciales[i]);
			if (i % 2 == 0)
				pIntermedia.apilar(valoresIniciales[i]);
		}
	}
	
	@Test(expected = IllegalArgumentException.class)
	public void testImprimirConTotalVacia() {
		PilaEnteros.imprimirConTotal(null);
	}
	
	@Test(expected = IllegalArgumentException.class)
	public void testConstructorNegativo() {
		new PilaEnteros(-1);
	}
	
	@Test
	public void testVacia_llena() {
		assertFalse(pLlena.vacia());
	}
	
	@Test
	public void testVacia_vacia() {
		assertTrue(pVacia.vacia());
	}
	
	@Test
	public void testVacia_intermedia() {
		assertFalse(pIntermedia.vacia());
	}
	
	@Test
	public void testLlena_llena() {
		assertTrue(pLlena.llena());
	}
	
	@Test
	public void testLlena_vacia() {		
		assertFalse(pVacia.llena());
	}
	
	@Test
	public void testLlena_intermedia() {
		assertFalse(pIntermedia.llena());
	}
	
	@Test
	public void testCima_llena() {
		assertTrue(7 == pLlena.cima());
	}
	
	@Test
	public void testCima_intermedia() {
		assertTrue(9 == pIntermedia.cima());
	}
	
	@Test(expected = ArrayIndexOutOfBoundsException.class)
	public void testCima_vacia() {
		pVacia.cima();
	}
	
	@Test
	public void testToString_llena() {
		assertTrue("Cima: 9, Pila: [2 5 4 8 1 0 11 23 9 7]".equals(pLlena.toString()));		
	}
	
	@Test
	public void testToString_vacia() {		
		assertTrue("Cima: -1, Pila: [0 0 0 0 0 0 0 0 0 0]".equals(pVacia.toString()));		
	}
	
	@Test
	public void testToString_intermedia() {		
		assertTrue("Cima: 4, Pila: [2 4 1 11 9 0 0 0 0 0]".equals(pIntermedia.toString()));
	}
	
	@Test(expected = IllegalStateException.class)
	public void testApilar_llena() {
		pLlena.apilar(5);
	}
	
	@Test
	public void testApilar_intermedia() {
		pIntermedia.apilar(5);
		assertTrue(5 == pIntermedia.cima());
	}
	
	@Test
	public void testApilar_vacia() {
		assertTrue(pVacia.vacia());
		pVacia.apilar(5);
		assertTrue(5 == pVacia.cima());
		assertFalse(pVacia.vacia());
	}
	
	@Test
	public void testDesapilar_llena() {
		assertTrue(pLlena.llena());
		assertTrue(pLlena.desapilar() == 7);
		assertFalse(pLlena.llena());
	}
	
	@Test
	public void testDesapilar_intermedia() {
		assertTrue(pIntermedia.desapilar() == 9);		
	}
	
	@Test(expected = IllegalStateException.class)
	public void testDesapilar_vacia() {
		pVacia.desapilar();		
	}
	
}
