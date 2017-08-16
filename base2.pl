:- dynamic user_happy/1.
:- dynamic user_listens2music/1.

happy(X) :- user_happy(X); predefined_happy(X).

listens2music(X) :- user_listens2music(X); predefined_listens2music(X).

party.

playsAirGuitar(butch) :- happy(butch).
playsAirGuitar(butch) :- listens2music(butch).
playsAirGuitar(jody).
playsAirGuitar(mia) :- listens2music(mia).
playsAirGuitar(vincent) :- listens2music(vincent), happy(vincent).
playsAirGuitar(yolanda) :- listens2music(yolanda).

predefined_happy(vincent).

predefined_listens2music(butch).
predefined_listens2music(mia).
predefined_listens2music(yolanda) :- happy(yolanda).

woman(jody).
woman(mia).
woman(yolanda).