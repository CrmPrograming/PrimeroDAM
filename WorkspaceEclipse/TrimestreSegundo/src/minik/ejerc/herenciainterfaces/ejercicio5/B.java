package minik.ejerc.herenciainterfaces.ejercicio5;

class A {
	static int n = 0;

	String f(A x) {
		return "AA" + (x.n++);
	}

	String f(B x) {
		return "AB" + (x.n--);
	}
}

public class B extends A {
	String f(B x) {
		return "BB" + (x.n--);
	}

	public static void main(String args[]) {
		A a = new A();
		A b = new B();
		System.out.println(a.f(b)); // AA0
		System.out.println(b.f(b)); // AA1
		System.out.println(a.f((B) b)); // AB2
		System.out.println(b.f((B) b)); // BB1
	}
}
