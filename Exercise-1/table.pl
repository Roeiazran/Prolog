assign(X,Y) :- member(X, [true, false]), member(Y, [true, false]).

write_xy(true, true) :- write('true  true  ').
write_xy(true, false) :- write('true  fail  ').
write_xy(false, true) :- write('fail  true  ').
write_xy(false, false) :- write('fail  fail  ').

and(X,Y) :- X,Y.
not(X) :- \+X.
equal(X,Y) :- (X,Y); (\+X, \+Y).
xor(X,Y) :- and(or(X,Y),not(and(X,Y))).
nand(X,Y) :- not(and(X,Y)).
nor(X,Y) :- not(or(X,Y)).
or(X,Y) :- not(and(not(X), not(Y))).

execute(Expr) :- call(Expr), write('true').
execute(Expr) :- \+call(Expr), write('fail').

table(X, Y, Expr) :- 
    assign(X, Y),
    write_xy(X,Y),
    execute(Expr),
    nl,
    fail.