take([H | T], T).
take([H | T], A) :- A = [H|B], take(T,B).
