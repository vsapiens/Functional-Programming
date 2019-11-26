
:- use_module(library(clpfd)).
crypt(T,W,O,F,U,R):-
    L = [0,1,2,3,4,5,6,7,8,9],
    member(T,L),
    member(W,L),
    member(O,L),
    member(F,L),
    member(U,L),
    member(R,L),
    O2= O + O,
    R is mod(O2,10),
    Od is div(O2, 10),
    W2 = W + W + Od,
    U is mod(W2 , 10),
    Wd is div(W2,10),
    T2 = T+T+ Wd,
    O is mod(T2,10),
    F is div(T2,10),
    all_different([T,W,O,F,U,R]).

younger(Julio,Gloria,Pablo,Miguel,Silvia):-
    L = [1,2,3,4,5],
    member(Julio,L),
    member(Gloria,L),
    member(Pablo,L),
    member(Miguel,L),
    member(Silvia,L),
    Julio > Gloria,
    Julio > Pablo,
    Miguel < Silvia,
    Miguel < Pablo,
    Miguel > Gloria,
    Julio < Silvia,
    all_different([Julio,Gloria,Pablo,Miguel,Silvia]).
    

    