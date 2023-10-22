module Binary exposing (..)

type Value
    = Add
    | Sub
    | Mul
    | Div

toKeyString : Value -> String
toKeyString v = case v of
    Add -> "+"
    Sub -> "-"
    Mul -> "*"
    Div -> "/"
