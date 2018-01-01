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

## Criando tipos

Para criar um novo tipo usamos a palavra reservada `data` ou `newType`. A diferença entre as duas é a [lazy evaluation](https://wiki.haskell.org/Lazy_evaluation), presente em *data*, mas não em *newType*.

```haskell
data Dia = Segunda | Terca | Quarta | Quinta | Sexta | Sabado | Domingo
```

Podemos ler o código acima como: o tipo dia pode aceitar os valores: Segunda, ou Terça... Cada possibilidade acima para o tipo Dia é conhecido como `value constructor`. Melhores referências [aqui](https://www.schoolofhaskell.com/school/to-infinity-and-beyond/pick-of-the-week/sum-types).

Cada *value constructor* pode ter um valor específico, como exemplificado abaixo:

```haskell
data Pessoa = Fisica String Int | Juridica String
```

Como podemos ver, cada *value constructor* é uma função que pode receber ou não parâmetros. Há uma forma de nomear estes parâmetros usando o conceito de `record syntax`:

```haskell
-- sem record syntax
data Ponto = Ponto Double Double

-- com record syntax
data Ponto = Ponto {xval,yval :: Double}
```

Record syntax são interessantes porque eles provem uma forma de se ter funções que nos ajudam acessar aquele dado. Tais funções são conhecidas como funções de projeção.

Após criado, podemos usar em nossas funções:

```haskell
agenda :: Dia -> String
agenda Domingo = "TV..."
agenda Sabado = "Festa"
agenda _ = "Trabalho"
```

Você reparou que eu criei diferentes assinaturas para a função? Conheça mais um conceito: `pattern matching`.

## Patter matching

Cada função em Haskell possui uma assinatura, que são os parâmetros que eu posso passar para ela. Mas como delimitar determinados comportamentos para uma mesma função, quando passados determinados parâmetros? É para isso que serve o pattern matching.

Vamos ao exemplo da função anterior:

1. Quando eu passo um *value constructor* Domingo, ele me retorna uma string 'TV...'

2. Quando eu passo um *value constructor* Sábado, ele me retorna uma string 'Festa...'

3. E por fim, o `_` indica que qualquer valor válido passado, que não esteja constando nos *patterns* anteriores, retorna uma string 'Trabalho'.

O que é importante entender, é que se eu tivesse movido a última linha para cima, mesmo eu passando *value constructor* Sábado ou Domingo, eu obterei como resposta a string 'Trabalho'. Então a `orderm do pattern matching importa`

[Mais referências aqui](http://haskell.tailorfontela.com.br/syntax-in-functions#pattern-matching).
