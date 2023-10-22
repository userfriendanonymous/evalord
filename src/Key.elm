module Key exposing (..)

import Expr
import Num
import Binary

type alias Num = Num.Value
type alias Binary = Binary.Value

type Value
    = Num Num
    | Binary Binary
    | Eval
    | Back
    | Clear

toKeyString : Value -> String
toKeyString v = case v of
    Num n -> Num.toString n
    Binary x -> Binary.toKeyString x
    Eval -> "="
    Back -> "<-"
    Clear -> "X"

apply : Value -> Expr.Value -> Expr.Value
apply key expr = case key of
    Num n -> case expr of
        Expr.Binary op x y -> Expr.Binary op x (apply key y)
        Expr.Num x -> Expr.Num (x * 10 + Num.toInt n)
    Binary op -> Expr.Binary op expr (Expr.Num 0)
    Eval -> Expr.Num (Expr.eval expr)
    Back -> case expr of
        Expr.Binary op x y -> case y of
            Expr.Num 0 -> x
            _ -> Expr.Binary op x (apply (Back) y)
        Expr.Num n -> Expr.Num (floor ((toFloat n) / 10))
    Clear -> Expr.Num 0