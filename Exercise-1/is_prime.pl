iterate(X,N) :-
    Half is X // 2,
    N > Half.

iterate(X,N) :-
    Half is X // 2,
    Half >= N,
    X mod N =\= 0,
    N1 is N + 1,
    iterate(X, N1).

is_prime(X) :- 
    X > 1,
    iterate(X,2).
