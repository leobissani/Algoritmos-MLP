pessoa('João').
pessoa('Maria').
pessoa('Ana').
pessoa('José').
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

masculino('João').
masculino('José').
masculino('Marcio').
masculino('Leonardo').
masculino('Fernando').
masculino('Marcelo').

%filho(pai, filho)
filho('João', 'Ana').
filho('João', 'José').
filho('João', 'Marcio').
filho('Maria', 'Ana').
filho('Maria', 'José').
filho('Maria', 'Marcio').
filho('Leonardo', 'Carla').
filho('Leonardo', 'Fernando').
filho('Daniele', 'Carla').
filho('Daniele', 'Fernando').
filho('Carla', 'Marcelo').
filho('Marcio', 'Marcelo').

%pai(Pai, Filho)
pai(P, F) :- filho(P, F), masculino(P).
%mãe(Mãe, Filho)
mãe(M, F) :- filho(M, F), feminino(M).

irmãos(X, Y) :- pai(P, X), pai(P, Y), mãe(M, X), mãe(M, Y), X\=Y.
irmão(X, Y) :- irmãos(X, Y), masculino(Y).
irmã(X, Y) :- irmãos(X, Y), feminino(Y).

meioirmãos(X, Y) :- ((pai(P, X), pai(P, Y)); (mãe(M, X), mãe(M, Y))), X\=Y.
meioirmão(X, Y) :- meioirmãos(X, Y), masculino(Y).
meioirmã(X, Y) :- meioirmãos(X, Y), feminino(Y).

tio(T, S) :- (pai(P, S), irmão(P, T)) ; (pai(P, S), irmão(P, T)).
tia(T, S) :- (pai(P,S), irmã(P, T)); (mãe(M, S), irmã(M, T)).
tios(T, S) :- (pai(P, S), irmãos(P, T));(mãe(M, S), irmãos(M, T)).

gosta('João', leitura).
gosta('Maria', leitura).
gosta('Leonardo', leitura).
gosta('João', cinema).
gosta('Marcio', cinema).
gosta('Carla', cinema).
gosta('Marcio', boliche).
gosta('Carla', boliche).
gosta('Maria', boliche).
gosta('João', 'Maria').
gosta('Maria', 'João').
gosta('Maria', peixe).
gosta('Maria', vinho).
gosta('João', vinho).

avô(A, N) :- (pai(A, P), pai(P, N));(pai(A, M), mãe(M, N)).
avó(A, N) :- (mãe(A, M), mãe(M, N));(mãe(A, P), pai(P, N)).
avós(A, N) :- avô(A, N) ; avó(A, N).

antepassados(A, X) :- pai(A, X);mãe(A, X);avô(A, X);avó(A, X).
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
    write('Número de pessoas que gostam de '),
    write(X), write(':'), nl, imprimeLista(Ls).

% - escolheGosto().
% Escolha o gosto que deseja consultar:
% |: futebol.
% Número de pessoas que gostam de futebol:
% ana
% leo
