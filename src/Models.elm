module Models exposing (..)


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


type alias PostId =
    Int


type Route
    = HomeRoute
    | NewPostRoute
    | PostRoute PostId
    | EditRoute PostId
    | NotFound


type alias Post =
    { id : PostId
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
