ack(0,N,A) :- A is N+1.
ack(M,0,N) :- M>0, A is M-1, ack(A,1,N). 
ack(M,N,T) :- M>0, N>0, X is M-1, Y is N-1, ack(M,Y,Z), ack(X,Z,T).