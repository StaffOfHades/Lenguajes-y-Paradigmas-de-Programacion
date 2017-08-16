#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <stdlib.h>

int posicionI(int i, int j, int c) {
	int pos = c * i + j;
	//printf("Posicion con (%d, %d): %d\n", i, j, pos);
	return pos;
}

int posicionJ(int i, int j, int c) {
	int pos = i + c * j;
	//printf("Posicion con (%d, %d): %d\n", i, j, pos);
	return pos;
}

/* 	Direccion es hacia donde queremos imprimir la matriz;
	0 que para abajo
	1 que para un lado
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
	for (i = 0; i < al; i++) {
		for (j = 0; j < an; j++) {
			printf("%d\t", matriz[posicionI(i, j, num)]);
		}
		printf("\n");
	}
}

void imprimirMatrizF(float * matriz, int altura, int ancho, int direccion) {
	int i, j, al, an, num;
	if (direccion) {
		al = altura;
		an = num = ancho;
	} else {
		al = ancho;
		an = num = altura;
	}
	for (i = 0; i < al; i++) {
		for (j = 0; j < an; j++) {
			printf("%f\t", matriz[posicionI(i, j, num)]);
		}
		printf("\n");
	}
}

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
	//imprimirMatriz(invertida, ancho, altura);
}

/*
	A va a ser una matriz de tamaño de m x n.
	B va a ser una matriz de tamaño de n x o.
	C va a ser una matriz de tamaño de m x o
*/
void multiplicar(float * A, float * B, float *  C, int m, int n, int o) {
	int i, j, k;
	float a, b, c;
	int x, y, z;
	for (i = 0; i < m; i++) {		// i es el numero de renglones de la matriz A
		for (j = 0; j < o; j++) {	// j es el numero de columnas de la segunda matriz B
			z = i * o + j;		// renglon actual multiplicado por la cantidad de columnas mas la columna actual
			C[z] = 0;			// z es unico para C por que utiliza el numero de columnas m y el numero de renglones o
			for (k = 0; k < n; k++) {	// k es el numer de sumas que se tiene que hacer para cada posion de la matriz C
				x = i * n + k;		// x es unico para A por que utiliza el numero de columnas m y el numero de renglones m
				y = k * o + j;		// z es unico para C por que utiliza el numero de columnas o y el numero de renglones n
				a = A[x];
				b = B[y];
				c = a * b;
				C[z] += c;
				printf("C(%d, %d)[%d] -> %f = A(%d, %d)[%d] -> %f * B(%d, %d)[%d] -> %f = %f\n",
					 	   i,  j,  z,     c,     i,  k,  x,     a,     k,  j,  y,     b,  C[z]);
			}
			printf("\n");
		}
	}
}

int main() {
	/*
	int ancho, altura;
	printf("Dame el ancho: ");
	scanf("%d", &ancho);
	printf("Dame la altura: ");
	scanf("%d", &altura);
	
	crearMatriz(ancho, altura);
	*/
	int m, n, o;
	printf("Dame la m: ");
	scanf("%d", &m);
	printf("Dame la n: ");
	scanf("%d", &n);
	printf("Dame la o: ");
	scanf("%d", &o);
	
	float * A = malloc(m * n * sizeof(float));
	float * B = malloc(n * o * sizeof(float));
	float * C = malloc(m * o * sizeof(float));
	
	int i, j;
	int p;
	
	srand(time(NULL));

	for (i = 0; i < m; i++) {
		for (j = 0; j < n; j++) {
			p = i * n + j;  
			A[p] =  rand() % 20;
		}
	}
	
	for (i = 0; i < n; i++) {
		for (j = 0; j < o; j++) {
			p = i * o + j;
			B[p] = rand() % 20;
		}
	}
	
	imprimirMatrizF(A, m, n, 1);
	printf("\n");
	for (i = 0; i < m * n; i++)  {
		printf("%f\t", A[i]);
	}	
	printf("\n");
	printf("\n");
	imprimirMatrizF(B, n, o, 1);
	printf("\n");
	for (i = 0; i < n * o; i++)  {
		printf("%f\t", B[i]);
	}	
	printf("\n");
	printf("\n");
	multiplicar(A, B, C, m, n, o);
	imprimirMatrizF(C, m, o, 1);
	
	return 0;
}