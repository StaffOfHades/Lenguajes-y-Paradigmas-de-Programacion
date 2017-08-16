%1
puede_respirar(avestruz).
tiene_plumas(avestruz).
pone_huevos(avestruz).
patas_largas(avestruz).
no_puede_volar(avestruz).

objeto1(avestruz).
atributo1(puede_respirar).
atributo(tiene_plumas).
atributo1(pone_huevos).

valor1(patas_largas).
valor1(no_puede_volar).


%2
pone_huevos(albatros).
tiene_plumas(albatros).
vuela(albatros).
vuela_muy_bien(albatros).
puede_respirar(albatros).

objeto2(albatros).
atributo2(pone_huevos).
atributo2(tiene_plumas).
atributo2(vuela).

valor2(vuela_muy_bien).

%3
tiene_pelo(tigre).
da_leche(tigre).
come_carne(tigre).
puede_respirar(tigre).

objeto3(tigre).
atributo3(puede_respirar).
atributo3(tiene_pelo).
atributo3(da_leche).

valor3(come_carne).

%4
da_leche(ballena).
tiene_piel(ballena).
vive_en_mar(ballena).
puede_respirar(ballena).

objeto4(ballena).
atributo4(puede_respirar).
atributo4(da_leche).

valor4(tiene_piel).
valor4(vive_en_mar).


%reglas
animal(X):-puede_respirar(X).

ave(X):-objeto1(X).
ave(X):-objeto2(X).

mamifero(X):- objeto3(X).
mamifero(X):- objeto4(X).

particular(X,Y,Z):- objeto1(X), atributo1(Y), valor1(Z).
particular(X,Y,Z):- objeto2(X), atributo2(Y), valor2(Z).
particular(X,Y,Z):- objeto3(X), atributo3(Y), valor3(Z).
particular(X,Y,Z):- objeto4(X), atributo4(Y), valor4(Z).
