assign(true, true).
assign(true, false).
assign(false, true).
assign(false, false).

and(X,Y) :- X,Y.

write_xy(X,Y) :- write(X), write(' '), write(Y), write(' ').

table(X, Y, Expr) :- 
    assign(X, Y),
    write_xy(X,Y),
    call(Expr),
    write('true'),
    nl, 
    fail.

table(X, Y, Expr) :- 
    assign(X, Y),
    write_xy(X,Y),
    \+ call(Expr),
    write('false'),
    nl,
    fail.


% or(X,Y) :- X;Y.
% not(X) :- \+ X.
% equal(X,Y) :- X =:= Y.
% xor(X,Y) :- and(or(X,Y),not(and(X,Y))).
% nand(X,Y) :- not(and(X,Y)).
% nor(X,Y) :- not(or(X,Y)).
