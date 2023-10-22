module View exposing (..)

import View.Board
import Html.Styled as HtmlS exposing (div, Html, text, node)
import Css exposing (displayFlex)
import Css exposing (justifyContent)
import Css exposing (center)
import Css exposing (alignItems)
import Html.Styled.Attributes exposing (css)
import Css exposing (flexDirection)
import Css exposing (column)
import Css exposing (height)
import Css exposing (vw)
import Css exposing (backgroundColor)
import Css exposing (hex)
import Html.Styled.Attributes exposing (href)
import Html.Styled.Attributes exposing (rel)
import Css exposing (fontFamily)
import Css exposing (fontFamilies)
import Css exposing (color)
import Css exposing (boxSizing)
import Css exposing (borderBox)
import Css exposing (property)
import Css exposing (fontSize)
import Css exposing (px)
import Css exposing (fontWeight)
import Css exposing (bold)
import Css exposing (int)
import Css exposing (vh)

type Msg
    = Board View.Board.Msg

type alias Model = 
    { board : View.Board.Model
    }

init : Model
init = { board = View.Board.init }

update : Msg -> Model -> Model
update msg model = case msg of
    Board childMsg -> { model | board = View.Board.update childMsg model.board }

view : Model -> Html Msg
view model =
    div []
        [ node "link" [ href "https://fonts.googleapis.com/css2?family=Orbitron:wght@500;600;700;900&display=swap", rel "stylesheet" ] []
        , div
            [ css
                [ displayFlex
                , justifyContent center
                , alignItems center
                , flexDirection column
                , height (vh 100)
                , backgroundColor (hex "0d0c17")
                , fontFamilies [ "Orbitron" ]
                , color (hex "ffbb00")
                , property "gap" "20px"
                ]
            ]
            [ div
                [ css
                    [ fontSize (px 40)
                    , fontWeight (int 900)
                    ]
                ]
                [text "EVALORD"]
            , div [] [HtmlS.map Board (View.Board.view model.board)]
            ]
        ]