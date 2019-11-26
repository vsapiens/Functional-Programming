square([],[]).
square([L|LS],[Z|W]):- Z is L^2, square(LS,W).

sumN(1,1).
sumN(N,X):- M is N-1 ,sumN(M,Y), X is N+Y,!.

xLength([], 0).
xLength([_|LS],X):- xLength(LS,Y), X is Y+1.

nLength([],0).
nLength([L|LS],X):- is_list(L),nLength(L,MS),nLength(LS,NS),X is MS + NS, !.
nLength([_|LS],X):- nLength(LS,Y), X is Y+1.

dotProduct([X],[Y],P):- P is X*Y.
dotProduct([X|XS],[Y|YS],P):- I is X*Y ,dotProduct(XS,YS,O), P is O+I,!.