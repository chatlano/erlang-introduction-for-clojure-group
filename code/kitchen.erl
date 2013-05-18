-module(kitchen).
-compile(export_all).

%% 1

fridge(FoodList) ->
	receive
	{From, {store, Food}} ->
	  From ! {self(), ok},
	  fridge([Food|FoodList]);
	{From, {take, Food}} ->
	  case lists:member(Food, FoodList) of
		true ->
		  From ! {self(), {ok, Food}},
		  fridge(lists:delete(Food, FoodList));
		false ->
		  From ! {self(), not_found},
		  fridge(FoodList)
	  end;
	terminate ->
	  ok
	end.

%% 2

start(FoodList) ->
	spawn(?MODULE, fridge, [FoodList]).

store(Pid, Food) ->
	Pid ! {self(), {store, Food}},
	receive
	  {Pid, Msg} -> Msg
	end.
 
take(Pid, Food) ->
	Pid ! {self(), {take, Food}},
	receive
	  {Pid, Msg} -> Msg
	end.

%3 kitchen:take(pid(0,250,0), dog).

store2(Pid, Food) ->
	Pid ! {self(), {store, Food}},
	receive
	  {Pid, Msg} -> Msg
	after 3000 ->
	  timeout
	end.
 
take2(Pid, Food) ->
	Pid ! {self(), {take, Food}},
	receive
	  {Pid, Msg} -> Msg
	after 3000 ->
	  timeout
	end.
