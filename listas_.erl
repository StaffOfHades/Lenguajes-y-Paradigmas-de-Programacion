-module(listas).
-export([min/1, max/1, min_max/1, borrar_duplicados/1, borrar/2]).

min([]) -> [];
min([H|T]) -> min(T, H).
min([], R) -> R;
min([H|T], R) when H < R -> min(T, H);
min([_|T], R) -> min(T, R).

max([]) -> [];
max([H|T]) -> max(T, H).
max([], R) -> R;
max([H|T], R) when H > R -> max(T, H);
max([_|T], R) -> max(T, R).

min_max([H|T]) -> {min(T, H), max(T, H)}.

borrar_duplicados(L) -> borrar_duplicados(L, []).
borrar_duplicados([], L) -> L;
borrar_duplicados([H|T], L) -> borrar_duplicados(borrar(H, T), [H|L]).

borrar(I, [I|T]) -> borrar(I, T);
borrar(I, [H|T]) -> [H|borrar(I, T)];
borrar(_, []) ->[].

