module Main exposing (..)

import Browser
import View
import Html.Styled exposing (toUnstyled)

main : Program () View.Model View.Msg
main = Browser.sandbox { init = View.init, update = View.update, view = View.view >> toUnstyled }
