#include <stdio.h>
#include <math.h>


// Declaración de la cabecera de las funciones
void obtenerPrimos(int x, int y);

// Método main principal de la aplicación
int main(void) {
	// Declaración inicial de variables
	int a;
	int b;

	// Petición de los datos por teclado al usuario
	printf("> Introduzca el primer valor del rango: ");
	scanf("%d", &a);
	printf("> Introduzca el primer valor del rango: ");
	scanf("%d", &b);

	obtenerPrimos(a, b);
	return 0;
}

// Método encargado de mostrar los valores primos existentes entre x e y
void obtenerPrimos(int x, int y) {
	// Declaración inicial de variables
	int i, j;
	const int TAM_VECTOR = y - x + 1;
	int valores[TAM_VECTOR];

	// Creamos un vector con todos los valores pertenecientes al rango
	for (i = 0; i < TAM_VECTOR; i++)
		valores[i] = x + i;
	
	printf("> Los valores primos para el rango (%d, %d) son:\n[ ", x, y);
	
	// Calculamos los valores primos del rango
	for (i = 0; i < TAM_VECTOR; i++)
		if (valores[i] == 1 || valores[i] == 2)
			printf("%d ", valores[i]);
		else {
			// Comprobamos si el valor actual es primo
			j = 2;
			while (j <= sqrt(valores[i]) && valores[i] % j != 0)
				j++;
			if (valores[i] % j != 0)
				printf("%d ", valores[i]);
		}
	printf("]\n");
}
