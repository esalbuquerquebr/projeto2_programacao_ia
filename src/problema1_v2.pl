% P1: Ordenar participantes do PPComp pela classificação.
% @author: Eduardo Albuquerque
%

%!
% print_result([H|Tail])
%     Imprime a lista ordenada.
%     (List) (+)
%!
print_result([H|Tail]) :-
    write(H),
    nl,
    print_result(Tail).

%!
% solve_ppcomp_order(Solucao))
%     Determina a ordem de cada participante do PPComp.
%     (S) (?)
%!
solve_ppcomp(S) :-

    S = [[PTadeu, tadeu],
         [PPaulo, paulo],
         [PSimone, simone],
         [PKaio, kaio],
         [PLuana, luana],
         [PMiguel, miguel],
         [PBruna, bruna],
         [PDavi, davi],
         [PJoana, joana],
         [PHelena, helena]],

    % Posições
    Positions = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
    permutation(Positions, [PTadeu, PPaulo, PSimone, PKaio, PLuana, PMiguel, PBruna, PDavi, PJoana, PHelena]),

    % 1.  Tadeu Torres terminou depois de Luana Lessa e Bruna Barros, mas antes de Miguel Moraes.
    member([PTadeu, tadeu], S), PTadeu > PLuana, PTadeu > PBruna, PTadeu < PMiguel,

    % 2.  Paulo Pereira terminou antes de Davi Dantas e Luana Lessa.
    member([PPaulo, paulo], S), PPaulo < PDavi, PPaulo < PLuana,

    % 3.  Simone Saraiva terminou depois de Paulo Pereira e antes de Joana Jensen e Helena Hansen.
    member([PSimone, simone], S), PSimone > PPaulo, PSimone < PJoana, PSimone < PHelena,

    % 4.  Kaio Kiefer terminou depois de Paulo Pereira, Miguel Moraes e Tadeu Torres.
    member([PKaio, kaio], S), PKaio > PPaulo, PKaio > PMiguel, PKaio > PTadeu,

    % 5.  Luana  Lessa  terminou  depois  de  Bruna  Barros  e  Davi  Dantas,  mas  antes  de  Joana  Jensen  e Miguel Moraes.
    member([PLuana, luana], S), PLuana > PBruna, PLuana > PDavi, PLuana < PJoana, PLuana < PMiguel,

    % 6.  Miguel Moraes terminou depois de Simone Saraiva e Bruna Barros.
    member([PMiguel, miguel], S), PMiguel > PSimone, PMiguel > PBruna,

    % 7.  Bruna Barros terminou antes de Joana Jensen, Miguel Moraes e Paulo Pereira.
    member([PBruna, bruna], S), PBruna < PJoana, PBruna < PMiguel, PBruna < PPaulo,

    % 8.  Davi Dantas terminou antes de Kaio Kiefer e Tadeu Torres, mas depois de Simone Saraiva.
    member([PDavi, davi], S), PDavi < PKaio, PDavi < PTadeu, PDavi > PSimone,

    % 9.  Joana Jensen terminou antes de Kaio Kiefer, Tadeu Torres e Miguel Moraes,  mas depois de Paulo Pereira e Davi Dantas.
    member([PJoana, joana], S), PJoana < PKaio, PJoana < PTadeu, PJoana < PMiguel, PJoana > PPaulo, PJoana > PDavi,

    % 10.  Helena Hansen terminou antes de Miguel Moraes, mas depois de Luana Lessa,  Joana Jensen e Tadeu Torres.
    member([PHelena, helena], S), PHelena < PMiguel, PHelena > PLuana, PHelena > PJoana, PHelena > PTadeu,

    print_result(S).


