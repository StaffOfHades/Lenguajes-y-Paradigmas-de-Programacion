hombre(abraham).
hombre(abraham_jr).
hombre(bob).
hombre(diego).
hombre(emilio).
hombre(gustavo).
hombre(honorio).
hombre(honorio_jr).
hombre(hugo).
hombre(mauricio).
hombre(mauricio_jr).
hombre(raul).
hombre(raul_jr).
hombre(raul_sr).
hombre(ricardo).
hombre(rodrigo).

mujer(andrea).
mujer(angelica).
mujer(alicia).
mujer(ana_karen).
mujer(daniela).
mujer(georgina).
mujer(elba).
mujer(lucero).
mujer(maria_jose).
mujer(margarita).
mujer(meliza).
mujer(rosa).
mujer(rosario).
mujer(tess).
mujer(thelma).
mujer(viviana).

papas(abraham_jr, abraham).
papas(abraham_jr, angelica).
papas(diego, rodrigo).
papas(diego, viviana).
papas(emilio, rodrigo).
papas(emilio, viviana).
papas(honorio_jr, honorio).
papas(honorio_jr, margarita).
papas(mauricio, honorio).
papas(mauricio, margarita).
papas(mauricio_jr, mauricio).
papas(mauricio_jr, rosario).
papas(raul, raul_sr).
papas(raul, alicia).
papas(raul_jr, raul).
papas(raul_jr, lucero).
papas(ricardo, honorio).
papas(ricardo, margarita).
papas(rodrigo, honorio).
papas(rodrigo, margarita).

papas(andrea, hugo).
papas(andrea, rosa).
papas(angelica, raul_sr).
papas(angelica, alicia).
papas(ana_karen, mauricio).
papas(ana_karen, rosario).
papas(daniela, gustavo).
papas(daniela, elba).
papas(elba, raul_sr).
papas(elba, alicia).
papas(maria_jose, rodrigo).
papas(maria_jose, viviana).
papas(meliza, abraham).
papas(meliza, angelica).
papas(rosa, raul_sr).
papas(rosa, alicia).
papas(rosario, raul_sr).
papas(rosario, alicia).
papas(tess, bob).
papas(tess, elba).
papas(thelma, bob).
papas(thelma, elba).

padre(H, C) :- hombre(H), papas(C, H).

madre(M, C) :- mujer(M), papas(C, M).

esposo(H, M) :- padre(H, C), madre(M, C).
esposo(ricardo, georgina). %excepcion a la regla, pues al no tener hijos, no se puede encontrar a traves de los hjo

esposa(M, H) :- madre(M, C), padre(H, C).
esposa(georgina, ricardo). %excepcion a la regla, pues al no tener hijos, no se puede encontrar a traves de los hjo

hermano(H, A) :- hombre(H), madre(Y, H), padre(X, H), madre(Y, A), padre(X, A), dif(H, A).
hermana(H, A) :- mujer(H), madre(Y, H), padre(X, H), madre(Y, A), padre(X, A), dif(H, A).
hermana(daniela, thelma). %excepcion a la regla, pues al tener diferentes padres, no se puede encontrar a traves los padres
hermana(daniela, tess). %excepcion a la regla, pues al tener diferentes padres, no se puede encontrar a traves los padres
hermana(thelma, daniela). %excepcion a la regla, pues al tener diferentes padres, no se puede encontrar a traves los padres
hermana(tess, daniela). %excepcion a la regla, pues al tener diferentes padres, no se puede encontrar a traves los padres

tio(H, S) :- padre(X, S), hermano(H, X).
tio(H, S) :- padre(X, S), hermana(A, X), esposo(H, A). 
tio(H, S) :- madre(Y, S), hermano(H, Y).
tio(H, S) :- madre(Y, S), hermana(A, Y), esposo(H, A).

tia(M, S) :- madre(Y, S), hermana(M, Y).
tia(M, S) :- madre(Y, S), hermano(A, Y), esposa(M, A).
tia(M, S) :- padre(X, S), hermana(M, X).
tia(M, S) :- padre(X, S), hermano(A, X), esposa(M, A).

sobrino(S, T) :- hombre(S), tio(T, S).
sobrino(S, T) :- hombre(S), tia(T, S).

sobrina(S, T) :- mujer(S), tio(T, S).
sobrina(S, T) :- mujer(S), tia(T, S).
