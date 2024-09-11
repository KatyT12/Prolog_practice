use_module(library(clpfd)).

below(N,M) :- ground(M),!, M =< N.
below(N,N).
below(N,M) :- var(M), below(N,A), M is A-1.

max(X,Y,X) :- below(X,Y).
max(X,Y,Y) :- A is Y-1, below(A,X).


max1(X,Y,X) :- X #>= Y.
max1(X,Y,Y) :- X #< Y.