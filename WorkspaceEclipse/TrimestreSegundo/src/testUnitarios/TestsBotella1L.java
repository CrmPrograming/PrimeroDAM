package testUnitarios;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import org.junit.jupiter.api.Test;

import utenciliosCocina.Botella1L;

public class TestsBotella1L {

	@Test
	public void pruebasEstadoBotella() {
		Botella1L tester = new Botella1L();
		
		assertTrue("Estado por defecto de la botella", !tester.estaCerrada());
		assertTrue("Estado por defecto de la botella 2", tester.estaAbierta());
		
		tester.cerrar();
		
		assertTrue("Estado por defecto de la botella 3", tester.estaCerrada());
		assertTrue("Estado por defecto de la botella 4", !tester.estaAbierta());
		
	}
	
	@Test
	public void pruebasModificarContenido() {
		Botella1L tester = new Botella1L();		
		
		assertEquals("Modificar contenido, intento de añadir estando abierta", 0f, tester.anadir(0.5f), 0.001);
		
		tester.cerrar();
		
		assertEquals("Modificar contenido, intento de añadir estando cerrada", 0.5f, tester.anadir(0.5f), 0.001);
		
		tester.abrir();
		
		assertEquals("Modificar contenido, intento de añadir más de la capacidad máxima", 0.1f, tester.anadir(0.6f), 0.001);
		
		assertEquals("Modificar contenido, intento de extraer hasta capacidad máxima", 0f, tester.extraer(1f), 0.001);
		
		assertEquals("Modificar contenido, intento de extraer más de la capacidad máxima", 1f, tester.extraer(1f), 0.001);
		
	}
	
	@Test
	public void pruebasToString() {
		Botella1L tester = new Botella1L();
		
		assertEquals("ToString() botella inicial", "0,00 (abierta)", tester.toString());
		tester.cerrar();
		assertEquals("ToString() botella cerrada", "0,00 (cerrada)", tester.toString());
		
		tester.anadir(0.5f);
		assertEquals("ToString() intento de añadir estando cerrada", "0,00 (cerrada)", tester.toString());
		
		tester.abrir();
		tester.anadir(0.5f);
		assertEquals("ToString() intento de añadir estando abierta", "0,50 (abierta)", tester.toString());
		
	}
	
}
