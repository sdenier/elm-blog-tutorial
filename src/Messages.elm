module Messages exposing (..)

import Http
import Models exposing (..)
import Navigation


type alias PostId =
    Int


type Msg
    = ShowHome
    | ShowPost PostId
    | UrlChange Navigation.Location
    | PostRetrieved (Result Http.Error Post)
    | PostsRetrieved (Result Http.Error (List Post))
