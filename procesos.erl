-module(procesos).
-export([start/2, ping/1, pong/1]).

ping(0) ->
	pong ! {finished, 0},
	io:format("ping (" ++ integer_to_list(0) ++ ") finished~n", []);
ping(N) ->
	pong ! {ping, self(), N},
	receive
		{pong, M} -> io:format("ping (" ++ integer_to_list(N) ++ "): " ++ M ++ "~n", [])
	end,
	ping(N - 1).
	
pong(M) ->
	receive
		{finished, N} -> io:format("pong (" ++ integer_to_list(N) ++ ") finished~n", []);
		{ping, Ping_PID, N} ->
			io:format("pong (" ++ integer_to_list(N) ++ "): " ++ M ++ "~n", []),
			Ping_PID ! {pong, M},
			pong(M)
	end.
	
	
start(X, M) ->
	register(pong, spawn(procesos, pong, [M])),
	spawn(procesos, ping, [X]).