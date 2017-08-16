-module(estrella).
-export([home/3, start/2, node/1]).

node(N) ->
	receive
		{Home_ID, X, M} ->
			if M > 0 ->
				Home_ID ! {self(), "Nodo (" ++ integer_to_list(N) ++ "): " ++ X ++ "~n"}, 
				io:format(X, []);
			   M =< 0, N > 0 ->
				io:format("Proceso " ++ integer_to_list(N) ++ " ha terminado~n", []);
			   M =< 0, N =< 0 ->
				io:format("Proceso " ++ integer_to_list(N) ++ " ha terminado~n", []),
				Home_ID ! finished
			end
	end.


home(0, M, []) ->
	receive
		finished -> 
			io:format("Proceso inicial ha terminado~n", []);
		{Node_ID, X} ->
			io:format(X, []),
			Node_ID ! {self(), "Procese inicial: Mensaje " ++  integer_to_list(M) ++ "~n", M},
			home(0, M - 1, [])
	end;
home(0, M, [H|T]) ->
	H ! {self(), "Procese inicial: Mensaje " ++  integer_to_list(M) ++ "~n", M},
	home(0, M, T),
	receive
		finished -> 
			io:format("Proceso inicial ha terminado~n", []);
		{Node_ID, X} ->
			io:format(X, []),
			Node_ID ! {self(), "Procese inicial: Mensaje " ++  integer_to_list(M) ++ "~n", M},
			home(0, M - 1, [])
	end;
home(N, M, L) ->
	home(N - 1, M, [spawn(estrella, node, [N - 1])|L]).
	
start(N, M) ->
	spawn(estrella, home, [N + 1, M, []]).