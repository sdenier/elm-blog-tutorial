module View.Header exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class)
import Models exposing (Route(..))
import Messages exposing (Msg)
import View.RouteNavigation exposing (goRoute)


view : Html Msg
view =
    header [ class "main-header" ]
        [ navLink HomeRoute [ text "Home" ]
        , text "|"
        , navLink NewPostRoute [ text "Create" ]
        , text "|"
        , navLink EditDraftRoute [ text "Edit Draft" ]
        ]


navLink : Route -> List (Html Msg) -> Html Msg
navLink route =
    goRoute "nav-link" route
