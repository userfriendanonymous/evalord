module View.Key exposing (..)

import Key
import Html.Styled.Attributes exposing (css)
import Html.Styled exposing (div, Html, text)
import Css exposing (backgroundColor, color, width, height, px, hex)
import Html.Styled.Events exposing (onClick)
import Css exposing (justifyContent)
import Css exposing (center)
import Css exposing (alignItems)
import Css exposing (displayFlex)
import Css exposing (cursor)
import Css exposing (pointer)

type Msg
    = Click

type alias Model = Key.Value

type alias Updated =
    { model : Model
    , isClicked : Bool
    }

update : Msg -> Model -> Updated
update msg model = case msg of
    Click -> { model = model, isClicked = True }

view : Model -> Html Msg
view model =
    div
        [ css
            [ backgroundColor (hex "0d0c17")
            , color (hex "ffbb00")
            , width (px 70)
            , height (px 70)
            , displayFlex
            , justifyContent center
            , alignItems center
            , cursor pointer
            ]
        , onClick Click
        ]
        [ text <| Key.toKeyString model
        ]
