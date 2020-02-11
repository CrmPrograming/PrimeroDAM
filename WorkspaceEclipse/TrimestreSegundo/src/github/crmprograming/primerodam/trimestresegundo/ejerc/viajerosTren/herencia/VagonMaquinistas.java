package github.crmprograming.primerodam.trimestresegundo.ejerc.viajerosTren.herencia;

/**
 * Clase gestora de un vagón de maquinistas.
 * Hereda de la clase Vagon su comportamiento.
 * 
 * La clase sigue las siguientes pautas:
 * - Sólo personas de tipo Maquinista pueden subir a él
 * - Tendrá una capacidad máxima indicada por el atributo MAQUINISTAS_MAXIMOS * 
 * 
 * @author César Ravelo Martínez
 */
public class VagonMaquinistas extends Vagon {
	
	/**
	 * Constante estática entera con la cantidad máxima de maquinistas posibles en el vagón.
	 */
	private final static int MAQUINISTAS_MAXIMOS = 2;
	
	/**
	 * Constructor por defecto de la clase. Inicializa el vagón
	 * a la capacidad indicada por MAQUINISTAS_MAXIMOS.
	 */
	public VagonMaquinistas() {
		super(MAQUINISTAS_MAXIMOS);
	}
	
	/**
	 * Constructor inicializador de la clase. Dado que queremos
	 * que el vagón siempre sea de tamaño MAQUINISTAS_MAXIMOS,
	 * simplemente invoca al constructor por defecto de la clase.
	 * 
	 * @param tam Entero con el tamaño del vagón
	 */
	public VagonMaquinistas(int tam) {
		this();
	}
	
	/**
	 * Sobreescritura del método subir de la clase Vagon.
	 * Se encarga de comprobar antes de guardar una Persona, saber si
	 * es una instancia de la clase Maquinista:
	 * 
	 * - Si es un Maquinista, delega la operación al mismo método en la clase padre
	 * - En caso contrario, lanza una RuntimeException.
	 */
	@Override
	public void subir(Persona persona) {
		if (persona instanceof Maquinista)
			super.subir(persona);
		else
			throw new RuntimeException("ERROR: Un pasajero no maquinista no puede ir en un vagón de maquinistas.");	
	}

}
