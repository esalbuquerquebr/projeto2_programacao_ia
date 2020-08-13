%!
% Fatos para o Problema 2.
%
% Definição do Grafo.
%
% !
pway(a, b, 10).
pway(b, c, 15).
pway(d, c, 5).
pway(d, b, 10).
pway(e, d, 100). %extra para teste
pway(f, e, 1). %extra para teste
pway(g, e, 2). %extra para teste

%!
% Predicados para o Problema 2.
%
%!

connected(X, Y, C) :- pway(X, Y, C).
connected(X, Y, C) :- pway(Y, X, C).

%!
% Predicado que resolve o Problema 2, imprimindo a lista de visitação.
%!
solve(X, Y, P, C) :-
       solve(X, Y, [X], R, C),
       reverse(R, P).

solve(X, Y, P, [Y|P], C) :- connected(X, Y, C).
solve(X, Y, V, P, C) :-
       connected(X, I, C1),
       \+(member(I, V)),
       dif(I, Y),
       solve(I, Y, [I|V], P, C2),
       C is (C1 + C2).






