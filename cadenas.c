#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/*	Dada las cadenas s1 y s2, se agrega caracter por caracter 
	de la cadena s2 al final de la cadena s1
*/
char * strcat2(char * s1, char * s2) {
	int len = strlen(s1);
	int i;
	for (i = 0; i < strlen(s2); i++) {
		s1[len+i] = s2[i];
	}
	
	return s1;
}


/*	Dada las cadenas s1 y s2, se crea una nueva direccion con la
	memoria justa, a lo cual despues se agregan las cadenas s1 y s2
	en ese orden al final de la nueva cadena s3
*/
char * strcat3(char * s1, char * s2) {
	int i;
	int len1 = strlen(s1);
	int len2 = strlen(s2);
	char * s3 = malloc ( (len1 + len2) * sizeof(char));
	for (i = 0; i < len1; i++) {
		s3[i] = s1[i];
	}
	for (i = 0; i < len2; i++) {
		s3[i+len1] = s1[i];
	}
	
	return s1;
}

int main() {
	char c1[40] = "hola";
	char c2[10] = " mundo";
	char * c = strcat2(c1, c2);
	printf("Cadena: %s\n", c);
	c = strcat3(c1, c2);
	printf("Cadena: %s\n", c);
	
	return 0;
}