module Common.HtmlUtils exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, href)
import Html.Events as Evt exposing (..)
import Json.Decode as Json


type alias Url =
    String


type alias ClassName =
    String


goLink : ClassName -> Url -> msg -> List (Html msg) -> Html msg
goLink className url msg children =
    let
        linkOptions =
            { stopPropagation = True, preventDefault = True }

        linkHandler =
            Evt.onWithOptions "click" linkOptions (Json.succeed msg)
    in
        a [ href url, linkHandler, class className ] children
