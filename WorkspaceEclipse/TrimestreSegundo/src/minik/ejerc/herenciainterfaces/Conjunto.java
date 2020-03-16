package minik.ejerc.herenciainterfaces;

import java.util.Arrays;

public class Conjunto {

		/*
		 * NOTA: El ejercicio especifica "un array de valores de cualquier tipo".
		 * 
		 * Sería más correcto utilizar una clase genérica (Conjunto<T>), sin embargo
		 * no se pueden instanciar arrays genéricos. Habría que cambiar el tipo de dato
		 * de valores de Object[] a un ArrayList.
		 * 
		 */
		private Object[] valores;
		
		public Conjunto(int tam) {
			valores = new Object[tam];
		}
		
		public Conjunto(Object[] datosIniciales) {
			valores = datosIniciales;
		}
		
		public boolean insertar(int pos, Object valor) {
			try {
				valores[pos] = valor;
				return true;
			} catch(Exception e) {
				return false;
			}
		}
		
		public Conjunto interseccion(Conjunto c) {
			final int CARDINALIDAD_THIS = getCardinalidad();
			final int CARDINALIDAD_C = c.getCardinalidad();
			
			Object[] valoresComunes;
			int totalComunes = 0;
			int i, j;
			
			if (CARDINALIDAD_C < CARDINALIDAD_THIS) {
				valoresComunes = new Object[CARDINALIDAD_C];
				
				for (i = 0; i < CARDINALIDAD_C; i++) {
					j = 0;
					while (j < CARDINALIDAD_THIS - 1 && !c.getValores()[i].equals(valores[j]))
						j++;
					
					if (c.getValores()[i].equals(valores[j]))
						valoresComunes[totalComunes++] = c.getValores()[i];
				}
				
			} else {
				valoresComunes = new Object[CARDINALIDAD_THIS];
				
				for (i = 0; i < CARDINALIDAD_THIS; i++) {
					j = 0;
					while (j < CARDINALIDAD_C - 1 && !valores[i].equals(c.getValores()[j]))
						j++;
					
					if (valores[i].equals(c.getValores()[j]))
						valoresComunes[totalComunes++] = valores[i];
				}
			}
			
			return (totalComunes == 0)? null : new Conjunto(Arrays.copyOfRange(valoresComunes, 0, totalComunes));
		}		
		
		@Override
		public String toString() {
			String msg = "";
			int i;
			
			for (i = 0; i < valores.length; i++)
				msg += valores[i] + " ";
			
			return String.format("[ %s]", msg);
		}
		
		public Object[] getValores() {
			return valores;
		}
		
		public int getCardinalidad() {
			return valores.length;
		}
}
