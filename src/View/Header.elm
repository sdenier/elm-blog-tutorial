module View.Header exposing (..)

import Common.HtmlUtils exposing (..)
import Html exposing (..)
import Html.Attributes exposing (class)
import Messages exposing (..)


view : Html Msg
view =
    header [ class "main-header" ]
        [ goLink "/" ShowHome "Home"
        ]
