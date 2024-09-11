fib(0,0).
fib(1,1).
fib(X,Y) :- X>1, A is X-1, B is X-2, fib(A,A1), fib(B,B1), Y is A1 + B1.