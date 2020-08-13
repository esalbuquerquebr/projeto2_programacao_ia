%!
% Versão 1 para o Problema 1.
%
% Solução utilizando a aplicação sucessiva do predicado 'winner'.
%
%!

%!
% Fatos para o Problema 1.
%!
fact_after(tadeu,luana).
fact_after(tadeu,bruna).
fact_after(simone,paulo).
fact_after(kaio,paulo).
fact_after(kaio,miguel).
fact_after(kaio,tadeu).
fact_after(luana,bruna).
fact_after(luana,davi).
fact_after(miguel,simone).
fact_after(miguel,bruna).
fact_after(davi,simone).
fact_after(joana,paulo).
fact_after(joana,davi).
fact_after(helena,luana).
fact_after(helena,joana).
fact_after(helena,tadeu).

fact_before(tadeu,miguel).
fact_before(paulo,davi).
fact_before(paulo,luana).
fact_before(simone,joana).
fact_before(simone,helena).
fact_before(luana,joana).
fact_before(luana,miguel).
fact_before(bruna,joana).
fact_before(bruna,miguel).
fact_before(bruna,paulo).
fact_before(davi,kaio).
fact_before(davi,tadeu).
fact_before(joana,kaio).
fact_before(joana,tadeu).
fact_before(joana,miguel).
fact_before(helena,miguel).

%!
% Predicados para o Problema 1.
%!
before(X, Y) :- fact_before(X, Y), X\=Y.
before(X, Y) :- fact_after(Y, X), X\=Y.

after(X, Y) :- fact_after(X, Y), X\=Y.
after(X, Y) :- fact_before(Y, X), X\=Y.

previous(X, Y) :- before(X, Y).
previous(X, Y) :- before(X, Z), previous(Z, Y), dif(X, Y), dif(X, Z), dif(Y, Z).
previous(X, Y) :- before(Z, Y), previous(X, Z), dif(X, Y), dif(X, Z), dif(Y, Z).


posterior(X, Y) :- after(X, Y).
posterior(X, Y) :- after(X, Z), posterior(Z, Y), dif(X, Y), dif(X, Z), dif(Y, Z).
posterior(X, Y) :- after(Z, Y), posterior(X, Z), dif(X, Y), dif(X, Z), dif(Y, Z).

first(X) :- previous(_, X), \+(posterior(_, X)), !.
last(X) :- posterior(_, X), \+(previous(_, X)), !.

winner([], _, V, V).
winner([L|Ls], P, C, V) :- (\+(member(L, P)), previous(L, C)) -> winner(Ls, P, L, V); winner(Ls, P, C, V).
winner([L|Ls], P, V) :- (\+(member(L, P)) -> winner(Ls, P, L, V); winner(Ls, P, V)).

ranking(T, R, R) :- length(T, L1), length(R, L2), L1 == L2.
ranking(T, P, R) :- winner(T, P, V), ranking(T, [V|P], R).
ranking(T, R) :- winner(T, [], V), ranking(T, [V], R).

print_result([H|Tail], P) :-
    write(P), write(' - '), write(H), nl,
    P2 is (P + 1),
    print_result(Tail, P2).

%!
% Predicado que resolve o Problema 1, imprimindo a lista ordenada.
%!
solve_ppcomp(S) :-
    Participants = [tadeu, paulo, simone, kaio, luana, miguel, bruna, davi, joana, helena],
    ranking(Participants, List),
    reverse(List, S),
    print_result(S, 1).



