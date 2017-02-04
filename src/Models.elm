module Models exposing (..)

import Routes exposing (Route)


type alias State =
    { route : Route
    , posts : Maybe (List Post)
    , current : Maybe Post
    }


newState : Route -> State
newState route =
    { route = route
    , posts = Nothing
    , current = Nothing
    }


type alias Post =
    { id : Int
    , author : String
    , title : String
    , body : String
    }
