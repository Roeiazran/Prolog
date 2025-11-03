
% base case: K = 1.
element_at(X, [H|_], 1) :- X = H, !.

% recursive step: decrement k and call element_at on tail.
element_at(X, [_|T], K) :- 
    K1 is K - 1,
    element_at(X, T, K1).