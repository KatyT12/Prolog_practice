append([],X,[X]).
append([H|T],X, [H|W]) :- append(T,X,W).

reverse_list([],[]).
reverse_list([X],[X]).
reverse_list([H|T],W) :- reverse_list(T,A), append(A,H,W).