pessoa('Jo�o').
pessoa('Maria').
pessoa('Ana').
pessoa('Jos�').
pessoa('Marcio').
pessoa('Leonardo').
pessoa('Daniele').
pessoa('Carla').
pessoa('Fernando').
pessoa('Marcelo').

feminino('Maria').
feminino('Ana').
feminino('Daniele').
feminino('Carla').

masculino('Jo�o').
masculino('Jos�').
masculino('Marcio').
masculino('Leonardo').
masculino('Fernando').
masculino('Marcelo').

%filho(pai, filho)
filho('Jo�o', 'Ana').
filho('Jo�o', 'Jos�').
filho('Jo�o', 'Marcio').
filho('Maria', 'Ana').
filho('Maria', 'Jos�').
filho('Maria', 'Marcio').
filho('Leonardo', 'Carla').
filho('Leonardo', 'Fernando').
filho('Daniele', 'Carla').
filho('Daniele', 'Fernando').
filho('Carla', 'Marcelo').
filho('Marcio', 'Marcelo').

%pai(Pai, Filho)
pai(P, F) :- filho(P, F), masculino(P).
%m�e(M�e, Filho)
m�e(M, F) :- filho(M, F), feminino(M).

irm�os(X, Y) :- pai(P, X), pai(P, Y), m�e(M, X), m�e(M, Y), X\=Y.
irm�o(X, Y) :- irm�os(X, Y), masculino(Y).
irm�(X, Y) :- irm�os(X, Y), feminino(Y).

meioirm�os(X, Y) :- ((pai(P, X), pai(P, Y)); (m�e(M, X), m�e(M, Y))), X\=Y.
meioirm�o(X, Y) :- meioirm�os(X, Y), masculino(Y).
meioirm�(X, Y) :- meioirm�os(X, Y), feminino(Y).

tio(T, S) :- (pai(P, S), irm�o(P, T)) ; (pai(P, S), irm�o(P, T)).
tia(T, S) :- (pai(P,S), irm�(P, T)); (m�e(M, S), irm�(M, T)).
tios(T, S) :- (pai(P, S), irm�os(P, T));(m�e(M, S), irm�os(M, T)).

gosta('Jo�o', leitura).
gosta('Maria', leitura).
gosta('Leonardo', leitura).
gosta('Jo�o', cinema).
gosta('Marcio', cinema).
gosta('Carla', cinema).
gosta('Marcio', boliche).
gosta('Carla', boliche).
gosta('Maria', boliche).
gosta('Jo�o', 'Maria').
gosta('Maria', 'Jo�o').
gosta('Maria', peixe).
gosta('Maria', vinho).
gosta('Jo�o', vinho).

av�(A, N) :- (pai(A, P), pai(P, N));(pai(A, M), m�e(M, N)).
av�(A, N) :- (m�e(A, M), m�e(M, N));(m�e(A, P), pai(P, N)).
av�s(A, N) :- av�(A, N) ; av�(A, N).

antepassados(A, X) :- pai(A, X);m�e(A, X);av�(A, X);av�(A, X).
%fatorial - recursividade
fatorial(0,1) :- !.
fatorial(N,X) :- N1 is N-1, fatorial(N1,X1), X is N*X1.

%concatenando elementos da lista
concatLst([],L2,L2) :- !.
concatLst([X|L1],L2,[X|D]) :- concatLst(L1, L2, D).



% ------------- Exercicios CATP07 ---------------------

%1) Escreve elementos de uma lista na tela
imprimeLista([]).
imprimeLista([X|Lst]) :- write(X), nl, imprimeLista(Lst).
%- imprimeLista([1,2,3]).
%1
%2
%3

%2) Devolve o ultimo elemento de uma lista
ultimoElemento([X]):- write("\nUltimo elemento: "), write(X).
ultimoElemento([H|T]):- ultimoElemento(T).
%- ultimoElemento([1,2,3]).
%Ultimo elemento: 3.

%3) Inverte uma lista
inverteLista([],L,L).
inverteLista([H|T],L,X) :- inverteLista(T,L,[H|X]).
%- inverteLista([1,2,3],Lst,[]).
%R = [3, 2, 1].

%4) Conta quantos elementos ha na lista
contaLst([],0) :- !.
contaLst([H|T],R) :- contaLst(T,R2), R is R2+1.
%- contaLst([1,2,3],Lst).
%Lst = 3.

%5) Contador de clausulas do tipo pessoa
contaClausulas(X) :-
    findall(N, pessoa(N), Ns),
    length(Ns, X).
%- contaClausulas(X).
%X = 10.

%6) Lista de pessoas que gostam de alguma coisa
lstPessoasQueGostam(G, Ls):- findall(X, gosta(G, X), Ls).
% - lstPessoasQueGostam(futebol, Ls).
% Ls = [ana, andre].

%7) Programa usando o que foi aprendido em prolog 
lstPessoasQueGostam(G, Ls):-
    findall(X, gosta(G, X), Ls).

imprimeLista([]).
imprimeLista([X|Lst])
    :- write(X), nl, imprimeLista(Lst).

escolheGosto() :-
    write('Escolha o gosto que deseja consultar:'),
    nl, read(X), lstPessoasQueGostam(X, Ls),
    write('N�mero de pessoas que gostam de '),
    write(X), write(':'), nl, imprimeLista(Ls).

% - escolheGosto().
% Escolha o gosto que deseja consultar:
% |: futebol.
% N�mero de pessoas que gostam de futebol:
% ana
% leo
