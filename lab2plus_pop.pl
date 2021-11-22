male(tom).
male(bob).
male(jim).
male(joe).
female(pat).
female(liz).
female(ann).
female(pam).

parent(pam,bob).
parent(tom,bob).
parent(tom,liz).
parent(bob,ann).
parent(bob,pat).
parent(joe,jim).
parent(pat,jim).

mother(X,Y):-parent(X,Y),female(X).
father(X,Y):-parent(X,Y),male(X).
child(X,Y):-parent(Y,X).
grandparent(X,Y):-parent(X,Z),parent(Z,Y).
greatgrandparent(X,Y):-grandparent(X,Z),parent(Z,Y).
ancestor(X,Y):-parent(X,Y).
ancestor(X,Y):-parent(X,Z), ancestor(Z,Y).

%LAB2 - Extended

son(X,Y):-child(X,Y), male(X).
granddaughter(X,Y):-grandparent(Y,X),female(X).
sister(X,Y):-parent(Z,X),parent(Z,Y),female(X),X\==Y.
aunt(X,Y) :- sister(X,Z),parent(Z,Y).
partner(X,Y):-child(Z,Y),child(Z,X),X\=Y.