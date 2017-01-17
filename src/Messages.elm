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
    | PostsRetrieved (Result Http.Error (List Post))
