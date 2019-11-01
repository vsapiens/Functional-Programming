-module(hw10).

-export([cleanString/1, evaluate/2, is_Element/2,
	 nestedSum/1, pow/2, removeNestedLists/1, sumFirst/1,
	 toBinaryString/1, tuplesToList/1, zip/2]).

% Erick Francisco Gonzalez Martinez A01039859
% Sum of first n positive integers
sumFirst(0) -> 0;
sumFirst(N) ->
    lists:sum([X || X <- lists:seq(1, N), X >= 1]).

nestedSum([]) -> 0;
nestedSum([X | XS]) ->
    if is_list(X) -> nestedSum(X) + nestedSum(XS);
       true -> X + nestedSum(XS)
    end.

% Calculates the sum of the elements in a list (ignores nested lists).

% Removes nested lists in the argument and returns all the elements as one single plain list.
% Removes nested lists in the argument and returns all the elements as one single plain list.
removeNestedLists([]) -> [];
removeNestedLists([X | XS]) ->
    if is_list(X) ->
	   removeNestedLists(X) ++ removeNestedLists(XS);
       true -> [X] ++ removeNestedLists(XS)
    end.

is_Element(_, []) -> false;
is_Element(X, [Y | YS]) ->
    if X == Y -> true;
       true -> is_Element(X, YS)
    end.

% Cleans a string. Given a string, return recursively a 'cleaned' string where adjacent chars that are the same have been reduced to a single char. So "yyzzza" yields "yza".
cleanString([]) -> [];
cleanString([X]) -> [X];
cleanString([X | Xs]) ->
    case is_Element(X, Xs) of
      true -> cleanString(Xs);
      false -> [X] ++ cleanString(Xs)
    end.

pow(_, 0) -> 1;
pow(A, 1) -> A;
pow(A, N) -> A * pow(A, N - 1).

% Evaluation of polynomials
evaluate([], _) -> 0;
evaluate([X | Xs], N) ->
    X * pow(N, length(Xs)) + evaluate(Xs, N).

% Converts a number to a binary string.
toBinaryString(0) -> "0";
toBinaryString(1) -> "1";
toBinaryString(N) ->
    if N rem 2 == 0 -> toBinaryString(N div 2) ++ "0";
       true -> toBinaryString(N div 2) ++ "1"
    end.

% Zipping two lists
zip([], _) -> [];
zip(_, []) -> [];
zip([X | Xs], [Y | Ys]) -> [{X, Y}] ++ zip(Xs, Ys).

% Lists of tuples
tuplesToList([]) -> [];
tuplesToList([{A, B} | Xs]) ->
    [A] ++ [B] ++ tuplesToList(Xs).
