module Models exposing (..)

import Routes exposing (Route)


type alias State =
    { route : Route }


newState : Route -> State
newState route =
    { route = route }


type alias Post =
    { id : Int
    , author : String
    , title : String
    , body : String
    }
