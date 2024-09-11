take([H | T],H, T).
take([H | T],X, [H|B]) :- take(T,X,B).


choose(0,L,[],L).
choose(N,L,[H|T],S) :- N > 0, take(L, H, X), M is N-1, choose(M, X, T, S).



chooseNoDup(0,L,[],L).
chooseNoDup(N,[H|T],[H|T1],S) :- N>0, M is N-1, chooseNoDup(M,T,T1,S).
chooseNoDup(N,[H|T],R,[H|T1]) :- N > 0, chooseNoDup(N,T,R,T1).