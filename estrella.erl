-module(estrella).
-export([home/3, start/2, node/1]).

node(N) ->
	io:format("Nodo " ++ integer_to_list(N) ++ " creado~n", []),
	receive
		{Home_ID, X, Node_ID, M} ->
			io:format(X, [Node_ID])
	end.
	
home(0, M, [H|T]) ->
	io:format("Llamando nodo ~p~n", [H]),
	H ! {self(), "Procese inicial manda mensaje a ~p~n", H, M},
	home(0, M, T),
	receive
		{X} ->
			io:format(X, []);
		{X, Node_ID} ->
			io:format(X, [Node_ID])
	end;
home(0, M, []) ->
	io:format("Todos los nodos han recibido mensaja~n", []),
	receive
		{X} ->
			io:format(X, []);
		{X, Node_ID} ->
			io:format(X, [Node_ID])
	end;
home(N, M, L) ->
	H = spawn(estrella, node, [N]),
	io:format("Creando nodo " ++ integer_to_list(N) ++ " ~p~n", [H]),
	home(N - 1, M, [H|L]),
	receive
		{X} ->
			io:format(X, []);
		{X, Node_ID} ->
			io:format(X, [Node_ID])
	end.
	
start(N, M) ->
	spawn(estrella, home, [N, M, []]),
	io:format("Home ha sido creado~n", []).