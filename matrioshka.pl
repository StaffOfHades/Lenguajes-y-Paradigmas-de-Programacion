directamenteEn(emilia, casandra).
directamenteEn(casandra, irina).
directamenteEn(irina, natasha).
directamenteEn(natasha, olga).
directamenteEn(olga, katarina).

en(X, Y) :- directamenteEn(X, Y).
en(X, Y) :- directamenteEn(Z, Y), en(X, Z).