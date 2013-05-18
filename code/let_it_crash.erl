-module(let_it_crash).
-compile(export_all).

%% 1 LINKs

myproc() ->
	timer:sleep(5000),
	exit(reason).

%% 2
% process_flag(trap_exit, true).

%% 3
% erlang:monitor(process, spawn(let_it_crash, myproc, [])).
