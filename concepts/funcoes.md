# Funções

Haskell é uma linguagem puramente funcional, portanto, tudo nela será uma função, ou uma expressão, ou algumas vezes, uma equação.

O conceito de função em Haskell nos remete a ideia de que temos uma expressão que precisa ser avaliada, no caso pelo compilador. Portanto, `toda função em Haskell possui um tipo de retorno`. Vamos a alguns conceitos:

## Declaração de funções

Para se declarar uma função, fazemos:

```
nomeFunc p1 p2 ... pn = operaçoes com um retorno
```

Exemplo:

```haskell
maiorQue x y = x > y
```

É importante especificarmos o tipo dos parâmetros da função bem como o tipo de retorno da mesma:

```haskell
maiorQue :: Int -> Int -> Bool
maiorQue x y = x > y
```

A quantidade de `->` especifica a quantidade de parâmetros da função

## Alguns conceitos

- **Função parcial:** é toda função que pode causar algum tipo de erro em tempo de execução. Exemplo: `head`, `tail` e `last`. Esse tipo de cenário deve ser evitado ao máximo.

- **Função de definição**: delimita uma constante no código. É basicamente uma função que não recebe parâmetros.

## Currying

Haskell é inteligente para implementar currying por padrão. Mas como funciona o currying? [Este artigo explica o seu funcionamento](https://www.devpleno.com/currying/).

```haskell
isDivisible :: Int -> Int -> Bool
isDivisible x y = y `mod` x == 0

isDivisibleToThree :: Int -> Bool
isDivisibleToThree y = isDivisible 3 y

isDivisibleToFive :: Int -> Bool
isDivisibleToFive y = isDivisible 5 y

challenge1 = sum [ x | x <- [ 1..999 ], isDivisibleToThree x || isDivisibleToFive x ]
```
