and(X,Y) :- X,Y.
or(X,Y) :- X;Y.
not(X) :- \+ X.
equal(X,Y) :- X =:= Y.
xor(X,Y) :- and(or(X,Y),not(and(X,Y))).
nand(X,Y) :- not(and(X,Y)).
nor(X,Y) :- not(or(X,Y)).
X = true.
X = false.
Y = true.
Y = false.


