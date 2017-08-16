#include <stdio.h>
#include <string.h>

int strlength(char * cadena) {
	int size = 0;
	while(cadena[size] != '\0') {
		size++;
	}
	
	return size;
}

int contar_e(char * cadena) {
	int size = 0;
	int i;
	for (i = 0; i < strlen(cadena); i++) {
		if (cadena[i] == 'e' || cadena[i] == 'E') {
			size++;
		}
	}
	
	return size;
}

int main() {
	char * c = "Telecomunicaciones";
	printf("Cadena: %s\n", c);
	printf("Tamaño con metodo: %d\n", strlength(c));
	printf("Tamaño con strlen: %lu\n", strlen(c));
	printf("Cantidad de \'e\': %d\n", contar_e(c));

	return 1;
}