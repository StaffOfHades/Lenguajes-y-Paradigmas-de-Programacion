male(abraham).
male(abraham_jr).
male(bob).
male(diego).
male(emilio).
male(gustavo).
male(honorio).
male(honorio_jr).
male(hugo).
male(mauricio).
male(mauricio_jr).
male(raul).
male(raul_jr).
male(raul_sr).
male(ricardo).
male(rodrigo).

female(andrea).
female(angelica).
female(alicia).
female(ana_karen).
female(daniela).
female(georgina).
female(elba).
female(lucero).
female(maria_jose).
female(margarita).
female(meliza).
female(rosa).
female(rosario).
female(tess).
female(thelma).
female(viviana).

parent(abraham_jr, abraham).
parent(abraham_jr, angelica).
parent(diego, rodrigo).
parent(diego, viviana).
parent(emilio, rodrigo).
parent(emilio, viviana).
parent(honorio_jr, honorio).
parent(honorio_jr, margarita).
parent(mauricio, honorio).
parent(mauricio, margarita).
parent(mauricio_jr, mauricio).
parent(mauricio_jr, rosario).
parent(raul, raul_sr).
parent(raul, alicia).
parent(raul_jr, raul).
parent(raul_jr, lucero).
parent(ricardo, honorio).
parent(ricardo, margarita).
parent(rodrigo, honorio).
parent(rodrigo, margarita).

parent(andrea, hugo).
parent(andrea, rosa).
parent(angelica, raul_sr).
parent(angelica, alicia).
parent(ana_karen, mauricio).
parent(ana_karen, rosario).
parent(daniela, gustavo).
parent(daniela, elba).
parent(elba, raul_sr).
parent(elba, alicia).
parent(maria_jose, rodrigo).
parent(maria_jose, viviana).
parent(meliza, abraham).
parent(meliza, angelica).
parent(rosa, raul_sr).
parent(rosa, alicia).
parent(rosario, raul_sr).
parent(rosario, alicia).
parent(tess, bob).
parent(tess, elba).
parent(thelma, bob).
parent(thelma, elba).

couple(mauricio, rosario).
couple(raul_sr, alicia).
couple(honorio, margarita).
couple(viviana, rodrigo).
couple(ricardo, georgina).
couple(raul, lucero).
couple(abraham, angelica).
couple(elba, bob).
couple(elba, gustavo).
couple(rosa, hugo).

aunts(C, A) :- parents(C, P), sisters(P, A).
brothers(C, B) :- male(B), siblings(C, B).
children(P, C) :- parent(C, P).
cousins(C, B) :- parents(C, P), siblings(P, S), children(S, B).
daughters(P, W) :- female(W), parent(W, P).
father(C, F) :- male(F), parent(C, F).
grandchildren(P, G) :- children(P, C), children(C, G).
granddaughters(P, G) :- children(P, C), daughters(C, G).
grandfathers(C, G) :- parents(C, P), father(P, G).
grandmothers(C, G) :- parents(C, P), mother(P, G).
grandparents(C, G) :- parents(C, P), parents(P, G).
grandsons(P, G) :- children(P, C), sons(C, G).
husband(W, M) :- male(M), spouse(W, M).
mother(C, M) :- female(M), parent(C, M).
nephew(P, N) :- siblings(P, S), sons(S, N).
nibling(P, N) :- siblings(P, S), children(S, N).
niece(P, N) :- siblings(P, S), daughters(S, N).
parents(C, P) :- parent(C, P).
pibling(C, P) :- parents(C, A), siblings(P, A).
siblings(C, S) :- mother(C, M), husband(M, H), children(M, S), children(H, S), dif(C, S).
sisters(C, S) :- female(S), siblings(C, S).
sons(P, M) :- male(M), parent(M, P).
spouse(A, B) :- couple(B, A).
spouse(A, B) :- couple(A, B).
uncles(C, U) :- parents(C, P), brothers(P, U).
wife(M, W) :- female(W), spouse(M, W).