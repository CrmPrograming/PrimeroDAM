
public class Codesignal {

	
	/* 
	 * Write a function that returns the sum of two numbers.
	 * 
	 */
	public static int add(int param1, int param2) {
	    return param1 + param2;
	}
	
	/* 
	 * Given an array a that contains only numbers in the range from 1 to a.length, 
	 * find the first duplicate number for which the second occurrence has the minimal index.
	 * In other words, if there are more than 1 duplicated numbers, return the number for
	 * which the second occurrence has a smaller index than the second occurrence of the
	 * other number does. If there are no such elements, return -1.
	 * 
	 */
	public static int firstDuplicate(int[] a) {
	    int[] lista = new int[a.length + 1];
	    int i = 0, duplicado = 0;
	    
	    do {        
	        lista[a[i]]++;
	        duplicado = lista[a[i]];
	        i++;
	    } while (i < a.length && duplicado < 2);
	    
	    return (duplicado != 2)?-1:a[i - 1];

	}
	
	/* 
	 * Given a string s consisting of small English letters, find and return the first
	 * instance of a non-repeating character in it. If there is no such character, return '_'.
	 *  
	 */
	public static char firstNotRepeatingCharacter(String s) {
	    int i = 0;
	    String result = "";
	    String duplicados = "";
	    char actual = '-';
	    do {
	        actual = s.charAt(i);
	        if (duplicados.indexOf(actual) == -1 && result.indexOf(actual) == -1)
	            result += actual;
	        else {
	            duplicados += actual;
	            result = result.replace("" + actual, "");            
	        }
	        
	        i++;
	        
	    } while(i < s.length());
	    
	    return (result.length() == 0)?'_':result.charAt(0);
	}
	
	/*
	 * You are given an n x n 2D matrix that represents an image. Rotate the image by 90 degrees (clockwise).
	 * 
	 */	
	public static int[][] rotateImage(int[][] a) {
	    int[][] result = new int[a.length][a.length];
	    int i = 0, j = 0;
	    
	    for (i = 0; i < a.length; i++)
	        for (j = 0; j < a[i].length; j++)
	            result[i][j] = a[a.length - 1 - j][i];
	    
	    
	    return result;
	}

}
