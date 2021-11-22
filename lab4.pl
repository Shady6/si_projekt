member(X,[X|_]):-true, !.
member(X,[_|T]):-member(X,T).

concat([], Y, Y).
concat([X|Tx], Y, [X|Z]):-concat(Tx,Y,Z).

delete(A, [A|B], B) :- !.
delete(A, B, B) :- not(member(A,B)), !.
delete(A, [B, C|D], [B|E]) :- delete(A, [C|D], E).

len([],0).
len([_|T],Z):-len(T,Y), Z is Y+1.

rlen([],0):-!.
rlen([H|T],X):-rlen(H,Q1),rlen(T,Q2),X is Q1+Q2,!.
rlen(_,1):-!.

reverse1([],[]).
reverse1([H|T],L):-reverse(T,Q), concat(Q,[H],L).
reverse2([],Acc,Acc).
reverse2([H|T],Acc,L):-reverse2(T,[H|Acc],L).

sum([],0).
sum([X|T],N):-sum(T,Y), N is Y+X.

avg(X,N):-sum(X,Y),len(X,L), L\=0,N is Y/L.

count(_, [], 0) :- !.
count(X,[X|T],N):-count(X,T,Y), N is Y+1, !.
count(X,[_|T], N):-count(X,T,N).

double([],[]):-!.
double([X|T1],[X,X|T2]):-double(T1,T2).

sort1([]):-!.
sort1([_]):-!.
sort1([X,Y|T]):-X<Y,sort1([Y|T]).