module Messages exposing (..)

import HtmlUtils exposing (Url)
import Http
import Models exposing (..)
import Navigation


type Msg
    = Navigate Url
    | UrlChange Navigation.Location
    | PostReceived Post
    | PostRetrieved (Result Http.Error Post)
    | PostsRetrieved (Result Http.Error (List Post))
    | UpdatePostTitle String
    | UpdatePostBody String
