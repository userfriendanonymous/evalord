module Expr exposing (..)

import Binary

type alias Binary = Binary.Value

type Value
    = Num Int
    | Binary Binary Value Value


binaryF : Binary -> Int -> Int -> Int
binaryF value = case value of
    Binary.Add -> (+)
    Binary.Sub -> (-)
    Binary.Mul -> (*)
    Binary.Div -> (\x y -> round (toFloat x / toFloat y))

evalBinary : Binary -> Value -> Value -> Int
evalBinary op x y = (binaryF op) (eval x) (eval y)

eval : Value -> Int
eval value = case value of
    Num n -> n
    Binary op x y -> evalBinary op x y

toString : Value -> String
toString value = case value of
    Num n -> String.fromInt n
    Binary op x y -> toString x ++ " " ++ Binary.toKeyString op ++ " " ++ toString y
