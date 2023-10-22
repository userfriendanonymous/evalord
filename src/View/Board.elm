module View.Board exposing (..)

import View.Input
import View.KeyBoard
import Html.Styled as HtmlS exposing (Html, div)
import Html.Styled.Attributes exposing (css)
import Css exposing (fontSize)
import Css exposing (px)
import Css exposing (displayFlex)
import Css exposing (flexDirection)
import Css exposing (column)
import Css.Transitions exposing (columnGap)
import Css exposing (property)
import Css exposing (backgroundColor)
import Css exposing (hex)
import Css exposing (padding)

type alias Model =
    { input : View.Input.Model
    , keyBoard : View.KeyBoard.Model
    }

type Msg
    = Input View.Input.Msg
    | KeyBoard View.KeyBoard.Msg

init : Model
init =
    { input = View.Input.init
    , keyBoard = View.KeyBoard.init
    }

update : Msg -> Model -> Model
update msg model = case msg of
    Input childMsg -> { model | input = View.Input.update childMsg model.input }
    KeyBoard childMsg -> 
        let updated = View.KeyBoard.update childMsg model.keyBoard
        in case updated.toApply of
            Just toApply -> { model | input = View.Input.applyKey toApply model.input, keyBoard = updated.model }
            Nothing -> { model | keyBoard = updated.model }

view : Model -> Html Msg
view model =
    div
        [ css
            [ fontSize (px 30)
            , displayFlex
            , flexDirection column
            , property "gap" "15px"
            , property "width" "min-content"
            , backgroundColor (hex "ffbb00")
            , padding (px 20)
            , property "user-select" "none"
            ]
        ]
        [ HtmlS.map Input <| View.Input.view model.input
        , HtmlS.map KeyBoard <| View.KeyBoard.view model.keyBoard
        ]

