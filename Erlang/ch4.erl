-module(ch4).

-export([add/1, calculate/1, divide/1, doMath/3,
	 getResult/0, multiply/1, respond/0, startCalculator/1,
	 startClock/0, stopClock/0, subtract/1, sum/0,
	 sumConcurrent/1, sumList/0, tac/0, tic/0]).

respond() ->
    receive
      X when is_number(X) ->
	  io:format("~p~n", [X + 1]), respond();
      _ -> io:format("Bye \n")
    end.

sum() -> receive {Pid, Y, Z} -> Pid ! Y + Z end.

multiply() -> receive {Pid, X, W} -> Pid ! X * W end.

doMath(X, Y, Z) ->
    PidSum = spawn(fun sum/0),
    PidMul = spawn(fun multiply/0),
    PidSum ! {self(), Y, Z},
    receive N -> PidMul ! {self(), N, X} end,
    receive A -> A end.

calculate(X) ->
    receive
      {"+", N} -> calculate(X + N);
      {"-", N} -> calculate(X - N);
      {"*", N} -> calculate(X * N);
      {"/", N} -> calculate(X / N);
      finish -> io:format("The result is ~p~n", [X])
    end.

startCalculator(X) ->
    Pid = spawn(?MODULE, calculate, [X]),
    register(calculator, Pid).

add(X) -> calculator ! {"+", X}.

multiply(X) -> calculator ! {"*", X}.

subtract(X) -> calculator ! {"-", X}.

divide(X) -> calculator ! {"/", X}.

getResult() -> calculator ! finish.

startClock() ->
    register(ticID, spawn(fun tic/0)),
    register(tacID, spawn(fun tac/0)),
    io:format("Clock Started\n"),
    ticID ! 0.

tic() ->
    receive
      0 ->
	  io:format("Tic ....\n"),
	  timer:send_after(1000, tacID, 0),
	  tic();
      1 -> unregister(ticID)
    end.

tac() ->
    receive
      0 ->
	  io:format("Tac ....\n"),
	  timer:send_after(1000, ticID, 0),
	  tac();
      1 -> unregister(tacID)
    end.

stopClock() -> ticID ! 1, tacID ! 1.

sumList() -> receive {Pid, X} -> Pid ! lists:sum(X) end.

sumConcurrent(X) ->
    PidSum = spawn(fun sumList/0),
    PidSum ! {self(), X},
    receive Y -> Y end.
