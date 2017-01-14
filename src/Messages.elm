module Messages exposing (..)

import Navigation


type alias PostId =
    Int


type Msg
    = ShowHome
    | ShowPost PostId
    | UrlChange Navigation.Location
