-- Exercícios

-- 1° exercicio
data Pergunta = Sim | Nao deriving Show

pergNum :: Pergunta -> Int
pergNum Nao = 0
pergNum Sim = 1

listPergs :: [ Pergunta ] -> [ Int ]
listPergs xs = [ pergNum x | x <- xs ]

and' :: [ Pergunta ] -> Bool
and' [ Sim, Sim ] = True
and' [ Nao, Sim ] = False
and' [ Sim, Nao ] = False
and' [ Nao, Nao ] = False
and' [ _ ] = False

or' :: [ Pergunta ] -> Bool
or' [ Sim, Sim ] = True
or' [ Nao, Sim ] = True
or' [ Sim, Nao ] = True
or' [ Nao, Nao ] = False
or' [ _ ] = False

not' :: Pergunta -> Bool
not' Sim = False
not' Nao = True

-- 2° exercicio
data Temperatura = Celsius | Farenheit | Kelvin deriving Show

converterCelsius :: Temperatura -> Double -> Double
converterCelsius Farenheit f = (f - 32) / 1.8
converterCelsius Kelvin k = k - 273
converterCelsius _ _ = 0.0

converterKelvin :: Temperatura -> Double -> Double
converterKelvin Celsius c = c + 273
converterKelvin Farenheit f = (((f - 32) / 9) * 5) + 273
converterKelvin _ _ = 0.0

converterFarenheit :: Temperatura -> Double -> Double
converterFarenheit Celsius c = (1.8 * c) + 32
converterFarenheit Kelvin k = (((k - 273) / 5) * 9) + 32
converterFarenheit _ _ = 0.0

-- 4° exercicio
loadVogais :: [ Char ] -> [ Char ]
loadVogais st = [ x | x <- st, x `elem` [ 'A', 'E', 'I', 'O', 'U', 'a', 'e', 'i', 'o', 'u' ] ]

-- 8° exercicio
removeInt :: [ Int ] -> [ Int ]
removeInt xs = reverse [ x | x <- xs, odd x, x >= 0, ((odd x) && (x `mod` 7 /= 0)) ]

-- 10° exercicio
revNum :: [ Char ] -> Int -> [ Char ]
revNum xs n = reverse [ x | x <- take n xs ] ++ [ x | x <- drop n xs ]

-- 11° exercicio
data Binario = Um | Zero deriving (Show)

getIntFromBin :: Binario -> Int
getIntFromBin Um   = 1
getIntFromBin Zero = 0

data Funcao = Soma2 | Multi2 | Maior | Menor deriving (Show)

aplicar :: Funcao -> Binario -> Binario -> Binario
aplicar Soma2 Zero Zero = Zero
aplicar Soma2 Zero Um   = Um
aplicar Soma2 Um Zero   = Um
aplicar Soma2 Um Um     = Zero

aplicar Maior Um Zero   = Um
aplicar Maior Zero Um   = Um

aplicar Menor Um Zero   = Zero
aplicar Menor Zero Um   = Zero

aplicar Multi2 Zero Zero = Zero
aplicar Multi2 Zero Um   = Zero
aplicar Multi2 Um Zero   = Zero
aplicar Multi2 Um Um     = Um

-- 12° exercicio
binList :: [ Binario ] -> [ Int ]
binList xs = [ getIntFromBin (aplicar Soma2 x Um) | x <- xs ]

-- 14° exercicio
data Valido = Sim' String | Nao' String deriving (Show)

isNomeValido :: String -> Valido
isNomeValido "" = Nao' "Este nome nao e valido"
isNomeValido xs = Sim' "Sim"

-- 17° exercicio
data Cripto = Mensagem String | Cifrado String | Error String deriving (Show)

encriptar :: Cripto -> Cripto
encriptar (Mensagem s) = Cifrado [ succ x | x <- s ]

decriptar :: Cripto -> Cripto
decriptar (Cifrado s) = Mensagem [ pred x | x <- s ]

-- 19° exercicio
data Cambio = Euro | Real | Dollar deriving (Show)

data Moeda = Moeda { val :: Double, cur :: Cambio } deriving (Show)

convertToReal :: Moeda -> Moeda
convertToReal (Moeda x Euro)   = (Moeda (x * 3.89) Real)
convertToReal (Moeda x Dollar) = (Moeda (x * 3.29) Real)

-- 20° exercicio
convertTodosToReal :: [ Moeda ] -> [ Moeda ]
convertTodosToReal xm = [ convertToReal x | x <- xm ]

-- 21° exercicio
getVal :: Moeda -> Double
getVal (Moeda val _) = val

maxMoeda :: [ Moeda ] -> Double
maxMoeda xm = maximum [ getVal x | x <- xm ]
