module View.Header exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class)
import Messages exposing (Msg)
import Routes exposing (Route(..))
import View.RouteNavigation exposing (goRoute)


view : Html Msg
view =
    header [ class "main-header" ]
        [ navLink HomeRoute [ text "Home" ]
        , text "|"
        , navLink NewPostRoute [ text "Create" ]
        ]


navLink : Route -> List (Html Msg) -> Html Msg
navLink route =
    goRoute "nav-link" route
