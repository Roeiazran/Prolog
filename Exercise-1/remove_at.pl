% base case: K = 1.
remove_at(X, [H|T], 1, R) :- X = H, R = T, !.

% recursive step: decrement k and call remove_at on tail.
remove_at(X, [H|T], K, [H|R]) :- 
    K1 is K - 1,
    remove_at(X, T, K1, R).