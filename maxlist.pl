max_unique([X],X).
max_unique([H|T], H) :- max_unique(T,M), H >= M.
max_unique([H|T],M) :- max_unique(T,M), H < M.

max_dup([X],X).
max_dup([H|T], M) :- max_dup(T,M), M >= H.
max_dup([H|T], H) :- max_unique(T,M), H >= M.
