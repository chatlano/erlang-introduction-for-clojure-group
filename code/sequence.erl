-module(sequence).
-compile(export_all).

%% 1

greet(male, Name) ->
	io:format("Hello, Mr. ~s!", [Name]);
greet(female, Name) ->
	io:format("Hello, Mrs. ~s!", [Name]);
greet(_, Name) ->
	io:format("Hello, ~s!", [Name]).

%% 2

area({square, Side}) ->
	Side * Side;
area({circle, Radius}) ->
	3.1415 * Radius * Radius;
area({triangle, A, B, C}) ->
	S = (A + B + C)/2,
	math:sqrt(S*(S-A)*(S-B)*(S-C));
area(Other) ->
	{error, Other}.

%% 3

factorial(0) -> 1;
factorial(N) when N > 0 ->
	N * factorial(N - 1).

%% 4
average(X) -> sum(X) / len(X).

sum([H|T]) -> H + sum(T);
sum([]) -> 0.

len([_|T]) -> 1 + len(T);
len([]) -> 0.

%% 5 Tail Recursion
tail_fac(N) ->
	factorial(N, 1).

factorial(0, Acc) ->
	Acc;
factorial(N, Acc) when N > 0 ->
	factorial(N-1, Acc * N).

tail_sum(List) ->
	sum(List, 0).

sum([], Acc) ->
	Acc;
sum([H|T], Acc) ->
	sum(T, Acc + H).

tail_len(List) ->
	len(List, 0).

len([], Acc) ->
	Acc;
len([_|T], Acc) ->
	len(T, 1 + Acc).
