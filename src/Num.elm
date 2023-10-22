module Num exposing (..)

type Value
    = Zero
    | One
    | Two
    | Three
    | Four
    | Five
    | Six
    | Seven
    | Eight
    | Nine

toInt : Value -> Int
toInt n = case n of
    Zero -> 0
    One -> 1
    Two -> 2
    Three -> 3
    Four -> 4
    Five -> 5
    Six -> 6
    Seven -> 7
    Eight -> 8
    Nine -> 9

toFloat : Value -> Float
toFloat n = Basics.toFloat (toInt n)

toString : Value -> String
toString n = String.fromInt <| toInt n
