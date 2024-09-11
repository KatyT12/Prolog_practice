tree(empty).
tree(T,N,U) :- tree(T), tree(U), integer(N).

insert(Item, empty,tree(empty, Item, empty)).
insert(Item, tree(T,Item,U), tree(T,Item,U)).
insert(Item, tree(T,M,U), tree(A,M,U)) :- Item < M, insert(Item, T, A).
insert(Item, tree(T,M,U), tree(T,M,A)) :- Item > M, insert(Item, U, A).


lookup(Item, tree(_,Item,_)).
lookup(Item, tree(T,N,_)) :- Item < N, lookup(Item, T).
lookup(Item, tree(_,N,U)) :- Item > N, lookup(Item, U).


/* member(+L,?X) or member(+L,+X) succeeds if X is a member of L*/
member([H|_],H).
member([_|T],X) :- member(T,X).

arrayFrom(_,0,[]).
arrayFrom(T,N,[H|T1]) :- N>0, X is N-1, member(T,H), arrayFrom(T, X, T1).


appendLast([],H,[H]).
appendLast([H|T],A,[H|T1]) :- appendLast(T,A,T1).

shiftList(T,T,T).
shiftList(T,[H|T1],X) :- appendLast(T1,H,X), X \= T.
shiftList(T,[H|T1],Y) :- appendLast(T1,H,X), X \= T, shiftList(T,X,Y).

checkPermutation([],[]).
checkPermutation([H|T], [H|T1]) :- shiftList(T,T,X), checkPermutation(X,T1).
checkPerm(T1,T2) :- shiftList(T1,T1,X), checkPermutation(X,T2).

len([],0).
len([_|T],X) :- len(T,A), X is A + 1.

genPerm(T,X) :- len(T,N), arrayFrom(T,N,X), checkPerm(T,X).
/* checkPerm([1,2,3,4,5], [1,2,3,5,4])*/

perm([X],[X]).
perm(T,[H|Y]) :- shiftList(T,T,[H|T1]), perm(T1,Y).