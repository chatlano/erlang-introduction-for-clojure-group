-module(dolphins).
-compile(export_all).

%% 1

cool_one() ->
	receive
	  do_a_flip ->
		io:format("How about no?~n");
	  fish ->
		io:format("So long and thanks for all the fish!~n");
	  _ ->
		io:format("Heh, we're smarter than you humans.~n")
	end.

%% 2

cool_two() ->
	receive
	do_a_flip ->
	  io:format("How about no?~n"),
	  cool_two();
	fish ->
	  io:format("So long and thanks for all the fish!~n");
	_ ->
	  io:format("Heh, we're smarter than you humans.~n"),
	  cool_two()
	end.
