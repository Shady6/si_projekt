% Predicates connected with order of ppl:

% Above in one column
above(X,Y,order(X,_,
                Y,_,
                _,_)).
above(X,Y,order(X,_,
                _,_,
                Y,_)).
above(X,Y,order(_,_,
                X,_,
                Y,_)).
above(X,Y,order(_,X,
                _,Y,
                _,_)).
above(X,Y,order(_,X,
                _,_,
                _,Y)).
above(X,Y,order(_,_,
                _,X,
                _,Y)).

% Between in one column
between1(X,Y,Z,O):-above(X,Z,O),above(Z,Y,O).
between1(X,Y,Z,O):-above(Y,Z,O),above(Z,X,O).

% On the left side of building
left(X,order(X,_,
             _,_,
             _,_)).
left(X,order(_,_,
             X,_,
             _,_)).
left(X,order(_,_,
             _,_,
             X,_)).

% Next to other person
nextto(X,Y,order(X,Y,
                 _,_,
                 _,_)).
nextto(X,Y,order(_,_,
                 X,Y,
                 _,_)).
nextto(X,Y,order(_,_,
                 _,_,
                 X,Y)).

% and reverse order
nextto(X,Y,order(Y,X,
                 _,_,
                 _,_)).
nextto(X,Y,order(_,_,
                 Y,X,
                 _,_)).
nextto(X,Y,order(_,_,
                 _,_,
                 Y,X)).
% One floor up
oneup(X,Y,order(X,_,
                Y,_,
                _,_)).
oneup(X,Y,order(X,_,
                _,Y,
                _,_)).
oneup(X,Y,order(_,X,
                _,Y,
                _,_)).
oneup(X,Y,order(_,X,
                Y,_,
                _,_)).
oneup(X,Y,order(_,_,
                X,_,
                Y,_)).
oneup(X,Y,order(_,_,
                X,_,
                _,Y)).
oneup(X,Y,order(_,_,
                _,X,
                _,Y)).
oneup(X,Y,order(_,_,
                _,X,
                Y,_)).

% At the top floor
attop(X,order(X,_,
              _,_,
              _,_)).
attop(X,order(_,X,
              _,_,
              _,_)).

% At the bottom floor
atbottom(X,order(_,_,
                 _,_,
                 X,_)).
atbottom(X,order(_,_,
                 _,_,
                 _,X)).

% Predicate for finding one person
exists(X,order(X,_,
              _,_,
              _,_)).
exists(X,order(_,X,
              _,_,
              _,_)).
exists(X,order(_,_,
              X,_,
              _,_)).
exists(X,order(_,_,
              _,X,
              _,_)).
exists(X,order(_,_,
              _,_,
              X,_)).
exists(X,order(_,_,
              _,_,
              _,X)).


% Defining known clues:

% 1. Stanisław mieszka nad osobą, która przegląda czat.
clue1(O):-above(person(stanislaw,_,_),person(_,przegladaczat,_),O).
% 2. Student wykonujący swoją czynność rano mieszka pod studentem, który zmywa naczynia.
clue2(O):-above(person(_,zmywa,_),person(_,_,rano),O).
% 3. Mirosław mieszka obok osoby, która wykonuje swoje zadanie w czasie wolnym.
clue3(O):-nextto(person(miroslaw,_,_),person(_,_,czaswolny),O).
% 4. Student, który odrabia lekcje mieszka na tym samym piętrze co Anna.
clue4(O):-nextto(person(_,odrabia,_),person(anna,_,_),O).
% 5. Student, który wykonuje swoją czynność podczas zajęć mieszka pomiędzy Anną, a Adamem.
clue5(O):-between1(person(anna,_,_),person(adam,_,_),person(_,_,podczaszajec),O).
% 6. Student, który swoje zajęcie wykonuje w nocy mieszka na samej górze.
clue6(O):-attop(person(_,_,noc),O).
% 7. Adrian mieszka na parterze.
clue7(O):-atbottom(person(adrian,_,_),O).
% 8. Ola mieszka piętro wyżej niż student, który zjada warzywa.
clue8(O):-oneup(person(ola,_,_),person(_,jewarzywa,_),O).
% 9. Student który wysyła zdjęcia mieszka piętro niżej niż osoba, która przegląda czat roku.
clue9(O):-oneup(person(_,przegladaczat,_),person(_,wysylazdjecia,_),O).
% 10. Student, który robi swoje zajęcie wieczorami mieszka obok Adama.
clue10(O):-nextto(person(_,_,wieczor),person(adam,_,_),O).
% 11. Pewien student rano zjada warzywa.
clue11(O):-exists(person(_,jewarzywa,rano),O).
% 12. Inny student zmywa naczynia po południu.
clue12(O):-exists(person(_,zmywa,popoludniu),O).
% 13. Mirosław mieszka obok studenta, który przegląda czat.
clue13(O):-nextto(person(miroslaw,_,_),person(_,przegladaczat,_),O).
% 14. Osoba która przegląda czat robi to w czasie wolnym.
clue14(O):-exists(person(_,przegladaczat,czaswolny),O).
% 15. Ola mieszka po lewej stronie studenta, który gra w strzelanki
clue15(O):-left(person(ola,_,_),O),nextto(person(ola,_,_),person(_,grawstrzelanki,_),O).

odpowiedz1(O):-
    clue1(O),
    clue2(O),
    clue3(O),
    clue4(O),
    clue5(O),
    clue6(O),
    clue7(O),
    clue8(O),
    clue9(O),
    clue10(O),
    clue11(O),
    clue12(O),
    clue13(O),
    clue14(O),
    clue15(O), !.

odpowiedz2(Who,When):-
    odpowiedz1(O),exists(person(Who,grawstrzelanki,When),O),!.

odpowiedz3(X,Y,Z):-
    odpowiedz1(order(_,_,
                     person(X,_,_),person(Y,_,_),
                     person(Z,_,_),_)).
    


