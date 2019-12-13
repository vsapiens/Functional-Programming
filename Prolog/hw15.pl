:-use_module(library(clpfd)).

insert(X, [], [X]):- !.
insert(X, [X1|L1], [X, X1|L1]):- X=<X1, !.
insert(X, [X1|L1], [X1|L]):- insert(X, L1, L).


insertionSort([], []):- !.
insertionSort([X|L], S):- insertionSort(L, S1), insert(X, S1, S).

travel(A,B,C):-
    A is 4,
    C is A -1,
    B is 4 * C,!.
    

fighting(Vegeta,Gohan,Goku):-
    L = [1,2,3],
    member(Goku,L),
    member(Vegeta,L),
    member(Gohan,L),
    Goku < Gohan,
    Vegeta > Gohan,
    all_different([Vegeta,Gohan,Goku]),!.