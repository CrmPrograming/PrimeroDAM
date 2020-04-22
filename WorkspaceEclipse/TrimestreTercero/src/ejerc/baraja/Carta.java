package ejerc.baraja;

public class Carta {
	
	private Figura fig;
	private Palo pal;	
	
	public Carta(String figura, String palo) {
		this(new Figura(figura), new Palo(palo));
	}
	
	public Carta(Figura figura, Palo palo) {
		fig = figura;
		pal = palo;
	}
	
	@Override
	public boolean equals(Object o) {
		if (this == o)
			return true;
		
		if (o instanceof Carta)
			return this.getFig().equals(((Carta) o).getFig()) && this.getPal().equals(((Carta) o).getPal());
		
		return false;
	}
	
	@Override
	public String toString() {
		return "(" + fig + ", " + pal + ")";
	}
	
	public Figura getFig() {
		return fig;
	}

	public void setFig(Figura fig) {
		this.fig = fig;
	}

	public Palo getPal() {
		return pal;
	}

	public void setPal(Palo pal) {
		this.pal = pal;
	}

}
