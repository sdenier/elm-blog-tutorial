module View.Header exposing (..)

import Common.HtmlUtils exposing (..)
import Html exposing (..)
import Html.Attributes exposing (class)
import Messages exposing (..)
import Routes exposing (Route(..))


view : Html Msg
view =
    header [ class "main-header" ]
        [ navLink (Routes.reverse HomeRoute) ShowHome [ text "Home" ]
        ]


navLink : Url -> Msg -> List (Html Msg) -> Html Msg
navLink =
    goLink "nav-link"
