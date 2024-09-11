

/* partition(+Pivot, +List, ?Left, ?Right)*/
natural(1).
natural(X) :- natural(X0), succ(X0, X).

partition(_,[],[],[]).
partition(N, [H|T], [H|Left], Right) :- natural(N), H =< N, partition(N, T, Left, Right). 
partition(N, [H|T], Left, [H|Right]) :- natural(N), H > N, partition(N, T, Left, Right).

/* What If I actually wanted to generate the pivot instead of the Left and Right? so I had List, Left and Right and I wanted the possible values of the pivot
*/
