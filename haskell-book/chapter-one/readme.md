# Primeiro Capítulo - Primeiros contatos com a Linguagem

Para começar a usar o compilador, digite somente `ghci` no terminal e comece a brincar com as interações que o compilador pode te proporcionar.

O comando `ghci` também pode carregar um módulo

```shell
$ ghci Teste.hs
```

## Declaração de funções

Para se declarar uma função, fazemos:

```
nomeFunc p1 p2 ... pn = operaçoes com um retorno
```

Exemplo:

```hs
maiorQue x y = x > y
```

É importante especificarmos o tipo dos parâmetros da função bem como o tipo de retorno da mesma:

```hs
maiorQue :: Int -> Int -> Bool
maiorQue x y = x > y
```

A quantidade de `->` especifica a quantidade de parâmetros da função

## Alguns conceitos

+ **Função parcial:** é toda função que pode causar algum tipo de erro em tempo de execução. Exemplo: `head`, `tail` e `last`. Esse tipo de cenário deve ser evitado ao máximo.
