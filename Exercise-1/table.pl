assign(true, true) :- write('true'), write('  '), write('true'), write('  ').
assign(true, false) :- write('true'), write('  '), write('fail'), write('  ').
assign(false, true) :- write('fail'), write('  '), write('true'), write('  ').
assign(false, false) :- write('fail'), write('  '), write('fail'), write('  ').

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
    execute(Expr),
    nl,
    fail.