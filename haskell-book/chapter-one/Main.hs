module Main where

-- Exemplo de uso de tipagem
maiorQue :: Int -> Int -> Bool
maiorQue x y = x > y

u :: Int
u = 7

applyFilter :: Int -> Int
applyFilter x = mod x 2

-- list comprehension
-- nomeFunc lista = [ expressao(var) | var <- lista, filtros ] var é cada elemento da lista
dobroList :: [Int] -> [Int]
dobroList xs = [2 * x | x <- xs, applyFilter x == 0]

-- Alguns exercícios

-- 1 retornar verificar se o tamanho de uma lista é par
checkLenght :: [Char] -> Bool
checkLenght array = mod (length array) 2 == 0

-- 2 retorna um vetor de string em ordem inversa
reverseArrayStrings :: [[Char]] -> [[Char]]
reverseArrayStrings xs = [reverse item | item <- xs]

-- 3 Escreva uma função que receba um vetor de Strings e
-- retorne uma lista com o tamanho de cada String. As palavras de
-- tamanho par devem ser excluídas da resposta
getLength :: [[Char]] -> [Int]
getLength xs = [length item | item <- xs, mod (length item) 2 /= 0]

-- 4 Faça uma função que receba uma String e retorne True
-- se esta for um palíndromo; caso contrário, False .
isPalindromo :: [Char] -> Bool
isPalindromo string = reverse string == string

-- 5 Faça uma função que receba um inteiro e retorne uma
-- tupla, contendo: o dobro deste número na primeira coordenada, o
-- triplo na segunda, o quádruplo na terceira e o quíntuplo na quarta.
loadTupla :: Int -> (Int, Int, Int, Int)
loadTupla number = (number * 2, number * 3, number * 4, number * 5)
