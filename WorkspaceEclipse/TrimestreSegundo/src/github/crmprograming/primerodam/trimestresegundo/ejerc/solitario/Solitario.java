package github.crmprograming.primerodam.trimestresegundo.ejerc.solitario;

import java.util.ArrayList;
import java.util.Scanner;

/**
 * Clase gestora de simular una partida de Solitario. Para ello, se debe
 * invocar al único método público jugar().
 * 
 * Gestiona la interfaz por consola, además de regular el flujo de la partida.
 * Un juego puede interrumpirse a mitad de partida y al acabar una se puede
 * preguntar empezar una nueva.
 * 
 * @author César Ravelo Martínez
 *
 */
public class Solitario {
	
	/**
	 * Instancia de la clase Mazo gestora del mazo de cartas.
	 */
	private Mazo mazoPartida;
	
	/**
	 * Tabla de ColumnaCartas donde se irán guardando las cartas que
	 * no puedan ir en una familia, pero sí tengan lugar en columnas.
	 */
	private ColumnaCartas[] columnas;
	
	/**
	 * Tabla de FamiliaCartas donde se irán almacenando las cartas ya colocadas
	 * en sus correspondientes palos por orden ascendente.
	 */
	private FamiliaCartas[] familias;
	
	/**
	 * Instancia de la clase Pozo donde ir guardando las cartas sin lugar posible.
	 */
	private PozoCartas pozo;
	
	/**
	 * Método encargado de inicializar el objeto a una nueva partida desde cero:
	 * 
	 * - Mazo nuevo al completo barajado
	 * - Columnas, Familias y Pozo nuevos creados
	 * - Colocada una Carta del Mazo sacada al azar en cada columna 
	 */
	private void reset() {
		int i;
		mazoPartida = new Mazo();
		columnas = new ColumnaCartas[] {new ColumnaCartas(), new ColumnaCartas(),
										new ColumnaCartas(), new ColumnaCartas()};
		familias = new FamiliaCartas[] {new FamiliaCartas(), new FamiliaCartas(),
										new FamiliaCartas(), new FamiliaCartas()};
		pozo = new PozoCartas();
		
		// Insertamos una carta en cada columna
		for (i = 0; i < columnas.length; i++)
			columnas[i].ponerCarta(mazoPartida.sacarCarta());
	}
	
	/**
	 * Método encargado de mostrar el menú principal de la aplicación.
	 * 
	 * @param cActual Instancia de Carta con la carta actualmente robada del Mazo
	 */
	private void mostrarMenuPrincipal(Carta cActual) {
		System.out.println("########### SOLITARIO ###########\n");
		System.out.println("1) Mostrar Columnas");
		System.out.println("2) Mostrar Familias");
		System.out.println("3) Sacar Carta del Mazo");
		System.out.println("4) Colocar Carta en Columna");
		System.out.println("5) Colocar Carta en Familia");
		System.out.println("6) Mover Carta desde Columna");
		System.out.println("0) Salir\n");
		System.out.println("- Carta actual: " + ((cActual == null)? "-" : cActual));
		System.out.print("> Seleccione una opción: ");
	}
	
	/**
	 * Método encargado de mostrar el contenido de todas las columnas.
	 */
	private void mostrarColumnas() {
		ArrayList<ArrayList<Carta>> cols = new ArrayList<ArrayList<Carta>>();
		int i, j;
		
		// Extraemos las columnas de cartas en un ArrayList para un mejor manejo
		for (i = 0; i < columnas.length; i++)
			cols.add(columnas[i].listaCartas());
		
		for (i = 0; i < cols.size(); i++) {
			System.out.printf("%s %d: ", "COL", i + 1);
			for (j = 0; j < cols.get(i).size(); j++)
				System.out.printf("%-12s %-2s ", cols.get(i).get(j), "->");
			System.out.println("/");
		}
		
		System.out.println();
	}
	
	/**
	 * Método encargado de mostrar el contenido de todas las familias de cartas.
	 */
	private void mostrarFamilias() {
		ArrayList<ArrayList<Carta>> fam = new ArrayList<ArrayList<Carta>>();
		int i, j;
		
		// Extraemos las familias de cartas en un ArrayList para un mejor manejo
		for (i = 0; i < familias.length; i++)
			fam.add(familias[i].listaCartas());
		
		for (i = 0; i < fam.size(); i++) {
			System.out.printf("%s %d: ", "FAM", i + 1);
			for (j = 0; j < fam.get(i).size(); j++)
				System.out.printf("%-12s %-2s ", fam.get(i).get(j), "->");
			System.out.println("/");
		}
		
		System.out.println();
	}
	
	/**
	 * Método encargado de robar una carta del Mazo.
	 * - Si la carta actualmente robada del mazo no es null,
	 * se guardará en el Pozo.
	 * 
	 * - Si el Mazo está vacío, mostrará un mensaje indicando que
	 * se mueven todas las cartas del Pozo al Mazo antes de poder sacar
	 * una carta del mismo. En este caso, el Pozo quedará vacío.
	 * 
	 * @param actual Instancia de Carta con la carta actualmente robada
	 * @return Instancia de Carta con la nueva carta robada
	 */
	private Carta robarCarta(Carta actual) {
		if (actual != null)
			pozo.ponerCarta(actual);
		if (mazoPartida.estaVacia()) {
			System.out.println("- Mazo sin cartas. Moviendo cartas del pozo al mazo.");
			mazoPartida.barajar(pozo.listaCartas());
			pozo.vaciarPozo();
		}
		
		return mazoPartida.sacarCarta();
	}
	
	/**
	 * Método encargado de colocar una carta en una columna válida.
	 * 
	 * @param col Entero con el indicador de la columna donde se intentará insertar la carta
	 * @param actual Instancia de Carta con la carta a colocar
	 * @return Booleano con el estado de la inserción
	 */
	private boolean colocarCartaColumna(int col, Carta actual) {
		boolean insertada = false;
		
		if (col >= 0 && col < columnas.length && columnas[col].ponerCarta(actual))
			insertada = true;

		return insertada;
	}
	
	/**
	 * Método encargado de colocar una carta en una familia válida.
	 * 
	 * @param fam Entero con el indicador de la columna donde se intentará insertar la carta
	 * @param actual Instancia de Carta con la carta a colocar
	 * @return Booleano con el estado de la inserción
	 */
	private boolean colocarCartaFamilia(int fam, Carta actual) {
		boolean insertada = false;		
		
		if (fam >= 0 && fam < familias.length && familias[fam].ponerCarta(actual))
			insertada = true;
				
		return insertada;
	}
	
	/**
	 * Método encargado de mover una carta desde una columna a una columna o familia válida.
	 * Para ello, preguntará al usuario:
	 * 
	 * - Desde qué columna se quiere mover la carta
	 * - A dónde se quiere mover la carta, ¿columna o familia?
	 * - Indicador de la columna o familia destino
	 * 
	 * NOTA: A la hora de indicar si se mueve a columna o familia,
	 * por defecto se asume que se moverá a una columna. De esta manera
	 * si se introduce mal el caracter, se intentará insertar por
	 * defecto en una columna, sea la misma u otra distinta.
	 * 
	 * @param in Instancia de Scanner dedicado a la petición de datos para el movimiento.
	 * @return Booleano con el estado de la inserción
	 */
	private void moverCarta(Scanner in) {
		int posNueva = -1, columnaOriginal = -1;
		Carta c;
		char destino = 'c';	
		
		System.out.print("> Indique de qué columna quiere mover la carta [1, 4]: ");
		columnaOriginal = in.nextInt() - 1;
		
		if (columnaOriginal >= 0 && columnaOriginal < 4 && !columnas[columnaOriginal].estaVacia()) {
			c = columnas[columnaOriginal].sacarCarta();
			
			// A dónde se quiere mover la carta, ¿columna o familia?
			System.out.print("> ¿Dónde quiere moverla? (Columna|Familia): ");
			in.nextLine();
			destino = in.nextLine().charAt(0);
			
			// Mover la carta a una familia
			if (destino == 'f' || destino == 'F') {
				System.out.print("> ¿En qué familia quiere colocarla? [1, 4]: ");
				posNueva = in.nextInt() - 1;
				
				if (posNueva >= 0 && posNueva < 4 && familias[posNueva].ponerCarta(c)) 
					System.out.println("- Carta colocada\n");
				else {
					System.out.println("- Movimiento no válido\n");
					columnas[columnaOriginal].ponerCarta(c);
				}
			} else {
				// Mover la carta a una columna
				System.out.print("> ¿En qué columna quiere colocarla? [1, 4]: ");
				posNueva = in.nextInt() - 1;
				
				if (posNueva >= 0 && posNueva < 4 && columnas[posNueva].ponerCarta(c)) 
					System.out.println("- Carta colocada\n");
				else {
					System.out.println("- Movimiento no válido\n");
					columnas[columnaOriginal].ponerCarta(c);
				}
				
			}
		} else {
			System.out.println("- Movimiento no válido\n");
		}
	}
	
	/**
	 * Método encargado de calcular si la partida ha terminado con victoria.
	 * Se considera victoria cuando todas las familias tienen las cartas 
	 * del mismo palo y en orden ascendente.
	 * 
	 * @return Booleano con el indicador del estado de la partida
	 */
	private boolean comprobarVictoria() {
		boolean resultado = true;
		int i = 0;
		
		// Si todas las familias se encuentran llenas,
		// significa que la partida se acabó y resultó en victoria
		while (i < familias.length && resultado) {
			resultado = resultado && familias[i].estaLleno();
			i++;
		}
		
		return resultado;
	}

	/**
	 * Método encargado de gestionar la simulación de partidas de solitario.
	 * Único método público, se le debe invocar a él para empezar una partida.
	 * 
	 * Una partida terminará por dos razones:
	 * - El usuario indica finalizar en el menú.
	 * - Una partida acabó como ganada y no quiere jugar otra
	 * 
	 * Cada vez que empieza una nueva partida, se reinicia el estado de todo
	 * el sistema (Mazo, Pozo, Familia y Columna) mediante la invocación
	 * al método reset().
	 */
	public void jugar() {
		final int ESTADO_TERMINAR = 0, ESTADO_SEGUIR = 1, ESTADO_GANADA = 2;
		int modo = 0, opcion = 0;
		char jugarNueva = 's';
		Carta actual = null;
		Scanner in = new Scanner(System.in);
		
		do {
			// Generamos una nueva partida desde 0
			reset();
			modo = ESTADO_SEGUIR;
			
			actual = mazoPartida.sacarCarta();
			do {
				mostrarMenuPrincipal(actual);
				opcion = in.nextInt();
				System.out.println();
				switch (opcion) {
					case 0: // Salir de programa
						modo = ESTADO_TERMINAR;
						break;
					case 1: // Mostrar Columnas
						System.out.println("########### COLUMNAS ###########\n");
						mostrarColumnas();
						break;
					case 2: // Mostrar Familias
						System.out.println("########### FAMILIAS ###########\n");
						mostrarFamilias();
						break;
					case 3: // Robar Carta del Mazo
						actual = robarCarta(actual);
						break;
					case 4: // Colocar carta en Columna
						System.out.println("######## COLOCAR EN COLUMNA ########\n");
						
						if (actual != null) {
							System.out.print("> Indique en qué columna quiere intentar colocar la carta [1, 4]: ");
							
							if (colocarCartaColumna(in.nextInt() - 1, actual)) {
								actual = null;
								System.out.println("- Carta colocada\n");
							} else
								System.out.println("- Columna no válida\n");
						} else
							System.out.println("- No hay ninguna carta actualmente robada\n");
						break;
					case 5: // Colocar Carta en Familia
						System.out.println("######## COLOCAR EN FAMILIA ########\n");
						
						if (actual != null) {
							System.out.print("> Indique en qué familia quiere intentar colocar la carta [1, 4]: ");
							if (colocarCartaFamilia(in.nextInt() - 1, actual)) {
								actual = null;
								System.out.println("- Carta colocada\n");
							} else {
								System.out.println("- Familia no válida\n");
							}
						} else
							System.out.println("- No hay ninguna carta actualmente robada\n");
						break;
					case 6: // Mover Carta de Columna a Columna o Familia
						System.out.println("######## MOVER CARTA ########\n");
						moverCarta(in);
						break;
					default:
						System.out.println("- Opción introducida no válida");
				}
				
				if (comprobarVictoria())
					modo = ESTADO_GANADA;
				
			} while (modo == ESTADO_SEGUIR);
			
			if (modo == ESTADO_GANADA) {
				modo = ESTADO_SEGUIR;
				System.out.println("- ¡PARTIDA FINALIZADA!");
				System.out.print("¿Jugar otra? (s/n): ");
				in.nextLine();
				jugarNueva = in.nextLine().charAt(0);
				
				if (jugarNueva == 'n' || jugarNueva == 'N')
					modo = ESTADO_TERMINAR;
			}
			
		} while (modo == ESTADO_SEGUIR);
		
		in.close();
	}
	
}
