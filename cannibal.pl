
/* Actions: (1,1,1), (0,1,1), (1,0,1), (2,0,1), (0,2,1)*/

/* If M = 0, then it is okay to have more cannibals on that side*/
valid(Mtotal,Ctotal,0,C,B,Visited) :- C>0, C =< Ctotal, CL is Ctotal - C, Mtotal >= CL, \+ member(Visited, [0,C,B]).
/* If M=Mtotal, need C >= 0, C <= Mtotal (on the left)*/
valid(Mtotal,Ctotal,Mtotal,C,B,Visited) :- C>=0, C =< Ctotal, Mtotal >= C, \+ member(Visited, [Mtotal,C,B]).
/*General case*/
valid(Mtotal,Ctotal,M,C,B,Visited) :- M>0, C>=0, M < Mtotal, C =< Ctotal, M >= C, ML is Mtotal - M, CL is Ctotal - C, ML >= CL, \+ member(Visited, [M,C,B]).


action(1,1).
action(1,0).
action(0,1).
action(2,0).
action(0,2).


member([H|_], H).
member([_|T], X) :- member(T,X).

cross(_,_,0,0,_,_,[[0,0,0]]).
cross(Mtotal,Ctotal,M,C,1, Visited, [[M,C,1]|T]) :- valid(Mtotal,Ctotal,M,C,1,Visited), action(X,Y), P is M - X,  Q is C - Y, cross(Mtotal, Ctotal, P, Q, 0, [[M,C,1]|Visited],T).
cross(Mtotal,Ctotal,M,C,0, Visited, [[M,C,0]|T]) :- valid(Mtotal,Ctotal,M,C,0,Visited), action(X,Y), P is M + X,  Q is C + Y, cross(Mtotal, Ctotal, P, Q, 1, [[M,C,0]|Visited],T).

solve(Mtotal, Ctotal, L) :- cross(Mtotal, Ctotal, Mtotal, Ctotal, 1, [], L).