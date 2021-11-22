isnumber(zero).
isnumber(s(X)):-isnumber(X).

isequal(X,X) :- isnumber(X).
isequal(s(X),s(Y)) :- isequal(X,Y). 

lessthanequal(zero,X) :- isnumber(X).
lessthanequal(s(X),s(Y)) :- lessthanequal(X,Y). 

add(zero,X,X) :- isnumber(X).
add(s(X),Y,s(Z)) :- add(X,Y,Z). 

odd(s(X)):-even(X).
even(s(s(X))):-even(X).
even(zero).

times(zero,X,zero):-isnumber(X).
times(s(X),Y,Z):-times(X,Y,Q),add(Y,Q,Z).

quotient(zero, X, zero) :- X\=zero,isnumber(X),!.
quotient(s(X), Y, Z) :- Y\=zero,times(Y,Z,Q),isequal(s(X), Q),!.

remainder(X,Y,R):-Y\=zero, lessthanequal(X,Y), R=X.
remainder(X,Y,R):-Y\=zero, add(Q,Y,X), remainder(Q,Y,R).

fact(zero,s(zero)).
fact(s(N),X):-fact(N,Q),times(Q,s(N),X).

fibonacci(zero, zero).
fibonacci(s(zero),s(zero)).
fibonacci(s(s(zero)),s(zero)).
fibonacci(s(s(N)),X):-fibonacci(s(N), Y1), fibonacci(N, Y2), add(Y1, Y2, X), !.

shownum(zero,0).
shownum(s(X),Z):-shownum(X,P), Z is P+1.