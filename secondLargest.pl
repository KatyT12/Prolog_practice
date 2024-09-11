/* secondLargest(+L,?X,?Y) succeeds if L is a list with Y as the largest
item and X as the second largest item
*/


/* largest(+L,+X) succeeds when X is larger or equal to every member in the list L*/
largest([],_).
largest([H|T],X) :- X >= H, largest(T,X).



/* takenOut(+L1, +X, ?L2) succeeds when L2 is the same as L2 with X taken out*/
takenOut([],_,[]).
takenOut([H|T], H, L) :- takenOut(T,H,L).
takenOut([H|T], X, [H|L]) :- X \= H, takenOut(T,X,L).



/* nexthi(+L, ?X) succeeds if X is the second highest item in the list L*/
/*nexthi(L, Y) :- getUnique(L, L1), member(L1,X), largest(L1,X), takenOut(L1,X,L2), member(L2,Y), largest(L2,Y).*/

/* member(+L,?X) or member(+L,+X) succeeds if X is a member of L*/
member([H|_],H).
member([_|T],X) :- member(T,X).

/* getUnique(+L1, ?L2) succeeds if L2 is the same as L1 all duplicates past the first instance aren't present in L2*/
getUnique([H|T],[H|T2]) :- takenOut(T,H,T3), getUnique(T3,T2).
getUnique([],[]).

/* secondLargest(+L, +X, +Y) succeeds if there is no item larger than Y in the list and no item in 
the list larger than X but smaller than Y*/
secondLargest([],X,Y) :- Y < X.
secondLargest([H|T], H, Y) :- secondLargest(T,H,Y).
secondLargest([H|T], X, H) :- secondLargest(T,X,H).
secondLargest([H|T], X, Y) :- H < X, H < Y, secondLargest(T,X,Y).

/* nexthi(+L,?Y) succeeds if Y is the second highest item in L*/
nexthi(L,Y) :- getUnique(L,L1), member(L1,X), member(L1,Y), secondLargest(L1, X, Y).