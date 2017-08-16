#include <stdio.h>
#include <stdlib.h>

#define POSI(i, j, c) ((i)*(c)+(j))
#define POSJ(i, j, c) ((i)+(j)*(c))

/* 	Regresa la posicion en un arreglo lineal
	dada por i y j, linea por linea
*/
int posicionI(int i, int j, int c) {
	int pos = c * i + j;
	//printf("Posicion con (%d, %d): %d\n", i, j, pos);
	return pos;
}

/* 	Regresa la posicion en un arreglo lineal
	dada por i y j, columna por columna
*/
int posicionJ(int i, int j, int c) {
	int pos = i + c * j;
	//printf("Posicion con (%d, %d): %d\n", i, j, pos);
	return pos;
}

/* 	Imprime una matriz con una altura y ancho espeficicado.
	Direccion es que direccion tomamos primero;
	0 para imprimir por columnas, y 1 para imprimir por lineas
*/
void imprimirMatriz(int * matriz, int altura, int ancho, int direccion) {
	int i, j, al, an, num;
	if (direccion) {
		al = altura;
		an = num = ancho;
	} else {
		al = ancho;
		an = num = altura;
	}
	for (int i = 0; i < al; i++) {
		for (int j = 0; j < an; j++) {
			printf("%d\t", matriz[posicionI(i, j, num)]);
		}
		printf("\n");
	}
}

/* 	Crea una matriz dado por una altura y ancho espefico, 
	y despues va preguntando al usuario por los valores de
	cada casilla.
*/
void crearMatriz(int altura, int ancho) {
	double bytes =  altura * ancho * sizeof(int);
	//printf("Numero de bytes: %f\n", bytes);
	int * matriz = malloc(bytes);
	int i, j;
	int num;
	for (i = 0; i < ancho; i++) {
		for (j = 0; j < altura; j++) {
			printf("Dame el numero en la posicion(%d, %d): ", i, j);
			scanf("%d", &num);
			matriz[posicionI(i, j, altura)] = num;
		}
	}
	
	int * invertida = malloc(bytes);
	int i_, j_;
	i = 0;
	j = 0;
	i_ = 0;
	j_ = 0;
	
	// En vez de utilizar un for dentro de otro for
	// que responde 2 varibles independientes, 
	// se un while que responde a 4 variables por ciclo.
	while (i < ancho) {
		invertida[posicionJ(i_, j_, altura)] = matriz[posicionI(i, j, altura)];
		
		j++;
		j_++;
		
		if (j >= altura) {
			j = 0;
			i++;
		}
		if (j_ >= ancho) {
			j_ = 0;
			i_++;
		}
	}
	
	printf("\n");
	imprimirMatriz(matriz, altura, ancho, 1);
	printf("\n");
	imprimirMatriz(invertida, altura, ancho, 0);
}

int main() {
	int ancho, altura;
	printf("Dame el ancho: ");
	scanf("%d", &ancho);
	printf("Dame la altura: ");
	scanf("%d", &altura);
	
	crearMatriz(ancho, altura);
	return 0;
}