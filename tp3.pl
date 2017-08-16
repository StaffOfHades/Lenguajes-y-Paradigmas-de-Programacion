concat( [ ], L, L ).
concat( [H|L1], L2, [H|L3] ) :- concat( L1, L2, L3 ).