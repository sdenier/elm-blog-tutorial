module View.RouteNavigation exposing (..)

import Common.HtmlUtils exposing (ClassName, goLink)
import Html exposing (..)
import Messages exposing (..)
import Routes exposing (Route)


goRoute : ClassName -> Route -> List (Html Msg) -> Html Msg
goRoute className route =
    let
        url =
            Routes.pathFor route
    in
        goLink className
            url
            (Navigate url)
