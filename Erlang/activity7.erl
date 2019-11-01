-module(activity7).

-import(lists, [sum/1]).

-export([averages/1, degrees/1, mySum/1, quicksort/1,
	 removeList/2, transpose/1]).

removeList(_, []) -> [];
removeList(0, L) -> L;
removeList(N, L) -> removeList(N - 1, tl(L)).

mySum([]) -> [];
mySum([X]) -> X;
mySum([X | XS]) -> X + mySum(XS).

quicksort([]) -> [];
quicksort([Partition | Rest]) ->
    quicksort([X || X <- Rest, X < Partition]) ++
      [Partition] ++
	quicksort([X || X <- Rest, X >= Partition]).

averages([]) -> [{"Males", 0}, {"Females", 0}];
averages(X) ->
    [{"Males",
      sum(lists:map(fun ({_, He}) -> He end,
		    lists:filter(fun ({Gen, _}) -> Gen == "Male" end, X)))
	/
	length(lists:filter(fun ({Gen, _}) -> Gen == "Male" end,
			    X))},
     {"Females",
      sum(lists:map(fun ({_, He}) -> He end,
		    lists:filter(fun ({Gen, _}) -> Gen == "Female" end, X)))
	/
	length(lists:filter(fun ({Gen, _}) -> Gen == "Female"
			    end,
			    X))}].

degrees([]) -> [];
degrees([X | Xs]) -> [length(X) - 1 | degrees(Xs)].

transpose([[] | _]) -> [];
transpose(M) ->
    [lists:map(fun ([X | _]) -> X end, M)
     | transpose(lists:map(fun ([_ | X]) -> X end, M))].
