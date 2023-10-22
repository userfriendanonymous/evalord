module View.Input exposing (..)

import Expr
import Html.Styled exposing (div, Html, text)
import Key
import Html.Styled.Attributes exposing (css)
import Css exposing (padding)
import Css exposing (px)
import Css exposing (display)
import Css exposing (inline)
import Css exposing (inlineBlock)
import Css exposing (backgroundColor)
import Css exposing (hex)
import Css exposing (color)

type alias Model =
    { expr : Expr.Value
    }

applyKey : Key.Value -> Model -> Model
applyKey key model = { model | expr = Key.apply key model.expr }

type Msg = Idk

init : Model
init = { expr = Expr.Num 0 }

update : Msg -> Model -> Model
update msg model = case msg of
    _ -> model

view : Model -> Html Msg
view model =
    div
        [ css
            [ padding (px 25)
            , display inlineBlock
            , backgroundColor (hex "0d0c17")
            , color (hex "ffbb00")
            ]
        ]
        [ text <| Expr.toString model.expr
        ]
        