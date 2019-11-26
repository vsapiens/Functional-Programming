duplicate([],[]).
duplicate([L|LS],X):- append([L],[L],M), duplicate(LS,R), append(M,R,X),!.

sum([],0).
sum([L|LS],X):- is_list(L), sum(LS,R), X is R,!.
sum([L|LS],X):- sum(LS,R), X is R+L,!.

toBinaryString(0,"0").
toBinaryString(1,"1").
toBinaryString(N,X):- 0 is mod(N,2),L is div(N,2), toBinaryString(L,R), atom_concat(R,"0",X),!.
toBinaryString(N,X):- 1 is mod(N,2),L is div(N,2), toBinaryString(L,R), atom_concat(R,"1",X),!.


solveEinstein(Solution) :-
    length(Solution, 5),
    member([red, _, _, _, englishman], Solution),
    member([_, dogs, _, _, sweede], Solution),
    member([_, _, tea, _, dane], Solution),
    right([green, _, _, _, _], [white, _, _, _, _], Solution),
    member([green, _, coffee, _, _], Solution),
    member([_, birds, _, pallmall, _], Solution),
    member([yellow, _, _, dunhills, _], Solution),
    Solution = [_, _, [_, _, milk, _, _], _, _],
    Solution = [[_, _, _, _, norwegian], _, _, _, _],
    next([_, cats, _, _, _], [_, _, _, blend, _], Solution),
    member([_, _, beer, bluemaesters, _], Solution),
    next([_, _, _, dunhills, _], [_, horses, _, _, _], Solution),
    member([_, _, _, prince, german], Solution),
    next([_, _, _, _, norwegian], [blue, _, _, _, _], Solution),
    next([_, _, water, _, _], [_, _, _, blend, _], Solution),
    member([_, fish, _, _, _], Solution), !.