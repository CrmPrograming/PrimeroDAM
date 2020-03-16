package minik.ejerc.herenciainterfaces.ejercicio7;

class A {

public static void main (String args[]) throws X {

	try { 
		f();
		throw new Z ();
	} catch (Y ex) {
		System.out.println("Y" + ex);
	} catch (X ex) {
		System.out.println("X" + ex);	
	}
}

	static void f() throws X {

		try {
			throw new Y();
		} catch (X ex) {
			g();
		}

	}

	static void g() throws X {

		try {
			throw new X();
		} catch (Y ex) {
		}

	}

}

class X extends Exception {

	public String toString() {
		return "X";
	}

}

class Y extends X {

	public String toString() {
		return "Y";
	}

}

class Z extends Y {

	public String toString() {
		return "Z";
	}

}