# Tipos na linguagem

## O que são tipos em Haskell?

É como se colocássemos etiquetas em nosso código dizendo em qual categória aquela expressão se encaixa.

Toda função, sendo uma expressão, possui um tipo de retorno

Quando vamos ao terminal, podemos ver o tipo de uma expressão usando o `:t`. Vamos a um exemplo:

```bash
Prelude> :t (*)
(*) :: Num a => a -> a -> a
```

Reparou nesse `=>`. Então, esse cara é chamado de ***class constraint***, que é a restrição de classe que aquela função espera. No exemplo acima, a expressão multiplicar aceita dois valores do *typeclasses Num*.

## Os principais tipos:

- **Int**: inteiro com limitações de tamanho referente a arquitetura do processador em que são executados. Exemplo: computadores de 32 bits aceitam Int de tamanho máximo 2147483647 e mínimo -2147483648

- **Integer**: inteiro sem limitações

- **Float**: número de ponto flutuante com precisão simples.

- **Double**: número de ponto flutuante com o dobro de precisão.

- **Bool**: booelano, aceita *True* ou *False*

Mas e os tipos variáveis? Pois bem, existem funções que recebem diferentes tipos e podem retornar também valores de diferentes tipos. Para dizer ao compilador que aquela função tem tipo variável, usamos um caracter único em letra minúscula. Exemplo com a função head:

```hs
head :: [a] -> a
```

Funções com diferentes tipos são chamadas de **funções polimórficas**

## Typeclasses

São interfaces para os tipos na linguagem Haskell. Elas provem os comportamentos que serão utilizados pelos tipos. Os principais são:

- **Eq**: interface para tipos que podem participar de testes de igualdade. Ela engloba as funções de testes de igualdade. Todos os tipos em Haskell vem dessa interface, exceto funções. Testes de igualdade em Haskell:
  - **==**: igualdade
  - **/=**: diferença


- **Ord**: interface para tipos que possuem algum tipo de ordem. Testes de comparação em Haskell: `>, <, >= e <=`.

- **Show**: interface para comportamento de tranformar um elemento numa string. Sua função principal é *show*.

- **Read**: interface que é oposta ao comportamento da class anterior. Ela não pode ser usada como a anterior, porque o compilador precisa inferir seu tipo de retorno.

- **Enum**: interface com comportamentos para tipos que possuem uma sequência.

- **Bounded**: interface com comportamentos para tipos que possuem limites - máximo e mínimo.

- **Num**: interface para todos os tipos numéricos. Derivado desse cara, temos o **Integral** e o **Floating** que integra os números inteiros e de ponto flutuante respectivamente.
