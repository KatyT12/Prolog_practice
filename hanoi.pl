
valid([],[H|T],R,Visited) :- inorder([H|T],0), inorder(R,0), \+ member(Visited, [[],[H|T],R]).
valid([H|T],[],R,Visited) :- inorder([H|T],0), inorder(R,0), \+ member(Visited, [[H|T],[],R]).
valid([H1|L],[H2|M],R,Visited) :- inorder([H1|L],0), inorder([H2|M],0), inorder(R,0), \+ member(Visited, [[H1|L],[H2|M],R]).

inorder([],_).
inorder([H|T],M) :- H > M, inorder(T,H).

member([H|_], H).
member([_|T], X) :- member(T,X).


action([H|T],M,R,T,[H|M],R).
action([H|T],M,R,T,M,[H|R]).
action(L,[H|M],R,[H|L],M,R).
action(L,[H|M],R,L,M,[H|R]).
action(L,M,[H|R],[H|L],M,R).
action(L,M,[H|R],L,[H|M],R).


hanoi([],[],R,_,[[[],[],R]]) :- inorder(R,0).
hanoi(L,M,R, Visited, [[L,M,R]|Log]) :- valid(L,M,R,Visited), action(L,M,R, L1, M1, R1), hanoi(L1,M1,R1,[[L,M,R]|Visited], Log).

range(M,M,[M]).
range(Min,Max,[Min|T]) :- Min < Max, A is Min+1, range(A,Max,T).

solve(N, Log) :- range(1,N,L), hanoi(L,[],[],[],Log).