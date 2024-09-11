even(0).
even(X) :- X>0, A is X-2,even(A).
power(_,0,1).
power(X,1,X).
power(X,Y,Z) :- Y>0, even(Y), A is X*X, B is Y//2, power(A,B,Z).
power(X,Y,Z) :- Y>2, \+ even(Y), X1 is X*X, Y1 is Y//2, power(X1,Y1,A), Z is X * A.


first_digit(X,X) :- X < 10, X >= 0.
first_digit(X,A) :- X > 10, B is X/10, first_digit(B,A).

num_digits(X,1) :- X < 10. 
num_digits(X,A) :- B is X/10, num_digits(B,A)

armstrong(X) :- first_digit(X,A), num_digits(X,B), power(A,B)