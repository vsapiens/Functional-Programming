-module(hw11).
-export([pow/2, fibonacci/1, reverse/1, count/2]).

% Complete the following functions and submit your file to Canvas.

% ========= IMPORTANT ==========
% Change the name of the file so that it contains your student ID or name.
% Do not change the names of the functions. The system will specifically look for the names used in this file. Changing the name of a function will automatically make you lose the points for that function.
% Do not change the number of arguments in the functions. Changing the number of arguments of a function will automatically make you lose the points for that function.
% Make sure that nothing additional is printed as the result of running this file. Avoid printing names, student IDs, or any other messages. If you print anything else, the system will wrongly grade your solutions.
% If your file cannot be loaded by the Erlang compiler, your grade will be zero. Then, submit only code that works.

powAux(_,-1,_) -> 1;
powAux(N,X,Acc) ->
    if X >= 1 -> powAux(N,X-1,N*Acc);
    true -> Acc
end.

% pow (tail recursive version)
pow(N, X) -> powAux(N,X-1,N).

fibonacciAux(0,X,_) -> X;
fibonacciAux(N,X,Y) -> fibonacciAux(N-1, X+Y,X).

% Fibonacci (tail recursive version)
fibonacci(N) -> fibonacciAux(N,0,1).

reverseAux([X|XS], Y) -> reverseAux(XS,[X|Y]);
reverseAux([],Y) -> Y.

% reverse (tail recursive version)
reverse(X) -> reverseAux(X,[]).

% count (tail recursive version

countAux(_,[],Acc)-> Acc;
countAux(X,[Y|YS],Acc)->
    if X == Y -> countAux(X,YS,Acc+1);
    true -> countAux(X,YS,Acc)
    end.

count(X, Y) -> countAux(X,Y,0).
