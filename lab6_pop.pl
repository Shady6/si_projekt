% Puste na 1
moveinfo(
     board(
      I6, I7,
     I3, I4, I5,
     e, X ),
     board(
      I6, I7,
     I3, I4, I5,
     X, e ),
     move([X, 2, 1])
     ).
moveinfo(
     board(
      I6, I7,
     X, I4, I5,
     e, I2 ),
     board(
      I6, I7,
     e, I4, I5,
     X, I2 ),
     move([X, 3, 1])
     ).

% Puste na 2
moveinfo(
     board(
      I6, I7,
     I3, I4, I5,
     X, e ),
     board(
      I6, I7,
     I3, I4, I5,
     e, X ),
     move([X, 1, 2])
     ).
moveinfo(
     board(
      I6, I7,
     I3, X, I5,
     I1, e ),
     board(
      I6, I7,
     I3, e, I5,
     I1, X ),
     move([X, 4, 2])
     ).
moveinfo(
     board(
      X, I7,
     I3, I4, I5,
     I1, e ),
     board(
      e, I7,
     I3, I4, I5,
     I1, X ),
     move([X, 6, 2])
     ).

% Puste na 3
moveinfo(
     board(
      I6, I7,
     e, I4, I5,
     X, I2 ),
     board(
      I6, I7,
     X, I4, I5,
     e, I2 ),
     move([X, 1, 3])
     ).
moveinfo(
     board(
      I6, I7,
     e, X, I5,
     I1, I2 ),
     board(
      I6, I7,
     X, e, I5,
     I1, I2 ),
     move([X, 4, 3])
     ).
moveinfo(
     board(
      I6, I7,
     e, I4, X,
     I1, I2 ),
     board(
      I6, I7,
     X, I4, e,
     I1, I2 ),
     move([X, 5, 3])
     ).

% Puste na 4
moveinfo(
     board(
      I6, I7,
     X, e, I5,
     I1, I2 ),
     board(
      I6, I7,
     e, X, I5,
     I1, I2 ),
     move([X, 3, 4])
     ).
moveinfo(
     board(
      X, I7,
     I3, e, I5,
     I1, I2 ),
     board(
      e, I7,
     I3, X, I5,
     I1, I2 ),
     move([X, 6, 4])
     ).
moveinfo(
     board(
      I6, I7,
     I3, e, X,
     I1, I2 ),
     board(
      I6, I7,
     I3, X, e,
     I1, I2 ),
     move([X, 5, 4])
     ).
moveinfo(
     board(
      I6, I7,
     I3, e, I5,
     I1, X ),
     board(
      I6, I7,
     I3, X, I5,
     I1, e ),
     move([X, 2, 4])
     ).

% Puste na 5
moveinfo(
     board(
      I6, I7,
     I3, X, e,
     I1, I2 ),
     board(
      I6, I7,
     I3, e, X,
     I1, I2 ),
     move([X, 4, 5])
     ).
moveinfo(
     board(
      I6, I7,
     X, I4, e,
     I1, I2 ),
     board(
      I6, I7,
     e, I4, X,
     I1, I2 ),
     move([X, 3, 5])
     ).
moveinfo(
     board(
      I6, X,
     I3, I4, e,
     I1, I2 ),
     board(
      I6, e,
     I3, I4, X,
     I1, I2 ),
     move([X, 7, 5])
     ).

% Puste na 6
moveinfo(
     board(
      e, I7,
     I3, X, I5,
     I1, I2 ),
     board(
      X, I7,
     I3, e, I5,
     I1, I2 ),
     move([X, 4, 6])
     ).

moveinfo(
     board(
      e, I7,
     I3, I4, I5,
     I1, X ),
     board(
      X, I7,
     I3, I4, I5,
     I1, e ),
     move([X, 2, 6])
     ).
moveinfo(
     board(
      e, X,
     I3, I4, I5,
     I1, I2 ),
     board(
      X, e,
     I3, I4, I5,
     I1, I2 ),
     move([X, 7, 6])
     ).

% Puste na 7
moveinfo(
     board(
      X, e,
     I3, I4, I5,
     I1, I2 ),
     board(
      e, X,
     I3, I4, I5,
     I1, I2 ),
     move([X, 6, 7])
     ).
moveinfo(
     board(
      I6, e,
     I3, I4, X,
     I1, I2 ),
     board(
      I6, X,
     I3, I4, e,
     I1, I2 ),
     move([X, 5, 7])
     ).

queue(b,w).
queue(w,b).


play(Player, Input, Output, HistoryBoard, HistoryMove) :- 
    play(Player, Input, Output, [], HistoryBoard, HistoryMove).

play(_, Output, Output, _, [Output], []).

play(Player, Input, Output, Acc, [Input|HistT], [[Player, R1, R2]|MoveT]) :- 
    moveinfo(Input, NewBoard, move([Player, R1, R2])),
    queue(Player, NewPlayer),
    not(member(NewBoard, [Input|Acc])),
    play(NewPlayer, NewBoard, Output, [Input|Acc], HistT, MoveT).
	










































