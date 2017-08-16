-module(tut8).
-export([start/0, say_something/2]).
say_something(_, 0) -> done;
say_something(What, Times) -> io:format("~p~n", [What]), say_something(What, Times - 1).
start() ->
	spawn(tut8, say_something, [hello, 3]),
	spawn(tut8, say_something, [goodbye, 3]).