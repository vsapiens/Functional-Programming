square([],[]).
square([L|LS],[Z|W]):- Z is L^2, square(LS,W).

sumN(0,X):- X is 0.
sumN(N,X):- X is (N*(N+1))/2.

sumL(1,1).
sumL(N,X):- M is N-1 ,sumL(M,Y), X is N+Y,!.

xLength([], 0).
xLength([_|LS],X):- xLength(LS,Y), X is Y+1.


