
/*X and Y are difference lists*/

/*app(A,A1) :- unify_with_occurs_check(A,A1).*/
app(A-B,B-C,A-C).


rotate([H|T]-[H|A],T-A).

rotate2([H|T]-[H|C], Y) :- app(T-[H|C], [H|A]-B, Y).


app1(T-A, R-B, Y-B) :- 