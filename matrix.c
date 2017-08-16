#include <stdio.h>
#include <stdlib.h>

#define POSI(i, j, c) ((i)*(c)+(j)) //Regresa la posicion en un arreglo lineal dada por i y j, linea por linea
#define POSJ(i, j, c) ((i)+(j)*(c)) //Regresa la posicion en un arreglo lineal dada por i y j, columna por columna


/* 	Imprime una matriz con una altura y ancho espeficicado.
	Direccion es que direccion tomamos primero;
	0 para imprimir por columnas, y 1 para imprimir por lineas
*/
void imprimirMatriz(int * matriz, int altura, int ancho, int direccion) {
	int i, j, al, an;
	if (direccion) {
		al = altura;
		an = ancho;
	} else {
		al = ancho;
		an = altura;
	}
	printf("\n");
	for (i = 0; i < al; i++) {
		for (j = 0; j < an; j++) {
			printf("%d\t", matriz[POSI(i, j, an)]);
		}
		printf("\n");
	}
}

/* 	Crea una matriz dado por una altura y ancho espefico, 
	y despues va preguntando al usuario por los valores de
	cada casilla.
*/
void crearMatriz(int * matriz, int altura, int ancho) {
	double bytes =  altura * ancho * sizeof(int);
	//printf("Numero de bytes: %f\n", bytes);
	matriz = malloc(bytes);
	int i, j;
	int num;
	for (i = 0; i < ancho; i++) {
		for (j = 0; j < altura; j++) {
			printf("Dame el numero en la posicion(%d, %d): ", i, j);
			scanf("%d", &num);
			//printf("Guardando '%d' el numero en la posicion(%d, %d)\n", num, i, j);
			matriz[POSI(i, j, altura)] = num;
			//printf("El numero en la posicion(%d, %d) es: %d\n", i, j, num);
		}
	}
}

void multiplicarPorEscalar(int * matriz, int altura, int ancho, int escalar) {
	int i, j;
	for (i = 0; i < ancho; i++) {
		for (j = 0; j < altura; j++) {
			//printf("Multiplicando el numero en la posicion(%d, %d) = %d * %d\n", i, j, matriz[POSI(i, j, altura)], escalar);
			matriz[POSI(i, j, altura)] *= escalar;
		}
	}
}

int main() {
	int * matriz;
	int ancho, altura, escalar;
	
	printf("Dame el ancho: ");
	scanf("%d", &ancho);
	printf("Dame la altura: ");
	scanf("%d", &altura);
	
	crearMatriz(&matriz, ancho, altura);
	
	printf("N %d: %d\n", i, matriz[i]);
	
	int i;
	for (i = 0; i < ancho*altura; i++) {
		printf("Numero en %d: %d\n", i, matriz[i]);
	}
	
	printf("Dame el scalar: ");
	scanf("%d", &escalar);
	imprimirMatriz(matriz, ancho, altura, 1);
	
	multiplicarPorEscalar(matriz, ancho, altura, escalar);
	imprimirMatriz(matriz, ancho, altura, 1);
	
	return 0;
}