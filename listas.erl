-module(listas).
-export([eliminar/2]).
-export([concat_verify/3, concat/2, complement/2, example/0]).

concat_verify(L, [], L) -> true;
concat_verify([], L, L) -> true;
concat_verify([H|T1], L, [H|T2]) -> concat_verify(T1, L, T2);
concat_verify(_, _, _) -> false.

concat([H|T], L) -> [H|concat(T, L)];
concat([], L) -> L.

complement([], L) -> L;
complement([H|T1], [H|T2]) -> complement(T1, T2);
complement(L1, L2) -> complement(L1, L2, []).

complement(L, L, R) -> invert(R, []);
complement([H|T], L, R) -> complement(T, L, [H|R]);
complement([], _, _) -> false.

invert([], R) -> R;
invert([H|T], R) -> invert(T, [H|R]).

eliminar(_, []) -> [];
eliminar(V, V) -> [];
eliminar(V, [V|T]) -> eliminar(V, T);
eliminar(V, [[V|T]|B]) -> [eliminar(V, T)|eliminar(V, B)];
eliminar(V, [[H|T]|B]) -> [[H|eliminar(V, T)]|eliminar(V, B)];
eliminar(V, [H|T]) -> [H|eliminar(V, T)].

example() -> [a,b,[b,c,d,[a,[b]]],e].

