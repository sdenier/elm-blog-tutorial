module Models exposing (..)

import Routes exposing (Route(..))


type alias State =
    { route : Route
    , posts : Maybe (List Post)
    , current : Maybe Post
    }


initialState : State
initialState =
    { route = HomeRoute
    , posts = Nothing
    , current = Nothing
    }


type alias Post =
    { id : Int
    , author : String
    , title : String
    , body : String
    }


newPost : Post
newPost =
    { id = 0
    , author = ""
    , title = ""
    , body = ""
    }
