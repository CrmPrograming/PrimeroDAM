package github.crmprograming.primerodam.trimestresegundo.ejer.solitario;

import java.util.ArrayList;
import java.util.Scanner;

public class Solitario {
	
	private Mazo mazoPartida;
	private ColumnaCartas[] columnas;
	private FamiliaCartas[] familias;
	private PozoCartas pozo;
	
	private void reset() {
		int i;
		mazoPartida = new Mazo();
		columnas = new ColumnaCartas[] {new ColumnaCartas(), new ColumnaCartas(),
										new ColumnaCartas(), new ColumnaCartas()};
		familias = new FamiliaCartas[] {new FamiliaCartas(), new FamiliaCartas(),
										new FamiliaCartas(), new FamiliaCartas()};
		pozo = new PozoCartas();
		
		for (i = 0; i < columnas.length; i++)
			columnas[i].ponerCarta(mazoPartida.sacarCarta());		
	}
	
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
	
	private void mostrarColumnas() {
		ArrayList<ArrayList<Carta>> cols = new ArrayList<ArrayList<Carta>>();
		int i, j;
		
		for (i = 0; i < columnas.length; i++)
			cols.add(columnas[i].listaCartas());
		
		System.out.println("########### COLUMNAS ###########\n");		
		
		for (i = 0; i < cols.size(); i++) {
			System.out.printf("%s %d: ", "COL", i + 1);
			for (j = 0; j < cols.get(i).size(); j++)
				System.out.printf("%-12s %-2s ", cols.get(i).get(j), "->");
			System.out.println("/");
		}
		
		System.out.println();		
	}
	
	private void mostrarFamilias() {
		ArrayList<ArrayList<Carta>> fam = new ArrayList<ArrayList<Carta>>();
		int i, j;
		
		for (i = 0; i < familias.length; i++)
			fam.add(familias[i].listaCartas());
		
		System.out.println("########### FAMILIAS ###########\n");		
		
		for (i = 0; i < fam.size(); i++) {
			System.out.printf("%s %d: ", "FAM", i + 1);
			for (j = 0; j < fam.get(i).size(); j++)
				System.out.printf("%-12s %-2s ", fam.get(i).get(j), "->");
			System.out.println("/");
		}
		
		System.out.println();	
	}
	
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
	
	private boolean colocarCartaColumna(Scanner in, Carta actual) {
		boolean insertada = false;
		int col = -1;
		
		System.out.println("######## COLOCAR EN COLUMNA ########\n");
		
		System.out.print("> Indique en qué columna quiere intentar colocar la carta [1, 4]: ");
		col = in.nextInt() - 1;		
		
		if (col >= 0 && col < 4 && columnas[col].ponerCarta(actual)) {
			System.out.println("- Carta colocada\n");
			insertada = true;
		} else
			System.out.println("- Columna no válida\n");
		
		return insertada;
	}
	
	private boolean colocarCartaFamilia(Scanner in, Carta actual) {
		boolean insertada = false;
		int fam = -1;
		
		System.out.println("######## COLOCAR EN FAMILIA ########\n");
		
		System.out.print("> Indique en qué familia quiere intentar colocar la carta [1, 4]: ");
		fam = in.nextInt() - 1;
		
		if (fam >= 0 && fam < 4 && familias[fam].ponerCarta(actual)) {
			System.out.println("- Carta colocada\n");
			insertada = true;
		} else
			System.out.println("- Columna no válida\n");
		
		return insertada;
	}
	
	private void moverCarta(Scanner in) {
		int posNueva = -1, columnaOriginal = -1;
		Carta c;
		char destino = 'c';
		
		System.out.println("######## MOVER CARTA ########\n");
		
		System.out.print("> Indique de qué columna quiere mover la carta [1, 4]: ");
		columnaOriginal = in.nextInt() - 1;
		
		if (columnaOriginal >= 0 && columnaOriginal < 4 && !columnas[columnaOriginal].estaVacia()) {
			c = columnas[columnaOriginal].sacarCarta();
			
			System.out.print("> ¿Dónde quiere moverla? (Columna|Familia): ");
			in.nextLine();
			destino = in.nextLine().charAt(0);
			
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
	
	private boolean comprobarVictoria() {
		boolean resultado = true;
		int i = 0;
		
		while (i < familias.length && resultado) {
			resultado = resultado && familias[i].estaLleno();
			i++;
		}				
		
		return resultado;
	}

	// TODO: Hacer opción de menú "Sacar carta de columna"
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
						mostrarColumnas();
						break;
					case 2: // Mostrar Familias
						mostrarFamilias();
						break;
					case 3: // Robar Carta del Mazo
						actual = robarCarta(actual);
						break;
					case 4: // Colocar carta en Columna
						if (colocarCartaColumna(in, actual))
							actual = null;
						break;
					case 5: // Colocar Carta en Familia
						if (colocarCartaFamilia(in, actual))
							actual = null;
						break;
					case 6: // Mover Carta de Columna a Columna o Familia
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
