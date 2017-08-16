#include <stdio.h>
#include <string.h>

char c1 = 'A';
char c2 = 'B';
int i = 16; // en hexadeicmal 0x10
char c3 = 'C';
char c4 = 'D';

int main() {
	char *p = (char *) &i;
	
	printf("Valor de i: %lu, tamaño de i: %lu\n", (long)i, sizeof(i));
	
	printf("Valor de p: %lu, tamaño de p: %lu\n", (long)p, sizeof(p));
	
	printf("Entero byte 1: %x\n", *p), p++;
	printf("Entero byte 2: %x\n", *p), p++;
	printf("Entero byte 3: %x\n", *p), p++;
	printf("Entero byte 4: %x\n", *p);
	
	*(p-2) = 1; //sumar 256
	
	printf("Valor de i: %lu, tamaño de i: %lu\n", (long)i, sizeof(i));
	
	printf("Valor de p: %lu, tamaño de p: %lu\n", (long)p, sizeof(p));
	
	*(p-3) = 0; //restar 16
	
	printf("Valor de i: %lu, tamaño de i: %lu\n", (long)i, sizeof(i));
	
	printf("Valor de p: %lu, tamaño de p: %lu\n", (long)p, sizeof(p));
	
	*p = 127;
	(*p) ++;
	
	printf("Valor normal de i: %i\n", i);
	printf("Valor de i: %lu, tamaterño de i: %lu\n", (long)i, sizeof(i));
	
	printf("Valor de p: %lu, tamaño de p: %lu\n", (long)p, sizeof(p));
	
	p -= 3;
	for (int j=-4; j < 8; j++) {
		printf("Dato byte %i: %i\n", j, *((char *)p+j));	
	}
	
	
	
	/*
	char s[] = "asdasdasdaeEsde";
	int size = strlen(s);
	
	printf("Tamano de cadena: %i\n", size);
	
	//int size = (int) sizeof(s);
	int e = 0;
	for (int i = 0; i < size; i++) {
		if (s[i] == 'e' || s[i] == 'E') {
			e++;
		}
	}
	
	printf("Cantidad de \'e\': %i\n", e);
	*/
	
	return 1;
}
