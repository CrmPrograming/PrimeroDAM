import java.util.ArrayList;

import funciones.Vectores;

public class PruebasMergeArrayList {

	public static void main(String[] args) {
		ArrayList<Integer> t1 = new ArrayList<Integer>();
		ArrayList<Integer> t2 = new ArrayList<Integer>();
		int i;
		int[] v1 = {1, 3, 5, 6, 8};
		int[] v2 = {2, 4, 7, 9, 10};		
		
		for (i = 0; i < v1.length; i++)
			t1.add(v1[i]);
		
		for (i = 0; i < v2.length; i++)
			t2.add(v2[i]);		
		
		System.out.println(t1);
		System.out.println(t2);
		System.out.println(Vectores.merge(t1, t2));

	}

}
