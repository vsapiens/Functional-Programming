:-use_module(library(clpfd)).

right(X, Y, L) :-
    nth1(X1, L, X),
    nth1(Y1, L, Y),
    X1 is Y1 + 1.

next(X, Y, L) :-
    right(X, Y, L);
    right(Y, X, L).

duplicate([],[]).
duplicate([L|LS],X):- append([L],[L],M), duplicate(LS,R), append(M,R,X),!.

sum([],0).
sum([L|LS],X):- is_list(L), sum(LS,R), X is R,!.
sum([L|LS],X):- sum(LS,R), X is R+L,!.

toBinaryString(0,"0").
toBinaryString(1,"1").
toBinaryString(N,X):- 0 is mod(N,2),L is div(N,2), toBinaryString(L,R), atom_concat(R,"0",X),!.
toBinaryString(N,X):- 1 is mod(N,2),L is div(N,2), toBinaryString(L,R), atom_concat(R,"1",X),!.

edge(a,b,1).
edge(a,d,2).
edge(b,c,3).
edge(b,d,4).
edge(d,e,5).
edge(e,f,6).

path(X, Y, [X|Y], X1) :- edge(X, Y, X1).
path(X, Y, [X|LS], C) :- edge(X, Z, L1), path(Z, Y, LS, L2), C is L1 + L2.

magicSquare([[A,B,C],[D,E,F],[G,H,I]]) :-
    L = [1,2,3,4,5,6,7,8,9],
    member(A, L),
    member(B, L),
    member(C, L),
    member(D, L),
    member(E, L),
    member(F, L),
    member(G, L),
    member(H, L),
    member(I, L),
    all_different([A,B,C,D,E,F,G,H,I]),
    15 is A+B+C,
    15 is D+E+F,
    15 is G+H+I,
    15 is A+D+G,
    15 is B+E+H,
    15 is C+F+I,
    15 is A+E+I,
    15 is C+E+G.    


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