module View.KeyBoard exposing (..)

import Key
import Num
import Binary
import View.Key
import Array exposing (Array)
import Html.Styled as HtmlS exposing (div, Html)
import Css.Transitions exposing (gridGap)
import Css exposing (property)
import Html.Styled.Attributes exposing (css)
import Css exposing (width)
import Css exposing (minContent)

type alias Items = Array View.Key.Model

type Msg
    = Item Int View.Key.Msg

type alias Model =
    { items : Items
    }

type alias Updated =
    { model : Model
    , toApply : Maybe Key.Value
    }

init : Model
init = 
    { items = Array.fromList
        [ Key.Num Num.Zero
        , Key.Num Num.One
        , Key.Num Num.Two
        , Key.Num Num.Three
        , Key.Num Num.Four
        , Key.Num Num.Six
        , Key.Num Num.Seven
        , Key.Num Num.Eight
        , Key.Num Num.Nine
        , Key.Binary Binary.Add
        , Key.Binary Binary.Sub
        , Key.Binary Binary.Mul
        , Key.Binary Binary.Div
        , Key.Eval
        , Key.Back
        , Key.Clear
        ]
    }


update : Msg -> Model -> Updated
update msg model = case msg of
    Item id childMsg -> case Array.get id model.items of
        Just item -> 
            let
                updatedItem = View.Key.update childMsg item
            in 
                { model = { model | items = Array.set id updatedItem.model model.items }
                , toApply = Just item
                }
        Nothing -> { model = model, toApply = Nothing }

view : Model -> Html Msg
view model =
    let mapItem id v = HtmlS.map (Item id) (View.Key.view v)
    in div 
        [ css
            [ property "display" "inline-grid"
            , property "grid-gap" "10px"
            , property "grid-template-columns" "1fr 1fr 1fr 1fr"
            ]
        ]
        (Array.toList <| Array.indexedMap mapItem model.items)
