% use the is_prime file
:- consult('is_prime.pl').

% base case: K = N, return empty array and stop backtracking
iterate(N, [], N) :- !.

% check if both N and N - K are primes, if so return a list
iterate(N, X, K) :-
    N1 is N - K,
    is_prime(K),
    is_prime(N1),
    X = [K|[N1 | []]], !.

% iterate
iterate(N, X, K) :-
    K1 is K + 1,
    iterate(N, X, K1).

goldbach(N, X) :- iterate(N, X, 1).