componenteDe( teclado, computadora ).
componenteDe( tarjeta_madre, computadora ).
componenteDe( teclado_numérico, teclado ).
componenteDe( teclas_de_función, teclado ).
componenteDe( teclas_de_navegación, teclado ).
componenteDe( tarjeta_de_red, tarjeta_madre ).
componenteDe( cpu, tarjeta_madre ).
componenteDe( memoria_ram, tarjeta_madre ).
componenteDe( unidad_ALU, cpu ).
componenteDe( registros, cpu ).
componenteDe( unidad_de_control, cpu ).

esParteDe(X, Y) :- componenteDe(X, Y).
esParteDe(X, Y) :- componenteDe(A, Y), esParteDe(X, A).

parent(a, b).
parent(a, c).
parent(b, d).
parent(b, e).

ancestro(X, Y) :- parent(X, Y).
ancestro(X, Y) :- parent(X, Z), ancestro(Z, Y).