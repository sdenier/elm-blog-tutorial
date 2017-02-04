module Requests exposing (..)

import Http
import Messages exposing (..)
import Models exposing (..)
import Json.Decode as Json
import Routes exposing (Route(..))


retrievePosts : Cmd Msg
retrievePosts =
    Http.send PostsRetrieved <| Http.get "/api/posts" decodePosts


retrievePost : PostId -> Cmd Msg
retrievePost postId =
    let
        apiPostRoute =
            apiRoute (PostRoute postId)
    in
        Http.send PostRetrieved <| Http.get apiPostRoute decodePost


apiRoute : Route -> String
apiRoute route =
    "/api" ++ (Routes.reverse route)


decodePosts : Json.Decoder (List Post)
decodePosts =
    Json.list decodePost


decodePost : Json.Decoder Post
decodePost =
    Json.map4 Post
        (Json.field "id" Json.int)
        (Json.field "author" Json.string)
        (Json.field "title" Json.string)
        (Json.field "body" Json.string)
