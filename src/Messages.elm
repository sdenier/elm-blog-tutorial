module Messages exposing (..)

import Common.HtmlUtils exposing (Url)
import Http
import Models exposing (..)
import Navigation


type Msg
    = Navigate Url
    | UrlChange Navigation.Location
    | PostRetrieved (Result Http.Error Post)
    | PostsRetrieved (Result Http.Error (List Post))
