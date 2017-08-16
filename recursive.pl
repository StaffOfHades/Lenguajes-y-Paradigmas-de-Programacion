descend(X, Y) :- child(X, Y).
descend(X, Z) :- child(X, Y), descend(Y, Z).

child(ana, mauricio).
child(mauricio, honorio).
child(ricardo, honorio).

a2b([], []).
a2b([a|A], [b|B]) :- a2b(A, B).