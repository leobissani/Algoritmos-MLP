
-- somatorio de todos os valores de uma lista
soma lst = foldr (\x -> (\y -> x + y)) 0 lst

-- dobra todos os valores de uma lista
dobra lst = map (\x -> x * 2) lst

-- concatena duas listas em apenas uma só
concatena [] list2 = list2
concatena (list1:list1t) list2 = (list1) : (concatena list2 list1t)

-- norma
-- norma lst = sqrt(foldr (\x -> (\y -> x + y)) 0 (map (\x -> x * x) lst))

-- cria um array de pares ordenados
x par1 par2 = map fst [par1,par2]

-- multiplicacao dos valores de uma lista
-- mult lst = foldr (\x->(\y->x*y)) 1 lst
-- prod_int lst1 = foldr (\x->(\y->x+y)) 0 (foldr (\x->(\y->x*y)) 1 lst1)

-- pares separa as duas listas em uma lista de pares ordenados
pares [][] = []
pares lista1 lista2 = (head lista1:[head lista2]):(pares (tail lista1)(tail lista2))
-- a fun??o mult ? a que faz o produto entre os valores dos pares
mult [] = []
mult pares = foldr (\x->(\y->x*y)) 1 (head pares):(mult (tail pares))
-- a fun??o somap que soma os valores das listas
somap lst = foldr (\x->(\y->x+y)) 0 lst

-- produto interno
prod_int lista1 lista2 = foldr (\x->(\y->x+y)) 0 (foldr (\x->(\y->x*y)) 1 (head ((head lista1:[head lista2]):(pares (tail lista1)(tail lista2)))):(mult (tail ((head lista1:[head lista2]):(pares (tail lista1)(tail lista2))))))
-- norma dos vetores
normaT lista1 lista2 = (sqrt(foldr (\x -> (\y -> x + y)) 0 (map (\x -> x * x) lista1))) * (sqrt(foldr (\x -> (\y -> x + y)) 0 (map (\x -> x * x) lista2)))
-- similaridade
similaridade lista1 lista2 = (prod_int lista1 lista2)/(normaT lista1 lista2)

-- zip junta duas listas numa s?
prod lst1 lst2 = map (\(x,y)->(x*y)) (zip lst1 lst2)

-- recurs?o como mecanismo de itera??o/repeti??o
zipN [] _ = []
zipN _ [] = []
zipN lst1 lst2 = (head lst1, head lst2):zipN(tail lst1)(tail lst2)

-- gera n?meros em x entre 1 e 10, eleva-os ao quadrado e pega apenas os impares
gera = [x^2 | x <- [1..10], mod x 2 == 1]
geraN = [x+y | x <- [1..10], y <- [1..10]]

-- gerar 10 numeros pares
geraPares = [x | x <- [1..20], mod x 2 == 0]

geraNprimeiros n = [2, 4..n] 

-- gera os n primeiros multiplos de 2
geraMul n = take 4 [x | x <- [0..n], mod x 2 == 0]

-- gera os n primeiros multiplos de 2 numa lista com n numeros 
geraPot x n = 0: take (n-1) [2^x | x <- [0..n]]

-- [0,2,4,6,8...]!!2 devolve o valor na posicao 2
par n = paresNew!!n where paresNew = 0 : map (+2) paresNew

-- sequencia: [n, n^2, (n^2)^2,..]
geraSeq x = seq!!x where seq = 0 : foldr (\x->(\y->(x^y))) 0 seq 

-- sequencia: [1, 2^2, 3^2,..]
geraNew n = take n [x^2 | x <- [1..n]]

fibonacci = 1 : 1 : zipWith (+) fibonacci (tail fibonacci)
geraFib n = take n fibonacci

-- [1,3,5,7,8,9...,m] n-?simo impar numa lista de m valores
impar n m = imparesNew!!n where imparesNew = 0 : [x | x <- [0..m], mod x 2 == 1]



