package minik.unittests.pilaenteros.cesarravelo;

import java.util.List;

import org.junit.runner.JUnitCore;
import org.junit.runner.Result;
import org.junit.runner.RunWith;
import org.junit.runner.notification.Failure;
import org.junit.runners.Suite;

@RunWith(Suite.class)
@Suite.SuiteClasses({
	TestsPilaEnteros.class
})
public class TestSuitPilaEnteros {
	
	public static void main(String[] args) {
		Result result = JUnitCore.runClasses(TestSuitPilaEnteros.class);
		List<Failure> failure = result.getFailures();
		int i;
		
		System.out.println("> Ejecución Test Suit de PilaEnteros");
		
		for (i = 0; i < failure.size(); i++)			
			System.out.println("- Test no superado: " + failure.get(i).getDescription());
		
		System.out.println("> Resultado de los tests: " + ((result.wasSuccessful())? "Tests superados" : "Tests fallado(s)" ));
	}
}
