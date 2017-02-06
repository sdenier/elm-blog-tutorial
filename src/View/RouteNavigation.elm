module View.RouteNavigation exposing (..)

import HtmlUtils exposing (ClassName, goLink)
import Html exposing (..)
import Models exposing (Route)
import Messages exposing (..)
import Routes


goRoute : ClassName -> Route -> List (Html Msg) -> Html Msg
goRoute className route =
    let
        url =
            Routes.pathFor route
    in
        goLink className url (Navigate url)
