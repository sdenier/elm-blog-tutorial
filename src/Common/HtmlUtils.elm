module Common.HtmlUtils exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, href)
import Html.Events as Evt exposing (..)
import Json.Decode as Json
import Messages exposing (Msg)


goLink : String -> Msg -> String -> Html Msg
goLink url msg linkText =
    let
        linkOptions =
            { stopPropagation = True, preventDefault = True }

        linkHandler =
            Evt.onWithOptions "click" linkOptions (Json.succeed msg)
    in
        a [ href url, linkHandler, class "nav-link" ]
            [ text linkText ]
