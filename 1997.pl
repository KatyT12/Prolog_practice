
append([],L) :-  L.
append([_|T],L) :- append(T,L).


/* 0, n(1,1)*/

enum1(0,[0],[]).
enum1(1,[],[1]).
enum1(n(A,B),X,Y) :- append(P,R,X), append(Q,S,Y), append(P,Q,P1), append(R,S,R1), R1 \= [], P1 \= [], enum1(A,P,Q), enum1(B,R,S).


app(A-B, B-C, A-C).
enum2(0, [0|A]-A, B-B).
enum2(1, A-A, [1|B]-B).
enum2(n(A,B),X,Y) :- enum2(A,P,Q), enum2(B,R,S), app(P,R,X), app(Q,S,Y).


enum3(0, [0|A]-A, B-B).
enum3(1, A-A, [1|B]-B).
enum3(n(A,B),P-R1,Q-S1) :- enum3(A,P-P1,Q-Q1), enum3(B,P1-R1,Q1-S1).

enum4(0, [0|A]-A, B-B).
enum4(1, A-A, [1|B]-B).
enum4(n(A,B),X,Y) :- app(P,R,X), app(Q,S,Y), app(P,Q,P1), app(R,S,R1), \+ unify_with_occurs_check(R1,Z-Z), \+ unify_with_occurs_check(P1,L-L), enum4(A,P,Q), enum4(B,R,S).


enum(Tree, X, Y) :- enum3(Tree, X-[], Y-[]).