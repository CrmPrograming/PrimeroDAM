package github.crmprograming.primerodam.trimestresegundo.ejer.comunicaciones;

import java.util.ArrayList;
import java.util.Arrays;

/**
 * Clase gestora de simular un teléfono móvil.
 * Comprueba que no existan instancias con el mismo número
 * de teléfono creadas.
 * @author César Ravelo Martínez
 *
 */
public class TelefonoMovil {
	
	/**
	 * ArrayList<String> estático el cual controla todos los teléfonos creados.
	 */
	private static ArrayList<String> listado;
	
	/**
	 * Constante entera para el límite de dígitos permitidos.
	 */
	private static final int MAX_DIGITOS = 20;
	
	/**
	 * Constante entera con el tamaño mínimo válido para cualquier número de teléfono.
	 */
	private static final int TAM_TLF_VALIDO = 9;
	
	/**
	 * String con el número de teléfono asociado a la instancia.
	 */
	private String miNumero;
	
	/**
	 * Tabla de caracteres con los dígitos pulsados.
	 */
	private char[] digitos;
	
	/**
	 * Entero representativo de la cantidad de dígitos almacenados en el atributo digitos.
	 */
	private int cont;	
	
	/**
	 * Inicializador estático del listado.
	 */
	static {
		listado = new ArrayList<String>();
	}
	
	/**
	 * Constructor de la clase inicializándola al nº de teléfono propio de la instancia.
	 * Si dicho nº ya fue guardado en otra instancia, lanza una IllegalStateException
	 * 
	 * @param numero String con el nº a asignarle al objeto
	 */
	public TelefonoMovil(String numero) {
		if (listado.contains(numero))
			throw new IllegalStateException("ERROR: Dicho número ya existe en el listado");
		
		digitos = new char[MAX_DIGITOS];
		cont = 0;
		miNumero = numero;
		listado.add(numero);	
	}
	
	/**
	 * Método encargado de simular una llamada al número de teléfono contenido
	 * en la tabla digitos.
	 * 
	 * - No permite llamarse a si mismo
	 * - No permite llamar a un número que no tenga el tamaño mínimo 
	 */
	public void llamar() {
		int i;
		if (cont < TAM_TLF_VALIDO)
			System.out.println("...número erroneo");
		else {
			if (miNumero.length() == cont && new String(digitos, 0, cont).equals(miNumero))
				System.out.println("...llamada fallida: intentando llamar a si mismo.");
			else {
				System.out.print("...llamada realizada al: ");
				for (i = 0; i < cont; i++)
					System.out.print(digitos[i] + " ");
				System.out.println(".");
			}
		}
	}
	
	/**
	 * Método encargado de anular la posible llamada actual,
	 * reiniciando el contador a 0.
	 */
	public void cancelar() {
		if (cont >= TAM_TLF_VALIDO)
			System.out.println("...llamada anulada");
		cont = 0;
	}
	
	/**
	 * Método encargado de anular el último dígito almacenado.
	 */
	public void anularDigito() {
		if (cont > 0) {
			System.out.println('\b');
			cont--;
		}
	}
	
	/**
	 * Método encargado de almacenar el último dígito leído.
	 * Si se supera la capacidad máxima permitida para un teléfono,
	 * no almacena el dígito.
	 * 
	 * @param dig char con el último dígito introducido
	 */
	private void ponDigito(char dig) {
		if (cont < MAX_DIGITOS)
			if (cont > 0 || (dig == '0' || dig == '1' || dig == '6' || dig == '9'))
				digitos[cont++] = dig;
	}
	
	/**
	 * Método encargado de simular el introducir el dígito 0.
	 */
	public void digito0() {
		ponDigito('0');
	}
	
	/**
	 * Método encargado de simular el introducir el dígito 1.
	 */
	public void digito1() {
		ponDigito('1');
	}
	
	/**
	 * Método encargado de simular el introducir el dígito 6.
	 */
	public void digito6() {
		ponDigito('6');
	}
	
	/**
	 * Método encargado de simular el introducir el dígito 9.
	 */
	public void digito9() {
		ponDigito('9');
	}
	
	/**
	 * Método encargado de simular el introducir el dígito 2.
	 */
	public void digito2() {
		ponDigito('2');
	}
	
	/**
	 * Método encargado de simular el introducir el dígito 3.
	 */
	public void digito3() {
		ponDigito('3');
	}
	
	/**
	 * Método encargado de simular el introducir el dígito 4.
	 */
	public void digito4() {
		ponDigito('4');
	}
	
	/**
	 * Método encargado de simular el introducir el dígito 5.
	 */
	public void digito5() {
		ponDigito('5');
	}
	
	/**
	 * Método encargado de simular el introducir el dígito 7.
	 */
	public void digito7() {
		ponDigito('7');
	}
	
	/**
	 * Método encargado de simular el introducir el dígito 8.
	 */
	public void digito8() {
		ponDigito('8');
	}
	
}
