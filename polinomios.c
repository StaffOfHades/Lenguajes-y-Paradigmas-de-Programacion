#include <stdio.h>
#include <math.h>

/*
	x es el numero a sustitur
	n es el grado del polinomio
	la suma se da en forma x^0 + x^1 + ... + x^nº
*/
int sumaPolinomio(int x, int n) {
	int i;
	int suma = 0;
	int num;
	for (i = 0; i <= n; i++) {
		num = pow(x, i);
		//printf("Sumando %d\n", num);
		suma += num;
	}
	
	printf("\n");
	return suma;
}

int main() {
	int x, n, cont = 1;
	while (cont == 1) {
		printf("Dame la x: ");
		scanf("%d", &x);
		printf("Dame la n: ");
		scanf("%d", &n);
		printf("\n");
		int suma = sumaPolinomio(x, n);
		printf("Suma: %d", suma);
		printf("\n");
		printf("\n");
		printf("Deseas continuar? (1 = si, 0 = no)\n");
		scanf("%d", &cont);
		while (cont < 0 || cont > 1) {
			printf("1 = si, 0 = no\n");
			scanf("%d", &cont);
		}
		
	}
	return 0;
}

