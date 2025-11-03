assign(true, true).
assign(true, false).
assign(false, true).
assign(false, false).

and(X,Y) :- X,Y.
not(X) :- \+X.
equal(X,Y) :- (X,Y); (\+X, \+Y).
xor(X,Y) :- and(or(X,Y),not(and(X,Y))).
nand(X,Y) :- not(and(X,Y)).
nor(X,Y) :- not(or(X,Y)).
or(X,Y) :- not(and(not(X), not(Y))).

execute(Expr) :- call(Expr), write('true').
execute(Expr) :- \+call(Expr), write('fail').
write_xy(X,Y) :- write(X), write(' '), write(Y), write(' ').

table(X, Y, Expr) :- 
    assign(X, Y),
    write_xy(X,Y),
    execute(Expr),
    nl,
    fail.

table(_,_,_).